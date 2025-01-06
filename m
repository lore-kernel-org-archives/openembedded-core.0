Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F084E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 16:10:03 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.63212.1736179793822630563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jan 2025 08:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AxH4fnZd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43635796b48so87943665e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 08:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736179792; x=1736784592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EDRMU4KD5F+qFLjb15QY1G4BZrUGOQO23oCQTOBOzOQ=;
        b=AxH4fnZdXW0N3+SUOMnN86M7ph0+DgVhOj93laIwMYveGQEGkoKf+JDtK2PXITZOcx
         HgqXpSB4RtWuypV4aYAq/FIc8CMWI08J0YKsl7/9Lt95gcmV2Y/63WnGByuoCDAzAQ2I
         1IGiPUg8SUhaU9/M65Sh8FW8Sd3Jxn0wwUHk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736179792; x=1736784592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDRMU4KD5F+qFLjb15QY1G4BZrUGOQO23oCQTOBOzOQ=;
        b=aN6m4gUrpVpp5axsij3Sb9DDhHdDwqPCk//KjZlF7TrJ3t2ts4Jv4yJkS6ENNuuO8N
         F43/tiMc9kqEU5n7MA9Gzyz9c3ll3Dwkbp+k+Leil+bIIpd/s+zeVqVx0v6Bsitp2s+A
         Ol40xf/MyEBSU6JaXgA9n+2SIr4FDT6/hJUuzoTLsDcNk/HUSTZNkGH7H7ws5GbOwTYx
         z4teRJ8owq6PJZXNdlB0dMZy+mE4enh5iDZAK9vP3ozoAKH9fvlvWlqnsDd0zsCRyMYS
         6FvvVXE9ha3z2NXN3gvg/b2nUDDqE1L4ufae1QVoND5Vl9aQ2I8uGGtDrR9TRTz/5eQ0
         Nfsg==
X-Gm-Message-State: AOJu0YwnLxF+A/xjRkU5qr9/EP7wHPpMjWtc0rwH/yDap2Jv5ZcTV8SP
	6N1xfDdJpUU1wA8jxcWzmHzq096LSXXARriqBDKV9Tp/wZRomz4/G1h34Z+heSq+BwENS6C6AbF
	6dfA=
X-Gm-Gg: ASbGncvhbCMFv7Z6DQbFEB6S2oCRjDf6M/Wyxg6+HB6LjzrHDJAL4Sm5h6jYfpe+mfa
	tHgFjh2YZFcFMVhqow/r0rhr4FrOxZNfbjrS/mxi/HQFFybWXelsAT/lPhvMO7NadTr5GII+Uk9
	d9CnbBvQC8qQtP8tD9H/NZCHZAII6JVXnRetYfCeyOPtG31cDb1q8Mxlh+eJ5CX2loTcVXjlAf0
	mfBL1/0IjRKxnseg6xNcDUEHx4lTt4WrkZsEUPQO78ToK1xKJDdyXflOwkJjKqDj7DgkgxwIqtO
	KuaoSbhE4A==
X-Google-Smtp-Source: AGHT+IF36/VKAdJiQ6LTtXRXkfCmgPHgqdgB4WlcGn3a5K3DJjp14FF+tvAaYPGDBA7/sXfIapIuZg==
X-Received: by 2002:a7b:c7cd:0:b0:434:92f8:54a8 with SMTP id 5b1f17b1804b1-4365c51e2a3mr499498325e9.0.1736179791910;
        Mon, 06 Jan 2025 08:09:51 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3607:7267:e27a:36e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm600024525e9.12.2025.01.06.08.09.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 08:09:51 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] bitbake.conf: Add bash-completion-native to ASSUME_PROVIDED
Date: Mon,  6 Jan 2025 16:09:47 +0000
Message-ID: <20250106160948.803305-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
References: <20250106160948.803305-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jan 2025 16:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209430

With some native dependency handling fixes under discussion,
bash-completiion-native makes it into the dependency chain. Add this
to ASSUME_PROVIDED since we don't want to build it rather than trying
to remove all references in the native case (it comes from
glib-2.0-native).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 16e4f4429f8..8449b6bdcbe 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -205,6 +205,7 @@ DATETIME = "${DATE}${TIME}"
 # its own in staging
 ASSUME_PROVIDED = "\
     bash-native \
+    bash-completion-native \
     bzip2-native \
     chrpath-native \
     diffstat-native \

