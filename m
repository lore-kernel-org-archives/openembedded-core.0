Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C26AD61921
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 21:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48WYM80qLhz4Q;
	Mon,  2 Mar 2020 22:34:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1583184884;
	bh=N0itO8jtec5K6Eqty6otpt+HCTpsSgrQM3otlIKgBUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hsFNpw7SGylgdEwyFEef3S3vUmmqGgVyRzpvJ4BPQlcoU284qoz7j8H7Z7WN4KVtj
	zUv3AsbY7wObVG3kGNYiT0CaepGvXpqQyXzh0rEvXlkQP2zE/I62nx7TyjojI5Rjj/
	5x5Xt7rKeqet0W+Qg+vd7Ji+kyt4B3I1g4xlTpktdNuRzA+6WX/XnK1Pd4xhFoURrp
	fDI60C1/a99lTMVTiipDCqBC3giFkm2xnr6EHNauWSOzSvb5qEqdf9fcBBMhGX3h17
	jraoK3bWyc73awJJgGaz1pdL/KtmoJ4hk6/4z7sQoVvIyQpTylDds7a4dRGkhB7UVV
	j/HSP6MMprIua7gTHE2AxfZ+P1MZyQCr5Q1FsRC65Ss4aUAaszEojaahLO9M2P6EEG
	LscX1/i0OhZqrPxUEgm7OxNkYiiqetImrrx53pWerP0oox6t6KzKnfHOarGajB+UMK
	y842dbOhTkssHCzaQqYMTpn3H0c9bCMbkYqUs6pUA2Y+OZUDNEwxcM0W1bbfueb2hj
	Wn0HJ3UxZt/bG1TCMN2p7gV20jvJCqJHNeXTm0BmPJ+D/sBbX4fa6OTtqKwj8Tfu3t
	qEnCbAIZO4s9l2USO4igtAob4tUdCP9MAp5w2Sq3o0Rn3JSW3L5x7unsPV+/jKTZq8
	PsDTukRqzfKvxYKrFqygU4Lc=
Date: Mon, 2 Mar 2020 23:34:41 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200302213441.GA13148@localhost>
References: <20200302171153.28030-1-zhengjunling@huawei.com>
	<666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <666b3145-0e57-cf3c-f1f4-22d6fd0521e5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: wangnan0@huawei.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] arch-arm64.inc: Do not append aarch64 in MACHINEOVERRIDES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2020 21:34:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Mar 02, 2020 at 10:29:37AM -0800, Khem Raj wrote:
> 
> 
> On 3/2/20 9:11 AM, Junling Zheng wrote:
> > Currently, for arch-arm64, poky will append the MACHINEOVERRIDES with
> > "aarch64:", which has the higher priority than TRANSLATED_TARGET_ARCH.
> > So, for aarch64 big endian, the variable '<foo>_aarch64' will override
> > not only '<foo>', but also '<foo>_aarch64-be', thus we will get an
> > incorrect variable.
> > 
> > Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
> > ---
> >   meta/conf/machine/include/arm/arch-arm64.inc | 2 --
> >   1 file changed, 2 deletions(-)
> > 
> > diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/machine/include/arm/arch-arm64.inc
> > index 53f4566815..32294bd218 100644
> > --- a/meta/conf/machine/include/arm/arch-arm64.inc
> > +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> > @@ -4,8 +4,6 @@ require conf/machine/include/arm/arch-armv7ve.inc
> >   TUNEVALID[aarch64] = "Enable instructions for aarch64"
> > -MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', 'aarch64:', '' ,d)}"
> > -
> 
> if its removed here, where is it being added for other machines, question
> is, should we treat aarch64 as LE equivalent of aarch64_be
> or should be treated as common aarch64 and a new define like aarch64_le
> defined.
>...

As far as I am aware all other distributions and config.guess are 
treating aarch64/arm64 as little endian and 64bit, unless suffixed.

cu
Adrian

