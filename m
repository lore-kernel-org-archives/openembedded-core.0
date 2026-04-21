Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1261AF89259
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 10:42:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21815.1776767329845319155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 03:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UMxpxQx8;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891cd41959so20985485e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 03:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776767328; x=1777372128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5e7o0n6ua8FAzfhNIMXDSkcg8Zi+Te8/DU8Lc+VBNs=;
        b=UMxpxQx8i9x4shw8v5CxOSOizOezltOW4m/9foHxvL96b26yGinMZorzpedIE3oIoR
         M/uTMmh8ADdaw25LrlYXBqKcWCMruQvPavu5Ay1tZhqPE4JLqrS6HrtA0UpIkpfPNaUB
         EAbQBnmvCN9MqEbofvuh0lqR9Rq23bl7U8679lCz2wIAdn8eQ1f75H7L/BniTD0XkN8q
         M5JFA2cML5zDjd57ImRsHgQ4ViVPC0yXWtqsUrbqj78R4TqFrNJafvYkrhxauqLJj7OP
         3/AVAj4FJ3jNIJ4d2aNEWJ5IpSqMGwnFsuV2XlXIL0KCJcNlZ3ws0cWQXUioGJzDEhtD
         NVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776767328; x=1777372128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p5e7o0n6ua8FAzfhNIMXDSkcg8Zi+Te8/DU8Lc+VBNs=;
        b=nlLAg9uzohsJqHsBYI2Q0ShPnMfp95ZUkNykXNvQ8khflnfrlxXBSvs8HF71axBn34
         09kMrvZbLNMU4dyTSRbh88ZCz7akuHIAUJj/hiKXbmERdzRroLAxmIKQi4IQfVqzMYb6
         YyzLpYhbsw4EGdnp+hvRfV04jfT271X1q/lSzXK0luXkpf6tieFJWe2TyeZqoJi906Jf
         Rn+5su5FzoPWHxRMoHUYA4HLIHIycbiOQgggwsopKz80s5FgWgdNX89jDjE7Ty1ojtfl
         HrXgcKxO3gXS/plEAmzQTOa4//666GKXzx+7YGRaaxhXbqItm/6FaLrCG/hPNtyQZxs0
         3srw==
X-Gm-Message-State: AOJu0YzajdDsk+z1YXEihjaHYHanYIDgrVHcdvFJCyjDmTwHGQ7uyfrZ
	GKzSKLBUeY52hAkGqgFi7YFC5wIFhqendis1iQqYlfDzH7iPm1o4J1JBVI2Z2q9T
X-Gm-Gg: AeBDiesAiFQIQat/40h5yjNDbXTRj+1yvkzaH2QeWX9tWmLao8XuI5qwaCPunVYSgy/
	FRLVDJ3XCmOal2RX1Za0Y12mjz2uOHaFGW08hYVagAZ/XyGP5rklGydImhWBqUIGfk6YjIUghVx
	iZh2UuXUW5Wkq1cpn/GpjgPABVjTft3tDHN2rHmf40NJ/kXJggEJo5PKOwBX2N/dneP4i65Pwis
	mwMU9OwPHC5cid9Ju85Wmi3uM0I849anqSqomcQNWNdBwkPBQ/HKEv0F0Gwd6bPNo7FTf/YVMB3
	oSU90fQCwUXWfasEHeTVnbiHpdx2R0vTxYcGl//oC/yGvtoJF8mg3qWfMY/yqjqH1DtSYKaO4JC
	aeYtW90hfjp1n/GkqrUwKBJ2rSya5Qk9YfeIs3Gwzqre2Eeehmo2aLjDh3SPSxKmg7YeiRrnHZ3
	mNXyTkkIsBo8F1jEVNw/exJVVtsxZzc50qjbChuF2luBUeebWo5IGBSKWhq0m8HMwahmvIGN4S1
	PYphKk=
X-Received: by 2002:a05:600c:8901:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-488fb77813cmr192173695e9.16.1776767327739;
        Tue, 21 Apr 2026 03:28:47 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([79.123.125.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm328752475e9.12.2026.04.21.03.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:28:47 -0700 (PDT)
From: sam.john.kent@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH 0/2] Fix .ko file pre-filter to use endswith instead of string contains
Date: Tue, 21 Apr 2026 11:28:43 +0100
Message-Id: <20260421102845.292954-1-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 10:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235666


Sam Kent (2):
  package.py: fix kernel module file pre-filter and document strip
    asymmetry
  oe/package: add unit tests for kernel module detection helpers

 meta/lib/oe/package.py            |   5 +-
 meta/lib/oe/tests/__init__.py     |   0
 meta/lib/oe/tests/test_package.py | 121 ++++++++++++++++++++++++++++++
 3 files changed, 124 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oe/tests/__init__.py
 create mode 100644 meta/lib/oe/tests/test_package.py

-- 
2.34.1


