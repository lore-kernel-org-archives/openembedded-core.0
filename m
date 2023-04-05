Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B39DC7619A
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 12:29:38 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.128501.1680697767914914941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 05:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=xFcvjw13;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AB33A85DC9;
	Wed,  5 Apr 2023 14:29:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1680697765;
	bh=k2S5PcdoLjgNPJi4zXXHKl25pZ4IotVXd03SdStD1nQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xFcvjw137BPYlJTlIR0EC9xP/ExU0xfRVUMvVDkYf8Dh9FERSg3vgb+q+911A4rV9
	 Vur7LN0wavSmro7VEMbsBJlKskBcYTmyyicLLrFZLu7Nu9nwBurXJih1/dbUf5dD02
	 Rkea1+xCu6WTL3ixrT7jvpnB2wA1DvucFAACKBlAn4fW32NWSlIa6HAmSIfewM+BMu
	 EMmZNoCuxTnXvmCejF45IJ6c4iDzPXuTTVPPJUqlIfo9vhKb4G8706AWD8FqmdXSCQ
	 SX+W/zyZ0TVnOj3paRi5/p+NytLAkQG2wP1lWGmwnxY9hzScqEYF+hfy1Vho6cRSNH
	 bl/e2J54Z8mUw==
Message-ID: <4868dfb7-b70d-ad1a-6107-1b95e918660e@denx.de>
Date: Wed, 5 Apr 2023 14:29:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] yocto-check-layer: scan additional layers for tested
 layer dependencies
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230404213605.170461-1-marex@denx.de>
 <CAP71WjyQOZNY5bnDkN33_nCfv8R3MBVb+MGDX1A1F+Jfg-m3_g@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAP71WjyQOZNY5bnDkN33_nCfv8R3MBVb+MGDX1A1F+Jfg-m3_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 12:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179735

On 4/5/23 08:48, Nicolas Dechesne wrote:
> On Tue, Apr 4, 2023 at 11:36=E2=80=AFPM Marek Vasut <marex@denx.de> wro=
te:
>=20
>> In case a LAYERDEPENDS of a tested layer contains a dependency which i=
s
>> present in additional layers, such dependency does not get pulled into
>> the layer test as a dependency be default and instead of YCL stops and
>> reports it cannot find dependent layers.
>>
>=20
> Hmm. I know this script is slightly (!) convoluted.

Well ... yes.

> But I think this is done 'by design'. Since you are expected to list al=
l
> your dependencies with --dependency when you are testing a layer.

I am not sure that is correct. I believe the script is designed to=20
attempt to look up the dependencies of a layer automatically. That is=20
what the --additional-layers parameter is for, to specify the search=20
paths for the automatic layer dependency lookup. The --dependency is=20
there to hard-include a layer in the test, e.g. in case it cannot be=20
automatically detected because that dependency (layer) is somehow not=20
resolvable.

At least that is my understanding.

And the result then is, you can have a directory with various layers,=20
but the YCL with --additional-layers pointed into that directory will=20
only pick the layers which are really required for validation of that=20
tested layer, not the rest of them layers in that directory, which makes=20
YCL runtime shorter . And that way, YCL can be used to test multiple=20
arbitrary layers, which is useful in CI.

>> An example of this is a layer with LAYERDEPENDS =3D " core openembedde=
d-core
>> "
>> and then by running YCL on such layer using the following invocation:
>> $ yocto-check-layer -d --additional-layers ../meta-openembedded/ --
>> ../meta-board-distro
>>
>=20
> In this specific example, you are supposed to use --dependency
> ../meta-openembedded instead of --additional-layers, no?

I don't think so, the YCL should auto-lookup and auto-add the layers=20
into dependencies from --additional-layers. That is my understanding of=20
what --additional-layers is for, to do the auto-lookup/auto-add without=20
having to explicitly list the dependencies on command line.

> --additional-layers (see 31e53430f1bb6f73b82698b20ef7f1047313214a) is
> supposed to bring extra layers when parsing/testing to mimic a full dis=
tro
> or to manually force optional layers to be present. But --dependency is
> still required to contain all potential dependencies.

Errr, uhhh.

That is really weird, the first question which comes to my mind=20
regarding that commit message is -- why not use --dependency to cover=20
those use cases listed in the commit message.

The second question which comes to my mind is, why does the=20
additional-layers do automatic layer look up (based on LAYERDEPENDS) in=20
the specified additional-layer directories, but then fails to actually=20
add those layers into the build during the test (I think maybe that is=20
what I am solving with this patch, without describing it well).

Well that turned out to be a wall of text too, sigh ...

