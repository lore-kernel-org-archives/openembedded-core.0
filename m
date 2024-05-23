Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158C4C25B75
	for <webhook@archiver.kernel.org>; Thu, 23 May 2024 18:27:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.117.1716488826529080997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 May 2024 11:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E00aaW0P;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6f10092c8c7so4123614a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 11:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716488825; x=1717093625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5jGt3fQSRyJ0JqfXp1rxxX9jdvHO+EHtQEvmEMk2Eg=;
        b=E00aaW0PqJzjSSsvkWCmTSuCZlEMjlwA1prcMhBcOiR+sHNHlTEzsWCeMI97ev0N49
         IwxKqPo5AkJK8LFnN1PseCYznFb1azaGAKngz+xYr3JXxMageea2oi070TjqoYBnSDI0
         OOa0nrr+jMJBLU/wMQCg4hJ6qHUFmkWsELb9Va+/64/typQqbVaHjcvB4fiNMfuJ6D7p
         F7jliPdise/7V0SBZ1JA2Hllnq6EMJiZ8GNTM3NcDsau/WlblF/mBaMod0z6VJ/dXVbW
         KnOFSMRC8Rk9Uh7+UJNzftDM0I4/LgXA1UmbP+C2kJIn5EaBl8/c99eU9+c/J7zUcGQr
         TwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716488825; x=1717093625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5jGt3fQSRyJ0JqfXp1rxxX9jdvHO+EHtQEvmEMk2Eg=;
        b=H5yMoOwNcq33F/EOKR6+qDyVktfnbFhzq4btNQm3SitNRm201YQit86eHnOOEv+YhZ
         PLYhJOe+alqV0QsTQr+L9xuOK/1Ej+pb/WSKGCqQaweM/VFzSqfOpLqbE7V7c7c61OPF
         8YvnjNCeXYIVzb/gEJU3oquicxn6+ovHDUHU9k7POv/6sQI5OulRy0y7t/RR24T4hpnB
         RNKMsJKR6YOe55Nucrdc89J/CEXzBzMeAs6JujDATj/kvOBsNFzyAn2dMbhg29i/gFI/
         FAeJVgMJW7wSfCxVp9xXT8GkEuXj0q1kxQCNUW6hAxe065yr3N8OKpJdsixe95Co9pNV
         lz2A==
X-Gm-Message-State: AOJu0YxjYjfAVN/dAWFfBtbc/9yKWf+1H+mxnS8imVx4oJCXG6fU9ht/
	2tZyQLN0NkprGNo0RtltDgE9twxPAERWue/FFrlfdy5zk8DN+DuX9Ph+Hw==
X-Google-Smtp-Source: AGHT+IGACe8NdaRiJgVq/J3yT6L+97Tv9QhwOE1+Fw0U70WpcnN5o5LsBmpJgMci+xDUQkWd303Hsw==
X-Received: by 2002:a05:6830:1e32:b0:6f7:fd41:b60f with SMTP id 46e09a7af769-6f7fd41ddcamr3222043a34.20.1716488825133;
        Thu, 23 May 2024 11:27:05 -0700 (PDT)
Received: from localhost.localdomain ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6f0f6ff5488sm4792686a34.40.2024.05.23.11.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 11:27:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 2/2] lib: package:  Replace ":" in file names
Date: Thu, 23 May 2024 12:26:55 -0600
Message-ID: <20240523182655.2254482-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240523182655.2254482-1-JPEWhacker@gmail.com>
References: <20240523182655.2254482-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 May 2024 18:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199818

The purpose of this translation API is to make sure that the file name
can be used in a bitbake variable without adding special meaning,
therefore the ":" should also be replaced since it is the override
separator

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/package.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0fe49c00d6d..d1303f32bfd 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -202,6 +202,7 @@ TRANSLATE = (
     ("[", "@openbrace@"),
     ("]", "@closebrace@"),
     ("_", "@underscore@"),
+    (":", "@colon@"),
 )
 
 def file_translate(file):
-- 
2.43.2


