Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643C7D711D6
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 18:06:46 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.20934.1732125997565670302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 10:06:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YukxvqeF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3823eaad37aso779526f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 10:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1732125995; x=1732730795; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Md7cckP47RZmTsmqI0Jwl8iiXHyknX7b4CtB4BY6jY=;
        b=YukxvqeFX3UNAEyVoqLoKEbPTXqzOQxc0Nic4ZiHg6MaAuY1yelj0wZvXMeZgT5f//
         0zVWuQHjSQ6I7NshL2xH1x0l/se2MvyGctNVSGhvx3aSZu5LxR5ViBwEFELBgT4IgVUV
         ZFD9BTfIIyOMHV2ezXuLOnqcDWm9crUUq5vCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732125995; x=1732730795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Md7cckP47RZmTsmqI0Jwl8iiXHyknX7b4CtB4BY6jY=;
        b=C6GYhDKLZcKOnTc7gM/l60GZeWIRNOc8GR4dUE7QIXgxBA5LIoAYIE7VABUhxLKVSx
         cn2k8RHMhZLbbuFnmZLYxs1MsAlJ4PXXvfDo16YdtjK+RvuLWQG696HOE2duTR5BpPnk
         XJ3jkT9SeyqcQd73XZ+G0pG0gSTl8jadCg+wXgSfLt/c1g55CTNcSBsBvn/nOAjgG9pw
         +dUzBb1xND7t7GC/0G7h6pP6PTYE0uQtjtjo8nYx+0VvSoKaLd3Gduz4E2ANF20GJTgG
         acTUTzZZMRbJFr4WAxptLnL3W+BmO3G3QLvyk1QKnjpp1I/5TXmvfot50kLeg2i9QFib
         Q8aw==
X-Gm-Message-State: AOJu0YzYVL1zEkzxOl0QBIdsRkOXeXp51EGV1+lZsmEepyc9IivXnaXs
	H23JgRQIHDDiwi1JCDExJu5nwQZm4cfop71dFQMpC96gHV5ejCcV9gXs3lsG1zS5qUitX47KfpM
	FcWE=
X-Google-Smtp-Source: AGHT+IFrSLM2F4RodBgHAFc3vGjHP2xtfNMWGq4xlWqbtXH5TueszHTgEutT5ZmIUyU/iRhZEaRvCQ==
X-Received: by 2002:a5d:64a1:0:b0:382:2e9e:d695 with SMTP id ffacd0b85a97d-38259d257cdmr356900f8f.24.1732125995554;
        Wed, 20 Nov 2024 10:06:35 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5abf:50dd:d6fd:8415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38254933c85sm2691087f8f.65.2024.11.20.10.06.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 10:06:34 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemu/testimage: Ensure GNU tar is in test images
Date: Wed, 20 Nov 2024 18:06:31 +0000
Message-ID: <20241120180631.2437985-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120180631.2437985-1-richard.purdie@linuxfoundation.org>
References: <20241120180631.2437985-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 18:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207469

We've seen cases where a ptest (strace) has a 43GB sparse file in the test
directory. busybox tar doesn't work well with this. The resulting 1.4GB archive
takes hours to extract too.

Ensure tar is added to our full images and use the sparse option to collect
files for debugging. This stops crazy build hangs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/machine/include/qemu.inc | 3 +++
 meta/lib/oeqa/utils/postactions.py | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index bb7aec76750..d7392d47623 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -28,3 +28,6 @@ KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
 KERNEL_FEATURES:append:pn-linux-yocto-rt = " features/nfsd/nfsd-enable.scc"
 
 IMAGE_CLASSES += "qemuboot"
+
+# Use gnu tar so we can handle sparse files in testimage debug archives
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "tar"
diff --git a/meta/lib/oeqa/utils/postactions.py b/meta/lib/oeqa/utils/postactions.py
index 8f787838b9d..c69481db6cb 100644
--- a/meta/lib/oeqa/utils/postactions.py
+++ b/meta/lib/oeqa/utils/postactions.py
@@ -64,7 +64,8 @@ def list_and_fetch_failed_tests_artifacts(d, tc, artifacts_list, outputdir):
         bb.warn("Could not load artifacts list, skip artifacts retrieval")
         return
     try:
-        cmd = "tar zcf - " + " ".join(artifacts_list)
+        # We need gnu tar for sparse files, not busybox
+        cmd = "tar --sparse -zcf - " + " ".join(artifacts_list)
         (status, output) = tc.target.run(cmd, raw = True)
         if status != 0 or not output:
             raise Exception("Error while fetching compressed artifacts")

