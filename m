Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id C2ADC62132
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 21:30:21 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id g2so9577106pge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Mar 2017 13:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=JenuuUwmmjo+M+Tvneq+yR5FQxH+EG438x9vyHun9IE=;
	b=KIv4cBzYXVL/EpAub+qedr46BNPW/NXs//Li06qs8jesfYAo+lRGRxZI4s4MyycMgo
	IMjBnxRVbEeq+kkUAo+kGo8OI2yfLHJZ+Z1iB1WneiKkPIJmx9HOHOAaKgGF18B2sKP5
	zAusbNr/K510p8dOrXSk5DYJxESLjpZgyz5K+GulW7+0Sf5hG6YmadxJAFsNWzgEKQXk
	DswqCRm+kNdXTeq/dxjRdgiFHczAgMuR0GSlVvdL7rHeV433HroHlwVfKISrdhyOjpoE
	qR8iSWwsgS4+2hRKweIVwN1R02ArmXKHhhC6766FXkXqud7sv89B2GvRqo7hFQ+vcLaP
	natg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=JenuuUwmmjo+M+Tvneq+yR5FQxH+EG438x9vyHun9IE=;
	b=sqiWMxgxZKgOrNwBQqmWWcupSsFBoUwPFYZ4fnfcO/6zfQ02fDFjN4HR3HfbsyiCLy
	D8fsiZcoL/RyhUZ5YX3qW53DS+x7bvLYvg8Xj+Ss0Uc3kg7EMosnzn+5ZquPKZn7aNcS
	S+XfXVo70yHMNvO/jQjAcNYOVrz6Hfem7rhfd7lRYZAE+OllCpwYDGBEcGT3pKkeSHDN
	FuivnuSjp5NSFUy1KiQLDZcjpzzSk7LbKPHIdPzLDaso2Y/txzNhnoXtqwNrf7duaOgI
	3nICuGtaMYikUd3+5Edts75SKeauZx0VqR3Q3yfyz5U27ZgpR+k7ybhEI3UkDuYa4WFa
	U8DQ==
X-Gm-Message-State: AMke39nT/lWW/Bkh9czZT4xeu+l4dSODagQocPbqJ/hFV5nxb0tCz93kme76+N1o5zZrUQ==
X-Received: by 10.99.107.73 with SMTP id g70mr28291266pgc.129.1489267822783;
	Sat, 11 Mar 2017 13:30:22 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	129sm25784465pgj.59.2017.03.11.13.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Mar 2017 13:30:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Mar 2017 13:30:14 -0800
Message-Id: <e3c8939d68bc276610f6cf79751146d0cba70b77.1489267743.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1489267743.git.raj.khem@gmail.com>
References: <cover.1489267743.git.raj.khem@gmail.com>
Subject: [PATCH 1/1] mesa: Contain configure search for llvm
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
X-List-Received-Date: Sat, 11 Mar 2017 21:30:21 -0000

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


