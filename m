Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACFDC3DA7F
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 13:16:28 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.42501.1722431782515846557
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 06:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icFcP6yW;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fdd6d81812so46849525ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 06:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722431782; x=1723036582; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=M8imnAhDgyye0HsDmUFCHY4EBHr9smEojQalLCBGB04=;
        b=icFcP6yWBKTVdEWh3OYdjGtwLrYsKWEEGODT53vRoP5v0POwSdDyY4lXFwOTHuz9QS
         p+jy0NaGjfq+t+AyrB8NhbLSq2TjKzohB+TcZHkObn6tjzKbahsmI3r6vk76bQUHTniW
         1RjJi0joCaVEc3AX+CEBFwxY6y0CEYJjZoHnOBTUryHZ5vz/I7r7QOt/TMpvD9zzlmLf
         i45od4wHuvsih6thiaJTS2UYayaWaxck5Bh9/w3VfUcFw8qQIizQwM2e2uGOBReV2PzR
         wIAJ6KY/ingjZYtWz7ti3NV9+qew0bqwfm/Iga423hS5+g8WP2CVVCxc4JtI2yenfcYI
         AnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431782; x=1723036582;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M8imnAhDgyye0HsDmUFCHY4EBHr9smEojQalLCBGB04=;
        b=oWwmZoC5M1SsPkDdX8gDTgKOHVONjtcCb6ifM0KAB4V4V7ByJJ4zJQ9JFlD20P+9nJ
         Hksk4r8ViRoTaXRb/V4/o4E2rDP2hWrpKUi1jZ+1iiUaSqU4Co/6HcNBNlNKG8z/5tv8
         buIJ4k3830qJARlk2w+bFrgAxym7xeMLyVxms1V9DwLkWaVFLOdyda3R/QjUzvkj5Q7w
         0WUT8Neyn90st2GlpFGPb9w+VIvuyIW8ybXYVc6qUwCvITK+kMbZsJapFuZ6RgYtd9Jl
         Phdi5g39GsSPCD55VNBSnbcpc7kI2DPuCwgAah1taY4SX1djVR2dsZ4/G1QuSh/l0Egd
         7Eag==
X-Forwarded-Encrypted: i=1; AJvYcCXL2eH47d8zy2G0EH1d3Dwlrzy1Ww1FZYZ4yXZNB3H8f5Cv5xqhihQGlh31/4FlUBBxumVGueJYYIeUubSB6H+eyn0VKMZMYai1tSGdukoUtxaiuOjLSZJ9
X-Gm-Message-State: AOJu0YxQoBycXaHBiv7bEi8hNlAyVCpZGt8kXiUU68hAqoBc4AP6PSp6
	bncz45DJms/OWvaWu2SQDjWn2a42Qwn7bmN119KYvTEUwGkA+sowhtr75HoYqJPhyw+MZZ9ASFd
	3GDHbGEsS6lTd0vCw5ryT88gjvH8=
X-Google-Smtp-Source: AGHT+IGOvyFe7WvHAFxSWhMHMDasmsZMgRZUa9N4RWpAiLe/Bf3mYW5CNRlLqCugwxDdjoUrmFYEeptyBkXiUPoZMa8=
X-Received: by 2002:a17:902:f988:b0:1fd:6d4c:24e9 with SMTP id
 d9443c01a7336-1ff047fe776mr135793065ad.10.1722431781748; Wed, 31 Jul 2024
 06:16:21 -0700 (PDT)
MIME-Version: 1.0
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 31 Jul 2024 15:16:10 +0200
Message-ID: <CAApg2=TO9RPyaxnZ_5sqhTwjyWik1LgJiVucnqvDJ_PL54Ftgw@mail.gmail.com>
Subject: OE CVE improvement work status (July 31st, 2024)
To: yocto-security@lists.yoctoproject.org, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="0000000000008046fa061e8ae6c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 13:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202709

--0000000000008046fa061e8ae6c0
Content-Type: text/plain; charset="UTF-8"

Hello,
An update of the CVE check improvement work:
- the OE patchset: a v3 of the OE patchset has been submitted last week
- there are CVE database corruptions in the autobuilder, but I wasn't able
to reproduce it for now (not necessarily related)
- the tool: ADP (extension) support has been merged today, we've got some
bugfixes pending too (also expected today). The results improve with ADP,
but we have also found a first bug in the ADP data :)  For the code go to
https://gitlab.com/syslinbit/public/yocto-vex-check branch "main"
- the data conversion to ADP is in progress
- tomorrow will send results of the night's run (locally I can see that the
CVE update has captured fresh BIND cves et al)

Kind regards,
Marta

--0000000000008046fa061e8ae6c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>An update of the CVE check improveme=
nt work:</div><div>- the OE patchset: a v3 of the OE patchset has been subm=
itted last week</div><div>- there are CVE database corruptions in the autob=
uilder, but I wasn&#39;t able to reproduce it for now (not necessarily rela=
ted)</div><div>- the tool: ADP (extension) support has been merged today, w=
e&#39;ve got some bugfixes pending too (also expected today). The results i=
mprove with ADP, but we have also found a first bug in the ADP data :)=C2=
=A0 For the code go to <a href=3D"https://gitlab.com/syslinbit/public/yocto=
-vex-check">https://gitlab.com/syslinbit/public/yocto-vex-check</a> branch =
&quot;main&quot;<br></div><div>- the data conversion to ADP is in progress<=
/div><div>- tomorrow will send results of the night&#39;s run (locally I ca=
n see that the CVE update has captured fresh BIND cves et al)</div><div><br=
></div><div>Kind regards,</div><div>Marta<br></div></div>

--0000000000008046fa061e8ae6c0--

