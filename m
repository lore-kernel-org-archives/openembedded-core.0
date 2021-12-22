Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C2E3C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 23:20:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.26541.1640215237869272548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 15:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S18LhJq4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id t18so7814276wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 15:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf43qYWrO8cdReNCD8XG5uiOMUfHHa2SGKm1n84TVw0=;
        b=S18LhJq4FmAwXx+6/DXTdIg/BiSDrPcm0ogNgjByH9evl309Bk5xcE1K6mdRMHiVVX
         5GkyDBsnlsPFsHAPEPn1DYOM3iFiJTHg3hdNyihdxzo7uSeVppCTyR0HbzIC9VYhAAEa
         N/UaYAlkZFfLMdSaCagzyk75FO+an+h86FAm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yf43qYWrO8cdReNCD8XG5uiOMUfHHa2SGKm1n84TVw0=;
        b=o7rk6wnra+QodZUJigIfl1ryiCAuH4rg9ZgmqN+qCxKf/cWeYU52b6NT8gGhXhVTuN
         yBb0H2D3WfgWrYEu35tDz7t4vMkk0I65oDTF2YJ7JLCAC8uARr7FX8AA5i5k1yE1akTX
         rVVDH/X2fIeuItCqTo65blaKCvOtXpDY0WiBiO8v6a0So70xIW0BBurRSz5xNJFRD8kI
         a83HEm1IbQpDK5WOuPjEQZ9v6rYEo2JSBdIoczqjQ6gGJVfJk7YlsI1soYVs55+VJXpv
         mSvnepjUhOgav2CeKYICgJW3L2IIcHRmAFqI+Ts80IWIoQCahdvsx37iSY1+e47izcen
         Ms3g==
X-Gm-Message-State: AOAM533tmIwrrqMnrDsrfM5bN1z6hL2aWKStCj+MkXUHPLVmDrMLPm/L
	JqknO591EQi+SGm/fmFB3N7l9rusHaV6QQ==
X-Google-Smtp-Source: 
 ABdhPJxq9GMre0ybc6NQIBGG7EQyMqx8CUlfJvLCP0b87V1JBRBNjrFZ2XdckOgh7Z/FXOU92IYo5Q==
X-Received: by 2002:a05:6000:124a:: with SMTP id
 j10mr3349193wrx.110.1640215236285;
        Wed, 22 Dec 2021 15:20:36 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1853:9343:6af4:2b3f])
        by smtp.gmail.com with ESMTPSA id
 r11sm3061965wrw.5.2021.12.22.15.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 15:20:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
Date: Wed, 22 Dec 2021 23:20:35 +0000
Message-Id: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 23:20:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159965

Use the newly added nonetwork task flag to disable network access where
possible in unpack/patch/configure/compile/install tasks.

We can't disable networking in sstate tasks due to sstate downloads and
also so we can report hash equivalence to the server.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass  | 4 ++++
 meta/classes/patch.bbclass | 1 +
 2 files changed, 5 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b709777f243..e4c6c983b59 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
     oe.reproducible.epochfile_write(source_date_epoch, d.getVar('SDE_FILE'), d)
 }
 do_unpack[postfuncs] += "create_source_date_epoch_stamp"
+do_unpack[nonetwork] = "1"
 
 def get_source_date_epoch_value(d):
     return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
@@ -358,6 +359,7 @@ base_do_configure() {
 		echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
 	fi
 }
+do_configure[nonetwork] = "1"
 
 addtask compile after do_configure
 do_compile[dirs] = "${B}"
@@ -368,11 +370,13 @@ base_do_compile() {
 		bbnote "nothing to compile"
 	fi
 }
+do_compile[nonetwork] = "1"
 
 addtask install after do_compile
 do_install[dirs] = "${B}"
 # Remove and re-create ${D} so that is it guaranteed to be empty
 do_install[cleandirs] = "${D}"
+do_install[nonetwork] = "1"
 
 base_do_install() {
 	:
diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 8de70254919..57aaf7c31d1 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] = "PATCHRESOLVE"
 
 addtask patch after do_unpack
 do_patch[dirs] = "${WORKDIR}"
+do_patch[nonetwork] = "1"
 do_patch[depends] = "${PATCHDEPENDENCY}"
 
 EXPORT_FUNCTIONS do_patch
-- 
2.32.0


