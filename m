Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 032E2C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 08:37:05 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.51479.1658306221715760921
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dre+OD8I;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id w2so20281542ljj.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 01:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xV+1F9Coy1bMmXN/9YpDVRSps01DRhDM7NdoQBp10R0=;
        b=dre+OD8IblpE41gss/K6ojr9/vSad25oBq3gJxZo0PzZsVxVte5ybrAuyFWIpusg6O
         i1CFugT9iDyYP5p4GOI6l/43mZpAvEl6OORUGhPQF30OWCdiWHIASwmrsPNxLSdBkfYS
         a6/sZomjWXzLjDfcVk47+BsDhn2wEe7YlhRDG1WETioXa7vIdOEZmeg4s1bh7mX6xurO
         1IUtdXmaEexn6Z79MYzL/bEQ6ZuASMa2J1ks2r9vqqNBFi08BYJraJ8jdU1YNiEWpBQx
         TJk1SdrQPNR7+Qqt2FQd18qb6lt22UJRE65iiB1dVFgQJAOSEbwXvR9IWtKz/H3ps/TM
         y0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xV+1F9Coy1bMmXN/9YpDVRSps01DRhDM7NdoQBp10R0=;
        b=w0ocEmk//gbZ1z5kFHdLDgzBuYPmsJ3Y+bOiL9rTYayFX8gfyAI8rkLqxxYUViVkDP
         kJI60bY51l/TK1qygrcDNQRKddNHZX4cWEpw77cGhKlGVZlRRjuV0z3LoRii/j02nnj9
         phCO1t22oUkDTGq5tTmW98w2RksZfbFz1O7cJmuZelj6FUL0IKGGEJw6c8F8pTYAQCv0
         sQnq/y4GyJcJGrfubhjfe3FulLug6HwxkUTvUTvj2tv7nL9PNb01kH4dcXSuj/rHuBs3
         mpJWs9Fkim/aizg9Alskfm+JRWdstBMqQ+18MZCfoK29Mxh3E6Xbyd7PemxsYguBkOfA
         ANWg==
X-Gm-Message-State: AJIora8hBd49uApTmecrwl3VSvAgB0Wi54R3UdmgeK+1KMO3DAEfyzVK
	jku5VuTribpWtE5HkRtn+3cuSbeQhaPPlDso+Rw=
X-Google-Smtp-Source: 
 AGRyM1vY5pHNlQW/+mmg1wWCPTjG2kdhkYCkNldXphgOCGodhEhhpswgsoM/O1v14TqLL8C2ILhbPM+NBkG/bxazj4E=
X-Received: by 2002:a2e:9c94:0:b0:25d:7115:9c44 with SMTP id
 x20-20020a2e9c94000000b0025d71159c44mr16485435lji.257.1658306219632; Wed, 20
 Jul 2022 01:36:59 -0700 (PDT)
MIME-Version: 1.0
References: 
 <SN4PR04MB83650E5006C60D1D460EFE4DE48F9@SN4PR04MB8365.namprd04.prod.outlook.com>
In-Reply-To: 
 <SN4PR04MB83650E5006C60D1D460EFE4DE48F9@SN4PR04MB8365.namprd04.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Jul 2022 10:36:47 +0200
Message-ID: 
 <CANNYZj9y2imfHRL7UAq627rNtRwcdqD_wCJiRy66VTANuuS6QQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] package_manager/ipk: do not pipe stderr to
 stdout
To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 08:37:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168294

Please use subprocess.run() (which allows separate capture of stderr),
rather than switch the whole thing to popen.

Alex

