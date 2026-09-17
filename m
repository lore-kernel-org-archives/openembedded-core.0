Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31DA0C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 21:13:13 +0000 (UTC)
Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3143.1789677517758166103
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 13:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=eSiDGn1k;
 spf=pass (domain: baylibre.com, ip: 74.125.230.140, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-910531ea7feso1180516d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789677516; x=1790282316; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eKhTiYYFTq9CrUbZrpk/axjfuZ7eCNHtLdWeXrgni7M=;
        b=eSiDGn1khLn2kPG74AS6aw/lV5RXPPwfzKS/9oQspgWCYzitcicJrTuiAKnzlHlPNk
         +guosvA3yyoqsHQmOJcSr3Pgur5o/t8nF4orJVb9Lx5joliahyLVNLg7kQgFrHHeZ1RE
         TgVEviQ9psK5LViP1WDtvGs4CKouN5nxBu4arxW53XvQInlBWxFaJ5s6M0K3x/1pV7yV
         +QcnEUtw305kXdPLPPveILvo9DcHwtza1FNwwQ2vx7wZzlf1h2J/8IaQEinPFYtTj/Qg
         WZKH7jUzMLreN3DjkASMMKKv0jfXJuM4p80x0UKEBbalF7LRxzckGkR9ASlEvGvAuhEi
         kqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677516; x=1790282316;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eKhTiYYFTq9CrUbZrpk/axjfuZ7eCNHtLdWeXrgni7M=;
        b=aGbPUHt+MsXhbeBXfOns/rjWuKPbXzODmDCn/ojw4afxkRS0eYCGNcEKpxTfrkmuxh
         oDJHK5PVIfSvy6905tvO8kx0qa5ySd6ip9RhCCZGET55ToMTc/dSROxBI3newVjnasCL
         /rv86BufXLRNdz1O5XRESgQKebs7KueVsIe0HFrTajxDq9Uk+4rqdOM3V64yPISAAZR2
         THmmy6e5KzoZrxnmdrp2KvuLaY/ppjjVXn7AkPhoSOGLKZdWb6eEbxfzmrTX4baKKI30
         XaWyeO6Xxzurz94fIyKzmGqZFVoecM4wlXEVkaBmopG6dNHyNC8vD82ZSw1L/+9RFKI8
         wcZQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu1i7uE6y6/S5aw8op0WwHDcqEjvSg6Opy5GeSky6NuE3c+rRdlxqrnCnCT/AvYBSlgOD4UoBOwpU+c9WgHxFrlQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n0Q/tus47lnF4Aghu6TseHeza+wVjJxzb6od92KVzr4WMWBWbn
	4ixVj4pcE4pgq+NWrffMmCzNIjcuNRyAaNaddP8739KAYzlBaS/PulfG73oPfSCpmwY=
X-Gm-Gg: AYBFou0pjAHynh+9ytp5K+7e8hP1I4eHzhx0KxxXjaw8x/MxSlTm6bSgmqBnP1Olcod
	cOf0jPLUF04+W23tQJ7YwXOEFQ60OSL9PrxouNH9q2G6nRD2crMKgA8R1YjgCE6bBeRs6mqzy9A
	Et0BfTCzvC/6YuU7Prf/xtNEb5lOCAdS2+GhskBShljd1OaCTvQZAegr+BMQQq4e9IjrarGXYX0
	eOhTgrh9UCLUxelQYNFTXm/p01rBOQkOKOghkWBGFeWIkmT63BRpe4iKN4B1yT/qmJK1EmAAjm0
	y23IYgbG130syadOQXhKLmBh36J3O52Ssq9KY70k12Uk3hJRJhf8iCbqyyLoKxlr+PjVUcpwSI9
	nGuy681h/0Etgn9f1J4Fe+OHD0OApWzFCMIQs/Mw8blelb/N83HHMXBGuwFI1HNrx4voYbL4Moa
	HPSiFfT4W+39zvN5z6XedyA+9l1rDHktbyH30PqzDIHc8vUvlwjvu6odhjanOSgPTTeAOJeVC3n
	7v2xpM09mlU7MYzArcPwL+/M+FNRRUrSQ==
X-Received: by 2002:a0c:ef02:0:b0:912:518f:5150 with SMTP id 6a1803df08f44-91254cae691mr5977596d6.59.1789677516484;
        Thu, 17 Sep 2026 13:38:36 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91252d2b826sm6268376d6.47.2026.09.17.13.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:38:35 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 17 Sep 2026 16:38:33 -0400
Message-Id: <DLHVQBRWWOF1.2PKU3CWY21S6J@baylibre.com>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [wrynose][PATCH] qemuriscv.inc: use fw_dynamic.elf as BIOS when KERNEL_DEBUG is enabled
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <tgamblin@baylibre.com>,
 <Harish.Sadineni@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.22.0
References: <20260916121517.1513695-1-Harish.Sadineni@windriver.com>
 <DLH071QT0TBB.7KZL5MFA90WQ@baylibre.com>
 <DLHEG7H935N8.2JKMAZRCTBS17@smile.fr>
In-Reply-To: <DLHEG7H935N8.2JKMAZRCTBS17@smile.fr>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 21:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246090

On Thu Sep 17, 2026 at 3:06 AM EDT, Yoann Congal wrote:
> On Wed Sep 16, 2026 at 9:55 PM CEST, Trevor Gamblin via lists.openembedde=
d.org wrote:
>> On Wed Sep 16, 2026 at 8:15 AM EDT, Harish.Sadineni wrote:
>>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>
>>> QEMU RISC-V hangs (qemu hang-up) when using fw_jump.elf as the
>>> default BIOS while kernel debugging is enabled. This has been
>>> observed with the 6.18 kernel (exact version where it was
>>> introduced is not known).
>>>
>>> As a workaround, switch to fw_dynamic.elf when KERNEL_DEBUG is
>>> enabled, which avoids the hang and works correctly with debug
>>> builds. The default behaviour is unchanged and continues to use
>>> fw_jump.elf when KERNEL_DEBUG is not set.
>>
>> It'd be good to understand exactly why this doesn't work and what change=
d
>> upstream. I'm looking into it in a local checkout, but I probably won't =
have an
>> answer for a day or two.
>
> Thanks Trevor!
>
> Harish, this patch is for master isn't it?
> If that's the case, would you mind resending it witout the [wrynose] tag
> so it can be picked-up there?

One of my colleagues recently ran into a similar issue working on meta-cher=
i,
and remedied it in the same way:

https://github.com/CHERI-Alliance/meta-cheri/commit/c81a323888357acc1ee244f=
bf8f23df4b1c1288b

I went and compared kernel image sizes across four configurations:

|6.18:
|
|lrwxrwxrwx. 2 tgamblin tgamblin  1M Sep 17 13:51 Image -> Image--6.18.52+g=
it0+9e9d8b1f91_08edce0ecd-r0-qemuriscv64-20260917173344.bin
|-rw-r--r--. 2 tgamblin tgamblin 27M Sep 17 13:51 Image--6.18.52+git0+9e9d8=
b1f91_08edce0ecd-r0-qemuriscv64-20260917173344.bin
|
|6.18, KERNEL_DEBUG =3D "True":
|
|lrwxrwxrwx. 2 tgamblin tgamblin  1M Sep 17 14:08 Image -> Image--6.18.52+g=
it0+9e9d8b1f91_08edce0ecd-r0-qemuriscv64-20260917180541.bin
|-rw-r--r--. 2 tgamblin tgamblin 33M Sep 17 14:08 Image--6.18.52+git0+9e9d8=
b1f91_08edce0ecd-r0-qemuriscv64-20260917180541.bin
|
|7.2:
|
|lrwxrwxrwx. 2 tgamblin tgamblin  1M Sep 17 14:33 Image -> Image--7.2.6+git=
0+b5d69636e3_d8a1ec518a-r0-qemuriscv64-20260917183100.bin
|-rw-r--r--. 2 tgamblin tgamblin 27M Sep 17 14:33 Image--7.2.6+git0+b5d6963=
6e3_d8a1ec518a-r0-qemuriscv64-20260917183100.bin
|
|7.2, KERNEL_DEBUG =3D "True":
|
|lrwxrwxrwx. 2 tgamblin tgamblin  1M Sep 17 14:15 Image -> Image--7.2.6+git=
0+b5d69636e3_d8a1ec518a-r0-qemuriscv64-20260917181151.bin
|-rw-r--r--. 2 tgamblin tgamblin 33M Sep 17 14:15 Image--7.2.6+git0+b5d6963=
6e3_d8a1ec518a-r0-qemuriscv64-20260917181151.bin

It's no surprise that turning on debug increases the image size, but it's a
little weird that 7.2 is fine when 6.18 isn't. My guess is that the content
where the FDT would overlap is different. I took the time to try a memory
dump from the QEMU monitor in the hanging case, and I could see the FDT mag=
ic
string where some kernel data should be:

1. Do 'runqemu nographic snapshot'
2. CTRL+A then 'c'
3. Do 'pmemsave 0x82200000 0x2000 dtb_dump.bin'
4. Inspect it like:

|tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64/build $ od -An -tx=
1 -N16 dtb_dump.bin
|d0 0d fe ed 00 00 35 ec 00 00 00 38 00 00 23 e8

'd0 0d fe ed' is in the kernel's scripts/dtc/libfdt/fdt.h:

|#define FDT_MAGIC       0xd00dfeed      /* 4: version, 4: total size */

The debug case (or other kernel customizations) may increase the kernel ima=
ge
size to the point where we risk this overlap. I could dig a bit further, bu=
t I
think it's safer to use fw_dynamic.elf in general, starting with master. Th=
ere
needs to be more info explaining why we did it though, both in the commit
message and as a comment near the change.
>
> Thanks!
>
>>
>> Trevor
>>>
>>> [YOCTO #16409]
> FYI, I have not seen this specific error on wrynose (kernel 6.18).
>
>>>
>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>> ---
>>>  meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> Regards,



