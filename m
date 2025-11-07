Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4143DCCFA1B
	for <webhook@archiver.kernel.org>; Fri,  7 Nov 2025 07:08:28 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6161.1762499303835577748
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 23:08:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WWl6caqv;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso345219b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 23:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762499303; x=1763104103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EZfqzFrQBBGRi5EnyHlC1FAOTA3zBSk1x6i7amGzmFU=;
        b=WWl6caqvjJKfLBfhO4fR4sWZD1z9kaMbdFAssUxJNZAULQ6Qqx6IaTa/gLG++TFJz/
         xwV6kbIy3g5D0k3WjgRvoCNDvNV/Wb8OuTQt7z5OPjgJCoZ8zAMRHU0THtdsE+5rr/hZ
         H0oBE6cbne/xlMNTlgkiz4DxS5awHcJqZCb2Nheb5jZ+YcTt+tEMcYHAqwOeeeeAaURW
         KtJjoDVoTCCgK5VhPxyZGGM/Pdx4rdMQfh+/3MktqpSFmbjUgKgzcu3Uq0LW7ljKZjSo
         xuB49TDZkG2ZPvPeYTikDJX6PG2InZa5f2zRJRcWqXKjSXOfZmLzFZyA/OoadLegCvKc
         +jrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499303; x=1763104103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EZfqzFrQBBGRi5EnyHlC1FAOTA3zBSk1x6i7amGzmFU=;
        b=UyFi6YzqPjh4hqpDmnXHKmJ0e9UK4iCNnCharcx4RMBOv0JDkh1qaQqy1KHmecKT2q
         7kTrbKi2uSUGg9kgK25imMt4HVX8nV0GciXoTc6c5LSBEaIbQ9gTOS5Npwdf7Z9BuPBd
         YNOAbo93zaGX8Wi+cvkSYKU3rN4I/HieyPHxsJdlI9xl4L+h7ppwRSONB7AZRpctw9BS
         8+9aLOtpbEU3LdXCHOFid7z5M0VdFTmkjmq3y8PJTye6RmVTGx2gVIUAXnMV4VskRyz2
         g0Se65gCl9sOo+BVfNIbUiBoK8S2bPRBdJ/yAaavYm8v2JgNjN4RzBaLXRF+TycnPTvu
         6FSg==
X-Gm-Message-State: AOJu0Yz0CJEKDuIxgAQ7tLP+uzjzcRYGGFYibGCspKMXGs2kd4Quj+wi
	jkV0GX4TdQZUnkj5eFltq1p/Xjxi6eo5eO5fyxA7nTzXGbcJkumyiNkYqwD1/pSWnt0=
X-Gm-Gg: ASbGncv8V00av1pXQ13X26ZY8jceDLatTdGu5MN/5tirc5VUwANalZYmZIPId9MM7tC
	RavXMCMOU/VjxqY0iQ4aWIgfxZBYpfI3+w8TkJrzu8WfvCEest40dFnzx9VX+jT8wMSoOtPjAkk
	QwkEZL8NZBskl8JOmxmWrrx2ziUuRR4qZDoqN3dvjsNTrAlZe93APD2Iyo5Iedi2aNWq/s20ckg
	F3wKPEVOxduAT6CVeiRAvklpdmTg63B2Q5InSTLVSn1MbUhHO+jb33nU8wh+lEMzjocEx8J4wGC
	zE13Yd4/AjhLHYv2rlvtY6FS8Vx2+nDdlBzBqUirZw9I5z0ZXZz6WlXOPP2MEfwu0GD3oiPLMGC
	WEAVOBdyAWwa4KRw/p3J5RhcRSZKXW87blb/hEBTMNdOVhbAmRqMLMij5bbmLNufjGHWPB8ACX3
	eTf2NN64kxNl6psJ6Zfp/Gtn7k4aWZpJ6wW7EHMPDfjmZh9u48X2JkbaJOKCDly3ix65TjHw8aQ
	On5+RzE5nc=
X-Google-Smtp-Source: AGHT+IHzlXwggDLLQvAmuM0cxE5gYo2kr+1Ewtky7TwyvSsBA11RQ2O0LXOkyb08aYQ/1/s3ZH+D9Q==
X-Received: by 2002:a17:903:15cf:b0:294:f745:fe7f with SMTP id d9443c01a7336-297c043a37cmr29407885ad.38.1762499302896;
        Thu, 06 Nov 2025 23:08:22 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a67e2f82sm8561625a91.0.2025.11.06.23.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 23:08:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/5] python3-pdm: upgrade 2.25.9 -> 2.26.1
Date: Thu,  6 Nov 2025 23:08:16 -0800
Message-ID: <20251107070819.3751599-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251107070819.3751599-1-raj.khem@gmail.com>
References: <20251107070819.3751599-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Nov 2025 07:08:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226009

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.25.9.bb => python3-pdm_2.26.1.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-pdm_2.25.9.bb
rename to meta/recipes-devtools/python/python3-pdm_2.26.1.bb
index 6938edb82f4..bd25f141f09 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.25.9.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.26.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "fb5fcd561986db1d83255d01e97e2e16f80debf743934d891a62ff2933ccc80c"
+SRC_URI[sha256sum] = "60a568201424a7193b661f6fed6e446e39695b52edc5e0904ba0b07fcaf2e787"
 
 inherit pypi python_pdm
 

