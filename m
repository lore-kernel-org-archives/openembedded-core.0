Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12968C4332F
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.12330.1650483726280975629
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mQMD+gB2;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id g18so5611725ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 12:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=po6hhFO6+sbOhMejR+z/MZEV67cwDD72ovZJ4HsKHSY=;
        b=mQMD+gB2NqLOkhn1cWU3pBPqQPmUFmbQMLhuJSfAAj+wCqddax1GK0LUkyWsJWPHWG
         YDVIcjMzfMGKC8pDlzRfV2gri8hUgztv7m4Lzw4KNsm1EwPJ9kapK8oyLybqPBHU0tcX
         g+Xg/J/oBBy+mFR8boXkNvTx48I2eFffYUJxGoxXvJSr66rwk8ejUevF98Hiuzg6qTCE
         /pW6alTLMmkXHvQuehEYZubXW0wPWxE4m/pNWYkCWtSR7Xvv1cLUPz31JZuyPqN238+A
         zRx7OoUQJKWBId9g+WtmtX7Ik9FyTJhFRcoSqxFshM50FRJNhrmLozeGTz0AejDTs+2w
         sXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=po6hhFO6+sbOhMejR+z/MZEV67cwDD72ovZJ4HsKHSY=;
        b=gTln/X3dFHZ6vsKJSVDIuB1IRAhACKjWfll8OvM7QqPzcLQ2trlIK85/UtF6isxzIY
         nqB+qEyZ+4UGuFDqhrhQBMt17+LzESC0ssJHWw3MCAr7bmkXScQnpv4lm5RZuvjHdbqF
         EtMdEEI7tx2hbgJJBicQZiplpZ+GN7I3V7AWxkhBr9dfpo5qs6xniwitwHx79firuCW0
         zMgHJS1TbG0SgDdWxLN5LK80w/Mr2ymFJT8fEq/ocKiqa3aer6kX4nETOVd8B0QlEuqG
         TEVEMt7SK37V/vwKQA+uyYmHnh7oXKhXd3q5JbM3M4/6KBUHoK7tCmKhQfoZYSOcWOFt
         2YDA==
X-Gm-Message-State: AOAM5333USzvErnXrgd6DvsM1CrGs6ueeZm+uBhLji1ZPxW4ZouZSVG+
	fz6gq4/pSD/879jCHdlwa50mp6ahyXixbYXpTLc=
X-Google-Smtp-Source: 
 ABdhPJxfZW3rxRqFexKJs5iI/O87qg4lUSmCCoPUZWJ01tqCFsALJSuInThV6lGqlCc4fjimuvnr5qvpU3QgEbFyD1w=
X-Received: by 2002:a17:906:1be1:b0:6ce:b0a8:17d with SMTP id
 t1-20020a1709061be100b006ceb0a8017dmr19889334ejg.413.1650483724532; Wed, 20
 Apr 2022 12:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220420162738.3371938-1-russ.dill@nikolamotor.com>
 <CADkTA4Pi8bwhNe3k6+eVdgrmvCxE9ScVzRKeg_3N02N8SULv8Q@mail.gmail.com>
 <CA+05MtpPevqVGSt8ZnqQFoGwOFWJ2u9c6ySmhO=xHJ-M0fGzxw@mail.gmail.com>
 <CADkTA4PH86Y34PXGkJU03uC79J+w5+9=5d2PGdTcMMOCy8rYww@mail.gmail.com>
 <CA+05MtrxtejYEOE2KFv0=O7_m4dUSMm7UGorcxHWnTfUt_CQPw@mail.gmail.com>
 <CADkTA4PLNG+Y83_b1CeOTvq2=vzm66KWNu6VXsLJjoZXpyNhBg@mail.gmail.com>
 <CA+05MtrOWd5ooz7-_UfX1BKLU2yePcHERnCk5q4UaCdKzVn+=g@mail.gmail.com>
In-Reply-To: 
 <CA+05MtrOWd5ooz7-_UfX1BKLU2yePcHERnCk5q4UaCdKzVn+=g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Apr 2022 15:41:53 -0400
Message-ID: 
 <CADkTA4M5tHgrS5w6QHUWNLoe9hUi4WH6DQmCkoF2xGg3vHqqtA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-yocto.bbclass: Run do_kernel_configcheck
 from source directory
To: Russ Dill <russ.dill@nikolamotor.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001bc19505dd1b3043"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164724

