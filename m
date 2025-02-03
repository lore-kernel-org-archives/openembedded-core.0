Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C63CC0219B
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.92304.1738600916793813473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:41:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=d/bHImYN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso48013225e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600915; x=1739205715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1J1AM+D9ITYjg5CPfQVDu8x9DDXv2ajN8rp7aTA992I=;
        b=d/bHImYNrSdYZkJfJsbOc1fIYHy1BIJiCj6WYajh1MMQeoE/hzUT7yNwPsTE5qw0SZ
         EWVxQnYzHoadz3bW1TXjIBIg2jjts+AFSMaKcQhT6HiXuYw0+WcpGVzpjiivB4EoxKUc
         GsjB5L2BsQ4gw2oWm9VdjCKEMtIGNemdlXeqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600915; x=1739205715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1J1AM+D9ITYjg5CPfQVDu8x9DDXv2ajN8rp7aTA992I=;
        b=c5oCDgJZ37vq7XWeJ/oZUJkj/bVwoAlSuok/7GfufABVCqBIBFXSBlenHNm3Nqsh+p
         tbiAndwOtRzl/wy0/ioQlA4kvEMAGCX8b8uiNQVEA+wL6nZqpngGKSAkbON7ii+ubKdF
         afRx6p6WXFjI6YBTD/QRqkOuT0ZnWuJk/jAANSxUVQXbL4tyD8fMAKHXhTR00GnnyEYP
         TNxHz+5EkmY9n4e9T44JHlEgXVx6+cuqanjXgnjH3KU6IxbSXUTG0YhPjK6k+jknkgxb
         kUbHlTWCUbGDamhpiyEtY6cRPmPkJ/iV0c+pTRkMUkZ/njZ5kmzcgoFfwvUTDFiVm5Yr
         zjmg==
X-Gm-Message-State: AOJu0YwyTKlbiTf+sqmhoprcU0u+HmA+WSLnxN0bqC6lLZKx4Qs14d/o
	26Zc+Tzllw9R4W6iBKSoz++1eOU9kC6ACqLky4fo7U7Pql8/fqTsK61Ro6m+HJXanheO82RPKq+
	c
X-Gm-Gg: ASbGncttIV+JNGqchZ6dfYqsJNZWq5FJlZIR7l6S9LkJyAMA6BMUCJ8+Y9GcQEKyihj
	i2cKw3qqJ7OCcYnv806ahVkvSlB6cqJu9PXKItFD3G1oIOGu1Kr+4w8mtJJDzAXkwjPNaCQFKmI
	KuA9KDmIWA/kYC+XNa2fpn1vkaq90GOJ9fDIyYWOSNeUIIwRdvCgO5wxqESmEGKvI8NmbpfYZcw
	+bxT1CruBVfbxe1PZM4ZpQczFi5QaxLkYWq4/y1eKeYPv1lLt/Cnh9hMkzLZShxfUhIQ18m1yzE
	pnHeF7KVXZtnd+02IYgZxsIj4xIp4TAfpAgku/hJAV9W
X-Google-Smtp-Source: AGHT+IEDAdqV/NKKq5mcLbNoQyKCS6NgvHfTVc7soTUCZpOWozw6/kceXI/K/JLoZhal+CGkqjYt4A==
X-Received: by 2002:a05:600c:468c:b0:434:a815:2b57 with SMTP id 5b1f17b1804b1-438dc40d759mr176677535e9.20.1738600914747;
        Mon, 03 Feb 2025 08:41:54 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.41.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:41:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/46] mmc-utils: upgrade to latest revision
Date: Mon,  3 Feb 2025 16:41:07 +0000
Message-ID: <20250203164130.3403325-23-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210696

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 7bf21a1fe22..9f9cc967c0d 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "523d8f3cfb219d800f45860892e742e3a355f1bb"
+SRCREV = "67b9be6429d7b01e9e6057ead013e7049e34b273"
 
 PV = "0.1+git"
 

