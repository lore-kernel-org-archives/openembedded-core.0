Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC729C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.26421.1643278816577302707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GAJudsoe;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id r7so1518900wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Zo/jZE1hhAoAZ+ZWG37LRTQ1bGKSWAGtMBId/cT1Yqo=;
        b=GAJudsoeRNDH3hJ3w/Re+YJKpQ03ayIMyxeTZW/GZ+eVDaWb98eOKSR9FLORON1MSH
         7EZhrNVm5OnInoE9Gtj7Vc4qmlEzklP746iwzXioLJ+ecTAJpROOqPbG1ZC9DW8oSBxB
         T6LqAa3h6WmXBmJiGKeJnIwmcjAdcrVDRco0aNiu6xU3vsoPHwpRGF6iTi10iCpQeJzE
         LaDipZemCodkLGFsAFbddrj45xGAaod/VBzebp7Maxczt9ql5wf4sfEWLeF9MvmeXd6E
         CwTGkuEsnGDx6ouJcWfFPcIgV6p1c7zYnzQNHsLk4jMf6XS8M2Fr0CT9VIU3XBw9Ck8r
         OYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Zo/jZE1hhAoAZ+ZWG37LRTQ1bGKSWAGtMBId/cT1Yqo=;
        b=pEzS8eg+pPNsSMHpJPJ3vuccKTM3K5TgRtk9lLZFQ8kG1KVLWPLG0f2qizwxEeBYwI
         PqUVa+BizQxu8z99dcOnqyuEK1rGj2ADnifFgJ3MNtcD2u8eER9DLls2RTSluaDv5QXd
         6DVv6DEw4q8wLHERFGSpOntBUc58aHiWko7EGwhrGYG98EMtl29PzDNmJWty4V8C+ic5
         1oAxl+QPZro00g8KiiV72GExCsQ2uSPxLjHJl+qaOBLeD3N8cRFxMM8XDenlH5S/L7nK
         uR1+7oVCO/sg0ooSu1SABaoRfX0kWVm8bxYSCD3lLP+CkcqFIK6SNkFrcjbe5Ot143j+
         a9rw==
X-Gm-Message-State: AOAM533GZAfVT3e1D+iUUdySPsq+pWWghUXQBwjoOu5g0MCzRVP/QZZZ
	Kz2noJwJDrx6dLEAHx06dfYVSzb8QqY=
X-Google-Smtp-Source: 
 ABdhPJxoYxrRwRtnhy1Cq/nXHNu7l+HmaJJhBtPt8EKOMlShG7ueilhLiw6LIJ0RiqQdw+CBNGi9uA==
X-Received: by 2002:a1c:cc07:: with SMTP id h7mr11397721wmb.50.1643278815149;
        Thu, 27 Jan 2022 02:20:15 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:14 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/17] ifupdown: upgrade 0.8.36 -> 0.8.37
Date: Thu, 27 Jan 2022 11:19:51 +0100
Message-Id: <20220127102005.3050843-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161025

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ifupdown/{ifupdown_0.8.36.bb => ifupdown_0.8.37.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ifupdown/{ifupdown_0.8.36.bb => ifupdown_0.8.37.bb} (97%)

diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
similarity index 97%
rename from meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
rename to meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
index 48a7b8fb13..1b980abe06 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.37.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://salsa.debian.org/debian/ifupdown.git;protocol=https;branch=mast
            file://0001-ifupdown-skip-wrong-test-case.patch \
            ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://tweak-ptest-script.patch', '', d)} \
            "
-SRCREV = "c73226073e2b13970ca613b20a13b9c0253bf9da"
+SRCREV = "2b4138f36ce3ba37186aa01b502273e0c39ab518"
 
 S = "${WORKDIR}/git"
 
-- 
2.20.1


