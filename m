Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E763C369D8
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 14:57:17 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.42111.1745333831450266947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 07:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAyC/PCD;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0c30a1ca3so59865466d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 07:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745333830; x=1745938630; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h21SALyNNVRnXHNjaCEHlq4ZE8DkrdFQXYQYlkMlXsI=;
        b=KAyC/PCD0vc/Y9ENL4+Fo1wSCWyyDXCJ6Esgtxzpfy623oil9wCzff8MjkWYsLNVHa
         jrrJNJK3apVusfwLH0VXTcpigNbswT264xVMw5ZcnhpzwNJqRKohRHhpkw98sBhS6cIJ
         h6geBcqgiVjZY+ByC2P3QWHAUR0hQY8grJVi3sYhMInZVRR5WTQPpj7wv0z3SuU9z0OO
         oV75gIZ/Oi9+b1nTPHDalv8Olz9YlfxbwVMbzgCVS8EqU9Ypnw1/cVZ99/Mii+MAcwdG
         hOF7adBi6vJZqdDE3UpO4tNzb18lt8p71LDrKtyXVx/qBNjSQbiiU+sl6qyhQkERMcC7
         UMeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745333830; x=1745938630;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h21SALyNNVRnXHNjaCEHlq4ZE8DkrdFQXYQYlkMlXsI=;
        b=FMNfUTypDvdsoRumq0u+PH0bKRS/Bb9GWMzrYtjwGr4ij2c3yJTT2RsjnaUAWdSSP6
         4+3AhBFl3rS6PkLIFwCbYfS1WVZYKFwmYsHpef/iawSE73w7US3uv1fHb92ftzNxng3G
         jf4f1EyEJGNXhNHK2QW6JdPGIF0HditW9cAdHbe78cFV44Y6oVgUGniaT1UqIjf+Lr+Z
         k68jbzmHixEE7IvivXJdsOLSbeYKDu3SZJoVJImL+FqXMeawpDnlNXFKlkXne0DvDz47
         BpKQcZmj3O1H4+N8Gd4FJpjuoEKPCk4/uvXbpd5Y4onqZ+CBBwrCdQuAuPNPIAvI71QB
         +7eQ==
X-Gm-Message-State: AOJu0YzyTa5bJJZdXQJVzxBohbti+S94GWh99ltpGfniTV1EELetS6rY
	gZFI1Pff+HrvAQefXyx+CjDacd4gOAqy6erWNeyI9onBlzpLPdMpitp5kvqTopHu2wiShScsdK8
	c0IhIi0GDzllc31DpbWEi3tINSpy72g==
X-Gm-Gg: ASbGncveOatyNyyEihkUonP+D7QXl4dPXZutWwehqMH9u6xqTIyNA7SamqtFJ/R2nlB
	Uyu/rhvsMv8lBVoBBjXOPr+2DOnXYcR94aVSwztblNSBFcFRe+JyiNznzh5K5qM6z50DarnJkbi
	+N7LBzPNEWgWIhAMLPuBacJjt2sDVVfMpzE1Te3IFuDH+Lj72c/hW81C7z
X-Google-Smtp-Source: AGHT+IGqD3o/pbbTc3YGl+FtZGNPBFDXrR71qTzCmt2VPkD6LdULw5Sbovs+8EzqEPtK1gPZB5SRGZPq3rCZrxmbm0Q=
X-Received: by 2002:a05:6214:20a3:b0:6e4:4484:f354 with SMTP id
 6a1803df08f44-6f2c4671b1cmr316691226d6.38.1745333830505; Tue, 22 Apr 2025
 07:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
In-Reply-To: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Apr 2025 16:56:58 +0200
X-Gm-Features: ATxdqUG02p04IvKxtvjgIsW5NczE3qKbTmyB1Rc81n8TpHb432ciC-Roxp_tlCA
Message-ID: <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
To: jan.kircher@leica-microsystems.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215229

Absolutely not. Just because you had one isolated build fail in
systemd doesn't mean we now need to switch it off across everything.

Anyone who does serious layer maintenance has to debug crashes and
mysterious behaviour in native executables, and this is required
functionality.

Alex

On Wed, 16 Apr 2025 at 11:02, Jan Kircher via lists.openembedded.org
<jan.kircher=3Dleica-microsystems.com@lists.openembedded.org> wrote:
>
> Following the suggestion of Khem Raj after my issue with systemd-systemct=
l-native (https://lists.yoctoproject.org/g/poky/message/13589), I propose t=
o not build debug versions of *-native packages when DEBUG_BUILD is enabled=
. At least for our use-case, building debug versions of native packages is =
unnecessary. Please share your opinions.
>
> Greetings,
> Jan
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214982): https://lists.openembedded.org/g/openembedde=
d-core/message/214982
> Mute This Topic: https://lists.openembedded.org/mt/112291802/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

