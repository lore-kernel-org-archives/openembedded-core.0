Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F017DC43217
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.23779.1641767280524463541
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Q39tDCmj;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id a5so19408404wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N/SLRMFaMQ6BqOmL0QAEmK/DLBQ7jOu9CA8EqaZG4iY=;
        b=Q39tDCmjCx+X8U26zIYjx/LUje7rE/woxitqnIdPBD613kGrc+ERQFLwPbZ6owxPrZ
         LG1U2DKiJRaqNoLArJyg9mOaJcrDFj/Uywnrbz3MNe/zNhohnTc2Y0A5y2Ddk3oG7I25
         sMfKcM8ypuxufRPmhj3jrlCrxa13A4etYwa8fzJKMnz1HQdjMnS1ewuImlbR8ru+7dJe
         LpsS+C6nqEXoyjLPLpfWldGvsuQ/RNniTL8aklM/rEgAkpUB3FFfoDuBVb7/6CRH3pva
         8YINiDJ6rsgLts6NysMT7P1ifCQFdRzb3aWQXQX0K/U8m9Q8W/+I3j7S8v0Xgew4ik3p
         uCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N/SLRMFaMQ6BqOmL0QAEmK/DLBQ7jOu9CA8EqaZG4iY=;
        b=qLL9l+hpytOvLXa43FpTDn2cTRQInaZc/WPmkIMKRAy7dYIAbCDvCF+LMl6rUxwU17
         B/mBv3/MmnEpdBK26txMNDhxIkpH48WbyH6qQ9yQZC+Qeuwd9lGZd5tSFvIEBxK4Iz2p
         C4xFPIA6dOt77Ms41YYoIRA8MN/RfvN8OQo+jiHCZU9P6TF67GQlJOdW/SJp7StvtECI
         g1JWke+ozMFfOLNavpQc1FtziPDpqVLx6hiRJKg3TPERG5rQQXxLGFaM/Je4Ldskgwx4
         Dk+V3kyW4RCOgE7B+C3IB0x6m9GS8HTT82bfHiAm5vk6DYN2wPPcCipLy6vVB+ziYVLb
         xceQ==
X-Gm-Message-State: AOAM530vg5MJ/0dlZKBVOyO4STkhrtMm+7/OU0pwDUxjuu0IhfVA0krv
	bvy4/vKmzeqCGZQ+gRa94iV1nPokSyQ=
X-Google-Smtp-Source: 
 ABdhPJzvbyoH1+cUm0YB8wf9MA90ukZINLBlk0KuULzBlwxMmHdHvhVfbyHiOdxKYUS4DYvXvcOh5Q==
X-Received: by 2002:a5d:6784:: with SMTP id v4mr810486wru.275.1641767279156;
        Sun, 09 Jan 2022 14:27:59 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/14] parselogs: add a couple systemd false positives
Date: Sun,  9 Jan 2022 23:27:30 +0100
Message-Id: <20220109222732.2252416-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160315

New systemd has changed the phrasing when skipping things,
with unfortunate use of 'failed':

[    1.623667] systemd[1]: Journal Audit Socket was skipped because of a failed condition check (ConditionSecurity=audit).
[    1.688258] systemd[1]: Load Kernel Modules was skipped because all trigger condition checks failed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/oeqa/runtime/cases/parselogs.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/oeqa/runtime/cases/parselogs.py
index b81acdd18a..1f9365f3a8 100644
--- a/meta/lib/oeqa/runtime/cases/parselogs.py
+++ b/meta/lib/oeqa/runtime/cases/parselogs.py
@@ -62,6 +62,8 @@ common_errors = [
     "[rndr  ]: Initialization Failed",
     "[pulseaudio] authkey.c: Failed to open cookie file",
     "[pulseaudio] authkey.c: Failed to load authentication key",
+    "was skipped because of a failed condition check",
+    "was skipped because all trigger condition checks failed",
     ]
 
 video_related = [
-- 
2.20.1


