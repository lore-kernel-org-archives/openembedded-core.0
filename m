Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188D1CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:50:41 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.15915.1760709032638971443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 06:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eEe7oOrd;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece1102998so1525296f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760709031; x=1761313831; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KF1/GcZ10xDYlboaB5vxyb5MDISAvAZO10z428ERDLM=;
        b=eEe7oOrdSgI5A6RAuK1/WHusv4v/m/xDSMrDYaOKWbye9AfYxXRyDTXB23njyHqJlT
         BvwbAnOp3N85xqcHZCnkjDp2tspQ+i3ylOQ3QXn2hYBvugIHk4HVA+qp0oUedmiSa5xR
         dhbMfmiaC4GfexMpJU7w02heOfxR6tKz9mtZyBJfEqU+/6OwxRKx9aIDCxHDug4Nn7sI
         efoDq7LY8M1SWlhVRE79N6nv/nzHtCNG5Ecu/8uLZh9vcMpMEnnRZiQse657conDvrFR
         fBatZGS7Q5OE3jUdhTsymn9za8O0dRPSZysly1uin3PdEispwgJHhd18afl+AruUn8eR
         XTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760709031; x=1761313831;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KF1/GcZ10xDYlboaB5vxyb5MDISAvAZO10z428ERDLM=;
        b=dhasJIlvnNRvk3tnZ+OTHilFdUVtnALbeHb8bL+o1lY3YrBpdcqbmRn/tlicmwh6Wt
         kztmZEmRnc+B1fab2Z6lItyjaOdIhFWL/IgzoHpuFo9gn/YSz/S5ZevBtNkTCJ9cnWRS
         n3nXSZ+GRhPaGkbEhCT9u430PUJNzf72NmIcQtadEEVUKZYYkLemJNBSUuyRjC0PzRgw
         JPKmbj8nV+o43i9mFBtQU8HhleujpHQLxA9uOfopLpg+i6RiTUcOq5PxSHAD8t+c+5ja
         sL3r026EcClXZXb+xK4NDZGZznppCV+XHtbIkRtvdhRG1e2b9/f3hKYQW8Q+sIdUm8va
         s7gg==
X-Gm-Message-State: AOJu0YzTP8nqIr5bxh7PB11OeyRz1iFOV4RFhQmr93dnY5GNZf2B/R7O
	1hhPN5yaILLrXc60HDJCxY9HAUzaFSwpCQpl4oQQhRZ58vUlRLRFEYQx5zOVQl747zRGNkFBAdD
	x6qHrslsCHtwSktSUV5LqSKePAjpq6Zk=
X-Gm-Gg: ASbGncsA6YvoNDu0O2p4Bie3zThjMp0LU5a46ioNnO5pspwkIu1IjAjjGB15kcWN45D
	rhgc7HKT6nOObdzLNsPzr+TlKHxw9hQ9A2CYxbgBerBnpRlp7cs9PaHx99lE7tmTm5tAaDiirNE
	VkoYfBRhv55UgqANCoyopZBJ3ZGVqgTJCAIGGCCzvfIT0FAwpvPL5IuzM5iKrNOIaEh+PmtNRWq
	OFuhoNRLtbbLcAOh4+nZPP+l2Z2ZDaGoeXeCSMqxlm4/4HDZX482o4YPE9N2w==
X-Google-Smtp-Source: AGHT+IGFv5QH+KSV7iQng+D7lrwmlAqWVr0d93XxzGNeXb/gvsAakV0TX9agbKERIlUaFc6mawVn2ZFKmFhuK7GbCbg=
X-Received: by 2002:a5d:5f46:0:b0:3ec:db87:e5f4 with SMTP id
 ffacd0b85a97d-42704d83588mr2334294f8f.7.1760709030591; Fri, 17 Oct 2025
 06:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251017014123.222073-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20251017014123.222073-1-johannes.schneider@leica-geosystems.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
