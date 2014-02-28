Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id D2BC36F48A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 21:27:11 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gf5so3067663lab.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 13:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=0kujZMvNzGxWYmWsYcn75gfKmnUYfz81DJeP9fLkoNc=;
	b=F/fEaij7rAxiQxqLMFki5L8lpWttONElr8EqT8kZwuRSF2UZRlt6l81JIeztcBMWQt
	FE4nlAIEXm0lKESRSf0iBdCNx0RxrYcsc9gTzAjbEj+gT7dOmebb97hjm57wdjdA8p5c
	xWA57eIBbaBYIkl+rmRu5sHsWjafFWqobCWg+NP1rapf6aluu+7az9eMr631KU6iRME3
	5tgyWRXwGYepASTLimwf78OogBfGePPkMal+weyFVGldjxdV0ojBNL5DRcqVLoQ/O4M0
	1EEn/kxNtw3sTxRgh0blIYg43nBmKJ7PFxAGTMqANPYWYFLqb7bF8bgDquh5G1bd29qk
	S77Q==
X-Received: by 10.112.138.10 with SMTP id qm10mr12007389lbb.19.1393622831386; 
	Fri, 28 Feb 2014 13:27:11 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Fri, 28 Feb 2014 13:26:51 -0800 (PST)
In-Reply-To: <98dd26f3-a46a-451d-a445-93e8b1862377@VA3EHSMHS040.ehs.local>
References: <98dd26f3-a46a-451d-a445-93e8b1862377@VA3EHSMHS040.ehs.local>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 28 Feb 2014 14:26:51 -0700
X-Google-Sender-Auth: KbR_7BbjmHX3VdAinIQifJnRWVM
Message-ID: <CABcZANnN0QknvdHZBpWDwD1G_fpEByCFxNWZm+VSyRHpf11pgQ@mail.gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto.bbclass: Force do_diffconfig depends to ${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Feb 2014 21:27:14 -0000
Content-Type: multipart/alternative; boundary=089e011615a0d0d5ba04f37e1937

--089e011615a0d0d5ba04f37e1937
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 20, 2014 at 10:37 PM, Nathan Rossi <nathan.rossi@xilinx.com>wrote:

> Commit 07e59b5ff659bde6e6a60c4781c0a2deb406c667 added the task
> dependency of 'virtual/kernel:do_kernel_configme' for the do_diffconfig
> task. This dependency is only valid for linux recipes that inherit
> kernel-yocto (e.g. linux-yocto), however due to virtual/kernel being a
> virtual dependency it may not be providing a kernel which inherits
> kernel-yocto in which case the do_kernel_configme task might not exist.
>
> In the case where virtual/kernel is provided by a non kernel-yocto
> recipe an error is thrown in relation to the dependency, e.g.
>
>         ERROR: Task do_diffconfig in linux-yocto-tiny_3.8.bb depends
>         upon non-existent task do_kernel_configme in linux.bb
>
> Changing the dependency to use '${PN}:do_kernel_configme' forces the
> dependency to only depend on the recipe which inherits
> kernel-yocto.bbclass.
>
> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>

It looks like any machine which has a kernel-yocto recipe parsed and not
skipped, but whose virtual/kernel is not kernel-yocto, will see this. The
beagleboard machine gets build breaks due to this, for example, if you
include both meta-yocto-bsp and meta-ti in your BBLAYERS.

This is a little weird, both the original implementation and this patch. We
already have an API for adding internal inter-task dependencies, it's
called 'addtask' ;) That said, I think I can see the intent, but there are
a couple of alternatives, and I really don't like either this or the
original version, personally.

I'm guessing that the idea was to add a dependency from diffconfig to
kernel_configme whether or not diffconfig even exists, in order to be able
to support a use case where kernel-yocto is inherited but cml1 is not, but
I'd question the validity of such a use case, personally. I think either we
should consider one of these options:

    1) Programmatically add the dependency with bb.build.addtask based on
the availability of do_diffconfig
    2) Use addtask to express the dependency in linux-yocto.inc, where
