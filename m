Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBA6C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 09:06:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.46254.1746435979503755278
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 02:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cFuUGPED;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so5457325a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 02:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746435979; x=1747040779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=cFuUGPEDFvZODoNRZL800zg8NZxc7x0WTZ9GScC5/yBaQCWgamrZF5pz+XZwONIg4x
         93l80MI0gJn/0zZBcG463Gvc1oYV2nYA0dmkBNHoQmyOlkujALZBBRd7DrGFtsEsFd5y
         a1408otrMGqxFjkqJwDCD8OTxIpzeQpySDzNYh2ZCuGWG3KYLMaG2P9c+KLqvpMi2Zk/
         hWUNQLuJqwZzS5LosOzTZjFepIKqpfv0FCZZEsb5Sp0eK0htfi8vOCvdt9rVFiwhtH9V
         CCK5dDq8iaHFam6tNmNn1o53k6Ujy86T5Dta4wT0LKMDTJjx1yft2qFNgTnTOfbB/QbP
         kNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746435979; x=1747040779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Vb6Q8tEOhxeaWFEOD98sqH6apE9layOtVVEf5R2Dw=;
        b=KcyaGHqDxlumli1AZ4LUBEln6Ew5mtlFo5l9o3Ww+HTlY2sv+ZmIPbdRle/WfrPwsl
         Ck1VtXwZCxZg/WOXH4x2dG9u6CdHMau+p6hJtQOtXDjCN3rb8uEgcpZjz5S8leW98AFr
         PV6aX4zQFJg/rwoJOdpk0tl901OYoasti3fIJnVOTiZP66oTqNUZAGC5+8nrB/T6FxYs
         EsfYLv3tuToBP9HxaB1IfQ/wHKVCBP57onbx0dKzonC9j5utFpEZivK2hgyOepLzXMHl
         wHx5dE2T0I2cNbnydud/vJcgkhxW8jPn8jLxwpRiQpAXtm4jjT2wpONkFGHI9wFq6Bg6
         avig==
X-Gm-Message-State: AOJu0YzUUQFO/tR99x7urtuKwHvQg1bbBc/lJ8JJPFAfT0aR6hz+/xaQ
	WKWpWSdTu/B9zuxL+Dp5JhPAfWXsVrcN2andbWGAxj+Cx1LlPKMKajzqqQ==
X-Gm-Gg: ASbGnctBlSWcsxJQLjTEJR5htvbORRub7z7mNoGY1GV3BbySvWfbbXId3H4IlcolJ/B
	FoME041MEbrXZumgJlFmxwTazGKC7kJLOiKRyOwPJ5gRzqFe5fArPlHWh1dw/iUSNAyhIcZ3C6b
	qkHEzCEn8jwFh//tuYRVN8119NdGjr/6Z6rGDe0oRLVDu0iYCEpbkWHmwljOo7j0Z3kWfHv9CqB
	2rAMiHFurcMxvxm/IoLGH3M2dvZdV8bjxqXi3VHw3zFZO6cam2YyUg10kWoeo3/L8aqVAmyPygu
	psHk0IUBcUPT8fBLl+YDYZHr5uXZIlrj37B3a8TiRJCRm7xcfW/9M5X9i72KwzM=
X-Google-Smtp-Source: AGHT+IEyftJF7YuESf+98U2YCNm7Gsu0XB01z+bSLUuMUqCVvZHD/T8pwoGPjFJfrgbNBVXp66bkOg==
X-Received: by 2002:a17:90b:5868:b0:2ff:72f8:3708 with SMTP id 98e67ed59e1d1-30a6199e14emr11409794a91.17.1746435978708;
        Mon, 05 May 2025 02:06:18 -0700 (PDT)
Received: from MVIN00210.. ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152290efsm49698595ad.190.2025.05.05.02.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:06:18 -0700 (PDT)
From: Ashish Mishra <emailaddress.ashish@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: henning@itconsulting-heinold.de,
	otavio@ossystems.com.br,
	Ashish Mishra <emailaddress.ashish@gmail.com>
Subject: [meta-java][PATCH 0/4] Fixes SRC_URI for meta-java recipe
Date: Mon,  5 May 2025 14:36:09 +0530
Message-ID: <20250505090613.818330-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 09:06:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215996

Below patches fixes the link's used as SRC_URI

- The recipes are failing to feth the compressed tar from the link
  mentioned in the recipe of scarthgap branch.
- These patches fixes the path & tested on qemuarm

Ashish Mishra (4):
  Updates the SRC_URI for xalan-j recipe
  Updates the SRC_URI for xml-commons-resolver recipe
  Updates the SRC_URI for avalon-framework-api recipe
  Updates the SRC_URI for fastjar recipe

 recipes-core/fastjar/fastjar.inc                        | 2 +-
 recipes-core/jakarta-libs/avalon-framework-api_4.3.bb   | 2 +-
 recipes-core/xalan-j/xalan-j_2.7.1.bb                   | 2 +-
 recipes-core/xml-commons/xml-commons-resolver1.1_1.2.bb | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


