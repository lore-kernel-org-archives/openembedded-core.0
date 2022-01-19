Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 381A7C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 17:54:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.151.1642614843126723656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 09:54:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KG6/HZNv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 o1-20020a1c4d01000000b0034d95625e1fso1490147wmh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 09:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA34I9fkbkrn2oSBabKwfVCwmkVeOzIF1zHvBGYXWCY=;
        b=KG6/HZNveBKZgUYARN39ELHjF8pGjFb1tT1KB+kXn+jz3fLDTKAo+AXBiebXyIDYc7
         23A3oS77pDLSKiHerk0WqYyYlBlbCexblk76PVqbDNgfQJVFsz7TCANIqQwTMybrgoWV
         KRRA1FJeWbTzxIHdw20Sdo+p6IohbWSOp8JcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zA34I9fkbkrn2oSBabKwfVCwmkVeOzIF1zHvBGYXWCY=;
        b=eZ7LC96F7HaM3dR8PfOG9wxVLhteFcHYGSCCNtheaPgTlmwMlj6hAUIC/WL97x7eGD
         OCILySwYBkfm2B6SLN7s2nTVGrEDO2/HE2ny+wJhKR/HAPgZG6uguVXLubaTky+bBJUx
         X2zCr6oIjxMqfgesWoapwWMunRICNLKjD2eLZ0dQfeho5Y9rzlrpAkx5WZlrKXeLRRS5
         ovJVzMxZYNgOCZdyaUvfLLSGTF17wEqMCtDpoQj70AGNZ6z0qF99WmpcanaqZ42IvbOp
         HfoVCaddSJhrW91KA1rQd+ka4onJwg3smQ445Cb9qYpFX1UsV0Ol3e29db5OdvACkUp/
         oDnw==
X-Gm-Message-State: AOAM531W0cET23KQSoKSJH7JrJc4Ze26up9tRMXaa0EIA9vVbamDAXRI
	GpEDnSqeXn+n277s34hMHN2tE699fImqIQ==
X-Google-Smtp-Source: 
 ABdhPJzapoLgs7EVq5FpO84xCtTpRK8mohB010U4jXij2Ph5t03UMs3eBsYKbM930xJEIw9dWXZyWg==
X-Received: by 2002:a5d:52cf:: with SMTP id
 r15mr27198980wrv.284.1642614841391;
        Wed, 19 Jan 2022 09:54:01 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4e1a:65bf:4ced:cc2d])
        by smtp.gmail.com with ESMTPSA id i8sm836027wry.45.2022.01.19.09.54.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 09:54:01 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Improve failure to obtain archive message/handling
Date: Wed, 19 Jan 2022 17:54:00 +0000
Message-Id: <20220119175400.1931422-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 17:54:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160742

The bb.fatal() case where sstate failed to find/use an archive in setcene tasks
is suboptimal. Bitbakes handling of setscene tasks will be to warn but the fatal
will turn this into an error, despite the real task being rerun.

In these failure cases other messages would usually have been printed so turn
this into a warning and raise a handled exception status so that bitbake knows
to fail the task but not print more messages.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 49d54bc94a7..b45da4fb231 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -795,7 +795,9 @@ def sstate_setscene(d):
     shared_state = sstate_state_fromvars(d)
     accelerate = sstate_installpkg(shared_state, d)
     if not accelerate:
-        bb.fatal("No suitable staging package found")
+        msg = "No sstate archive obtainable, will run full task instead."
+        bb.warn(msg)
+        raise bb.BBHandledException(msg)
 
 python sstate_task_prefunc () {
     shared_state = sstate_state_fromvars(d)
-- 
2.32.0


