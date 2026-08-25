Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F940C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:23:47 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31651.1787689425548518926
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ShIge549;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e2904915so136180f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 13:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787689424; x=1788294224; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U6bAAvdrVOGUXZdfRwJQfCDhOUT/Jh58swmlp3lmogY=;
        b=ShIge549t5RGkcuTK8+IfdDsg87kAmr0+YDB0IDVADHZU84huyDkaKgAVfHSHS4UPQ
         5VI5s2o6fMb9IWgCF28Z8U+7mQtsIuwsBCRrMAo2adawKawAk00JFkP5gqNFe0KfiWLf
         PaXqwdebowNdPHpQlF0g4jMztGWrkPOgZ1bHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787689424; x=1788294224;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U6bAAvdrVOGUXZdfRwJQfCDhOUT/Jh58swmlp3lmogY=;
        b=C54gAH/tqfr8J8BVc8pHg6DbsR6PxbZZ4a3ZOpwmayoPYqmAWKasIomv2h5belsvuj
         kVjy+3LCOFOU14a2S5m1kkJYF293Dd8uYf2hkL9EXPdGxQjBW1v1DKrzKwKmNM2Onyko
         L8VLAKTXQr2+OLgXGrfx8cFo+Ucav13E1GXSEDXAgmnAgfZ5+9uEyT+GkITBcte1Xi8G
         o1Fo0cW4b+a4L1X19vL7ygNGc7robI30oT4vI+CIc231kW+TEb5lKuRw5Hg5dXjctrVZ
         ibokbvQrs1f57Kjcctm4q6HsN1LfcOqECQzf2L8trbjY3u38ZGOxvQRWYi4OL4XWkYQh
         Rj8g==
X-Forwarded-Encrypted: i=1; AHgh+RpIWx05gS3DpHv/yovh43kTDFA6BWBRnplBIgVd3uUU1VDKNNA0OjLNrkY8Jikw8Jbbu87IulWSwXx4GzA8E+pb5Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++lR4CD9LvAxPSBL8swFOQ1RHTWRICbrKrrxpVE8xTAxDcMdLGqr
	y6w6Ttm3/qKcz+ZM4zErrb3ZiCA5nubD3lQRGT20+VHSKSVCEvhJwSFxTuS3fCb3uQg=
X-Gm-Gg: AR+sD13a6FAenpYM8+6stcPv6kSLQf8o3+bGkm2lPEGF0x6WiF0kXMYILHxxmNC1ddM
	Xet8tw+cR2oH0VKPmHk0vbXfHzHf4gySEQTqxBhnIbk2YJrWVpXB2nz2IJ/OPPOyWjDQxHYCxPN
	H8eRrnQM9jQh3CL4jbFacrHn8nO+u6YHjZuTqBYmu8PYllEygzBWAe/BbHExeBwVestVPPkOGeJ
	tjhIMoyBKuWb3RtlP8p7Ng9/Moz44/3ztKQsDAUgsq3e9TAByRjyMdB3G/79AETk74jEa7tYw/F
	96bAI6mtAQSkTbENncZJwF4DiQZ4gSg8r7/vfDUQR3nY4CcN7YRb6fQ7XUyHx1ChUaA5R6AHS0f
	CLMpep0D0Bta+70nOv7jnrgZehAhgr+9UF0C2jt1qBpWVh27VzEJkeX7XN9pmdigorozQZ1mM8W
	0Qv8WWiqIYaNj0IxxRhMV3UoL+YcHn6qcmugCWGHC2hod/yzixNALCqIUiccRfN3qxrilsHAXZo
	0UpmAtD0buPaub8pi9HJvLBx40+Hs2kGPjm5a60m7Y2Wy8oIzI=
X-Received: by 2002:a05:6000:989:b0:481:512c:b6b3 with SMTP id ffacd0b85a97d-482e2693a43mr2146204f8f.3.1787689423673;
        Tue, 25 Aug 2026 13:23:43 -0700 (PDT)
Received: from localhost (2a02-8440-b502-b60d-93f5-be80-aa62-9351.rev.sfr.net. [2a02:8440:b502:b60d:93f5:be80:aa62:9351])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab1f3sm522259f8f.11.2026.08.25.13.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 13:23:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 22:23:42 +0200
Message-Id: <DKYB0FAPAJFD.215VGCBV1PA2B@smile.fr>
Subject: Re: [wrynose][PATCH] kern-tools: bump SRCREV for conditional
 'depends on X if Y' support
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Wadim Egorov" <w.egorov@phytec.de>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260825132319.3151755-1-w.egorov@phytec.de>
 <3c09a2a02c36ae3934b533c2cd727d7d4faa44e2.camel@pbarker.dev>
In-Reply-To: <3c09a2a02c36ae3934b533c2cd727d7d4faa44e2.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244273

On Tue Aug 25, 2026 at 8:09 PM CEST, Paul Barker wrote:
> On Tue, 2026-08-25 at 15:23 +0200, Wadim Egorov wrote:
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>=20
>> Pull in the yocto-kernel-tools fix for the kernel's conditional Kconfig
>> dependency syntax (kernel commit 76df6815dab7, first in v7.0). Without i=
t,
>> do_kernel_configcheck fails on v7.0+ trees once a config uses the syntax
>> (drivers/hv MSHV_ROOT):
>>=20
>>     drivers/hv/Kconfig:77: error: couldn't parse
>>     'depends on HYPERV_VMBUS if HYPERV_VMBUS': extra tokens at end of li=
ne
>>=20
>> This SRCREV also carries the symbol_why.py/kconf_check audit hardening
>> (surface parse failures instead of swallowing them) and the new hermetic
>> Kconfiglib self-test.
>>=20
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> (cherry picked from commit 4f592ee59e90e536af33648112658dafe00f5d0e)
>> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
>> ---
>>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/m=
eta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> index bd90316050..2e13e4ca31 100644
>> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
>> =20
>>  DEPENDS +=3D "git-replacement-native"
>> =20
>> -SRCREV =3D "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
>> +SRCREV =3D "96a8d58bcd260f104c193a81b727818424d7b263"
>
> Hi Yoann,
>
> I think this is worth taking on wrynose as it allows BSPs to use more
> recent kernels if they need to. The delta in yocto-kernel-tools is
> relatively small:
>
>     96a8d58bcd26 kern-tools: add Kconfiglib self-test
>     e31601535ff9 symbol_why, kconf_check: surface parse failures and add =
a parse self-test
>     b5f008535c85 Kconfiglib: support conditional 'depends on X if Y' depe=
ndencies
>     d30ab1a7626b kgit-create-buckets: update classification for 6.19 kern=
el
>
> The self-test suite won't be used, surfacing parse failures is a bugfix
> and the last two are the ones needed to support Linux v7.0+.
>
> Best regards,

Thanks for the ping. I've put it in my next wrynose branch.

Regards,
--=20
Yoann Congal
Smile ECS


