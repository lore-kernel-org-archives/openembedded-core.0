Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACB5C54798
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 06:04:31 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.18163.1709186669434892389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 22:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dSeBiynp;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21e45ece781so338949fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 22:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709186669; x=1709791469; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YngolIw9rtn1xqYoJbdxzsb588SYiTHZF944PNCJ6/k=;
        b=dSeBiynpdte/cKwgIvU7JfUxPD5YZbLUqEj43fFtovs0l18UxoXAobSQp8ZXkgVSeS
         D/qZgrnEKmilpbY1en1EsF1uAEVT7NVmdRvWZQWd+Ra5CeLnDHNmPIuH0LDdmswItYv5
         yX/s6bgkZI5zfA8ClVICu8mpExaZIhiARBOxi7D6mQ0YnJV62f/B0QQXXTZ5Y36+y1Cq
         H+07opPLXmjmXMtOL8Lr0Co/b2ydb0JLMHSdbZPga32uGsBw/LcFIsZqioDzePH1I25m
         lgmodCUULR2IOn+XJiqzk8CDRpPNMMl50ECX27aedD7/IqhmRm6ayPbEFTm+PDxZO1r0
         LULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709186669; x=1709791469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YngolIw9rtn1xqYoJbdxzsb588SYiTHZF944PNCJ6/k=;
        b=qAMIT5S9XkNRZ0bGi5paF4ev8u71QzOacimB1G9WUbcvX/yKkfOStbZGmKhvou96ny
         FQU6O+yM3c6f44g+k62cqqoo6GKthK6gRUYXNxJulJjX8FwJS3t9DlpeNTnJ1oRwCv+9
         UOTEp7uqrUvejYzRCSQQq2AyIo7N+t+bNLqc3SErbiSiWcqB1mHi86rJQCvmdmSVN7Ag
         aNQXNnp99AKM/0J/LPe0pK1tC19z5auMuF0F7iIpRty6hjmKCCTUqx9qLqI51KjR77m+
         KZx50vvhX+hzwCsLdHuyu3UuArMEtkgpwdavOuUble1DuWS0ETd9FvMaWwVojezSiRiC
         rxcg==
X-Forwarded-Encrypted: i=1; AJvYcCWjlqpi2/8rbOjS+rA/rMe2Z/R/i7GzF180F2qTaS4FRGQDwHTE4pNG6AdNK7McQIr3MwpqfoqDuutUZY9PFz9iNm9LgL2otCtpRwS0LI07KZ2RB/jHxr+h
X-Gm-Message-State: AOJu0YxlHdq+ZSw14PS9lELYqf3hAT6WUdfPM9eKAoCq0Uc1+qG+cpq/
	uNz0WvXIZ5ewk/HMEA42tTB/GVboMZ+JYArPIIGlic7ioHUlzXeLZia2w6yGwfJpd2oimV0heP0
	QzgAQkKsr2OZtxa74LX3vZ/5qb8B176+AqUmc4A==
X-Google-Smtp-Source: AGHT+IEwwNYFRXFhwQC5Mx8o5I5rD2br/EdvOe7lFR6ka5yeSCCyRtD1A0da2mdVCr0/PVDzkWVFq3uJqZ2bHYjWCBM=
X-Received: by 2002:a05:6870:3b0a:b0:220:9c89:98e5 with SMTP id
 gh10-20020a0568703b0a00b002209c8998e5mr124100oab.18.1709186668643; Wed, 28
 Feb 2024 22:04:28 -0800 (PST)
MIME-Version: 1.0
References: <20240227051155.2166683-1-changqing.li@windriver.com>
 <CANNYZj94Uxkp8ELj5CG_-ynK=SYd3U4NdKxy6OSN5w_wzByEtw@mail.gmail.com>
 <73e51c29-1405-4722-8feb-45536c5648f2@windriver.com> <CANNYZj-QigrAj1=u2eTt-6VyiixAgjHK-0qPTufbWPBBe9dbAA@mail.gmail.com>
 <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
In-Reply-To: <f7653561-00d7-48cb-83d6-1dfb8cd6d4b2@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 22:04:02 -0800
Message-ID: <CAMKF1sprdSK3FZuR+MeQX-pvWaiVKsoHG5fmEmd6n7so+6NM3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH V5] systemd: fix a dead link under /var/log
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 06:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196415

On Wed, Feb 28, 2024 at 9:56=E2=80=AFPM Changqing Li
<changqing.li@eng.windriver.com> wrote:
>
>
> On 2/28/24 17:45, Alexander Kanavin wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, 28 Feb 2024 at 04:19, Changqing Li <changqing.li@windriver.com> w=
rote:
>
> 1.
>
> Currently,  There is one line in /usr/lib/tmpfile.d/legacy.conf(this is i=
n package systemd),
>
> "L /var/log/README - - - - ../../usr/share/doc/systemd/README.logs"
>
> This line will create an link to "${datadir}/doc/systemd/README.logs" dur=
ing boot,
>
> and ${datadir}/doc/systemd/README.logs is in package systemd-doc. So ther=
e will be dead link when systemd-doc is not installed.
>
> So that's why I create another legacy-doc.conf packaged into systemd-doc
>
> Then legacy.conf and README.logs should be placed into the same
> package. I would suggest that README.logs just goes into main systemd
> package. (the other option is placing legacy.conf into systemd-doc,
> but that file is not doc-specific, and should stay in systemd package,
> especially if more entries are added to it).
>
> The solution is also good. But package "${docdir}/systemd/README.logs" in=
 package systemd may make things more complicated.
>
> since in bitabke .conf, ${PN}-doc is before ${PN} in PACKAGES, and  FILES=
:${PN}-doc =3D "${docdir}  ...". we need to adjust the sequence,
>
> and may have influences to current list of files and directories that are=
 placed in a package.
>
> So maybe this patch is more simple and reasonable, and will not have othe=
r impact.
>
> 2.
>
> The symlink in legacy.conf use relative path.  but for oe, when VOLATILE_=
LOG_DIR is true, /var/log is a link to /var/volatile/log, so
>
> /var/log/README need link to ../../../usr/share/doc/systemd/README.logs,
>
> while VOLATILE_LOG_DIR is false, /var/log is a dir, so /var/log/README
>
> need link to ../../usr/share/doc/systemd/README.logs.
>
> After change it to absolute path, checking of VOLATILE_LOG_DIR is not nee=
ded.
>
> That's ok, but can you make fixing the path to an absolute one a
> separate, second commit then?
>
> if  use solution in this patch,  it is better they are in one commit.  I =
can update description more detail.
>

You could also explore using -Dcreate-log-dirs=3Dfalse via EXTRA_OEMESON

> Thanks
>
> Changqing
>
> Thanks,
> Alex
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196414): https://lists.openembedded.org/g/openembedde=
d-core/message/196414
> Mute This Topic: https://lists.openembedded.org/mt/104598170/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

