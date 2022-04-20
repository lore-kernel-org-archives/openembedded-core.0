Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07A3C64E92
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web12.11969.1650481769154803965
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkMJzBeP;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id y10so5457518ejw.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSqSNJz2v2vpFH9R/Q/nQWCJTkXTEvFd62Ot9dbgd+E=;
        b=jkMJzBePi9OGmests5rH/lASGdYpGAyVlmF/ox6ydd/qE6m6oAJgv/b5b2RYl/kgCW
         WWwzQUyRTWI5SxGTyn95yOZ4EPi4yay1sbF4LKvu8ZdZyS+LefUxfIgAdog4W+acGgVZ
         XC4sjZQ9Iq9bXQrFqVAtYHXUrGvhE7OHYAqULgU0SMenQAXHFwPjM4bcCYO+QeDv5z8V
         Mr70Kmb8UzF3jnvn7mM6FMU7emecvkPfUM+LwCuoSVyPsjuukOKS/GkvOfE8TDbv+nqH
         QWc7icbEXQorSR0E+E8NllspT0pm6X4K6gLflTX5HtrU60NfUl8//zfsc3nd6S6p9/d8
         toRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSqSNJz2v2vpFH9R/Q/nQWCJTkXTEvFd62Ot9dbgd+E=;
        b=k1iq/jbPPRaTmMhbiicDMk/cNdwgA7d3NTKYUhIOQRpl0h73CDEKqGmqJrv4HAAWzs
         +dSLhLThoHW099L7nc1pdACeqjnny2upntbkQHSR+MAKZ+YqBMAF6qhs8YL6Xpi8P7Ur
         KwuAJ8OcOvGLAeUtNx6JYtX3zfIexnwlRcHhg0RopRKSx+59frKiJS3+axVJ2cvvYtnV
         qLsSj1AUSeKIO4Jf0Qw8M2rRFqC1GGGbGpMpgrU1g1zRo27qxNSzdDeEoWqDXfZzTEYG
         Acp7KLjybb6SDpjWr644XMkfYowC/+m6DSPuQFYHDa3Ya6jjzU2q7CTihq+Mr3aKs38x
         2clA==
X-Gm-Message-State: AOAM533Q/sVBArwP1n9AZtRPTuFWteVYTt+rAH4dFnwR2i350a5d9scu
	/n8o8AU8h7PDkbAH3AeUg4Kw8hcwWwmIpiYhrJY=
X-Google-Smtp-Source: 
 ABdhPJxjhVlr66BvL1EEs37kRyLZMF9KIDe5V2FPSc5nR0GegwgvV6Cx7xY5abPtsJxo96Snr6HetlnOD6xvc6LAPbo=
X-Received: by 2002:a17:907:d23:b0:6db:6c6:8558 with SMTP id
 gn35-20020a1709070d2300b006db06c68558mr19602962ejc.141.1650481767555; Wed, 20
 Apr 2022 12:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
 <CA+05MtrxtejYEOE2KFv0=O7_m4dUSMm7UGorcxHWnTfUt_CQPw@mail.gmail.com>
In-Reply-To: 
 <CA+05MtrxtejYEOE2KFv0=O7_m4dUSMm7UGorcxHWnTfUt_CQPw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Apr 2022 15:09:16 -0400
Message-ID: 
 <CADkTA4PLNG+Y83_b1CeOTvq2=vzm66KWNu6VXsLJjoZXpyNhBg@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck from
 source directory
To: Russ Dill <russ.dill@nikolamotor.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164722

On Wed, Apr 20, 2022 at 2:44 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
>
> On Wed, Apr 20, 2022 at 10:19 AM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 12:38 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> > >
> > > On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> > > >>
> > > >> do_kernel_configcheck utilizes pathnames relative to the sourcedir
> > > >> but does not specify ${S} in [dirs]. tasks that do not specify
> > > >> [dirs] default to the cwd of the bitbake parent process. This can be
> > > >> seen by inspection of exec_func/exec_func_python of
> > > >> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
> > > >> at the head of do_kernel_configcheck.
> > > >>
> > > >> This is problematic if bitbake is run from a directory that
> > > >> contains a meta/ subdirectory. In this case the code:
> > > >>
> > > >>     kmeta = d.getVar("KMETA") or "meta"
> > > >>     if not os.path.exists(kmeta):
> > > >>         kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> > > >>
> > > >> Causes kmeta to be set to just "meta" if a meta directory exists
> > > >> in the cwd of the bitbake parent process, or to the output of
> > > >
> > > >
> > > > That isn't actually a problem, and is the design intent of that check. It allows a temporary/local override of the meta data, simply by creating a 'meta' subdir.
> > > >
> > >
> > > It's not working as intended though. While the check for the "meta"
> > > path is done in the cwd of the bitbake parent process, the actual
> > > usage of it is done in ${S}:
> >
> > It hasn't been used in quite some time, but the design intent is what
> > I stated. So it would be better to make that later reference more
> > flexible.
> >
> > You have described the problem, but not how you've managed to trigger the error.
>
> It's pretty straightforward. The default yocto steps create a
> directory tree that contains a directory called meta (along with
> meta-poky, meta-selftest, build, bitbake, etc). If you run bitbake
> from this top-level directory and have a kernel image with a kconfig
> issue, it will trigger the error. The kmeta var will be set to meta,
> and since that directory exists within the cwd of bitbake's parent
> process (the yocto tree) the kgit command will not be executed. When
> the various steps define outfile, they use:

