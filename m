Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E98C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 01:01:50 +0000 (UTC)
Subject: Re: [PATCH RFC 0/3] RFC: Fixing rust segfault (#16058) to support Ubuntu 26.04 on Scarthgap
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.221.15)
X-Originating-Platform: Windows Chrome 150
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 18:01:45 -0700
References: <20260626-ycongal-scarthgap-rust-segfault-v1-0-97df64b7b298@smile.fr> <CANNYZj81E4G9gSBPHNNsxg4JiJ_wEnmCoSkNdQ2bzJBjF5q=DA@mail.gmail.com> <DJJ33TR36YJC.24WW5E1PX60Z2@smile.fr> <DJJV9FGWRHJB.26TA7NN2T8LVS@smile.fr> <CANNYZj8nhGqmvy0tTnUHCNtnjkjweE-OwqL3gDL0mOYGgQO8OQ@mail.gmail.com> <DJO58J8D7X5G.2FRK2OBFYWIDO@smile.fr> <3a7e0892-9656-48f0-ae64-ee9ee047b6e1@windriver.com> <CANNYZj-UN-4ZR=X4KQLMawCSYoe8zpWqWmPN0xwLkVGNCDNcYw@mail.gmail.com>
In-Reply-To: <CANNYZj-UN-4ZR=X4KQLMawCSYoe8zpWqWmPN0xwLkVGNCDNcYw@mail.gmail.com>
Message-ID: <743437.1784163705822875917@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="g2R8Tu8MBvJmzxwsYuuj"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 01:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241048

--g2R8Tu8MBvJmzxwsYuuj
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 09:30 PM, Alexander Kanavin wrote:

>=20
> We're trying to keep the threshold for introducing buildtools high
> (I'm aware I'm not always arguing for that, but in principle I agree
> with RP :).
>=20
> The bugzilla ticket mentions that the needed linker fix has been
> backported to a lot of older binutils releases, so I'd rather ask them
> to update their respective binutils packages. It would perhaps be good
> to start a clear list of which distros at which versions need the fix,
> which ones already have it, and which ones are covered by buildtools.
> Can you look into that? Then we can consider further steps.
>=20
> Alternatively, perhaps you Sunil could help Yoann to disable static
> linking on older rust release which is in scarthgap, e.g. backport the
> master fix to the scarthgap. I believe that might be the easiest
> option. Yoann tried, but couldn't quite get it to work.

Hi Alex,

Thanks, that makes sense.
Just a quick recap of the master vs. scarthgap situation for anyone followi=
ng this thread:

Master: Rust already links LLVM dynamically, so neither the worker nor the =
binutils version matters.

Scarthgap: Rust still links LLVM statically, so the host ld matters. Since =
the eligible scarthgap
workers use binutils older than 2.45, they do not normally produce the new =
relocation.
The issue only surfaced after Ubuntu 26.04 was added to the scarthgap pool =
(241a957),
and was later reverted (3d3e5ff).

Now for the worker check: I don't have access to the workers, so I verified=
 the linker each one
uses in two ways: for host-toolchain workers, I ran that distro's binutils =
in a Docker image of
the same version; for buildtools workers, I downloaded the exact tarball pi=
nned by the AB and tested
the ld inside it. In each case, I linked the small reproducer and checked w=
hether the
push was converted into a call.

