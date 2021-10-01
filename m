Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F68C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 10:11:14 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.5967.1633083072886422775
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 03:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SrxmwWa+;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id q23so7478327pfs.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=rtucD7ThulSOrenL4USmzxps1kMmNBulRgT5xuTWGOQ=;
        b=SrxmwWa+GmHptus+l1ljSsL+rYqYMBKPVuLAvMoyglhr4SpZc72LNHkwGnnqwmabDh
         4ZEOWfBPezyuhQODMZUVfMXIvxbWrWlP0Qu+muzmEoYfOmvvEYj086WCgf/Rw+2SJkBP
         zIe9YEtLU+aFzNf3ggyXIU2NZ/mFh1V9jPh5PwEPgTIHv4MlmVZ6YQgZBI6b/TfU1RjL
         Jsj9ZUtzoZGieGNuKH6i6suepdNwyZW76YmQQOSPDObKmTTIVoO8QbquTP9+5sqXOgKw
         Iv6gUGVsdkLPd+g+mdiS6MAJs8B2i9h3srkFmf1UMMw4k8dRy+YjmfZdUpYHMLTJCgOi
         axnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=rtucD7ThulSOrenL4USmzxps1kMmNBulRgT5xuTWGOQ=;
        b=QX+h4IbeQh4kwPCakW5dkvDV/E6uAtKiRsU8wo2GWMPlPHhdzMuG+gJN17tBskop9e
         ijYqvwEPGF2QLbpBVquQnXu0LgFf9TT+MZyKGk92NJFfqmgC3s1szFlKIXCVoseyqjHQ
         ItoDwAFkOgEjeDkqMd55MeWdkDgAmoWlk966OzS7AWlpZU5xwfjMgsC5P7W58B3CMN7o
         IgGAzzgQFk7Yelks98nXthIT/RNUX8wimivbMB3pK7kcsQGNGKfQQqy2StmJtJS8TwZk
         oqzIUC2IfTxxczsE90Wui10Fwjqa+aBJInmBY473FDZkNLRiUhnZJMKLcq4trtpUzsfL
         wl1w==
X-Gm-Message-State: AOAM532rfOmP+g3rs9/+Y2PLvxsNbxcwryCxPhCpcnpZok7YjelOHSIK
	XISwfBZl9mKcmV9N8YozZohk6C8zgXVXEfvyhQQ=
X-Google-Smtp-Source: 
 ABdhPJwd2H8Q/Fnf/1WlR4FojsTLtYW0bVUD4b6vkS9jqZMTiXTteLTeiHbo9hMkJ5NPpu+r4hSmerCOaF3IxMdL7Fo=
X-Received: by 2002:aa7:93c9:0:b0:43c:f4f5:aac2 with SMTP id
 y9-20020aa793c9000000b0043cf4f5aac2mr9089587pff.11.1633083072368; Fri, 01 Oct
 2021 03:11:12 -0700 (PDT)
MIME-Version: 1.0
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 1 Oct 2021 12:11:01 +0200
Message-ID: 
 <CA+chaQfAM1TP5LLKgoF4z6Stz8q7GQ1-9ZBNAFEJZ+Age0uhGw@mail.gmail.com>
Subject: rust-cross being effectively MACHINE_ARCH
To: Randy MacLeod <randy.macleod@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006b319105cd47c8e9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 10:11:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156516

--0000000000006b319105cd47c8e9
Content-Type: text/plain; charset="UTF-8"

Hi,

rust-cross-* imported from meta-rust has incorrect signatures, depending on
MACHINEOVERRIDES making it effectively MACHINE_ARCH

as shown by sstate-diff-machines.sh:

  oe-core$ openembedded-core/scripts/sstate-diff-machines.sh
--tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm"
--targets=rust-cross-i686 --analyze

   === Comparing signatures for task do_populate_sysroot.sigdata between
qemux86 and qemux86copy ===
  ERROR: rust-cross-i686 different signature for task
do_populate_sysroot.sigdata between qemux86 and qemux86copy
  NOTE: Reconnecting to bitbake server...
  Hash for dependent task rust/rust-cross_1.54.0.bb:do_install changed from
37177b89e1a76ec6909e82b96628d18981e1364707419717bff49b778eba04b6 to
b7291126cd73c139372aa5fa32fa78be1882005ac62110513dec609d30fbb2ba
  Unable to find matching sigdata for