I'm aware of how the basics work :) I've run more builds than I'd like
to admit in a very similar configuration, with many more kernel configuration
issues than most .. and I've never triggered this particular issue.

So you aren't actually running from a "build" directory/subdirectory ?
But instead are running it directly from your poky clone ? That's a
not a common directory layout at all.

>
>  "{}/{}/cfg/invalid.txt".format(s,kmeta)
>
> This directory is not a subdirectory of the directory that bitbake was
> run from, but within the kernel source since it contains the 's'.
> Rather than attempting to utilize $PWD/meta/cfg, $S/meta/cfg/ is
> utilized. Unless the path meta/cfg exists within the kernel source,
> creating outfile fails.
>
> As far as fixing it while keeping the design intent in check, was the
> intent for the meta directory to exist within the cwd of the bitbake
> parent process? Or within the kernel source tree? Keying off the meta
> directory in the cwd of the bitbake process is confusing behaviour,
> especially since that directory name is already used for a different
> purpose at the top-level.

It could be either. Sometimes in the kernel directory, sometimes not.
I've done development with local kernel meta directories in both locations
throughout the years.

But the intention is that it commonly is in the kernel source tree, so
the forcing of the 'dir' isn't fundamentally wrong .. just that most of
the paths really should have been fully specified (and have been
throughout various iterations), so it also shouldn't matter.

All of the linux-yocto recipes set KMETA, so you must also be running
without specifying the name of the kernel meta data, which
is also part of the corner case.  Since KMETA is now fully specified
in the reference kernels (it wasn't always), the right thing to do is
probably to drop the check for 'meta' entirely and just use the
variable with a fallback to the kernel tools returned location/directory.

The kernel-tools and the 'meta' directory naming pre-date the
integration with oe-core/yocto, hence the namespace collision. We
can clean that up a bit by dropping the hardcoded name check, and
see if anything was still relying on it (through an issue on integration
testing, or a bug report).

Bruce

>
> > >
> > >     if analysis:
> > >         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > >
> > > Which leads to:
> > >
> > > DEBUG: Executing python function do_kernel_configcheck
> > > ERROR: Error executing a python function in exec_func_python() autogenerated:
> > >
> > > The stack trace of python calls that resulted in this exception/failure was:
> > > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> > >      0001:
> > >  *** 0002:do_kernel_configcheck(d)
> > >      0003:
> > > File: '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
> > > lineno: 591, function: do_kernel_configcheck
> > >      0587:    if analysis:
> > >      0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > >      0589:        if os.path.isfile(outfile):
> > >      0590:           os.remove(outfile)
> > >  *** 0591:        with open(outfile, 'w+') as f:
> > >      0592:            f.write( analysis )
> > >      0593:
> > >      0594:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
> > >      0595:            with open (outfile, "r") as myfile:
> > > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > > '[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'
> > >
> > >
> > >
> > > >
> > > > Bruce
> > > >
> > > >
> > > >>
> > > >> kgit --meta if it does not.
> > > >>
> > > >> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> > > >> ---
> > > >>  meta/classes/kernel-yocto.bbclass | 1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > > >> index 1d5a8cdf29..c787b2a122 100644
> > > >> --- a/meta/classes/kernel-yocto.bbclass
> > > >> +++ b/meta/classes/kernel-yocto.bbclass
> > > >> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
> > > >>      if warnings_detected and kmeta_audit_werror:
> > > >>          bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
> > > >>  }
> > > >> +do_kernel_configcheck[dirs] = "${S}"
> > > >>
> > > >>  # Ensure that the branches (BSP and meta) are on the locations specified by
> > > >>  # their SRCREV values. If they are NOT on the right commits, the branches
> > > >> --
> > > >> 2.25.1
> > > >>
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > >
> > >
> > >
> > > --
> > >
> > >
> > >
> > > Russ Dill
> > >
> > > russ.dill@nikolamotor.com
> > >
> > > NIKOLA CORPORATION | nikolamotor.com
> > > 4141 E Broadway Rd | Phoenix | AZ | 85040
> > >
> > >
> > >
> > > INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
> > > YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
> > > REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
> > > RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
> > > REPLY AND THEN DELETE THIS E-MAIL.
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
>
>
>
> --
>
>
>
> Russ Dill
>
> russ.dill@nikolamotor.com
>
> NIKOLA CORPORATION | nikolamotor.com
> 4141 E Broadway Rd | Phoenix | AZ | 85040
>
>
>
> INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF
> YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
> REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE
> RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
> REPLY AND THEN DELETE THIS E-MAIL.



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

