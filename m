Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 77C73784DF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 07:04:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x82so19571527wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=I73pkyJDXaL6DSUFacqhDR6hjz5KmC/gdvxLc+gagZE=;
	b=2E5q/99NWG2zLAGAWTQ9AE4/blGJy6K2dkW52Kw2Efqm4NHlBvxupEf6eDE6vRgzfI
	hcq8Ob1MtNwiZO0TSCWLjcxGX01mwzwbF70LgJsVt7+UZszWJxGXibM/CRvLjL1ANJpY
	Eoe/AHmVOkz/iEEJMfbSzM1eYYnL062ZQlrieD1EIW4vFt1g5XRNVY/GVV8SdxUQy0Jo
	M+F1NVTpz6+yQFX3Sfnui6AiOG44HZ7T3R3M/u21XFYyNd6aovJKexD0MKxebb+d5ava
	xQ66q/T5rdrjlG8z019iYRMD/CL6ZYkjkQk1uNwcftuHNQytNXLpe7rwgeGTtDBrP8No
	/h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I73pkyJDXaL6DSUFacqhDR6hjz5KmC/gdvxLc+gagZE=;
	b=F3LjMA1Niv+mDsWwOuhRRWAQG7MXFPrHynSUOgBpU8aOiZ2mDFGZ5EiSqNA+FYHjJV
	Q8SiunSKZ3NdT+NA3jpLVL8ldtC3yJ7WELbN/b4wkmQqz88fVkZFSAUPz3Z124BM/Uad
	N437aBNqB2E4TUTprrt7pg7dQXqLMYz1H3mNbHQSh55huvjfg//LLs+cxza2sMFW12eT
	yTa7U69iB5SRIUCd84x3jhUWRFHV6xoAlZi04Fxc5pJCxW8TboK3vNy+0m+kv+PpyaOW
	LhxTfjOYpXA3+P26dXvDpZ5G4KxUwR8djWFDEfiyPX5vQVZ9v98AruMaW6piZs9bJ8io
	W22Q==
X-Gm-Message-State: AElRT7H2+DkpE+sVaxQ7IFRgA8cg+IzBj3boyl+HTchYtwbcOZG07FuK
	XiZxV24hkrFJh72QMDUvCCc6X4A5
X-Google-Smtp-Source: AIpwx481xhm+VmgsP6qmpKQ7YsXuLFUMMZEQ2kiIoGad4eh1JacriPp9UeiBHDB27RZoooYnxYeVZw==
X-Received: by 10.80.168.227 with SMTP id k90mr5679486edc.208.1522134261766;
	Tue, 27 Mar 2018 00:04:21 -0700 (PDT)
Received: from localhost.localdomain ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id p91sm484481edp.65.2018.03.27.00.04.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Mar 2018 00:04:20 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
X-Google-Original-From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2018 09:04:16 +0200
Message-Id: <20180327070416.23578-1-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.9.5
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [PATCH] glibc-package: fix locale cleanup logic
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
X-List-Received-Date: Tue, 27 Mar 2018 07:04:21 -0000

If ${libdir} is a subdirectory of ${prefix}/lib, e.g. /usr/lib/aarch64-linux, the cleanup logic will delete libc.so.

This bit of code was added in 2012 (git show b744f4cc) to remove /usr/lib/locale, this commit makes it remove that directory recursively and afterwards remove /usr/lib, erroring out if it's non-empty.

Tested with a plain (/usr/lib), a 64-bit (/usr/lib64) and a multiarch (/usr/lib/aarch64-linux) build. I strongly suspect this whole bit of cleanup isn't needed anymore, but my testing is too limited to be certain.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 meta/recipes-core/glibc/glibc-package.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 824b185..ff45dfe 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -207,8 +207,11 @@ do_poststash_install_cleanup () {
 	rm -rf ${D}/${localedir}
 	rm -rf ${D}${datadir}/locale
 	if [ "${libdir}" != "${exec_prefix}/lib" ]; then
-		# This dir only exists to hold locales
-		rm -rf ${D}${exec_prefix}/lib
+		if [ -d ${D}${exec_prefix}/lib/locale ] ; then
+			rm -rf ${D}${exec_prefix}/lib/locale
+			# error out if directory isn't empty
+			rm -f ${D}${exec_prefix}/lib
+		fi
 	fi
 }
 addtask do_poststash_install_cleanup after do_stash_locale do_install before do_populate_sysroot do_package
-- 
2.9.5


