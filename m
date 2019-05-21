Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDE27E1A6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 10:59:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d9so5109191wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 03:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QBIqHquR5x5cUYlqVysm5g4I0Xq+2xT+jZKafymkoi0=;
	b=soNpkza1983buBYtqDhd0apMWJwSyzYtyTmjlhNLVPEKTByaKGUn26Fjh5iYSmYbup
	fQGGcOBvYyGlOjkxAyVpLQTBlaB0r+kJQtn7Man/GN+COWwutW53FYYG4gD3mHYsyhPY
	vxe4JwtSlyijMuzbADEkNT3ySXsr1p8+2EE+3wiCbZz4gltECRVAca3ISy0co+qN+H/g
	f3pkF5+7+dvsi85DYNmvkZRN2hrpvUIo2RantyD4MpPG3sI1RyHFQqRbREgeqsJs7TNu
	X5mfozjML9UZyownNILlEj0pi8LxpHZu5MWtZV7nmxeF+3Nn8JzuJu9Pz19eutkKl7Xd
	4bOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QBIqHquR5x5cUYlqVysm5g4I0Xq+2xT+jZKafymkoi0=;
	b=J9m5HM50lnOyH5JaPjlT2CcOXBAOOL2MIHB0Ty+euOT+dxjWbwmABysNQStQ12xEcJ
	JNhZJ4SnwORiueCbPkUbjoklbdQXi/WImBWr4RlzFRt2rq8OLgeKIGkRHPuwUwQyN+I2
	ObMyzdXpJHvqIKSdAkS+2dVIyT3KfsOMJcLfMnB8ix/ZgdBkm6I3kheSTUtqvo2eqPLH
	oK4uahiy84a1i3Kd8iBn2QepdsSzX6VOzU1pTWaCNybb44pg+2nqahr3wOQrgxYPTCEa
	zF07cEab9bSXQFtX+vvV2c9n3TL+sI4b7Rf3QGQiRGSdMD6YosS8lwMMgq94cYuiPyUA
	Sogg==
X-Gm-Message-State: APjAAAWuoMWPLTgoZu6LyNpPkPCaJ1fQz+m9T63JHBlfLa+hkYuNWczK
	BUahMyN1WjfV7o0uD/F2eFb4q1H1
X-Google-Smtp-Source: APXvYqxS0HCEfToeUqjDkW+NuA/8paiBS3XGge2yP31wfYS2z1DKOiyaXqzVXJRMMN1xAKTbskha1Q==
X-Received: by 2002:a5d:5743:: with SMTP id q3mr9866523wrw.92.1558436349671;
	Tue, 21 May 2019 03:59:09 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	y18sm3026628wmd.29.2019.05.21.03.59.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 May 2019 03:59:08 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2019 11:59:00 +0100
Message-Id: <20190521105900.24147-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516210956.19906-1-luca.boccassi@gmail.com>
References: <20190516210956.19906-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] python*-setuptools: add separate packages for pkg_resources module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 10:59:09 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

The pkg_resources Python module is useful by itself, for example for
automatic loading of resources shipped in a Python package.
Add separate packages for it, so that users can depend on them
individually and avoid pulling in the entire setuptools, which
include scripts to download other packages, which might not be
desired on minimal images.

Other distributions like Debian and Ubuntu already split setuptools
and pkg-resources in this way.

The setuptools packages now depend on the new pkg-resources packages,
to avoid regressions for other packages that depend on them
already.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: restrict new RDEPENDS to class-target. As advised by Alexander, bitbake
    cannot resolve native rdeps that mention package names rather than
    recipe names.

 meta/recipes-devtools/python/python-setuptools.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python-setuptools.inc b/meta/recipes-devtools/python/python-setuptools.inc
index 357aa07086..c5dcee7059 100644
--- a/meta/recipes-devtools/python/python-setuptools.inc
+++ b/meta/recipes-devtools/python/python-setuptools.inc
@@ -37,3 +37,9 @@ do_install_prepend() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES =+ "${PYTHON_PN}-pkg-resources "
+FILES_${PYTHON_PN}-pkg-resources = "${PYTHON_SITEPACKAGES_DIR}/pkg_resources/*"
+# Due to a bitbake bug, the native class cannot have a dependency on something
+# that is not a recipe name.
+RDEPENDS_${PN}_append_class-target = " ${PYTHON_PN}-pkg-resources"
-- 
2.20.1


