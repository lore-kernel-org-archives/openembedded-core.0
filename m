Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088B4C61CE2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:16:24 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14992.1771650983272947652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:16:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OhybcVin;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4807068eacbso21743515e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650981; x=1772255781; darn=lists.openembedded.org;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=OhybcVin1ByFn14yhes8jvGc0c9kKejPxpHd9BK8Ik5TkukLknWS4z/5LofEfTO2IY
         5G8/6jCwnacU0kGj1Q+vilw9Fx0m88R4hc2FDs3BVqB396J4F+2qEdySBUUchFtnU/de
         DHghtV3XeSvqy3jmwEONiRqYqfnIAbOrdFvu8/NGK9d42CM+UhJ3587Nf5xxbG3RBSzN
         7+82KFhoZIWl8pvdYmTUfigwfhLE9mPybknR2876PSNpudca+grRXRHXqKfB/nMfKjXS
         xyby+syUGHNH56dJHtsVUx8tshNEeRYPKasi8xpHDHXnMwxBJ+U3+6JJJ4HlqpVrUUFN
         P0Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650981; x=1772255781;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=R/r+sfUGXUtrAKH5Q1FfvLuRIVqIwAQNNbHrH5XYMGBoqKGlJIZjaQX81TgQQcWuJz
         RXEdLPncx1WRxRwJW+Xbt85hg15enVN20bdfncpqEk7TbUys+EZU6/vaa+Z7OSXKh0pf
         ekJgBHw9YCL9wIImK2hrRQp/HimxJq4Du78fegQ0KDu/yzZX/GYQB4oRdXA0y6u8+TIl
         NDGT1u8pRka0AIPoJsZkmY3iWHhxTJ1x1I2SRu4pDtLodmEm/miXDE5dYDhe2a3alkr/
         vs3a940h6ZO5n9TywmfZAoilupn/SvVA+Os4Nczj/07v2g8IEzB8G6CWqQzzDOYodYTP
         yeBA==
X-Gm-Message-State: AOJu0Yz8nN87maX1SaSK4rGtvsgmShHd6/m/AT19AU78/7eKZpyqdSzq
	Tb1bVE/VfM7kNlc+SUb/qitmG8gyJvYoRdP3KMdJhVd2mmo1e8Yvt6nG8+QysQ==
X-Gm-Gg: AZuq6aJ1hEyjDTM93tmLtPNp6b5/jj5jtC9ULG3IAX6shcYoefuXAvb25RVm0yLg4P7
	+KtD/A48iapglE7y3lFZXxA7BsghmQ2PhY4BQfMEhJglCWAiBbeOU6+hZSxQAq/lOX1zwcRIkvN
	quS9d33dAnddYEtXvW+5ZvV5QWHJM2nxE8sSunKZH95fdo+zTIkJDBVGmrlK/+fwV5GjuX2ymZB
	6hOXYFCw+2qFJw7p8ZAoC7IZLrSPI+EP7TZT20CVdOF9Fu1lhXh9ahgpVogMZTSa0eJhR6mmZW6
	5XuWZeI76A8S7EL+sCtGfTkFx3XDCigHbSHtnid5PDHG37neiuhQVPbdUhcvP0wGvScYHQqLyNd
	HaLxQSYHxFvnIWxl1B5U6qJwzYlqrRkoo39u9mJ27EiZ00FLjhwIuJIgpb7dClNryJCfr32Km2E
	kyejx3cYietShb6zB/OlAFhVKZhLcB8puB+IyLE21OuZpTgpY=
X-Received: by 2002:a05:600c:8b71:b0:483:7980:4687 with SMTP id 5b1f17b1804b1-483a95dd932mr28614575e9.17.1771650981327;
        Fri, 20 Feb 2026 21:16:21 -0800 (PST)
Received: from [192.168.1.188] ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4308863sm31834515e9.29.2026.02.20.21.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:16:20 -0800 (PST)
Message-ID: <69993fa4.050a0220.a349a.bc52@mx.google.com>
Date: Fri, 20 Feb 2026 21:16:20 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, jpewhacker@gmail.com, Ross.Burton@arm.com
Subject: Re: [PATCH v2 0/2] spdx30: Lifecycle scope variable declarations and test
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231600

This series is superseded by the unified v2 submission:

  [PATCH v2 00/18] spdx30: SBOM enrichment, lifecycle scope, and documentation

which consolidates all three separate series into a single series
for easier review. No functional changes from v1.

Please disregard this series.

Stefano

