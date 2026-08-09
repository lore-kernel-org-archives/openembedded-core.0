Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A2BC5AD4E
	for <webhook@archiver.kernel.org>; Sun,  9 Aug 2026 09:46:20 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6528.1786268775064731072
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 02:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rGCSoxXx;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6181655e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786268773; x=1786873573; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zndhXWiXdLmXwhVrm4kpV5Jrks18S61v59ZVBTKXo2g=;
        b=rGCSoxXxhVyoywNAtySDTclLam3fR8lYpdsqYCOwRZPLccxAPt8AbNn5MB9PXwStdN
         a0vCtBIsqITqCZ4BOO/tFurOwzS6UCpcmglAQMVCivF5oEW0s3ZjE/zAclZjgOdUSyUg
         4FGuVCDYByEUlJKdWy2StbvwJdETzZd1b35IMBaaXcyCd0GNmCZudnXQ7zqryAO+jvMm
         +kO2ApHpela/H1eTO15ryZ/evXb1JYCdPk1KMy3O4xlD3ZKIvdqA0gdWxwgymQaDYREi
         1EfNVuwEfJUT/vBu5hd7tHqW0QShupIt/LGXeY+k4gmpLcBVI09L+fxVQo68aguRNC4g
         clkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786268773; x=1786873573;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zndhXWiXdLmXwhVrm4kpV5Jrks18S61v59ZVBTKXo2g=;
        b=E14R8foOdqQn2q1myV453CpbWDDbwYQhDoBEICEzV+REAyMJmJoWJZdwOGBl+FgKZJ
         wh14ue64arAxjVqpwBWkZLkXTyavv6qlOsgIe10N89BrtGCNj2oRhpDaxNEoojFrvloM
         y4XGqDZfFNnxNFq64WQb8TKkieIwOP9sgb39QnX34sx21/riphQjNBA9Yi4fRP5oIcR7
         Cf/KNw2O84WSr9zVkBIq4OinvQJrJZ8BiclZoJiwglY51JEvkvXfg5m8Lvc1ls5JKgJJ
         ZNOH8YT9VkRoba5mGGKyxCdZDIQL3it2p5JQBDaS9Z+zYDZXfddIIx9BXc2IkiO8+Oly
         gs+g==
X-Forwarded-Encrypted: i=1; AHgh+Rp4mlZZ9iHOZt+aoBT8GhMsrIuHIRbKrp1z64B6UXNEPlpzNcqJnZCDl+cmUdHE0/8tOTitT8sHAzm56w4SkhBl8A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz0bkvwyxdOtY/fQR+xWCm6HgXiSYFvJ/6rhkE3QhfS2TYr54ZB
	1eZVXXQrmyz81GiJnW9w3nCpymblgThkWLPllpvkdLpgC+Wbb5vlNEAq
X-Gm-Gg: AR+sD10lagUxnjdsg8LoeXbQDufncEx7/MrdOjkVfjGwGbfaUID439MUEBTYV9/P9UR
	8AxI1407lMPeVkLCI5F16qDjx1Wyy2tDY3jXUvMAZFlTRTR5j1ze1b3zn8KnQ/P3NIT6/tvrS7l
	VvFZfyhDkmGrZNT5/IpnrjdMVsz6qoG9b6kvUT09lLIvoZ8gEKi9G5D7F0gaXAAyu4ZkBOxdYhv
	lu2lFWIvXhwpT1LVrwIEduMqwEWPNxXQWVcg9DUxO2bJFFpZ548lqnS8hYqbt0IHvlFgzYkhKlv
	zz3sIIC6JeYEvNaaJt5WhKjxoghdOWUJKuuFz98kcpM7hF32Q8viHmbAPzLdUFXSm8T3sMI/ZDZ
	NNgHyELXGM7C37XdUDmY/TX1bQLjGCGqgo6R24VsTZfXvjkvc8YPBqTnjWz8pMg7ICoid82v1Ca
	I1P8zaZxEBB3QrldFJ95ct6k6uk2/+RLbgIvhsBMo+cv41v4f/4IKmxU+hNOfq0D5KVGJHNmEQW
	QExe7acEBXIYr9GUYDEwWbuMuPZX3zmNy0UK3GrxLRjxBGWjw==
X-Received: by 2002:a05:600c:4e87:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-4994e7c0356mr458108885e9.11.1786268773148;
        Sun, 09 Aug 2026 02:46:13 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea27b29sm229383655e9.11.2026.08.09.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 02:46:11 -0700 (PDT)
Message-ID: <4ab31dbae472a30a5dd3ecd2ee624ed0547b63fd.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: adrian.freihofer@gmail.com
To: mathieu.dubois-briand@bootlin.com, "Freihofer, Adrian"
	 <adrian.freihofer@siemens.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 09 Aug 2026 11:46:06 +0200
In-Reply-To: <DKITSV7NF7Z2.3PZ90BU6Y01O@bootlin.com>
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
	 <20260804120034.378787-14-adrian.freihofer@siemens.com>
	 <DKIT3XLETTWD.4QS3K7M6HPXE@bootlin.com>
	 <08283607bf7d58c11af1c20c84e553c62150f511.camel@siemens.com>
	 <DKITSV7NF7Z2.3PZ90BU6Y01O@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 09:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243074

Hi Mathieu

There is now a v2
https://lists.openembedded.org/g/openembedded-core/message/243067

Regards,
Adrian


On Fri, 2026-08-07 at 17:44 +0200, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Fri Aug 7, 2026 at 5:17 PM CEST, Adrian Freihofer wrote:
> >=20
> > Hi Mathieu
> >=20
> > I hope this will fix it:
> > https://lists.openembedded.org/g/openembedded-core/message/242995
> >=20
> > Regards,
> > Adrian
>=20
> Oh yes, it might fix it, thanks! Sorry, I haven't had time to look at
> today
> patches so far.
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243016):
> https://lists.openembedded.org/g/openembedded-core/message/243016
> Mute This Topic: https://lists.openembedded.org/mt/120592137/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

