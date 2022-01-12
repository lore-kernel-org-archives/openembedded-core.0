Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC030C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:21:35 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.23561.1641997293936621930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n4i4tZLZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 30so10680058edv.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZCI67Z0iH2fHyn0rBhNAO8wQevfBzLa+Y6vhij0UOY=;
        b=n4i4tZLZjp9pn2tofgcemq5ydvrO4AE7aCg75ncx1hzYMzE2OFNDjJ9Dx2t5ldsAw1
         NuyWIDhbJ6WBYZzz1GUmbkSlmu1bvKPbVCNc7HoqcbrSA/k2KtvebOvOYMb3HjRA4XoD
         jeiSB/4TGGZ24jJz577f2hk4FQ1E1j+e14ZkATXiBbBiwhAVdTjxvr9B+Kyuyzw03y8g
         tuove51yQevJLzfgVKLIhCeo0BGUoo2OA35qg8eIYm498HKx0ijTPw1lFEiQfspH9Y+l
         tJ/hnFntD/rPiHDwk+phcM+tKrEhGnwQxjBEJd2CtEs8ZR/FJg8BdiTu1LdRNJxgsbO5
         +iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZCI67Z0iH2fHyn0rBhNAO8wQevfBzLa+Y6vhij0UOY=;
        b=vaC+Qt/W2N/91AUHhd5lv6hA6I77xonnSEIuzNWyG1OptVcpdjQWL5sIF8QR1e8z6i
         IBOTPQqtgLzuoJo9Zks5+qfudDA7V7CWYzk35+P6nrPsrkoqrqCqzsk4ubs5hpSig43F
         V1udcPyZb6CQVcPYweT4hN03Y4UzvUxkavRZRj6KKHG7vC9dZxT0uaC/sCL8hVWWtER/
         LP1sQnUvxmdieSjQlfJeqrZat395MbmzHQK7sWFn54dE613wP2ZDXlHH9/iV+Td7WnGD
         22VhzviYiDVC3hNxZJ7WJt7lH+S7CHNOUxFk7pdjMPl1QnGo6r0rLZJ+s0c9DAz0kWo2
         eOsw==
X-Gm-Message-State: AOAM533waJF2kHHChNCSsMz9ZdtNkoNOmW7QD21XlxmoCIcicpwHizRv
	RrwGSHSlIo23CsLshSGn9IwnYm0uZcOXmQvuMc4=
X-Google-Smtp-Source: 
 ABdhPJwNF7I6lePtUjJ6VLK8fa9SAh5bT6ktEQd0pDSTBq64mVSZUkaNjAGywLdHv8zjFL3+AXkYyz++lLMgKbJr2l0=
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr7857906ejk.651.1641997292088;
 Wed, 12 Jan 2022 06:21:32 -0800 (PST)
MIME-Version: 1.0
References: <20220111235840.81471-1-saul.wold@windriver.com>
 <20220111235840.81471-3-saul.wold@windriver.com>
In-Reply-To: <20220111235840.81471-3-saul.wold@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Jan 2022 09:21:20 -0500
Message-ID: 
 <CADkTA4P=tHSB9HL8YT0yuGyvLYu8TtVcUpKVDe8bCtkhKhmo0Q@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/3] package: Add support for kernel stripping
To: Saul Wold <saul.wold@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 14:21:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160481

On Tue, Jan 11, 2022 at 6:59 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> Extend runstrip() to accept additional argument to enable
> sharing it with the kernel do_strip() to that
> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS can be passed.
>
> Since is_elf() understands kernel modules there is no need to keep a
> seperate list for kernmodules or hardcode the values to runstrip.
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/package.bbclass | 21 +++++++--------------
>  meta/lib/oe/package.py       |  7 +++++--
>  2 files changed, 12 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 09cd376f4af..794996e6d6d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
>      dvar = d.getVar('PKGD')
>      objcopy = d.getVar("OBJCOPY")
>
> -    # We ignore kernel modules, we don't generate debug info files.
> -    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
> -        return (file, sources)
> -
>      newmode = None
>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
>          origmode = os.stat(file)[stat.ST_MODE]
> @@ -1122,7 +1118,6 @@ python split_and_strip_files () {
>      #
>      elffiles = {}
>      symlinks = {}
> -    kernmods = []
>      staticlibs = []
>      inodes = {}
>      libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
> @@ -1145,9 +1140,6 @@ python split_and_strip_files () {
>                  if file in skipfiles:
>                      continue
>
> -                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
> -                    kernmods.append(file)
> -                    continue
>                  if oe.package.is_static_lib(file):
>                      staticlibs.append(file)
>                      continue
> @@ -1164,8 +1156,11 @@ python split_and_strip_files () {
>                  if not s:
>                      continue
>                  # Check its an executable
> -                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
> -                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
> +                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
> +                        or (s[stat.ST_MODE] & stat.S_IXOTH) \
> +                        or ((file.startswith(libdir) or file.startswith(baselibdir)) \
> +                        and (".so" in f or ".node" in f)) \
> +                        or (f.startswith('vmlinux') or ".ko" in f):
>
>                      if cpath.islink(file):
>                          checkelflinks[file] = ltarget
> @@ -1311,12 +1306,10 @@ python split_and_strip_files () {
>          for file in elffiles:
>              elf_file = int(elffiles[file])
>              #bb.note("Strip %s" % file)
> -            sfiles.append((file, elf_file, strip))
> -        for f in kernmods:
> -            sfiles.append((f, 16, strip))
> +            sfiles.append((file, elf_file, strip, ''))
>          if (d.getVar('PACKAGE_STRIP_STATIC') == '1' or d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
>              for f in staticlibs:
> -                sfiles.append((f, 16, strip))
> +                sfiles.append((f, 16, strip, ''))
>
>          oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index dd700cbb0c9..7842a614e9f 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -16,7 +16,7 @@ def runstrip(arg):
>      # 8 - shared library
>      # 16 - kernel module
>
> -    (file, elftype, strip) = arg
> +    (file, elftype, strip, extra_strip_sections) = arg
>
>      newmode = None
>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> @@ -40,6 +40,9 @@ def runstrip(arg):
>      # shared or executable:
>      elif elftype & 8 or elftype & 4:
>          stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
> +        if file.find("boot/vmlinux") != -1 and extra_strip_sections != '':
> +            for section in extra_strip_sections.split():
> +                stripcmd.extend(["--remove-section=" + section])

One thought that came to mind when reading this, is does that really
need to be restricted to boot/vmlinux ? The code would be simplified
by just testing for 'if extra_strip_sections:' .. and then the
sections are only passed for the kernel components that need it.

The more broadly available functionality obviously isn't used (or
maybe ever needed), but it does simplify things.  But I'm only looking
at the diff, so maybe I'm missing a nuance.

>
>      stripcmd.append(file)
>      bb.debug(1, "runstrip: %s" % stripcmd)
> @@ -172,7 +175,7 @@ def strip_execs(pn, dstdir, strip_cmd, libdir, base_libdir, d, qa_already_stripp
>      sfiles = []
>      for file in elffiles:
>          elf_file = int(elffiles[file])
> -        sfiles.append((file, elf_file, strip_cmd))
> +        sfiles.append((file, elf_file, strip_cmd, ''))

Rather than needing to add the '' to all of the appends, isn't there a
way that the oe util runstrip could just check the length of args and
assign a default if there isn't a 4th argument ? That routine is
already assigning specifically to variables to checking the length
wouldn't be adding any specific knowledge to a generic routine.

Bruce

>
>      oe.utils.multiprocess_launch(runstrip, sfiles, d)
>
> --
> 2.31.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

