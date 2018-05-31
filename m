Return-Path: <nick83ola@gmail.com>
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6250B74DA0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 16:37:33 +0000 (UTC)
Received: by mail-ot0-f170.google.com with SMTP id n1-v6so25987938otf.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=QI95TVmUWwsGNM6oR2xCy0cES3XhVgDqiP/IJ+t9G1Y=;
	b=IolWiTtZpd+bANsImEClbfA/dLyzJdIHjd8tuSLZns9BOgadTTbZtMikh4T4ap3fh3
	wLRKmsTc1AIGC7ssMtAmbJN22LUx97Uir0D2n0OfNNhpHlvRZ4UvBNHGPTknMk+HAIeg
	SPUvtxbgNh5ez9Hif3zukYQQRF0t5Qy6MrrnlpmIVZ3J+P2Z+OyBHJCuNyW1Y06wv3wq
	lkXXFEnFnSxspr8jRvTYtayX8z8BdyzqfWWbgguGPjU2IpNId6CwiSmN0+BYUoRBaFzL
	pvWlLYn/bgPW9Vp0e7rjxj1oOjzpj14OwcY4T8nUwnC5AwMlWqFPet0r7OolGztx1z7a
	0r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=QI95TVmUWwsGNM6oR2xCy0cES3XhVgDqiP/IJ+t9G1Y=;
	b=Im5CBAeSCyj7aM61PYMAiLx5cosBXqV/Xj0fSVt2YwzGUiSpJd8qNRg41H0WkWT9Sd
	qnQqg4LHFIOp9egM2sTUjBefcm25tI99mX+Lgv85UgApogakPGNNOtgfr3ue/5zddLwu
	fFeqJcWb+g4/xEF4Du84sFiqF44mBQ6arxCpfSpwsXX0Uta+jbKd5+VhMGv7e/rBkhIX
	V7yHNixS69eeldeWxg0Ax9xIejZba/RuCxoCI7bU1IxvkjecUVtP4Bc1osks2n4tU22t
	2XWsuFh5kgXmeOME8tkKNLlI5NHSS/H13EE4sCnHuMxmYOt9qO9fhYhuUtJPPWTVAyq3
	ITjA==
X-Gm-Message-State: ALKqPwfaYJWMRKXEzPINcsxj0ZuynFXC7MownaLgpsAuMIwlPPg5ya5F
	i/fHMqDJfMwgA3Jop9RhPA0+b+YRgIi4HUHmJAnplA==
X-Google-Smtp-Source: ADUXVKJjjTJXM+JF2L6OSUywzySz3LGBWoyZJhYFG0MZPWYY2luxgnCH5vX7qS6f+rX1GnJ7uMPkyMNq+Cx9fH/3k18=
X-Received: by 2002:a9d:e28:: with SMTP id
	c37-v6mr5377604otc.251.1527784654015; 
	Thu, 31 May 2018 09:37:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5f8d:0:0:0:0:0 with HTTP; Thu, 31 May 2018 09:37:13
	-0700 (PDT)
From: nick83ola <nick83ola@gmail.com>
Date: Thu, 31 May 2018 17:37:13 +0100
Message-ID: <CABPh3UMKazGPu3t8FtQDkG3UYQ8_Jn4ZFC3+=42S0BGKA8eYPw@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [poky][PATCH][REPOST] systemd: resolved linked even if the option is disabled
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
X-List-Received-Date: Thu, 31 May 2018 16:37:33 -0000
Content-Type: text/plain; charset="UTF-8"

Repost this patch due to wrong formatting

------------------------------------------------------------------

systemd: resolved linked even if the option is disabled

in the do_install function in systemd recipe the condition to check
if the resolved option is selected is reversed (wrong !).
This is for example true if we compile systemd with musl instead of
glibc (every poky-image-minimal recipe).

Also no link should be created if the option is not selected
nor an ALTERNATIVE set.

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb
b/meta/recipes-core/systemd/systemd_237.bb
index 2e6558ded1..2eea6af508 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -256,14 +256,11 @@ do_install() {
     if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
         ${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed
-i -e "\$ad /run/systemd/netif/links 0755 root root -"
${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
     fi
-    if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
+    if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
'false', d)}; then
         echo 'L! ${sysconfdir}/resolv.conf - - - -
../run/systemd/resolve/resolv.conf'
>>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
         echo 'd /run/systemd/resolve 0755 root root -'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
         echo 'f /run/systemd/resolve/resolv.conf 0644 root root'
>>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
         ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv-conf.systemd
-    else
-        sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - -
- - ../run/systemd/resolve/resolv.conf%g"
${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-        ln -s ../run/systemd/resolve/resolv.conf
${D}${sysconfdir}/resolv-conf.systemd
     fi
     install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON
${D}${systemd_unitdir}/systemd-sysv-install

@@ -537,7 +534,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit

-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"

 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -563,6 +560,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"

+ALTERNATIVE_${PN} += "${@bb.utils.contains('PACKAGECONFIG',
'resolved', 'resolv-conf', '', d)}"
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
-- 
2.17.0

