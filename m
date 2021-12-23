Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D49C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 13:12:34 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.32602.1640265154214389406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 05:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D8GAA08K;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id g132so3630037wmg.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ZhqHOP4J/EolGPzADv34ob0E33dR/zgKlKRgomvtoNQ=;
        b=D8GAA08Kbe0pL0AmvI8btPfReOk+8zeliw2CGScnQu8O7D7aedWo9qjmXC7Fx4Aa+4
         zCAZVu54tFgDlUk1b8OcCaE1Fj6AFubBcaBVov/U7SmXJHJ/lhlhzsAhardIRkVkaqui
         99l9sY20FACIoY48KqxZ+mDJZYLj9y+0q7XsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZhqHOP4J/EolGPzADv34ob0E33dR/zgKlKRgomvtoNQ=;
        b=l245BpZfDJ9J3CLgPmFesRjf6geya0A44jKbOPIbOyRFC+kFRp+CzvNbUduB9UVPIE
         gFM/4aMeX9ai8qLjLBAVnH69xWhhNdsUxKiD+H84tOsXjkEade/gW4xijq7rTXgmqqoi
         nVz65+e3ja1vVbbpNeuS8vdDM2MxEAOiUlKOAVjKI+MiVPeTiaE1b0xmAwk1ph2EuEDJ
         UjE6EcJ12DHxkNwks4WvlokM+7T2HCYp1YDlubAijkm8KXZb1joJgsM70G9yfSK25Ev/
         S9nwEhaClgJQnO1SfUL71lk8cCmzai1L1JRZeTLYaDg3iGvIL55ATFb5e55lkQbvHsuE
         WMlQ==
X-Gm-Message-State: AOAM531v4onXUpnXwOTJS42hV701bUBKsPWpqDbF+CUAItx8YfTj/4Cg
	6GCNgdT9NMtAIe4Dd3GUHxh+3lCpYzScvg==
X-Google-Smtp-Source: 
 ABdhPJylZIVQMSwPqLEkA8+YlDRz8hEKEZr5diy0RqWWdlKjjdC5VcYemV2N7Fnn4Zz7Vuxy7+Bskw==
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr659778wmj.123.1640265152829;
        Thu, 23 Dec 2021 05:12:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1853:9343:6af4:2b3f?
 ([2001:8b0:aba:5f3c:1853:9343:6af4:2b3f])
        by smtp.gmail.com with ESMTPSA id u9sm7883679wmm.7.2021.12.23.05.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Dec 2021 05:12:32 -0800 (PST)
Message-ID: 
 <36c9400e69314485e4e249cfc4eaf06de1fe2470.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 23 Dec 2021 13:12:31 +0000
In-Reply-To: 
 <CANNYZj-R_utpNfE7ySa4M+ZfKCgsSEAGaTW=v-kra7Z-W=4YBA@mail.gmail.com>
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj-R_utpNfE7ySa4M+ZfKCgsSEAGaTW=v-kra7Z-W=4YBA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 13:12:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159982

On Thu, 2021-12-23 at 08:28 +0300, Alexander Kanavin wrote:
> Should there be tests for this? Would be good to check that the network is
> indeed disabled in these tasks.

I think Ross was looking at that. The challenge will be the list needed to know
which distros this works on and which it does not (I know centos7, debian9 and
debian10 don't work)...

Cheers,

Richard


