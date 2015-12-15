Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id ECD9060761
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 14:42:12 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id y187so6542107vka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 06:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=0dLlm1ManpuAk/8bGmgKTT/XtkxFzVKSZWfUd+h9g50=;
	b=GIGEZLGKjZ1yk9kKy8zOtDeqCDkbbKNaWYbzSWWKWHYVIzhopaC58TUovKBJqizh+K
	PJQKeLd6LhGMge1Mr8YglyobtCgmXiDgSBK9T2ZZkM2Y+i/VeswQbgLrCHg4kmPkvBHv
	YVcxqEchfCPdI37GGK+o0xuF6REDYImo0k+sbLLj3bDevDDg3T+6MMOlBZewuoNgdXog
	Sv7thjYJ+wWCLk4AemQVewfYTzeUjjm2EjbBAFYaV+nSixQoQQH2yIRxt8D0xAmOJWom
	f6M3njmwHkVqM4am5NBzHxHS07Slk3HcaKC/nurvea1ujXGfLE5t5PuIqKiWrTj0anhW
	VtRA==
MIME-Version: 1.0
X-Received: by 10.31.174.142 with SMTP id x136mr29071715vke.11.1450190532697; 
	Tue, 15 Dec 2015 06:42:12 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Tue, 15 Dec 2015 06:42:12 -0800 (PST)
In-Reply-To: <20151215140434.75233de0@centos-7>
References: <1449401194-31567-1-git-send-email-paul.barker@commagility.com>
	<20151215140434.75233de0@centos-7>
Date: Tue, 15 Dec 2015 09:42:12 -0500
Message-ID: <CADkTA4MKnxfCMYADGCpkYmp3mOmf+T7dVeU9YjxnkcneYGMg9Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Barker <paul.barker@commagility.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] module.bbclass: Fix potential do_compile/do_make_scripts race condition
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
X-List-Received-Date: Tue, 15 Dec 2015 14:42:13 -0000
Content-Type: multipart/alternative; boundary=001a11438eb28ee5190526f0cb9d

--001a11438eb28ee5190526f0cb9d
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 9:04 AM, Paul Barker <paul.barker@commagility.com>
wrote:

> On Sun, 6 Dec 2015 11:26:33 +0000
> Paul Barker <paul.barker@commagility.com> wrote:
>
> > I ran into a race condition building multiple external modules against a
> 3.10.y
> > series kernel using the dylan branch of OpenEmbedded. This is difficult
> to
> > reproduce as it requires very specific timing: the do_make_scripts task
> for one
> > module was linking the modpost script whilst the do_compile task for
> another
> > module was attempting to use the modpost script. This resulted in a
> permission
> > error:
> >
> > ERROR: Function failed: do_compile (see
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434
> for further information)
> > ERROR: Logfile of failure stored in:
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434
> > Log data follows:
> > | DEBUG: Executing shell function do_compile
> > | make -C
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel
> M=$PWD clean
> > | make[1]: Entering directory
> `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make[1]: Leaving directory
> `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make -C
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel
> M=$PWD modules
> > | make[1]: Entering directory
> `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > |   CC [M]
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/git/ti/runtime/hplib/module/hplibmod.o
> > |   Building modules, stage 2.
> > |   MODPOST 1 modules
> > | /bin/sh: scripts/mod/modpost: Permission denied
> > | make[2]: *** [__modpost] Error 126
> > | make[1]: *** [modules] Error 2
> > | make[1]: Leaving directory
> `/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel'
> > | make: *** [default] Error 2
> > | ERROR: Function failed: do_compile (see
> /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434
> for further information)
> > ERROR: Task 1284
> (/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-bsp/meta-mcsdk/meta-arago-extras/recipes-bsp/ti-hplib/
> ti-hplib-mod_git.bb, do_compile) failed with exit code '1'
> >
> > Later kernel versions do not rebuild the modpost script every time that
> 'make
> > scripts' is invoked so they should be safe from this particular failure.
> However
> > I'm not convinced that running 'make scripts' whilst also building an
> > out-of-tree module is always safe on later kernels and there is always
> the
> > potential for vendor kernels to have different behaviour here.
> >
> > Although this was seen on the dylan branch the behaviour of master and
> jethro
> > looks to be the same here - do_make_scripts is locked so that only one
> instance
> > of it may run at one time but there is nothing to prevent one instance of
> > do_make_scripts running at the same time as an instance of do_compile.
> >
> > The patch I'm sending attempts to solve this issue by locking the
> do_compile
> > task with the same lockfile as the do_make_scripts task in
> module.bbclass so
> > that an instance of do_copile can't run at the same time as an instance
> of
> > do_make_scripts. I don't know enough about the task locking to guarantee
> that
> > this is the right solution or to be able to test that it works as
> expected so
> > I'm marking the patch as an RFC.
> >
> > Please let me know if this is the right approach and if there is any
> easy way to
> > test this.
> >
> > Paul Barker (1):
> >   module.bbclass: Fix potential do_compile/do_make_scripts race
> >     condition
> >
> >  meta/classes/module.bbclass | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
>
> ping on this.
>

