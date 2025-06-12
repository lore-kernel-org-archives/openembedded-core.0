Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4144CC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:00:05 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13685.1749736799724006701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 07:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NjjUBssH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a5123c1533so696859f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749736797; x=1750341597; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9EaqlSmq+vnm9BxtzSrnK+T7+GZbt1tShBv+mPbcfBg=;
        b=NjjUBssHLhPhPzJrp+PQ+cSw4U1Q+5kx6X/0eof04Bvj+JJHvoHNPd09foK1RxVbkK
         5kNRCkVoGTYf67IrnZbtluFIndTT+ty1uJ4JSvXhMQuN6JzckUT2GqcWGTH2AwSjMwMX
         EbbXhvJYF+FZX5cDKiZRRC+wU3n38PPwmRNNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749736797; x=1750341597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EaqlSmq+vnm9BxtzSrnK+T7+GZbt1tShBv+mPbcfBg=;
        b=gkhs54lFx3w7tH+1qGByIrCIyouKY1ql1hc4tPNWJ/4E9fJbaVTsCVLOQ1giRoL6C+
         vfRlQ8uJd2WFnO9Ox5SKaOzyLfeduhWEW16sYQMLWq4lhEYmFjTh63+ZF8SuD2IigJeT
         5IPwBtkizH6KgMi/ZESbj2YzPiN7ATB/88oIMRzwZ9MIMMXVkSi2ezV1Njo3LTAuW9fl
         c2iooIyP0yAtewtzIJkP0tw3coJAyxYYxnTFQr22XM3h/1cH9TFnzxMdxJ3mwoU8JkTm
         vzDUMUCONJimm2Q/DHpAVCQ1qDJ8rHr7GGCcSfAAGRD8TTB5Sa1s/D5lni6HX1073ZML
         vtBQ==
X-Gm-Message-State: AOJu0YyL6XWqXepSNDtyTo3hPspthBQvFLhjZyQBmpO1K39J4cnOM5JY
	vQLXpCDarmGEUT9dgdqfU6EFEGSkpeI8lWAGf4loYxWjUIJ+8WalA4lyqIkPqkMOXm74lVYOXbW
	KT0Wa2tQ=
X-Gm-Gg: ASbGncvdg9Qgd1WQVOtvEMhUwyUzGYpLS5oMxIe44zoZzMKeF2UWvV96wkfN4NPEqbq
	JupPE76TndkPqAgHvdncrCadWHutITdFCLv6NOcrRUNAcO08srQJLVsAvYCdrU6oPYHw1l2aQp9
	FmkXXFYTIQCHaazIoDrEPhtY9tQtfrV0WDJTU99zcgcK1hdrl1lkUGBUd0ZafvQZ953IztvOM0L
	u4bpN5gTYdWMhJNT+HoabNfk79EMvEGRr8UuxgjHAVJmDxiVFGwqLCZf2N44PgBCnXgNbZKITOE
	Pqo+5QQ1FyurkA3aR+5/QTyi6WNV4lrx/r4gtgdufKEtxNwxa7mhFxvjfxUqAP4laBzMRi3nOxh
	LekBbNmtG7c50Mhc=
X-Google-Smtp-Source: AGHT+IG5fnlzp1l2kKRWKnzlpJ3Xfa76pYooR/IJ5BeDmyjxVNYzgMPfI9zJ6ya91x07h3jZ5DUdqA==
X-Received: by 2002:a05:6000:3108:b0:3a5:2182:bce2 with SMTP id ffacd0b85a97d-3a5606b5088mr2861918f8f.17.1749736797434;
        Thu, 12 Jun 2025 06:59:57 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9e93:4c2d:3b22:8e08])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2089474f8f.4.2025.06.12.06.59.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:59:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] base: Add deferred class event handler
Date: Thu, 12 Jun 2025 14:59:51 +0100
Message-ID: <20250612135955.1413300-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 14:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218521

Use the new deferred class event to set the class overrides earlier.
This improves interaction of the override with PACKAGECONFIG values
that control conditional inherits (such as python support).

This also allows toolchain configuration in an easier and more user
friendly way.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/base.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index 8215969c7bb..4ac3b83eb5c 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -267,10 +267,19 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed bb.event.RecipePreDeferredInherits"
 python base_eventhandler() {
     import bb.runqueue
 
+    if isinstance(e, bb.event.RecipePreDeferredInherits):
+        # Use this to snoop on class extensions and set these up before the deferred inherits
+        # are processed which allows overrides on conditional variables.
+        for c in ['native', 'nativesdk', 'crosssdk', 'cross']:
+            if c in e.inherits:
+                d.setVar('CLASSOVERRIDE', 'class-' + c)
+                break
+        return
+
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))

