Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDA4C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 14:12:03 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21972.1782828717201292966
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 07:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NPsJKmqq;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: jpewhacker@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80b9993928dso50126217b3.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 07:11:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782828716; cv=none;
        d=google.com; s=arc-20260327;
        b=K4SASb2U80quVLL/g/DQVz/nn4IP8bTUVrnA/Q5KCHeFr5YQ6ud1j4E3mle6JvC5rs
         B+RoNLFv2ZCD5PLg44rhCIGiUIYNY0o1t3tIUsNKewY+u16wcwow2fl/5Vbc9hFZ8HE8
         G8Pyrgjg1mSsIIQ5Z9K5bFssoHfslxu8RS1dZgrEIE/0Yka/Zu61tVRxW/+/IpzRiUJv
         zEjkoGA+bQSeBZ9JpAHfi+xqWYABbkMSR40gId1c/RyJgseJE3bqMPt19DUWCXa6ShG9
         77x73PN2WtDaO5lFUUWaEBHXqYQc5ayimJkbsUywW/OK5DSnlfBsIyrdAHVcZbQQSBH7
         GD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NnO1oRA8D1qShBTrMkw5pwWvTzdaT/cjL+mxWe3a3To=;
        fh=huhnOun6EjLPDHxJbsMhjuNHl+6lF/r83Mttstfhy+I=;
        b=CCIzPe0p8Q5b+thc0Sr6Bnvo5RQr/SqA2biJLN2HFDSCZMVveEtKX+R3jibI9Yxtj4
         tSSgVOEHgBTEgQMy35m+TzmKAzwmWMaoW5Itv9UwVUoMeeDtYw6B6oZeLGsBJ9r1Qu8d
         hhWVIx733Ze2JddTUVR16JdnCwd/WAJzNgpXl+RxRyZEGuQ26bOUZkO1DpJD58YIoj0k
         /vGzfhD6OvYL39dudcaz6GABjXe7UWpP7ElzTVhnzaaeI5wdCJ2G7VpStHN5j4nJbdBz
         PeabPJVIHkf0za7uYQmfVNFKg2xqdMyh3yYJA15XN1Hw1tF3H+zVTCpVUmtfj4d7wlU/
         Iw9Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828716; x=1783433516; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NnO1oRA8D1qShBTrMkw5pwWvTzdaT/cjL+mxWe3a3To=;
        b=NPsJKmqqy/oHfO5V3qjLvuer0iwle5sEpkCcYMHoieaY6KLfrXc+S5L92/modXDAto
         XMoliywkw47cGewX87PXQqX0tc6YWRf06728PnbCqKZbt5PN7BE2lkc3mOpo0uLCcFqX
         Ietyo6m4zWzR4lIkZ75nDq0wk2LHixFiPJwfBcBqBjzQQ/m8IF5A8Ej7uyFjXdm4iN59
         wARIynvXuGMZ/fSjYAGn6n1Q7Q5LcRE9LVOr/OJ9HV2E9i+IN+dHUXiwhCA0S7ISgxIg
         9eZYqugQa/pqpxFu/OA/vlWFSCb+r0U1Vl5P4xBQAW5UIR/C54YlCJHHegHJoAKfhgLw
         IGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828716; x=1783433516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnO1oRA8D1qShBTrMkw5pwWvTzdaT/cjL+mxWe3a3To=;
        b=GX1RvGOblZV1Fo4zJ4bxixStklIXDou1d3GElAXR8z3jfO7ojjoc9lJNQILrGFC6xT
         8F5A95b7wKO5D1ZsDHaLIO0jqIWEZiiEj9gcZbZmnH9lm/YAdv5wpISFjI1M263VfPba
         JiWM+Gw3oDHMFZ3rY1/weemsMSXFfkY0laZv2mbtS7sb1unWLtj1wOknVH0KK+tkkH4j
         SrSyXKuhevG2yLsXSInjKw8FyXNgKtLtA5LJgH6AT2VeZ3riAHJj7XlXECNtSywiX9DJ
         oheAZT3h6UU8+oSaBc3DpmxQ4eJbewOoQZ6kgChwctgwFCc4jpAHCLA5xo1IvdIghrin
         XZBg==
X-Gm-Message-State: AOJu0YyZlJ40sdiuFEpKN0w9h+TKxAlr8Dhn3jGSJ5lyELARyWbHgD9U
	7F40kqKrRBZVFgmC/UZUpR4QKGIdNbFMRqNuIgeIJamYg84xrCKImvyBWA9wgqn42gAtuFCN2kS
	SpG1YgpChMCBuKVcg6mjsOsd8AG9wAFE=
X-Gm-Gg: AfdE7ckSakb/DU5Y2zCRqGS5N5ZR2ITVafy07seS1wdr89xseTSspIOhZQjv9N+pkWU
	CmPYjGwIbH6Cl64mJmc4BfJzN3R5OPYqnkakY5+DRdsVYNwDzS9a+xWCiNhiE7V03/1yKGOFSG4
	apwBZ0xCq3E3TeBjUhYK1Cu/A908HuARt9PGGZHgIGdlkf54JrIiqZwxd8NmEhx496mZghGhcJC
	nSOCxFKe0FRxM7FbWImSzucbKWjc0KHqpqo1FUO2DlWB5G0Efr3Yw0NACZp+4mRiDQju25gEJwR
	f8l4zjCPKQ8=