Host-toolchain workers (distro's own ld):

Ubuntu 22.04 =C2=A0 - ld 2.38 =C2=A0 =C2=A0- BROKEN
Ubuntu 24.04 =C2=A0 - ld 2.42 =C2=A0 =C2=A0- BROKEN
Ubuntu 25.04 =C2=A0 - ld 2.44 =C2=A0 =C2=A0- BROKEN
Ubuntu 25.10 =C2=A0 - ld 2.45 =C2=A0 =C2=A0- ok
Ubuntu 26.04 =C2=A0 - ld 2.46 =C2=A0 =C2=A0- ok
Debian 12 =C2=A0 =C2=A0 =C2=A0- ld 2.40 =C2=A0 =C2=A0- BROKEN
Debian 13 =C2=A0 =C2=A0 =C2=A0- ld 2.44 =C2=A0 =C2=A0- BROKEN
Fedora 42 =C2=A0 =C2=A0 =C2=A0- ld 2.44 =C2=A0 =C2=A0- BROKEN
Fedora 43 =C2=A0 =C2=A0 =C2=A0- ld 2.45.1 =C2=A0- ok
Fedora 44 =C2=A0 =C2=A0 =C2=A0- ld 2.46 =C2=A0 =C2=A0- ok
AlmaLinux 10 =C2=A0 - ld 2.41 =C2=A0 =C2=A0- BROKEN
openSUSE 16.0 =C2=A0- ld 2.45 =C2=A0 =C2=A0- ok

Buildtools workers (alma8/9, rocky8/9, stream9, opensuse156,
perf-alma8, debian11) use the pinned tarball's ld:

master =C2=A0 =C2=A0- buildtools 5.1 =C2=A0 - ld 2.43.1.20241111 - BROKEN
scarthgap - buildtools 5.0.4 - ld 2.42.0.20240716 - BROKEN

- No distro has picked up the PR32991 backport yet. The "ok" ones simply sh=
ip binutils >=3D 2.45.

- Debian 13, Ubuntu 25.04, and Fedora 42 ship binutils 2.44. Their gas emit=
s plain R_X86_64_GOTPCREL
relocations rather than the GOTPCRELX form introduced in 2.45, so they are =
fine as producers but
mis-link GOTPCRELX objects produced by >=3D 2.45 workers.

- Both pinned buildtools tarballs are broken.

So right now every x86 worker except Ubuntu 25.10/26.04, Fedora 43/44 and o=
penSUSE 16.0 links rust
with a broken ld, and those >=3D 2.45 workers are the producers, so the res=
t are exposed through shared
sstate.

On next steps:

1. The scarthgap binutils recipe already carries the PR32991 fix (its SRCRE=
V is the backport commit),
so a buildtools tarball rebuilt from current scarthgap would be fine - woul=
d refreshing the pinned
tarballs on the helper branches help here?

2. For the host-toolchain workers, if you're okay with it, I can start fili=
ng bugs with the relevant
distros (Debian, Ubuntu, and Fedora; the EL rebuilds follow RHEL). The repr=
oducer makes each report
self-contained, but it will still take time for the fixes to land.

3. On the scarthgap backport, I got the dynamic LLVM linking change working=
 with scarthgap's Rust.
Since rust-llvm on scarthgap never built a shared libLLVM, I first had to e=
nable that,
along with some path and packaging adjustments because LLVM 17 installs the=
 shared library
as libLLVM-17.so under the llvm-rust prefix.

The draft is here:
https://git.yoctoproject.org/poky-contrib/commit/?h=3Ddeepesh/rust-segfault=
-scarthgap&id=3De8bdd23a09d58e4311988b158ca0b9a63820b723

I built core-image-minimal with Rust and Cargo, booted it, and verified tha=
t rustc and cargo work
on the target by compiling and running a test program. librustc_driver now =
carries a NEEDED entry
for libLLVM-17.so instead of linking LLVM statically. oe-selftest is still =
running on my side.
If you and Yoann are okay with this approach, I'll submit it to scarthgap o=
nce it completes.

~Sunil Dora

--g2R8Tu8MBvJmzxwsYuuj
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Jul 13, 2026 at 09:30 PM, Alexander Kanavin wrote:</div>
<div>
<blockquote>We're trying to keep the threshold for introducing buildtools h=
igh<br />(I'm aware I'm not always arguing for that, but in principle I agr=
ee<br />with RP :).<br /><br />The bugzilla ticket mentions that the needed=
 linker fix has been<br />backported to a lot of older binutils releases, s=
o I'd rather ask them<br />to update their respective binutils packages. It=
 would perhaps be good<br />to start a clear list of which distros at which=
 versions need the fix,<br />which ones already have it, and which ones are=
 covered by buildtools.<br />Can you look into that? Then we can consider f=
urther steps.<br /><br />Alternatively, perhaps you Sunil could help Yoann =
to disable static<br />linking on older rust release which is in scarthgap,=
 e.g. backport the<br />master fix to the scarthgap. I believe that might b=
e the easiest<br />option. Yoann tried, but couldn't quite get it to work.<=
/blockquote>
<br />Hi Alex,<br /><br />Thanks, that makes sense.&nbsp;<br />Just a quick=
 recap of the master vs. scarthgap situation for anyone following this thre=
ad:<br /><br />Master: Rust already links LLVM dynamically, so neither the =
worker nor the binutils version matters.<br /><br />Scarthgap: Rust still l=
inks LLVM statically, so the host ld matters. Since the eligible scarthgap&=
nbsp;<br />workers use binutils older than 2.45, they do not normally produ=
ce the new relocation.&nbsp;<br />The issue only surfaced after Ubuntu 26.0=
4 was added to the scarthgap pool (241a957),&nbsp;<br />and was later rever=
ted (3d3e5ff).<br /><br />Now for the worker check: I don't have access to =
the workers, so I verified the linker each one&nbsp;<br />uses in two ways:=
 for host-toolchain workers, I ran that distro's binutils in a Docker image=
 of&nbsp;<br />the same version; for buildtools workers, I downloaded the e=
xact tarball pinned by the AB and tested&nbsp;<br />the ld inside it. In ea=
ch case, I linked the small reproducer and checked whether the&nbsp;<br />p=
ush was converted into a call.<br /><br />Host-toolchain workers (distro's =
own ld):<br /><br />&nbsp; Ubuntu 22.04 &nbsp; - ld 2.38 &nbsp; &nbsp;- BRO=
KEN<br />&nbsp; Ubuntu 24.04 &nbsp; - ld 2.42 &nbsp; &nbsp;- BROKEN<br />&n=
bsp; Ubuntu 25.04 &nbsp; - ld 2.44 &nbsp; &nbsp;- BROKEN<br />&nbsp; Ubuntu=
 25.10 &nbsp; - ld 2.45 &nbsp; &nbsp;- ok<br />&nbsp; Ubuntu 26.04 &nbsp; -=
 ld 2.46 &nbsp; &nbsp;- ok<br />&nbsp; Debian 12 &nbsp; &nbsp; &nbsp;- ld 2=
.40 &nbsp; &nbsp;- BROKEN<br />&nbsp; Debian 13 &nbsp; &nbsp; &nbsp;- ld 2.=
44 &nbsp; &nbsp;- BROKEN<br />&nbsp; Fedora 42 &nbsp; &nbsp; &nbsp;- ld 2.4=
4 &nbsp; &nbsp;- BROKEN<br />&nbsp; Fedora 43 &nbsp; &nbsp; &nbsp;- ld 2.45=
.1 &nbsp;- ok<br />&nbsp; Fedora 44 &nbsp; &nbsp; &nbsp;- ld 2.46 &nbsp; &n=
bsp;- ok<br />&nbsp; AlmaLinux 10 &nbsp; - ld 2.41 &nbsp; &nbsp;- BROKEN<br=
 />&nbsp; openSUSE 16.0 &nbsp;- ld 2.45 &nbsp; &nbsp;- ok<br /><br />Buildt=
ools workers (alma8/9, rocky8/9, stream9, opensuse156,<br />perf-alma8, deb=
ian11) use the pinned tarball's ld:<br /><br />&nbsp; master &nbsp; &nbsp;-=
 buildtools 5.1 &nbsp; - ld 2.43.1.20241111 - BROKEN<br />&nbsp; scarthgap =
- buildtools 5.0.4 - ld 2.42.0.20240716 - BROKEN<br /><br />- No distro has=
 picked up the PR32991 backport yet. The "ok" ones simply ship binutils &gt=
;=3D 2.45.<br /><br />- Debian 13, Ubuntu 25.04, and Fedora 42 ship binutil=
s 2.44. Their gas emits plain R_X86_64_GOTPCREL&nbsp;<br />relocations rath=
er than the GOTPCRELX form introduced in 2.45, so they are fine as producer=
s but&nbsp;<br />mis-link GOTPCRELX objects produced by &gt;=3D 2.45 worker=
s.<br /><br />- Both pinned buildtools tarballs are broken.<br /><br />So r=
ight now every x86 worker except Ubuntu 25.10/26.04, Fedora 43/44 and openS=
USE 16.0 links rust&nbsp;<br />with a broken ld, and those &gt;=3D 2.45 wor=
kers are the producers, so the rest are exposed through shared<br />sstate.=
<br /><br />On next steps:<br /><br />1. The scarthgap binutils recipe alre=
ady carries the PR32991 fix (its SRCREV is the backport commit),&nbsp;<br /=
>so a buildtools tarball rebuilt from current scarthgap would be fine - wou=
ld refreshing the pinned&nbsp;<br />tarballs on the helper branches help he=
re?<br /><br />2. For the host-toolchain workers, if you're okay with it, I=
 can start filing bugs with the relevant&nbsp;<br />distros (Debian, Ubuntu=
, and Fedora; the EL rebuilds follow RHEL). The reproducer makes each repor=
t&nbsp;<br />self-contained, but it will still take time for the fixes to l=
and.<br /><br />3. On the scarthgap backport, I got the dynamic LLVM linkin=
g change working with scarthgap's Rust.&nbsp;<br />Since rust-llvm on scart=
hgap never built a shared libLLVM, I first had to enable that,&nbsp;<br />a=
long with some path and packaging adjustments because LLVM 17 installs the =
shared library&nbsp;<br />as libLLVM-17.so under the llvm-rust prefix.&nbsp=
;<br /><br />The draft is here:<br />https://git.yoctoproject.org/poky-cont=
rib/commit/?h=3Ddeepesh/rust-segfault-scarthgap&amp;id=3De8bdd23a09d58e4311=
988b158ca0b9a63820b723<br /><br />I built core-image-minimal with Rust and =
Cargo, booted it, and verified that rustc and cargo work&nbsp;<br />on the =
target by compiling and running a test program. librustc_driver now carries=
 a NEEDED entry&nbsp;<br />for libLLVM-17.so instead of linking LLVM static=
ally. oe-selftest is still running on my side.&nbsp;<br />If you and Yoann =
are okay with this approach, I'll submit it to scarthgap once it completes.=
<br /><br />~Sunil Dora<br /><br /></div>

--g2R8Tu8MBvJmzxwsYuuj--

