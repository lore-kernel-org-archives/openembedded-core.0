Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CB0C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 21:31:03 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30936.1785706254081293185
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 14:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fHNc1Zlg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4955158f26aso9961865e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785706252; x=1786311052; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zSClUFIHEga5McfiI6Bk/htANGQl+B4NKc3+gWr3cU0=;
        b=fHNc1Zlgnw4oanr36zZV4xStHptpDlpxzhOVbiXLa9cEqHLd4iT/s+qnX6/RAfTKFG
         eAkBTXcM9pV2+YGQc+FE+LTZkdOVyvavEj9mNE1NnV58vM0Vt9g9QoyaohCZ5JyMDgeE
         PEPM3uvgQNcyeHqT+4YYwCa2EA4WGACdTG1CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785706252; x=1786311052;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zSClUFIHEga5McfiI6Bk/htANGQl+B4NKc3+gWr3cU0=;
        b=PukmwvgBJ6KtxMY1go+DnSWGx5aEvnicGC9wZMsD49ZLzaKKN0mTqycnimFqtwDolr
         f9blmXI00fZnHwJ4c913Vq3Jpyrqy85TJvTDFROF8Qfb8oIIXUb3cURd2V9LT8eqo6Vs
         gyLsILnrIEpcqB5Hp+q4XMSR0j/ljyqcMxFJeeK/9yMzpNkswkxvkPownpl1r5DDU4N9
         psuyXWp5gRkJnv6axDQVeeUp/6bXDL9UHoi728LYasQORt+rHex0ulJ0ww3MA8REQNFK
         96PvD9nQJ9f1UGAJwxiHE9gXVH2iOQ96kibHpePY+I9Oan1ATnkHvrF6Hzv+qbVn6Emi
         noLw==
X-Gm-Message-State: AOJu0YyIoQv+ZP9HEhZKWByealbhBdmxW/om/honBEIF2QzWuZaBpNQ5
	7/Qci7bIJqXCoJmxLagHY/Uy5Kf2lTSs4fYpEQyaVfM0DopFH45FeTSBRJCiahpZOm8=
X-Gm-Gg: AR+sD11KRh6dJsxxRNUrlQgJHfjUX56wi7qginW65UB43jfTjhGMLz7sk/2vFS41Z5t
	rpjtzqLsgk3zaV1nNYKUc0vg6Jjpr45XZ7I+m59BP9x7+z7wR61cqs+evi1kh8BalMprJT60U7h
	Mz+TrzChqcZwY3BphpgJTPMWowTj1yd2JDKCFQEaGhGk59JjkdFxVYVRUcfW5r5k1agHu/sqbaS
	x0i9t51DmdRJBxtIk73whsblDwgSkA1/ziQL91j3RKG2CncoNBG1QgPD2gIVxP0isjKhWm++7LE
	9n8QRxkXeminP7GxPS2uCFyFgV2Sm4PfuOnAqcXgZxxqL5edac9RyQs5ajo98FAmlIn4GnRNlDi
	x25H4pc8AShOoBjgK5Bg6qBvfeN+eeQVzLhd4gRZ0QPpK1VQ2yJMIm8E8gSIboEHcg76wrkKMNk
	Fyg6ihFBdHRUkSsVjaBzEAuSyv2BjiXtyCM16cfB0KxCFRw7yNf1FRq6FY6m3TUKxGnQo/iB3v3
	2o5ZrV5EhkRRxXFH3l81gqbHhSFBIKA/NrRZqiiJSMcbdgnDdJKzQ==
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4980eb4e952mr162134375e9.6.1785706252369;
        Sun, 02 Aug 2026 14:30:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64? ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4980878dcb4sm275800785e9.13.2026.08.02.14.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:30:51 -0700 (PDT)
Message-ID: <99ca1b5c9844cfb8829c1ffda00c35d239917914.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 0/2] coreutils: fix multiple CVEs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Collin Funk <collin.funk1@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Leonid Iziumtsev
	 <leonid.iziumtsev@est.tech>
Date: Sun, 02 Aug 2026 22:30:50 +0100
In-Reply-To: <87a4r6jpb1.fsf@gmail.com>
References: <m1o6fm66ok.fsf@gmail.com>
		<f92d86a076733c5368cae9c94fb76a14cac2cafc.camel@linuxfoundation.org>
	 <87a4r6jpb1.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:31:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242590

On Sat, 2026-08-01 at 00:02 -0700, Collin Funk wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
>=20
> > Sadly, I suspect this is becoming all the more common and I share your
> > frustrations.
> >=20
> > We have an difficult position on whether to take things or not as we
> > probably don't have the time/experience to tell in many cases and not
> > taking a CVE fix means we'd get beaten over the head with the patch for
> > ever more as "there is a security problem" :(.
>=20
> Perfectly understandable.
>=20
> By the way, I suggest applying this patch as well [1]. In the 9.11
> release, short writes could cause issues with 'tee'. It was a silly
> mistake on my part, and cause SUSE some issues.
>=20
> The patch applies with NEWS removed. E.g., like this:
>=20
> =C2=A0=C2=A0 $ sed '1,49d' 0d6fcb99d691d920961938e61c43478566ef626e.patch=
 > fix.patch
> =C2=A0=C2=A0 $ patch -p1 < fix.patch

Thanks for the pointer!

I've put that in the queue to add.

Cheers,

Richard

