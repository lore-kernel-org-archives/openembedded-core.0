Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id EC36E776C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 23:35:48 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so138512pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JenuuUwmmjo+M+Tvneq+yR5FQxH+EG438x9vyHun9IE=;
	b=YGA0bMZNlTmPaJeF81CK1bJdwkT12PvcAwqbGCkeraz7lDhDDBvjX5RXkSkr+LxxtA
	A14xu94ih2fzpieyHiBzgVO5i/lbDPv452/sCF1vsfcJ9LN3QpDwDLL0+D4/9yQBFoo9
	qwwjSZVY7HpLElt23zJYWvc/RbF3fRBRWT45YgZXLTESPrSEzAgjVbsPOYAe41ODWlEp
	0VfUd2/Ny3a5he0s140EX4m3YwvSJ7ix+vU0rWL9B0JUbDRthZBnrBLkkAn0+sId5nxA
	qzySKKLcPHN/+0J7bq2hGMpFswVEegdjeafdViPunpmZHp5+FCmt1SuZQpiuc+cpA6Su
	+rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JenuuUwmmjo+M+Tvneq+yR5FQxH+EG438x9vyHun9IE=;
	b=nW25e4gdxzB/x94raGAVUxQTD/FYFXHsPtcIhI/rmHmFSdOV++DgOsrvfnyUKAtCKy
	lfNHuSZF1w50SsldiF35YZrsUcvIM5UngPNte8ViPHKsWlGdGbumtHetEoio+cu77SvA
	jx4vs48p3BT85tZoFrvuMMl3j2Hhw/flCq4CD0sj/jcUWzwfLwVhfHvX0J7U1sTL/n0o
	4O6tVTkMRXLALYuixP/KG88qoayM3UUNFkubjgdeSDx7U27kO8Fjp909Lfa9nc33N2Y/
	vtmSu2wYEL6ftYGOOQmTkOPho8EJvNbKxm8WTV9Z7zgP+mzIFSyws97384rqMCxhqucE
	gA0Q==
X-Gm-Message-State: AFeK/H3A1y7PRsGqYnR+u0ek2G3Pt66zj4UXIrDlMr/ttjA7DAEcaQbHO4NXGzIM/2Ha8A==
X-Received: by 10.84.231.201 with SMTP id g9mr348794pln.91.1489534549641;
	Tue, 14 Mar 2017 16:35:49 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 73sm124094pfh.56.2017.03.14.16.35.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Mar 2017 16:35:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Mar 2017 16:35:28 -0700
Message-Id: <428e898ac4860ce25a8e0f605ae7f307c4860617.1489534345.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489534345.git.raj.khem@gmail.com>
References: <cover.1489534345.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] mesa: Contain configure search for llvm
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
X-List-Received-Date: Tue, 14 Mar 2017 23:35:51 -0000

Configure has an unbridled check for llvm and
when distro provided llvm is installed on build host it
will use that from /usr/bin to poke for llvm libs
and configs. This would result in a subtle errors
however do_qa_configure catches it as a host include/lib
contamination during configure checks

ERROR: mesa-gl-2_17.0.1-r0 do_configure: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
Rerun configure task after fixing this.

This is correct because when configure detects build host provided
llvm then it add the include/lib paths to compiler cmdline which are
looking into /usr/include and /usr/lib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 46d8d611c1..0f3dbb0397 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ inherit autotools pkgconfig pythonnative gettext distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-EXTRA_OECONF = "--enable-shared-glapi"
+EXTRA_OECONF = "--enable-shared-glapi --with-llvm-prefix=${STAGING_BINDIR_NATIVE}"
 
 PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
-- 
2.12.0


