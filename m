Return-Path: <majortomtosourcecontrol@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7935CEB2C0
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 03:16:05 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2381.1763176564842971294
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 19:16:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cxsODFH2;
 spf=pass (domain: gmail.com, ip: 209.85.166.177, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-43470d98f77so11982345ab.2
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 19:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763176564; x=1763781364; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kn0iMZQSxZdAYsrBmberzUvaGnL4ymsrlzstehdyPII=;
        b=cxsODFH2CQKy6zZmd8LL3G2P0Lhk1NddfaFc9xO9bTPMdu/zkXrwpA4KHnfzFAO25a
         HtdtZXx9JfRUODMqZMjwH4OVpfKyDtJA3JCm7hA7IvMkyKzwiuGLZfWilneTme6OhtN1
         Ej29tJ1rCandQnoOzy9G9/E9Wa/o929dkvQ4XJcRkwc/dsWZ+RlFDZSvQ/WlzY4n/Vwh
         07z4V9Dj9y85Dcyw2wJQrJuHP298WL5bGBM1DKbD4j6k4TrhzLAjNd3DlMbJnaj0k7n0
         8DS7nyN4V1cpoAg1pVt2/cb7Ar0LKJOSu0ib/nFXFhqsTdh6YIi7R3m0Cp/KBjihbypc
         ouug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763176564; x=1763781364;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kn0iMZQSxZdAYsrBmberzUvaGnL4ymsrlzstehdyPII=;
        b=UEuizsQ3tSfj3+dzJQ2SIArFQjy5exFvTVjectOjKuiFHBeHe58e4kxTpFlaPckYLP
         sshZWa3wP6QHUxnI+TEYwl74cfVYs4YGvF9VDXwnB30nZ0eVrkIhqCigA8ZL6U54BOM2
         emUQuOJ83FMZSkzyGPDryiLp1KGfZoesOxUBWG40pdCN9zM+0JObnFNXiNqTPrJ+soCt
         trqpCKr+8ASTT5UlneslC9m3Md0CQQcEnVOQHNnGrki2rwuJogAGcn1ZMVkUyLLRa0WN
         vORFQDGqesTh2iH/nyxnt1r28DAV8DejCvt9Q0XNdSzGfN644NFNea4lmtcTi2e98HkI
         pX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXqeINeG9ulPqLh8bFqS1kvKz6BOMVADJginW+wrj6Ya4ekSvLu6zexlKCGI9Cpwm65f/RJOyG46ubUN3me46rNIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwMRawOzuCXRbE15HjSKZk6J7NacGuFjblcqcqxzkzLIBB0WDzM
	YDUdTPoD8LZTThZxtwGI2kR3/4AH3Pu2tQThMrgrI0Qxgj/yOLbEgGAl
X-Gm-Gg: ASbGncvWsS9XF9+0McDosKDTgNeOlRgAf1AH3JEw6tdvQa04Ytb3/HOuD+X+EvWa6Xy
	0K9dZlWWzQIJkEfjBI8OWEbZwGl/bRYcUk67i0Dc5XyMMkIg97OhforxoqWpuOIIxv9HxatMOZK
	k/3Moi9AnRqbF4KsjW3My8YxbufgRWjB1jAemMg/XfDtZILo7JUCQhkPVKP/7BlZscIeY+z4s6f
	LPix7c/a0MnQ0zprMz7kBcF5PQtJTzvswqXgPp6W+gJiwmf0gXy0GVfEoWqYclbSWhm+RZHz+VX
	sT0xz+NVz4OtR/qUpCJswzU238BE03whZlcUuz2zy4OMYP6zaTb5ZAKD0/MHkI4ytd2ZZj69mor
	AWue87Tb6/AR/Sg44sRFycM1k/NFXz1mxQID3qx9Ph6GzOFkO92BjKihMI2itn/HLYNuSDIhthi
	o96Z10374mavpWt13nueLv8lxBx8YgETZaabGsQjCs9YDwML3bN+wJ5X83S1B2ghgOQZxeIWM8
X-Google-Smtp-Source: AGHT+IHeo8jN9WeoWo/b0cQ0fB1OibT+/hNBiPoZp85wmfsLbFB7zmMw1lDzconHsxA6mi1DvxjPlQ==
X-Received: by 2002:a05:6638:c114:b0:5b7:c584:3bb0 with SMTP id 8926c6da1cb9f-5b7c9d8e230mr1239074173.11.1763176563800;
        Fri, 14 Nov 2025 19:16:03 -0800 (PST)
Received: from [172.26.252.3] (75-166-169-44.hlrn.qwest.net. [75.166.169.44])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b7bd24e285sm1672024173.8.2025.11.14.19.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 19:16:03 -0800 (PST)
Message-ID: <b96e80dd-fde5-417a-a2af-6a05a6832b83@gmail.com>
Date: Fri, 14 Nov 2025 20:16:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] OE-core CVE metrics for walnascar on Sun 09 Nov 2025
 01:44:35 AM HST
To: Steve Sakoman <steve@sakoman.com>,
 openembedded-core@lists.openembedded.org,
 yocto-security@lists.yoctoproject.org
References: <20251109114632.331C31001C6@builder.sakoman.com>
Content-Language: en-US
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
In-Reply-To: <20251109114632.331C31001C6@builder.sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 03:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226301

> Branch: walnascar
> [...]
> Removed this week: 34 CVEs
> [...]
> CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
Hi, Steve

Can you provide insight as to how/why this was removed?

Thank you!

--
Clayton Casciato

