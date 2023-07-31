Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8497FC001E0
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 21:19:51 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.4627.1690838382197828154
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 14:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NK1utirk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-31765792c7cso5256051f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 14:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690838380; x=1691443180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GFf5b92AnxRPuHlO7uvs4bnJhBwkXOors4UhZ/XqzOQ=;
        b=NK1utirkl7wi+b9ZACSsp14RHtZI6jqKkf/+AHa6su3ptaLNkHjNlaSWCRi4T7Osp4
         mqI3ky/Xvc7W3msG6wvS9Pq/MqQjcHqfWQq+Jt2ozkgD65swWdYU/MjrCoVXhnoe751y
         8wnwGU8q83ngci/C8le085Hu8B6ZJ/YD9Nxy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690838380; x=1691443180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFf5b92AnxRPuHlO7uvs4bnJhBwkXOors4UhZ/XqzOQ=;
        b=avajzyjrvmLEZCo7meGunU/Aw5pnY8OPS3x/dIR7HbXuokmAkl1Bjci4jZSqvBi2vI
         obQSe0j6ZHVzj4pgdTtmtUYW6xAX7Q/Agbqj8ck98bQ3I24+8Yxq4XPua+SRTtu1CNyc
         XwTzgT6iWex0xOtfYRMr3/c8hWV3RucgG8oeYyZQObkURzUmGG6hlrVn6ecK94EAUdw0
         4C8/UdkT1IMwgY+t83vT5YG7IITxHGVaQKeA3efO19AsTwb6h4XMZjgYgiac2Yq43wf7
         gpgPQ58StlI27BGuvIIox/G2aVDHyWtb4y79B8AZZybiDfTbn/Wo/R1AB/sdXOTb9yqP
         1QQQ==
X-Gm-Message-State: ABy/qLZRtkQQRtzaUh8typcaDhIYa8T3qc8/8HQtRt3f1w/GjU6IbWI2
	rp0C2S8QaCMWXTneH2HKs5R7ow==
X-Google-Smtp-Source: APBJJlH/s/63u0znyS8ROq30EsCu9A1qjhcFRzWe6DCRIzxIHCBaK+dRFUcwMq0RtGRrHTY8HfWIBw==
X-Received: by 2002:adf:e105:0:b0:314:3bd7:6a0c with SMTP id t5-20020adfe105000000b003143bd76a0cmr663062wrz.33.1690838380598;
        Mon, 31 Jul 2023 14:19:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3b7:1714:595d:8417? ([2001:8b0:aba:5f3c:e3b7:1714:595d:8417])
        by smtp.gmail.com with ESMTPSA id s21-20020a1cf215000000b003fc00892c13sm12060992wmc.35.2023.07.31.14.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 14:19:40 -0700 (PDT)
Message-ID: <972083f47f3513fada3dc64c233f2c229f952aca.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v11][master-next 1/5] package_ipk.bbclass: add
 support for ACLs and xattr
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, Piotr =?UTF-8?Q?=C5=81obacz?=
	 <p.lobacz@welotec.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Alex Stewart
 <alex.stewart@ni.com>
Date: Mon, 31 Jul 2023 22:19:39 +0100
In-Reply-To: <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
References: <20230726092228.1005306-1-p.lobacz@welotec.com>
	 <VI1PR04MB5373AD2BB745671859678D699100A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <20230727141809d2150cbd@mail.local>
	 <17762A3A069807A3.31298@lists.openembedded.org>
	 <VI1PR04MB537349F74CD4C3E13B272B879105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <VI1PR04MB5373AB9F0C887CF659E739439105A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <CAJdd5GYifrOT_9-fct6TT95sw6tDe0L7etLxOcaEgTTGvWFPJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 21:19:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185171

On Mon, 2023-07-31 at 14:25 -0600, Joshua Watt wrote:
> On Mon, Jul 31, 2023 at 1:10=E2=80=AFPM Piotr =C5=81obacz <p.lobacz@welot=
ec.com> wrote:
> >=20
> > I=E2=80=99m sorry for splitting this message but it has happend by acci=
dent=E2=80=A6
> >=20
> > Returning to the topic my assumption is that for some reason in reprodu=
cibleA, these miliseconds are cutted and in case of reproducibleB they are =
not.
> >=20
> > This was obviously working for opkg-build in case of gnu format which i=
s cutting it also but for posix format it stores and thus error occurs.
> >=20
> > My question is where can I find the code responsible for moving/coping =
data into these packages-split directories?
>=20
> I suspect this is because reproducibleA is allowed to restore from
> sstate where the milliseconds are not preserved, while reproducibleB
> doesn't restore from sstate.
>=20
> I'm not sure how you would store the milliseconds in sstate and make
> sure it was consistent, but that is probably where you need to look.
> Start in sstate.bbclass

What is likely happening is that we have two cases:

a) do_package is run and do_package_write_ipk uses the files directly
from disk which has the millisecond data. do_package writes an sstate
tarball using tar in non-posix mode.

b) do_package_setscene runs instead of do_package. This restores the
tarball written into sstate in a). The millisecond data is therefore
lost. do_package_write_ipk would then be written without it.

I'd guess you need to make the sstate archives of do_package store the
acl and extended attribute data and when that is done, the millisecond
timestamp data will probably be saved too? I'm not sure this is going
to be a generally useful thing in the general case though and zeroing
the millisecond portion would really be easier in general if we could.
Certainly, SOURCE_DATE_EPOCH doesn't have millisecond precision.

Cheers,

Richard





