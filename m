Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C8BC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:59:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.56095.1749463177767398612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFEMyghz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a375e72473so1986662f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749463176; x=1750067976; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pkH1XSB4h2RpUKR4pDQRf5i5KhpV6rTWtiUrF4KzLmY=;
        b=ZFEMyghzpAR7MsACtHtcavzF5Sz1WPiLDMduHFGKuibhGzoQPN/vv6qpK0Yc7E08ME
         K8XBrvjHNgMCnO2B1HQ7a9/v8kDCE+zh8QmVmrvmlvUYcizPrTmQCW95jcP0vUrLHTDm
         3CwHMMi6gxzZ9h7XOC2a6yKLGYTfUz6+sb77E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749463176; x=1750067976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkH1XSB4h2RpUKR4pDQRf5i5KhpV6rTWtiUrF4KzLmY=;
        b=c1JVK8X/1t8CkrxKuQdwro/uEVOEvgdQiAKngmUhSPn/xnkft7dlDFkNiH6XbtvNzk
         3lJxzxkQ+ti6zolJrD5h4tTQa2yGtLQ0aUPDKNB3NhxpMmLH8INsKgmAsk7f5MFBV9/o
         rr3svP6r0wQ2LwyPlo97MPV3o4Yod6hkuVQWvmL9eAkrQdc4wWWuVm6yff4oYG25ynSZ
         r5V+uqeHfkDSqEE2dB27wLEDYJ5C3LrWLRVUh2coyttdnGCZpEI/6gX30F3M96xOR3h2
         4Es2GCGInG0V0mFkDuT8BOdn40aGSRQDEYKAfN05QMr70NgMVLBSREF6i4GNVyuLiEW3
         c7PA==
X-Gm-Message-State: AOJu0YxRL2809/h+GFKkdHBJ0ckui34nqyROSk2tQPLFJQQOXR423M2f
	YtAxgAnf18MRAv1F0BPuG128w18/6a3TWqAL+bJsOWLUOj8Ct6n5PG/MHXy4J6ua1Xy+OeZfdfE
	YCjnPTgo=
X-Gm-Gg: ASbGncvXqt4iFxIA0Crd2nxNacICYzyj5w0vo3cGMR2PbSuzJ4IhGnUasXJNJBMHT8/
	YFAgAOfWBkN/BtEsybnJIeQz6283GjAjv+IdDzVEpOMeepY1BRxqjZFz4dx+GXGGopnY7Wf+SaK
	L4219YwkhEhQLf34ofvpRoVDmU8M92Ix+DMtXE3tSc6uuuzJCRGvBEYBn2SZGJ4nGq0+aOahIzj
	fm+lGATw6Na8LUN8TOenzPDM45dXG2qEn/eQnrwAfOpEd7O+j+zMQGmHjQLiUEpBHT6BOL795WT
	4SGM3/96q2ipBgCgxoJipieNK41lMQSl/AX7novGud9dXn/AKFPV37Fee5UA3zYTV58DkpG1t1V
	PET/y
X-Google-Smtp-Source: AGHT+IHo3JhozQ7F2xqXAE3rY1etes+JoVS0i3oCDJwTfVve1VjzZFtcFhHW64HwjeW1v7RWeGkMYQ==
X-Received: by 2002:a05:6000:2504:b0:3a5:2653:7322 with SMTP id ffacd0b85a97d-3a53188a710mr10401520f8f.3.1749463175753;
        Mon, 09 Jun 2025 02:59:35 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45209bc6d6dsm106289785e9.3.2025.06.09.02.59.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:59:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] base: Add deferred class event handler
Date: Mon,  9 Jun 2025 10:59:30 +0100
Message-ID: <20250609095934.937987-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218256

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
index 8215969c7bb..a9b0fdd1f10 100644
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
+        if "native" in e.inherits:
+            d.setVar('CLASSOVERRIDE', 'class-native')
+        elif "nativesdk" in e.inherits:
+            d.setVar('CLASSOVERRIDE', 'class-nativesdk')
+        return
+
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))

