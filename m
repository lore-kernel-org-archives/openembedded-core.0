Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.5760.1591340951005285799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 00:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: miraclelinux.com, ip: 209.85.215.196, mailfrom: daisuke.yamane@miraclelinux.com)
Received: by mail-pg1-f196.google.com with SMTP id d10so4735501pgn.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2020 00:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=/ou16Z4tacio9R1kQJuJRecepLPcrdypbwQIqxSIzZc=;
        b=fun4hnI/6ubRBD5lSPivEPvjdEbkC108909OI0BiYrH+rwHObwwxp5FTbMp3tXlIYW
         ePaoV9GflpYfKfHA3HBdA1HRfkAIlETmVItMI5pKv/Ntdofr5vLmKzY3LMVKOHBFhYTj
         SJgbY/lCYDQq7bGnGrSoSRtLdoHA7UV/hR7GjBjaerfZDhWUy4NyKceFyOwiodp8tvFS
         jOe5IIoAAQyeyScQDNuU+IJisMAgigyB3cHmqF1XZt6qQzPHpuSDrSrsgnAU13IUH58D
         fGQSZKit6TFArz35ObGMJ6kf6qsL00YBgDn12GQfCxC8WXiL2EYm2lfCPwWH9k2Derul
         5qCQ==
X-Gm-Message-State: AOAM531DBb3JqDfIlFSdy1A6Dyp6hmFF+Pp/5mtDLOclOuTl1qzR05Nz
	Pq7dIYZaRPinaUbFGLnETiF2b4Wz3v8=
X-Google-Smtp-Source: ABdhPJz95flbQqOX7k/Jh1MJIn4sg3pL1BEdaiyGQFd7oi0wAc9x6XqN34dKY6BGxK1LBfuPy0c/xA==
X-Received: by 2002:a65:6686:: with SMTP id b6mr8466755pgw.427.1591340950219;
        Fri, 05 Jun 2020 00:09:10 -0700 (PDT)
Return-Path: <daisuke.yamane@miraclelinux.com>
Received: from AIBox-1804.lxd (219x123x27x194.ap219.ftth.ucom.ne.jp. [219.123.27.194])
        by smtp.googlemail.com with ESMTPSA id dw3sm4347031pjb.3.2020.06.05.00.09.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 00:09:09 -0700 (PDT)
From: "daisuke.yamane@cybertrust.co.jp" <daisuke.yamane@cybertrust.co.jp>
To: openembedded-core@lists.openembedded.org
Subject: [warrior/zeus][PATCH] kernel-fitimage: introduce FIT_SIGN_ALG
Date: Fri,  5 Jun 2020 07:08:38 +0000
Message-Id: <20200605070838.6352-2-daisuke.yamane@cybertrust.co.jp>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605070838.6352-1-daisuke.yamane@cybertrust.co.jp>
References: <20200605070838.6352-1-daisuke.yamane@cybertrust.co.jp>

From: Richard Leitner <richard.leitner@skidata.com>

make fitImage configuration signature algorithm selectable with
FIT_SIGN_ALG.

(From OE-Core rev: e24b27a2b49e97cec6153f2d642d17a901b8ba12)

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index e53487ee23..ec18a3d699 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -53,6 +53,9 @@ UBOOT_MKIMAGE_DTCOPTS ??= ""
 # fitImage Hash Algo
 FIT_HASH_ALG ?= "sha256"
 
+# fitImage Signature Algo
+FIT_SIGN_ALG ?= "rsa2048"
+
 #
 # Emit the fitImage ITS header
 #
@@ -246,6 +249,7 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="${FIT_HASH_ALG}"
+	conf_sign_algo="${FIT_SIGN_ALG}"
 	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
 		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
 	fi
@@ -327,7 +331,7 @@ EOF
 
 		cat << EOF >> ${1}
                         signature@1 {
-                                algo = "${conf_csum},rsa2048";
+                                algo = "${conf_csum},${conf_sign_algo}";
                                 key-name-hint = "${conf_sign_keyname}";
 				${sign_line}
                         };
-- 
2.17.1