Date: Fri, 17 Oct 2025 15:50:19 +0200
X-Gm-Features: AS18NWDJD117pjTTqaBewD395HNqPWqvVCDuEQe1q1k490y1XAwzG3f3Fal6nSA
Message-ID: <CAB3asfgzoso8pBB-0YBxr8q008h8qT1m9vvBsB-fJ-_Bwe3d2w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1] devtool: un-/deploy-target: put deploylist
 into destdir
To: johannes.schneider@leica-geosystems.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, saul.Wold@windriver.com, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: multipart/alternative; boundary="0000000000005241d506415b04eb"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:50:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225023

--0000000000005241d506415b04eb
Content-Type: text/plain; charset="UTF-8"

Hi Johannes

Thank you for the patch. I agree, we should do what you are suggesting. I
will test and think about some details during the next few days.
This is just a quick response written on my smartphone.

Johannes Schneider via lists.openembedded.org <johannes.schneider=
leica-geosystems.com@lists.openembedded.org> schrieb am Fr., 17. Okt. 2025,
03:41:

> When deploying on devices with a RO root-filesystem, devtool would
> fail on writing to the hard-coded "deploylist_path = '/.devtool'"
>
> Since devtool already supports deploying to a different root-prefix
> with: hostname[:destdir], we can make use of this guaranteed RW
> location to place the deployment-list there.
>
> Add the destdir parameter to the _prepare_remote_script function, to
> construct the deploylist_path from it. For the 'undeploy' the same
> host:destdir splitting logic is used as in 'deploy'.
>
> Now it is possible to modify and build a recipe 'foo-bar' with
> devtool, and have its ./image content deployed through:
> $build> devtool deploy foo-bar target:/opt/development-overlay
> Or removed again with:
> $build> devtool undeploy foo-bar target:/opt/development-overlay
>
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com
> >
> ---
>  scripts/lib/devtool/deploy.py | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
> index b5ca8f2c2f..a98b33c571 100644
> --- a/scripts/lib/devtool/deploy.py
> +++ b/scripts/lib/devtool/deploy.py
> @@ -20,9 +20,9 @@ from devtool import exec_fakeroot_no_d, setup_tinfoil,
> check_workspace_recipe, D
>
>  logger = logging.getLogger('devtool')
>
> -deploylist_path = '/.devtool'
> +deploylist_dirname = '.devtool'
>
> -def _prepare_remote_script(deploy, verbose=False, dryrun=False,
> undeployall=False, nopreserve=False, nocheckspace=False):
> +def _prepare_remote_script(deploy, destdir='/', verbose=False,
> dryrun=False, undeployall=False, nopreserve=False, nocheckspace=False):
>      """
>      Prepare a shell script for running on the target to
>      deploy/undeploy files. We have to be careful what we put in this
> @@ -31,6 +31,7 @@ def _prepare_remote_script(deploy, verbose=False,
> dryrun=False, undeployall=Fals
>      busybox rather than bash with coreutils).
>      """
>      lines = []
> +    deploylist_path = os.path.join(destdir, deploylist_dirname)
>      lines.append('#!/bin/sh')
>      lines.append('set -e')
>      if undeployall:
> @@ -146,7 +147,7 @@ def deploy(args, config, basepath, workspace):
>          except Exception as e:
>              raise DevtoolError('Exception parsing recipe %s: %s' %
>                              (args.recipename, e))
> -
> +
>          srcdir = rd.getVar('D')
>          workdir = rd.getVar('WORKDIR')
>          path = rd.getVar('PATH')
> @@ -244,6 +245,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd,
> libdir, base_libdir, max_proce
>          tmpscript = '/tmp/devtool_deploy.sh'
>          tmpfilelist = os.path.join(os.path.dirname(tmpscript),
> 'devtool_deploy.list')
>          shellscript = _prepare_remote_script(deploy=True,
> +                                            destdir=destdir,
>                                              verbose=args.show_status,
>                                              nopreserve=args.no_preserve,
>
>  nocheckspace=args.no_check_space)
> @@ -303,12 +305,19 @@ def undeploy(args, config, basepath, workspace):
>          scp_port = "-P %s" % args.port
>          ssh_port = "-p %s" % args.port
>
> -    args.target = args.target.split(':')[0]
> +    try:
> +        host, destdir = args.target.split(':')
> +    except ValueError:
> +        destdir = '/'
> +    else:
> +        args.target = host
>
Just dropping the directory was probably not the best idea, I agree. But
does it make sense to drop it only in the else case? Is it properly defined
if there is a ValueError?

