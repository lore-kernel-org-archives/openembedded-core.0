Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F810C369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:44:30 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.50204.1745851463453140322
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 07:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bKL5XuHK;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54b09cb06b0so5125263e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745851461; x=1746456261; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etX2K6MwzDMRVqGNfEhCl1e9xohi/DwnQAfkXLlj36c=;
        b=bKL5XuHKJv2QYxIqT2z+sxtt5PAJywgBj5qz7ta/p810jNmU8HijgFGz2JxQUOxgMN
         EbLZPTaaYuxW9GY8RBzv6SrQIHvDZdhuolewsfWIiSNwXw3X6cN4QA2qzfXvozeEOi/6
         +Cy6ig2u7T8GTANYN4pfb03rw2evXJTaAwSbBnj/qGzHFcs7Mpt99O8x9ZKlj3aaJ/7r
         IJrHHQYWwHxrBik4TJ5NH3vEp1M+etiVtz11qdI3qi6Vg/ScNOE+JAF98bD/PUbUp/Zm
         w4oo0WcU82KVxYWIueDr6D8HgW/ylLTe0EZstOvAFoxQMxJle9k1KP03dZAH47cKnWq8
         Uegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851461; x=1746456261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etX2K6MwzDMRVqGNfEhCl1e9xohi/DwnQAfkXLlj36c=;
        b=FZo5ruFUGUS9uIkR4mJlKxskHMnApBILuMdtEkGOIS70cN7kb1OAFha6v5XnuUgFWr
         l3WrGq1BrMWAY8PcsP/wTA+gN8+U7I/YRweIqTJ28aogzFaIWTAre+aEry8bhTR5DzvV
         JB20pdQehomeaELQ4rq86tMJEftH9e1clgab0iEONIj8In+wfDtQENOq2tRLpqmssp8B
         QIZtAzp16s6qxMrZM9qVVE8C98x5aZP4Pd88beOYbn5LwytPHdaaAxLPr0b74LLx7uE9
         z2bhQMX+TLtBjy7psmit+nI1JjVTRb1AML1Y1UGS2GZfk0+fbsk2Q05utiZ3tHZi00VV
         wJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCXIDt2O1kI9tCNRt6ieEpqdZnsh1P44JTqwx6CKWSBMdAMxV6cnH+g3IMl594c8TzC/uFESHxLeHHs5wQPB9kv/SQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyLkW+O80FGUwl+iQvA2fVOnNSj7GmMcTo8gcLD/FW2nA0wxTJ3
	QR6/1HWEAFwy1DqtXWk3NKBeRQF+l2ZCY4TpJCZAho1QBmNWpAMuLlMpHwha96hOC4Ohj+3MuX6
	dXvbssrKdXSZ4D5Ty5Tb66O7kIn0=
X-Gm-Gg: ASbGncvRCGicUPqOVew0wQBw6JbC0wJeA/LJvltZDv9o62ugqFcS2ddGHWpEj96qrRy
	ut9b41bL8Jz+hEjTtiyGlsZTOkJs8eukMAMrGY/LXkoV4RQT4e7zKO8fMAl/0iBVkoLIS7GIIwv
	stxTomtf1Nm8obk8KulSngiq8hkuXXWasUpvdw
X-Google-Smtp-Source: AGHT+IE6pXt11CnYpvy3p1JsCwj/659a/t/TgVfSAH8WrqwVwNp55py61JEzM7oh2b66p/mOM4Ag4aHnv8CiOWYQ8II=
X-Received: by 2002:a05:6512:1319:b0:54d:6981:4b83 with SMTP id
 2adb3069b0e04-54e8cbce641mr3672504e87.24.1745851461180; Mon, 28 Apr 2025
 07:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250428134205.900354-1-daniel.turull@ericsson.com>
 <20250428134205.900354-7-daniel.turull@ericsson.com> <CAJdd5GZB=QyUhtbx4hc+Mg=qtKo+YKAYXf1pTx8NUwUg5Tc4WQ@mail.gmail.com>
 <PA4PR10MB5707A826EFC31F84A660ECE0FD812@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <PR3PR07MB6666DF797E6964565174557C8A812@PR3PR07MB6666.eurprd07.prod.outlook.com>
