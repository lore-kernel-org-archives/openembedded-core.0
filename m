Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0905C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 18:14:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.2517.1669140848695905412
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 10:14:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eHunkGS7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id t4so11312829wmj.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QKlVzpa3Nb1tvZ2k64cu9xdbqi9exGnusZKonO7jY3w=;
        b=eHunkGS7dPbK+pFVpEoxQDT29KqoAO8F+b8l977/iNM6PJxtK6tssJ/Z4EIhesQ8Q8
         H/PdXYXsMBV4IAPLsT9NoAeBbQTIuNqzYT1w33aHIBz2WezlN4MpVEdTOledirESZODf
         iGUElyMLxu9NBb9CP3d4Hm8jtPwQGMCZLrd5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKlVzpa3Nb1tvZ2k64cu9xdbqi9exGnusZKonO7jY3w=;
        b=FOzVWIplQ1ygknlHSfR1+bvPzziPrywhYSDt9g+LRGtnovsMSEi7FlnezHeW71pfM0
         xtsUkQbTXRu1elgGnnGbvh45DBM1RN8cmxOpQb9q/ZCpHekUwaKkVLrrkOLt3fHhigeT
         oQTt2iCjX4KCmq7YtUFtgxERE4sXQiPe0rM3D0Aamcau4O1iDM9QEhvQvQzGP1hpyozb
         tzVaakwGR1fV+2C6CU/x9PNiidh6AOnA65ARQSRPrrMwIzW6aCXHJdhA82lCgQyju3lZ
         h3CZyD5nBu7Fe3Mv3NzepSM6R7IcM1+Y4Gn6UJsiIRNkltAygHZSYn2O+7TXsYD2kiHu
         z5oQ==
X-Gm-Message-State: ANoB5plQu9af4C3tzlaB+WNBuq0PA70NXTxytyHILwaWgAlCuaU5YTqB
	zscbmxmix7E6HSHsgjmWh5/Idw==
X-Google-Smtp-Source: AA0mqf4ZYgpzOTOgQHlBIfF6lvVPsk4CPCp9T5pLEhyHS19wdBBxJTbHZihG1y0QtV0QJhko5vLCEQ==
X-Received: by 2002:a05:600c:20b:b0:3cf:f2aa:4f24 with SMTP id 11-20020a05600c020b00b003cff2aa4f24mr16879804wmi.48.1669140846994;
        Tue, 22 Nov 2022 10:14:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445? ([2001:8b0:aba:5f3c:2b3e:5e6:6ca6:2445])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c314a00b003cf71b1f66csm19628001wmo.0.2022.11.22.10.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 10:14:06 -0800 (PST)
Message-ID: <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton
	 <Ross.Burton@arm.com>
Cc: Khem Raj <raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2022 18:14:05 +0000
In-Reply-To: <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
	 <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
	 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
	 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
	 <1729A925BA1D06C8.25787@lists.openembedded.org>
	 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
	 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
	 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
	 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 18:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173697

On Tue, 2022-11-22 at 19:03 +0100, Alexander Kanavin wrote:
> The serious need is that we need to patch all the scripts that ask
> for python to add a 3 to it. And there will be more of these going
> forward, not less. I=E2=80=99d rather just always have python available. =
Not
> a problem worth deliberating over to be honest.

I don't think it is that simple.=C2=A0

a) If we take the change, we're no longer explicit in what we're using
which means users can be taken by surprise when a python2 script finds
python3 and could sometimes break.

b) Our current approach means that people have at least looked at and
decided something is python3 safe.

c) It means that anyone still using python2 components is left with no
way to make things work. Whilst nobody should be using python2 anymore,
I suspect some still are and this will be a huge problem to them.

d) If there ever is a python4, we'll have to redo a lot of the work
we're done to reach this point where things are fairly clean.


Rightly or wrongly, this patch will cause large amounts of pain for
some portion of our userbase and I'm not sure we have enough
justification to do that. That pain wouldn't likely be realised for
some time either :/.

Cheers,

Richard

