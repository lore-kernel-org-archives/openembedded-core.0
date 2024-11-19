Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7698D6C28B
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 19:11:31 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.30089.1732043486844559148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 11:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZbdQe1Sq;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.180, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6ea0b25695dso12819877b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 11:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732043486; x=1732648286; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BePypRhXawrYCpkDcrTrkS3OqcDMZ4BaY/XHlFvHw1I=;
        b=ZbdQe1Sq3ggiqYPKnc4dyi+u2YheOdVXcFs98wqxZYp6G0x7EMytmaqDsm5GFnioFh
         s/jt05l8uH+eZA99q80M7Nu2qjmADNZ0eXviPLy1BTTcLoVw0egZAAFDmnt7/+MxCJpm
         P/Ij5ufrbe45q8bLnXLzxIjTVi2JPhkeGGnpBqh4pRWxgZgbNcHhFvN8Vrx5IfPue2gs
         Y5S+3gTDElY0DgKeLdwg6cBnzPoZNlRY3La/y2Qhlh46PjOuCgE2JHP2RGDFiWEjNDii
         ai/LtTFy6OzBSYh0Rl96suNLzjxaaDTFicthHNK5KXkhQNqcowTDzg2CfxUtnIj5OBvy
         E+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732043486; x=1732648286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BePypRhXawrYCpkDcrTrkS3OqcDMZ4BaY/XHlFvHw1I=;
        b=nloRCJOkRcKwqt9IeB9lCNvoBMxLBleFuRTUay0yqXC3TpIYu/FJVgEFSeqWUF/0F1
         BEHO5EoT9k4cT9BxbNmkXnSX4wbBSK4HyaZee0qaPy3Fe6aDMYOTW6yRzmaYb/aTI8f5
         ZCoGIzRdyTpcVIviLkRJrfIj4U+xAzU4DPcCXZbhneBYBs2S3FgCmZr6YRXxmEmnzlVy
         H7NCWPujLHsSRCMiXyLc5NGEVdU5Q6u4qEHe9fACbcfIygHMR/9MBrKBHbDV9mXH19XM
         zL4BvDR3/i7frvNqjeuZmJ9RjWMg/LyFX9CcFfoduv6QxDnEIyJKUjrq3+eHsN+snDz+
         lx0g==
X-Gm-Message-State: AOJu0Yz0UD3cxtolCufcrBlKHEs2zEoPui3e+FWip0EZtEFACXIxkMbu
	3vr/m4R7y0IdXtlMJZgWY4bj1ZYKAnhJ8unljlIeMqqKu0pHUxM7X8Z6FSqw/diuep564Zh6qJt
	+1W+wj2b7Ak/jsTu8zp92xcGXZpNt+w5PnqvtKDvA+DcVznjq
X-Google-Smtp-Source: AGHT+IF6G5wV6cHNGvf93IEPyhVVPJK5AoGRuv4neIUfDpijXjsXlm+q4AM3IIIvFK4Wrj4XxtvwEiamTWUS4dbgvoc=
X-Received: by 2002:a05:690c:6b11:b0:6ea:e967:81da with SMTP id
 00721157ae682-6ee55bee93cmr164174517b3.11.1732043485896; Tue, 19 Nov 2024
 11:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20241114123903.5013-1-vanusuri@mvista.com> <CAOSpxda14hwe7PQLGd-SsChSLNy9N3bWrL6qXx0HeoxhUuhZyA@mail.gmail.com>
 <CANQUz18-O4f4fQakw40dH6AsKZA7ZtRDHLutgew4JDLEkk-=PQ@mail.gmail.com>
In-Reply-To: <CANQUz18-O4f4fQakw40dH6AsKZA7ZtRDHLutgew4JDLEkk-=PQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 19 Nov 2024 11:11:14 -0800
Message-ID: <CAOSpxdZBxm23tODjFy1eKD_OekPHg+107-ut2ymofnY_ENrLMA@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] glib-2.0: Backport fix for CVE-2024-52533
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 19:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207406

Hi Vijay,

Thanks for investigating this.  I'll take care of adding the missing change=
s.

Steve

On Mon, Nov 18, 2024 at 8:34=E2=80=AFPM Vijay Anusuri <vanusuri@mvista.com>=
 wrote:
>
> Hi Steve,
>
> It looks like tzdata update to 2024b causing the ptest failures for glib2=
.0 in the file "glib/gdatetime.test" not with CVE -2024-52533.
>
> Below commit is missing in the kirkstone-nut
>
> https://git.openembedded.org/openembedded-core/commit/?id=3D0c8f87d5d4ec9=
f286b1e85d114cb9a728c1ff64b
>
> I think we need to pull/merge the above commit along with the tzdata upda=
te to 2024b.
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3D723c32ff858ccfd5a69e63e681a57903af928fd5
>
> Reference: https://lists.openembedded.org/g/openembedded-core/message/206=
095
>
> Thanks & Regards,
> Vijay
>
> On Tue, Nov 19, 2024 at 2:45=E2=80=AFAM Steve Sakoman <steve@sakoman.com>=
 wrote:
