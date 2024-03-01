Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D3D7C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 04:23:32 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.15361.1709267008721767851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Feb 2024 20:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HqM9JDUi;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e4c62b6406so407051a34.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 20:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709267008; x=1709871808; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3VrorBaAfrSKT/K5mo8UtMe6P3Q8P5LUwZfws7qQrg=;
        b=HqM9JDUisTUGHdvBBr+egFr76TQvuVIuRg5GHEOZ0Ns5Pb5cZxp2WCzvSKhxgmqAVn
         B/yQJC8MLKgFwsdJNAmd12D6gjmaGy36z2oTdxX3sa2U1HiL0WoewNRMO4kAmUxD/yT7
         faOgo/AHBFCIu+ANe8au7pfdd6WnLeEkk8E/0QihuL7ygc/fy8iVYEz4JFOA96AGz2m1
         ZB1qpOlAOB9RLn89ouewbIw82LTWA62oBx4bPhLECrXpHOx+Xi7ivuRQ4gNEGhYdCbxq
         F5+u6scIRnWNZM/zJN39Gn4ryL9UrOUe99PfZa3NwEbi/+ur8zTCNi75CjjzbLtHTatS
         uNXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709267008; x=1709871808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h3VrorBaAfrSKT/K5mo8UtMe6P3Q8P5LUwZfws7qQrg=;
        b=p4HMa/xDVmofpfMN5NYabs4AGqZ6hoEeLA4QEdKUg4AYaRJt/uwmx2fUvGo97Bu3Jv
         /v+99qoLtU44lnfsRrEXlvPtqK9vaFO3W5gx1mz/Bp6GR2NLA4oE1weW9od5ty2j3AwV
         Y1Ud/R/6Y7FxFP0nOD57fDa6weYHgZqrDtV2b3iP2m/1KsudqwZ0/Cjtn/hZINsK00T1
         qNCU713EnT/zi+wMXoga6dp8WXRdpc8UXZ3GgVxTDXCYqNRLDvHRrobFQYceSaGUvYZL
         wg+rp7wxxfnetUjqqdDtwofu6qB213l0+X0iN564omhZTxQrgfsM2kwmjvdeptM4u9X2
         0FcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG0YsnZaIGHCQ2ykWpYcp6djdJwuXOUbLAo7MsvQBv893gG6+sAANDl0lWfRpY//dYfFIaZ/SLxrvZoUQjPfNN4vDNi9fOoUQ7CDry8KoDZlmKrc2Iyo/W
X-Gm-Message-State: AOJu0YwF5sOK8+WAanRb0IdAnaHA1gl0iPhQIOvzzWlos9BpmPhF+wQN
	5uHsNrk9SrcBRmwDiTTvdSqqtKs6kUbdB8vx6Sp5raItQwsGHh45HzmXmuON43o370vD3t7WDhA
	SNKGExzH4sSa+X7GJXJF+DdrmWxA=
X-Google-Smtp-Source: AGHT+IEz1mk+vM+ca1TAw3qA4URScTNDHJE+idovR/Wrh4GJhuRALBqLT1cb9eHU9qhG1/0dyPS1RkUsY2/9MFKy/Ls=
X-Received: by 2002:a05:6870:75cb:b0:21a:37c5:1da7 with SMTP id
 de11-20020a05687075cb00b0021a37c51da7mr621008oab.0.1709267007837; Thu, 29 Feb
 2024 20:23:27 -0800 (PST)
MIME-Version: 1.0
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com> <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com> <CAMKF1sprdSK3FZuR+MeQX-pvWaiVKsoHG5fmEmd6n7so+6NM3A@mail.gmail.com>
 <c19cc481-ae19-4b25-9248-cd9faa862026@windriver.com>
In-Reply-To: <c19cc481-ae19-4b25-9248-cd9faa862026@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 29 Feb 2024 20:23:01 -0800
Message-ID: <CAMKF1srW2B4OWKSgcmntL87LbVNXXZ1_P4h64+WAbFBFzjv3=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@windriver.com>
Cc: Changqing Li <changqing.li@eng.windriver.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 04:23:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196454

