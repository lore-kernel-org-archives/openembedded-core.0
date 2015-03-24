Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D2A166AC33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 02:25:03 +0000 (UTC)
Received: by ignm3 with SMTP id m3so43983078ign.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 19:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=pPG99CUXEo+FN2spaXWEvBM/8kz/WNibL60lWBXIUJQ=;
	b=H28Cn3i3xBNNxMcsAzXKmm1K/fkcmdRsYmbrrIS1tQdm0iSMyaipbjov87JWSd3G8C
	nrF6Cutc9iuzlhoURXn6a9N1drcj0WDjFk0w24dJ1V0ryu6l33Mv3thCU/qI3tMnIJDS
	A6WYDFNpUMZ3l5+qLscffUbY6HF5fxj8C4qXdjelPCZuWBD+ExI77uNk2uoVOBVWfgfO
	hEnqeaKBCoE2m3aH8h2oGNEiJq14j7sbqVTSZXMfOsojFY6LXBu84Ql3olZzxVHIQjTD
	KC+xYyGKvJgPEcI3Hw/7phVdlzR43x0V1Io0ogZKoaOBrY9sPvDvjL3VtARNh0CdP0K0
	AR7Q==
MIME-Version: 1.0
X-Received: by 10.42.69.9 with SMTP id z9mr18555093ici.30.1427163905222; Mon,
	23 Mar 2015 19:25:05 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Mon, 23 Mar 2015 19:25:05 -0700 (PDT)
In-Reply-To: <1426066820-19627-1-git-send-email-B40290@freescale.com>
References: <1426066820-19627-1-git-send-email-B40290@freescale.com>
Date: Mon, 23 Mar 2015 23:25:05 -0300
X-Google-Sender-Auth: NsnZWe5SjxaoyN_sythHHqnNaN8
Message-ID: <CAP9ODKp=O30ACKGr8niGVg-ER6VxLwc32b5q6X5pa7eqP0F7iw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Chunrong Guo <B40290@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] u-boot.inc: fix rename image error
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
X-List-Received-Date: Tue, 24 Mar 2015 02:25:05 -0000
Content-Type: text/plain; charset=UTF-8

Hello Chunrong,

On Wed, Mar 11, 2015 at 6:40 AM, Chunrong Guo <B40290@freescale.com> wrote:
>   Resolve mismatch between U-Boot configs and uboot image name.
>   The ${S}/${config}/u-boot-${type}.${UBOOT_SUFFIX} may alway be false
>   and repeat compile or install so we need to check if ${type} match ${config} .
>
> Signed-off-by: Chunrong Guo <B40290@freescale.com>

First I'd like to apologize for the delay in testing it. Thanks for
your patience. I got some free time (waiting between builds) and
decided to check this ...

So build is working fine .. however we missed the version in the file.
This is unfortunate because if you end building two versions in a roll
in same deploy directory you cannot refer the old one, for example:

otavio@centrium ~/src/ossystems/yocto/build % ls
tmp/deploy/images/imx6qsabresd/u-boot* -l
lrwxrwxrwx 1 otavio otavio     18 Mar 23 23:17
tmp/deploy/images/imx6qsabresd/u-boot.imx -> u-boot-mfgtool.imx*
lrwxrwxrwx 1 otavio otavio     18 Mar 23 23:17
tmp/deploy/images/imx6qsabresd/u-boot-imx6qsabresd.imx ->
u-boot-mfgtool.imx*
-rwxr-xr-x 2 otavio otavio 379904 Mar 23 23:17
tmp/deploy/images/imx6qsabresd/u-boot-mfgtool.imx*
-rwxr-xr-x 2 otavio otavio 379904 Mar 23 23:17
tmp/deploy/images/imx6qsabresd/u-boot-sd.imx*

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