>>
>> Unfortunately I am getting ptest errors with this patch on both
>> qemux86-64 and and qemuarm64:
>>
>> AssertionError: Failed ptests:
>> {'glib-2.0': ['glib/gdatetime.test']}
>>
>> https://valkyrie.yoctoproject.org/#/builders/73/builds/403
>> https://valkyrie.yoctoproject.org/#/builders/61/builds/403
>>
>> Steve
>>
>> On Thu, Nov 14, 2024 at 4:39=E2=80=AFAM Vijay Anusuri via
>> lists.openembedded.org <vanusuri=3Dmvista.com@lists.openembedded.org>
>> wrote:
>> >
>> > From: Vijay Anusuri <vanusuri@mvista.com>
>> >
>> > Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/glib/-/c=
ommit/ec0b708b981af77fef8e4bbb603cde4de4cd2e29
>> >
>> > Reference: https://security-tracker.debian.org/tracker/CVE-2024-52533
>> >
>> > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > ---
>> >  .../glib-2.0/glib-2.0/CVE-2024-52533.patch    | 49 ++++++++++++++++++=
+
>> >  meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
>> >  2 files changed, 50 insertions(+)
>> >  create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533=
.patch
>> >
>> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch =
b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
>> > new file mode 100644
>> > index 0000000000..3a06a9d782
>> > --- /dev/null
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2024-52533.patch
>> > @@ -0,0 +1,49 @@
>> > +From ec0b708b981af77fef8e4bbb603cde4de4cd2e29 Mon Sep 17 00:00:00 200=
1
>> > +From: Michael Catanzaro <mcatanzaro@redhat.com>
>> > +Date: Thu, 19 Sep 2024 18:35:53 +0100
>> > +Subject: [PATCH] gsocks4aproxy: Fix a single byte buffer overflow in =
connect
>> > + messages
>> > +
>> > +`SOCKS4_CONN_MSG_LEN` failed to account for the length of the final n=
ul
>> > +byte in the connect message, which is an addition in SOCKSv4a vs
>> > +SOCKSv4.
>> > +
>> > +This means that the buffer for building and transmitting the connect
>> > +message could be overflowed if the username and hostname are both
>> > +`SOCKS4_MAX_LEN` (255) bytes long.
>> > +
>> > +Proxy configurations are normally statically configured, so the usern=
ame
>> > +is very unlikely to be near its maximum length, and hence this overfl=
ow
>> > +is unlikely to be triggered in practice.
>> > +
>> > +(Commit message by Philip Withnall, diagnosis and fix by Michael
>> > +Catanzaro.)
>> > +
>> > +Fixes: #3461
>> > +
>> > +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/comm=
it/ec0b708b981af77fef8e4bbb603cde4de4cd2e29]
>> > +CVE: CVE-2024-52533
>> > +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> > +---
>> > + gio/gsocks4aproxy.c | 4 ++--
>> > + 1 file changed, 2 insertions(+), 2 deletions(-)
>> > +
>> > +diff --git a/gio/gsocks4aproxy.c b/gio/gsocks4aproxy.c
>> > +index 3dad118eb7..b3146d08fd 100644
>> > +--- a/gio/gsocks4aproxy.c
>> > ++++ b/gio/gsocks4aproxy.c
>> > +@@ -79,9 +79,9 @@ g_socks4a_proxy_init (GSocks4aProxy *proxy)
>> > +  * +----+----+----+----+----+----+----+----+----+----+....+----+----=
--+....+------+
>> > +  * | VN | CD | DSTPORT |      DSTIP        | USERID       |NULL| HOS=
T |    | NULL |
>> > +  * +----+----+----+----+----+----+----+----+----+----+....+----+----=
--+....+------+
>> > +- *    1    1      2              4           variable       1    var=
iable
>> > ++ *    1    1      2              4           variable       1    var=
iable    1
>> > +  */
>> > +-#define SOCKS4_CONN_MSG_LEN       (9 + SOCKS4_MAX_LEN * 2)
>> > ++#define SOCKS4_CONN_MSG_LEN       (10 + SOCKS4_MAX_LEN * 2)
>> > + static gint
>> > + set_connect_msg (guint8      *msg,
>> > +                const gchar *hostname,
>> > +--
>> > +GitLab
>> > +
>> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/reci=
pes-core/glib-2.0/glib-2.0_2.72.3.bb
>> > index 35b51a3ec9..c628ac19af 100644
>> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
>> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
>> > @@ -49,6 +49,7 @@ SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-$=
{PV}.tar.xz \
>> >             file://CVE-2024-34397_16.patch \
>> >             file://CVE-2024-34397_17.patch \
>> >             file://CVE-2024-34397_18.patch \
>> > +           file://CVE-2024-52533.patch \
>> >             "
>> >  SRC_URI:append:class-native =3D " file://relocate-modules.patch"
>> >
>> > --
>> > 2.25.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#207156): https://lists.openembedded.org/g/openembe=
dded-core/message/207156
>> > Mute This Topic: https://lists.openembedded.org/mt/109572074/3620601
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[steve@sakoman.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

