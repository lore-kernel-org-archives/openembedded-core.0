Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03D5D0E6EA
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 13:54:49 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17474.1764078879515517018
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 05:54:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3gkT1h1;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88245cc8c92so47558366d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 05:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764078878; x=1764683678; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvOu9venQbsmw4Il0Ch6kmrSkwUGFyTYkiglklrZ6BM=;
        b=k3gkT1h1Zo4tghMHUuk6iJu/cUQE15G4s0/mAzSxvnRHrNhBT+AhjQmntWTLw0gbSZ
         /Gj/t1ARrnbaZdkrjwIHi3Mwp18kelX3vrjR1Z06jmE7VU7vjgHCtqWEoYcBhth+GTAt
         whNHk74xZeEBC6CLT2zSsuUVjsMLvk59ptMD3iHy9cEPJMDbS4xEXODMDYzdrPLe9STG
         vJnID2glHMfpXKI9OK/uoJdgLXuGsu9K6mj48LxiiZxef4tRBt0ij3VLriRPk/d5tJZN
         n3Y/yTJ+bBrtnZI2XD28T1dlfRQzkKVZbbRqDhE9K1C6VPVvyt32hASPF59KZLXUyZWH
         CZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078878; x=1764683678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gvOu9venQbsmw4Il0Ch6kmrSkwUGFyTYkiglklrZ6BM=;
        b=Tdd2nsmGixU98KlWwpIEtpJU4RoGU2dEsMgDNk+Heb0V668LVrk++y9HrhHhRulZjB
         A2P0kJ7tVzGT/5fjTsFvKne8Q+/P2o13eIyBPDeXuvW+RmMeCSeOTLnUhPz1u04Gav2W
         N9iOb8Nujhe32PljK5KVRltQwHBbcobPzABWY8o7FP8E3qgSf4nBjiUWSr7+Bt7DWTE6
         VlwbTEaMma7a4K71d96GpP6NLoLOM3fhOTWGjxD6xHbCoIOTq2Y6h1pWBkQuWKCAC0Nm
         YSuXQ1ivpFPdAlFeM4VDa0NC5403SHPre+V7HZ5t0dIRiyfsEajsb/BNvNcpNHkt2+Am
         F2xw==
X-Forwarded-Encrypted: i=1; AJvYcCXnEyCssl/bkmvP7PmrkRu1SlXlTOjtcnUqEidRuemaMa5XbrKXtDZrsBtrSsCLkAfr06WTAqVrJvBy4sJNfwU6sA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyaZnb/TOTOPCSpOTOaQsGgDgRWoonGdl3hqPS0+qvBXpgnrUDv
	4SdQO00tLqBG00duWL9u8t12n8kLMrc0JKZDxvoQ6joHuWqh/7tD1CgwTIh6WNB8qQZPhFQHVIc
	Uu4+IjoxYtHWG9Ao7w5aJTVt3B89wSU0=
X-Gm-Gg: ASbGncvRIywFK6oriz1UFt2JOYFSzVRLfn4wla0+NXaVE8Tn03ANkv92NT2zTMuO8SM
	VeneNuJNOYk423DuPPf1ie9fNPsYzPvZ5qCsYjUC0S4VVFoK046UVl//5LcVgei6x0cYjbrziJB
	TmUW5LAc2aETNBf2OvrUEyoKCj4SN+/p7YCK+TGdmRG5mbKOkPvb7zpjr1JMwn9ktA9UiezKTlB
	+5LzTmgnayMh47b4ECE5MNkl3IdUA5KFvlHgsy5BNRrC2UY2oERlaEhtcW7NiJMzfd7LOxJIf40
	jkvnra5IB+2cBgbQJPmJs5mBmD2UdQ==
X-Google-Smtp-Source: AGHT+IENDpYgpwi0YtGaaXgZ3TStQZaqgfKW5XNBgDI2PpYN9HNYYO/+OUvH9ijvYg8XaHJsIr9Hz5vH/4AuJ6O+/MY=
X-Received: by 2002:a05:6214:3116:b0:87c:1d41:575d with SMTP id
 6a1803df08f44-8863ae8993fmr36101186d6.3.1764078878384; Tue, 25 Nov 2025
 05:54:38 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
In-Reply-To: <CAK5yBb8SJ79GDs5aGpz0MGuNNdKf26Z7nw81yNtAsUr9VNq01A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Nov 2025 14:54:27 +0100
X-Gm-Features: AWmQ_bnHgFL_KqvYjmt1Mys0VOZOpe-5esJlMiHLxskANWkCyzOYslW2xVqfocw
Message-ID: <CANNYZj_dHLwvmknhhXjJwak9_G6cu2COOWhBeqv5HE_C-TDZAA@mail.gmail.com>
Subject: Re: [OE-core] Yocto Project Status 18 November 2025 (WW46)
To: Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Cc: Joshua Watt <jpewhacker@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 13:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226769

On Tue, 18 Nov 2025 at 16:55, Stephen Jolley via
lists.openembedded.org
<sjolley.yp.pm=3Dgmail.com@lists.openembedded.org> wrote:
> We aim to build 5.3 when the remaining identified issues with bitbake-set=
up are resolved:
...
> Other potential changes that have been discussed but don=E2=80=99t have w=
orkable patches yet:
>
> defaulting to a common sstate directory and hashequiv server

I looked into this a bit. The key question is how would the lifecycle
of such a server be managed (e.g. what starts the server and what
shuts it down, since we don't want to leave users with mysterious,
dangling processes doing nothing).

I think a workable approach would be this:

- bitbake invocations would continue to start (and stop) private
server processes that are accessed through a unix socket inside their
respective build directories
- such invocations would be configured to use a *shared* sqlite
database that is inside bitbake-setup's top directory
- sqlite documentation gives reassurances that this is okay:
https://sqlite.org/faq.html#q5

An alternative would be to somehow manage a common, single server, but
I just can't figure out how to do it automatically, and without fuss
and complications. Something has to start it, something has to shut it
down. It must be available when any bitbake invocation from any setup
directory happens. Users should not have to issue special magic
commands to make it work. I think sharing the database is far easier.

So the particular nomenclature for this would be:

BB_HASHSERVE =3D "auto-shared-database" (e.g. start and stop the server
automatically, but configure it to use a common database file, unlike
'auto' which keeps the database private to a build directory)
BB_HASHSERVE_SHARED_DB =3D "/path/to/common/hashserv.db"

bitbake-setup would put this (and SSTATE_DIR) into site.conf that is
symlinked into every build.

Terrible idea? Tell me :)

Alex