On Tue, 19 Jul 2022 at 23:51, Shruthi Ravichandran
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
>  meta/lib/oe/package_manager/ipk/__init__.py | 30 ++++++++++++++-------
>  1 file changed, 20 insertions(+), 10 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> index 6fd2f021b6..a768de5c30 100644
> --- a/meta/lib/oe/package_manager/ipk/__init__.py
> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> @@ -102,12 +102,17 @@ class OpkgDpkgPM(PackageManager):
>          This method extracts the common parts for Opkg and Dpkg
>          """
>
> -        try:
> -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> -        except subprocess.CalledProcessError as e:
> +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> +        cmd_stdout, cmd_stderr = proc.communicate()
> +        cmd_stdout = cmd_stdout.decode("utf-8")
> +        cmd_stderr = cmd_stderr.decode("utf-8")
> +        if proc.returncode:
>              bb.fatal("Unable to list available packages. Command '%s' "
> -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> -        return opkg_query(output)
> +                    "returned %d:\n%s" % (cmd, proc.returncode, cmd_stderr))
> +        elif cmd_stderr:
> +            bb.note("Command '%s' returned stderr: %s" % (cmd, cmd_stderr))
> +
> +        return opkg_query(cmd_stdout)
>
>      def extract(self, pkg, pkg_info):
>          """
> @@ -445,15 +450,20 @@ class OpkgPM(OpkgDpkgPM):
>          cmd = "%s %s --noaction install %s " % (self.opkg_cmd,
>                                                  opkg_args,
>                                                  ' '.join(pkgs))
> -        try:
> -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
> -        except subprocess.CalledProcessError as e:
> +
> +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> +        cmd_stdout, cmd_stderr = proc.communicate()
> +        cmd_stdout = cmd_stdout.decode("utf-8")
> +        cmd_stderr = cmd_stderr.decode("utf-8")
> +        if proc.returncode:
>              bb.fatal("Unable to dummy install packages. Command '%s' "
> -                     "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> +                     "returned %d:\n%s" % (cmd, proc.returncode, cmd_stderr))
> +        elif cmd_stderr:
> +            bb.note("Command '%s' returned stderr: %s" % (cmd, cmd_stderr))
>
>          bb.utils.remove(temp_rootfs, True)
>
> -        return output
> +        return cmd_stdout
>
>      def backup_packaging_data(self):
>          # Save the opkglib for increment ipk image generation
> --
> 2.20.1
>
>
> > -----Original Message-----
> > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > Sent: Friday, July 1, 2022 5:26 AM
> > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> >
> > Yes, certainly.
> >
> > Alex
> >
> > On Fri, 1 Jul 2022 at 00:30, Shruthi Ravichandran
> > <shruthi.ravichandran@ni.com> wrote:
> > >
> > > The change currently does discard everything in stderr. I can update
> > > it to capture stderr and push it to bb.note on command success and
> > > bb.fatal on command failure. In fact, I can make those changes to the
> > > several other instances in this file where stderr is piped to stdout
> > > too. Would that be acceptable?
> > >
> > > Shruthi
> > >
> > > > -----Original Message-----
> > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > Sent: Thursday, June 30, 2022 1:47 AM
> > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > Cc: openembedded-core@lists.openembedded.org
> > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > >
> > > > Thanks for the information - perhaps this should be added to the commit message?
> > > >
> > > > Does this change discard things that appear on stderr completely, or
> > > > does it still go somewhere where it can be seen later?
> > > >
> > > > Alex
> > > >
> > > > On Wed, 29 Jun 2022 at 21:22, Shruthi Ravichandran
> > > > <shruthi.ravichandran@ni.com> wrote:
> > > > >
> > > > > Hi Alex,
> > > > >
> > > > > I've found that some OE commands print an error during cleanup when
> > > > > the tmp_dir does not exist and an attempt is made to delete it. I've
> > > > > submitted a patch to opkg to fix that.
> > > > > Link:
> > > >
> > https://urldefense.com/v3/__https://git.yoctoproject.org/opkg/commit/?id=8dfdda86afd407a66e3dc00a077bdcc8b53d54ea__;!!FbZ0ZwI
> > > > 3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-W-iLjh48$ .
> > > > > That was the one instance that was causing an issue in our builds.
> > > > > There may be other instances that I don't know of. Given that, I think
> > > > > the package_manager code should be resilient against any such
> > > > > miscellaneous stderr messages, which do not result in the command
> > > > > itself failing.
> > > > >
> > > > > Hope that helps,
> > > > > Shruthi
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > > > > Sent: Tuesday, June 28, 2022 1:33 PM
> > > > > > To: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
> > > > > > Cc: openembedded-core@lists.openembedded.org
> > > > > > Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to stdout
> > > > > >
> > > > > > This needs additional justification. What are the error messages, why are they harmless and why the solution is to suppress them
> > instead
> > > > of
> > > > > > addressing the reasons they appear?
> > > > > >
> > > > > > Alex
> > > > > >
> > > > > > On Tue 28. Jun 2022 at 23.13, Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> > wrote:
> > > > > >
> > > > > >
> > > > > >       When parsing the output of a command, do not pipe stderr to stdout.
> > > > > >       Opkg sometimes prints harmless error messages even when the opkg
> > > > > >       command succeeds. When stderr is piped to stdout, these error
> > > > > >       messages may clobber the stdout and cause unexpected results while
> > > > > >       parsing the output.
> > > > > >
> > > > > >       Signed-off-by: Shruthi Ravichandran <shruthi.ravichandran@ni.com <mailto:shruthi.ravichandran@ni.com> >
> > > > > >       ---
> > > > > >        meta/lib/oe/package_manager/ipk/__init__.py | 2 +-
> > > > > >        1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > >       diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > >       index 4cd3963111..d7f3f31853 100644
> > > > > >       --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > >       +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > > > > >       @@ -103,7 +103,7 @@ class OpkgDpkgPM(PackageManager):
> > > > > >                """
> > > > > >
> > > > > >                try:
> > > > > >       -            output = subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True).decode("utf-8")
> > > > > >       +            output = subprocess.check_output(cmd, shell=True).decode("utf-8")
> > > > > >                except subprocess.CalledProcessError as e:
> > > > > >                    bb.fatal("Unable to list available packages. Command '%s' "
> > > > > >                             "returned %d:\n%s" % (cmd, e.returncode, e.output.decode("utf-8")))
> > > > > >       --
> > > > > >       2.20.1
> > > > > >
> > > > > >
> > > > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > > > >       Links: You receive all messages sent to this group.
> > > > > >       View/Reply Online (#167354): https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > >
> > core/message/167354__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6
> > > > gk-W-P8eXeA$
> > > > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > > core/message/167354__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > > > > > qSvIV3p_DxpS6tCIX3jHMdg$>
> > > > > >       Mute This Topic:
> > > >
> > https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222
> > > > jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-WvQyK1Es$
> > > > > >
> > > >
> > <https://urldefense.com/v3/__https://lists.openembedded.org/mt/92051989/1686489__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kB
> > > > > > LndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-qSvIV3p_DxpS6tCIs81jASw$>
> > > > > >       Group Owner: openembedded-core+owner@lists.openembedded.org <mailto:openembedded-
> > > > > > core%2Bowner@lists.openembedded.org>
> > > > > >       Unsubscribe: https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > core/unsub__;!!FbZ0ZwI3Qg!omDrJfbrjlLbY2OMgsAgQrIcnap222jrjZJAhJX_BWhVJfMi09419QAHH1bVf1VafwMRcVuWBaQ5k8y6gk-
> > > > WWbrhU-c$
> > > > > > <https://urldefense.com/v3/__https://lists.openembedded.org/g/openembedded-
> > > > > > core/unsub__;!!FbZ0ZwI3Qg!qc0xbL3QBz_illnPIJoeHb6mGA1kBLndLjrGDjlfDwR7rkQcM8i7ZTte5y_GL4XNQru-
> > > > qSvIV3p_DxpS6tCIADJRjJc$>
> > > > > > [alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com> ]
> > > > > >       -=-=-=-=-=-=-=-=-=-=-=-
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > > INTERNAL - NI CONFIDENTIAL
> > >
> > > INTERNAL - NI CONFIDENTIAL
>
> INTERNAL - NI CONFIDENTIAL

