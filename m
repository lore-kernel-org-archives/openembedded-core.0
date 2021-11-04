Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC22C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:13:58 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.2337.1636053236892681634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:13:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ofX7QN/N;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id y196so5328317wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBrJX0Ml+HkXTePV16l5qtLYLEigGnwVQk/yn/boUhk=;
        b=ofX7QN/NvFUdrbM2BYJLJGKjNFAVUYpmOXJXqKm4jFkNNus03KUfH88Dh6kn1b/tg/
         FI1Aa+GT/xluYQbS+d49JeRWXLemaltoJWXVPjVgTxrjtAN1117xJ+u2cuvVRYvJK3NN
         JxzU2QQ0Hgk1/AE+rwpQguNtMXzJfVCxhv8wTTC6tUIppwrDldYTkR2c+EP09UcflSN1
         gSGSy3zc5e36dLigKHz4LLXDHf2Z0eIXTVoshorUf52MbDdC800tTBUMvulI5EZ/BuYW
         3sJHl0IKtLJqMMBtebYAwNRxY21n6Dcoun/sQ3a5Q8ZbYCJwtFI/eayiuGGc7hqOtsrz
         6imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SBrJX0Ml+HkXTePV16l5qtLYLEigGnwVQk/yn/boUhk=;
        b=jM81Ww9VttbAN6mA+tCVgFJE5R16Oik3LmPGZMDCjiaM/sTKL1AI7/PR1bWykoBNMi
         xDTxbqRx5I98bQnXh3tBYuLBk3uFeTI8NEzDlJVs4c7MMeFU7A9lPkWkYedVhlfjA5Zy
         pa3+qzU44fxII8yJ/44oLyNOhBDETv+f/EyCRB4/cS+RiIbp4wqi2SfUCj/tVUQS6M4y
         BVcNr11kASaVKkWvzWP4hs+/09VoRHFm2/9YtyoplbJbK7gf7ZxrlXdt1JslrFstC25E
         ptf95HTQMfLwu1FMkKNKUfAAxcNkzrzI3EBI7mNxtKeY8GsO2mq5aorhviweOYV4Gt+e
         zilg==
X-Gm-Message-State: AOAM5334Kc0DrJCcduVLrn5tPMFBJOtRjowX1pysIXbiWUGNIjk+5hD5
	ryFoVRjKb18fALRNpqiD+nTsoyi/BWI=
X-Google-Smtp-Source: 
 ABdhPJzqDFDcL55tABD9qwLnl6ktDCfvJF9NCgWFFbgL9x2gZlBHNyMouQpIrpoD91Qswi6kfISfjQ==
X-Received: by 2002:a05:600c:2252:: with SMTP id
 a18mr26591452wmm.133.1636053235022;
        Thu, 04 Nov 2021 12:13:55 -0700 (PDT)
Received: from CTW-01195.. ([88.157.222.244])
        by smtp.gmail.com with ESMTPSA id
 q1sm5618162wmj.20.2021.11.04.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:13:54 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2] sstate: another fix for touching files inside pseudo
Date: Thu,  4 Nov 2021 19:12:23 +0000
Message-Id: <20211104191222.85277-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:13:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157858

This patch is a fixup for 676757f "sstate: fix touching files inside pseudo"

running the 'id' command inside the sstate_unpack_package
function shows that this funcion run inside the pseudo:

 uid=0(root) gid=0(root) groups=0(root)

The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
will always return true and the touch can fail when the real user
don't have permission or in readonly filesystem.

As the documentation refers:
- the file test operator "-w" check if the file has write permission
(for the user running the test).
- the file test operator "-O" check if you are owner of file

We can avoid this test running the touch and mask any return errors
that we have.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---

V2: match the original code

 meta/classes/sstate.bbclass | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 8182010047..849723d4dc 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -900,12 +900,12 @@ sstate_unpack_package () {
 	fi
 
 	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
-	# update .siginfo atime on local/NFS mirror
-	[ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] && [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
-	# Use "! -w ||" to return true for read only files
-	[ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
-	[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig
-	[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo
+	# update .siginfo atime on local/NFS mirror if it is a symbolic link
+	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
+	# update each symbolic link instead of any referenced file
+	touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig 2>/dev/null || true
+	[ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo 2>/dev/null || true
 }
 
 BB_HASHCHECK_FUNCTION = "sstate_checkhashes"
-- 
2.33.1


