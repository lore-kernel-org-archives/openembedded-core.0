Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C69C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 17:34:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.316.1678988085708067625
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 10:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R/pL4o4R;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id r18so2271938wrx.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678988084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=olkjof5mKL6nFuvJun9TxlCQuxQIMwhAlHxJjKqqfHM=;
        b=R/pL4o4RVFlKzMY/i+l9WNwxBG4+ij/oqeqn77pn/bgfivA7mm7MS4jr7yv9q/4XjK
         v7eq3FZDDd64yz2Nuc5h18DHsN3MZr2jq3GE9JRN4EY9eBzUxF2+w+e8T5A5EKMgOXlx
         1l34nuWDetulgQP0GCajaU5xIC59hrK7qLkns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678988084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olkjof5mKL6nFuvJun9TxlCQuxQIMwhAlHxJjKqqfHM=;
        b=y63LDUduV7wIQRIqqluvdXkhIOF+XX6k2GSnigXj/k68N8W/vVSTlGV4DMrEiN/j3Y
         gB4hP0nyQ1qxgjeADwCnXNxWZsG/kR1ckqeh2tU17WWWlWcrVsO3dF+HRCtIbu3Tp61H
         yDWv3YmiUIu9QzP97w2XoIPUHf0TONt0G5pt74C0B/5ZUAkMUl/1y0s3guyvexuBZbpy
         HZCMWQ5gfhpzJRteE4MF80pV4zYyXE/H0R5aLVGVHOwtf2X7BhPQV3IY5E4AGKUEMZmY
         /Q/83jKbQdRKXqBim2i5Ms/rhuR8gtB2j2bj/ZWjZEY34wsHe5D5Tcd1XVXaT3KadiAr
         DYGg==
X-Gm-Message-State: AO0yUKWrKHDbgX/HnQTxj+CeN2eVxrKPA7reXp78KimDmRCrWAgb0nGa
	vCC+YZgiFYU74wJQi7rfUzimSVzLAIuEmh29j4E=
X-Google-Smtp-Source: AK7set8HRa78i7Ug5nSfOItyM7kkmCM2JuXH/M191JxxrjdIhasWw6m5Po5+IV/RCTI1+TRpslm7Ww==
X-Received: by 2002:adf:e74c:0:b0:2ce:a0c1:bcaa with SMTP id c12-20020adfe74c000000b002cea0c1bcaamr182321wrn.9.1678988083786;
        Thu, 16 Mar 2023 10:34:43 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id z9-20020adfd0c9000000b002c6e8af1037sm7701490wrh.104.2023.03.16.10.34.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 10:34:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: Fix reproducibility issue
Date: Thu, 16 Mar 2023 17:34:42 +0000
Message-Id: <20230316173442.200636-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 17:34:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178710

Fix an issue introduced in the new openssl version where an assembler file
isn't generated in a reproducible way by seeding the perl random number
generator consistently. It has no crypto impact, it is just used to
avoid function name clashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../openssl/openssl/fix_random_labels.patch   | 22 +++++++++++++++++++
 .../openssl/openssl_3.1.0.bb                  |  1 +
 2 files changed, 23 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
new file mode 100644
index 00000000000..78dcd816854
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
@@ -0,0 +1,22 @@
+The perl script adds random suffixes to the local function names to ensure
+it doesn't clash with other parts of openssl. Set the random number seed
+to something predictable so the assembler files are generated consistently
+and our own reproducible builds tests pass.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
+===================================================================
+--- openssl-3.1.0.orig/crypto/modes/asm/aes-gcm-avx512.pl
++++ openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
+@@ -191,6 +191,9 @@ my $CTX_OFFSET_HTable    = (16 * 6);
+ # ;;; Helper functions
+ # ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+ 
++# Ensure the local labels are reproduicble
++srand(10000);
++
+ # ; Generates "random" local labels
+ sub random_string() {
+   my @chars  = ('a' .. 'z', 'A' .. 'Z', '0' .. '9', '_');
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
index 4ae376d18ae..85286a06180 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://fix_random_labels.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.38.1


