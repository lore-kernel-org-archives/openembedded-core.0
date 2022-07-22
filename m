Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83DDC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 18:00:27 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.10877.1658512817416166673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BxBpIlAL;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id q7so6261849lji.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jul 2022 11:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iMM1w1k8yjTX+aX4nBWHKBm+cm8Ocz7cAXWi3wxns5Y=;
        b=BxBpIlALtIzCLLH0rIp/THLiA3EQ1GcFSsNRuJkObfEbh3BUe7Qtd616XLF15GZCG4
         RBWcCx4jT2/rZ+4krzzS0J7fHSDJzfhRyqK9h/pchIKYBUX8YxQ2yoAxg/OB99u+89Ml
         UXvvFxNGD/sWCkEkKY+0l8wpm1YhXPmJOPkADgLKkU7wkBko9D6pI/od+897UEYxw6X0
         q2/OJNusoyH0GgkqLb4CZDmBlztul95ZGF6U/1r49GFfZ9s2KFfcLM+0CxXHGa3Y/Knv
         eMlccXZzSkKgypgVWhY21RgN0AoJDG+UlIG4lML2UWUYGt5/KCg2n0pPfZ0iN1wre5Ta
         rnpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iMM1w1k8yjTX+aX4nBWHKBm+cm8Ocz7cAXWi3wxns5Y=;
        b=SUjooRjPx4jb240IJqkiS4fFCieM33/fnjemCw0GbGjZBZE4lqkZB856M+e/w9wvAH
         +r1XbjMlW6OLDCqK5QkpVvDwSV8JIm/mt/tdwizhM4Cl1+0bfMLCh1GKMKRGAEKHsv72
         UQ5x2vY1fgIJLYtRr5zPy1R7a/LlvIUDqmdvYzYJkDDVO0GsSRwH+DNM0La4egZPZ/z7
         SuBC58K3pAFP2imKV9nMOAetF+GT8n2sqeXu920+AmEN1zbJNMjunER+yUsT9Io18Abt
         arVrHFxiydk8i72F1i+hAMG8KLOPZIHKNaj8VurxhYE0dy11SRjJlSd5CewNhAWMYeJe
         nprA==
X-Gm-Message-State: AJIora+qwOr0YFqFx5EaiAnmFYpdkYu35HDkv6+iIj3EmDHvUVmf6eli
	aPvgg1nhoyyQjelWDM5XxKrUm3JifIcq5szJHwU=
X-Google-Smtp-Source: 
 AGRyM1tr+VbwOB+uiQeA49qwvifO6HeDkOHgOQwo8kXVa7/STz2mB3ORhbLBwFRUi/cTqsb4SQrGEMUmA3SPoBRxdDs=
X-Received: by 2002:a2e:8ed7:0:b0:25d:eba0:9e2d with SMTP id
 e23-20020a2e8ed7000000b0025deba09e2dmr387013ljl.109.1658512815451; Fri, 22
 Jul 2022 11:00:15 -0700 (PDT)
MIME-Version: 1.0
References: 
 <SN4PR04MB8365362E2220AB30FE2321A0E4919@SN4PR04MB8365.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN4PR04MB8365362E2220AB30FE2321A0E4919@SN4PR04MB8365.namprd04.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Jul 2022 20:00:04 +0200
Message-ID: 
 <CANNYZj9_F8hf=T5XjtifgCX7ZuY7T0JK4agc81_KVox7vot4+g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3] package_manager/ipk: do not pipe stderr to
 stdout
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Jul 2022 18:00:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168417

Thanks, this looks fine. Can you resend the patch using 'git
send-email'? I'm not sure if sending the patch as a quoted reply to me
allows it to be picked from the mailing list.

Alex

