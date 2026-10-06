Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065D6CA5FED
	for <webhook@archiver.kernel.org>; Tue,  6 Oct 2026 15:46:29 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48857.1791301585705392765
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 08:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Nu6ng5DJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso2537755f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 08:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791301584; x=1791906384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xCRhsY71gjJ5dAgtOVLKWNP4MsZKd0z+wCZ+mR6CTlQ=;
        b=Nu6ng5DJw/sF/ydAIhS7SEy67VqADAqle4+n7jEN+zTMc597Z0erjqC6vQIndYXkgZ
         JG+umJ9R/wpD1Bqw4iusnvzelLnN3T0MHInCRrlRtIqxnvfPnVxIZ/hVYuzG1L2eV7VB
         KRhqMB/BXr9uVd/nc6C7VsX3fdhj/dG3Yr/9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791301584; x=1791906384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xCRhsY71gjJ5dAgtOVLKWNP4MsZKd0z+wCZ+mR6CTlQ=;
        b=O/tbKw2EORXZnWkxRMnCSHwEKXpeh84IWjTImfG+W8NhfPZiitJoN4G++J8r/SFaPK
         RPkKPA9ujvDa/Gzn1IM6SRve8zdLpHOpw41PNYJAMCwzT9CnMS2JO0UhO1s98D7V2rhQ
         T9+2yUmRdQVT2QkRRPuebuR/dmI3nugcnePAqQv9jVb3FLzjxHQX0QS0Z9WKNS4CvAq8
         4yBjTk1xh6k5JytIB6agcQwfVf+9hl6G6LD7rogqxD5WhhnqQeLlaDRyUVBjz7Nq19ps
         wK0sxoto75zPbcL3uQQPWm3i1un3kZYa6WQbCqYXzERzudZOTSKCTyYdYOPXPN3cpuOJ
         +05Q==
X-Gm-Message-State: AFq9FYIjYSYNFWMopUSTI8gZ2rrcy5pKTnXcHoejkaMEK3D49wz4A1us
	W0LZwZIT5SI6veeLGZ5RUuH9fk2MDwxgFsLUBgam3CrF1yU448V9Hz78TkF0ofMOikv05ZkIf16
	/rr3SKxs=
X-Gm-Gg: AYBFou3/9kZBA5x230ib71yE5UO25yg+PLJ+p+QOvt0J93JE5iuQ0q9Jy/VktNPG0Sm
	qx76AUAHbph9SiN39ysZ4bn0k4eSuoiUH/6gnri73yNkKmDoe/TiHKOIRX30wJ+7iQNCqYk2yEf
	axCNqeYAtaaYA3gdY2eEqkm5KNBnwnQC2rqAuusTBsxFAz210tz18FszR+kkLMTlAX8iCCY/z3A
	jaBFB0SEOrnZgA9WhNRb0fjH7a2ZqsY+sq91UnQnkXX+BoAUtAFUBPCjR5eeviXdVu6p0b73RD5
	vLr5ThvPyNAdPeX3CAA3oaUNNSURbYUU/u6HbLCrSyK+bLUQ05b62mIaOoSPz3j+NYUVD48KKfR
	G5M62pJAn0f+6fJ7WZvXSbrhGLvMAYFE5FnQcg7+DkohNVTOGEbLw8LlePyvT+lw62/y0yBYUEw
	PdW+VdOums1b9N328FcJ6Rb88o8u29xxsRNKl9WoTF2h5+FIZZZqr324LHbgXYZsT99DGA1MQhy
	bAlsrlgeTVnqL9PyI32ff6rbr7hAm6SdLikb16Q3S/bV+uWXSOW8lubF+0zkWZ0tMATr29Cc41N
	u/H6uA==
X-Received: by 2002:a05:6000:2289:b0:488:8546:d0b2 with SMTP id ffacd0b85a97d-48c48023a32mr17887276f8f.51.1791301583885;
        Tue, 06 Oct 2026 08:46:23 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3032csm257281f8f.45.2026.10.06.08.46.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 08:46:23 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 01/19] alsa-lib: patch CVE-2026-90781
Date: Tue,  6 Oct 2026 17:45:47 +0200
Message-ID: <59fdb500b23e3cb1b167935c82092bd43a535dce.1791299195.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791299195.git.yoann.congal@smile.fr>
References: <cover.1791299195.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2026 15:46:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247290

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-90781

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37d0e17fbb7848340169ba00ca8dee2567a68462)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-90781.patch        | 41 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.16.1.bb                 |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
new file mode 100644
index 00000000000..57883b81694
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
@@ -0,0 +1,41 @@
+From f84cd4ced7b36fddb8e4ee24404cf7c091d27020 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sun, 30 Aug 2026 20:20:30 +0200
+Subject: [PATCH] control: ctlparse - another fix for one-byte overrrun in
+ __snd_ctl_ascii_elem_id_parse
+
+Follows 1e27d63ef6d1dcf7d1f1a1e1eca3ea779e7de377 .
+
+Link: https://lore.kernel.org/alsa-devel/CACBQ=P2FhO3M6dkv3cWuKb6Qhs92ouV+FJ3SJZ_PVBSSdJWRAQ@mail.gmail.com/
+Reported-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-90781
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f84cd4ced7b36fddb8e4ee24404cf7c091d27020]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/control/ctlparse.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/control/ctlparse.c b/src/control/ctlparse.c
+index c40de2bd..7132210e 100644
+--- a/src/control/ctlparse.c
++++ b/src/control/ctlparse.c
+@@ -219,7 +219,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 			if (*str == '\'' || *str == '\"') {
+ 				c = *str++;
+ 				while (*str && *str != c) {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
+@@ -229,7 +229,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 					str++;
+ 			} else {
+ 				while (*str && *str != ',') {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 10332502044..685f06c7268 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
-SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
+           file://CVE-2026-90781.patch \
+           "
 SRC_URI[sha256sum] = "f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e"
 
 inherit autotools pkgconfig

