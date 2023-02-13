Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED23C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 07:01:36 +0000 (UTC)
Subject: Re: Yocto Bug 14965 - Need info on rmeta hash
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.146.233)
X-Originating-Platform: Windows Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 12 Feb 2023 23:01:32 -0800
References: <CAO5Uq5T4NQ=BrHBWCBC+7sSPKnfdUoUC+qLpnFtVRPdnmhtxhQ@mail.gmail.com>
In-Reply-To: <CAO5Uq5T4NQ=BrHBWCBC+7sSPKnfdUoUC+qLpnFtVRPdnmhtxhQ@mail.gmail.com>
Message-ID: <21754.1676271692934287086@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="e1Z0pZqNcY4S7vZ5WQa3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 07:01:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177086

--e1Z0pZqNcY4S7vZ5WQa3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello Richard,

As we discussed, I checked the build by removing the variables (RUST_BUILD_=
SYS, RUST_HOST_SYS & RUST_TARGET_SYS) from BB_BASEHASH_IGNORE_VARS in meta/=
conf/bitbake.conf file but this doesn't solve the issue, still 2 rmeta file=
s generated.

So, I did a re-check of my analysis w.r.t to commit id - ' e33afcd0dc=C2=A0=
rust-common.bbclass: use built-in rust targets for -native builds '. The 2 =
nd rmeta file is generating by this commit id only and as mentioned earlier=
 there is no diff in the generated sigdata files of libstd-rs & librsvg wit=
h this change.

May be removing vars form BB_BASEHASH_IGNORE_VARS is not a right fix?

FYI... See below generated rmeta files with and without e33afcd0dc.

>=20
> :/3565ea860a-> git reflog
> 3565ea860a (HEAD) HEAD@{0}: checkout: moving from master to 3565ea860a
> aa6cd06a9f (origin/master, origin/HEAD, master) HEAD@{1}: clone: from
> git://git.yoctoproject.org/poky
> :/3565ea860a-> ls
> build/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/recipe-sysroot/usr/l=
ib/rustlib/x86_64-poky-linux-gnu/lib/
> | grep libcore
> libcore- 5c7322bf8f654199.rlib
> libcore- 5c7322bf8f654199.rmeta
>=20

>=20
> :/e33afcd0dc-> git reflog
> e33afcd0dc (HEAD) HEAD@{0}: checkout: moving from master to e33afcd0dc
> aa6cd06a9f (origin/master, origin/HEAD, master) HEAD@{1}: clone: from
> git://git.yoctoproject.org/poky
> :/e33afcd0dc-> ls
> build/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/recipe-sysroot/usr/l=
ib/rustlib/x86_64-poky-linux-gnu/lib/
> | grep libcore
> libcore- c5fc82c620226960.rlib
> libcore- c5fc82c620226960.rmeta
>=20

Sigdata diff:

>=20
> :/e33afcd0dc-> diff -ur build/tmp/stamps/core2-64-poky-linux/libstd-rs/
> ../3565ea860a/build/tmp/stamps/core2-64-poky-linux/libstd-rs/
> Binary files
> build/tmp/stamps/core2-64-poky-linux/libstd-rs/1.64.0-r0.do_compile.sigda=
ta.58c969bdc47351ac51bd19dd76f57855e14940a04ff9bdfbfc5cb92a27172da8
> and
> ../3565ea860a/build/tmp/stamps/core2-64-poky-linux/libstd-rs/1.64.0-r0.do=
_compile.sigdata.58c969bdc47351ac51bd19dd76f57855e14940a04ff9bdfbfc5cb92a27=
172da8
> differ
> ....
> ....
> Binary files
> build/tmp/stamps/core2-64-poky-linux/libstd-rs/1.64.0-r0.do_unpack.sigdat=
a.1203b8d6806ffeb75970f492ece3eaa91c51a79eb411eb075946c482239a69d5
> and
> ../3565ea860a/build/tmp/stamps/core2-64-poky-linux/libstd-rs/1.64.0-r0.do=
_unpack.sigdata.1203b8d6806ffeb75970f492ece3eaa91c51a79eb411eb075946c482239=
a69d5
> differ
>=20

I checked the dumpsig of the above shown differences and the changes are on=
ly in the name of build directory.

Thanks,
Sundeep K.

--e1Z0pZqNcY4S7vZ5WQa3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div class=3D"elementToProof" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; line-heigh=
t: inherit; margin: 0px; padding: 0px; vertical-align: baseline;">
<div class=3D"elementToProof" style=3D"color: #000000; font-family: Calibri=
, Arial, Helvetica, sans-serif; font-size: 12pt; line-height: inherit; bord=
er: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; f=
ont-stretch: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"=
>Hello Richard,</div>
<div class=3D"elementToProof" style=3D"color: #000000; font-family: Calibri=
, Arial, Helvetica, sans-serif; font-size: 12pt; line-height: inherit; bord=
er: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; f=
ont-stretch: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"=
>&nbsp;</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2" =
style=3D"color: #000000; font-family: Calibri, Arial, Helvetica, sans-serif=
; font-size: 12pt; line-height: inherit; border: 0px; font-variant-numeric:=
 inherit; font-variant-east-asian: inherit; font-stretch: inherit; margin: =
