Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5925EC3DA79
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.22370.1702561570367151091
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YsYeoL4o;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso51463425e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561569; x=1703166369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZxyAw3eBngwKmEf9BauHy1LZgyKnwrRJBWZyYft3yo=;
        b=YsYeoL4or0wj7napdcuHvLqYVRveUb8FsWaOfrWm00e7uniIhCDaaYsDSjvSCXkGax
         d9zVwbfEmAA5E7EsVQ2mnez3rg99qj9kgn12hVpM6TDEXAxljRcSbql+e80M40qe3bEd
         xf7w7M4f+Pxh4snIlDBigfoo/8RVOe1KrgIEXyC1yUUTSU9uToZPYj7I1rdccjzhlAio
         Z9RxxtvtizWkt5k4PuB3dA4pWiWvU3FBNWa5bjaoTryrI8yNqFFma6lYkF1pAyYciS3l
         zTnHmP8nsy11QuVVe6HJU0xm9Ko6BMau63NKbo40EWaWNxKucSJr4DYHxo/YkzydRfim
         uvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561569; x=1703166369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZxyAw3eBngwKmEf9BauHy1LZgyKnwrRJBWZyYft3yo=;
        b=tgf7bEorDZcodKlsPgX7PhJi+oTmGfYYAwYm/1O6UF5ueG5RCbfPyXewl3QoIB3Mu5
         FQhkVaCmM8UUmGCowpsorB+j3gj/kyfd2HnHWdYYJf4i6MZKfrpRjnbE15dEvzZyoy77
         XKVksATUIQ9itXEQx/DhjyBG9ElFWeMg1Ld7nz0QhKfXNuQ/55t3hQn1Rlkfv4c+TWXj
         XF5LfnkcyjdQe7Yxxr6HH3KXKB8INzrUHuPVIL62iYwo48/hTWVv/I80/CTR6F1aAv4Z
         ZI6GVqgHzDvPeBGz9emPRmMM3ptiAikAiwaKQVIcCOENEL2TtP6GoTfGkNPCdJhpjxBM
         RAaw==
X-Gm-Message-State: AOJu0YzsCUQrdIhVx2/SmiW3HN/56jk1K0SI1Gi+tZJEOM5hB8ntq6ED
	l0E98k/kvoiYXNnbV9JNF+e1qrYMT78=
X-Google-Smtp-Source: AGHT+IGr9ciU+yeaXX9TePsHDjwEvbL4/OuyxWRFCEGI087MEUuXCVau/b4UUfoeBVg4CITkmeakog==
X-Received: by 2002:a05:600c:3ca2:b0:40c:50d5:f7a6 with SMTP id bg34-20020a05600c3ca200b0040c50d5f7a6mr2848604wmb.121.1702561568767;
        Thu, 14 Dec 2023 05:46:08 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 8/9] bitbake/runqueue: prioritize local stamps over sstate signatures in printdiff
Date: Thu, 14 Dec 2023 14:45:27 +0100
Message-Id: <20231214134528.1973602-8-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192378

Even with the reworked printdiff code, sstate which is heavily used in parallel
can throw races at the tests: if a new matching, but otherwise unrelated
sstate signature appears between writing out local stamps and listing
matching sstate files, then that signature will be deemed 'the latest'
and the actual local stamp will be discarded. This change ensures
the scenario does not happen.

It also makes use of the reworked find_siginfo(), particularly the 'sstate'
entry in returned results.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index ac5222514de..2d2b28b3c99 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1775,6 +1775,9 @@ class RunQueue:
             if match is None:
                 bb.fatal("Can't find a task we're supposed to have written out? (hash: %s tid: %s)?" % (h, tid))
             matches = {k : v for k, v in iter(matches.items()) if h not in k}
+            matches_local = {k : v for k, v in iter(matches.items()) if h not in k and not v['sstate']}
+            if matches_local:
+                matches = matches_local
             if matches:
                 latestmatch = matches[sorted(matches.keys(), key=lambda h: matches[h]['time'])[-1]]['path']
                 prevh = __find_sha256__.search(latestmatch).group(0)
-- 
2.39.2


