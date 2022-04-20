Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 050A3C64EB1
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:10 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web10.12066.1650482963570248777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=FIcIA4GO;
 spf=pass (domain: nikolamotor.com, ip: 209.85.217.41,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-vs1-f41.google.com with SMTP id b128so2486141vsc.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HBYoicX5hblfWJDN74M5HUWYRaPMN3XvLFsA5Ra9vfE=;
        b=FIcIA4GObjk7Y60TOmOyHVF8V8Rx5Y54laJweK+ctMmhDG56LuPIEhyuZIntRf2mb9
         4cgcysuZmZ88JbZyPXfAjqwOzU4lsgyZpZuNvfZhIUL6Rou33dGaBPAXPOmviOFZ8a2K
         766fheeMGlxgvnT8EadsQHWsdLsLR0chOcr9YyJwoO3mlbQhzCd7L9fhzAehXiJPduWr
         E4T2N0wEax/3ZspIC4nOYhUxZRgOr01okv4nzCEdz7P6vYwo9oMHs6WLsVds3CCDJfLQ
         lLpc0U/D1J8ikqFxhm6F5nqKt7/M4mtMD5TRWT2hHaGMHXdaGPYGlqyQhNk5QseKO1Cc
         dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HBYoicX5hblfWJDN74M5HUWYRaPMN3XvLFsA5Ra9vfE=;
        b=DjqmRyv6p+5WMJmw3NvnmS3O2rz65aNI+JF9OJee4bC3Bk1f9Wk+3ORVN05grKr8EO
         IQwJb8SZlREjWVkxgEaJYP2Vgvj1MQdRoS8iwBk9caqRh/VEqE5Rtz0Urt8Xd0bh25F1
         kin7m0Buz83GkmBcAFvvMW4SLr48Gms8FW9PrPbtnka78c5anzN5TadLU79uj/0VQp+L
         f92+3C+o/8ldsSTuak0rBWcBlUbAk+S7TTGgW45OopIO2shX1irQiR86G+kNcFjyBfCs
         USfR5JkaZ7cN0ghrQPKJTvnAigT46um3wK+Okf47LsqdYcWom5eiUqtZ5iemhQQgZsKi
         zvCA==
X-Gm-Message-State: AOAM533HmnbrsFLTmEEqe+cJ/HOs377FIz36O0XZisbXJQkcH+i0G7hG
	jJBzqwNVuWmzlI9d3Cg1gALFpHxovz6ClllrdE367TbN9VHPv/DRUhR1tr3VhYLfDNyTLsVDKvk
	tXzTej6BsqUnuaG5882J1CgYY0tPMyOqwU8jkep9Y8QxdB8l9Qi7kg3hH5uVX/KgqwrAUwBv9Kn
	Bo/p8VmeCiRXAesf8nFDNHVHbEWfpN2ZBhIN5pfI5LIBAIOjQ7o+9g8qQY/PeuIJ6yod966cWjs
	xZd2ev/RXlpokw=
X-Google-Smtp-Source: 
 ABdhPJxWU84UBY7FibNGQrAlZAqxuW5gYiDGB01x/Mr3DJdAgh4HqigubOp/Uyk38Upg9bKSHztQzjMGfwj+e7/sUBc=
X-Received: by 2002:a67:f8c7:0:b0:32a:38ca:4d2d with SMTP id
 c7-20020a67f8c7000000b0032a38ca4d2dmr6327637vsp.77.1650482962151; Wed, 20 Apr
 2022 12:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
 <CA+05MtrxtejYEOE2KFv0=O7_m4dUSMm7UGorcxHWnTfUt_CQPw@mail.gmail.com>
 <CADkTA4PLNG+Y83_b1CeOTvq2=vzm66KWNu6VXsLJjoZXpyNhBg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PLNG+Y83_b1CeOTvq2=vzm66KWNu6VXsLJjoZXpyNhBg@mail.gmail.com>
From: Russ Dill <russ.dill@nikolamotor.com>
Date: Wed, 20 Apr 2022 12:29:11 -0700
Message-ID: 
 <CA+05MtrOWd5ooz7-_UfX1BKLU2yePcHERnCk5q4UaCdKzVn+=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck
 from source directory
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
X-CLOUD-SEC-AV-Info: nikolamotor2,google_mail,monitor
X-CLOUD-SEC-AV-Sent: true
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164723

On Wed, Apr 20, 2022 at 12:09 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Wed, Apr 20, 2022 at 2:44 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 10:19 AM Bruce Ashfield
> > <bruce.ashfield@gmail.com> wrote:
> > >
> > > On Wed, Apr 20, 2022 at 12:38 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> > > >
> > > > On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > > >
> > > > >
> > > > >
> > > > > On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> > > > >>
> > > > >> do_kernel_configcheck utilizes pathnames relative to the sourcedir
> > > > >> but does not specify ${S} in [dirs]. tasks that do not specify
> > > > >> [dirs] default to the cwd of the bitbake parent process. This can be
> > > > >> seen by inspection of exec_func/exec_func_python of
> > > > >> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
> > > > >> at the head of do_kernel_configcheck.
> > > > >>
> > > > >> This is problematic if bitbake is run from a directory that
> > > > >> contains a meta/ subdirectory. In this case the code:
> > > > >>
> > > > >>     kmeta = d.getVar("KMETA") or "meta"
> > > > >>     if not os.path.exists(kmeta):
> > > > >>         kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> > > > >>
> > > > >> Causes kmeta to be set to just "meta" if a meta directory exists
> > > > >> in the cwd of the bitbake parent process, or to the output of
> > > > >
> > > > >
> > > > > That isn't actually a problem, and is the design intent of that check. It allows a temporary/local override of the meta data, simply by creating a 'meta' subdir.
> > > > >
> > > >
> > > > It's not working as intended though. While the check for the "meta"
> > > > path is done in the cwd of the bitbake parent process, the actual
> > > > usage of it is done in ${S}:
> > >
> > > It hasn't been used in quite some time, but the design intent is what
> > > I stated. So it would be better to make that later reference more
> > > flexible.
> > >
> > > You have described the problem, but not how you've managed to trigger the error.
> >
> > It's pretty straightforward. The default yocto steps create a
> > directory tree that contains a directory called meta (along with
> > meta-poky, meta-selftest, build, bitbake, etc). If you run bitbake
> > from this top-level directory and have a kernel image with a kconfig
> > issue, it will trigger the error. The kmeta var will be set to meta,
> > and since that directory exists within the cwd of bitbake's parent
> > process (the yocto tree) the kgit command will not be executed. When
> > the various steps define outfile, they use:
>
> I'm aware of how the basics work :) I've run more builds than I'd like
> to admit in a very similar configuration, with many more kernel configuration
> issues than most .. and I've never triggered this particular issue.

Just trying to short-cut any further ping-ponging by providing an over
abundance of detail.

> So you aren't actually running from a "build" directory/subdirectory ?
> But instead are running it directly from your poky clone ? That's a
> not a common directory layout at all.

The build sub-directory still exists, but because sourcing
oe-init-build-env sets BUILDDIR and BBPATH, I typically just run the
bitbake commands from wherever I happen to be working. This is the
first time it's caused me any issues.

> >
> >  "{}/{}/cfg/invalid.txt".format(s,kmeta)
> >
> > This directory is not a subdirectory of the directory that bitbake was
> > run from, but within the kernel source since it contains the 's'.
> > Rather than attempting to utilize $PWD/meta/cfg, $S/meta/cfg/ is
> > utilized. Unless the path meta/cfg exists within the kernel source,
> > creating outfile fails.
> >
> > As far as fixing it while keeping the design intent in check, was the
> > intent for the meta directory to exist within the cwd of the bitbake
> > parent process? Or within the kernel source tree? Keying off the meta
> > directory in the cwd of the bitbake process is confusing behaviour,
> > especially since that directory name is already used for a different
> > purpose at the top-level.
>
> It could be either. Sometimes in the kernel directory, sometimes not.
> I've done development with local kernel meta directories in both locations
> throughout the years.
>
> But the intention is that it commonly is in the kernel source tree, so
> the forcing of the 'dir' isn't fundamentally wrong .. just that most of
> the paths really should have been fully specified (and have been
> throughout various iterations), so it also shouldn't matter.
>
> All of the linux-yocto recipes set KMETA, so you must also be running
> without specifying the name of the kernel meta data, which
> is also part of the corner case.  Since KMETA is now fully specified
> in the reference kernels (it wasn't always), the right thing to do is
> probably to drop the check for 'meta' entirely and just use the
> variable with a fallback to the kernel tools returned location/directory.

This appears to be the primary issue and the easiest fix for me
locally. Freescale's linux-imx.inc and recipes that include it don't
set KMETA.

> The kernel-tools and the 'meta' directory naming pre-date the
> integration with oe-core/yocto, hence the namespace collision. We
> can clean that up a bit by dropping the hardcoded name check, and
> see if anything was still relying on it (through an issue on integration
> testing, or a bug report).

If it save you time, I can sum things up a bit and provide a patch for
either dropping the hardcoding entirely, changing the reference to
"{}/meta".format(os.getcwd()), or "{}/meta".format(s) (along with
moving s = d.getVar('S') up a bit)

> Bruce
>
> >
> > > >
> > > >     if analysis:
> > > >         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > > >
> > > > Which leads to:
> > > >
> > > > DEBUG: Executing python function do_kernel_configcheck
> > > > ERROR: Error executing a python function in exec_func_python() autogenerated:
> > > >
> > > > The stack trace of python calls that resulted in this exception/failure was:
> > > > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> > > >      0001:
> > > >  *** 0002:do_kernel_configcheck(d)
> > > >      0003:
> > > > File: '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
> > > > lineno: 591, function: do_kernel_configcheck
> > > >      0587:    if analysis:
> > > >      0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > > >      0589:        if os.path.isfile(outfile):
> > > >      0590:           os.remove(outfile)
> > > >  *** 0591:        with open(outfile, 'w+') as f:
> > > >      0592:            f.write( analysis )
> > > >      0593:
> > > >      0594:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
> > > >      0595:            with open (outfile, "r") as myfile:
> > > > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > > > '[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'
> > > >
> > > >
> > > >
> > > > >
> > > > > Bruce
> > > > >
> > > > >
> > > > >>
> > > > >> kgit --meta if it does not.
> > > > >>
> > > > >> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> > > > >> ---
> > > > >>  meta/classes/kernel-yocto.bbclass | 1 +
> > > > >>  1 file changed, 1 insertion(+)
> > > > >>
> > > > >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > > >> index 1d5a8cdf29..c787b2a122 100644
> > > > >> --- a/meta/classes/kernel-yocto.bbclass
> > > > >> +++ b/meta/classes/kernel-yocto.bbclass
> > > > >> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
> > > > >>      if warnings_detected and kmeta_audit_werror:
> > > > >>          bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
> > > > >>  }
> > > > >> +do_kernel_configcheck[dirs] = "${S}"
> > > > >>
> > > > >>  # Ensure that the branches (BSP and meta) are on the locations specified by
> > > > >>  # their SRCREV values. If they are NOT on the right commits, the branches
> > > > >> --
> > > > >> 2.25.1
> > > > >>
> > > > >
> > > > >
> > > > > --
> > > > > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > >
> > > >
> > > >
> > > > --
> > > >
> > > >
> > > >
> > > > Russ Dill
> > > >
> > > > russ.dill@nikolamotor.com
> > > >
> > > > NIKOLA CORPORATION | nikolamotor.com
> > > > 4141 E Broadway Rd | Phoenix | AZ | 85040
> > > >
> > > >
> > > >
> > > > INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
> > > > YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
> > > > REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
> > > > RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
> > > > REPLY AND THEN DELETE THIS E-MAIL.
> > >
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> >
> >
> >
> > Russ Dill
> >
> > russ.dill@nikolamotor.com
> >
> > NIKOLA CORPORATION | nikolamotor.com
> > 4141 E Broadway Rd | Phoenix | AZ | 85040
> >
> >
> >
> > INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
> > YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
> > REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
> > RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
> > REPLY AND THEN DELETE THIS E-MAIL.
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164722): https://lists.openembedded.org/g/openembedded-core/message/164722
> Mute This Topic: https://lists.openembedded.org/mt/90587617/6825211
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [russ.dill@nikolamotor.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 



Russ Dill

russ.dill@nikolamotor.com

NIKOLA CORPORATION | nikolamotor.com
4141 E Broadway Rd | Phoenix | AZ | 85040



INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
REPLY AND THEN DELETE THIS E-MAIL.