0px; padding: 0px; vertical-align: baseline;">As we discussed, I checked th=
e build by removing the variables (RUST_BUILD_SYS, RUST_HOST_SYS &amp; RUST=
_TARGET_SYS) from <em>BB_BASEHASH_IGNORE_VARS</em> in&nbsp;<em>meta/conf/bi=
tbake.conf</em>&nbsp;file but this doesn't solve the issue, still 2 rmeta f=
iles generated.</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2" =
style=3D"color: #000000; font-family: Calibri, Arial, Helvetica, sans-serif=
; font-size: 12pt; line-height: inherit; border: 0px; font-variant-numeric:=
 inherit; font-variant-east-asian: inherit; font-stretch: inherit; margin: =
0px; padding: 0px; vertical-align: baseline;">&nbsp;</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"color: #000000; font-family: Calibri=
, Arial, Helvetica, sans-serif; font-size: 12pt; line-height: inherit; bord=
er: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; f=
ont-stretch: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"=
>So, I did a re-check of my analysis w.r.t to commit id - '<em>e33afcd0dc&n=
bsp;rust-common.bbclass: use built-in rust targets for -native builds</em>'=
. The 2<span style=3D"border: 0px; font: inherit; margin: 0px; padding: 0px=
; vertical-align: baseline; color: inherit;"><span style=3D"position: relat=
ive; font-size: 12px; line-height: 0; vertical-align: baseline; top: -0.5em=
;">nd</span>&nbsp;rmeta file is generating by this commit id only and as me=
ntioned earlier there is no diff in the generated sigdata files of <em>libs=
td-rs</em> &amp; <em>librsvg</em> with this change.</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"line-height: inherit; border: 0px; f=
ont-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretc=
h: inherit; margin: 0px; padding: 0px; vertical-align: baseline;">
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"line-height: inherit; border: 0px; f=
ont-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretc=
h: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><span sty=
le=3D"color: #000000; font-family: Calibri, Arial, Helvetica, sans-serif;">=
<span style=3D"font-size: 16px;">&nbsp;</span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"line-height: inherit; border: 0px; f=
ont-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretc=
h: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><em><span=
 style=3D"color: #000000; font-family: Calibri, Arial, Helvetica, sans-seri=
f;"><span style=3D"font-size: 16px;">May be removing vars form BB_BASEHASH_=
IGNORE_VARS is not a right fix?</span></span></em></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"line-height: inherit; border: 0px; f=
ont-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretc=
h: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><span sty=
le=3D"color: #000000; font-family: Calibri, Arial, Helvetica, sans-serif;">=
<span style=3D"font-size: 16px;">&nbsp;</span></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"line-height: inherit; border: 0px; f=
ont-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretc=
h: inherit; margin: 0px; padding: 0px; vertical-align: baseline;"><span sty=
le=3D"text-decoration: underline;"><span style=3D"color: #000000; font-fami=
ly: Calibri, Arial, Helvetica, sans-serif;"><span style=3D"font-size: 16px;=
">FYI... See below generated rmeta files with and without e33afcd0dc.</span=
></span></span></div>
</div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"color: #333333; font-family: 'Helvet=
ica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: inhe=
rit; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: i=
nherit; font-stretch: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline;">
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"color: inherit; font-family: inherit=
; font-size: 12pt; font-style: inherit; font-variant: inherit; font-weight:=
 inherit; border: 0px; font-stretch: inherit; line-height: inherit; margin:=
 0px; padding: 0px; vertical-align: baseline;">
<blockquote>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';">:/3565ea860a-&gt; gi=
t reflog</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';"><em><span style=3D"f=
ont-weight: bold;">3565ea860a</span>&nbsp;(HEAD) HEAD@{0}: checkout: moving=
 from master to 3565ea860a</em></span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';">aa6cd06a9f (origin/m=
aster, origin/HEAD, master) HEAD@{1}: clone: from git://git.yoctoproject.or=
g/poky</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';">:/3565ea860a-&gt; ls=
 build/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/recipe-sysroot/usr/li=
b/rustlib/x86_64-poky-linux-gnu/lib/ | grep libcore</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';">libcore-<span style=
=3D"font-weight: bold;">5c7322bf8f654199</span>.rlib</span></div>
<div class=3D"elementToProof ContentPasted0 ContentPasted1 ContentPasted2 C=
ontentPasted3 ContentPasted4" style=3D"border: 0px; font-variant-numeric: i=
nherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size:=
 12pt; line-height: inherit; margin: 0px; padding: 0px; vertical-align: bas=
