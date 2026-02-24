Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26347EEC2B5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:43:15 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24797.1771951391818178831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mk/UzLdA;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48379a42f76so44272885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771951390; x=1772556190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=75U8KEcd7yfPGHTFxV0N1/XcayV9lpwykGNYjlfDQU4=;
        b=mk/UzLdA0xCYYpsdCNfuuFlPlR6DWpZea5xt+WBkmUTQsHrM0o5CS6lirFk7sog8uR
         DuHj9XCYa7/mlgNT+v2ih4B+O4OTNcy/4yfpcFWeq52s++jQTE5KrWWfZFGE6/zaqFZs
         B6PMbVz0w8NjGtcUgvqkYuIBUe8/hQeusCB9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771951390; x=1772556190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75U8KEcd7yfPGHTFxV0N1/XcayV9lpwykGNYjlfDQU4=;
        b=I8agScT5VMHetNbB2POVQ9h8B5slCw3A94T0rqGujCEwn/JusZFzLgdrEcaU8tHXgQ
         rB8HejYz9hmeFlVmJ/+PAXz+t+g4XxY4rMlp37tsGQOjCNfADd0UFV8I7yDKdZWWcMly
         N9hvowYvtaMsySlLZLQs9KKAGMkuDBVChFLOA2VRQoUQkDoi3/AqN9ZtskpF45LaQL6Z
         z8G4f8IBnWWdvhe38HwCMOYjvqw0TW5eHGvc4gtJb2LLKYzLv0ExZ7OS4Xl8EcS+mKYC
         hOZwtQ9PO6A5CkirziR55q52u3ZE6V7zlss//Lz4IHov8RD+YtD1ayLNHqb9UXlpvoug
         /rsg==
X-Gm-Message-State: AOJu0YzROLNqchKItQcSAMQXe9Br9ZR/iHbFAxOfcjDTguXTiQ2ouBrz
	j4+Z+46CZ8majrr20eyzbbLIsICTa4g0yeTl5gJQ44DHI3JjwL0SNwyJleSYb73OAaQWMJNT4Nn
	X2jxZ
X-Gm-Gg: AZuq6aJ2raWLLq1RjcmqLRjIMRCeA/3oTXbTGFhENUCaTDRL0h6i2Nih+GE9qY5EJnV
	/jc9My1KKoBnMkUSY+ZbK7Z/TwePgKNh0MxIAIzdTvNjfI2DX6KxgssQtifIrQymkbKcx+FZKRc
	pJqBKeVOxKbjsbdGejISotg9h2Rw47M/nRSPXzy2teqzaSs6MUhZMtzSzPxt7oMZbldqDhzQch9
	IXhSfnPVcxsC46AbUCiPUyUSYkfqWL7fE7LvPZTv36hYx0uRJR2gAMdp7s8G4JZfR0wgwy8GaT2
	TcnEt9THwF/k/2W0kVjs75CvSSHiRIUXiWJ6FTOyKOvFimvFJwZIbBHGfc4Ll1NVDZwfLN9DHZQ
	nbVmHOSOrmeXMCmV7vxc0xxWV00gVe7pNfE3zNrgHSTNHowrR7uiLcFYn6jDQ0KUgQJKizmWl2m
	RBnjHlQdnj+FL31NRSKfx1JrdiSAy8lRhx5Mstshbad7wzqIc6JfEy8Te9fp710AVla5CAohYAu
	a2r3JRIlMtV1V1FJznVvV7X00489/kN6Q==
X-Received: by 2002:a05:600c:8b25:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-483a963bd2bmr215569215e9.34.1771951389961;
        Tue, 24 Feb 2026 08:43:09 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88e9c4esm37018905e9.5.2026.02.24.08.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:43:09 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Daniel Turull <daniel.turull@ericsson.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [walnascar][PATCH] cve-check: fix debug message
Date: Tue, 24 Feb 2026 17:34:29 +0100
Message-ID: <20260224163427.246880-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231891

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40157fcbd9066f261812ba665ec963b2e496aa53)
[YC: This should fix the following warnings from the metric build:
stdio: WARNING: nodejs-22.14.0-r0 do_cve_check: Passed invalid debug level 'Trying CVE entry update for CVE-2025-55130 from Unpatched to Unpatched' to bb.debug
https://autobuilder.yoctoproject.org/valkyrie/#/builders/103/builds/2835/steps/21/logs/warnings]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
While walnascar is EOL, the metrics build and the CVE tracking is more
or less the only thing we still support. This patch is part of that.

 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 555fdaad77a..1dc579c033f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -290,7 +290,7 @@ def cve_update(d, cve_data, cve, entry):
         cve_data[cve] = entry
         return
     # If we are updating, there might be change in the status
-    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
+    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
     if cve_data[cve]['abbrev-status'] == "Unknown":
         cve_data[cve] = entry
         return
@@ -301,16 +301,16 @@ def cve_update(d, cve_data, cve, entry):
         if entry['status'] == "version-in-range" and cve_data[cve]['status'] == "version-not-in-range":
             # New result from the scan, vulnerable
             cve_data[cve] = entry
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result" % cve)
             return
     if entry['abbrev-status'] == "Patched" and cve_data[cve]['abbrev-status'] == "Unpatched":
         if entry['status'] == "version-not-in-range" and cve_data[cve]['status'] == "version-in-range":
             # Range does not match the scan, but we already have a vulnerable match, ignore
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
             return
     # If we have an "Ignored", it has a priority
     if cve_data[cve]['abbrev-status'] == "Ignored":
-        bb.debug("CVE %s not updating because Ignored" % cve)
+        bb.debug(1, "CVE %s not updating because Ignored" % cve)
         return
     bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_data[cve], entry))
 

