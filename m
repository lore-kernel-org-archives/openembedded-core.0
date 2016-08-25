Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 94B30605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 21:46:02 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id e63so298228219ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 14:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eJrhN15Kzo1XdMieyWKT3KFv5xoCh3VCjBXu85gtzPo=;
	b=w/ve+sISNg5lMfG9hfBF4S4FGCNj37ktTOhK0PiVDhvsRuBYtxHWmHtLONC4Ys2fNS
	2NLWYXyqTrfRErYvFUQcuQTTr1I10DfV0wM+lNQzXRXW5cT7I3dsG6Ma3BrQr0WJfLUX
	xkg47Xtt6kgvZ9Wn/9vi8rCe1kJ7eOuio9UlAXu3ixrIV8H8SfwwmA5Y//1MXwat29jk
	ZkGsMukqysftggy0QKnTrWgZHzst6mD0HSfKry9dUWvCgtci0VcRdMObVorapHj7n38T
	Qba5vseQKC6UXyi76LDrKK95H05lcUhmuuPXxJEZdQH1QQP09l7NGTzy6RredfGhhrZn
	8OgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eJrhN15Kzo1XdMieyWKT3KFv5xoCh3VCjBXu85gtzPo=;
	b=HHuie3rsYQI6u2IqNt7YRKoIPDs165TLilv23IoE7cR2EMNyCxcOmViZhy5pft27t7
	AX5qpjskJcO4T+0F9xg+STHJh0PTWe1ATr/73rrFsimnPszVfvUXVOp88vEKn2+8gXP7
	mShSZrBw4pmZWyJzofkoXnnN5X09rhlxxqhEBYy3kUrN5zyw3xHCYQxPH4N40X09stP/
	DbyDxE2wUM9kji8D2MiGKBNgMU5BSRCqLkT75e7zwmcFJ5bfhg/PENnq4+bHOUfPj7l5
	jpjFxueZQFp6YpGXcUC7FBGbm6J+DYrs7LcKfo0i3m8+XOAbM24KFerhs1MFcHFHvxB6
	FU8Q==
X-Gm-Message-State: AE9vXwNN7E0xj2GA8IbSvglv2bZVMU7yNddHX8a/f0t+tbFulylHJZURXqmvKB5igP4XXZa1Wcnf8m3nEW3SaoDa
X-Received: by 10.36.19.209 with SMTP id 200mr7480986itz.83.1472161562931;
	Thu, 25 Aug 2016 14:46:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 25 Aug 2016 14:45:42 -0700 (PDT)
In-Reply-To: <cover.1472120966.git.liezhi.yang@windriver.com>
References: <cover.1472120966.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Aug 2016 22:45:42 +0100
Message-ID: <CAJTo0LbNHqJB4ipWdmtSJ1vDT_pEJHFS1J2+ZtxiVsecrL86xQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 00/10] runqemu: refactor it and remove machine knowledge
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
X-List-Received-Date: Thu, 25 Aug 2016 21:46:03 -0000
Content-Type: multipart/alternative; boundary=001a11446d6202dd51053aec5368

--001a11446d6202dd51053aec5368
Content-Type: text/plain; charset=UTF-8

Hi Robert,

So close!  qemuarm64 is breaking on the AB:

https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/536/steps/Running%20Sanity%20Tests/logs/stdio

I suspect we're passing some options to runqemu that you didn't cover in
your testing.

Ross

On 25 August 2016 at 15:40, Robert Yang <liezhi.yang@windriver.com> wrote:

> * V5
>   - Fix race issues when building multi image recipes at the same time,
> they
>     might write qemuboo.py at the same time in the past. Now each image has
>     a unique ${IMAGE_LINK_NAME}.runqemu.conf.
>
>   - qemuboot.py -> ${IMAGE_LINK_NAME}.runqemu.conf, I used "import
> qemuboot.py",
>     but now we can't "import ${IMAGE_LINK_NAME}.runqemu.py" since
>     IMAGE_LINK_NAME contains dash "-", so rename it to .conf and use
> configparser
>     to read/write it.
>
> * V4
>   - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set vars
>     for runqemu, so all the arch info are gone. And also update comments
>     in qemuboot.bbclass.
>   - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add
>     QB_TAP_OPT whichi is for tap mode.
>   - Print "Try 'runqemu help' on how to use it" when failed to parse args
>     as Nathan suggested.
>   - Fix device locking problems.
>   - Fix nativesdk-qemu-helper.
>   - Fix comments for qemurunner.py/qemutinyrunner.py
>
> * V3
>   - Move the qemu boot settings out of tune files (e.g., arch-x86.inc)
>     to avoid mixing BSP settings with the tunings as Mark suggested. and
>     put them to <machine>.conf or <qemuboot>.inc file.
>
> * V2
>   - Fixes for RP's comments
>     a) Remove a kvm commit message since qemu-kvm can only run target when
>        its arch is the same as the host arch:
>        The kvm support is not limited on x86 or x86_64
>
>     b) Fix a typo in commit message: qemu-boot.bbclass -> qemuboot.bbclass,
>        You may wonder why I use qemuboot.bbclass but not qemu-boot.bbclass,
>        this is because the bbclass will save vars into qemuboot.conf, the
>        qemuboot.conf can't be qemu-boot.py here, otherwise,
>        "import qemu-boot.py" doesn't work since "-" is not a validate
>        identifier, so use "qemuboot" to make them unify.
>
>     c) Reorder the patches to make sure they don't break the bisect build.
>
>   - Update commit message:
>     "Fix SLIRP mode" -> "Fix SLIRP mode, add help message, avoid mixing
>   with tap"
>
> * V1
>   Previously, runqemu had hard coded machine knowledge, which limited its
>   usage, for example, qemu can boot genericx86, but runqemu can't, we need
>   edit runqemu/runqemu-internal a lot if we want to boot genericx86.
>
>   Now bsp conf files can set vars to make it can be boot by runqemu, and
>   qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qemuboot.conf.
>   Please see qemuboot.bbclass' comments on how to set the vars.
>
>   - Re-write it in python3, which can reduce lines from 1239 to about 750
>     lines
>   - All the machine knowledges are gone
>   - All of the TUN_ARCH knowledge are gone (FIXED in V4)
>   - All the previous options are preserved, and there is a new way to run
>     runqemu: (it doesn't need run "bitake -e" in such a case)
>     $ runqemu tmp/deploy/images/qemux86
>     or:
>     $ runqemu tmp/deploy/images/qemuarm/<image>.ext4
>     or:
>     $ runqemu tmp/deploy/images/qemuarm/qemuboot.conf
>   - Fixed audio support, not limited on x86 or x86_64
>   - The kvm support is not limited on x86 or x86_64 (REMOVED by V2)
>   - Fix SLIRP mode (FIXED by V2)
>   - Fix NFS boot, it will extract <image>.tar.bz2 or tar.gz to
>     DEPLOY_DIR_IMAGE/<image>-nfsroot when no NFS_DIR, and remove it after
>     stop.
>   - More bsps can be boot, such as genericx86 and genericx86-64.
>   - The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent to
>     meta-xilinx' mailing list.
>   - I can't find any qemush4 bsp or how to build it, so it is not
>     considered atm.
>
>   - Tested the following machines, all of them work well.
>     genericx86 genericx86-64
>     qemuarm qemuarm64
>     qemumips qemumips64 qemuppc
>     qemux86 qemux86-64
>     qemuzynq qemuzynqmp
>
>     Tested ext4, nfs, slirp, vmdk, iso and cpio.gz when they are available.
>
>   And also test "bitbake core-image-sato -ctestimage" which uses runqemu,
>   it works, well.
>
> // Robert
>
> The following changes since commit a7f1435c4c26237cdb55066c9f5408
> b4fdf016aa:
>
>   combo-layer: python3: fix UnicodeDecodeError (2016-08-24 13:58:24 +0100)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-
> contrib/log/?h=rbt/runqemu
>
> Robert Yang (10):
>   qemuboot.bbclass: add it for runqemu
>   qemuarm.conf: set vars for runqemu
>   qemuarm64.conf: set vars for runqemu
>   qemux86.conf/qemux86-64.conf: set vars for runqemu
>   qemumips/qemumips64.conf: set vars for runqemu
>   qemuppc.conf: set vars for runqemu
>   qemu.inc: inherit qemuboot.bbclass
>   runqemu: refactor it and remove machine knowledge
>   nativesdk-qemu-helper: fix for new runqemu
>   qemurunner.py/qemutinyrunner.py: remove runqemu-internal
>
>  meta/classes/qemuboot.bbclass                      |   75 ++
>  meta/conf/machine/include/qemu.inc                 |    2 +
>  meta/conf/machine/include/qemuboot-mips.inc        |    7 +
>  meta/conf/machine/include/qemuboot-x86.inc         |   14 +
>  meta/conf/machine/qemuarm.conf                     |    5 +
>  meta/conf/machine/qemuarm64.conf                   |   13 +
>  meta/conf/machine/qemumips.conf                    |    1 +
>  meta/conf/machine/qemumips64.conf                  |    1 +
>  meta/conf/machine/qemuppc.conf                     |    7 +
>  meta/conf/machine/qemux86-64.conf                  |    1 +
>  meta/conf/machine/qemux86.conf                     |    1 +
>  meta/lib/oeqa/utils/qemurunner.py                  |    2 +-
>  meta/lib/oeqa/utils/qemutinyrunner.py              |    2 +-
>  .../qemu/nativesdk-qemu-helper_1.0.bb              |    9 +-
>  scripts/runqemu                                    | 1332
> ++++++++++++--------
>  scripts/runqemu-internal                           |  739 -----------
>  16 files changed, 941 insertions(+), 1270 deletions(-)
>  create mode 100644 meta/classes/qemuboot.bbclass
>  create mode 100644 meta/conf/machine/include/qemuboot-mips.inc
>  create mode 100644 meta/conf/machine/include/qemuboot-x86.inc
>  delete mode 100755 scripts/runqemu-internal
>
> --
> 2.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11446d6202dd51053aec5368
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Robert,<div><br></div><div>So close! =C2=A0qemuarm64 is=
 breaking on the AB:<div><br></div><div><a href=3D"https://autobuilder.yoct=
oproject.org/main/builders/nightly-arm64/builds/536/steps/Running%20Sanity%=
20Tests/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nigh=
tly-arm64/builds/536/steps/Running%20Sanity%20Tests/logs/stdio</a><br></div=
><div><br></div><div>I suspect we&#39;re passing some options to runqemu th=
at you didn&#39;t cover in your testing.</div><div><br></div><div>Ross</div=
></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2=
5 August 2016 at 15:40, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"mailto=
:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* V5<br>
=C2=A0 - Fix race issues when building multi image recipes at the same time=
, they<br>
=C2=A0 =C2=A0 might write qemuboo.py at the same time in the past. Now each=
 image has<br>
=C2=A0 =C2=A0 a unique ${IMAGE_LINK_NAME}.runqemu.<wbr>conf.<br>
<br>
=C2=A0 - qemuboot.py -&gt; ${IMAGE_LINK_NAME}.runqemu.<wbr>conf, I used &qu=
ot;import qemuboot.py&quot;,<br>
=C2=A0 =C2=A0 but now we can&#39;t &quot;import ${IMAGE_LINK_NAME}.runqemu.=
py&quot; since<br>
=C2=A0 =C2=A0 IMAGE_LINK_NAME contains dash &quot;-&quot;, so rename it to =
.conf and use configparser<br>
=C2=A0 =C2=A0 to read/write it.<br>
<span class=3D""><br>
* V4<br>
=C2=A0 - Now the conf files can use @TAP@, @ROOTFS@ and @PORT@ when set var=
s<br>
=C2=A0 =C2=A0 for runqemu, so all the arch info are gone. And also update c=
omments<br>
=C2=A0 =C2=A0 in qemuboot.bbclass.<br>
=C2=A0 - Add var QB_SLIRP_OPT for slirp mode as Nathan suggested, also add<=
br>
=C2=A0 =C2=A0 QB_TAP_OPT whichi is for tap mode.<br>
=C2=A0 - Print &quot;Try &#39;runqemu help&#39; on how to use it&quot; when=
 failed to parse args<br>
=C2=A0 =C2=A0 as Nathan suggested.<br>
=C2=A0 - Fix device locking problems.<br>
=C2=A0 - Fix nativesdk-qemu-helper.<br>
=C2=A0 - Fix comments for <a href=3D"http://qemurunner.py/qemutinyrunner.py=
" rel=3D"noreferrer" target=3D"_blank">qemurunner.py/qemutinyrunner.<wbr>py=
</a><br>
<br>
</span><span class=3D"">* V3<br>
=C2=A0 - Move the qemu boot settings out of tune files (e.g., arch-x86.inc)=
<br>
=C2=A0 =C2=A0 to avoid mixing BSP settings with the tunings as Mark suggest=
ed. and<br>
=C2=A0 =C2=A0 put them to &lt;machine&gt;.conf or &lt;qemuboot&gt;.inc file=
.<br>
<br>
* V2<br>
=C2=A0 - Fixes for RP&#39;s comments<br>
=C2=A0 =C2=A0 a) Remove a kvm commit message since qemu-kvm can only run ta=
rget when<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0its arch is the same as the host arch:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0The kvm support is not limited on x86 or x86_64<=
br>
<br>
=C2=A0 =C2=A0 b) Fix a typo in commit message: qemu-boot.bbclass -&gt; qemu=
boot.bbclass,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0You may wonder why I use qemuboot.bbclass but no=
t qemu-boot.bbclass,<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0this is because the bbclass will save var=
s into qemuboot.conf, the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0qemuboot.conf can&#39;t be qemu-boot.py here, ot=
herwise,<br>
<span class=3D"">=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;import qemu-boot.py&quot;=
 doesn&#39;t work since &quot;-&quot; is not a validate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0identifier, so use &quot;qemuboot&quot; to make =