On Wed, Feb 28, 2024 at 10:43=E2=80=AFPM Changqing Li
<changqing.li@windriver.com> wrote:
>
>
> On 2/29/24 14:04, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Wed, Feb 28, 2024 at 9:56=E2=80=AFPM Changqing Li
> > <changqing.li@eng.windriver.com> wrote:
> >>
> >> On 2/28/24 17:45, Alexander Kanavin wrote:
> >>
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.
> >>
> >> On Wed, 28 Feb 2024 at 04:19, Changqing Li <changqing.li@windriver.com=
> wrote:
> >>
> >> 1.
> >>
> >> Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this i=
s in package systemd),
> >>
> >> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
> >>
> >> This line will create an link to "${datadir}/doc/systemd/README.logs" =
during boot,
> >>
> >> and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So t=
here will be dead link when systemd-doc is not installed.
> >>
> >> So that's why I create another legacy-doc.conf packaged into systemd-d=
oc
> >>
> >> Then legacy.conf and README.logs should be placed into the same
> >> package. I would suggest that README.logs just goes into main systemd
> >> package. (the other option is placing legacy.conf into systemd-doc,
> >> but that file is not doc-specific, and should stay in systemd package,
> >> especially if more entries are added to it).
> >>
> >> The solution is also good. But package "${docdir}/systemd/README.logs"=
 in package systemd may make things more complicated.
> >>
> >> since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and  FI=
LES:${PN}-doc =3D "${docdir}  ...". we need to adjust the sequence,
> >>
> >> and may have influences to current list of files and directories that =
are placed in a package.
> >>
> >> So maybe this patch is more simple and reasonable, and will not have o=
ther impact.
> >>
> >> 2.
> >>
> >> The symlink in legacy.conf use relative path.  but for oe, when VOLATI=
LE_LOG_DIR is true, /var/log is a link to /var/volatile/log, so
> >>
> >> /var/log/README need link to ../../../usr/share/doc/systemd/README.log=
s,
> >>
> >> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
> >>
> >> need link to ../../usr/share/doc/systemd/README.logs.
> >>
> >> After change it to absolute path, checking of VOLATILE_LOG_DIR is not =
needed.
> >>
> >> That's ok, but can you make fixing the path to an absolute one a
> >> separate, second commit then?
> >>
> >> if  use solution in this patch,  it is better they are in one commit. =
 I can update description more detail.
> >>
> > You could also explore using -Dcreate-log-dirs=3Dfalse via EXTRA_OEMESO=
N
>
> Thanks. I had do some research about turn off CREATE_LOG_DIR,
>
> if turn off CREATE_LOG_DIR, " /var/log/journal/" will not be created.
> By default,  VOLATILE__LOG_DIR =3D "yes",  this change will have no
> influence, since we will remove content under /var/log.
>
> if VOLATILE_LOG_DIR set to "no", the current default behavior will be
> changed,  log will saved from persistent  to memory.   our default
> Storage set to auto,  if " /var/log/journal/" not exist, the log will
>
> save  in memory /run/log/journal.  Refer [1].  So I did not try to turn
> off it in case current default behavior is changed.
>

The option -Dcreate-log-dirs will control if systemd build emits
relevant info into generated legacy.conf
or not thats all. Whatever logic you have in OE is high level which
might be covering it across the distro. so
what I am suggesting is to use the meson option to control it when
building systemd, the knob logic
to apply it will depend on OE's logic for log persistence.

> Refer:
>
> [1] https://www.freedesktop.org/software/systemd/man/journald.conf.html
>
> //Changqing
>
> >
> >> Thanks
> >>
> >> Changqing
> >>
> >> Thanks,
> >> Alex
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#196414): https://lists.openembedded.org/g/openembe=
dded-core/message/196414
> >> Mute This Topic: https://lists.openembedded.org/mt/104598170/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