/OE/build/oe-core/meta-rust/recipes-devtools/rust/rust-cross_1.54.0.bb:do_install
with hashes
37177b89e1a76ec6909e82b96628d18981e1364707419717bff49b778eba04b6 or
b7291126cd73c139372aa5fa32fa78be1882005ac62110513dec609d30fbb2ba
  ...
  ERROR: 2 issues were found in these recipes: rust-cross-i686
  INFO: Output written in:
/OE/build/oe-core/tmp-glibc/sstate-diff/1633081880

  oe-core$ bitbake-diffsigs
/OE/build/oe-core/tmp-glibc/sstate-diff/1633081880/qemu*/*/rust-cross*/*do_rust_gen_targets*
  NOTE: Reconnecting to bitbake server...
  basehash changed from
ece96c782bdfbeaabfb3e9c7e30e4713afa1ed4f1f208f3adcbf0f10f1c25114 to
87bc2d064dc9b7cdd6d91598f8660238ef345385ac4df7474edf918223e6e779
  Variable MACHINE value changed from 'qemux86copy' to 'qemux86'
  Variable MACHINEOVERRIDES value changed:
  @@ -1,3 +1,3 @@
  -${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',
d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '',
d)}qemuall:${MACHINE}:qemux86
  +${@bb.utils.contains('TUNE_FEATURES', 'mx32', 'x86-x32:', '',
d)}${@bb.utils.contains('TUNE_FEATURES', 'm32', 'x86:', '',
d)}qemuall:${MACHINE}
   TUNE_FEATURES{m32} = Set
   TUNE_FEATURES{mx32} = Unset

Just dropping the suspiciously looking MACHINEOVERRIDES
from meta/classes/rust-common.bbclass
and meta/recipes-devtools/rust/rust-common.inc isn't as easy, because it
was introduced in:
https://github.com/meta-rust/meta-rust/commit/186ec59085be9282ad56541356b7e3d3609e5075
https://github.com/meta-rust/meta-rust/commit/cb4f8294d4b2037e80ff772c985f5ee370e7c956
because of this oe-core change in warrior:
https://github.com/openembedded/openembedded-core/commit/ac83d22eb5031f7fdd09d34a1a46d92fd3e39a3c

and the reason is still valid, e.g. for qemuarm:
$ grep TUNE_FEATURES= env.rust-cross-arm
TUNE_FEATURES="arm vfp cortexa15 neon thumb callconvention-hard"
$ grep MACHINEOVERRIDES= env.rust-cross-arm
MACHINEOVERRIDES="qemuall:armv7ve:qemuarm"

Some other way to detect v7 target should be implemented and now when it's
in oe-core and doesn't need the backwards compatibility with pre-warrior
releases, we probably don't need to look at both TUNE_FEATURES and
MACHINEOVERRIDES when doing that.

--0000000000006b319105cd47c8e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>rust-cross-* imported from meta-rus=
t has incorrect signatures, depending on MACHINEOVERRIDES making it effecti=
vely MACHINE_ARCH</div><div><br></div><div>as shown by sstate-diff-machines=
.sh:</div><div><br></div><div>=C2=A0 oe-core$ openembedded-core/scripts/sst=
ate-diff-machines.sh --tmpdir=3Dtmp-glibc --machines=3D&quot;qemux86 qemux8=
6copy qemuarm&quot; --targets=3Drust-cross-i686 --analyze<br><br>=C2=A0 =C2=
=A0=3D=3D=3D Comparing signatures for task do_populate_sysroot.sigdata betw=
een qemux86 and qemux86copy =3D=3D=3D<br>=C2=A0 ERROR: rust-cross-i686 diff=
erent signature for task do_populate_sysroot.sigdata between qemux86 and qe=
mux86copy<br>=C2=A0 NOTE: Reconnecting to bitbake server...<br>=C2=A0 Hash =
for dependent task rust/rust-cross_1.54.0.bb:do_install changed from 37177b=
89e1a76ec6909e82b96628d18981e1364707419717bff49b778eba04b6 to b7291126cd73c=
139372aa5fa32fa78be1882005ac62110513dec609d30fbb2ba<br>=C2=A0 Unable to fin=
d matching sigdata for /OE/build/oe-core/meta-rust/recipes-devtools/rust/ru=
st-cross_1.54.0.bb:do_install with hashes 37177b89e1a76ec6909e82b96628d1898=
1e1364707419717bff49b778eba04b6 or b7291126cd73c139372aa5fa32fa78be1882005a=
c62110513dec609d30fbb2ba<br>=C2=A0 ...<br>=C2=A0 ERROR: 2 issues were found=
 in these recipes: rust-cross-i686<br>=C2=A0 INFO: Output written in: /OE/b=
