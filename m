Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D59FC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 13:40:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.9685.1634218853248636199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:40:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aUV3l3fN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id r18so19664981wrg.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 06:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UWumbLXIGW3fngAaj5nhZt5a/n45X8J63t11r9IeGI=;
        b=aUV3l3fNxDepcArRDRRPibO7E9aBJfJTPq+GRLANMF/+e0rKQmPeLB1zeZAhkBcUFv
         hXg1ECBjK+3yhiNVfocGmO7b2xQZ/5O21fpkfeiKSwEZIdy0LaJPFKE82SqKKcPjoQ1z
         qVEOCho7JRjzX2b9OFuFG43l/v/T9bsEcdn1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UWumbLXIGW3fngAaj5nhZt5a/n45X8J63t11r9IeGI=;
        b=NQuOGXqiGLj6WIiCFDjL2GRn79zinnQXLv/XZZokqNxvVZWVrPyPwy/viBNPBOtBvw
         s/ErR50sPjCIQIyPXkFB2CgZMdv06S+kvZK1WxemFurNRdHZYBurVekc8D7CeQvWrF+y
         jt3JHk5YVrjahC3OvAzlKmIBFLfHxdBUEHABHKiL8Lb8o+zp7ndRNFKDXuSiH8uibEuf
         IXvp+WIrKwmoP9x02cR591BOhQVr69kAKdDtGlWH//5wdMKyfW1Ys3oluQc4twZ8CLZf
         XaDGxyXD5VAx1QA6CgqPmawxA1KNCIdhFxkXHQ+deWNtctc6xtFbOof//F8Moys0fOxa
         KamA==
X-Gm-Message-State: AOAM530D5MUU6bluu0ZrwYk52OtFnpRZf0vIHXCKwGCMHSmBkzleVDfy
	5ZUwlQ+Sw/+1BCxSmKe7Wuz3+3LaJN4=
X-Google-Smtp-Source: 
 ABdhPJxnMvQ3H7JSiuYDxWEJHUbojfNeKFB1D8KA9D2lwhADuKnLE5M1EPOCzCj4zrLNH2oW3qX5IA==
X-Received: by 2002:a1c:29c2:: with SMTP id
 p185mr19447576wmp.43.1634218850783;
        Thu, 14 Oct 2021 06:40:50 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:eb5c:837c:62b1:b238])
        by smtp.gmail.com with ESMTPSA id
 k22sm2422676wrd.59.2021.10.14.06.40.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 06:40:50 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v2] kernel: Add KERNEL_DEBUG_TIMESTAMPS variable
Date: Thu, 14 Oct 2021 14:40:48 +0100
Message-Id: <20211014134049.2917058-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 13:40:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156955

Change the "binary reproducibility" configuration within the kernel to
work off a separate variable, defaulting to reproducible builds.

This allows kernel developers wanting timestamps in their images to enable
it easily and clearly without changing the rest of the reproduciblity
code which they likely don't need to change anyway.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/kernel.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 4acec1877e0..c1cea177b62 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -322,9 +322,11 @@ python do_devshell:prepend () {
 
 addtask bundle_initramfs after do_install before do_deploy
 
+KERNEL_DEBUG_TIMESTAMPS ??= "0"
+
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
+	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
 		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
@@ -364,7 +366,7 @@ kernel_do_compile() {
 
 do_compile_kernelmodules() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
+	if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "0" ]; then
 		# kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
 		# be set....
 		if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
-- 
2.32.0