--0000000000001bc19505dd1b3043
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 20, 2022 at 3:29 PM Russ Dill <russ.dill@nikolamotor.com> wrote:

> On Wed, Apr 20, 2022 at 12:09 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > On Wed, Apr 20, 2022 at 2:44 PM Russ Dill <russ.dill@nikolamotor.com>
> wrote:
> > >
> > > On Wed, Apr 20, 2022 at 10:19 AM Bruce Ashfield
> > > <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > On Wed, Apr 20, 2022 at 12:38 PM Russ Dill <
> russ.dill@nikolamotor.com> wrote:
> > > > >
> > > > > On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Wed, Apr 20, 2022 at 12:28 PM Russ Dill <
> russ.dill@nikolamotor.com> wrote:
> > > > > >>
> > > > > >> do_kernel_configcheck utilizes pathnames relative to the
> sourcedir
> > > > > >> but does not specify ${S} in [dirs]. tasks that do not specify
> > > > > >> [dirs] default to the cwd of the bitbake parent process. This
> can be
> > > > > >> seen by inspection of exec_func/exec_func_python of
> > > > > >> bitbake/lib/bb/build.py or by placing a "print('CWD',
> os.getcwd())"
> > > > > >> at the head of do_kernel_configcheck.
> > > > > >>
> > > > > >> This is problematic if bitbake is run from a directory that
> > > > > >> contains a meta/ subdirectory. In this case the code:
> > > > > >>
> > > > > >>     kmeta = d.getVar("KMETA") or "meta"
> > > > > >>     if not os.path.exists(kmeta):
> > > > > >>         kmeta = subprocess.check_output(['kgit', '--meta'],
> cwd=d.getVar('S')).decode('utf-8').rstrip()
> > > > > >>
> > > > > >> Causes kmeta to be set to just "meta" if a meta directory exists
> > > > > >> in the cwd of the bitbake parent process, or to the output of
> > > > > >
> > > > > >
> > > > > > That isn't actually a problem, and is the design intent of that
> check. It allows a temporary/local override of the meta data, simply by
> creating a 'meta' subdir.
> > > > > >
> > > > >
> > > > > It's not working as intended though. While the check for the "meta"
> > > > > path is done in the cwd of the bitbake parent process, the actual
> > > > > usage of it is done in ${S}:
> > > >
> > > > It hasn't been used in quite some time, but the design intent is what
> > > > I stated. So it would be better to make that later reference more
> > > > flexible.
> > > >
> > > > You have described the problem, but not how you've managed to
> trigger the error.
> > >
> > > It's pretty straightforward. The default yocto steps create a
> > > directory tree that contains a directory called meta (along with
> > > meta-poky, meta-selftest, build, bitbake, etc). If you run bitbake
> > > from this top-level directory and have a kernel image with a kconfig
> > > issue, it will trigger the error. The kmeta var will be set to meta,
> > > and since that directory exists within the cwd of bitbake's parent
> > > process (the yocto tree) the kgit command will not be executed. When
> > > the various steps define outfile, they use:
> >
> > I'm aware of how the basics work :) I've run more builds than I'd like
> > to admit in a very similar configuration, with many more kernel
> configuration
> > issues than most .. and I've never triggered this particular issue.
>
> Just trying to short-cut any further ping-ponging by providing an over
> abundance of detail.
>
> > So you aren't actually running from a "build" directory/subdirectory ?
> > But instead are running it directly from your poky clone ? That's a
> > not a common directory layout at all.
>
> The build sub-directory still exists, but because sourcing
> oe-init-build-env sets BUILDDIR and BBPATH, I typically just run the
> bitbake commands from wherever I happen to be working. This is the
> first time it's caused me any issues.
>
>
A fairly unique workflow (since no one else has seen this), but
obviously supported! So all good on that front.



