Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738FCC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 21:50:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.41205.1702590627506082365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 13:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=v+R+vlc/;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336447100e9so1538144f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1702590626; x=1703195426; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uTeu885WSP7agyruFO+Q21p1cRetGBIenW3kw1BkDK0=;
        b=v+R+vlc/vGnu0H43ph+qoxK+N1t1DzfZq7o6dHUB/63RpjmqpnKfdmN8Vm2XKj69i9
         4t1cr+OcrH/ECj/Kr5IK3G4ZY82KYGZhhiI9FRZsVO+iUb1a5wDqiLr0UY/EABnm0EgJ
         TyOYqJFa3ExnUwccPVZn06HMnf4ifD5feeUeRA/HRo+T5cpeZnqTmOprmGHC0P9mCLkq
         rJLliV/ks5QeLMSr6CzpNCwJqXx7eliqPIi1CFi/3vYRoNOYQig+zcSkf7BERMM3zB2P
         NIp3pYJ26mt3xaxUus8mnQxCf7ov89/SOaUToH/cKg/Y1CqgTeBH/axjHdrCoLoT+lrm
         HBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702590626; x=1703195426;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTeu885WSP7agyruFO+Q21p1cRetGBIenW3kw1BkDK0=;
        b=bV7NgigHr5epkcf4/qwjDuRe1pwyhX1QSYSCZHfAei+K7IdD1Labo1V0+17q3JTlpq
         QBZXjMkTOSpYgdg1ZYVjPY784Z/QI4LeedLKP0KurpHkVYg5c4pQ/qTVkpm04MXUkDrh
         YzRGESzTZQoeTISc08AuAaqnkNLhp/DyS9aq7FWuWUcL6i9fKYpDNaKt/xrUw8WVMQfW
         k8gDFAt2iszv0dl60MT1PxW29NDqXmK7PyWJqqwOVLyKnaRGmwxVIzhjcLcIIoL51Ol4
         Fm2otFV+VMU8hEmHxGdFtUO9m4jEgymWYxx6B8HEcmMjKIbdOAGfPpMckaKMSCRTRbmW
         5DkA==
X-Gm-Message-State: AOJu0YxlBawJGD9Z16AYCgWCmNKcsE4LLN/UGU2lGVdA74RpV9jq9Uzo
	vHCBXSDHP126fDDSfbSel4v7MQ==
X-Google-Smtp-Source: AGHT+IELsMo9Irrgj7GHv1/tekzT+upyf9/P6IlqIdzU7IPvt3X//AFTgxp1eOTN6gckPDn/12TZNA==
X-Received: by 2002:a05:600c:54c5:b0:40c:238b:7a54 with SMTP id iw5-20020a05600c54c500b0040c238b7a54mr4744835wmb.151.1702590625653;
        Thu, 14 Dec 2023 13:50:25 -0800 (PST)
Received: from [192.168.0.28] ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm26061697wmb.38.2023.12.14.13.50.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 13:50:25 -0800 (PST)
Message-ID: <e4d7dc18-84a5-42e2-8c49-9c9b673606e6@smile.fr>
Date: Thu, 14 Dec 2023 22:50:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH] externalsrc: Ensure SRCREV is processed before
 accessing SRC_URI
Content-Language: en-US
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Chris Wyse <chris.wyse@wysechoice.net>
References: <20231207223258.3273718-1-yoann.congal@smile.fr>
 <CAOSpxdbVCTyG5Y0Pay7G+PPxLHHhxcg-UOunTOQvWD7MkHSDRw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CAOSpxdbVCTyG5Y0Pay7G+PPxLHHhxcg-UOunTOQvWD7MkHSDRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 21:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192406

Le 14/12/2023 à 17:24, Steve Sakoman a écrit :
> This patch resulted in oe-seftest failures on the autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6322
> 
> A representative log:
> 
> https://errors.yoctoproject.org/Errors/Details/746003/

Thanks Steve!

Good news, I can reproduce this locally and easily:
  oe-selftest -r devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files_subdir -T machine -T toolchain-user -T toolchain-system -j 15

I've commented this on the bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=14918#c7

I'll look into this.

> Steve
> 
> On Thu, Dec 7, 2023 at 12:33 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>>
>> Call bb.fetch.get_srcrev() before accessing SRC_URI. Without this new
>> bb.fetch.get_srcrev() call, SRC_URI might be accessed before SRCREV had
>> a chance to be processed.
>>
>> In master, this is fixed by https://git.yoctoproject.org/poky/commit/?id=62afa02d01794376efab75623f42e7e08af08526
>> However, this commit is not suited for backport since it is quite invasive.
>> The part of the commit that fix the bug is:
>>     --- a/meta/classes/externalsrc.bbclass
>>     +++ b/meta/classes/externalsrc.bbclass
>>     @@ -63,6 +63,7 @@ python () {
>>              else:
>>                  d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>>
>>     +        bb.fetch.get_hashvalue(d)
>>              local_srcuri = []
>>              fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>>              for url in fetch.urls:
>>
>> NB: bb.fetch.get_hashvalue() does not exist in kirkstone but is
>> equivalent to bb.fetch.get_srcrev().
>>
>> Fixes [YOCTO #14918]
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> Suggested-by: Chris Wyse <chris.wyse@wysechoice.net>
>> ---
>> Richard, Steve: This is the commit we discussed at today's bug triage.
>> ---
>>  meta/classes/externalsrc.bbclass | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
>> index 97d7379d9f..eb6afca4ab 100644
>> --- a/meta/classes/externalsrc.bbclass
>> +++ b/meta/classes/externalsrc.bbclass
>> @@ -62,6 +62,9 @@ python () {
>>          else:
>>              d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>>
>> +        # Ensure SRCREV has been processed before accessing SRC_URI
>> +        bb.fetch.get_srcrev(d)
>> +
>>          local_srcuri = []
>>          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>>          for url in fetch.urls:
>> --
>> 2.30.2
>>

-- 
Yoann Congal
Smile ECS - Tech Expert