eline;"><span style=3D"font-family: 'helvetica neue';">libcore-<span style=
=3D"font-weight: bold;">5c7322bf8f654199</span>.rmeta</span></div>
</blockquote>
</div>
<div style=3D"line-height: 1.42857;">
<blockquote>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><span style=3D"color: #000000; font-family: Calibri, Arial, Helvet=
ica, sans-serif;"><span style=3D"font-size: 16px;">:/e33afcd0dc-&gt; git re=
flog</span></span></span></div>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><em><span style=3D"color: #000000; font-family: Calibri, Arial, He=
lvetica, sans-serif;"><span style=3D"font-size: 16px;"><span style=3D"font-=
weight: bold;">e33afcd0dc</span>&nbsp;(HEAD) HEAD@{0}: checkout: moving fro=
m master to e33afcd0dc</span></span></em></span></div>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><span style=3D"color: #000000; font-family: Calibri, Arial, Helvet=
ica, sans-serif;"><span style=3D"font-size: 16px;">aa6cd06a9f (origin/maste=
r, origin/HEAD, master) HEAD@{1}: clone: from git://git.yoctoproject.org/po=
ky</span></span></span></div>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><span style=3D"color: #000000; font-family: Calibri, Arial, Helvet=
ica, sans-serif;"><span style=3D"font-size: 16px;">:/e33afcd0dc-&gt; ls bui=
ld/tmp/work/core2-64-poky-linux/librsvg/2.54.5-r0/recipe-sysroot/usr/lib/ru=
stlib/x86_64-poky-linux-gnu/lib/ | grep libcore</span></span></span></div>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><span style=3D"color: #000000; font-family: Calibri, Arial, Helvet=
ica, sans-serif;"><span style=3D"font-size: 16px;">libcore-<span style=3D"f=
ont-weight: bold;">c5fc82c620226960</span>.rlib</span></span></span></div>
<div style=3D"line-height: 1.42857;"><span style=3D"font-family: 'helvetica=
 neue';"><span style=3D"color: #000000; font-family: Calibri, Arial, Helvet=
ica, sans-serif;"><span style=3D"font-size: 16px;">libcore-<span style=3D"f=
ont-weight: bold;">c5fc82c620226960</span>.rmeta</span></span></span></div>
</blockquote>
</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;"><span style=3D"text-decoration: underline;">Sigd=
ata diff:</span><br />
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">
<blockquote>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">:/e33afcd0dc-&gt; diff -ur build/tmp/stamps/core=
2-64-poky-linux/libstd-rs/ ../3565ea860a/build/tmp/stamps/core2-64-poky-lin=
ux/libstd-rs/</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">Binary files build/tmp/stamps/core2-64-poky-linu=
x/libstd-rs/1.64.0-r0.do_compile.sigdata.58c969bdc47351ac51bd19dd76f57855e1=
4940a04ff9bdfbfc5cb92a27172da8 and ../3565ea860a/build/tmp/stamps/core2-64-=
poky-linux/libstd-rs/1.64.0-r0.do_compile.sigdata.58c969bdc47351ac51bd19dd7=
6f57855e14940a04ff9bdfbfc5cb92a27172da8 differ</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">....</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">....</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">Binary files build/tmp/stamps/core2-64-poky-linu=
x/libstd-rs/1.64.0-r0.do_unpack.sigdata.1203b8d6806ffeb75970f492ece3eaa91c5=
1a79eb411eb075946c482239a69d5 and ../3565ea860a/build/tmp/stamps/core2-64-p=
oky-linux/libstd-rs/1.64.0-r0.do_unpack.sigdata.1203b8d6806ffeb75970f492ece=
3eaa91c51a79eb411eb075946c482239a69d5 differ</div>
</blockquote>
</div>
<div style=3D"color: inherit; font-family: inherit; font-size: inherit; fon=
t-style: inherit; font-variant-ligatures: inherit; font-variant-caps: inher=
it; font-weight: inherit;">
<div style=3D"line-height: 1.42857;">I checked the dumpsig of the above sho=
wn differences and the changes are only in the name of build directory.<br =
/><br /><br />Thanks,<br />Sundeep K.</div>
</div>
<div style=3D"line-height: 1.42857;">&nbsp;</div>
</div>
<span style=3D"font-variant-numeric: inherit; font-variant-east-asian: inhe=
rit; font-stretch: inherit; line-height: inherit; border: 0px; margin: 0px;=
 padding: 0px; vertical-align: baseline;"><span class=3D"ContentPasted5" st=
yle=3D"font-variant-numeric: inherit; font-variant-east-asian: inherit; fon=
t-stretch: inherit; line-height: inherit; border: 0px; margin: 0px; padding=
: 0px; vertical-align: baseline; display: inline !important;"><br /></span>=
</span></div>
</div>

--e1Z0pZqNcY4S7vZ5WQa3--

