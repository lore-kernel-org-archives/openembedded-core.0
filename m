Return-Path: <russ.dill@nikolamotor.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5010C64E95
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
 [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web08.11555.1650480250732351317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nikolamotor-com.20210112.gappssmtp.com header.s=20210112
 header.b=GBkt00in;
 spf=pass (domain: nikolamotor.com, ip: 209.85.217.51,
 mailfrom: russ.dill@nikolamotor.com)
Received: by mail-vs1-f51.google.com with SMTP id i34so2394733vsv.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 11:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikolamotor-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EcfJ6w5gFLDuwWbTg8M60jgGpw9PMF7Xy7rodhdYZko=;
        b=GBkt00inse6shLfv1KUfRu9ATaXND+wBTzf5Lbr+gO+UVDUpTIAJUTuOLIMxdeQ19V
         2MZwKp1DZk6mTpuVfvsSzB1nFPIK2jVhwqGcttPUUOdqF1snBkQT2b7zZyzvhm9hcp8z
         bW0NsA/KENHpNlGnK/1f4G389Z5HNAD6BgotT12kfgwjp0U0IR3sJyztU0Y1rtJ3z0hi
         SazuryQgukCCbvZjIS8AGaXi/dglCfXoV6b+49LezvXNuj1TrfoedP4HFHe5+jWPp4hj
         eFmErTdEYiVuaa1QkyGKJv32P58igxQHEhDcp75O+M0/TgdCmtD+MaQlvn9XaWWvP+Mt
         NuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EcfJ6w5gFLDuwWbTg8M60jgGpw9PMF7Xy7rodhdYZko=;
        b=OR4t/+RKysNlSZlUPUA9rrOPvkjACVh7Ki/2gUqmpaKx23c4NPSBVteK1W78At1c2Y
         ZyEPzFCEcCf04xPR+gvBg/YR8p3U/CSX/348537EKufRRdSZKUKfJWJhGVXHQ7rbgZIH
         iZ4NjLB64tJRSVFLszZ//dwianc5XbCL8d3hBWFsZlKUt/DJhscFyjqF2hWIYZ8WC+ex
         phLp7+fdt9bjWoIDF+0jGeXqEUiXikPNYpY2N50YB2LZCb+mY+hd3Guzec9JwnQ2ShQX
         HWgFEatWY4QHPcfzDYOnLQf7KnY5Exe3twg3MvsU66RDO0q5MHpqW/3/XFdCZh5oefTz
         UP0A==
X-Gm-Message-State: AOAM533Ib9dSwGsrpz/18Nq1E8NCwITlJ9VOwlP78DlPk1CUVkcZi4IY
	RFpuSjoPIGNfIoTGfSShjq1LYG23Q0HfjQovCvvsg422mNwztZogBA5tueVNU08iIGuW6xkKDj7
	pZRrf0FY1IU9VrdGAc7hoG9mcIeuw+t731kZYlXf/WW0VZTZDn3PZ8wNjj6t55LzbyMMgWzl2G1
	83MehlfyzsK3Of+R3RTAml8uMHFqFqjpdd/ek5W6cDERoO/oniXWfzGRXmU3+8931Uhav71LzG8
	XNaCa40krXbi2o=
X-Google-Smtp-Source: 
 ABdhPJwI3MRpUj2kMJRcuom5RqCzCAQoCuPwSEevZ6HLZF8OGAFBtnHi3qXsGWh4jxZPd9ICJqSukdba6JMCPfU94/k=
X-Received: by 2002:a05:6102:676:b0:32a:1ebb:9129 with SMTP id
 z22-20020a056102067600b0032a1ebb9129mr6956823vsf.47.1650480249516; Wed, 20
 Apr 2022 11:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
From: Russ Dill <russ.dill@nikolamotor.com>
Date: Wed, 20 Apr 2022 11:43:58 -0700
Message-ID: 
 <CA+05MtrxtejYEOE2KFv0=O7_m4dUSMm7UGorcxHWnTfUt_CQPw@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck from
 source directory
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
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164721

On Wed, Apr 20, 2022 at 10:19 AM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Wed, Apr 20, 2022 at 12:38 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > >
> > >
> > >
> > > On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> > >>
> > >> do_kernel_configcheck utilizes pathnames relative to the sourcedir
> > >> but does not specify ${S} in [dirs]. tasks that do not specify
> > >> [dirs] default to the cwd of the bitbake parent process. This can be
> > >> seen by inspection of exec_func/exec_func_python of
> > >> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
> > >> at the head of do_kernel_configcheck.
> > >>
> > >> This is problematic if bitbake is run from a directory that
> > >> contains a meta/ subdirectory. In this case the code:
> > >>
> > >>     kmeta = d.getVar("KMETA") or "meta"
> > >>     if not os.path.exists(kmeta):
> > >>         kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> > >>
> > >> Causes kmeta to be set to just "meta" if a meta directory exists
> > >> in the cwd of the bitbake parent process, or to the output of
> > >
> > >
> > > That isn't actually a problem, and is the design intent of that check. It allows a temporary/local override of the meta data, simply by creating a 'meta' subdir.
> > >
> >
> > It's not working as intended though. While the check for the "meta"
> > path is done in the cwd of the bitbake parent process, the actual
> > usage of it is done in ${S}:
>
> It hasn't been used in quite some time, but the design intent is what
> I stated. So it would be better to make that later reference more
> flexible.
>
> You have described the problem, but not how you've managed to trigger the error.

It's pretty straightforward. The default yocto steps create a
directory tree that contains a directory called meta (along with
meta-poky, meta-selftest, build, bitbake, etc). If you run bitbake
from this top-level directory and have a kernel image with a kconfig
issue, it will trigger the error. The kmeta var will be set to meta,
and since that directory exists within the cwd of bitbake's parent
process (the yocto tree) the kgit command will not be executed. When
the various steps define outfile, they use:

 "{}/{}/cfg/invalid.txt".format(s,kmeta)

This directory is not a subdirectory of the directory that bitbake was
run from, but within the kernel source since it contains the 's'.
Rather than attempting to utilize $PWD/meta/cfg, $S/meta/cfg/ is
utilized. Unless the path meta/cfg exists within the kernel source,
creating outfile fails.

As far as fixing it while keeping the design intent in check, was the
intent for the meta directory to exist within the cwd of the bitbake
parent process? Or within the kernel source tree? Keying off the meta
directory in the cwd of the bitbake process is confusing behaviour,
especially since that directory name is already used for a different
purpose at the top-level.

> >
> >     if analysis:
> >         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> >
> > Which leads to:
> >
> > DEBUG: Executing python function do_kernel_configcheck
> > ERROR: Error executing a python function in exec_func_python() autogenerated:
> >
> > The stack trace of python calls that resulted in this exception/failure was:
> > File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> >      0001:
> >  *** 0002:do_kernel_configcheck(d)
> >      0003:
> > File: '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
> > lineno: 591, function: do_kernel_configcheck
> >      0587:    if analysis:
> >      0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> >      0589:        if os.path.isfile(outfile):
> >      0590:           os.remove(outfile)
> >  *** 0591:        with open(outfile, 'w+') as f:
> >      0592:            f.write( analysis )
> >      0593:
> >      0594:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
> >      0595:            with open (outfile, "r") as myfile:
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > '[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'
> >
> >
> >
> > >
> > > Bruce
> > >
> > >
> > >>
> > >> kgit --meta if it does not.
> > >>
> > >> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> > >> ---
> > >>  meta/classes/kernel-yocto.bbclass | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> > >> index 1d5a8cdf29..c787b2a122 100644
> > >> --- a/meta/classes/kernel-yocto.bbclass
> > >> +++ b/meta/classes/kernel-yocto.bbclass
> > >> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
> > >>      if warnings_detected and kmeta_audit_werror:
> > >>          bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
> > >>  }
> > >> +do_kernel_configcheck[dirs] = "${S}"
> > >>
> > >>  # Ensure that the branches (BSP and meta) are on the locations specified by
> > >>  # their SRCREV values. If they are NOT on the right commits, the branches
> > >> --
> > >> 2.25.1
> > >>
> > >
> > >
> > > --
> > > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
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