them unify.<br>
<br>
=C2=A0 =C2=A0 c) Reorder the patches to make sure they don&#39;t break the =
bisect build.<br>
<br>
=C2=A0 - Update commit message:<br>
=C2=A0 =C2=A0 &quot;Fix SLIRP mode&quot; -&gt; &quot;Fix SLIRP mode, add he=
lp message, avoid mixing<br>
=C2=A0 with tap&quot;<br>
<br>
* V1<br>
=C2=A0 Previously, runqemu had hard coded machine knowledge, which limited =
its<br>
=C2=A0 usage, for example, qemu can boot genericx86, but runqemu can&#39;t,=
 we need<br>
=C2=A0 edit runqemu/runqemu-internal a lot if we want to boot genericx86.<b=
r>
<br>
=C2=A0 Now bsp conf files can set vars to make it can be boot by runqemu, a=
nd<br>
</span>=C2=A0 qemuboot.bbclass will save these info to DEPLOY_DIR_IMAGE/qem=
uboot.<wbr>conf.<br>
<span class=3D"">=C2=A0 Please see qemuboot.bbclass&#39; comments on how to=
 set the vars.<br>
<br>
=C2=A0 - Re-write it in python3, which can reduce lines from 1239 to about =
750<br>
=C2=A0 =C2=A0 lines<br>
=C2=A0 - All the machine knowledges are gone<br>
=C2=A0 - All of the TUN_ARCH knowledge are gone (FIXED in V4)<br>
=C2=A0 - All the previous options are preserved, and there is a new way to =
run<br>
=C2=A0 =C2=A0 runqemu: (it doesn&#39;t need run &quot;bitake -e&quot; in su=
ch a case)<br>
=C2=A0 =C2=A0 $ runqemu tmp/deploy/images/qemux86<br>
=C2=A0 =C2=A0 or:<br>
=C2=A0 =C2=A0 $ runqemu tmp/deploy/images/qemuarm/&lt;<wbr>image&gt;.ext4<b=
r>
=C2=A0 =C2=A0 or:<br>
</span>=C2=A0 =C2=A0 $ runqemu tmp/deploy/images/qemuarm/<wbr>qemuboot.conf=
<br>
<span class=3D"">=C2=A0 - Fixed audio support, not limited on x86 or x86_64=
<br>
=C2=A0 - The kvm support is not limited on x86 or x86_64 (REMOVED by V2)<br=
>
=C2=A0 - Fix SLIRP mode (FIXED by V2)<br>
=C2=A0 - Fix NFS boot, it will extract &lt;image&gt;.tar.bz2 or tar.gz to<b=
r>
=C2=A0 =C2=A0 DEPLOY_DIR_IMAGE/&lt;image&gt;-<wbr>nfsroot when no NFS_DIR, =
and remove it after<br>
=C2=A0 =C2=A0 stop.<br>
=C2=A0 - More bsps can be boot, such as genericx86 and genericx86-64.<br>
=C2=A0 - The patch for qemuzynq, qemuzynqmp, qemumicroblaze has been sent t=
o<br>
=C2=A0 =C2=A0 meta-xilinx&#39; mailing list.<br>
=C2=A0 - I can&#39;t find any qemush4 bsp or how to build it, so it is not<=
br>
=C2=A0 =C2=A0 considered atm.<br>
<br>
=C2=A0 - Tested the following machines, all of them work well.<br>
=C2=A0 =C2=A0 genericx86 genericx86-64<br>
=C2=A0 =C2=A0 qemuarm qemuarm64<br>
=C2=A0 =C2=A0 qemumips qemumips64 qemuppc<br>
=C2=A0 =C2=A0 qemux86 qemux86-64<br>
=C2=A0 =C2=A0 qemuzynq qemuzynqmp<br>
<br>
=C2=A0 =C2=A0 Tested ext4, nfs, slirp, vmdk, iso and cpio.gz when they are =
available.<br>
<br>
=C2=A0 And also test &quot;bitbake core-image-sato -ctestimage&quot; which =
uses runqemu,<br>
=C2=A0 it works, well.<br>
<br>
// Robert<br>
<br>
</span>The following changes since commit a7f1435c4c26237cdb55066c9f5408<wb=
r>b4fdf016aa:<br>
<br>
=C2=A0 combo-layer: python3: fix UnicodeDecodeError (2016-08-24 13:58:24 +0=
100)<br>
<span class=3D""><br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/<wbr>openembe=
dded-core-contrib</a> rbt/runqemu<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Drbt/runqemu" rel=3D"noreferrer" target=3D"_blank">http://cg=
it.openembedded.org/<wbr>cgit.cgi/openembedded-core-<wbr>contrib/log/?h=3Dr=
bt/runqemu</a><br>
<br>
</span>Robert Yang (10):<br>
<span class=3D"">=C2=A0 qemuboot.bbclass: add it for runqemu<br>
=C2=A0 qemuarm.conf: set vars for runqemu<br>
=C2=A0 qemuarm64.conf: set vars for runqemu<br>
=C2=A0 qemux86.conf/qemux86-64.conf: set vars for runqemu<br>
=C2=A0 qemumips/qemumips64.conf: set vars for runqemu<br>
=C2=A0 qemuppc.conf: set vars for runqemu<br>
=C2=A0 qemu.inc: inherit qemuboot.bbclass<br>
=C2=A0 runqemu: refactor it and remove machine knowledge<br>
</span><span class=3D"">=C2=A0 nativesdk-qemu-helper: fix for new runqemu<b=
r>
=C2=A0 <a href=3D"http://qemurunner.py/qemutinyrunner.py" rel=3D"noreferrer=
" target=3D"_blank">qemurunner.py/qemutinyrunner.<wbr>py</a>: remove runqem=
u-internal<br>
<br>
</span>=C2=A0meta/classes/qemuboot.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A075 ++<br>
<span class=3D"">=C2=A0meta/conf/machine/include/<wbr>qemu.inc=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +<br>
=C2=A0meta/conf/machine/include/<wbr>qemuboot-mips.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 7 +<br>
=C2=A0meta/conf/machine/include/<wbr>qemuboot-x86.inc=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A014 +<br>
=C2=A0meta/conf/machine/qemuarm.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +<br>
=C2=A0meta/conf/machine/qemuarm64.<wbr>conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +<br>
=C2=A0meta/conf/machine/qemumips.<wbr>conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/conf/machine/qemumips64.<wbr>conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/conf/machine/qemuppc.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 7 +<br>
=C2=A0meta/conf/machine/qemux86-64.<wbr>conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/conf/machine/qemux86.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/lib/oeqa/utils/<wbr>qemurunner.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/lib/oeqa/utils/<wbr>qemutinyrunner.py=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
</span>=C2=A0.../qemu/<a href=3D"http://nativesdk-qemu-helper_1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">nativesdk-qemu-<wbr>helper_1.0.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +-<br>
=C2=A0scripts/runqemu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 1332 ++++++++++++--------<br>
=C2=A0scripts/runqemu-internal=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 739 -----------=
<br>
=C2=A016 files changed, 941 insertions(+), 1270 deletions(-)<br>
<span class=3D"">=C2=A0create mode 100644 meta/classes/qemuboot.bbclass<br>
=C2=A0create mode 100644 meta/conf/machine/include/<wbr>qemuboot-mips.inc<b=
r>
=C2=A0create mode 100644 meta/conf/machine/include/<wbr>qemuboot-x86.inc<br=
>
=C2=A0delete mode 100755 scripts/runqemu-internal<br>
<br>
--<br>
</span>2.9.0<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11446d6202dd51053aec5368--
