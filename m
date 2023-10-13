Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE997CDB483
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:04:28 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web10.34465.1697187858681430549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QozA4gq1;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7a26fbfcf8eso70089739f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 02:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697187858; x=1697792658; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tGhUxPamtgpdI4wrcJ1VxUzhOLlDSsj9E9++yJmu/8=;
        b=QozA4gq1t3kZ8sjzjgAxsngY6njfc8U0yuFRj9VAGQPvmgYBRzajY6QWyJrp+9n8N1
         IPyUkol9hdZjUoPOvmCs2r7AEs7D+O8JEYLv0Vhuk4VF4iE6Wh29+8TeRckwIAo/44SW
         LLw8EJr2JlTvyrz4viYQlvZFr8oILpkEcddt9Ig2RgfsoDQZsZeT1Rb/yPu+05dzvHzF
         ajRl7DjPAuwBTEtNllHYtCtQIgjkYF+jNJfok3cQaOZNmXnOld/LhXNi//ZcsTJxibvX
         a+69nAV3+AmDqqrJnc4i6ZsCs32kJQd74eRVxa1VyvpdWQyx9FKTyPdmy66MAqQbXc4b
         dozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697187858; x=1697792658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tGhUxPamtgpdI4wrcJ1VxUzhOLlDSsj9E9++yJmu/8=;
        b=Fr/9Y7VOiAdIQgN9GZfQ4Ru616DZmO2T96t2/ARQ3rJ3+vLsHvjIU5sdBOlqtltm1K
         SoVPTr92+E8gYWJfbuySp2I0aVFiOljXWdNghzH23pEfCd55p8cxygQoRsXqvuCqLkf9
         ebn00yiyBSancgPOZx3P6Q2xbzSOLonode9Tu29//xb/xERLHdRTLkd3AoQGFad7+SB4
         OLDLRkCqxOtisMBlq/YeNRMwWTc/fa6UNaPXWY+7DKWeVNiRiGB5TiYZdxBw7NEZhEBe
         dHnJQpFpg9tu09+wKfNuEPaI9ZeLgTrmu5z6iuT4+utIhrDdK0TsSXZ0/Nx6JfbZZF2E
         EUlg==
X-Gm-Message-State: AOJu0Yx+zNfapEvZ3s219y4qO4VRPIPu9g9eW0rl5KbnK4Xg9B20nOX7
	CkUcSPjJMIim+EWyLKT6Ao6sbIGxULwHn3q8TCG3draoQ50=
X-Google-Smtp-Source: AGHT+IFzZVAk1pW9UzcfEvcwgSi5QPAPMNbAi7OWuB423xos2LO+xlbwykK1da45hO9jLKOEAf3qsnA2vzb3gEYiSmc=
X-Received: by 2002:a6b:5c09:0:b0:790:c259:4ee5 with SMTP id
 z9-20020a6b5c09000000b00790c2594ee5mr30206696ioh.8.1697187857816; Fri, 13 Oct
 2023 02:04:17 -0700 (PDT)
MIME-Version: 1.0
References: <b4caf8ff-c5e6-69c6-bcaa-8caa659a2220@crashcourse.ca>
In-Reply-To: <b4caf8ff-c5e6-69c6-bcaa-8caa659a2220@crashcourse.ca>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 13 Oct 2023 10:04:06 +0100
Message-ID: <CAO5Uq5QJLC_u+tzMb39a7WFwFd8Be+hhiSCpQbEipWEv_nGS7Q@mail.gmail.com>
Subject: Re: [OE-core] why does rust recipe file define "rust_do_install()"?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189046

On Fri, Oct 13, 2023 at 9:21=E2=80=AFAM Robert P. J. Day <rpjday@crashcours=
e.ca> wrote:
>
>
>   i'm perusing the rust_1.70.0.bb recipe file, and i'm puzzled by the
> fact that it defines its own do_install() to simply call
> rust_do_install(), which then implements variations of that function:
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/rust/rust_1.70.0.bb#n244
>
>   do_install () {
>     rust_do_install
>   }
>
>   rust_do_install() {
>     rust_runx install
>   }
>
>   rust_do_install:class-nativesdk() {
>     export PSEUDO_UNLOAD=3D1
>     rust_runx install
>     rust_runx install clippy
>     ... snip ...
>
> i'm familiar with bbclass files defining things like that; eg.,
> autotools.bbclass defining:
>
>   autotools_do_install() {
>         oe_runmake 'DESTDIR=3D${D}' install it if it exists.
>         if [ -e "${D}${infodir}/dir" ]; then
>                 rm -f ${D}${infodir}/dir
>         fi
>   }
>
> but examples like that are generally then listed in EXPORT_FUNCTIONS
> so subsequent recipes can invoke them as part of *their* do_install(),
> like this snippet from the tar recipe:
>
>   do_install () {
>     autotools_do_install
>     ln -s tar ${D}${bindir}/gtar
>   }
>
> but i'm not sure why the rust recipe file is doing what it's doing.
> could it not have just defined variations of do_install() and gotten
> the same effect? or is there something more subtle happening here?
>

Inertia, I think. If you read back through the history in
oe-core/meta-rust the separation between pieces has changed over time
- probably when the .inc  was merged into the .bb I should have
refactored it as you suggest, but when the cycle time is as slow as
the rust build, trying things for the sake of it isn't fun...

--=20
Alex Kiernan