do_kernel_configme gets added as a task. Having do_diffconfig depend on
do_kernel_configme for a recipe that doesn't include linux-yocto.inc would
result in breakage anyway unless they explicitly addtask do_kernel_configme
in that recipe.

Thoughts?

Does anyone know if the intent was that kernel-yocto.bbclass would be
useful without cml1?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e011615a0d0d5ba04f37e1937
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Feb 20, 2014 at 10:37 PM, Nathan Rossi <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:nathan.rossi@xilinx.com" target=3D"_blank">nathan.rossi@xilinx.=
com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div style=3D"overflow:hidden">Commit 07e59b=
5ff659bde6e6a60c4781c0a2deb406c667 added the task<br>
dependency of &#39;virtual/kernel:do_kernel_configme&#39; for the do_diffco=
nfig<br>
task. This dependency is only valid for linux recipes that inherit<br>
kernel-yocto (e.g. linux-yocto), however due to virtual/kernel being a<br>
virtual dependency it may not be providing a kernel which inherits<br>
kernel-yocto in which case the do_kernel_configme task might not exist.<br>
<br>
In the case where virtual/kernel is provided by a non kernel-yocto<br>
recipe an error is thrown in relation to the dependency, e.g.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ERROR: Task do_diffconfig in <a href=3D"http://=
linux-yocto-tiny_3.8.bb" target=3D"_blank">linux-yocto-tiny_3.8.bb</a> depe=
nds<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 upon non-existent task do_kernel_configme in <a=
 href=3D"http://linux.bb" target=3D"_blank">linux.bb</a><br>
<br>
Changing the dependency to use &#39;${PN}:do_kernel_configme&#39; forces th=
e<br>
dependency to only depend on the recipe which inherits<br>
kernel-yocto.bbclass.<br>
<br>
Signed-off-by: Nathan Rossi &lt;<a href=3D"mailto:nathan.rossi@xilinx.com" =
target=3D"_blank">nathan.rossi@xilinx.com</a>&gt;</div></blockquote><div><b=
r></div><div>It looks like any machine which has a kernel-yocto recipe pars=
ed and not skipped, but whose virtual/kernel is not kernel-yocto, will see =
this. The beagleboard machine gets build breaks due to this, for example, i=
f you include both meta-yocto-bsp and meta-ti in your BBLAYERS.<br>

</div></div><br></div><div class=3D"gmail_extra">This is a little weird, bo=
th the original implementation and this patch. We already have an API for a=
dding internal inter-task dependencies, it&#39;s called &#39;addtask&#39; ;=
) That said, I think I can see the intent, but there are a couple of altern=
atives, and I really don&#39;t like either this or the original version, pe=
rsonally.<br>


<br>I&#39;m guessing that the idea was to add a dependency from diffconfig =
to kernel_configme whether or not diffconfig even exists, in order to be ab=
le to support a use case where kernel-yocto is inherited but cml1 is not, b=
ut I&#39;d question the validity of such a use case, personally. I think ei=
ther we should consider one of these options:<br>

<br>=C2=A0=C2=A0=C2=A0 1) Programmatically add the dependency with bb.build=
.addtask based on the availability of do_diffconfig<br>=C2=A0=C2=A0=C2=A0 2=
) Use addtask to express the dependency in linux-yocto.inc, where do_kernel=
_configme gets added as a task. Having do_diffconfig depend on do_kernel_co=
nfigme for a recipe that doesn&#39;t include linux-yocto.inc would result i=
n breakage anyway unless they explicitly addtask do_kernel_configme in that=
 recipe.<br>

<br></div><div class=3D"gmail_extra">Thoughts?<br></div><div class=3D"gmail=
_extra">
<br></div><div class=3D"gmail_extra">Does anyone know if the intent was tha=
t kernel-yocto.bbclass would be useful without cml1?<br></div><div class=3D=
"gmail_extra">-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>


Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics
</div></div>

--089e011615a0d0d5ba04f37e1937--