uild/oe-core/tmp-glibc/sstate-diff/1633081880<br><br>=C2=A0 oe-core$ bitbak=
e-diffsigs /OE/build/oe-core/tmp-glibc/sstate-diff/1633081880/qemu*/*/rust-=
cross*/*do_rust_gen_targets*<br>=C2=A0 NOTE: Reconnecting to bitbake server=
...<br>=C2=A0 basehash changed from ece96c782bdfbeaabfb3e9c7e30e4713afa1ed4=
f1f208f3adcbf0f10f1c25114 to 87bc2d064dc9b7cdd6d91598f8660238ef345385ac4df7=
474edf918223e6e779<br>=C2=A0 Variable MACHINE value changed from &#39;qemux=
86copy&#39; to &#39;qemux86&#39;<br>=C2=A0 Variable MACHINEOVERRIDES value =
changed:<br>=C2=A0 @@ -1,3 +1,3 @@<br>=C2=A0 -${@bb.utils.contains(&#39;TUN=
E_FEATURES&#39;, &#39;mx32&#39;, &#39;x86-x32:&#39;, &#39;&#39;, d)}${@bb.u=
tils.contains(&#39;TUNE_FEATURES&#39;, &#39;m32&#39;, &#39;x86:&#39;, &#39;=
&#39;, d)}qemuall:${MACHINE}:qemux86<br>=C2=A0 +${@bb.utils.contains(&#39;T=
UNE_FEATURES&#39;, &#39;mx32&#39;, &#39;x86-x32:&#39;, &#39;&#39;, d)}${@bb=
.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;m32&#39;, &#39;x86:&#39;, &#3=
9;&#39;, d)}qemuall:${MACHINE}<br>=C2=A0 =C2=A0TUNE_FEATURES{m32} =3D Set<b=
r>=C2=A0 =C2=A0TUNE_FEATURES{mx32} =3D Unset<br></div><div><br></div><div>J=
ust dropping the suspiciously looking MACHINEOVERRIDES from=C2=A0meta/class=
es/rust-common.bbclass and=C2=A0meta/recipes-devtools/rust/rust-common.inc =
isn&#39;t as easy, because it was introduced in:</div><div><a href=3D"https=
://github.com/meta-rust/meta-rust/commit/186ec59085be9282ad56541356b7e3d360=
9e5075">https://github.com/meta-rust/meta-rust/commit/186ec59085be9282ad565=
41356b7e3d3609e5075</a><br></div><div><a href=3D"https://github.com/meta-ru=
st/meta-rust/commit/cb4f8294d4b2037e80ff772c985f5ee370e7c956">https://githu=
b.com/meta-rust/meta-rust/commit/cb4f8294d4b2037e80ff772c985f5ee370e7c956</=
a><br></div><div>because of this oe-core change in warrior:</div><div><a hr=
ef=3D"https://github.com/openembedded/openembedded-core/commit/ac83d22eb503=
1f7fdd09d34a1a46d92fd3e39a3c">https://github.com/openembedded/openembedded-=
core/commit/ac83d22eb5031f7fdd09d34a1a46d92fd3e39a3c</a><br></div><div><br>=
</div><div>and the reason is still valid, e.g. for qemuarm:</div><div>$ gre=
p TUNE_FEATURES=3D env.rust-cross-arm <br>TUNE_FEATURES=3D&quot;arm vfp cor=
texa15 neon thumb callconvention-hard&quot;<br>$ grep MACHINEOVERRIDES=3D e=
nv.rust-cross-arm <br>MACHINEOVERRIDES=3D&quot;qemuall:armv7ve:qemuarm&quot=
;<br></div><div><br></div><div>Some other way to detect v7 target should be=
 implemented and now when it&#39;s in oe-core and doesn&#39;t need the back=
wards compatibility with pre-warrior releases, we probably don&#39;t need t=
o look at both TUNE_FEATURES and MACHINEOVERRIDES when doing that.</div></d=
iv>

--0000000000006b319105cd47c8e9--