Sorry. I was traveling when this landed .. made a mental note .. and then
never
looped around.


>
> I've just got bitten by this again so it's not a one-off. Is anyone able to
> give me some feedback on the patch, whether this is the right approach to
> fix
> the problem and whether this is applicable to jethro/master.
>

The approach makes sense to me, and it was what I was considering for
generating
symbols after do_compile_modules. As long as it isn't serializing a huge
part of
the build, the impacts are even measurable.

So this change looks sane to me.

Bruce




>
> Thanks,
>
> --
> Paul Barker
> CommAgility Ltd
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11438eb28ee5190526f0cb9d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Dec 15, 2015 at 9:04 AM, Paul Barker <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:paul.barker@commagility.com" target=3D"_blank">paul.barker@co=
mmagility.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
class=3D"HOEnZb"><div class=3D"h5">On Sun, 6 Dec 2015 11:26:33 +0000<br>
Paul Barker &lt;<a href=3D"mailto:paul.barker@commagility.com">paul.barker@=
commagility.com</a>&gt; wrote:<br>
<br>
&gt; I ran into a race condition building multiple external modules against=
 a 3.10.y<br>
&gt; series kernel using the dylan branch of OpenEmbedded. This is difficul=
t to<br>
&gt; reproduce as it requires very specific timing: the do_make_scripts tas=
k for one<br>
&gt; module was linking the modpost script whilst the do_compile task for a=
nother<br>
&gt; module was attempting to use the modpost script. This resulted in a pe=
rmission<br>
&gt; error:<br>
&gt;<br>
&gt; ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barker/=
linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi=
/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further informa=
tion)<br>
&gt; ERROR: Logfile of failure stored in: /home/COMMAGILITY/paul.barker/lin=
ux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti=
-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_compile<br>
&gt; | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-=
bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=3D$PWD clean<br>
&gt; | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp=
/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel&#39;<b=
r>
&gt; | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/=
work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel&#39;<br=
>
&gt; | make -C /home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/ca-linux-=
bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel M=3D$PWD modules<br>
&gt; | make[1]: Entering directory `/home/COMMAGILITY/paul.barker/linux-bsp=
/work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel&#39;<b=
r>
&gt; |=C2=A0 =C2=A0CC [M]=C2=A0 /home/COMMAGILITY/paul.barker/linux-bsp/wor=
k-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnueabi/ti-hplib-mod=
/01.01.00.04-r3d/git/ti/runtime/hplib/module/hplibmod.o<br>
&gt; |=C2=A0 =C2=A0Building modules, stage 2.<br>
&gt; |=C2=A0 =C2=A0MODPOST 1 modules<br>
&gt; | /bin/sh: scripts/mod/modpost: Permission denied<br>
&gt; | make[2]: *** [__modpost] Error 126<br>
&gt; | make[1]: *** [modules] Error 2<br>
&gt; | make[1]: Leaving directory `/home/COMMAGILITY/paul.barker/linux-bsp/=
work-1.0.1/ca-linux-bsp/build/tmp/sysroots/amc-d24a4/usr/src/kernel&#39;<br=
>
&gt; | make: *** [default] Error 2<br>
&gt; | ERROR: Function failed: do_compile (see /home/COMMAGILITY/paul.barke=
r/linux-bsp/work-1.0.1/ca-linux-bsp/build/tmp/work/amc_d24a4-oe-linux-gnuea=
bi/ti-hplib-mod/01.01.00.04-r3d/temp/log.do_compile.25434 for further infor=
mation)<br>
&gt; ERROR: Task 1284 (/home/COMMAGILITY/paul.barker/linux-bsp/work-1.0.1/c=
a-linux-bsp/meta-mcsdk/meta-arago-extras/recipes-bsp/ti-hplib/<a href=3D"ht=
tp://ti-hplib-mod_git.bb" rel=3D"noreferrer" target=3D"_blank">ti-hplib-mod=
_git.bb</a>, do_compile) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt; Later kernel versions do not rebuild the modpost script every time tha=
t &#39;make<br>
&gt; scripts&#39; is invoked so they should be safe from this particular fa=
ilure. However<br>
&gt; I&#39;m not convinced that running &#39;make scripts&#39; whilst also =
building an<br>
&gt; out-of-tree module is always safe on later kernels and there is always=
 the<br>
