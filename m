Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8EB1F61B8A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 11:44:22 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id m3so1758626wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 04:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x8cUE8Vl2mE99KSrk4IBOIE3EgVZUUR0xYxx+Q/7PuQ=;
	b=e+xmQeNTFZ1C9nAXtqrQmNEeqZFIKo9OF0uSGGYCAn0iuAOPOSC8nB6BBf7PyM7Qhs
	qCPIPkCaozhH0ru6HcYzgP7o7krHkIq0KeWhEFYtWGvUJn4+UlbUbnSIvOZMw2ILWMsA
	CXeKxxKkmjqC7OmtMFcoxV+e7lYjNshO6lhbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=x8cUE8Vl2mE99KSrk4IBOIE3EgVZUUR0xYxx+Q/7PuQ=;
	b=mBX5mvyiWWTG/xNFJsPxJSBDpRyRBXPu87OwJmyJ5JgfvbBczy7dhEleoH1EAv5HZj
	Vl90QMw/BZQEsGyEIR3lMT+sMDXyHwnUKxOIjNKWkCNAh7PpD3htgQNVgPGLkzggnWfU
	oPEz8oJ1AAfk0MZQSlUZmhNHn47LCa5IuDXc4nsGOGdmjLnP8F8n9GeHmXHMiXy6uYVf
	DEYcO3BScN8QvVRHAUMk9rvBa8RqztA1WnzkE5CGYUba96jlCBhCuFj905cLD+mpYxex
	JE2sGUEPPcQ07RNHUWZiY6xZSmdHrBoUHgHItZNzAY5RONw2paWi0X7s/fF8IY9aii6g
	dO0w==
X-Gm-Message-State: ANhLgQ345r6MwoipVciE1zZzzGKGXcceMyaMV8VmK+8sDBdU003Q8K+V
	arj/DIDFnG/L09Ct2QiFTp7DLMS0CPc=
X-Google-Smtp-Source: ADFU+vuHu92FpguQ253GiyGU72U0e3qKkjJbWXZDr4kUHUStO20cHm6V5fmPr0KtynDSzqTdY05H0A==
X-Received: by 2002:a05:600c:118a:: with SMTP id
	i10mr3534485wmf.142.1583927062814; 
	Wed, 11 Mar 2020 04:44:22 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z22sm3076614wmi.1.2020.03.11.04.44.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 04:44:22 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 11:44:21 +0000
Message-Id: <20200311114421.65442-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH] coreutils: Fix -dev package dependencies
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
X-List-Received-Date: Wed, 11 Mar 2020 11:44:22 -0000
Content-Transfer-Encoding: 8bit

The new ptest dependencies present some challenges, in particular libmodule-build-perl
which effectively depends on gcc. In multilib images, this results in both
libXX-gcc-symlinks and libYY-gcc-symlinks being installed which conflict. This also
makes little sense.

The easiest way to fix this is to disable the automatic -dev package dependencies
and manually specify the correct ones.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/coreutils/coreutils_8.31.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.31.bb b/meta/recipes-core/coreutils/coreutils_8.31.bb
index cba0bfe15cc..eac016319eb 100644
--- a/meta/recipes-core/coreutils/coreutils_8.31.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.31.bb
@@ -149,6 +149,10 @@ inherit ptest
 
 RDEPENDS_${PN}-ptest += "bash findutils gawk liberror-perl libmodule-build-perl make perl perl-module-file-stat python3-core sed shadow"
 
+# -dev automatic dependencies fails as we don't want libmodule-build-perl-dev, its too heavy
+RRECOMMENDS_coreutils-dev[nodeprrecs] = "1"
+RRECOMMENDS_coreutils-dev = "acl-dev attr-dev gmp-dev libcap-dev bash-dev findutils-dev gawk-dev shadow-dev"
+
 do_install_ptest () {
     install -d ${D}${PTEST_PATH}/tests
     cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests
-- 
2.25.0