In-Reply-To: <PR3PR07MB6666DF797E6964565174557C8A812@PR3PR07MB6666.eurprd07.prod.outlook.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Apr 2025 08:44:07 -0600
X-Gm-Features: ATxdqUHi3Na4hrgUjyK-FVJUN93KyZXpvcQRTz35ne5qW2YbxU9Kce5aGU_itsI
Message-ID: <CAJdd5GYLqZxEqYA-Cb5i-5TEFmDdEbDOtvmXeusrWZWov=zsmQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] spdx: add option to include only compiled kernel files
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"rybczynska@gmail.com" <rybczynska@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>, 
	"ross.burton@arm.com" <ross.burton@arm.com>, "skandigraun@gmail.com" <skandigraun@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215613

On Mon, Apr 28, 2025 at 8:12=E2=80=AFAM Daniel Turull
<daniel.turull@ericsson.com> wrote:
>
> Hi,
>
> Yes, from what I saw and Peter says only the kernel has file information =
that can be machine readable,
> and we can also extract the files that we compile.
>
> I could try to normalize how the files are input into the spdx generation=
 and then have a generic variable that any recipe can set
> to enable the inclusion of a subset of files. In this case, if/when more =
recipes provides this,
> spdx doesn't need to change.

I was thinking that maybe the way to do this is to have this somehow
call a function when enabled, and then have the recipe (or even better
the build system bbclass) implement that function; that way each
recipe or build system can implement the correct method for collecting
the data. I'm not quite sure if that's the best way to do it though

