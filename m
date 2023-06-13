Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B759C7EE2F
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 03:08:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.5326.1686625718640730079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 20:08:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=oZK18sj8;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.49, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30fbac9639fso2139549f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 20:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686625717; x=1689217717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVu5AMa8Q9Z8gFztt9DUkjA/eGlj88F1HsYHYfAeUPA=;
        b=oZK18sj8LNcjaZQKGcYhBrXEIyARuLLSxfmAOljbTrYz0AtQNlCtyU4C89zDo2cNF0
         oqWB/zMwF3hGIhDOMpntCZ3NXH7URj2QabhZih0yaQYiVB6ZTw8RF8e4meyTO5Q6kxge
         cmlJYnJdrczAkVEw8O/962uocpSdC0ZCzz//u3j6wNnDi5cYo+zUPyARSeiF21CjvJ4h
         obozHU4i3M2/CJUiW5z55HS+xyPTs+eNQj/H/yYwEWLFcv7AW7fMgrBQnr9AueTf7m+0
         HsByNErg1gX5wbMujqAKZ+mX9oAfnVmjwpiCeIeCNvaly+F3Y9BicodoCuEGKlhoyREa
         eEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686625717; x=1689217717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVu5AMa8Q9Z8gFztt9DUkjA/eGlj88F1HsYHYfAeUPA=;
        b=T/VNvqrMNMQOvYYYCVk+I1yF/yyU+3hLqchxO/JDHH3o7lWvH9+vpVBUEMksyoD3Jd
         5DgiVl6oefmKTmj0x/qMi1D1zNNuUmOSrXSk5vcFaon/ztPdLheAkeu8ehuYNRuO0ilS
         Ip61dwCCNuBEod7jgaeg/yn0ERxu086hYBHwujNflHd6uZ7cYCRwPd+h/rmU2edq4k8f
         3RtxYTdMq4fsJQjqNG6dzDU07Im1XwN1DlC66sKvUmz8MBoemS5RQgf7Kau7DDDPbU/b
         9XvGcw2YNkwzUXZJoJokZDJKdxPiy/cPUaPN7TzFn2VfjfRmk9Noz79+q7XEmw/bpgvX
         dnSw==
X-Gm-Message-State: AC+VfDzBWQDlcr8FTjOVJOxF0EYwKw5crUXOHHlN51DWIor9uTfRtIg8
	BXEUTl29/oxJoiXX885C78dmKcnPsmIUmiWImyI6yQ==
X-Google-Smtp-Source: ACHHUZ7YXgZLUzcCRtGJEdueUdjCjrcv1I3XXsk9DkcM39ZOaGW7aQ8BXaWl93R4cWTXM/V6IzUOiXBK/9YV0RGQvIA=
X-Received: by 2002:adf:f245:0:b0:30e:3d3c:1b67 with SMTP id
 b5-20020adff245000000b0030e3d3c1b67mr5785918wrp.8.1686625716596; Mon, 12 Jun
 2023 20:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230328084141.49802-1-Qi.Chen@windriver.com> <CAAaKDhEE0PDexvfPYDcn27Sxzs78Db=Br9GNb+DbQ7MVH8oizw@mail.gmail.com>
In-Reply-To: <CAAaKDhEE0PDexvfPYDcn27Sxzs78Db=Br9GNb+DbQ7MVH8oizw@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 12 Jun 2023 17:08:25 -1000
Message-ID: <CAOSpxdb+Z+nOB0u4qyqxD50bEhyAqXijBgwmH4-LcJNp6NLUyw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssh: fix CVE-2023-28531
To: Ricardo Salveti <ricardo@foundries.io>
Cc: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 03:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182691

On Mon, Jun 12, 2023 at 4:00=E2=80=AFPM Ricardo Salveti <ricardo@foundries.=
io> wrote:
>
> Hi,
>
> Was looking if CVE-2023-28531 was backported to kirkstone already and
> noticed this patch was already proposed before, but not
> merged/accepted.