Or would it be better to not alter the args.target and fix all the code
which uses args.target to handle the directory part properly?

Regards,
Adrian

+    if not destdir.endswith('/'):
> +        destdir += '/'
>
>      tmpdir = tempfile.mkdtemp(prefix='devtool')
>      try:
>          tmpscript = '/tmp/devtool_undeploy.sh'
> -        shellscript = _prepare_remote_script(deploy=False,
> dryrun=args.dry_run, undeployall=args.all)
> +        shellscript = _prepare_remote_script(deploy=False,
> destdir=destdir, dryrun=args.dry_run, undeployall=args.all)
>          # Write out the script to a file
>          with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w')
> as f:
>              f.write(shellscript)
>
> base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
> --
> 2.43.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224987):
> https://lists.openembedded.org/g/openembedded-core/message/224987
> Mute This Topic: https://lists.openembedded.org/mt/115801291/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> adrian.freihofer@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005241d506415b04eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Johannes</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Thank you for the patch. I agree, we should do what you are sugg=
esting. I will test and think about some details during the next few days.<=
/div><div dir=3D"auto">This is just a quick response written on my smartpho=
ne.<br><br><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><d=
iv dir=3D"ltr" class=3D"gmail_attr">Johannes Schneider via <a href=3D"http:=
//lists.openembedded.org">lists.openembedded.org</a> &lt;johannes.schneider=
=3D<a href=3D"mailto:leica-geosystems.com@lists.openembedded.org">leica-geo=
systems.com@lists.openembedded.org</a>&gt; schrieb am Fr., 17. Okt. 2025, 0=
3:41:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex">When deploying on devices wit=
h a RO root-filesystem, devtool would<br>
fail on writing to the hard-coded &quot;deploylist_path =3D &#39;/.devtool&=
#39;&quot;<br>
<br>
Since devtool already supports deploying to a different root-prefix<br>
with: hostname[:destdir], we can make use of this guaranteed RW<br>
location to place the deployment-list there.<br>
<br>
Add the destdir parameter to the _prepare_remote_script function, to<br>
construct the deploylist_path from it. For the &#39;undeploy&#39; the same<=
br>
host:destdir splitting logic is used as in &#39;deploy&#39;.<br>
<br>
Now it is possible to modify and build a recipe &#39;foo-bar&#39; with<br>
devtool, and have its ./image content deployed through:<br>
$build&gt; devtool deploy foo-bar target:/opt/development-overlay<br>
Or removed again with:<br>
$build&gt; devtool undeploy foo-bar target:/opt/development-overlay<br>
<br>
Signed-off-by: Johannes Schneider &lt;<a href=3D"mailto:johannes.schneider@=
leica-geosystems.com" target=3D"_blank" rel=3D"noreferrer">johannes.schneid=
er@leica-geosystems.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/devtool/deploy.py | 19 ++++++++++++++-----<br>
=C2=A01 file changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py<=
br>
index b5ca8f2c2f..a98b33c571 100644<br>
--- a/scripts/lib/devtool/deploy.py<br>
+++ b/scripts/lib/devtool/deploy.py<br>
@@ -20,9 +20,9 @@ from devtool import exec_fakeroot_no_d, setup_tinfoil, ch=
eck_workspace_recipe, D<br>
<br>
=C2=A0logger =3D logging.getLogger(&#39;devtool&#39;)<br>
<br>
-deploylist_path =3D &#39;/.devtool&#39;<br>
+deploylist_dirname =3D &#39;.devtool&#39;<br>
<br>
-def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse, undepl=
oyall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):<br>
+def _prepare_remote_script(deploy, destdir=3D&#39;/&#39;, verbose=3DFalse,=
 dryrun=3DFalse, undeployall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFa=
lse):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Prepare a shell script for running on the target to<br>
=C2=A0 =C2=A0 =C2=A0deploy/undeploy files. We have to be careful what we pu=
t in this<br>
@@ -31,6 +31,7 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dryru=
n=3DFalse, undeployall=3DFals<br>
=C2=A0 =C2=A0 =C2=A0busybox rather than bash with coreutils).<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0lines =3D []<br>
+=C2=A0 =C2=A0 deploylist_path =3D os.path.join(destdir, deploylist_dirname=
)<br>
=C2=A0 =C2=A0 =C2=A0lines.append(&#39;#!/bin/sh&#39;)<br>
=C2=A0 =C2=A0 =C2=A0lines.append(&#39;set -e&#39;)<br>
=C2=A0 =C2=A0 =C2=A0if undeployall:<br>
@@ -146,7 +147,7 @@ def deploy(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0except Exception as e:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise DevtoolError(&#39;Exc=
eption parsing recipe %s: %s&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(args.recipename, e))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcdir =3D rd.getVar(&#39;D&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D rd.getVar(&#39;WORKDIR&#39;)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0path =3D rd.getVar(&#39;PATH&#39;)<br>
@@ -244,6 +245,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdi=
r, base_libdir, max_proce<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpscript =3D &#39;/tmp/devtool_deploy.sh=
&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpfilelist =3D os.path.join(os.path.dirn=
ame(tmpscript), &#39;devtool_deploy.list&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shellscript =3D _prepare_remote_script(de=
ploy=3DTrue,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 destdir=3Ddestdir,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0verbose=3Dargs.show_status,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0nopreserve=3Dargs.no_preserve,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0nocheckspace=3Dargs.no_check_space)<br>
@@ -303,12 +305,19 @@ def undeploy(args, config, basepath, workspace):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scp_port =3D &quot;-P %s&quot; % args.por=
t<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ssh_port =3D &quot;-p %s&quot; % args.por=
t<br>
<br>
-=C2=A0 =C2=A0 args.target =3D args.target.split(&#39;:&#39;)[0]<br>
+=C2=A0 =C2=A0 try:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 host, destdir =3D args.target.split(&#39;:&#39=
;)<br>
+=C2=A0 =C2=A0 except ValueError:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir =3D &#39;/&#39;<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 args.target =3D host<br></blockquote></div></d=
iv><div dir=3D"auto">Just dropping the directory was probably not the best =
idea, I agree. But does it make sense to drop it only in the else case? Is =
it properly defined if there is a ValueError?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Or would it be better to not alter the args.target an=
d fix all the code which uses args.target to handle the directory part prop=
erly?</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><div=
 dir=3D"auto">Adrian</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
+=C2=A0 =C2=A0 if not destdir.endswith(&#39;/&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 destdir +=3D &#39;/&#39;<br>
<br>
=C2=A0 =C2=A0 =C2=A0tmpdir =3D tempfile.mkdtemp(prefix=3D&#39;devtool&#39;)=
<br>
=C2=A0 =C2=A0 =C2=A0try:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmpscript =3D &#39;/tmp/devtool_undeploy.=
sh&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 shellscript =3D _prepare_remote_script(deploy=
=3DFalse, dryrun=3Dargs.dry_run, undeployall=3Dargs.all)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 shellscript =3D _prepare_remote_script(deploy=
=3DFalse, destdir=3Ddestdir, dryrun=3Dargs.dry_run, undeployall=3Dargs.all)=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Write out the script to a file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with open(os.path.join(tmpdir, os.path.ba=
sename(tmpscript)), &#39;w&#39;) as f:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f.write(shellscript)<br>
<br>
base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#224987): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/224987" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/224987</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/115801291/445=
4582" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/115801291/4454582</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:adrian.freihofe=
r@gmail.com" target=3D"_blank" rel=3D"noreferrer">adrian.freihofer@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000005241d506415b04eb--

