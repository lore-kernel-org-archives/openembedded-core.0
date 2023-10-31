Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89CFC4332F
	for <webhook@archiver.kernel.org>; Tue, 31 Oct 2023 15:06:17 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.1087.1698764768350720978
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Oct 2023 08:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=XNbjUxn/;
 spf=pass (domain: baylibre.com, ip: 209.85.222.170, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-779fb118fe4so378192585a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 08:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698764767; x=1699369567; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2THZ8CItFAiyBnkSp1JXAvqEguo7umRWsbV24u8bAE=;
        b=XNbjUxn/dgdRWxVbrfr3xHAGrTy+ySs/CdLsQ+hljPB6kZW404JdzA5zSu6P9hEiAa
         os2mb4FmUB74NclxWOJiv9kWnLsy3XRz8KArLg28OB6UjZ2iJ2Ijn571hVu+2xcBvIYQ
         Jeqw7JIDkPP3dNwQ1AOijhMcm/xC1pkV74hTF4nBbXnR9CNbX01hbSemlw7mLsIKSgOj
         XwnefPDtbwVV67uJRB3JvnvyGfdVTe8qk3m+U0+xrmwxvppE1QXmdOGUVi18ig4Wgtye
         IstMJfKHhncyw3KVPYGiR0eEr/2kjX5vBqjAPJ0F8eJLhqk9HU3GukpxhggRfiwturem
         PJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698764767; x=1699369567;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S2THZ8CItFAiyBnkSp1JXAvqEguo7umRWsbV24u8bAE=;
        b=ps1vfZcjBKKwcfsBgGMWIIhBCkThbunt9RiEmAHWGuS/oCv4K32XiGwiawUNxW6E8T
         1SC7ulLbqNcngRyrprKJpHXMyK+JnqRLTw/Dw+ncYeBoLLNR/+INQm5AutmG8nyX2xVH
         lvArlWbXQuhGxzcM9H2LLV9YvU9axhnNN6BoBVdH2+AegMbLwDykrFsg68mWKW8Cghan
         2KClTUeQf0ZFmuyZXYqgKk8+Amwgn/jbOECcS1v/XRgTIdUmzlcsTy7gsAc7fAqA9aiK
         GFvvhZ3CDAehZgCEr/ANgv15aXcq2Ck/9JOa9RAvt7CzHAAyOMA++OZgxHWJPjeSG40F
         qqew==
X-Gm-Message-State: AOJu0YwRIYINhHmaxT1Pn8PX5eRAjbI51SSJmtdi7c+KaHmfrg8Smb+U
	x/nRw12WhWUXLoII0LGkkLCuNg==
X-Google-Smtp-Source: AGHT+IFgmJGkLYiLQ9SF89DmN1/KZ2ch1k/JApQWoLfGjg/XLY9K03q0u5hoFDLezSJ3o8q+YbdGgA==
X-Received: by 2002:a05:620a:2456:b0:774:1e07:ea0d with SMTP id h22-20020a05620a245600b007741e07ea0dmr14834794qkn.44.1698764767033;
        Tue, 31 Oct 2023 08:06:07 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id x16-20020ae9e910000000b00767dba7a4d3sm571813qkf.109.2023.10.31.08.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 08:06:06 -0700 (PDT)
Message-ID: <6363f794-3e7e-42f6-bb9d-a737ca2aa51b@baylibre.com>
Date: Tue, 31 Oct 2023 11:06:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [OE-core][PATCH] patchtest: shorten test
 result outputs
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <0101018b861b3b32-256b0c3e-5bb7-40da-83f1-f6717726db5e-000000@us-west-2.amazonses.com>
 <14d60323-c668-411c-b3dd-c6cfe059fc86@bootlin.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <14d60323-c668-411c-b3dd-c6cfe059fc86@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Oct 2023 15:06:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189849


On 2023-10-31 10:54, Michael Opdenacker wrote:
> Hi Trevor,
>
> On 31.10.23 at 15:20, Trevor Gamblin wrote:
>> Thank you for your submission. Patchtest identified one
>> or more issues with the patch. Please see the log below for
>> more information:
>>
>> ---
>> Testing patch 
>> /home/patchtest/share/mboxes/patchtest-shorten-test-result-outputs.patch
>
> Thanks for this very useful service!
>
> However, could the replies have an "In-Reply-To" header so that e-mail 
> clients can put the reply in the same thread as the patch?

Hi Michael,

There is actually already a bug open: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15270

I'm looking at it now, but still figuring out the implementation.

- Trevor

>
> Happy to create an entry in Bugzilla if this helps.
> Cheers
> Michael.
>