> > >
> > >  "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > >
> > > This directory is not a subdirectory of the directory that bitbake was
> > > run from, but within the kernel source since it contains the 's'.
> > > Rather than attempting to utilize $PWD/meta/cfg, $S/meta/cfg/ is
> > > utilized. Unless the path meta/cfg exists within the kernel source,
> > > creating outfile fails.
> > >
> > > As far as fixing it while keeping the design intent in check, was the
> > > intent for the meta directory to exist within the cwd of the bitbake
> > > parent process? Or within the kernel source tree? Keying off the meta
> > > directory in the cwd of the bitbake process is confusing behaviour,
> > > especially since that directory name is already used for a different
> > > purpose at the top-level.
> >
> > It could be either. Sometimes in the kernel directory, sometimes not.
> > I've done development with local kernel meta directories in both
> locations
> > throughout the years.
> >
> > But the intention is that it commonly is in the kernel source tree, so
> > the forcing of the 'dir' isn't fundamentally wrong .. just that most of
> > the paths really should have been fully specified (and have been
> > throughout various iterations), so it also shouldn't matter.
> >
> > All of the linux-yocto recipes set KMETA, so you must also be running
> > without specifying the name of the kernel meta data, which
> > is also part of the corner case.  Since KMETA is now fully specified
> > in the reference kernels (it wasn't always), the right thing to do is
> > probably to drop the check for 'meta' entirely and just use the
> > variable with a fallback to the kernel tools returned location/directory.
>
> This appears to be the primary issue and the easiest fix for me
> locally. Freescale's linux-imx.inc and recipes that include it don't
> set KMETA.
>
> > The kernel-tools and the 'meta' directory naming pre-date the
> > integration with oe-core/yocto, hence the namespace collision. We
> > can clean that up a bit by dropping the hardcoded name check, and
> > see if anything was still relying on it (through an issue on integration
> > testing, or a bug report).
>
> If it save you time, I can sum things up a bit and provide a patch for
> either dropping the hardcoding entirely, changing the reference to
> "{}/meta".format(os.getcwd()), or "{}/meta".format(s) (along with
> moving s = d.getVar('S') up a bit)
>

I'd prefer to move towards simplification, and drop the hardcoded
meta directory check.

Likewise, I can also run some extra checks by doing a local patch
for it, but since you are already in the midst of seeing the issue,
I'd say send a new patch and I can watch for any issues.

Bruce



>
> > Bruce
> >
> > >
> > > > >
> > > > >     if analysis:
> > > > >         outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > > > >
> > > > > Which leads to:
> > > > >
> > > > > DEBUG: Executing python function do_kernel_configcheck
> > > > > ERROR: Error executing a python function in exec_func_python()
> autogenerated:
> > > > >
> > > > > The stack trace of python calls that resulted in this
> exception/failure was:
> > > > > File: 'exec_func_python() autogenerated', lineno: 2, function:
> <module>
> > > > >      0001:
> > > > >  *** 0002:do_kernel_configcheck(d)
> > > > >      0003:
> > > > > File:
> '/home/[USER]/[SRC-PATH]/build/../meta/classes/kernel-yocto.bbclass',
> > > > > lineno: 591, function: do_kernel_configcheck
> > > > >      0587:    if analysis:
> > > > >      0588:        outfile = "{}/{}/cfg/invalid.txt".format(s,kmeta)
> > > > >      0589:        if os.path.isfile(outfile):
> > > > >      0590:           os.remove(outfile)
> > > > >  *** 0591:        with open(outfile, 'w+') as f:
> > > > >      0592:            f.write( analysis )
> > > > >      0593:
> > > > >      0594:        if bsp_check_visibility and
> os.stat(outfile).st_size > 0:
> > > > >      0595:            with open (outfile, "r") as myfile:
> > > > > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > > > >
> '[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta/cfg/invalid.txt'
> > > > >
> > > > >
> > > > >
> > > > > >
> > > > > > Bruce
> > > > > >
> > > > > >
> > > > > >>
> > > > > >> kgit --meta if it does not.
> > > > > >>
> > > > > >> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> > > > > >> ---
> > > > > >>  meta/classes/kernel-yocto.bbclass | 1 +
> > > > > >>  1 file changed, 1 insertion(+)
> > > > > >>
> > > > > >> diff --git a/meta/classes/kernel-yocto.bbclass
> b/meta/classes/kernel-yocto.bbclass
> > > > > >> index 1d5a8cdf29..c787b2a122 100644
> > > > > >> --- a/meta/classes/kernel-yocto.bbclass
> > > > > >> +++ b/meta/classes/kernel-yocto.bbclass
> > > > > >> @@ -620,6 +620,7 @@ python do_kernel_configcheck() {
> > > > > >>      if warnings_detected and kmeta_audit_werror:
> > > > > >>          bb.fatal( "configuration warnings detected, werror is
> set, promoting to fatal" )
> > > > > >>  }
> > > > > >> +do_kernel_configcheck[dirs] = "${S}"
> > > > > >>
> > > > > >>  # Ensure that the branches (BSP and meta) are on the locations
> specified by
> > > > > >>  # their SRCREV values. If they are NOT on the right commits,
> the branches
> > > > > >> --
> > > > > >> 2.25.1
> > > > > >>
> > > > > >
> > > > > >
> > > > > > --
> > > > > > - Thou shalt not follow the NULL pointer, for chaos and madness
> await thee at its end
> > > > > > - "Use the force Harry" - Gandalf, Star Trek II
> > > > > >
> > > > >
> > > > >
> > > > > --
> > > > >
> > > > >
> > > > >
> > > > > Russ Dill
> > > > >
> > > > > russ.dill@nikolamotor.com
> > > > >
> > > > > NIKOLA CORPORATION | nikolamotor.com
> > > > > 4141 E Broadway Rd | Phoenix | AZ | 85040
> > > > >
> > > > >
> > > > >
> > > > > INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL.
> IF
> > > > > YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR
> > > > > REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU
> HAVE
> > > > > RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL
> > > > > REPLY AND THEN DELETE THIS E-MAIL.
> > > >
> > > >
> > > >
> > > > --
> > > > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > > > thee at its end
> > > > - "Use the force Harry" - Gandalf, Star Trek II
> > >
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
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164722):
> https://lists.openembedded.org/g/openembedded-core/message/164722
> > Mute This Topic: https://lists.openembedded.org/mt/90587617/6825211
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> russ.dill@nikolamotor.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
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
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001bc19505dd1b3043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Apr 20, 2022 at 3:29 PM Russ Dill &lt;<a hr=
ef=3D"mailto:russ.dill@nikolamotor.com">russ.dill@nikolamotor.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Ap=
r 20, 2022 at 12:09 PM Bruce Ashfield<br>
&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ash=
field@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Wed, Apr 20, 2022 at 2:44 PM Russ Dill &lt;<a href=3D"mailto:russ.d=
ill@nikolamotor.com" target=3D"_blank">russ.dill@nikolamotor.com</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Apr 20, 2022 at 10:19 AM Bruce Ashfield<br>
&gt; &gt; &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank"=
>bruce.ashfield@gmail.com</a>&gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On Wed, Apr 20, 2022 at 12:38 PM Russ Dill &lt;<a href=3D"ma=
ilto:russ.dill@nikolamotor.com" target=3D"_blank">russ.dill@nikolamotor.com=
</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; On Wed, Apr 20, 2022 at 9:32 AM Bruce Ashfield &lt;<a h=
ref=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gm=
ail.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; On Wed, Apr 20, 2022 at 12:28 PM Russ Dill &lt;<a =
href=3D"mailto:russ.dill@nikolamotor.com" target=3D"_blank">russ.dill@nikol=
amotor.com</a>&gt; wrote:<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; do_kernel_configcheck utilizes pathnames relat=
ive to the sourcedir<br>
&gt; &gt; &gt; &gt; &gt;&gt; but does not specify ${S} in [dirs]. tasks tha=
t do not specify<br>
&gt; &gt; &gt; &gt; &gt;&gt; [dirs] default to the cwd of the bitbake paren=
t process. This can be<br>
&gt; &gt; &gt; &gt; &gt;&gt; seen by inspection of exec_func/exec_func_pyth=
on of<br>
&gt; &gt; &gt; &gt; &gt;&gt; bitbake/lib/bb/build.py or by placing a &quot;=
print(&#39;CWD&#39;, os.getcwd())&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt; at the head of do_kernel_configcheck.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; This is problematic if bitbake is run from a d=
irectory that<br>
&gt; &gt; &gt; &gt; &gt;&gt; contains a meta/ subdirectory. In this case th=
e code:<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0kmeta =3D d.getVar(&quot;KM=
ETA&quot;) or &quot;meta&quot;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0if not os.path.exists(kmeta=
):<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kmeta =3D sub=
process.check_output([&#39;kgit&#39;, &#39;--meta&#39;], cwd=3Dd.getVar(&#3=
9;S&#39;)).decode(&#39;utf-8&#39;).rstrip()<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Causes kmeta to be set to just &quot;meta&quot=
; if a meta directory exists<br>
&gt; &gt; &gt; &gt; &gt;&gt; in the cwd of the bitbake parent process, or t=
o the output of<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; That isn&#39;t actually a problem, and is the desi=
gn intent of that check. It allows a temporary/local override of the meta d=
ata, simply by creating a &#39;meta&#39; subdir.<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; It&#39;s not working as intended though. While the chec=
k for the &quot;meta&quot;<br>
&gt; &gt; &gt; &gt; path is done in the cwd of the bitbake parent process, =
the actual<br>
&gt; &gt; &gt; &gt; usage of it is done in ${S}:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; It hasn&#39;t been used in quite some time, but the design i=
ntent is what<br>
&gt; &gt; &gt; I stated. So it would be better to make that later reference=
 more<br>
&gt; &gt; &gt; flexible.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; You have described the problem, but not how you&#39;ve manag=
ed to trigger the error.<br>
&gt; &gt;<br>
&gt; &gt; It&#39;s pretty straightforward. The default yocto steps create a=
<br>
&gt; &gt; directory tree that contains a directory called meta (along with<=
br>
&gt; &gt; meta-poky, meta-selftest, build, bitbake, etc). If you run bitbak=
e<br>
&gt; &gt; from this top-level directory and have a kernel image with a kcon=
fig<br>
&gt; &gt; issue, it will trigger the error. The kmeta var will be set to me=
ta,<br>
&gt; &gt; and since that directory exists within the cwd of bitbake&#39;s p=
arent<br>
&gt; &gt; process (the yocto tree) the kgit command will not be executed. W=
hen<br>
&gt; &gt; the various steps define outfile, they use:<br>
&gt;<br>
&gt; I&#39;m aware of how the basics work :) I&#39;ve run more builds than =
I&#39;d like<br>
&gt; to admit in a very similar configuration, with many more kernel config=
uration<br>
&gt; issues than most .. and I&#39;ve never triggered this particular issue=
.<br>
<br>
Just trying to short-cut any further ping-ponging by providing an over<br>
abundance of detail.<br>
<br>
&gt; So you aren&#39;t actually running from a &quot;build&quot; directory/=
subdirectory ?<br>
&gt; But instead are running it directly from your poky clone ? That&#39;s =
a<br>
&gt; not a common directory layout at all.<br>
<br>
The build sub-directory still exists, but because sourcing<br>
oe-init-build-env sets BUILDDIR and BBPATH, I typically just run the<br>
bitbake commands from wherever I happen to be working. This is the<br>
first time it&#39;s caused me any issues.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">A fairly unique workflow (since no one else has seen this)=
, but</div><div class=3D"gmail_default" style=3D"font-size:small">obviously=
 supported! So all good on that front.</div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt;<br>
&gt; &gt;=C2=A0 &quot;{}/{}/cfg/invalid.txt&quot;.format(s,kmeta)<br>
&gt; &gt;<br>
&gt; &gt; This directory is not a subdirectory of the directory that bitbak=
e was<br>
&gt; &gt; run from, but within the kernel source since it contains the &#39=
;s&#39;.<br>
&gt; &gt; Rather than attempting to utilize $PWD/meta/cfg, $S/meta/cfg/ is<=
br>
&gt; &gt; utilized. Unless the path meta/cfg exists within the kernel sourc=
e,<br>
&gt; &gt; creating outfile fails.<br>
&gt; &gt;<br>
&gt; &gt; As far as fixing it while keeping the design intent in check, was=
 the<br>
&gt; &gt; intent for the meta directory to exist within the cwd of the bitb=
ake<br>
&gt; &gt; parent process? Or within the kernel source tree? Keying off the =
meta<br>
&gt; &gt; directory in the cwd of the bitbake process is confusing behaviou=
r,<br>
&gt; &gt; especially since that directory name is already used for a differ=
ent<br>
&gt; &gt; purpose at the top-level.<br>
&gt;<br>
&gt; It could be either. Sometimes in the kernel directory, sometimes not.<=
br>
&gt; I&#39;ve done development with local kernel meta directories in both l=
ocations<br>
&gt; throughout the years.<br>
&gt;<br>
&gt; But the intention is that it commonly is in the kernel source tree, so=
<br>
&gt; the forcing of the &#39;dir&#39; isn&#39;t fundamentally wrong .. just=
 that most of<br>
&gt; the paths really should have been fully specified (and have been<br>
&gt; throughout various iterations), so it also shouldn&#39;t matter.<br>
&gt;<br>
&gt; All of the linux-yocto recipes set KMETA, so you must also be running<=
br>
&gt; without specifying the name of the kernel meta data, which<br>
&gt; is also part of the corner case.=C2=A0 Since KMETA is now fully specif=
ied<br>
&gt; in the reference kernels (it wasn&#39;t always), the right thing to do=
 is<br>
&gt; probably to drop the check for &#39;meta&#39; entirely and just use th=
e<br>
&gt; variable with a fallback to the kernel tools returned location/directo=
ry.<br>
<br>
This appears to be the primary issue and the easiest fix for me<br>
locally. Freescale&#39;s linux-imx.inc and recipes that include it don&#39;=
t<br>
set KMETA.<br>
<br>
&gt; The kernel-tools and the &#39;meta&#39; directory naming pre-date the<=
br>
&gt; integration with oe-core/yocto, hence the namespace collision. We<br>
&gt; can clean that up a bit by dropping the hardcoded name check, and<br>
&gt; see if anything was still relying on it (through an issue on integrati=
on<br>
&gt; testing, or a bug report).<br>
<br>
If it save you time, I can sum things up a bit and provide a patch for<br>
either dropping the hardcoding entirely, changing the reference to<br>
&quot;{}/meta&quot;.format(os.getcwd()), or &quot;{}/meta&quot;.format(s) (=
along with<br>
moving s =3D d.getVar(&#39;S&#39;) up a bit)<br></blockquote><div><br></div=
><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d prefer=
 to move towards simplification, and drop the hardcoded</div><div class=3D"=
gmail_default" style=3D"font-size:small">meta directory check.</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gma=
il_default" style=3D"font-size:small">Likewise, I can also run some extra c=
hecks by doing a local patch</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">for it, but since you are already in the midst of seeing the =
issue,</div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;d =
say send a new patch and I can watch for any issues.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0if analysis:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0outfile =3D &quot;{}/{=
}/cfg/invalid.txt&quot;.format(s,kmeta)<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Which leads to:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; DEBUG: Executing python function do_kernel_configcheck<=
br>
&gt; &gt; &gt; &gt; ERROR: Error executing a python function in exec_func_p=
ython() autogenerated:<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; The stack trace of python calls that resulted in this e=
xception/failure was:<br>
&gt; &gt; &gt; &gt; File: &#39;exec_func_python() autogenerated&#39;, linen=
o: 2, function: &lt;module&gt;<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0001:<br>
&gt; &gt; &gt; &gt;=C2=A0 *** 0002:do_kernel_configcheck(d)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0003:<br>
&gt; &gt; &gt; &gt; File: &#39;/home/[USER]/[SRC-PATH]/build/../meta/classe=
s/kernel-yocto.bbclass&#39;,<br>
&gt; &gt; &gt; &gt; lineno: 591, function: do_kernel_configcheck<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0587:=C2=A0 =C2=A0 if analysis:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0588:=C2=A0 =C2=A0 =C2=A0 =C2=A0 ou=
tfile =3D &quot;{}/{}/cfg/invalid.txt&quot;.format(s,kmeta)<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0589:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 os.path.isfile(outfile):<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0590:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0os.remove(outfile)<br>
&gt; &gt; &gt; &gt;=C2=A0 *** 0591:=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(ou=
tfile, &#39;w+&#39;) as f:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0592:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 f.write( analysis )<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0593:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0594:=C2=A0 =C2=A0 =C2=A0 =C2=A0 if=
 bsp_check_visibility and os.stat(outfile).st_size &gt; 0:<br>
&gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 0595:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 with open (outfile, &quot;r&quot;) as myfile:<br>
&gt; &gt; &gt; &gt; Exception: FileNotFoundError: [Errno 2] No such file or=
 directory:<br>
&gt; &gt; &gt; &gt; &#39;[YOCTO-TMP-PATH]/work/[MACHINE]/[PN]/[PV]/git/meta=
/cfg/invalid.txt&#39;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; Bruce<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; kgit --meta if it does not.<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; Signed-off-by: Russ Dill &lt;<a href=3D"mailto=
:russ.dill@nikolamotor.com" target=3D"_blank">russ.dill@nikolamotor.com</a>=
&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; ---<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 meta/classes/kernel-yocto.bbclass | 1 +<=
br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt; diff --git a/meta/classes/kernel-yocto.bbclass=
 b/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt; &gt; &gt; &gt;&gt; index 1d5a8cdf29..c787b2a122 100644<br>
&gt; &gt; &gt; &gt; &gt;&gt; --- a/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt; &gt; &gt; &gt;&gt; +++ b/meta/classes/kernel-yocto.bbclass<br>
&gt; &gt; &gt; &gt; &gt;&gt; @@ -620,6 +620,7 @@ python do_kernel_configche=
ck() {<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 if warnings_detected and k=
meta_audit_werror:<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal( &q=
uot;configuration warnings detected, werror is set, promoting to fatal&quot=
; )<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt; &gt; &gt; &gt;&gt; +do_kernel_configcheck[dirs] =3D &quot;${S}&qu=
ot;<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 # Ensure that the branches (BSP and meta=
) are on the locations specified by<br>
&gt; &gt; &gt; &gt; &gt;&gt;=C2=A0 # their SRCREV values. If they are NOT o=
n the right commits, the branches<br>
&gt; &gt; &gt; &gt; &gt;&gt; --<br>
&gt; &gt; &gt; &gt; &gt;&gt; 2.25.1<br>
&gt; &gt; &gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt; &gt; - Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end<br>
&gt; &gt; &gt; &gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star =
Trek II<br>
&gt; &gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; --<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Russ Dill<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; <a href=3D"mailto:russ.dill@nikolamotor.com" target=3D"=
_blank">russ.dill@nikolamotor.com</a><br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; NIKOLA CORPORATION | <a href=3D"http://nikolamotor.com"=
 rel=3D"noreferrer" target=3D"_blank">nikolamotor.com</a><br>
&gt; &gt; &gt; &gt; 4141 E Broadway Rd | Phoenix | AZ | 85040<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CO=
NFIDENTIAL. IF<br>
&gt; &gt; &gt; &gt; YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRI=
BUTE OR<br>
&gt; &gt; &gt; &gt; REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS)=
. IF YOU HAVE<br>
&gt; &gt; &gt; &gt; RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER=
 BY E-MAIL<br>
&gt; &gt; &gt; &gt; REPLY AND THEN DELETE THIS E-MAIL.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; --<br>
&gt; &gt; &gt; - Thou shalt not follow the NULL pointer, for chaos and madn=
ess await<br>
&gt; &gt; &gt; thee at its end<br>
&gt; &gt; &gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Russ Dill<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"mailto:russ.dill@nikolamotor.com" target=3D"_blank">ru=
ss.dill@nikolamotor.com</a><br>
&gt; &gt;<br>
&gt; &gt; NIKOLA CORPORATION | <a href=3D"http://nikolamotor.com" rel=3D"no=
referrer" target=3D"_blank">nikolamotor.com</a><br>
&gt; &gt; 4141 E Broadway Rd | Phoenix | AZ | 85040<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL=
. IF<br>
&gt; &gt; YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR<br=
>
&gt; &gt; REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU H=
AVE<br>
&gt; &gt; RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL=
<br>
&gt; &gt; REPLY AND THEN DELETE THIS E-MAIL.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#164722): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/164722" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/164722</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/90587617=
/6825211" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/90587617/6825211</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:russ.dill@nikolamotor=
.com" target=3D"_blank">russ.dill@nikolamotor.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
<br>
<br>
<br>
Russ Dill<br>
<br>
<a href=3D"mailto:russ.dill@nikolamotor.com" target=3D"_blank">russ.dill@ni=
kolamotor.com</a><br>
<br>
NIKOLA CORPORATION | <a href=3D"http://nikolamotor.com" rel=3D"noreferrer" =
target=3D"_blank">nikolamotor.com</a><br>
4141 E Broadway Rd | Phoenix | AZ | 85040<br>
<br>
<br>
<br>
INFORMATION CONTAINED IN THIS E-MAIL TRANSMISSION IS CONFIDENTIAL. IF<br>
YOU ARE NOT THE INTENDED RECIPIENT, DO NOT READ, DISTRIBUTE OR<br>
REPRODUCE THIS TRANSMISSION (INCLUDING ANY ATTACHMENTS). IF YOU HAVE<br>
RECEIVED THIS E-MAIL IN ERROR, PLEASE NOTIFY THE SENDER BY E-MAIL<br>
REPLY AND THEN DELETE THIS E-MAIL.<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--0000000000001bc19505dd1b3043--

