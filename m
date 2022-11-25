Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5659CC4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 13:08:38 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.46566.1669381716814307283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 05:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RvyNAVbi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id s5so6719062wru.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 05:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2RC8isTF52/5MaRVDnmH2yTi3km1Dva7sRmNeGchwkA=;
        b=RvyNAVbiYUcKp6J3uPb/5RpjmC48cRfY8F3liOsw4CmhMsQg9VmVz6045T2h8jvpxH
         4wYnHrwvRqPj+uwaCxCltepbq70Rrganyv0mMcx4QGoyANAhouzmtemXKa3z2FrIzd6N
         eSyYcBkvZwyR0BW2CkXW7J7b/GlchjXxlo0Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RC8isTF52/5MaRVDnmH2yTi3km1Dva7sRmNeGchwkA=;
        b=0/l3OOowaAjuOq50NiRWNSbwIWbgKBwbj1q2CRJysGEI5nYF9yOnL3NELvS08LPDP/
         nDKpdZz7IxMCU5q/j+dkeCu0sQdM71gEd5e4L/Lgl+5fui/bYq9O5QB2O/acNonI5tCL
         4uHPrLc1ID3a4puxD8MHFOJ/vFoXOsdeFeAheQdYt845W+5V+p+hSSbTDmK0WIP4A0pQ
         xRl0TokEEyfFYPKdVoyRlZ9Q4pWNtd7Z6zGm164CysOr6GXdFbd/rBkxgJoh91nvCXoc
         KvmV5ILDhfvZqkK0C7tRPN5rr7TzPLJfiazqL9l+1LtPJI0fsePqNV86dErhy9VmodnF
         hOOA==
X-Gm-Message-State: ANoB5pmHzV3z2wkSQF2m9YFxNHyi9yhmHym/8F66fzOM1pEu/Eno2ihm
	k4z17XdK1R6sJWXtJ0W8+rJVXgVUVo1TPw==
X-Google-Smtp-Source: AA0mqf4EnSG0EAL7zIGfrUYMorXSZwBDP8PVrRrKZ1Zn+n0/UuJIUUlpd1We5CXIoZtiEvAlIspIng==
X-Received: by 2002:a05:6000:510:b0:22e:3ca6:d4ab with SMTP id a16-20020a056000051000b0022e3ca6d4abmr24382677wrf.658.1669381273354;
        Fri, 25 Nov 2022 05:01:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7c6f:7712:93d3:b3fa? ([2001:8b0:aba:5f3c:7c6f:7712:93d3:b3fa])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b003cf54b77bfesm10730112wmq.28.2022.11.25.05.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:00:55 -0800 (PST)
Message-ID: <a6c3d013926c1c18e41efd9f860a2c74f6155470.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] selftest: allow '-R' and '-r' be used together
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, "alexandre.belloni@bootlin.com"
	 <alexandre.belloni@bootlin.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2022 13:00:41 +0000
In-Reply-To: <CO6PR11MB5602D48B1A9960C0E627C2F6ED0E9@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20221124025528.114101-1-Qi.Chen@windriver.com>
	 <Y39W7D6ps5v1cCyn@mail.local>
	 <CO6PR11MB5602B903C8B0BB9EB6C94214ED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39rTVzD41m41oyP@mail.local>
	 <CO6PR11MB56029B5C9F7EA25EB2CE1F6AED0F9@CO6PR11MB5602.namprd11.prod.outlook.com>
	 <Y39zIuEp2//QoOxc@mail.local>
	 <e9cc745903744a94f830e1e897c9cbabb66cd373.camel@linuxfoundation.org>
	 <CO6PR11MB5602D48B1A9960C0E627C2F6ED0E9@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 13:08:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173766

Hi Qi,

On Fri, 2022-11-25 at 05:56 +0000, Chen Qi wrote:
> The AB is actually running 'all' tests.
>=20
> The '--skip-tests (-R)' option means 'Run all (unhidden) tests except
> the ones specified.', according to its help message. This is also its
> actual effect for now. You can see there's an implicit 'run all
> tests' meaning in this option.
> The '-T (--exclude-tag)' options means 'Exclude all (unhidden) tests
> that match any of the specified tag(s)', according to its help
> message.
>=20
> So the AB's oe-selftest command means: execute all tests except the
> ones tagged with 'machine' and 'toolchain-user', and also skip=20
> 'distrodata.Distrodata.test_checkpkg
> buildoptions.SourceMirroring.test_yocto_source_mirror reproducible'.

You're right, a different build has -t machine and I'm confusing the
two, sorry.

I don't really like making changes which require lockstep changes to
the autobuilder configuration but I can see why we could do with doing
so here.

I was thinking there should be symettry between -r and -R like there is
with -T and -t but that also probably doesn't make sense when you think
about it more.

Alex: We'll probably have to work out how to make this change...

Cheers,

Richard

