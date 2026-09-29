Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70423CA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 16:41:33 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.801.1790700085599163967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 09:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=artfFxE6;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so28376105e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790700084; x=1791304884; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uRbpCpUxf/VMKrbMAwJ+LAlyPEQ9GMuhNER9xWNAFTY=;
        b=artfFxE6sEhaxdSNOx84En07jl38CppiIuuWE77El4rueyYqK0D5g7y5OHHzrwzBzO
         mk/ZbBNj5wzUlE7aKL6jg7D5UfB8Ug9+XYvSZf5Dyw6M7RX+ploIy3AQ8q1waLDgXbRn
         MhlHwNstKPhVK2KFSe3Zts7bQSkR7dEvO1T/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790700084; x=1791304884;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uRbpCpUxf/VMKrbMAwJ+LAlyPEQ9GMuhNER9xWNAFTY=;
        b=tydyV1xcVxq4c9lVIMCNBp0DvYHGYw8rzDKvCM8K8nfFJnpobmCAWWENs1LueBjvOA
         a0Xix6nAw3p/b/xSFF25/WJmJ82eL2+cEvhI8SCklLyQQLyIsm9pukwW/S/bjWbdv5R9
         60zaJhWGKffUB5MOCEM2VGzaGYi65NgeW7ToyBE71/ftLZvwEQr8X4QCY87raoPS8SY/
         sDjp344U0tz99ux4KLFvbjJMIyDue8UafX55m2vgmNjarLYfSiJ+P8UlCwt9HcJ5FpYZ
         GHUo8aw38juWRO0CEZ6dlVBVsO9iZ0VkpvEZn9cB/sFgqqy9RqdiMvPGbWHDY/Np1aOD
         +EyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZ8uRoj53qOH+dF/8l67aYGu3eqO3A0SUq6VKp2GebQtKsYaQ20sOU4VopE6mXqV9/I3Y6FqExyMdrrQJDgluk2Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mn1OX8TvSTkiuxgXEIgbuX3aoJd0f7OcVB5D4d446xBq1c2wb4
	fDgY5spfrxNCaDfcNqR18tKJtqUyUOKHKrbKFp/JYwOfuYluAuD1q2FOflRWelHhwsI=
X-Gm-Gg: AYBFou2rEvVLXWp9gxa5KFd7XTjnKDY7cvaDuNXQe3/29Rh79iBivI0iJt5Nkpxq3Vd
	dC+I8DlSg+4pdGGaPPrmt899UfFMCtIHHMN3ozCexpgQEXQsHxE+g2UeacDOMP4t+NlOVl8+Ula
	rhrbdbjXT53ZS3I4XalXP3eh61091zJmdvOMbdnPtJmN51dlfcc42W3wsG+/9JW61jk8vK60ynT
	bGPhejZKGwxZr00MvwlOe+zaEZWBeDewRraIMn556QgpJX4cziNY3sg8kNn5aytJeaWgN6V66h9
	HioBkqrfV8it73DBbARdfRLEnKSrwu3DWZ9L1pbS05NrjqFrH4F2ttWtmhCJRU/VqFe6i0/Job+
	Um6MgFOiX7tkhhZYKTjYCTOMeolBOc3tcSy6mb8TVPcoCSXYopLURD+s6HC6yHNN24yp5q1q9Fd
	lov87JO12FMbJSajX76QpErPcuPHwwS6V2+nLqkGILRVNHS5DFCsY5YkZAyqmZXrbOt15eBHtSW
	tVF4EKl2TCtDcLjoukDwTpVZiZqFq2rPhiTzM11SD+uTz+Eur9tFGb11PbQ
X-Received: by 2002:a05:600c:530e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a013ea30d3mr12248675e9.35.1790700083604;
        Tue, 29 Sep 2026 09:41:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c2fb:8115:9b9:553a? ([2001:8b0:aba:5f3c:c2fb:8115:9b9:553a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b72fsm120696365e9.9.2026.09.29.09.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:41:22 -0700 (PDT)
Message-ID: <f2dbc6adfcf389177181ae799179b0c4bb39b51b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] less: upgrade 704 -> 710
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: sumanth.gavini@windriver.com, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>,  "openembedded-core@lists.openembedded.org"	
 <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Sep 2026 17:41:22 +0100
In-Reply-To: <0920899b-01ee-41cb-abb1-98cf2c0877ce@windriver.com>
References: <20260929160148.1379655-1-sumanth.gavini@windriver.com>
	 <9a6b6928-0db6-4f88-954d-870ff32f8348@windriver.com>
	 <0920899b-01ee-41cb-abb1-98cf2c0877ce@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 16:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246881

On Tue, 2026-09-29 at 16:31 +0000, Sumanth Gavini via
lists.openembedded.org wrote:
> On 9/29/2026 11:20 AM, MacLeod, Randy wrote:
> > On 2026-09-29 12:01, Sumanth Gavini wrote:
> > > Changelog is here:
> > >=20
> > > *https://greenwoodsoftware.com/less/news.710.html
> > Recently, we prefer that the release notes/changelog content be=20
> > duplicated in the commit log
> > so that it's available should the page disappear from the internet.
> >=20
> > The AUH report had that:
> >=20
> > =C2=A0=C2=A0 =C2=A0[OE-core] [AUH] less: upgrading to 710 SUCCEEDED
> >=20
> > Otherwise, this seems fine.
> >=20
> > ../Randy
> >=20
> > > Signed-off-by: Sumanth Gavini<sumanth.gavini@windriver.com>
> > > ---
> > > =C2=A0 meta/recipes-extended/less/{less_704.bb =3D> less_710.bb} | 2 =
+-
> > > =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > =C2=A0 rename meta/recipes-extended/less/{less_704.bb =3D> less_710.b=
b}
> > > (94%)
> > >=20
> > > diff --git a/meta/recipes-extended/less/less_704.bb
> > > b/meta/recipes-extended/less/less_710.bb
> > > similarity index 94%
> > > rename from meta/recipes-extended/less/less_704.bb
> > > rename to meta/recipes-extended/less/less_710.bb
> > > index dc841a9ae6..f3f5ebd6a1 100644
> > > --- a/meta/recipes-extended/less/less_704.bb
> > > +++ b/meta/recipes-extended/less/less_710.bb
> > > @@ -29,7 +29,7 @@ SRC_URI
> > > =3D"http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz=C2=A0=
\
> > > file://=20
> > > run-ptest \ "
> > > =C2=A0=20
> > > -SRC_URI[sha256sum] =3D
> > > "20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb
> > > "
> > > +SRC_URI[sha256sum] =3D
> > > "d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a
> > > "
> > > =C2=A0=20
> > > =C2=A0 UPSTREAM_CHECK_URI
> > > =3D"http://www.greenwoodsoftware.com/less/download.html"
> > > =C2=A0=20
> >=20
> >=20
> > --=20
> > # Randy MacLeod
> > # Wind River Linux
> >=20
>=20
> Understood, I will be sending V2 with changelog content

I did already try this. The ptests need fixing, see:

https://git.openembedded.org/openembedded-core/commit/?h=3Dmaster-next&id=
=3D2e8573035a95f386b623f64d7e6aa069fbb954f5

however I believe that even with that fixed, there are ptests in other
packages that use less which break, perhaps in zstd?

Cheers,

Richard