Sigh, it looks like I somehow missed this one and no one followed up on it =
:-(

I've got it in my test queue now.

Thanks for letting me know!

Steve

> Since it showed up once in the metrics report, was it decided to be
> ignored in the end (but then I wasn't able to find it defined in
> CVE_CHECK_IGNORE)?
>
> Thanks,
>
> Ricardo
>
> On Tue, Mar 28, 2023 at 5:42=E2=80=AFAM Chen Qi <Qi.Chen@windriver.com> w=
rote:
> >
> > Backport patch to fix CVE-2023-28531.
> >
> > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > ---
> >  ...-destination-constraints-for-smartca.patch | 35 +++++++++++++++++++
> >  .../openssh/openssh_8.9p1.bb                  |  1 +
> >  2 files changed, 36 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-upst=
ream-include-destination-constraints-for-smartca.patch
> >
> > diff --git a/meta/recipes-connectivity/openssh/openssh/0001-upstream-in=
clude-destination-constraints-for-smartca.patch b/meta/recipes-connectivity=
/openssh/openssh/0001-upstream-include-destination-constraints-for-smartca.=
patch
> > new file mode 100644
> > index 0000000000..b4e7ce7ef6
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssh/openssh/0001-upstream-include-d=
estination-constraints-for-smartca.patch
> > @@ -0,0 +1,35 @@
> > +From 91889b5a3e7554af474a21ce8e1ffd3eb1542f06 Mon Sep 17 00:00:00 2001
> > +From: "djm@openbsd.org" <djm@openbsd.org>
> > +Date: Thu, 9 Mar 2023 06:58:26 +0000
> > +Subject: [PATCH] upstream: include destination constraints for smartca=
rd keys
> > + too.
> > +
> > +Spotted by Luci Stanescu; ok deraadt@ markus@
> > +
> > +OpenBSD-Commit-ID: add879fac6903a1cb1d1e42c4309e5359c3d870f
> > +
> > +CVE: CVE-2023-28531
> > +
> > +Upstream-Status: Backport [54ac4ab2b53ce9fcb66b8250dee91c070e4167ed]
> > +
> > +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> > +---
> > + authfd.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/authfd.c b/authfd.c
> > +index 76e48aab..dca8e55b 100644
> > +--- a/authfd.c
> > ++++ b/authfd.c
> > +@@ -665,7 +665,7 @@ ssh_update_card(int sock, int add, const char *rea=
der_id, const char *pin,
> > +     struct dest_constraint **dest_constraints, size_t ndest_constrain=
ts)
> > + {
> > +       struct sshbuf *msg;
> > +-      int r, constrained =3D (life || confirm);
> > ++      int r, constrained =3D (life || confirm || dest_constraints);
> > +       u_char type;
> > +
> > +       if (add) {
> > +--
> > +2.37.1
> > +
> > diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/=
recipes-connectivity/openssh/openssh_8.9p1.bb
> > index 6057d055f4..d81072537c 100644
> > --- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > +++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
> > @@ -26,6 +26,7 @@ SRC_URI =3D "http://ftp.openbsd.org/pub/OpenBSD/OpenS=
SH/portable/openssh-${PV}.tar
> >             file://add-test-support-for-busybox.patch \
> >             file://f107467179428a0e3ea9e4aa9738ac12ff02822d.patch \
> >             file://0001-Default-to-not-using-sandbox-when-cross-compili=
ng.patch \
> > +           file://0001-upstream-include-destination-constraints-for-sm=
artca.patch \
> >             "
> >  SRC_URI[sha256sum] =3D "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdac=
cd262380ae58bec5e7"
> >
> > --
> > 2.37.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#179213): https://lists.openembedded.org/g/openembed=
ded-core/message/179213
> > Mute This Topic: https://lists.openembedded.org/mt/97901027/3616986
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
ricardo@foundries.io]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Ricardo Salveti

