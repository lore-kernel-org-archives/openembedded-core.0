Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E242BC369DC
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 13:57:49 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.48956.1745848667587123182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 06:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gwujd4f1;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54e816aeca6so4908736e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 06:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745848666; x=1746453466; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cDs7IITL5CWRSzFlMRuV2MLO7sNeuIyTC8FkHqtGtzU=;
        b=gwujd4f1wrrryvt9bXrS5R+BocXfEkf2I9r3NAltmYVXJj+O6b+PNnbXhrRTN3n87h
         4Sbosf3LNu6TOzJ/GblyE7Y2CCOFJlEtiMbnA0X/vo/4j35kJqyj7mRIKcE0iCR99kAb
         7HaTX9WfXXtYm4mwAhUBwQN1Aw+2Sm9VYoQzz61y5Tq9ZjbziltGK7tCsNQQXwNjaY/6
         yXfsX6IEgSlnv5sS71MPVYdHwVoC+O7nP+sev+CxOFkB3tLfu8hls84A1xti+8BpwJoU
         8F26t1+8wLv7XEA2fQwC8/fpsg9qPOgX08NyZwE0XeDb+51DO9qPKu56TcFY0/kuFGZs
         fhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745848666; x=1746453466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cDs7IITL5CWRSzFlMRuV2MLO7sNeuIyTC8FkHqtGtzU=;
        b=GS4u6SQileiZ9DwLqDcF7O+kSfjGT1cnx8sqK6tvvLCT2tsvEJbmsZp2kpuhD0GJhf
         UD5aNo9HidNLt+U/Hsb++mp0j5/0azg27f3UL8cs5AJVTPBM6g+EZuujqVMWnF6BEkj+
         BOAeIc7Qbp/H8jEflxTI4RQ5Xl/eve4cSFUlPyd/4lFLLtY5kVyoS8Y1sK6mSsOddmKy
         wbRXbcm66iky+ch7x+t5m6wFd3v/C679DWttI8LI4p2R4WbojeZjoHHWWuGbVWTGn9aT
         J7cmiESFpVuMwEuI76l2vs6tUkZ4/gUAV9z/u8gBtNr/xbT7lsRWn5rukZDmbXEC91ml
         uq0g==
X-Gm-Message-State: AOJu0YyDDeoFt6oMXIP8kwDOO9367bQoOMkIcMIlw9rNNW/KG/EwshYR
	kiPMpI+S2xCHQWT8P3Y9AOj/Nn3AiombXVHSFzmQAUBMQ5k6dI3pqCpC1277YQPptMx7mIYax2P
	bV86VG4i82dPv9NT/NSDM95oSxy0=
X-Gm-Gg: ASbGncstOV7/hDrrFbrRlr5P6CwpN5tLqOGMYX4Tyrk2uBalU5roIP/6wwApdyzpzZf
	zUOs7nl2bPp4r/vfbiLV7i0I8y9Sgm8njWUnsjc50/SxBYpDLZlEprsrL4G7xYqHlY5ZYTslQ9y
	IrLc9sjYessI5x/8tzWqRmSk+2CW9oOb4j5FGu
X-Google-Smtp-Source: AGHT+IGztLLLASLe+Zh1ifOPFV9zP3BOkJeYtIj1yiKAQ3hI2iJS9GAXbcEFz8ZFsTwWqNCoclKjEbK+jP+/h0zB69g=
X-Received: by 2002:a05:651c:1467:b0:30c:40d6:5cdb with SMTP id
 38308e7fff4ca-31906151ffcmr42506101fa.11.1745848665446; Mon, 28 Apr 2025
 06:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250428134205.900354-1-daniel.turull@ericsson.com> <20250428134205.900354-7-daniel.turull@ericsson.com>
In-Reply-To: <20250428134205.900354-7-daniel.turull@ericsson.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 28 Apr 2025 07:57:31 -0600
X-Gm-Features: ATxdqUETdzTgLtwdc_rmFPNS-KkPd1-fd2nwqiAe7tqYjdLJ9eMy5wzU_5x-3GY
Message-ID: <CAJdd5GZB=QyUhtbx4hc+Mg=qtKo+YKAYXf1pTx8NUwUg5Tc4WQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] spdx: add option to include only compiled kernel files
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, rybczynska@gmail.com, 
	steve@sakoman.com, Peter.Marko@siemens.com, ross.burton@arm.com, 
	skandigraun@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 13:57:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215607

I see the appeal here; however I've been trying to avoid too much
kernel specific stuff in SPDX. Is there a way to make this more
generic so it could be used by any recipe?

