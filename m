Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9A7C433EF
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 14:57:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.42783.1656341832192523610
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c7l9W667;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 189so5126960wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=aFU6//IenaJh6EXdinidbskIPXUdapDxSc2/xPX0b/I=;
        b=c7l9W667/1Nm2p4sh+vAOtI2wrywp4ScKbJc+mg2t4BvmapqW/99WH8PMcCBknJjAS
         DXIU1UGICl4hd2UAukufl8xKUnyxZRTpn2+MmPH/BuCfc+//PamLcqq9XxPZB+ZM9zuX
         3w8nNAsSuTlKe6S+/iCArVWc8ad3FC/4BDSi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=aFU6//IenaJh6EXdinidbskIPXUdapDxSc2/xPX0b/I=;
        b=bIiOzCIPXoLvKWNzM7Tyg8CXYtZ4rqOEDMzfMgqHO4mMeYJqYhTyhyxq0XJfgGZphG
         bBLnDvLHrHjo8BmhXLkmgFphgBcbwzP5oqmSNq8Szdoq9YmaJ34A/8o3agB2nmpqmAqX
         961bR01dgRkhUSxc4F5BUL1i62cGU8DMb9qo3YBBdKQeQMInJ8qJRINoaI+WTFyEpQOT
         doIb8AlBS7h3UTS6XDWmOS0y/i7LmH5kgbdCw4lx7AahQpypcIHd//dQFMih3F4oT7ee
         GaAqwUesFsA+eFsPxEcuWKaBCxDSnWeRf+Pi5zw3kUCmyqlr36HhISp086ctjUe23kQM
         S15A==
X-Gm-Message-State: AJIora+14lhwNpQel6QH2Z2ihzsXxKN66pf25v2eLs3RFRZ2DWBwyEPD
	SU6HESFTf3QhU+q6ybwbLJcWLiRCMc8JpA==
X-Google-Smtp-Source: 
 AGRyM1tKQ55KIxQSIQI0i5edfvkizZKx7CWJ99JLBH3kE/+D0rGBE9UnOXGY0It5qy4QkBfxGwT1Vw==
X-Received: by 2002:a7b:c106:0:b0:3a0:3e42:5751 with SMTP id
 w6-20020a7bc106000000b003a03e425751mr15903543wmi.9.1656341830202;
        Mon, 27 Jun 2022 07:57:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033?
 ([2001:8b0:aba:5f3c:8950:ad6c:6fd6:5033])
        by smtp.gmail.com with ESMTPSA id
 f18-20020a7bc8d2000000b0039c747a1e8fsm17579058wml.7.2022.06.27.07.57.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 07:57:09 -0700 (PDT)
Message-ID: 
 <102895f4bd9502574b0f8aadc942a001fcf0871e.camel@linuxfoundation.org>
Subject: Re: [OE-core] pseudo database integrity checking
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 27 Jun 2022 15:57:08 +0100
In-Reply-To: <16FC7E9A09B2C9F7.24408@lists.openembedded.org>
References: <16FC7E9A09B2C9F7.24408@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 14:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167325

On Mon, 2022-06-27 at 14:52 +0100, Richard Purdie via
lists.openembedded.org wrote:
>=20
> c) We could add specialist code to bitbake such that when a fakeroot
> worker exits with 134, we dump the tail end of the pseudo log if
> present. That doens't directly fix the issue but would help users debug
> problems. This does come at a cost of making the bitbake code pseudo
> specific.

We did already implement c). It showed up in some cases locally where
pseudo was aborting but not others so I need to really work out why it
isn't consistent :/.

Cheers,

Richard

