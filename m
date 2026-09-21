Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B07FC982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 15:00:11 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50888.1790002804762209079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 08:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Dp/O9K5/;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso21014925e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 08:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790002803; x=1790607603; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrpE43V2nILH7FZtLDf0aB+3u5VX9XkybSgP0RRYJXo=;
        b=Dp/O9K5/fCPfWwP/arEetTHqraaVpmA+nRdcENiLcIxBx5rRYSfMPZxbZfDrcWG1Nm
         FG9Has5XzajInSoqxiQy1fpsWIEtoYU3xLhWPV6fjCkQm/Svz63f5q3k/2fp4EE3OKSV
         6vMwrYJuIZDtz6S01BM1yPS6qrTKKAJk1vITs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002803; x=1790607603;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrpE43V2nILH7FZtLDf0aB+3u5VX9XkybSgP0RRYJXo=;
        b=ISCkosY4OgrJDgEQneBJ8LsnvOswM33vovLGQEZAkiYcc9BY+UVbRIfa9KnjTzphx4
         Zn3FKiLC1DXyHbmC0YW3/wQrBMrMnadqg+3UPKW2vxZcyxf6ZJ/RY2A1CTieWpIb5xq/
         xYbikj1EIl1Ozw6j5OoJBBjSAUjCcVkcuTxkLwwW+JCCgSC9RTAABhKWVjNu1PhUU6x5
         0cJky8hJGZkvhjZtJqIFzVDmwWAArVq5Z5XL0nyxvJc/Lj5M4Op3QLNEss/g+IC0E0Et
         qBB+y0NOT6TeuiuL/Ssh+zW+ILZeSxMXI/bN00jbSwxX/a1VL+zt9a5plc7xBBqCIjQu
         gvIw==
X-Forwarded-Encrypted: i=1; AKwUvBx23WIvwMplOtZbBBg1eEGT+h32AYSY87fYSCSAJw8Exfw4BlLeMiqPezyER6Z6VMBiCcH+K2YPKB6PYjrH94QHHg==@lists.openembedded.org
X-Gm-Message-State: AFuF++lOJdDGbYooe3wEH6STJElxaLSyYpnn63tLmkoij7Rxi4LEIjaD
	omHimGxDz7WE9DOEbYeqAprzxLyXXKBZpSp8fmzE78y4e1pghgnonpQUGD5ZElfLwFMDp/NnsXE
	gdZ5wRNU=
X-Gm-Gg: AYBFou2Ap+UjhnlFZg+nLGzPGIPIpg1gpyrjEUOzQ1ExhipcVq4cS3kCMwyAMyDLvPV
	/P8M/BXmIWVK0BW4Q0MdY5iRudvDl2K3RJmzM5mkdvrqHhWup56i1OH5vpQH3jGZ46aBDX9KUrK
	7knNOFYxagCLebhk15/+MdFij4o0om7oNa4nuVATnTvvxDgR7JuthvDTf8C91CZlnfZzVbTKwX6
	N2u2XSo4P5P1ZCrg4UT/pXiJG1wmfNqrl6G/5UnznyGHKZvcPhRwvP3CtfP2aHdIZgmzWz0LCN/
	HMkX6R2Rjyw/JFa6jQ/q+AU2vE0G9K0X5k4cd7+pZXD3fjk3+loouywM+EvNhdqBPXtRISilxNw
	ZMPj7N3D4Ku9MQ0q5RfXYzWecBE4aSs7t8aD+UI70N2m3t+l7gZbg2XqtF7WBVfWleyXOxOHSXm
	ZTIFpnsDN9uCudZpKp2ImUzo+6L8LZJCi2zWRJZiUFU0gQDvLrkEuVWKz4KbshkAyIafPK4Jhyr
	zof4QrTN67EbN72rn9ZzXHpf2oS6iDJpIhpXJtgYMCKzktlJ01/qwtvxilkPsCe/Jj86A==
X-Received: by 2002:a05:600c:4e4a:b0:49e:6e94:7cae with SMTP id 5b1f17b1804b1-49fc5741495mr154615595e9.28.1790002802914;
        Mon, 21 Sep 2026 08:00:02 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bc34sm227288555e9.10.2026.09.21.08.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 08:00:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 17:00:02 +0200
Message-Id: <DLL31B54TO1J.3LKIGPOKP14DW@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for
 CVE-2026-86137
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <sdoshi@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260910200329.842463-1-sdoshi@mvista.com>
 <DLL00OT9VKC9.JRZSZU4BMX6L@smile.fr>
In-Reply-To: <DLL00OT9VKC9.JRZSZU4BMX6L@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 15:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246339

On Mon Sep 21, 2026 at 2:38 PM CEST, Yoann Congal wrote:
> On Thu Sep 10, 2026 at 10:03 PM CEST, Siddharth Doshi via lists.openembed=
ded.org wrote:
>> From: Siddharth Doshi <sdoshi@mvista.com>
>>
>> Picking patch as per [1], and same patch is mentioned in [2]
>>
>> References:
>> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-86137
>>
>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>> ---
>>  .../libxml/libxml2/CVE-2026-86137.patch       | 48 +++++++++++++++++++
>>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>>  2 files changed, 49 insertions(+)
>>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patc=
h
>
> Hello,
>
> It looks like something in this series is breaking ptests:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux86=
-64-ptest/core-image-ptest-libxml2/log.do_testimage.364096.20260921110838
> |  1314	Running runtest
> |  1315	Validation for ./test/VCM/21.xml failed
> |  1316	Validation for ./test/VCM/AttributeNmtokens.xml failed
> |  1317	Validation for ./test/VCM/v10.xml failed
> |  1318	Validation for ./test/VCM/v11.xml failed
> |  1319	Validation for ./test/VCM/v12.xml failed
> |  1320	Validation for ./test/VCM/v13.xml failed
> |  1321	Validation for ./test/VCM/v14.xml failed
> |  1322	Validation for ./test/VCM/v15.xml failed
> |  1323	Validation for ./test/VCM/v16.xml failed
> |  1324	Validation for ./test/VCM/v17.xml failed
> |  1325	Validation for ./test/VCM/v18.xml failed
> |  1326	Validation for ./test/VCM/v19.xml failed
> |  1327	Validation for ./test/VCM/v20.xml failed
> |  1328	Validation for ./test/VCM/v21.xml failed
> |  1329	Validation for ./test/VCM/v22.xml failed
> |  1330	Validation for ./test/VCM/v23.xml failed
> |  1331	Validation for ./test/VCM/v24.xml failed
> |  1332	Validation for ./test/VCM/v4.xml failed
> |  1333	Validation for ./test/VCM/v5.xml failed
> |  1334	Validation for ./test/VCM/v6.xml failed
> |  1335	Validation for ./test/VCM/v7.xml failed
> |  1336	Validation for ./test/VCM/v8.xml failed
> |  1337	Validation for ./test/VCM/v9.xml failed
> |  1338	file result/VC/ElementValid2 is 111 bytes, result is 227 bytes
> |  1339	Error for ./test/VC/ElementValid2 failed
>
> Can you look into it?
>
> Thanks!

This also fails on arm64:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577

Regards,
--=20
Yoann Congal
Smile ECS