On Mon, Apr 28, 2025 at 7:42=E2=80=AFAM <daniel.turull@ericsson.com> wrote:
>
> From: Daniel Turull <daniel.turull@ericsson.com>
>
> When CVE_CHECK_KERNEL_CONFIG is enabled, only include the
> source code (.c, .h) files that are used during compilation.
>
> This enables an external tool to use the SPDX information to disregard
> vulnerabilities that are not compiled.
>
> CC: Joshua Watt <JPEWhacker@gmail.com>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/classes/create-spdx-2.2.bbclass |  8 +++++++
>  meta/lib/oe/spdx30_tasks.py          |  8 +++++++
>  meta/lib/oe/spdx_common.py           | 34 ++++++++++++++++++++++++++++
>  3 files changed, 50 insertions(+)
>
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-s=
pdx-2.2.bbclass
> index 7e8f8b9ff5..6bf0c70bd4 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -137,6 +137,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
>      spdx_files =3D []
>
>      file_counter =3D 1
> +
> +    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) and d.=
getVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
> +    if check_kernel_compiled:
> +        kernel_sources =3D oe.spdx_common.get_kernel_compiled_files(d)
>      for subdir, dirs, files in os.walk(topdir):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -147,6 +151,10 @@ def add_package_files(d, doc, spdx_pkg, topdir, get_=
spdxid, get_types, *, archiv
>              filename =3D str(filepath.relative_to(topdir))
>
>              if not filepath.is_symlink() and filepath.is_file():
> +                # When creating spdx for the kernel, we only include com=
piled files.
> +                if check_kernel_compiled:
> +                     if not oe.spdx_common.is_kernel_compiled(file, kern=
el_sources, d):
> +                          break
>                  spdx_file =3D oe.spdx.SPDXFile()
>                  spdx_file.SPDXID =3D get_spdxid(file_counter)
>                  for t in get_types(filepath):
> diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
> index ba965821f8..14f26773c5 100644
> --- a/meta/lib/oe/spdx30_tasks.py
> +++ b/meta/lib/oe/spdx30_tasks.py
> @@ -156,6 +156,10 @@ def add_package_files(
>          bb.note(f"Skip {topdir}")
>          return spdx_files
>
> +    check_kernel_compiled =3D bb.data.inherits_class("kernel", d) and d.=
getVar("CVE_CHECK_KERNEL_CONFIG") =3D=3D "1"
> +    if check_kernel_compiled:
> +        kernel_sources =3D oe.spdx_common.get_kernel_compiled_files(d)
> +
>      for subdir, dirs, files in os.walk(topdir, onerror=3Dwalk_error):
>          dirs[:] =3D [d for d in dirs if d not in ignore_dirs]
>          if subdir =3D=3D str(topdir):
> @@ -167,6 +171,10 @@ def add_package_files(
>              filepath =3D Path(subdir) / file
>              if filepath.is_symlink() or not filepath.is_file():
>                  continue
> +            # When creating spdx for the kernel, we only include compile=
d files
> +            if check_kernel_compiled:
> +                 if not oe.spdx_common.is_kernel_compiled(file, kernel_s=
ources, d):
> +                      break
>
>              filename =3D str(filepath.relative_to(topdir))
>              file_purposes =3D get_purposes(filepath)
> diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
> index 4caefc7673..c87e3875c7 100644
> --- a/meta/lib/oe/spdx_common.py
> +++ b/meta/lib/oe/spdx_common.py
> @@ -242,3 +242,37 @@ def fetch_data_to_uri(fd, name):
>          uri =3D uri + "@" + fd.revision
>
>      return uri
> +
> +def is_kernel_compiled(filename, kernel_sources, d):
> +    """
> +    Check if the file, is a kernel compiled file
> +    """
> +    import os
> +
> +    _, extension =3D os.path.splitext(filename)
> +    # Special case, that we need to ignore, since this is not a source f=
ile
> +    if filename.rfind(".mod.c") > 0:
> +        return True
> +    # We filter .c files and header files
> +    if extension not in [".c", ".h"]:
> +        return True
> +    # Check that the c file is in the list
> +    if filename in kernel_sources:
> +        return True
> +    return False
> +
> +def get_kernel_compiled_files(d):
> +    """
> +    Get results from the save_compiled files and include also header fil=
es
> +    """
> +    import json
> +    import os
> +    kfiles =3D []
> +    with open(d.getVar('KERNEL_SRC_FILES'), 'r') as f:
> +        for item in json.load(f):
> +            kfile =3D os.path.basename(item['file'])
> +            # Return also the correspondig header file
> +            hfile =3D ".h".join(kfile.rsplit(".c", 1))

This feels a little bit wrong to me. I think a better option would be
to include all headers, since we don't have a good way of knowing
which are actually used.

> +            kfiles.append(kfile)
> +            kfiles.append(hfile)
> +    return kfiles

