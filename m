Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADC071E15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 18:32:36 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id c4so6737756wrd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 10:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nnKg3QKC56hxAfeIr5q1rqQ3tjSpGVpGHAW2VocydNs=;
	b=JJ/8rkygLI0YsWVR9Iaq4FUlGX0pvTDRLpABCb8NjWrPBqmaFa5wiK1lGmAFf0QrXe
	fu7KTHGuIy/2OnUIGO9vcYAQqGeR/UykqqgWw5FRCbqhOCG55m9B0G38dAot1PeP87cF
	YoT6HTn3bnuSljhmBb2uyJSYFFR6wxLAWjoC4E+dpS8SnKbHZuX6H8+Jh5TtJ9qXsHVd
	J+zGumfllmbKbC9K2gzr+CM9DmdUSqkjyPgJzel4D9/HqXxJgsW8yF7xHNunLHs7j1lo
	iSBw8vixD2Vnd4wO/NAf1iOB03lRG7ddtxm1FVpJQuxchmTAWEeepk/I0mpkWloPSpKN
	HdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nnKg3QKC56hxAfeIr5q1rqQ3tjSpGVpGHAW2VocydNs=;
	b=RBv9fXqZRbPPPJnvJddR832ISjoqRksvNAuK9OG7N715LQ09rcWOL8+2wUwFuApU3y
	bK3MSlD+5gm3FlkvfZKmNUTc+ype8C3N7M9X6CnL6OYVc3lGBTotR9Y7G8fm0CZ57acy
	gceqMXa3x9+jPHnfOxsVbtFhES8EOH4oWtrx3gqqfxquoD5vaoHx7D5y+TQeyjHLGkfD
	meIWkCC2WJvuymIeVLfIqG5D70r6yR8/QvuPAhGUWBPnmNzC1G4m6TAE+Q2Q20TqkBkL
	FPzWzJscOXnK3ykdI8lOJ17JPxJfrevkasPjhaSVx6M9rwmIL3980z7BpINjNnygs0Y6
	htew==
X-Gm-Message-State: AMke39kdTfn5eHW5kqXrI1GjP6XwJP64w/ozlPAa+usL6+6cKjEjLk7IZ3HSes4GXDKQK7jDSzZIXxyLOGlZ1Q==
X-Received: by 10.223.154.100 with SMTP id z91mr6060274wrb.145.1487183556518; 
	Wed, 15 Feb 2017 10:32:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.148.174 with HTTP; Wed, 15 Feb 2017 10:32:35 -0800 (PST)
In-Reply-To: <6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 15 Feb 2017 19:32:35 +0100
Message-ID: <CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Wed, 15 Feb 2017 18:32:38 -0000
Content-Type: multipart/alternative; boundary=f403045f4e609a2daf054895e7c9

--f403045f4e609a2daf054895e7c9
Content-Type: text/plain; charset=UTF-8

Are all changes necessary for this to work already in master?

Yesterday I've noticed that rm_work for some components which are early in
the dependency (like qtbase) are executed relatively late (together with
do_package_qa).

So I've tried very naive way to find out if the rm_work tasks are executed
sooner or not just by comparing Task IDs in build of the same image built
from scratch (without sstate) with Dizzy, Morty and current master.

First I've stripped unnecessary prefix and names of proprietary components
(in case someone wants me to share these lists):
grep "^NOTE: Running task .*, do_rm_work)$" log.build |sed
's#/jenkins/mjansa/build-[^/]*/##;
s#meta-lg-webos/[^:]*:#private-component:#g; s#^NOTE: Running task ##g' >
rm_work.tasks.dizzy

with slightly different regexp for morty and master:
grep "^NOTE: Running task .*:do_rm_work)$" ld.gold/log.m16p |sed
's#/jenkins/mjansa/build-[^/]*/##;
s#meta-lg-webos/[^:]*:#private-component:#g; s#^NOTE: Running task ##g' >
rm_work.tasks.morty

