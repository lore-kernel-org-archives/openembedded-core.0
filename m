Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C4FC46CA3
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.22352.1702561570813518065
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=asxWUoIc;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40c3ceded81so52913425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561569; x=1703166369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+gM/aU97fLDxQi6vxpdZkgP5dImybBSIlpvW130m/o=;
        b=asxWUoIcOei4+sDIgR1gWW7R776rWc0dGLg+Xb1H2UTPCBVBGQwMOQ59P7UUzhIqzt
         Nyw+N1+hYoGl2I2oR4JYnhMzNRXybnoZxXwjEhzeT63xHvDxy/D8vxXq7iCXZl66ciyE
         m5IKUDChmwwaoCi867ZlUS3MjYanXSbYhFzgGi/Qvu+YCsr30135xiogg3UfCg08qGFk
         X88O4HQshevmsALn/MGcgDk8jMuov6yFh8JObSWB1DbfgD1M1343CRNmaLRTQr0pO0C7
         R6bmubxX7PJK6qn/KWlK0rtBEbTYosI5wlQBJoRqWW9ntM1tx68PWGccmeVItLijPIG4
         letg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561569; x=1703166369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+gM/aU97fLDxQi6vxpdZkgP5dImybBSIlpvW130m/o=;
        b=ULrqJQcWy78Eh9sMUeoE4/n4GMDJdkxRSE9j1cCv4SB4wuBj9m3IBFRScFGqZIxsmn
         AbXeufFwtpN3MRpBlnxE6MiVOzuvNvcPi2DTTSEK3cd1pNHB8xLuxa68ZPaDR2jJH87G
         D6AJPvGOdpCbLUd740gT5LC4ArUWZVflupsz3knLd53LYaMVW2FFXcoHrzPgyX54HDP8
         Q/GDt9bj4wvp2gptHZWT5XdKzYaKfVVZPPmMJNHHTNFjTyCQcTtmUJpmj67Cs3VkY0Q+
         Kx9/u3/FwtVt9ub9RAtdB7FDF2HI8A/zIN41vJdssyTXsY3lV5GSmV0kM/1zKjv8I6TR
         kEQA==
X-Gm-Message-State: AOJu0YwuSmBgs8m2aDppYNAV5F7rCWLazT0i6yB6DBtRog6hz6q+P5Sh
	JTOQ8xR/4SmIJmN2YWe/I7R/MWMOq+c=
X-Google-Smtp-Source: AGHT+IHpANTshGz1sdsXhZZwd7gbaurdQ5GBpAdZTlTG2L+kBYXVHcKiJyhwtfJvyqr44+X+UlGZHQ==
X-Received: by 2002:a7b:cc86:0:b0:40b:5e21:ec24 with SMTP id p6-20020a7bcc86000000b0040b5e21ec24mr5352821wma.86.1702561569233;
        Thu, 14 Dec 2023 05:46:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 9/9] bitbake/runqueue: add debugging for find_siginfo() calls
Date: Thu, 14 Dec 2023 14:45:28 +0100
Message-Id: <20231214134528.1973602-9-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192379

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 2d2b28b3c99..bb75e81c557 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1751,7 +1751,9 @@ class RunQueue:
         # Define recursion callback
         def recursecb(key, hash1, hash2):
             hashes = [hash1, hash2]
+            bb.debug(1, "Recursively looking for recipe {} hashes {}".format(key, hashes))
             hashfiles = bb.siggen.find_siginfo(key, None, hashes, self.cfgData)
+            bb.debug(1, "Found hashfiles:\n{}".format(hashfiles))
 
             recout = []
             if len(hashfiles) == 2:
@@ -1767,7 +1769,9 @@ class RunQueue:
             (mc, fn, taskname, taskfn) = split_tid_mcfn(tid)
             pn = self.rqdata.dataCaches[mc].pkg_fn[taskfn]
             h = self.rqdata.runtaskentries[tid].unihash
+            bb.debug(1, "Looking for recipe {} task {}".format(pn, taskname))
             matches = bb.siggen.find_siginfo(pn, taskname, [], self.cooker.databuilder.mcdata[mc])
+            bb.debug(1, "Found hashfiles:\n{}".format(matches))
             match = None
             for m in matches.values():
                 if h in m['path']:
-- 
2.39.2


