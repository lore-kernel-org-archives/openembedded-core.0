Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DB3C3DA49
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:30:22 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.44073.1721741417086895166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxenhw73;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: rybczynska@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7a1be7b7bb5so1637071a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721741416; x=1722346216; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hjOLNoTwbU6JBEYtKQvR66YIXY4cnPbTS3firfHaDu4=;
        b=bxenhw73vER0HX1aQ+5Ht9xbV1lRRuoihnXBBeL+Ov0Y91nDmfpBBMXz/Ltg8Tj8a5
         d1DUuAWNm0B0iLdTE0Jot+T+myEJgtYlj1YqPM0kPTinJtiUE7iyBk8bFkhivERb/eL2
         5qzqCr5owNe11egPBzW8Rz099N51GqZ3mEcLKqN959RmhIcChDZ2vfDnsjPheSQTvlE1
         U2G+h7LRnkktrWJYeXW+nkcoUj5MHGL4zNQA2BM1ycwM2lkQjfSy37A67emeA4xL9YgC
         qXfqiMw87TcyMBoxACYy2Zm5NQUl5De2+rpnon1cfZW438mXJ5cTylfp+fWgo6Xk2cQR
         yiYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721741416; x=1722346216;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjOLNoTwbU6JBEYtKQvR66YIXY4cnPbTS3firfHaDu4=;
        b=RqsvGmPYtDl5Max8AueQtxCe+bUpcPHQEItDwjbWOT+2tdr+l4u/hxukSbjxwCAs/X
         a8ek42w44uhWdGyBlBnzUT1VaLDe3Y7io0H35s4LEe87pXgOrW2ekB//z6rnCX2EF6Qd
         X5/6cn4TzzvYLmR2/CohO2L4QjC4EBz5UV1ssaO8T2+lBc0Vqozt0gaLPh4BJheTXkX6
         nIjSrQaTc6L+hDDbgqgXujeaXbfIDsQZLcbG5hKlFpvDgRzHVKyGBHCLc45nL6pvIEWk
         zGP9cOYeaJH9HPYjFBoq53bbL3R96yjPWpRKnhJW0AukaXL7IPQer0uviuGlkdm7pgpD
         Yi1g==
X-Forwarded-Encrypted: i=1; AJvYcCWkvHR6Vjc7edjcTw/tzp/jDuGuPqHDm0RB3FxxPK7nif9/D/oFoYXfRieB/kkw/D7ah2wb7KmPCJa1ccSmh2D6aj3YWi6LbdX4WB/g15lBpX/RLexpxamo
X-Gm-Message-State: AOJu0YzHUCQzTE9meYfpYcYVMX4IhMHEdupkrOT3qDDxdmvIpRZcO28Z
	yuvOISHhKsEue3vonk+hqFkG8rGEwmJrHc9VOrHIOwJQiVo+h7ZoU738Stiwg54okHHgtwIcH94
	CZCKiGusYryD8rKexzJ6RJiWcQNI=
X-Google-Smtp-Source: AGHT+IH+BF6xhctaXyFIWMMZLm8R9wPtp84nnND9vUzSAMLkxils8Bfqk4U2aHAkUbFZkHTlSRyoPM8TJGv39uhj/p0=
X-Received: by 2002:a17:90a:a114:b0:2cd:4593:2a8e with SMTP id
 98e67ed59e1d1-2cd45932ad1mr7126878a91.15.1721741416305; Tue, 23 Jul 2024
 06:30:16 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 23 Jul 2024 15:30:03 +0200
Message-ID: <CAApg2=QMPfEF30cuTRoZmEsE0CTpRH8+0FOWheFSbyRHLWZ9Yg@mail.gmail.com>
Subject: OE CVE improvements work status
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="000000000000839e9f061dea292c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202363

--000000000000839e9f061dea292c
Content-Type: text/plain; charset="UTF-8"

Hello all,
An update of the CVE checking improvement work:
- v2 has been submitted today. It includes fixes for tests, updates in
comment, removed unused code, added deprecation of cve-extra-exclusions.inc

Now back to the tool update, we have the ADP support to be merged and used.
During that time https://vulnogram.github.io/#editor now generates ADP, and
it will make creation of valid entries easier.

We also have automatic runs of the tool every night for world in oe-core,
will forward the message of the next night (just rebased the database).

Kind regards,
Marta

--000000000000839e9f061dea292c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello all,</div><div>An update of the CVE checking im=
provement work:</div><div>- v2 has been submitted today. It includes fixes =
for tests, updates in comment, removed unused code, added deprecation of <s=
pan style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);backgro=
und-color:rgb(255,255,255)">cve-extra-exclusions.inc</span></span></div><di=
v><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);bac=
kground-color:rgb(255,255,255)"><br></span></span></div><div><font face=3D"=
arial,sans-serif"><span style=3D"color:rgb(0,0,0);background-color:rgb(255,=
255,255)">Now back to the tool update, we have the ADP support to be merged=
 and used. During that time </span></font><a href=3D"https://vulnogram.gith=
ub.io/#editor">https://vulnogram.github.io/#editor</a> now generates ADP, a=
nd it will make creation of valid entries easier.</div><div><br></div><div>=
We also have automatic runs of the tool every night for world in oe-core, w=
ill forward the message of the next night (just rebased the database).</div=
><div><br></div><div>Kind regards,</div><div>Marta<br></div></div>

--000000000000839e9f061dea292c--