&gt; potential for vendor kernels to have different behaviour here.<br>
&gt;<br>
&gt; Although this was seen on the dylan branch the behaviour of master and=
 jethro<br>
&gt; looks to be the same here - do_make_scripts is locked so that only one=
 instance<br>
&gt; of it may run at one time but there is nothing to prevent one instance=
 of<br>
&gt; do_make_scripts running at the same time as an instance of do_compile.=
<br>
&gt;<br>
&gt; The patch I&#39;m sending attempts to solve this issue by locking the =
do_compile<br>
&gt; task with the same lockfile as the do_make_scripts task in module.bbcl=
ass so<br>
&gt; that an instance of do_copile can&#39;t run at the same time as an ins=
tance of<br>
&gt; do_make_scripts. I don&#39;t know enough about the task locking to gua=
rantee that<br>
&gt; this is the right solution or to be able to test that it works as expe=
cted so<br>
&gt; I&#39;m marking the patch as an RFC.<br>
&gt;<br>
&gt; Please let me know if this is the right approach and if there is any e=
asy way to<br>
&gt; test this.<br>
&gt;<br>
&gt; Paul Barker (1):<br>
&gt;=C2=A0 =C2=A0module.bbclass: Fix potential do_compile/do_make_scripts r=
ace<br>
&gt;=C2=A0 =C2=A0 =C2=A0condition<br>
&gt;<br>
&gt;=C2=A0 meta/classes/module.bbclass | 4 ++++<br>
&gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt;<br>
<br>
</div></div>ping on this.<br></blockquote><div><br></div><div>Sorry. I was =
traveling when this landed .. made a mental note .. and then never<br></div=
><div>looped around.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
<br>
I&#39;ve just got bitten by this again so it&#39;s not a one-off. Is anyone=
 able to<br>
give me some feedback on the patch, whether this is the right approach to f=
ix<br>
the problem and whether this is applicable to jethro/master.<br></blockquot=
e><div><br></div><div>The approach makes sense to me, and it was what I was=
 considering for generating<br></div><div>symbols after do_compile_modules.=
 As long as it isn&#39;t serializing a huge part of<br></div><div>the build=
, the impacts are even measurable.<br><br></div><div>So this change looks s=
ane to me.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><div><br>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
CommAgility Ltd<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11438eb28ee5190526f0cb9d--
