Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54EFCC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 12:49:48 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38684.1789130987096865063
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 05:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=K7v0SCg6;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso254029f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 05:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789130985; x=1789735785; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rCeISanKRgzJuKbeq5AXS1K3CHsfmnDyhXjkOjmZbLU=;
        b=K7v0SCg65UEn8tO2J7T1YTg3gSVozxY+f9E3svCEsJp/P0pxSATUhvQAGOfSUpj706
         0WG4ywHtwSSR8FDxblL//QwgODbQopPsXQv37xE5wSZOlWeRGE7VqjX3iUggc2W524w8
         RslbTwcFcvhC3g/Yd7UGNZpJXlN0D8Mi1MVfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789130985; x=1789735785;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rCeISanKRgzJuKbeq5AXS1K3CHsfmnDyhXjkOjmZbLU=;
        b=Mq57Aubwj6l7k08dOcHN4LpcFGNEVp4JVUfHCEMTMRPiFFeFcwN6BGJv5vfhfDQhm4
         3aodmMuqAq1auKm+N3AqpsCbxQAiOt9+90k13QMhqp/9UYjc/yPDrV52VfAS28mNGjxv
         LiDHz+OG+Ym1jSDynKqANKjjbq8UrWFB0X2Ab22lIu+s9k/PsQwXWoNkaXbaqnOmOStw
         nASBKDzzzwjqDgiZb2wVVt51KH9lGZBSdgcYtUjavtHg2gjqXjhhzRxZmPXNSyWstqtx
         eSpPkJFi85c0dQ/lRMP63mgB3C+5mgKh5e8nfTt3Fv7grKF3wal91fW2RJd0hUWsjSOO
         pnUw==
X-Forwarded-Encrypted: i=1; AKwUvBy2x+SWUj1lOd1lPU6KjzixNmEg4VEvtkSbCMCn+wyteS+vjIYGIomTmrnnKXK+0n0j2fs2hqU1yceKjcbV0EwJxg==@lists.openembedded.org
X-Gm-Message-State: AFuF++nLPiyrDU0JJobek45a9fcLgNa7NqZmExNrVwXqDDgSR1+/+YuB
	DoCLsZptdLTL0cnWqItmId9nh0WJTJhfVh9ma5tc23Wo6sITdQR+4y6ZIa1mC91IYd/lOg1274K
	1R9m3rsk=
X-Gm-Gg: AYBFou0GIcll081MfUk5vKZtWgdBcfdTbfJyv5/lMfJVF4fT0Pv9V39AvSKjSYD7+3i
	zEjL6xkncOrzcxQCa4Z13qruDcHtMt0ybsx8b1UVFGjXRAB7US0SxCdqa4uu9s+G/mbob/nIewJ
	PAhZiJ8tidBRLw3bBnW3wcHGL31kWG4rhRaNxZgV2MrEh4y4GxbW4Y07GmbXOAhkBNBdCQUdjWJ
	uDxQ3vR9qkORmf11N9t2DYWV6JL64w9M9SSpCagPkLlT+x0xcCxQVGhdAqE9hwxVeCL7bi5lV/e
	ROkfD4NeP49tKCy+DjLaHWl90r8PD/ubqZJCSGiq7ak6PgNsP62lj2Y4ZEfyi/sv4d9fSHHvc8R
	vF9hgWsrrGS8by/1A8g2QnGjSkCtN49qgZ+UiIkBs5CBqLWK8BHcU6L2n/kTCfH5eLcxnnv2KSt
	SgAmcm3Uh/hjn7Tfq+h30m6YfDZdNECzOK20LK2oHfT/9qrQbfTZMvooArh/OuZsEfiC5Lzv0HB
	1d934bKFOLj0toVtJuDAma3TMlp74JCgXE7JMDrYHkkYnnSNetRJLXaLpObw3c=
X-Received: by 2002:a05:600c:4f82:b0:49e:6836:5386 with SMTP id 5b1f17b1804b1-49e683654e0mr11133785e9.0.1789130985281;
        Fri, 11 Sep 2026 05:49:45 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaeefsm71654855e9.12.2026.09.11.05.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 05:49:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 14:49:44 +0200
Message-Id: <DLCI03E7XIUV.244KWPU4PD674@smile.fr>
Subject: Re: [OE-core][scarthgap][Patch 02/11] u-boot-tools: Ignore
 CVE-2024-42040
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hthakar@cisco.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <cover.1787731424.git.hthakar@cisco.com>
 <240b02378283bcfe760e1902a29fad5361fda380.1787731424.git.hthakar@cisco.com>
 <DLCHXHGCOH27.3OW22UEZ4WRRG@smile.fr>
In-Reply-To: <DLCHXHGCOH27.3OW22UEZ4WRRG@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 12:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245642

On Fri Sep 11, 2026 at 2:46 PM CEST, Yoann Congal wrote:
> On Wed Aug 26, 2026 at 10:12 AM CEST, Hetvi Thakar -X (hthakar - E INFOCH=
IPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Hetvi Thakar <hthakar@cisco.com>
>>
>> Analysis:
>> - CVE-2024-42040 affects the U-Boot DHCP client in net/bootp.c [1].
>> - u-boot-tools uses tools-only_defconfig, where CONFIG_NET is disabled
>>   [2].
>> - Hence ignore this CVE for u-boot-tools; the exclusion is
>>   configuration-based.
>>
>> Reference:
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2024-42040
>> [2] https://github.com/u-boot/u-boot/blob/866ca972d6c3/configs/tools-onl=
y_defconfig
>>
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> ---
>>  meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb b/meta/reci=
pes-bsp/u-boot/u-boot-tools_2024.01.bb
>> index 4b6d89ed4e..b5711e1f97 100644
>> --- a/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2024.01.bb
>> @@ -2,3 +2,5 @@ require u-boot-common.inc
>>  require u-boot-tools.inc
>> =20
>>  SRC_URI +=3D "file://CVE-2026-46728.patch"
>> +
>> +CVE_STATUS[CVE-2024-42040] =3D "not-applicable-config: DHCP client code=
 in net/bootp.c is not built by tools-only_defconfig, which disables CONFIG=
_NET."
>
> Hello,
>
> I don't think we need this because, even if the code is not compiled, it
> has been fixed earlier in scarthgap:
> See 5c086db3f44 (u-boot: fix CVE-2024-42040, 2025-10-29)
> Same reasonning apply to other patches in this series. Can you check if
> we really need those?
>
> Thanks!

In the meantime, I took 1/11 in my branch and held the rest (2-11/11).
Be aware of this if you send a new series.

Thanks!
--=20
Yoann Congal
Smile ECS


