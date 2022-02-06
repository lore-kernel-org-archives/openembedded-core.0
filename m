Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4BE9C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:27 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web12.14510.1644184406771566141
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQVwAx3e;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id cf2so9910478edb.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q+I5ag18iHbvWbfvNQ5PusJTiYQjnA6CksmInx42pjY=;
        b=aQVwAx3eHjSwjRH97NxAqAedIi41pI421RPbnkU3bPKIHQmlIiLao25s27XK7nax8T
         wCC/wyLBz5+eAuNpJtqNjotJjlZ99z4Jo+mphE26GDWIOLR9GuoivzVPRWcpcYHPKfbT
         JGuy9cE0/dDlRPCckb4As0M+iMnCpvm5gxpgoF+tiiW0oltKIsN8TlNGV32+UJiU7ME2
         FMxtD4iyVKgIgtf9PIFiSXaLndt49BtX5c/zwsuq3HB8cPZ+GeF0Ln8eacrP8TGiT3bS
         QAm3PKsFZpPzy8pBSlJN+poPjLMWvFF9g/0XlJOS0ci/T4UbQZ+bz/rRyr1VBdun3bt8
         iHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q+I5ag18iHbvWbfvNQ5PusJTiYQjnA6CksmInx42pjY=;
        b=KwPngL3EQyQquCEEf0N5qykatdLtwxD1WjVGS/foLAT7YOOGWLd9v2NnCJ5kwxkhpZ
         0sSTtS1FwlxMCUudJl7kTw+cxHrh06cU8+6ohUFNnfUbYmlP+rBDvRnDbUnGqE848JTT
         rrYQWa4xsH3ha/K3sYw70h8IZSIIIV1FaqnP/9lOFp/rmJmjP9aifxQYI3QRcvV6gBQW
         Nbse0vdzkxg+Gj17/I9q2Pd/Br68VNPwBHQX0j/eBAMsBGT7xdmbtQWTaMwzb4OJJdqb
         k4UuFwV4z0eQ0Lzm3YepOl4KZVyrSQNS6+ExBU+bxvPTIwdrAHpCdHpkfa3dSDqGZWuX
         N0jQ==
X-Gm-Message-State: AOAM530ZFScSqY8Ek4DmsCQRo71HH2wtmliI7UeQP9ixg7l5d4nGsq3i
	TUGH789zXed3BcvcLEwuAgmYN2QrjJs=
X-Google-Smtp-Source: 
 ABdhPJz+FJbP3f0As/oQpmFaAzRozHINt9o79sayF1E4neE1h0nOIRhCJwwpsEMrN0YjrmtD+bibJw==
X-Received: by 2002:a50:e603:: with SMTP id y3mr8243173edm.270.1644184405344;
        Sun, 06 Feb 2022 13:53:25 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:24 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/8] sstate: additional debugging when fetch fails occur
Date: Sun,  6 Feb 2022 22:53:16 +0100
Message-Id: <20220206215316.367469-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220206215316.367469-1-alex@linutronix.de>
References: <20220206215316.367469-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161420

Autobuilder has been showing things like:
Checking sstate mirror object availability...ERROR: SState: cannot test file://universal/d9/bc/sstate:xz-native:x86_64-linux:5.2.5:r0:x86_64:8:d9bced04b194d5fc8d778eb8a0d674fa7375a42c8c50a9237e6d7672e9e7a00c_deploy_source_date_epoch.tar.zst: TimeoutError('timed out')
ERROR: SState: cannot test file://37/a0/sstate:libgcc-initial:core2-64-poky-linux:11.2.0:r0:core2-64:8:37a0a5aec105a0822df098f15ff2b67d0e7220204742b5d2b1f7958dda6fa5ce_deploy_source_date_epoch.tar.zst: TimeoutError('timed out')
ERROR: SState: cannot test file://universal/11/a4/sstate:libpciaccess-native:x86_64-linux:0.16:r0:x86_64:8:11a4d6c3a2e147ef7dd5f31c0ff2a91271dad49b561d8aa24849115081cf1842_deploy_source_date_epoch.tar.zst: TimeoutError('timed out')
done.

which is not helpful. To find out what really happened and where, the original
traceback is needed too.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 85d0ee2e6a..475ce40c6b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1000,9 +1000,9 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 found.add(tid)
                 missed.remove(tid)
             except bb.fetch2.FetchError as e:
-                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)" % (srcuri, repr(e)))
+                bb.debug(2, "SState: Unsuccessful fetch test for %s (%s)\n%s" % (srcuri, repr(e), e.__traceback__))
             except Exception as e:
-                bb.error("SState: cannot test %s: %s" % (srcuri, repr(e)))
+                bb.error("SState: cannot test %s: %s\n%s" % (srcuri, repr(e), e.__traceback__))
 
             if progress:
                 bb.event.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsize()), d)
-- 
2.20.1


