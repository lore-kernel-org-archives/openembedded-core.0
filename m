Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71710CA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 13:37:57 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12264.1790948273296184298
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 06:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KbNn+Cue;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so573355e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 06:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790948271; x=1791553071; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PDeuPvmqsHE15ZrXVDlqFHSiOOEsIsRAgiRNeQTud3M=;
        b=KbNn+CuexwpwpmdfABt/+/zIMpO57gBljckF2tdb+/LN8vqVfESwbmzCgS/BSsbKPr
         7lgetoPpipWFGUiBNciwR+6pgj7+UxnqoZ5gcqZVOJGBCBejHGk3C/WzL/E1EnHJnr4q
         GyCm/ZIL9QfQveeQgtT6YtUPOiAVNx8XlAVEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790948271; x=1791553071;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PDeuPvmqsHE15ZrXVDlqFHSiOOEsIsRAgiRNeQTud3M=;
        b=teE+XAcoNEaTbGWMO1JVFoqOGFKsW0c1Kf5X7ipksYy6iCF12RMlVyy+wGy8oF+FZX
         yRrzNUuR6xBsE8TlgzIuLBXP8AdklHmF6tVFJvp75L3JqsTFaJB64lVlien77EUodCB7
         4QJmCEvL4yqcqTW+xLtEbHMP54F6MufN48kNRfWwmKOajvn9Eg3HB6U/PUqBKU7T6mmS
         wLa95nkgGth2/YiD/q++4EdPMAgHj4hEX1EvAmogVpXsGce8dAuRn0FrctcvnGRg9ptg
         Ur5YRLJlIb8NnLtGuu4ixBCq2JyMcspVqmegxuKq6ZoVh/Gdsmdw0kyyCDiL+l0upB0h
         3iLw==
X-Forwarded-Encrypted: i=1; AKwUvBwx52bqXzF/7b2ZJld7sgCGAPUU7bws0X5NOE88IYNdeG2ZrMunSUNlldu+2/ua+t+oARPB2vF3MEVxzsy0ZarxOg==@lists.openembedded.org
X-Gm-Message-State: AFuF++n2JkBM4eRZpZ0TZk5wl3VREItKWZcefcA/QQfXx/KiKlnVcqU8
	1lQxU50p/LdKRzDDdgeGkpa3rT7mrWjXBuwjOl4JpLN4meXpZIjtzL0cFWdydswOByE=
X-Gm-Gg: AYBFou0tK3xt81q38AoAH2kMYPyXJXLg7C7RigTa01g1Rrj5WlWxLqBX8/fno7uq5oD
	KMBtQ9uVleKGNVyHdO/Feed5SL/aP3U/fCD/uCSSpa3gpwHGg7aU2ilfxJSV5BmWlKHeI7CZRUI
	X4+A/uekWHQo8IjExohcZImjNfc1OA7SgaqPyuVM2kc0cW04U+4VliYAe1AhXpal1pEJm4VCgII
	jleF8zVq+TBOdOfSPh4BuSleybGzgYpCbqT1upOFhevusFV2DTKgO1rOgKBYZzUn0k07L+IFZea
	BxIE9xSatuQefQWLAZSuyfIu/NYbdkPr/JdfEe65PVH1sr87JvjGSfuAai6+CLm8+Q3uoi+AvQ2
	kETnpCeaoxrRTo147CeV59AbPag+ZQutyQKH2KFzC07zHjyqpiJG5SSI43KxOK65/px7E90l3OW
	qn5otB0cJcWLroP+xOEUvnA2hJiPTMkMzZDM9WQzko1JczDi1X/S9re8MgiTnweFlys1qrQX+LV
	AEefXpsBjKtVL6DFSrB9vPaTSr6qrOA6j/I4cB5TqiZL1tRDaM5l+RJoNsP4Q==
X-Received: by 2002:a05:600c:1e0f:b0:49e:6249:268b with SMTP id 5b1f17b1804b1-4a027697ef2mr45900535e9.32.1790948271487;
        Fri, 02 Oct 2026 06:37:51 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a039505568sm68090025e9.3.2026.10.02.06.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 06:37:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 15:37:50 +0200
Message-Id: <DLUE6D6RHFEJ.2CJK2A37PGCCP@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] python3: fix CVE-2026-19445
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "joaomarcos.costa@bootlin.com"
 <joaomarcos.costa@bootlin.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261002123943.2208277-1-joaomarcos.costa@bootlin.com>
 <AS8PR10MB5073438BA96A515D51FA329AFD892@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS8PR10MB5073438BA96A515D51FA329AFD892@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 13:37:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247121

On Fri Oct 2, 2026 at 2:45 PM CEST, Peter Marko wrote:
> We should upgrade python version instead of picking patches included in l=
atest tag.
> https://github.com/python/cpython/releases/tag/v3.12.15

Agreed.

@Jo=C3=A3o, python is one of the rare recipes we'd rather upgrade than patc=
h
with backports on stable. As long as it is maintained upstream, of
course.

>
> I'll probably give it a try over weekend.

Thanks Peter!

>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Joao Marcos Costa via
>> lists.openembedded.org
>> Sent: Friday, October 2, 2026 2:40 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: thomas.petazzoni@bootlin.com; yoann.congal@smile.fr; Jo=C3=A3o Marco=
s Costa
>> (Schneider Electric) <joaomarcos.costa@bootlin.com>
>> Subject: [OE-core] [scarthgap][PATCH] python3: fix CVE-2026-19445
>>=20
>> From: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos.costa@boot=
lin.com>
>>=20
>> This critical vulnerability [1] was fixed originally on 3.14, and then b=
ackported to
>> 3.12 through a PR (already merged) [2]:
>>=20
>> "[3.12] gh-156293: Use-after-free for server-side SSLContext with sni_ca=
llback"
>>=20
>> Backport the fix to oe-core's v3.12.14.
>>=20
>> [1] https://security-tracker.debian.org/tracker/CVE-2026-19445
>> [2] https://github.com/python/cpython/pull/158517
>>=20
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric)
>> <joaomarcos.costa@bootlin.com>
>> ---
>>  .../python/python3/CVE-2026-19445.patch       | 265 ++++++++++++++++++
>>  .../python/python3_3.12.14.bb                 |   1 +
>>  2 files changed, 266 insertions(+)
>>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-
>> 19445.patch

--=20
Yoann Congal
Smile ECS