X-Received: by 2002:a05:690c:3609:b0:80b:9afd:dbd2 with SMTP id
 00721157ae682-811ff98247dmr6017377b3.7.1782828716055; Tue, 30 Jun 2026
 07:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <0101019f11d7a8cc-83804a7d-3721-48fb-89c9-4a1ad38679cf-000000@us-west-2.amazonses.com>
 <18BDA8231763D04D.114350@lists.openembedded.org> <CANNYZj9RWChsKe-Pq9PyeB7iiMEwNu3TcszO4W3sw+S_oScrag@mail.gmail.com>
In-Reply-To: <CANNYZj9RWChsKe-Pq9PyeB7iiMEwNu3TcszO4W3sw+S_oScrag@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Tue, 30 Jun 2026 08:11:44 -0600
X-Gm-Features: AVVi8CcF2ogv_Gb3HxxyrWQqMCca0wKHE3A58-1rC7MZYgYvK0Oq1zsbHeA8RII
Message-ID: <CAJdd5GYmQ5docZ47zLWBv+=uy=tAjPNWooAfOSFYLc1X1eGvdg@mail.gmail.com>
Subject: Re: [OE-core] [AUH] nasm: upgrading to 3.02 FAILED
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="00000000000050e0b106557928a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239902

--00000000000050e0b106557928a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 5:05=E2=80=AFAM Alexander Kanavin <alex.kanavin@gma=
il.com>
wrote:

> On Mon, 29 Jun 2026 at 22:44, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
> wrote:
> > This update needs a non-trivial rebase of the patches that add
> > debug-prefix-map option. I've asked Joshua to do that in the upstream
> > submission:
> > https://github.com/netwide-assembler/nasm/pull/8
>
> Joshua has provided rebased patches but unfortunately they do regress
> the reproducibility:
> ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libswscale.so.9.5.102 in package ffmpeg-dbg contains
> reference to TMPDIR [buildpaths]
> ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File
> /usr/lib/.debug/libavcodec.so.62.28.102 in package ffmpeg-dbg contains
> reference to TMPDIR [buildpaths]
>
> I've pushed the work in progress to this branch:
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dakanavin/=
package-version-updates-later
>
> I vaguely remember fixing up the patches before:
>
> https://git.openembedded.org/openembedded-core-contrib/commit/meta/recipe=
s-devtools/nasm/nasm?h=3Dakanavin/package-version-updates-later&id=3D0d7d96=
fb0b215e56f6dacd4dd44b12bbd7ecdd34
>
>  but it would be much better if the specialist (Joshua :) takes over
> the version update.
>

Ya, I see the problem. Looks like debug data strings are not being
translated anymore. Let me look into that


>
> Alex
>

--00000000000050e0b106557928a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 30,=
 2026 at 5:05=E2=80=AFAM Alexander Kanavin &lt;<a href=3D"mailto:alex.kanav=
in@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Mon, 29 Jun 2026 at 22:44, Alexander=
 Kanavin via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt; This update needs a non-trivial rebase of the patches that add<br>
&gt; debug-prefix-map option. I&#39;ve asked Joshua to do that in the upstr=
eam<br>
&gt; submission:<br>
&gt; <a href=3D"https://github.com/netwide-assembler/nasm/pull/8" rel=3D"no=
referrer" target=3D"_blank">https://github.com/netwide-assembler/nasm/pull/=
8</a><br>
<br>
Joshua has provided rebased patches but unfortunately they do regress<br>
the reproducibility:<br>
ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File<br>
/usr/lib/.debug/libswscale.so.9.5.102 in package ffmpeg-dbg contains<br>
reference to TMPDIR [buildpaths]<br>
ERROR: ffmpeg-8.1.2-r0 do_package_qa: QA Issue: File<br>
/usr/lib/.debug/libavcodec.so.62.28.102 in package ffmpeg-dbg contains<br>
reference to TMPDIR [buildpaths]<br>
<br>
I&#39;ve pushed the work in progress to this branch:<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/log/?h=3D=
akanavin/package-version-updates-later" rel=3D"noreferrer" target=3D"_blank=
">https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dakanavin/=
package-version-updates-later</a><br>
<br>
I vaguely remember fixing up the patches before:<br>
<a href=3D"https://git.openembedded.org/openembedded-core-contrib/commit/me=
ta/recipes-devtools/nasm/nasm?h=3Dakanavin/package-version-updates-later&am=
p;id=3D0d7d96fb0b215e56f6dacd4dd44b12bbd7ecdd34" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/openembedded-core-contrib/commit/m=
eta/recipes-devtools/nasm/nasm?h=3Dakanavin/package-version-updates-later&a=
mp;id=3D0d7d96fb0b215e56f6dacd4dd44b12bbd7ecdd34</a><br>
<br>
=C2=A0but it would be much better if the specialist (Joshua :) takes over<b=
r>
the version update.<br></blockquote><div><br></div><div>Ya, I see the probl=
em. Looks like debug data strings are not being translated anymore. Let me =
look into that</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Alex<br>
</blockquote></div></div>

--00000000000050e0b106557928a3--

