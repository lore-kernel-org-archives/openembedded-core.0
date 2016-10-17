Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id AFBB860722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:14:56 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 130so6363381vkg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4Tq6jeLcxkS7HtHfNLT3+dZPTRuDwuqT+qArHZy8CpI=;
	b=cYNtWZE3HWUPO1vV6uHA1oS+NfSWI0squPj/gbJGdAOnUqWd7h2KGhh+THljPrFN9+
	grMuOAASUXBzLFpU+YAcQEWSBKvCnDYtZmII+1cYsA+mm8wJLZz+XUuyEPUDeVas/A/O
	lSP7xRe6Zau7zsC0GS8l1rx6WW1xXGK1u8Gp6nr+yqrESDqZFIyx9BTOSdZtkZ4C9eyM
	/VpRaamC5wAGAtqO3tV0hAwqbDcPAWvcVkJbQDnoKkwwunX+Qrgg+a1Lc73q4b04N/oT
	Z0+vzzQyjB+TuMBbbobkWIglBve28flXYVh9ctqtL3okQPHyqPSp5NgiOLeIk0PPknTj
	tJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4Tq6jeLcxkS7HtHfNLT3+dZPTRuDwuqT+qArHZy8CpI=;
	b=U0mBidSJBcU+FRhHVWwYcXMlaoOfMSKYNZnIwiC835bOIDrYdjBUlDnN8Vgv0cDFk8
	BDWrJ3a1YXyMyGTP2llYk3BX7mVC1q1OIwhU9HgBINsn62U38U4ldVfM330pSCAmFDXC
	+Wgree6mEkEDUNBLUEMvG9hSPGEOPCtlN25bcpB3Kp1O6xgWlFPqYkGe5l9f/8iffI2a
	xxDSupJ+CHz+eK6ZlQebeFNIu/BS+1HYzp6NMqorjyDZMCiYzBm1A9boiTtGiKMkDIC3
	BYSyWh5mz4Ip/on4y8Whf3VVNgO2kO9dg5ENmVSFXRq4WNMHRiop8u86HZoeFVpckjwi
	LU6Q==
X-Gm-Message-State: AA6/9Rm2DX4h9vt9TwF4CUUo+Reb1YV8OMILcEciRTReiSSZR9WQrfOtr9Yrvms1lPyGHzoJtS9ZwFiuPQy2XQ==
X-Received: by 10.31.0.67 with SMTP id 64mr19621037vka.173.1476746097726; Mon,
	17 Oct 2016 16:14:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 17 Oct 2016 16:14:27 -0700 (PDT)
In-Reply-To: <F0D56DD8-329C-40A5-B003-250DB3BB81A3@victronenergy.com>
References: <F0D56DD8-329C-40A5-B003-250DB3BB81A3@victronenergy.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2016 16:14:27 -0700
Message-ID: <CAMKF1srFie08u82rhripcO9_pUnJ=JiP9_G6w97COriZ=SAe-A@mail.gmail.com>
To: Matthijs Vader <mvader@victronenergy.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: udev/mount.sh: use lazy umount
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
X-List-Received-Date: Mon, 17 Oct 2016 23:14:57 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 10, 2016 at 2:45 PM, Matthijs Vader
<mvader@victronenergy.com> wrote:
> Hi,
>
> umount will fail if there are processes accessing files at the device, use
> lazy umount to avoid this problem.
>
> I found this patch [1] a long long time ago, but don't see it in master now.
>
> Any reason why it was not accepted? Is there any harm in using lazy umount?
>
> I know that it is not a 100% solution, and that it is best to make the user
> trigger an umount before taking a card out. But that will not be done every
> time.
>
> And without lazy unmount, the device will never be unmounted, causing the
> next mount (triggered by an insert) to fail as well.
>
> See also the discussion on our own issue tracker [2].
>
> [1]
> http://lists.openembedded.org/pipermail/openembedded-devel/2010-June/066241.html

I guess we missed it when we started OE-Core project out of classic OE
if you prepare and send this patch to OE-core after reviving it. I am sure we
will take a look again.

>
> [2] https://github.com/victronenergy/venus/issues/59
>
> Best regards,
>
> Matthijs
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