and then I did even more naive thing to compare average task id of rm-work
jobs with following results:
for i in rm_work.tasks.*; do echo $i; export COUNT=0 SUM=0; for
TASK in `cat $i | cut -f 1 -d\  `; do COUNT=`expr $COUNT + 1`; SUM=`expr
$SUM + $TASK`; done; echo "AVG = `expr $SUM / $C
OUNT`; COUNT = $COUNT"; done
rm_work.tasks.dizzy
AVG = 6429; COUNT = 764
rm_work.tasks.master
AVG = 7570; COUNT = 891
rm_work.tasks.master.qemux86
AVG = 5527; COUNT = 665
rm_work.tasks.morty
AVG = 6689; COUNT = 786
rm_work.tasks.morty.gold
AVG = 6764; COUNT = 786

rm_work.tasks.morty.gold is the same build as in rm_work.tasks.morty just
with ld-is-gold added to DISTRO_FEATUREs (as I was testing build time to
compare ld.bfd and ld.gold in our images).
rm_work.tasks.master.qemux86 is the same build as rm_work.tasks.master but
for qemux86, all other builds are for some ARM board we use

Then few interesting steps:

gcc-cross looks good (not available for dizzy build which is using external
toolchain)
$ grep gcc-cross_ rm_work.tasks.*
rm_work.tasks.master:510 of 14470
(oe-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
rm_work.tasks.master.qemux86:515 of 10296
(oe-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
rm_work.tasks.morty:2592 of 12021
(oe-core/meta/recipes-devtools/gcc/gcc-cross_6.2.bb:do_rm_work)
rm_work.tasks.morty.gold:2734 of 12021
(oe-core/meta/recipes-devtools/gcc/gcc-cross_6.2.bb:do_rm_work)

qtdeclarative-native got rm_work a bit later, whcih might be caused only by
the increased number of tasks thanks to RSS
$ grep native.*qtdeclarative rm_work.tasks.*
rm_work.tasks.dizzy:2101 of 11766 (ID: 11128,
virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb, do_rm_work)
rm_work.tasks.master:2614 of 14470
(virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.master.qemux86:2521 of 10296
(virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.morty:1513 of 12021
(virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.morty.gold:1514 of 12021
(virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)

and here is the target qtdeclarative which trigered this whole naive
analysis:
$ grep qtdeclarative rm_work.tasks.* | grep -v native
rm_work.tasks.dizzy:4952 of 11766 (ID: 6670, meta-qt5/recipes-qt/qt5/
qtdeclarative_git.bb, do_rm_work)
rm_work.tasks.master:4317 of 14470
(meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.master.qemux86:10142 of 10296
(meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.morty:6753 of 12021
(meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)
rm_work.tasks.morty.gold:6883 of 12021
(meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)

If we dismiss the strange case in rm_work.tasks.master.qemux86 then it
seems to perform at least as good as old completion BB_SCHEDULER.

But I wanted to ask if there is something else we can do or you were
planing to do, because IIRC you shared some longer analysis of what could
be improved here and I'm not sure if you managed to implement it all.

It feels to me that rm_work has high priority, but still it's "blocked" by
e.g. do_package_qa which gets executed late and then immediately followed
by rm_work.

in ideal case I would really like to have a switch which will force rm_work
to take absolute priority over other tasks, it doesn't take very long to
delete the files in tmpfs and would allow me to do tmpfs builds on builders
with smaller RAM.

The "state of bitbake world" builds are performed in 74G tmpfs (for whole
tmpdir-glibc) and yesterday's builds started to fail again (when it happens
to run chromium and chromium-wayland at the same time) - the manual
solution for this I'm using for last couple years is to build in "steps"
which force to run rm_work for all included components, so e.g.

bitbake gcc-cross-arm && bitbake small-image && bitbake chromium && bitbake
chromium-wayland && bitbake big-image && bitbake world

will keep the tmpfs usage peaks much lower than running just bitbake world

On Fri, Jan 6, 2017 at 10:55 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> Having do_rm_work depend on do_build had one major disadvantage:
> do_build depends on the do_build of other recipes, to ensure that
> runtime dependencies also get built. The effect is that when work on a
> recipe is complete and it could get cleaned up, do_rm_work still
> doesn't run because it waits for those other recipes, thus leading to
> more temporary disk space usage than really needed.
>
> The right solution is to inject do_rm_work before do_build and after
> all tasks of the recipe. Achieving that depends on the new bitbake
> support for prioritizing anonymous functions to ensure that
> rm_work.bbclass gets to see a full set of existing tasks when adding
> its own one. This is relevant, for example, for do_analyseimage in
> meta-security-isafw's isafw.bbclass.
>
> In addition, the new "rm_work" scheduler is used by default. It
> prioritizes finishing recipes over continuing with the more
> important recipes (with "importance" determined by the number of
> reverse-dependencies).
>
> Benchmarking (see "rm_work + pybootchart enhancements" on the OE-core
> mailing list) showed that builds with the modified rm_work.bbclass
> were both faster (albeit not by much) and required considerably less
> disk space (14230MiB instead of 18740MiB for core-image-sato).
> Interestingly enough, builds with rm_work.bbclass were also faster
> than those without.
>
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/classes/rm_work.bbclass | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
> index 3516c7e..1205104 100644
> --- a/meta/classes/rm_work.bbclass
> +++ b/meta/classes/rm_work.bbclass
> @@ -11,16 +11,13 @@
>  # RM_WORK_EXCLUDE += "icu-native icu busybox"
>  #
>
> -# Use the completion scheduler by default when rm_work is active
> +# Use the dedicated rm_work scheduler by default when rm_work is active
>  # to try and reduce disk usage
> -BB_SCHEDULER ?= "completion"
> +BB_SCHEDULER ?= "rm_work"
>
>  # Run the rm_work task in the idle scheduling class
>  BB_TASK_IONICE_LEVEL_task-rm_work = "3.0"
>
> -RMWORK_ORIG_TASK := "${BB_DEFAULT_TASK}"
> -BB_DEFAULT_TASK = "rm_work_all"
> -
>  do_rm_work () {
>      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
>      for p in ${RM_WORK_EXCLUDE}; do
> @@ -97,13 +94,6 @@ do_rm_work () {
>          rm -f $i
>      done
>  }
> -addtask rm_work after do_${RMWORK_ORIG_TASK}
> -
> -do_rm_work_all () {
> -    :
> -}
> -do_rm_work_all[recrdeptask] = "do_rm_work"
> -addtask rm_work_all after do_rm_work
>
>  do_populate_sdk[postfuncs] += "rm_work_populatesdk"
>  rm_work_populatesdk () {
> @@ -117,7 +107,7 @@ rm_work_rootfs () {
>  }
>  rm_work_rootfs[cleandirs] = "${WORKDIR}/rootfs"
>
> -python () {
> +python __anonymous_rm_work() {
>      if bb.data.inherits_class('kernel', d):
>          d.appendVar("RM_WORK_EXCLUDE", ' ' + d.getVar("PN"))
>      # If the recipe name is in the RM_WORK_EXCLUDE, skip the recipe.
> @@ -126,4 +116,19 @@ python () {
>      if pn in excludes:
>          d.delVarFlag('rm_work_rootfs', 'cleandirs')
>          d.delVarFlag('rm_work_populatesdk', 'cleandirs')
> +    else:
> +        # Inject do_rm_work into the tasks of the current recipe such
> that do_build
> +        # depends on it and that it runs after all other tasks that block
> do_build,
> +        # i.e. after all work on the current recipe is done. The reason
> for taking
> +        # this approach instead of making do_rm_work depend on do_build
> is that
> +        # do_build inherits additional runtime dependencies on
> +        # other recipes and thus will typically run much later than
> completion of
> +        # work in the recipe itself.
> +        deps = bb.build.preceedtask('do_build', True, d)
> +        if 'do_build' in deps:
> +            deps.remove('do_build')
> +        bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
>  }
> +# Higher priority than the normal 100, and thus we run after other
> +# classes like package_rpm.bbclass which also add custom tasks.
> +__anonymous_rm_work[__anonprio] = "1000"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--f403045f4e609a2daf054895e7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Are all changes necessary for this to work already in mast=
er?<div><br></div><div>Yesterday I&#39;ve noticed that rm_work for some com=
ponents which are early in the dependency (like qtbase) are executed relati=
vely late (together with do_package_qa).</div><div><br></div><div>So I&#39;=
ve tried very naive way to find out if the rm_work tasks are executed soone=
r or not just by comparing Task IDs in build of the same image built from s=
cratch (without sstate) with Dizzy, Morty and current master.</div><div><br=
></div><div>First I&#39;ve stripped unnecessary prefix and names of proprie=
tary components (in case someone wants me to share these lists):</div><div>=
grep &quot;^NOTE: Running task .*, do_rm_work)$&quot; log.build |sed &#39;s=
#/jenkins/mjansa/build-[^/]*/##; s#meta-lg-webos/[^:]*:#private-component:#=
g; s#^NOTE: Running task ##g&#39; &gt; rm_work.tasks.dizzy<br></div><div><b=
r></div><div>with slightly different regexp for morty and master:</div><div=
>grep &quot;^NOTE: Running task .*:do_rm_work)$&quot; ld.gold/log.m16p |sed=
 &#39;s#/jenkins/mjansa/build-[^/]*/##; s#meta-lg-webos/[^:]*:#private-comp=
onent:#g; s#^NOTE: Running task ##g&#39; &gt; rm_work.tasks.morty<br></div>=
<div><br></div><div>and then I did even more naive thing to compare average=
 task id of rm-work jobs with following results:</div><div><div>for i in rm=
_work.tasks.*; do echo $i; export COUNT=3D0 SUM=3D0; for=C2=A0</div><div>TA=
SK in `cat $i | cut -f 1 -d\ =C2=A0`; do COUNT=3D`expr $COUNT + 1`; SUM=3D`=
expr $SUM + $TASK`; done; echo &quot;AVG =3D `expr $SUM / $C</div><div>OUNT=
`; COUNT =3D $COUNT&quot;; done</div><div>rm_work.tasks.dizzy =C2=A0=C2=A0<=
/div><div>AVG =3D 6429; COUNT =3D 764</div><div>rm_work.tasks.master =C2=A0=
</div><div>AVG =3D 7570; COUNT =3D 891</div><div>rm_work.tasks.master.qemux=
86</div><div>AVG =3D 5527; COUNT =3D 665</div><div>rm_work.tasks.morty =C2=
=A0=C2=A0</div><div>AVG =3D 6689; COUNT =3D 786</div><div>rm_work.tasks.mor=
ty.gold</div><div>AVG =3D 6764; COUNT =3D 786</div></div><div><br></div><di=
v>rm_work.tasks.morty.gold is the same build as in rm_work.tasks.morty just=
 with ld-is-gold added to DISTRO_FEATUREs (as I was testing build time to c=
ompare ld.bfd and ld.gold in our images).<br></div><div>rm_work.tasks.maste=
r.qemux86 is the same build as rm_work.tasks.master but for qemux86, all ot=
her builds are for some ARM board we use<br></div><div><br></div><div>Then =
few interesting steps:</div><div><br></div><div>gcc-cross looks good (not a=
vailable for dizzy build which is using external toolchain)</div><div><div>=
$ grep gcc-cross_ rm_work.tasks.*</div><div>rm_work.tasks.master:510 of 144=
70 (oe-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)</div><di=
v>rm_work.tasks.master.qemux86:515 of 10296 (oe-core/meta/recipes-devtools/=
gcc/gcc-cross_6.3.bb:do_rm_work)</div><div>rm_work.tasks.morty:2592 of 1202=
1 (oe-core/meta/recipes-devtools/gcc/gcc-cross_6.2.bb:do_rm_work)</div><div=
>rm_work.tasks.morty.gold:2734 of 12021 (oe-core/meta/recipes-devtools/gcc/=
gcc-cross_6.2.bb:do_rm_work)</div></div><div><br></div><div>qtdeclarative-n=
ative got rm_work a bit later, whcih might be caused only by the increased =
number of tasks thanks to RSS</div><div><div>$ grep native.*qtdeclarative r=
m_work.tasks.*</div><div>rm_work.tasks.dizzy:2101 of 11766 (ID: 11128, virt=
ual:native:meta-qt5/recipes-qt/qt5/<a href=3D"http://qtdeclarative_git.bb">=
qtdeclarative_git.bb</a>, do_rm_work)</div><div>rm_work.tasks.master:2614 o=
f 14470 (virtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_=
work)</div><div>rm_work.tasks.master.qemux86:2521 of 10296 (virtual:native:=
meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)</div><div>rm_work.=
tasks.morty:1513 of 12021 (virtual:native:meta-qt5/recipes-qt/qt5/qtdeclara=
tive_git.bb:do_rm_work)</div><div>rm_work.tasks.morty.gold:1514 of 12021 (v=
irtual:native:meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)</div=
></div><div><br></div><div>and here is the target qtdeclarative which trige=
red this whole naive analysis:</div><div><div>$ grep qtdeclarative rm_work.=
tasks.* | grep -v native</div><div>rm_work.tasks.dizzy:4952 of 11766 (ID: 6=
670, meta-qt5/recipes-qt/qt5/<a href=3D"http://qtdeclarative_git.bb">qtdecl=
arative_git.bb</a>, do_rm_work)</div><div>rm_work.tasks.master:4317 of 1447=
0 (meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)</div><div>rm_wo=
rk.tasks.master.qemux86:10142 of 10296 (meta-qt5/recipes-qt/qt5/qtdeclarati=
ve_git.bb:do_rm_work)</div><div>rm_work.tasks.morty:6753 of 12021 (meta-qt5=
/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_work)</div><div>rm_work.tasks.mo=
rty.gold:6883 of 12021 (meta-qt5/recipes-qt/qt5/qtdeclarative_git.bb:do_rm_=
work)</div></div><div><br></div><div>If we dismiss the strange case in rm_w=
ork.tasks.master.qemux86 then it seems to perform at least as good as old=
=C2=A0<span style=3D"font-size:12.8px">completion=C2=A0</span><span style=
=3D"font-size:12.8px">BB_SCHEDULER.</span></div><div><span style=3D"font-si=
ze:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">But I wan=
ted to ask if there is something else we can do or you were planing to do, =
because IIRC you shared some longer analysis of what could be improved here=
 and I&#39;m not sure if you managed to implement it all.</span></div><div>=
<span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-=
size:12.8px">It feels to me that rm_work has high priority, but still it&#3=
9;s &quot;blocked&quot; by e.g. do_package_qa which gets executed late and =
then immediately followed by rm_work.</span></div><div><span style=3D"font-=
size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">in idea=
l case I would really like to have a switch which will force rm_work to tak=
e absolute priority over other tasks, it doesn&#39;t take very long to dele=
te the files in tmpfs and would allow me to do tmpfs builds on builders wit=
h smaller RAM.</span></div><div><span style=3D"font-size:12.8px"><br></span=
></div><div><span style=3D"font-size:12.8px">The &quot;state of bitbake wor=
ld&quot; builds are performed in=C2=A074G tmpfs (for whole tmpdir-glibc) an=
d yesterday&#39;s builds started to fail again (when it happens to run chro=
mium and chromium-wayland at the same time) - the manual solution for this =
I&#39;m using for last couple years is to build in &quot;steps&quot; which =
force to run rm_work for all included components, so e.g.</span></div><div>=
<span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"font-=
size:12.8px">bitbake gcc-cross-arm &amp;&amp; bitbake small-image &amp;&amp=
; bitbake chromium &amp;&amp; bitbake chromium-wayland &amp;&amp; bitbake b=
ig-image &amp;&amp; bitbake world</span></div><div><span style=3D"font-size=
:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">will keep t=
he tmpfs usage peaks much lower than running just bitbake world</span></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Jan 6, 2=
017 at 10:55 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"mailto:patri=
ck.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">Having do_rm_work depend on do_bui=
ld had one major disadvantage:<br>
do_build depends on the do_build of other recipes, to ensure that<br>
runtime dependencies also get built. The effect is that when work on a<br>
recipe is complete and it could get cleaned up, do_rm_work still<br>
doesn&#39;t run because it waits for those other recipes, thus leading to<b=
r>
more temporary disk space usage than really needed.<br>
<br>
The right solution is to inject do_rm_work before do_build and after<br>
all tasks of the recipe. Achieving that depends on the new bitbake<br>
support for prioritizing anonymous functions to ensure that<br>
rm_work.bbclass gets to see a full set of existing tasks when adding<br>
its own one. This is relevant, for example, for do_analyseimage in<br>
meta-security-isafw&#39;s isafw.bbclass.<br>
<br>
In addition, the new &quot;rm_work&quot; scheduler is used by default. It<b=
r>
prioritizes finishing recipes over continuing with the more<br>
important recipes (with &quot;importance&quot; determined by the number of<=
br>
reverse-dependencies).<br>
<br>
Benchmarking (see &quot;rm_work + pybootchart enhancements&quot; on the OE-=
core<br>
mailing list) showed that builds with the modified rm_work.bbclass<br>
were both faster (albeit not by much) and required considerably less<br>
disk space (14230MiB instead of 18740MiB for core-image-sato).<br>
Interestingly enough, builds with rm_work.bbclass were also faster<br>
than those without.<br>
<br>
Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.com">p=
atrick.ohly@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/rm_work.bbclass | 31 ++++++++++++++++++------------<wbr>=
-<br>
=C2=A01 file changed, 18 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass<br=
>
index 3516c7e..1205104 100644<br>
--- a/meta/classes/rm_work.bbclass<br>
+++ b/meta/classes/rm_work.bbclass<br>
@@ -11,16 +11,13 @@<br>
=C2=A0# RM_WORK_EXCLUDE +=3D &quot;icu-native icu busybox&quot;<br>
=C2=A0#<br>
<br>
-# Use the completion scheduler by default when rm_work is active<br>
+# Use the dedicated rm_work scheduler by default when rm_work is active<br=
>
=C2=A0# to try and reduce disk usage<br>
-BB_SCHEDULER ?=3D &quot;completion&quot;<br>
+BB_SCHEDULER ?=3D &quot;rm_work&quot;<br>
<br>
=C2=A0# Run the rm_work task in the idle scheduling class<br>
=C2=A0BB_TASK_IONICE_LEVEL_task-rm_<wbr>work =3D &quot;3.0&quot;<br>
<br>
-RMWORK_ORIG_TASK :=3D &quot;${BB_DEFAULT_TASK}&quot;<br>
-BB_DEFAULT_TASK =3D &quot;rm_work_all&quot;<br>
-<br>
=C2=A0do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0# If the recipe name is in the RM_WORK_EXCLUDE, skip th=
e recipe.<br>
=C2=A0 =C2=A0 =C2=A0for p in ${RM_WORK_EXCLUDE}; do<br>
@@ -97,13 +94,6 @@ do_rm_work () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $i<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
-addtask rm_work after do_${RMWORK_ORIG_TASK}<br>
-<br>
-do_rm_work_all () {<br>
-=C2=A0 =C2=A0 :<br>
-}<br>
-do_rm_work_all[recrdeptask] =3D &quot;do_rm_work&quot;<br>
-addtask rm_work_all after do_rm_work<br>
<br>
=C2=A0do_populate_sdk[postfuncs] +=3D &quot;rm_work_populatesdk&quot;<br>
=C2=A0rm_work_populatesdk () {<br>
@@ -117,7 +107,7 @@ rm_work_rootfs () {<br>
=C2=A0}<br>
=C2=A0rm_work_rootfs[cleandirs] =3D &quot;${WORKDIR}/rootfs&quot;<br>
<br>
-python () {<br>
+python __anonymous_rm_work() {<br>
=C2=A0 =C2=A0 =C2=A0if bb.data.inherits_class(&#39;<wbr>kernel&#39;, d):<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.appendVar(&quot;RM_WORK_EXCLUDE&quot;, =
&#39; &#39; + d.getVar(&quot;PN&quot;))<br>
=C2=A0 =C2=A0 =C2=A0# If the recipe name is in the RM_WORK_EXCLUDE, skip th=
e recipe.<br>
@@ -126,4 +116,19 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0if pn in excludes:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.delVarFlag(&#39;rm_work_rootfs&#39;, &#=
39;cleandirs&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.delVarFlag(&#39;rm_work_<wbr>populatesd=
k&#39;, &#39;cleandirs&#39;)<br>
+=C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Inject do_rm_work into the tasks of the curr=
ent recipe such that do_build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # depends on it and that it runs after all oth=
er tasks that block do_build,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # i.e. after all work on the current recipe is=
 done. The reason for taking<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this approach instead of making do_rm_work d=
epend on do_build is that<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # do_build inherits additional runtime depende=
ncies on<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # other recipes and thus will typically run mu=
ch later than completion of<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # work in the recipe itself.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D bb.build.preceedtask(&#39;do_<wbr>bui=
ld&#39;, True, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;do_build&#39; in deps:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 deps.remove(&#39;do_build&#39;)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.build.addtask(&#39;do_rm_work&#39;, &#39;do=
_build&#39;, &#39; &#39;.join(deps), d)<br>
=C2=A0}<br>
+# Higher priority than the normal 100, and thus we run after other<br>
+# classes like package_rpm.bbclass which also add custom tasks.<br>
+__anonymous_rm_work[__<wbr>anonprio] =3D &quot;1000&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div></div>

--f403045f4e609a2daf054895e7c9--
