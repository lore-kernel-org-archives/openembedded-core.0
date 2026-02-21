Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4B84C61DBC
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:16:33 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14993.1771650984766250541
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YazlA8I2;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so16002105e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650983; x=1772255783; darn=lists.openembedded.org;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=YazlA8I2/0pjPG/4LYCq0VUzQ9sBd9FVcYmYtklaNjvm8VNvjDBfeUzdcRGoC6X0I8
         4AYRN4RXHjFqjaPjVdgAJvoJuXJmwf81iAABz7OfjxjWBnP0KMLGvyotnglZO5gKYp+S
         DDRMJZPP2Fo7SYzfmrdBNGqI1/S59ETSqbfr2JQz5IZ6cbmvABYiet8lfoczF+9pOGsP
         Jd+xaPcvzQhCLWzzTu1X7NUd/rdK6jnr/Sa+JyQrCf4iig5RK/2B4XRRI7JznSkc8IZN
         szibOK5JBmI5uA79zr69N0sOn1fKluPDtctRYH1KTUvjZtzx802jVwYnwub1HZCSRmGU
         HWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650983; x=1772255783;
        h=subject:cc:to:from:content-transfer-encoding:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/JyHHBMKDoGArDWr8M+LvjvLKWjvO0ZmouN8dlxgQc=;
        b=w3sJAW38+6/cefp7hETvjDTBZr0xSpSs1tQE643g4/OmwkePktLPEuGjJjSA1NlnCC
         fQvD1FWzenmZ7LyjRowUHyN5cjelHB2P3kylitTJh/cSsw3j4zAuKsKSSYl1XKhFrFu9
         WoBWLpSNrvohc2uuxO9L+djm/qlqVw6nJ5f/sp9EK3SchTDmlZn/mIIkSrensAhzx5LC
         WaBAUrUq5TqPgqTa0sQhAOYDWczSAa3OlDIVHNgJfjglafH5H/k5DqGFOQLEqQtfXItt
         Okm5Em+aYR7O1KpD4nIh5lQs4zKrhAKMd2tJVAklkUSZWg4oXDZWwAoWHAgPn/yE6o/x
         Gyeg==
X-Gm-Message-State: AOJu0YxFknJ0xHZbE3rk44AVePSz2xSoJdBZEE9l1/QTwFqxKJphgwSY
	wDVS2c4ARPS5RgJzvugmPBPUPg8TiVlUvv45Vlw3CXl0DXkgQX6bqdRoyjf98UWx
X-Gm-Gg: AZuq6aLKUqzXr34dy7pYzHCaNaHun/Cga1LWpx002xolX6exaOZKjvnWtskaw1V+8El
	z9husfyUXNX9e/7FcZGuLAVrcKrAgI0mzoitzjd9ju9Oe/03VnoQadU48RMwDSlfk36evFQ+Vfe
	kv45kzUp0spUjdBe1dKqYP/PgZz9YBdfJvaHopmAD34WOxZ2W/oW0yu1sHSFvq5yWp+MmAZbgyT
	yg3eOp8VaHCYdZVgb01O7Im6r1W8jqJiu8VVQt6P+66qG1DyVMm566C+BvOopodgE0FcdRl4jn+
	Nhs25168+5wZgE6fr0FSxw6SNlsdTazyzAFmQ0vmYFhabSlV5kc7Ka/LBVWuogC42uu8hSkvqAT
	989CPjcE/YYr0F0TWJa2LA53/LL812y/bjKpeCBqqJahBTas68lLdGnkSZlQjGkyMChmnxZcwzI
	tGGXPlI71dIWLQ++Gwq1qd0yxXP+OX61HUyMu1UaI+pyAVyfMZEP7fWFgBhw==
X-Received: by 2002:a05:600c:45ce:b0:483:a895:9d85 with SMTP id 5b1f17b1804b1-483a95b3e18mr31777315e9.2.1771650982875;
        Fri, 20 Feb 2026 21:16:22 -0800 (PST)
Received: from [192.168.1.188] ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a4308863sm31834515e9.29.2026.02.20.21.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:16:21 -0800 (PST)
Message-ID: <69993fa5.050a0220.a349a.bc83@mx.google.com>
Date: Fri, 20 Feb 2026 21:16:21 -0800 (PST)
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com, adrian.freihofer@siemens.com, Peter.Marko@siemens.com, jpewhacker@gmail.com, Ross.Burton@arm.com
Subject: Re: [PATCH 0/2] spdx-common: Documentation and extensibility improvements
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:16:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231601

This series is superseded by the unified v2 submission:

  [PATCH v2 00/18] spdx30: SBOM enrichment, lifecycle scope, and documentation

which consolidates all three separate series into a single series
for easier review. No functional changes from v1.

Please disregard this series.

Stefano

