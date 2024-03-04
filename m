Return-Path: <pramanik.souravkumar@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FC5BC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 12:03:59 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.96581.1709553835760119996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 04:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PEkjgqZb;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: pramanik.souravkumar@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6277f72d8so355359b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 04:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709553834; x=1710158634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXt0KAioXyUmduWlYHs5lrroKaDdjCOa9lmlRoFfRnQ=;
        b=PEkjgqZbZePjmiMNKWAB6VVzu+/1zZW33XWv0z/nvOHVjgF5uO/TgiB7KFGujQUYhM
         bBTSScMFoiZFEkd17ze0YqIzPwqf+67G1f5+tCFvwuI8TYGY/N/Y8jUp2Zhz3e1JQDFy
         WWHeCEPXeP1s0eIvVL18tvn1qDJh9Tbcpqx1DtCc9lZJ+CHqI0mD9BskW24BWUSGlvXA
         ARNJtjLcBAiwxqc0PW7H3mnZFMIK5TBkODpkpX0NaagK/60HIUFjeA1V5BQrnlNd2lAc
         qBfsaBeBZjNyf7dB33GtDlhtSluMLh1tHWPThTO9WqRh203m4fvWTdbnVp0CF1nuC+SJ
         FoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709553834; x=1710158634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXt0KAioXyUmduWlYHs5lrroKaDdjCOa9lmlRoFfRnQ=;
        b=jEhe8s48jrAsSuN3Ns0mpbFsJbv7dVXai+1xcy4Cz7PwRifCGrOYWGkW8HC1VNWTZd
         e+AK2BKONKgBbyrsJloLk4tUo/OtPdsXqTN0m0efIl7zvIkiTD2kXFUw80qyxRSYJMmn
         PmzpFyhXXkgxDX8mCR1ms0kiG529CWCBsLJ3a/YL86uqrlHH71hy7ueFCOaO9UOmitmB
         mSDjXg5z8CO5k+dKpT4owDlEIfJAXfGXPeq2uF0bFPEUBLNEXWDR7UcvJkHe8ukRG+WL
         Fv+RIBMpPVQ3nxIEUwUB8VDGtoduIjKBNXRn7TAsFcL3wH2uRmtqZUAIsCHii/mQn44G
         uf/Q==
X-Gm-Message-State: AOJu0YwvavgGsCidBCz41P4fO5GeK3LViOQymnf4QB09e+I0xl0dUvyz
	mzZ8GqHnMNsGPR/BxV6DVE8a5oR+1YP3EoKA7DfjMMIpeRoW4dufMEmqUhCB
X-Google-Smtp-Source: AGHT+IGZG4gRrjbGQ9v8uKEOS7SUCLVwmfDj4/UQbnusGwga9YLRhjc6vXNotIwjNYWAq173xSwQbQ==
X-Received: by 2002:a05:6a20:bf1f:b0:1a1:4918:cdbe with SMTP id gc31-20020a056a20bf1f00b001a14918cdbemr2387139pzb.54.1709553834392;
        Mon, 04 Mar 2024 04:03:54 -0800 (PST)
Received: from LL-2887.kpit.com ([103.53.233.65])
        by smtp.gmail.com with ESMTPSA id z4-20020a626504000000b006e621fd613fsm1711570pfb.80.2024.03.04.04.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 04:03:54 -0800 (PST)
From: Sourav Pramanik <pramanik.souravkumar@gmail.com>
To: openembedded-core@lists.openembedded.org,
	pramanik.souravkumar@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] libseccomp: Add back in PTESTS_SLOW list
Date: Mon,  4 Mar 2024 17:31:53 +0530
Message-Id: <20240304120153.67234-1-pramanik.souravkumar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 12:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196595

Enable libseccomp-ptest in PTESTS_SLOW as
all tests are passing now.

Signed-off-by: Sourav Pramanik <pramanik.souravkumar@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 5c6a30635f..f39b048b21 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -88,6 +88,7 @@ PTESTS_SLOW = "\
     glib-2.0-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
+    libseccomp-ptest \
     lttng-tools-ptest \
     openssh-ptest \
     openssl-ptest \
@@ -112,7 +113,6 @@ PTESTS_PROBLEMS:append:riscv64 = " valgrind-ptest"
 #    libinput-ptest \ # Tests need an unloaded system to be reliable
 #    libpam-ptest \ # Needs pam DISTRO_FEATURE
 #    numactl-ptest \ # qemu not (yet) configured for numa; all tests are skipped
-#    libseccomp-ptest \ #  tests failed: 38; add to slow tests once addressed
 #    python3-numpy-ptest \ # requires even more RAM and (possibly) disk space; multiple failures
 
 PTESTS_PROBLEMS = "\
@@ -124,7 +124,6 @@ PTESTS_PROBLEMS = "\
     mdadm-ptest \
     libinput-ptest \
     libpam-ptest \
-    libseccomp-ptest \
     numactl-ptest \
     python3-numpy-ptest \
 "
-- 
2.25.1


