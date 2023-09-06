Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B24EE14C3
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 20:13:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.230.1694031190773807976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 13:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OwYyD+CO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31f6ddb3047so105683f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 13:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694031189; x=1694635989; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M8gzJ+xl8vYyXoqf3Cc4SOagURDBEGwCXiQlRtmP1kc=;
        b=OwYyD+COwA29TRQbp0081mU6vt5/nAgHui5q8RhNdnHHOm5p6Dv8CHQcp333anotWh
         VYGsz/hTLNiyxUn/JIIO9CUAyHsSkbvECXpWXvg7u8Wblvq8xMtl2LspCw3i6Dut0fNh
         BqNC5Qb3hoUpBsVaQJ2/pHcX93d5GhWlUNnew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694031189; x=1694635989;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8gzJ+xl8vYyXoqf3Cc4SOagURDBEGwCXiQlRtmP1kc=;
        b=a0ZK+cSnk8ycCtcsgQA9WNKglwD6XU4qd/r+kksoapHIkCv3DOeaSl3bJNynwFXn5l
         Gv/yjR+2jdYf8wKgCE98SxXo2pqlaXG0wOqcTNL2si5nO86t0dQMApUow4gxOJFPKdI2
         gis0aTKCBtkpYl/qBN+47HP/RF5plT6MEvdDdEAVS+UPTvaTArkj5KKSRtBRAFDpFU96
         EQ0yaSS+60iHio91DAO/G0PmDIFmNXR5XyLGULPa99jibVwkfUqWUdB07PRE0xvKGIPj
         JKxaecnHr9ZGGlBcpFJHc5GeprN/rjBk5jTPeQsZoe6PGYcdrQGQCdLT3zG02aHDImso
         WyJw==
X-Gm-Message-State: AOJu0YzWZeQ32fwFzubZcUIsQnbJfiQXcB/MfPsMi6wA+HsM8eCRz9yl
	LFXjlgvfDBVetcqnAN8UjPtzPQ==
X-Google-Smtp-Source: AGHT+IEoqbWcXSCYFixV9YHy4h5CCNmIIFjvLboPrEe7IEowfUeNAdaYYyAVMGX6MBYmXC5CHKxJRQ==
X-Received: by 2002:a5d:6b49:0:b0:315:a74c:f627 with SMTP id x9-20020a5d6b49000000b00315a74cf627mr3044283wrw.16.1694031189036;
        Wed, 06 Sep 2023 13:13:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id r19-20020adfa153000000b0031f2dea4810sm17015279wrr.61.2023.09.06.13.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 13:13:08 -0700 (PDT)
Message-ID: <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 06 Sep 2023 21:13:07 +0100
In-Reply-To: <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 20:13:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187353

On Wed, 2023-09-06 at 21:28 +0200, Alexander Kanavin wrote:
> On Wed, 6 Sept 2023 at 21:23, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>=20
> > >  do_clean[cleandirs] +=3D "${STANDALONE_SYSROOT} ${STANDALONE_SYSROOT=
_NATIVE}"
> >=20
> > This doesn't just force ordering but means target will always now
> > trigger the native sysroot as a dependency. We don't want to do that...
>=20
> But I think we do. Target is using executables from native sysroot
> such as user management utilities from shadow-native, and they won't
> be otherwise present there.

Firstly, that recipe was a bit of a hack. In bygone times, we had a
shared sysroot and this was effectively creating it for the places we
hadn't converted to use recipe specific sysroots. There should only be
a small number of places it is used where we haven't found a better
way.

When you use it, the calling code first has to ensure the things it
wants in the sysroots have been built. The caller is therefore expected
to build the right set of dependencies.

Putting ordering constraints into the recipe is going to make people
think it all happens by magic. It doesn't and the caller has to be
careful.

I'm reluctant to add any dependencies when it should be clear the
caller is entirely responsible for this.

Cheers,

Richard


