Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D44DC7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 08:33:35 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] run-postinsts: Set dependency for ldconfig to avoid boot issues
To: openembedded-core@lists.openembedded.org
From: "Jermain Horsman" <jermain.horsman@nedap.com>
X-Originating-Location: Groenlo, Gelderland, NL (87.249.123.12)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 04 May 2023 01:33:29 -0700
References: <CAMKF1soAYAOWOfuQoejoKTqhxsa8NLShVe6osTyqnDvKzpEM2g@mail.gmail.com>
In-Reply-To: <CAMKF1soAYAOWOfuQoejoKTqhxsa8NLShVe6osTyqnDvKzpEM2g@mail.gmail.com>
Message-ID: <27200.1683189209167253697@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 08:33:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180853

On Thu, May  4, 2023 at 02:12 AM, Khem Raj wrote:

>
> should it depend on ldconfig being in distro features ? it may not be
> there on all systems.
>

Do you mean we should add it conditionally based upon the value of distro f=
eatures?
Or if it is required to have ldconfig included in distro features for this =
change?

If it is the latter, an After=3D dependency on a service that does not exis=
t should not have any effect.
An After=3D only means the startup of this service is delayed until ldconfi=
g has finished starting up.
If ldconfig.service does not exist, it can never be started and there is no=
thing to wait for,
meaning this service will start as soon as the other After=3D dependencies =
are met.

