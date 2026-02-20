Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E02FEC55176
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:40:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35024.1771580413515364400
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=u7kHdhR2;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so10917315e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771580412; x=1772185212; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmrzIzelcEOdnRv5QQA6hoHWkf6jR+b9PE+kZRsNeZI=;
        b=u7kHdhR2OFafZWOqZpVRuVM9VeRB4bgDN49Pmv4xm38JE1ivPOMgPlbk3Vs8nMNgdB
         XJevKj8R1ZSe5CS4Oy1lU2YMp5GFSaSM1ONZ92RumZdlRoQU7CDzN7TwFJujjTGrEzOR
         MiXs+90e+HJxsZxDpR9L2zYjVEOWZSfUyL7gQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580412; x=1772185212;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmrzIzelcEOdnRv5QQA6hoHWkf6jR+b9PE+kZRsNeZI=;
        b=joTe8dp3unL8QWcIYWlp5+33qhEt4RGzgpIHbuKQ8pR/SmFy9cKiTrA8C4ag/fjZoR
         h/Pq13UuPXGVdt2pdFLj4ItE2HVUvOlHwTDcPg2VAfrSZx22/sSXAq9/a3QlWKVF9YaS
         /zo3WVJ/QNxh9F0c1FCJR5sozcnpSuk/Zu3CjfVZ3os5Nj0wWIu1ySvBmy8MecJAK6KU
         76y3ANMrQfR2vwcCo/7g59vAr+P3VavNyR87E2hNOzarZcuVixwpvFLQR4qPdTU02klo
         +1a8RkMLeAUnFH2htcJP1La40pDmwGHVJm/6SCBj+O/j/sylYtOlkj6I2YmaqnJCHDTX
         2/aA==
X-Forwarded-Encrypted: i=1; AJvYcCWaKgaUR/zeTKej1sTAGhgOVUAJ64UkRohGuHW/WwZMS+vrjxnJD6HNm3p2R7+nfQkBTxQFNGagL9Jet4qNaR7JMQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVOWAxJECvAdGePO6I0FoIbyhn2gUUocLzwpBxgilAz1E97yc0
	5zEP15Vkon4JCl3CWe2ZBO/DNghjmIvMN2tsvBBKz8TGk75mY9lEzo7aghlNsb3Kd7s=
X-Gm-Gg: AZuq6aJebwoF+EdDiEDMb3PPjEVwLFrO5iO2pNk/g8k7J/jW/9sLBY8dFlQZolocEeD
	rIYX+bpls9oSVtnP2uIBJ5pp/VOa8wUJE7enehkvq6MTYFqCC54HJwDLYBBWtz9Jgf5aba94nti
	BBnjJJat4ZgAiC1p12l06D9CqFprTsXpMhK0jM0NBc2hdCx7JxBKQ9OFtyzV/ynb/WCoor+pjbz
	i6iMJpZ9Ulu19Oil0nEEPoGsKubpcodBYcgZQpEDPZeu/56jHTL5Q400Le2ci1Lxkiw6BtXiNBd
	ISmlAAfj0ClPkRGHth7ShFl35v6FB4xZ3Rs/x0kJ1WdiSJnyvYmbHbeSt5/bslrNH02IFIBf/ou
	S3FpMDlgzHtiDqqmziQGXGhfPycpO5tjBjfngQRcaV+g5mkDcj+tF8JekRw4tPVNRCxF1SvsKmH
	4SYrToUMQic1HU+ERTTqIoRSXcoAeUTxMPNALnsLrXSFL41WWuWA06Oha7ypQXZw70920Q+LmqL
	PgybFaD70jOUqM=
X-Received: by 2002:a05:600c:46c7:b0:483:7ce6:1efb with SMTP id 5b1f17b1804b1-4839e6614c4mr84350265e9.17.1771580411815;
        Fri, 20 Feb 2026 01:40:11 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm56003523f8f.32.2026.02.20.01.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:40:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:40:11 +0100
Message-Id: <DGJOUDHR27JB.3LAJ94HUYNCZV@smile.fr>
To: "Marko, Peter" <Peter.Marko@siemens.com>, "hprajapati@mvista.com"
 <hprajapati@mvista.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260220044322.8015-1-hprajapati@mvista.com>
 <DGJONZ9P9Q10.336H4HB6V1RSM@smile.fr>
 <AS1PR10MB5697467AA218F394FEB5052CFD68A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697467AA218F394FEB5052CFD68A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231499

On Fri Feb 20, 2026 at 10:34 AM CET, Peter Marko wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Yoann Congal via
>> lists.openembedded.org
>> Sent: Friday, February 20, 2026 10:32
>> To: hprajapati@mvista.com; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
>>=20
>> On Fri Feb 20, 2026 at 5:43 AM CET, Hitendra Prajapati via
>> lists.openembedded.org wrote:
>> > Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2=
025-
>> 69419
>> >
>> > Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> > ---
>> >  .../openssl/openssl/CVE-2025-69419.patch      | 61 ++++++++++++++++++=
+
>> >  .../openssl/openssl_3.2.6.bb                  |  1 +
>> >  2 files changed, 62 insertions(+)
>> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025=
-
>> 69419.patch
>>=20
>> Hello,
>>=20
>> Thanks for the updated commit message, it looks better now.
>>=20
>> I still need a whinlatter equivalent to take this. Can you send it?
>
> Whinlatter has "openssl: upgrade 3.5.4 -> 3.5.5"

Oh right, thanks Peter :)

> Peter
--=20
Yoann Congal
Smile ECS


