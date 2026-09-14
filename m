Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97771C88E72
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 14:05:16 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21032.1789394708263299968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 07:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jXYsPgvj;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so1279919f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 07:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789394706; x=1789999506; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OBwwAAvcpjVP0V/4tNLeUIfXi7VkcVEa0wjHHQKnpMw=;
        b=jXYsPgvjXk8jdTlLNjBMoLD9bdaYX6x/P/fnz7Ng/RxJamby8/g0o0LPyQH78RQfAu
         vKzhTPVmQJ8EKpfkslni+KnAJvXvf08ZioikNP04+gaHvCMbBpurGPuoRV5zMti1vWMD
         BQyQgZ+21Qcd+KSG3+4fNxKZVq0EQiRZ3EEjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394706; x=1789999506;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OBwwAAvcpjVP0V/4tNLeUIfXi7VkcVEa0wjHHQKnpMw=;
        b=CW5HAVkPaDfJBWmVbR1Udh6+Rdgv9xrY7RHAnfPCLC/ELXF+IDA+cejPr3sqUVk6CX
         uw8ufBPirZc1gGgm5epI72GxO01SQ70VyZfigSGGZDLzxsRJMRCjngsvgncMyjnojIpF
         v2fyfBaVdcS+aNjZDDeGbhbOBaaE+GLb5o7jy/iyEAtTIKrZOZHS3YMdNw7Zd/RT3v5R
         TgnQLwVdlInyIykFE8ThRW4HGJ3P1If2vSxQ5jVxfBnbeNkW0EkUWLPWmmWBD9dAhyMY
         m9ADPHcsmXz6v31dwaB7zNb4bbw7QPkKp9ThAToPMfwiksSKWpTTY6demoZvRohMNmzq
         1r2g==
X-Forwarded-Encrypted: i=1; AKwUvBwH9PquSuFh7/PieIam/EAkGmIdEbfTNF3mMB/bjhRoTrh6C1k+WbI5jh8d/GYHERSFf1HzmNjp8dCPbYDlvn1IOw==@lists.openembedded.org
X-Gm-Message-State: AFuF++kq567DiCn/4Wx6IFHPgTFPNr3Nvxshv0wFSDMbB69wtm94DDrI
	vFXiwh0k2pcaM6EzEn4M4YbFSHG5Btn4A9Sl+Dj6s+MIZvxyUOuqSUjfzElUj/wBEDoBXxuuxjv
	LCy9zros=
X-Gm-Gg: AYBFou0lEskJ/m8wROWN645pQpc0OfRwcrF+vyzaPZLDav87OiHfXaHoicVaqeY/Q+y
	hlvwtAFkSSTFvSqNBbi4vYVMO62fe0Bhj4YoHy4ohzNfbDzrhTubc9F13T+ObZoiK90wocrMfGY
	quY6Xxn9WwXHV2TOieGEvHs6CM9QudUMZdonl8hfE/z/+lAWLbnFFJ6zkj6RT1S4PeJG3j9aoKS
	xIdp++SaFvKXIxxK7Z67Fk+MY59ey44zgZ12NbXR0zeBL5m1XwcEHe7mSP72TaE4lvv8spXlkfL
	eP7OTidEaqkYKunUx3k+14haxh9kwuvZewfj4soGgMBN5m2bJtTWjq+mG1PIuwRQtE4+dk0fLQZ
	CC15jHigXQ2HkxubjZ/G0XdCWPCvtW+mu6pJ4CBDYQaHUFZrJHW7Pi8K87s4giFULyoWwm5nG43
	8a9vlZEoELrjl0h5VpCouZoJFchq7DW+GrbvuBf4FdWyJKeePcy+uStE4Zu3QUh9RZ1r5mZ/Lf1
	xHG86HUeluWNFMByHLztm9W6JrZzS2hqU4oqkPlF8yAjxYvKiWx5kXiB3/Xyns=
X-Received: by 2002:a05:600c:46ce:b0:49c:dca4:94c with SMTP id 5b1f17b1804b1-49e7a6870d9mr51574595e9.13.1789394703469;
        Mon, 14 Sep 2026 07:05:03 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm448546615e9.7.2026.09.14.07.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 07:05:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 16:05:02 +0200
Message-Id: <DLF3HE4NF7RA.32MM5O28CF00C@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260815190824.2980891-1-peter.marko@siemens.com>
 <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
 <AS8PR10MB50730917F166A3CF95DA25CEFDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB50730917F166A3CF95DA25CEFDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 14:05:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245786

On Sat Sep 12, 2026 at 9:15 PM CEST, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: Yoann Congal <yoann.congal@smile.fr>
>> Sent: Friday, August 28, 2026 10:25 AM
>> To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
>> openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
>>=20
>> On Sat Aug 15, 2026 at 9:08 PM CEST, Peter Marko via lists.openembedded.=
org
>> wrote:
>> > From: Peter Marko <peter.marko@siemens.com>
>> >
>> > Pick patch mentioned in NVD CVE description.
>> >
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (From OE-Core rev: c105fbf82e2f50b05dc680e0601bf0ea3198e58c)
>> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
>> > ---
>> >  meta/recipes-extended/cpio/cpio_2.15.bb       |   1 +
>> >  .../cpio/files/CVE-2026-66485.patch           | 210 +++++++++++++++++=
+
>> >  2 files changed, 211 insertions(+)
>> >  create mode 100644 meta/recipes-extended/cpio/files/CVE-2026-66485.pa=
tch
>>=20
>> Hello,
>>=20
>> It looks like this series triggers ptests issues:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4362
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4378
>>=20
>> https://valkyrie.yocto.io/pub/non-release/20260824-88/testresults/qemux8=
6-64-
>> ptest/core-image-ptest-cpio/log.do_testimage.311338.20260824214940
>> | FAIL: CVE-2019-14866 (tar header size overflow)
>>=20
>> Can you look into this?
>
> I really hate the expectfail default setting, sometimes I miss the failur=
e...
>
> Could you please take the first two patches from this series?
> Only the third one is causing the error.
> After two weeks of vacation lot of things piled up so it will take me som=
e time to clear my backlog to be able to look at this issue.

I can take 1-2/3.

Thanks!

>
> Thanks,
>   Peter
>
>>=20
>> Thanks!
>> --
>> Yoann Congal
>> Smile ECS


--=20
Yoann Congal
Smile ECS