On Thu, 21 Jul 2022 at 02:19, Shruthi Ravichandran
<shruthi.ravichandran@ni.com> wrote:
>
> Some opkg commands print an error during cleanup when the tmp_dir
> does not exist and an attempt is made to delete it. The error messages
> are harmless and the opkg commands eventually succeed.
> When these commands are run and stderr is piped to stdout, the error
> messages may clobber the stdout and cause unexpected results while
> parsing the output of the command. Therefore, when parsing the output
> of a command, do not pipe stderr to stdout. Instead, capture stderr
> and stdout separately, and upon success, send stderr to bb.note().
>
> Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> ---
>  meta/lib/oe/package_manager/ipk/__init__.py | 23 ++++++++++++---------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 6fd2f021b6..7cbea0fa80 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -102,12 +102,14 @@ class OpkgDpkgPM(PackageManager):
>          This method extracts the common parts for Opkg and Dpkg
>          """
>
> -        try:
> -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> -        except subprocess.CalledProcessError as e:
> +        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
> +        if proc.returncode:
>              bb.fatal("Unable to list available packages. Command '%s' "
> -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> -        return opkg_query(output)
> +                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
> +        elif proc.stderr:
> +            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
> +
> +        return opkg_query(proc.stdout)
>
>      def extract(self, pkg, pkg_info):
>          """
> @@ -445,15 +447,16 @@ class OpkgPM(OpkgDpkgPM):
>          cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
>                                                  opkg_args,
>                                                  ' '.join(pkgs))
> -        try:
> -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> -        except subprocess.CalledProcessError as e:
> +        proc = subprocess.run(cmd, capture_output=True, encoding="utf-8", shell=True)
> +        if proc.returncode:
>              bb.fatal("Unable to dummy install packages. Command '%s' "
> -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> +                     "returned %d:\n%s" % (cmd, proc.returncode, proc.stderr))
> +        elif proc.stderr:
> +            bb.note("Command '%s' returned stderr: %s" % (cmd, proc.stderr))
>
>          bb.utils.remove(temp_rootfs, True)
>
> -        return output
> +        return proc.stdout
>
>      def backup_packaging_data(self):
>          # Save the opkglib for increment ipk image generation
> --
> 2.20.1
>
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Wednesday, July 20, 2022 1:37 AM
> > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH v2] package_manager/ipk: do not pipe stderr to stdout
> >
> > Please use subprocess.run() (which allows separate capture of stderr),
> > rather than switch the whole thing to popen.
> >
> > Alex
> >
> > On Tue, 19 Jul 2022 at 23:51, Shruthi Ravichandran
> > <shruthi.ravichandran@ni.com> wrote:
> > >
> > > Some opkg commands print an error during cleanup when the tmp_dir
> > > does not exist and an attempt is made to delete it. The error messages
> > > are harmless and the opkg commands eventually succeed.
> > > When these commands are run and stderr is piped to stdout, the error
> > > messages may clobber the stdout and cause unexpected results while
> > > parsing the output of the command. Therefore, when parsing the output
> > > of a command, do not pipe stderr to stdout. Instead, capture stderr
> > > and stdout separately, and upon success, send stderr to bb.note().
> > >
> > > Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > ---
> > >  meta/lib/oe/package_manager/ipk/__init__.py | 30 ++++++++++++++-------
> > >  1 file changed, 20 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> > > index 6fd2f021b6..a768de5c30 100644
> > > --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > > +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > > @@ -102,12 +102,17 @@ class OpkgDpkgPM(PackageManager):
> > >          This method extracts the common parts for Opkg and Dpkg
> > >          """
> > >
> > > -        try:
> > > -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> > > -        except subprocess.CalledProcessError as e:
> > > +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> > > +        cmd_stdout, cmd_stderr = proc.communicate()
> > > +        cmd_stdout = cmd_stdout.decode("utf-8")
> > > +        cmd_stderr = cmd_stderr.decode("utf-8")
> > > +        if proc.returncode:
> > >              bb.fatal("Unable to list available packages. Command '%s' "
> > > -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> > > -        return opkg_query(output)
> > > +                    "returned %d:\n%s" % (cmd, proc.returncode, cmd_stderr))
> > > +        elif cmd_stderr:
> > > +            bb.note("Command '%s' returned stderr: %s" % (cmd, cmd_stderr))
> > > +
> > > +        return opkg_query(cmd_stdout)
> > >
> > >      def extract(self, pkg, pkg_info):
> > >          """
> > > @@ -445,15 +450,20 @@ class OpkgPM(OpkgDpkgPM):
> > >          cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
> > >                                                  opkg_args,
> > >                                                  ' '.join(pkgs))
> > > -        try:
> > > -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> > > -        except subprocess.CalledProcessError as e:
> > > +
> > > +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> > > +        cmd_stdout, cmd_stderr = proc.communicate()
> > > +        cmd_stdout = cmd_stdout.decode("utf-8")
> > > +        cmd_stderr = cmd_stderr.decode("utf-8")
> > > +        if proc.returncode:
> > >              bb.fatal("Unable to dummy install packages. Command '%s' "
> > > -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> > > +                     "returned %d:\n%s" % (cmd, proc.returncode, cmd_stderr))
> > > +        elif cmd_stderr:
> > > +            bb.note("Command '%s' returned stderr: %s" % (cmd, cmd_stderr))
> > >
> > >          bb.utils.remove(temp_rootfs, True)
> > >
> > > -        return output
> > > +        return cmd_stdout
> > >
> > >      def backup_packaging_data(self):
> > >          # Save the opkglib for increment ipk image generation
> > > --
> > > 2.20.1
> > >
> > >
> > > > -----Original Message-----
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Sent: Friday, July 1, 2022 5:26 AM
> > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > >
> > > > Yes, certainly.
> > > >
> > > > Alex
> > > >
> > > > On Fri, 1 Jul 2022 at 00:30, Shruthi Ravichandran
> > > > <shruthi.ravichandran@ni.com> wrote:
> > > > >
> > > > > The change currently does discard everything in stderr. I can update
> > > > > it to capture stderr and push it to bb.note on command success and
> > > > > bb.fatal on command failure. In fact, I can make those changes to the
> > > > > several other instances in this file where stderr is piped to stdout
> > > > > too. Would that be acceptable?
> > > > >
> > > > > Shruthi
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > Sent: Thursday, June 30, 2022 1:47 AM
> > > > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > > > Cc: openembedded-core@lists.openembedded.org
> > > > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > > > >
> > > > > > Thanks for the information - perhaps this should be added to the commit message?
> > > > > >
> > > > > > Does this change discard things that appear on stderr completely, or
> > > > > > does it still go somewhere where it can be seen later?
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > On Wed, 29 Jun 2022 at 21:22, Shruthi Ravichandran
> > > > > > <shruthi.ravichandran@ni.com> wrote:
> > > > > > >
> > > > > > > Hi Alex,
> > > > > > >
> > > > > > > I've found that some OE commands print an error during cleanup when
> > > > > > > the tmp_dir does not exist and an attempt is made to delete it. I've
> > > > > > > submitted a patch to opkg to fix that.
> > > > > > > Link:
> > > > > >
> > > >
> > https://urldefense.com/v3/__https://git.yoctoproject.org/opkg/commit/?id=8dfdda86afd407a66e3dc00a077bdcc8b53d54ea__;!!FbZ0ZwI
> > > > > > 3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-W-iLjh48$ .
> > > > > > > That was the one instance that was causing an issue in our builds.
> > > > > > > There may be other instances that I don't know of. Given that, I think
> > > > > > > the package_manager code should be resilient against any such
> > > > > > > miscellaneous stderr messages, which do not result in the command
> > > > > > > itself failing.
> > > > > > >
> > > > > > > Hope that helps,
> > > > > > > Shruthi
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > > > Sent: Tuesday, June 28, 2022 1:33 PM
> > > > > > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > > > > > Cc: openembedded-core@lists.openembedded.org
> > > > > > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > > > > > >
> > > > > > > > This needs additional justification. What are the error messages, why are they harmless and why the solution is to suppress them
> > > > instead
> > > > > > of
> > > > > > > > addressing the reasons they appear?
> > > > > > > >
> > > > > > > > Alex
> > > > > > > >
> > > > > > > > On Tue 28. Jun 2022 at 23.13, Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> >
> > wrote:
> > > > > > > >
> > > > > > > >
> > > > > > > >       When parsing the output of a command, do not pipe stderr to stdout.
> > > > > > > >       Opkg sometimes prints harmless error messages even when the opkg
> > > > > > > >       command succeeds. When stderr is piped to stdout, these error
> > > > > > > >       messages may clobber the stdout and cause unexpected results while
> > > > > > > >       parsing the output.
> > > > > > > >
> > > > > > > >       Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> >
> > > > > > > >       ---
> > > > > > > >        meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
> > > > > > > >        1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > >
> > > > > > > >       diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > > > >       index 4cd3963111..d7f3f31853 100644
> > > > > > > >       --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > > > >       +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > > > >       @@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
> > > > > > > >                """
> > > > > > > >
> > > > > > > >                try:
> > > > > > > >       -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> > > > > > > >       +            output = subprocess.check_output(cmd, shell=True).decode("utf-8")
> > > > > > > >                except subprocess.CalledProcessError as e:
> > > > > > > >                    bb.fatal("Unable to list available packages. Command '%s' "
> > > > > > > >                             "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> > > > > > > >       --
> > > > > > > >       2.20.1
> > > > > > > >
> > > > > > > >
> > > > > > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > > >       Links: You receive all messages sent to this group.
> > > > > > > >       View/Reply Online (#167354): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > >
> > > >
> > core/message/167354__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6
> > > > > > gk-W-P8eXeA$
> > > > > > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > > > > core/message/167354__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > > > > > > > qSvIV3p_DxpS6tCIX3jHMdg$>
> > > > > > > >       Mute This Topic:
> > > > > >
> > > >
> > https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222
> > > > > > jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-WvQyK1Es$
> > > > > > > >
> > > > > >
> > > >
> > <https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kB
> > > > > > > > LndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-qSvIV3p_DxpS6tCIs81jASw$>
> > > > > > > >       Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-
> > > > > > > > core%2Bowner@lists.openembedded.org>
> > > > > > > >       Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > > core/unsub__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-
> > > > > > WWbrhU-c$
> > > > > > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > > > > core/unsub__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > > > > > qSvIV3p_DxpS6tCIADJRjJc$>
> > > > > > > > [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com> ]
> > > > > > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > INTERNAL - NI CONFIDENTIAL
> > > > >
> > > > > INTERNAL - NI CONFIDENTIAL
> > >
> > > INTERNAL - NI CONFIDENTIAL
>
> INTERNAL - NI CONFIDENTIAL

