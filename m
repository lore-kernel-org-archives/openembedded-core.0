Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3520CC0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:30:05 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.9109.1738143003140841644
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:30:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nKgn6jiM;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4679ea3b13bso52408651cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738143002; x=1738747802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGP7fZ75BsQ5BLXbtMgJRjfkYV9475b1ExQja6aCfE=;
        b=nKgn6jiMrWFWU6/re9VLlVlGnjuHCN+Lykm1lIcw16oQWaWlZmhL8iA7snuxV/YyeF
         xlM7L5WjWoYxHvWn6lH03gw6xxhalvw/iDhwIvE5HVSK4UJMKKoGJcEkklQ1U6fjgMMn
         YgaKnvdZBMTUDdS+1yMAkBTdAI+Bs9sB6WaPsnu3b+/C8bMHxFvTdSFdULJta3EwgbWO
         0QFQUW1v9+KEpvzZ3E7QdzRRzY10djaL8m9OBMlJ5WIKTZfhrRanSqwwLUvgoLKFInS5
         6NVRDMQ8r4Zt5JVo+n0kOHmwx/iZzLuaEwXhiiwe+CNCbFvif49ElxY0LzyWLHFpaUGr
         FPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738143002; x=1738747802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZGP7fZ75BsQ5BLXbtMgJRjfkYV9475b1ExQja6aCfE=;
        b=Es+TNlqv1i7k1okeg0/TZdZAUdVV4czCWyl8+j/uhdBpS7XIWHBr2SvLuFLFCMgxKw
         fhUR8vEyZSS7gU2kWw17ikRtEPO7wq+h+m30TtJutuTMlDo6sF3gdWfb0udrsx1JGA/e
         sn/mRUF8B6/1TJgePO4G3OVfbwf8r+TBK8loTYi+28ClSjdAQv63f+huHV05puVsdcaT
         F7/H29bNb7qY7LB8BVEFL5U3TeZH4HvoGsm7Czd2w5YiBlCctNuxmHq4ezS6zFBWvf6Y
         9OoJhPle/9ncwhmYWKtpQx6UkMMSky1gujrS6zIGBYy8kGafQISrps9ohf9u63xuHmMj
         IiTA==
X-Gm-Message-State: AOJu0YyAspqqKZ5b4nEfRuxlsBJMDLhw/6L0vlaLChJbqzSLk2XU+ve6
	/j84ToKm2JOecBs1S4+DIYDeplq5X1/fAnqPF1Qlsj8NiXT3AUiujx5IZwrip5+JprJca72HicV
	QpPB8/4rBE7Euyc6ewNhSSRBXVho=
X-Gm-Gg: ASbGncv3EVP2bKU8LlFF5NKPW+3LU988gnohiDrX+s3tFB09ffnZH09FMFnlnZ+CLAK
	OY55jdJweWHchtS0307THvVf9WjXfFfOxxoy47vHoSXaFpj6G/L0175ZS+ZnBc1QdLwyMEOV07V
	hoXnrAwDhTjKSjnof9RhVpd+3ZNCEctI8hKKeHnvxbGg==
X-Google-Smtp-Source: AGHT+IEwr0S2ho2WypiadKrwr4qQbsIYJldMIu5QjMS/TPaj3F5ogqMBuQIhfToSQtKvLriRhvi6YIgy7ePRocd5vPI=
X-Received: by 2002:ad4:5966:0:b0:6d4:1c9d:4f47 with SMTP id
 6a1803df08f44-6e243bb87aamr40013686d6.13.1738143002176; Wed, 29 Jan 2025
 01:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20250129080902.1863054-1-zboszor@gmail.com> <20250129080902.1863054-2-zboszor@gmail.com>
 <CANNYZj-pUVu_vp7DERcSF__LcRWi3oA4hocfEqfKPW_KxmrGZg@mail.gmail.com> <1b6439a8-3688-4d45-90ab-0eef473eb347@gmail.com>
In-Reply-To: <1b6439a8-3688-4d45-90ab-0eef473eb347@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Jan 2025 10:29:51 +0100
X-Gm-Features: AWEUYZkZ7t04IhnYKnH5IHiEolUthPTWnH4bge21r5sVZ02NugZZmIbziksZ5aM
Message-ID: <CANNYZj8Bx=VShWDBUX32rQYmjk=D3ExyXpCqNfXFDBWWVP=p9g@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/3] rpm-sequoia: New recipe for version 1.6.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:30:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210358

On Wed, 29 Jan 2025 at 10:20, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbosz=
or@gmail.com> wrote:
> >> +LICENSE =3D "LGPL-2.0-or-later & Apache-2.0 & BSL-1.0 & MIT & Unicode=
-DFS-2016 & (Apache-2.0 | MIT) & (MIT | Apache-2.0 | Zlib) & (Unlicense | M=
IT)"
> > This is very elaborate, how was it determined? How to ensure it remains=
 correct?
>
> It was taken from the Fedora specfile license line verbatim.
> IIRC, they (Red Hat) have a large contingent of lawyers

I guess you could add a recipe comment pointing to the original specfile on=
line.

> > Why can't we use upstream's standard install procedure? Also,
> > cargo.bbclass has an install function, why is it completely replaced?
>
> Because it fails with:
>
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | ERROR: Did not find anything to install

Yes, cargo_do_install only copies executables, you need to opt into
libraries by setting CARGO_INSTALL_LIBRARIES.

But before that, presumably sequioa upstream has a standard
installation procedure that we can try to use instead of copying files
by hand?

I'm particularly interested in how ${S}/target/release/rpm-sequoia.pc
is supposed to be installed.

Alex

