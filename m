Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93ADCC2BD05
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 11:28:11 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.138259.1719228485670579984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 04:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fOIF6+EX;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so51954191fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 04:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719228483; x=1719833283; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3upcxF96Op/jvGE4YdfNIY+TecIM/ZG19ry8rDICH0=;
        b=fOIF6+EXFaeYI8m6l6Hn1m7XSWSmb8VsjBt7aOoWDeTnJqBqnv+5qTgc3lfcnaxJMD
         2WUk0JsiJl6pB2dPSnpJ9R43J6eqRkD67/x++bPrJz0McHDMJouBH3K8YGOeQ86RyWcW
         4OyFG2xJUcQIV692+mYgzLjXbbuonVpd+5evFfasl4T1sIBpZ1CnP+eFBdXpNrGDeG+S
         mp/t2JA2ahE7gPuZ8ljuZKbaVWZYQyrcY3EjekTe/6BBScbK4qRfeBFRrXEmf8gj7d1F
         xD76fm30JKecZvkvtnQEjffM3cNmbv2GLwpWaGtWAk9diG26qg1Unp5S4SC0/gRHgwOK
         SQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228483; x=1719833283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x3upcxF96Op/jvGE4YdfNIY+TecIM/ZG19ry8rDICH0=;
        b=dTXGTd6a9EcN1pj6vQuLGHbPqjjGZPzBGC8lA/GJbR8Az4JmksGPgSV7TYoFNwPadz
         voi8UdiUGLk5tYIpi3A1+KB7DDmseoMmqjeDGIvs6ZkokZxCwVOuJG/cL0EGNjorXR0k
         4WlgguKoygco7D2JFyyvE8vM3aMYvoOgDDoa1fV9Zf1jbgaRxlK5R2Rw4aLnOBVns1NW
         x1+cwsWPKNHeCN44t5/JckrgiXJOHH9gYglSAt7dHO4KwdcPkbMQOIKnFY2HVNLS+abH
         JshLfg/NRziWUav7MIsq+HjlbJbbXqDTn1hjnePRKs33tdwKkX3kkHdsfW+reyY7Nr7D
         EZJA==
X-Gm-Message-State: AOJu0YzPMPaB1tlhG2kYSJGKcPpyEPCOFZjAGyGL1vo9VIt62TLzzOCB
	MEXM+2DhMQNIf1CLjJx7XE2qPKv1CDVz4o5VP8U4zOJcClLC7A5BAWQ2b7B/z3Zi/AJ6YAxXIgY
	EpQZtp/6PBcGhhlS/g0bQwzJqwpk=
X-Google-Smtp-Source: AGHT+IG7RKMuaIJvgIazJkxk37fL185TKibW5EfKmOSbHGiOn4HCohZEbGv30SLtB1/XMkZW+kIP6BI6bGfe+ODJy1Y=
X-Received: by 2002:a05:651c:1046:b0:2ec:6756:e3ea with SMTP id
 38308e7fff4ca-2ec6756e4d7mr1675261fa.43.1719228483421; Mon, 24 Jun 2024
 04:28:03 -0700 (PDT)
MIME-Version: 1.0
References: <QrUS.1719222991270481706.aFEU@lists.openembedded.org>
 <CANNYZj9TcPZ3oCiphS5v4X0s9qEHPxPm6EqjkayN-ZT3kWL2nQ@mail.gmail.com> <CAFt4JuGrWdtOjxOuJMkczL6AK3a0iiYtQGM34jk3Gr0Pf4JdOw@mail.gmail.com>
In-Reply-To: <CAFt4JuGrWdtOjxOuJMkczL6AK3a0iiYtQGM34jk3Gr0Pf4JdOw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 24 Jun 2024 13:27:52 +0200
Message-ID: <CANNYZj8eaSiyiAkCHgedu-+3T8ph3ETK_O4aq7T=y_kDCJ1JKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix broken dev package dependency.
To: Sreejith Ravi <sreejith.ravi087@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 11:28:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201078

On Mon, 24 Jun 2024 at 13:20, Sreejith Ravi <sreejith.ravi087@gmail.com> wr=
ote:
> The icu package is necessary for the compilation of libical; otherwise, t=
he build will fail. "Recommended" contains all the packages that are part o=
f the dependent build. If we try to install the recommended packages, it wi=
ll download and install many unnecessary packages, consuming hard disk spac=
e and increasing download time. Referring to the Debian packages, icu-dev i=
s a dependent package, meaning it is required for the build. "Depends" is a=
 must-have, and "Recommends" is optional. In this case, the ICU package is =
a must-have.

Wait a moment. What are you building and in which context? If you are
building libical, then I don't understand why libical-dev (which is
produced by building libical) needs to be fixed.

In other words, can you show steps to reproduce the problem?

Alex

