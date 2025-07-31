Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025F4C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 08:39:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.56953.1753951196685215673
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 01:39:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xb3MnRVh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso5950455e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 01:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1753951194; x=1754555994; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1I22RR9emfHSvskQ0mtH9Tz88BkGRWMHF034H8F41l8=;
        b=Xb3MnRVhYWre5+WvvLTTnEP3M8yzX06QwPX3d3HU7wtMs+p/L4B7YRsfmmom5APKf3
         oMNGwxmuEcV8VYQfq3ltjDwUNAHs7ILZcmDpoBzhslJ/gWaK+aQFogOXgItmL0BX0PaJ
         th4hO/Y95m6YIqYkJ3xoEuGZ8WpQLmh+ew5Bg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753951194; x=1754555994;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1I22RR9emfHSvskQ0mtH9Tz88BkGRWMHF034H8F41l8=;
        b=rQgenpsCsB5nbjjtPjQdrHjTqY4dV0rCx3dkXRZmY7lO36I+yXeqeiTuDFjuJDQdIq
         p/vUILmnJDPtmxJOnyLaX5y4FcZVb2xyyiS25d5BeuGzdwcHYKb2IS1W5pjfw7pvQiaB
         9bKNBnGYhlf+V2k0d9FEI/nzopgrLweSx3I0yHERNInO8uBfRhhcYk5OmsAkF1yAUJsv
         wOg1o9zfxxQjCH6VYHNZ2U5FDAmX98qK0QBcGDOiBXnGmrq4d0zQBEAPaE13BcHZ9V3w
         WXi9m7a/zY7Rb7Z1kHMantvpyZuN8MAEdzZ8hucqmpdBlEAptKBDhtz9wQK6ZAQCixyU
         JauA==
X-Forwarded-Encrypted: i=1; AJvYcCXiUW9jxkKy0h7bZzPRjfcjhP7Ev5fQ5c5Lt9htP91NGzWFUQppVnKmI5V1ht/6NFzKv3k6tv1yF1HfyGrl/K0Ggg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzN0YO5e5fHtH0xyiIpJFvlfX6R+lj0aUWzlrkfR8VO3QEIvYM/
	JgXwfX0KxyQSyuR1va6gGevDMa9I8fsma0nOQKAbTkGTOWU+aBGdLl6c5Z44czpD6vw=
X-Gm-Gg: ASbGnctamGV2Abbf3/6W5QfAq29ZRfahbmF1WeHvgdr5BHNAoUdsnIoq7DxuWroTkBs
	txngU6k++OIhmp7I3oC/oOJF7wY1orLKipsqHtv7g2tSOikE8AynhO/ojJPEv4K2FhU5BL4o3VP
	K2LW51AJFGFRX4w18+16WpgILWF5Qt8IonQ1OFSP42BQgFU2T0IFShTKrvlHA6gIMtTc53h368w
	b2fdNritXsr6hY1i0LHThv22ntT259BxmDh43Q2+caHqC5lIQWcY1cgHZonEdoOUHTVNFQXkVkZ
	EXYlGkmkro/ReAi/neggEaQqohK1Os2nWigqOlfAM2fTdIgsONTz/2MkJpW+JqKvij11qWrfv07
	La/ZiZaDLExuweAGG3ON1RFoKCxcXVaGlkm9d0Xzv9xF3yfJ9jP6trMfSQS6WtaTzwRkJSj/yeV
	TDeoR4ff0cUJ7JncwxRS2qzg==
X-Google-Smtp-Source: AGHT+IHhj9oM6GWvVx89hzTJqvvdeo39xY7v+HKIe6ha0/TMsSwybflxJdDTa2EIJEwIDgxjvAX9rg==
X-Received: by 2002:a05:600c:1c0e:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-45892bcfb04mr49650425e9.25.1753951194547;
        Thu, 31 Jul 2025 01:39:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6? ([2001:8b0:aba:5f3c:4bf9:5bfd:d948:4db6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953cfd10sm61185655e9.21.2025.07.31.01.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 01:39:53 -0700 (PDT)
Message-ID: <5672524081b3323b718c5bb819faa1588745cd49.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/3] wks: add loader-bios to bootimg_pcbios
 source_params
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2025 09:39:53 +0100
In-Reply-To: <20250726014655.3377745-4-vince@underview.tech>
References: <20250726014655.3377745-2-vince@underview.tech>
	 <20250726014655.3377745-4-vince@underview.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 08:39:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221181

On Fri, 2025-07-25 at 21:46 -0400, Vincent Davis Jr via lists.openembedded.=
org wrote:
> source_params['loader-bios'] is required
> for newer updates to bootimg_pcbios wics
> plugin.

Would it make sense to have a default so that older code doesn't need to be=
 changed?

Cheers,

Richard