>
> Best regards
> Daniel
>
> -----Original Message-----
> From: Marko, Peter <Peter.Marko@siemens.com>
> Sent: Monday, 28 April 2025 16:00
> To: Joshua Watt <jpewhacker@gmail.com>; Daniel Turull <daniel.turull@eric=
sson.com>
> Cc: openembedded-core@lists.openembedded.org; rybczynska@gmail.com; steve=
@sakoman.com; ross.burton@arm.com; skandigraun@gmail.com
> Subject: RE: [PATCH v2 6/6] spdx: add option to include only compiled ker=
nel files
>
> I think that only kernel provides file-based CVE information right now.
>
> Peter
>
> > -----Original Message-----
> > From: Joshua Watt <jpewhacker@gmail.com>
> > Sent: Monday, April 28, 2025 15:58
> > To: daniel.turull@ericsson.com
> > Cc: openembedded-core@lists.openembedded.org; rybczynska@gmail.com;
> > steve@sakoman.com; Marko, Peter (FT D EU SK BFS1)
> > <Peter.Marko@siemens.com>; ross.burton@arm.com; skandigraun@gmail.com
> > Subject: Re: [PATCH v2 6/6] spdx: add option to include only compiled
> > kernel files
> >
> > I see the appeal here; however I've been trying to avoid too much
> > kernel specific stuff in SPDX. Is there a way to make this more
> > generic so it could be used by any recipe?
> >
> > On Mon, Apr 28, 2025 at 7:42=E2=80=AFAM <daniel.turull@ericsson.com> wr=
ote:
> > >
> > > From: Daniel Turull <daniel.turull@ericsson.com>
> > >
> > > When CVE_CHECK_KERNEL_CONFIG is enabled, only include the source
> > > code (.c, .h) files that are used during compilation.
> > >
> > > This enables an external tool to use the SPDX information to
> > > disregard vulnerabilities that are not compiled.
> > >
> > > CC: Joshua Watt <JPEWhacker@gmail.com>
> > > CC: Peter Marko <peter.marko@siemens.com>
> > > Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> > > ---
> > >  meta/classes/create-spdx-2.2.bbclass |  8 +++++++
> > >  meta/lib/oe/spdx30_tasks.py          |  8 +++++++
> > >  meta/lib/oe/spdx_common.py           | 34 ++++++++++++++++++++++++++=
++
> > >  3 files changed, 50 insertions(+)
> > >
> > > diff --git a/meta/classes/create-spdx-2.2.bbclass
> > > b/meta/classes/create-spdx-
> > 2.2.bbclass
> > > index 7e8f8b9ff5..6bf0c70bd4 100644
> > > --- a/meta/classes/create-spdx-2.2.bbclass
> > > +++ b/meta/classes/create-spdx-2.2.bbclass
> > > @@ -137,6 +137,10 @@ def add_package_files(d, doc, spdx_pkg, topdir,
> > get_spdxid, get_types, *, archiv
> > >      spdx_files =3D []
> > >
> > >      file_counter =3D 1
> > > +
> > > +    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) an=
d
> > d.getVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
> > > +    if check_kernel_compiled:
> > > +        kernel_sources =3D
> > > + oe.spdx_common.get_kernel_compiled_files(d)
> > >      for subdir, dirs, files in os.walk(topdir):
> > >          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> > >          if subdir =3D=3D str(topdir):
> > > @@ -147,6 +151,10 @@ def add_package_files(d, doc, spdx_pkg, topdir,
> > get_spdxid, get_types, *, archiv
> > >              filename =3D str(filepath.relative_to(topdir))
> > >
> > >              if not filepath.is_symlink() and filepath.is_file():
> > > +                # When creating spdx for the kernel, we only include=
 compiled files.
> > > +                if check_kernel_compiled:
> > > +                     if not oe.spdx_common.is_kernel_compiled(file,
> > > + kernel_sources,
> > d):
> > > +                          break
> > >                  spdx_file =3D oe.spdx.SPDXFile()
> > >                  spdx_file.SPDXID =3D get_spdxid(file_counter)
> > >                  for t in get_types(filepath):
> > > diff --git a/meta/lib/oe/spdx30_tasks.py
> > > b/meta/lib/oe/spdx30_tasks.py index ba965821f8..14f26773c5 100644
> > > --- a/meta/lib/oe/spdx30_tasks.py
> > > +++ b/meta/lib/oe/spdx30_tasks.py
> > > @@ -156,6 +156,10 @@ def add_package_files(
> > >          bb.note(f"Skip {topdir}")
> > >          return spdx_files
> > >
> > > +    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) an=
d
> > d.getVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
> > > +    if check_kernel_compiled:
> > > +        kernel_sources =3D
> > > + oe.spdx_common.get_kernel_compiled_files(d)
> > > +
> > >      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error)=
:
> > >          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
> > >          if subdir =3D=3D str(topdir):
> > > @@ -167,6 +171,10 @@ def add_package_files(
> > >              filepath =3D Path(subdir) / file
> > >              if filepath.is_symlink() or not filepath.is_file():
> > >                  continue
> > > +            # When creating spdx for the kernel, we only include com=
piled files
> > > +            if check_kernel_compiled:
> > > +                 if not oe.spdx_common.is_kernel_compiled(file, kern=
el_sources, d):
> > > +                      break
> > >
> > >              filename =3D str(filepath.relative_to(topdir))
> > >              file_purposes =3D get_purposes(filepath) diff --git
> > > a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py index
> > > 4caefc7673..c87e3875c7 100644
> > > --- a/meta/lib/oe/spdx_common.py
> > > +++ b/meta/lib/oe/spdx_common.py
> > > @@ -242,3 +242,37 @@ def fetch_data_to_uri(fd, name):
> > >          uri =3D uri + "@" + fd.revision
> > >
> > >      return uri
> > > +
> > > +def is_kernel_compiled(filename, kernel_sources, d):
> > > +    """
> > > +    Check if the file, is a kernel compiled file
> > > +    """
> > > +    import os
> > > +
> > > +    _, extension =3D os.path.splitext(filename)
> > > +    # Special case, that we need to ignore, since this is not a sour=
ce file
> > > +    if filename.rfind(".mod.c") > 0:
> > > +        return True
> > > +    # We filter .c files and header files
> > > +    if extension not in [".c", ".h"]:
> > > +        return True
> > > +    # Check that the c file is in the list
> > > +    if filename in kernel_sources:
> > > +        return True
> > > +    return False
> > > +
> > > +def get_kernel_compiled_files(d):
> > > +    """
> > > +    Get results from the save_compiled files and include also header=
 files
> > > +    """
> > > +    import json
> > > +    import os
> > > +    kfiles =3D []
> > > +    with open(d.getVar('KERNEL_SRC_FILES'), 'r') as f:
> > > +        for item in json.load(f):
> > > +            kfile =3D os.path.basename(item['file'])
> > > +            # Return also the correspondig header file
> > > +            hfile =3D ".h".join(kfile.rsplit(".c", 1))
> >
> > This feels a little bit wrong to me. I think a better option would be
> > to include all headers, since we don't have a good way of knowing
> > which are actually used.
> >
> > > +            kfiles.append(kfile)
> > > +            kfiles.append(hfile)
> > > +    return kfiles

