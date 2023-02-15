Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3C7C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 20:53:43 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.4765.1676494415480790816
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 12:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fr1ES9vr;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: jpewhacker@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id fj20so84607edb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lt9C0MZhjY3vYrDvy7uuyS3S4xxGjyaugzKmOoqob3o=;
        b=fr1ES9vrYyj/JZ2QxY5ZUG+xQPwHz3OZcgOcyX0gFXxZMNy/wLF+0BF/x6mgZFy1s0
         eTOUXC/TzoNorJUMcJdKxlLwDp0ixDKpjWuv509vEdba2Xg5JiIWIa/dtA+MC+0pZtne
         gnyV/oXc2qTvngXp41sxT02L+MHfIaZeP7Hbkp/r+fXJ2c9Raa7Fyd8q+D5H95NvV38w
         DGi7QWG6guoJNgCyIKMYA4QdLNZnxFCui8f0S/RJY8a1H9PAXZLa/p7nEPwQgYt4ABAL
         TXT+y53yfD+EFyD0Paon7guY5dxbkCYtOhhqtkOMNpE2T/zjU83bsjt6aN9d0XYU6WLy
         FDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lt9C0MZhjY3vYrDvy7uuyS3S4xxGjyaugzKmOoqob3o=;
        b=A2bjFVbrKBcfR6C1oSq++0oD96PBK5nWPMhaRFRvNoIOOpZl9gSjZi8xmaPeN6tAwA
         iRkPhfxuCC/3bh9TEAWMd2SxktB8xjl+YzcfGEuXjDtycoYVBPa0Dq2//qjtwkrEZao+
         E4rgTRSGsRRjDLfj7KnmeU6YlFDicsgB2wSt+AkckgBhoy0wqG0uYFJB/8+u2dzrbIZN
         hDb4egL0t06fKIjBNg22uBCk4LkGwKaY9RQU7M0EnpaYfiDOe0r1HIoBR+Ok1rqLW2yi
         uyUoYJtej8XH7VAXTMkbDOgQTPL48a69ku8o6bt5xDeRIcLTq9VYD0XWUP1LqTspRW9z
         iMVA==
X-Gm-Message-State: AO0yUKXQMqilyOdvDNca1dubJ/j7MmB67Mh+DErJZEtgYm/lJQaNRKyt
	FAd/QWKjJ22Ys4+90o8F3JPyjM2lSwMj6wg6Z5w=
X-Google-Smtp-Source: AK7set/WaH99RAde6/T0HaIBM0uf2lWWeCG9WNyULkWng0FxOFFnI+pePIgpRcGTcCcP2KHWqny7zZsbW6CDl4IG1yI=
X-Received: by 2002:a50:c050:0:b0:4ac:b481:2b7c with SMTP id
 u16-20020a50c050000000b004acb4812b7cmr1887071edd.2.1676494413901; Wed, 15 Feb
 2023 12:53:33 -0800 (PST)
MIME-Version: 1.0
References: <20466372-402f-4659-fa23-e72461b6199d@linux.ibm.com>
In-Reply-To: <20466372-402f-4659-fa23-e72461b6199d@linux.ibm.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 15 Feb 2023 14:53:22 -0600
Message-ID: <CAJdd5GbfXCF=sEx8Y8g3DF0=TurNipemT9b2A1iXdOOg2xsA4g@mail.gmail.com>
Subject: Re: [OE-core] Can create-spdx handle multiple components per recipe
To: Joseph Reynolds <jrey@linux.ibm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 20:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177215

Joseph,

Currently create-spdx will only report on the recipe itself and the
packages it produces. It's been a long standing TODO to make reporting
of sub-components like NPM packages and rust crates better, but we
haven't gotten there yet, partially because I'm not very familiar with
these technologies. If you have some experience, it would be great to
get some input on how to best handle these things.

One of the biggest problems is that often these technologies do
"sneaky" downloads of packages that we don't know about in the recipe,
and thus can't really report on. We largely fixed this in rust by
making user enumerate the crates they use in SRC_URI (with some
tooling to help automatically generate the list), but it looks from
the recipe you've linked to, this is what is happening in webui-vue.
Because of this its going to be extra hard to report on any
components, since we simply aren't aware they exist (at the recipe
level).



On Tue, Feb 14, 2023 at 2:27 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>
> Team,
>
> Thanks again for continuing to improve Yocto/OE.
>
> I have a question about the capabilities of the create-spdx.bbclass.  I
> understand it will can an sBOM entry for each recipe.
>
> Can create-spdx.bbclass handle multiple components per recipe?  For
> example, my bitbake recipe produces a web application which packages
> many HTML components.  I would like to have the recipe included in the
> SBOM together with the components which are packaged into the web
> application files.  Is there a way to do that?
>
> Specifically, the OpenBMC web application uses various NPM compoents to
> provide it functionality in the end-user's browser.
> Recipe:
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-phos=
phor/webui/webui-vue_git.bb
>
> Project source: https://github.com/openbmc/webui-vue/
> NPM packages are specified here:
> https://github.com/openbmc/webui-vue/blob/master/package-lock.json
> Package-lock docs:
> https://docs.npmjs.com/cli/v9/configuring-npm/package-lock-json
>
> I want my SBOM to include the webui-vue application together with each
> of the NPM packages it uses.=E2=80=A8  How can I do that?
>
> Sincerely,
> Joseph Reynolds
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177174): https://lists.openembedded.org/g/openembedde=
d-core/message/177174
> Mute This Topic: https://lists.openembedded.org/mt/96969479/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

