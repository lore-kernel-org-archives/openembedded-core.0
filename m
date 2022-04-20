Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A839CC64E7B
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web08.10605.1650475173685523304
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F38hP3Qp;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id g18so4889276ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 10:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDF771oC2tcSxa7mTuytmAKLWRnMxp53Uyz84vkDTmM=;
        b=F38hP3QpAihsW3FV/tBR60tORibPOK5DIpAB/m1izwAPkydHTFSwdKemGgN8VKdI85
         lbsRQeVZR8Z8iA4wkmCtZjrt27UR1mYnNiuk70GL/yX7uguLlfhXx3l7UOSV8F0x0bTf
         J3/Yuv3RFpqhuUJjLvnb+8j+hF5n0ZeJWTQx0HsqN+/+1xMZlA3dz7GGQLmMAMKLUEJV
         vOVCJu2E8cPhFFshMIpF1tXR5DYgD66wuja1oK5bbRyG6VI5dvFjDRbgO7DdlKwbIcOV
         ZPIFYv5a3GQWGymU+P+i0IeYeEhh8GjxPnrN/4Bp5ljFjx45UeWdZzUX4VgtJ70Gy5iv
         9L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDF771oC2tcSxa7mTuytmAKLWRnMxp53Uyz84vkDTmM=;
        b=OPHrr0FdV/LTMspdsVrZRTHV/YtFX9EMygiNglExkoTCYxZuL0cPqnuKvVmc3aHpSe
         +9kw/ua/NKG0irnyDfMsouyh+LEQvLi9xrFC6dhwzb+IVGPsQlmZSnlPSQ3n480kghNT
         OrCJgfFqcDmo5bjvr82yIRNAJjxdkTxoW2edxURZkk+lMAAJ2WUNoNgZszv7VdifoKin
         wppQBHBPFQzzTxF0sT6BJXCgRWIkCjqP3E+HVLnDGMuIpuMoIdIhjCiwgtBlsNen7zNy
         mG9Fc3NbfaIB1PE7Jh5DWtOlQ8d2Unz0cnzS64a3MfowsOHxCPQFhNHOT5xLr7kGdttH
         BgEg==
X-Gm-Message-State: AOAM5330QCFHm+tjHi6jztXE7IxDSeSBgOC0z5iY/c2LfkXCFxjqqdDJ
	ydOuTAZ9k/hkaQ195C3OKf4PPwTWBJtmWcahM7Bsar5ZV8k=
X-Google-Smtp-Source: 
 ABdhPJzLnjpuEcH9UXhX3x1/H5L5XENfwMJPH2RrW/hjcUki7p3y6kJaq7ZlLn9NS7CBNOKhOPFrPC731w2XAsullBM=
X-Received: by 2002:a17:907:86a3:b0:6ec:aaa:7f82 with SMTP id
 qa35-20020a17090786a300b006ec0aaa7f82mr19330130ejc.651.1650475171981; Wed, 20
 Apr 2022 10:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
In-Reply-To: 
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Apr 2022 13:19:21 -0400
Message-ID: 
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164720

On Wed, Apr 20, 2022 at 12:38 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
>
> On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> >
> >
> > On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
> >>
> >> do_kernel_configcheck utilizes pathnames relative to the sourcedir
> >> but does not specify ${S} in [dirs]. tasks that do not specify
> >> [dirs] default to the cwd of the bitbake parent process. This can be
> >> seen by inspection of exec_func/exec_func_python of
> >> bitbake/lib/bb/build.py or by placing a "print('CWD', os.getcwd())"
> >> at the head of do_kernel_configcheck.
> >>
> >> This is problematic if bitbake is run from a directory that
> >> contains a meta/ subdirectory. In this case the code:
> >>
> >>     kmeta = d.getVar("KMETA") or "meta"
> >>     if not os.path.exists(kmeta):
> >>         kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> >>
> >> Causes kmeta to be set to just "meta" if a meta directory exists
> >> in the cwd of the bitbake parent process, or to the output of
> >
> >
> > That isn't actually a problem, and is the design intent of that check. It allows a temporary/local override of the meta data, simply by creating a 'meta' subdir.
> >
>
> It's not working as intended though. While the check for the "meta"
> path is done in the cwd of the bitbake parent process, the actual
> usage of it is done in ${S}:

It hasn't been used in quite some time, but the design intent is what
I stated. So it would be better to make that later reference more
flexible.

You have described the problem, but not how you've managed to trigger the error.

Bruce

>
>     if analysis:
>         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
>
> Which leads to:
>
> DEBUG: Executing python function do_kernel_configcheck
> ERROR: Error executing a python function in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>      0001:
>  *** 0002:do_kernel_configcheck(d)
>      0003:
> File: '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
> lineno: 591, function: do_kernel_configcheck
>      0587:    if analysis:
>      0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
>      0589:        if os.path.isfile(outfile):
>      0590:           os.remove(outfile)
>  *** 0591:        with open(outfile, 'w+') as f:
>      0592:            f.write( analysis )
>      0593:
>      0594:        if bsp_check_visibility and os.stat(outfile).st_size > 0:
>      0595:            with open (outfile, "r") as myfile:
> Exception: FileNotFoundError: [Errno 2] No such file or directory:
> '[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'
>
>
>
> >
> > Bruce
> >
> >
> >>
> >> kgit --meta if it does not.
> >>
> >> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> >> ---
> >>  meta/classes/kernel-yocto.bbclass | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> >> index 1d5a8cdf29..c787b2a122 100644
> >> --- a/meta/classes/kernel-yocto.bbclass
> >> +++ b/meta/classes/kernel-yocto.bbclass
> >> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
> >>      if warnings_detected and kmeta_audit_werror:
> >>          bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
> >>  }
> >> +do_kernel_configcheck[dirs] = "${S}"
> >>
> >>  # Ensure that the branches (BSP and meta) are on the locations specified by
> >>  # their SRCREV values. If they are NOT on the right commits, the branches
> >> --
> >> 2.25.1
> >>
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
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

