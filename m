Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81184C43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 07:02:06 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.39427.1656313323904650789
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 00:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=FSENzrOT;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: sean@geanix.com)
Received: from [IPV6:2a06:4004:10df:1:413:afe0:5183:34b6] (_gateway
 [172.25.0.1])
	by first.geanix.com (Postfix) with ESMTPSA id 5C6E9E91C7;
	Mon, 27 Jun 2022 07:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1656313320; bh=wq+NYWLDaYl3cVZL48BXsdhW14oQQ/sOhVuBi/8pZkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=FSENzrOTuUbH2vkMeEX4dx65I1P7S+gmQrkLnwCKuFkCh9pVSF//TJSjoluxXMx8I
	 CLANqgfkw2fblqVF8lGC9RRr/sMYow73ULFyz71yO4nlfmYGyqZeX5Todg3Ci8NgyT
	 q4Nx0e8I8E54Dx9KTCgJpCVG6fIz6jsmL4I8eJTCEl3DFQySh36Isc69vrPP3Vcj0K
	 YAN1bopnHFFHX/P7J1izKG8hMOrFttfsDt4J5olztbTkcXYPjefmOlZGRQu8Nka2sU
	 dP4nJSR4qqJaOpgY2j49Caf7yTA1c2Y71PNY8Rrxxjzyhak9GsK6XLBtAadKymjTx5
	 yo3xcD4QSkh2g==
Message-ID: <9b7045c0-2689-ed39-de85-474c5af05632@geanix.com>
Date: Mon, 27 Jun 2022 09:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [OE-core][PATCH v3 1/2] cve-check: add json format
Content-Language: en-US
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Ross Burton <ross@burtonini.com>,
 Marta Rybczynska <marta.rybczynska@huawei.com>
References: <20220329125432.78608-1-rybczynska@gmail.com>
 <86367787-69bc-5828-8d15-f58872e21e14@geanix.com>
 <CAApg2=S3MknmJhLqkXo=ynq+TY4pbNyBBtskgpB0Fpdn_Dic-Q@mail.gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: 
 <CAApg2=S3MknmJhLqkXo=ynq+TY4pbNyBBtskgpB0Fpdn_Dic-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 07:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167313



On 21/06/2022 15.06, Marta Rybczynska wrote:
>=20
>=20
> On Tue, Jun 21, 2022 at 12:45 PM Sean Nyekjaer <sean@geanix.com=20
> <mailto:sean@geanix.com>> wrote:
>=20
>=20
>=20
>     On 29/03/2022 14.54, Marta Rybczynska wrote:
>      > Add an option to output the CVE check in a JSON-based format.
>      > This format is easier to parse in software than the original
>      > text-based one and allows post-processing by other tools.
>      >
>      > Output formats are now handed by CVE_CHECK_FORMAT_TEXT and
>      > CVE_CHECK_FORMAT_JSON. Both of them are enabled by default.
>      >
>      > The JSON output format gets generated in a similar way to the
>      > text format with the exception of the manifest: appending to
>      > JSON arrays requires parsing the file. Because of that we
>      > first write JSON fragments and then assemble them in one pass
>      > at the end.
>      >
>      > Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com
>     <mailto:marta.rybczynska@huawei.com>>
>      >
>      > ---
>=20
>     Hi Marta,
>=20
>     When upgrading from honister to kirkstone, this patch was included.
>=20
>     We have INHERIT +=3D "cve" in our distro conf.
>     When doing a build from scratch it works fine with the cve json out=
put,
>     but when doing an incremental build it will throw:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error("Error adding the same packag=
e twice")
>=20
>     I have tried modifying that line to:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error("Error adding the same packag=
e twice. Offending
>     package: %s" %
>     product["name"])
>=20
>     It looks like it tries to add all packages again...
>=20
>     I have just disabled json output for now.
>     CVE_CHECK_FORMAT_JSON =3D "0"
>=20
>=20
> Dear Sean,
> Thank you for the report. Could you please describe your configuration =
a=20
> little bit, especially, which layers do you use? Do you do an image=20
> build or a world build, or maybe a multiple image build?
>=20
> I'm trying to imagine what is happening in your case, will try to repro=
duce.
>=20
> Kind regards,
> Marta

Hi Marta,

We are using:
meta-clang
meta-intel
meta-openembedded
meta-rauc
meta-security
meta-virtualization
poky

We are building an image :)

I can try to see if I can reproduce with a core-minimal-image, but it=20
will have to wait until after summer...

/Sean

