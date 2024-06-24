Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B867AC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 03:59:58 +0000 (UTC)
Subject: Re: Rust reproducibility issue summary
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.251.137)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 23 Jun 2024 20:59:57 -0700
References: <CANNYZj8ya8btVw9JspAHGA_iHpsydRTncHyLoGmPW-9=rpEhTQ@mail.gmail.com>
In-Reply-To: <CANNYZj8ya8btVw9JspAHGA_iHpsydRTncHyLoGmPW-9=rpEhTQ@mail.gmail.com>
Message-ID: <2056.1719201597345518399@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NxkOZlL3FhgtgKn9kM6P"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 03:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201063

--NxkOZlL3FhgtgKn9kM6P
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I've a local reproducer for this issue. Below are a few observations with m=
y analysis.
- The deviation in rustdoc binary are because of the different hash-id gene=
rated between the build (as explained above - https://lists.openembedded.or=
g/g/openembedded-core/message/200238)
- The hash-id generates identically when the rust built from it's sources e=
very time.
- During the oe-selftest triggered, when the issue reproduced I can see the=
re are reproducibleA & reproducibleB directories are generated.
But, the rust is not built from sources on both directories beacuse of Sets=
cene Tasks and Shared State. (reproducibleB directory has rust sources buil=
t and reproducibleA has setscene realted data copied the files into it from=
 sstate and so, no rust sources are cloned & build into it)
- The above case not always happening with oe-selftest, when the test passe=
d I can see the reproducibleA also has rust sources pulled and built, in th=
is case rustdoc generates identically.
- When the issue reproduced, I did a check on the sstate sigdata to find an=
y deviations but those sig's are identical.
- Also, when the test failed, I tried to find the unique hash-id's generate=
d in rustdoc in the generated rlibs of rust. I could only find one hash-id =
in rlibs where the rust sources are actually built. The other hash-id not f=
ound in rlibs of reproducibleA/B.
- The ' diff .../reproducibleA/tmp/work/core2-64-poky-linux/rust/1.75.0/tem=
p/depsig.do_package_write_deb .../reproducibleB/tmp/work/core2-64-poky-linu=
x/rust/1.75.0/temp/depsig.do_package_write_deb ' shows -
8c8
< -rw-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015932884 6a6618ccfc17=
1ea507ad39eb95bc239116b5f5c9e85a50ce9de3b43c73ff17d7./deploy-debs/core2-64/=
rust-dbg_1.75.0-r0_amd64.deb
---
> -rw-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015932940 4dcbe007aa8d=
46e658f95a3651938d67ca5cd55409c503861f365cb9c38f14e7./deploy-debs/core2-64/=
rust-dbg_1.75.0-r0_amd64.deb
11c11
< -rw-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2902068 564925753476=
842ea9052311afa27cbc099136113ea9f5394b5554eccb09e8f3./deploy-debs/core2-64/=
rust-rustdoc_1.75.0-r0_amd64.deb
---
> -rw-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2901612 c0cd05fe3444=
00c0a9d31fecd808c3152481f35dacc0556c006b88a239209358./deploy-debs/core2-64/=
rust-rustdoc_1.75.0-r0_amd64.deb

I am not sure of what that diff indicates.

Can I get some pointers on -
1. Why only sometimes the setscene setting on reproducibleA (which causes r=
ust sources not to rebuilt)
2. Is there any way/tool to analyze the above depsig data or what is going-=
on with setscene.

This helps to identify the issue is happening due to sstate? if not I can l=
ook into rust.

--NxkOZlL3FhgtgKn9kM6P
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hello,</div>
<div>&nbsp;</div>
<div>I've a local reproducer for this issue. Below are a few observations w=
ith my analysis.</div>
<div>- The deviation in <em>rustdoc </em>binary are because of the differen=
t hash-id generated between the build (as explained above - https://lists.o=
penembedded.org/g/openembedded-core/message/200238)</div>
<div>- The hash-id generates identically when the rust built from it's sour=
ces every time.</div>
<div>- During the oe-selftest triggered, when the issue reproduced I can se=
e there are reproducibleA &amp; reproducibleB directories are generated.</d=
iv>
<div>&nbsp; But, the rust is not built from sources on both directories bea=
cuse of Setscene Tasks and Shared State. (reproducibleB directory has rust =
sources built and reproducibleA has setscene realted data copied the files =
into it from sstate and so, no rust sources are cloned &amp; build into it)=
</div>
<div>- The above case not always happening with oe-selftest, when the test =
passed I can see the reproducibleA also has rust sources pulled and built, =
in this case <em>rustdoc </em>generates identically.</div>
<div>- When the issue reproduced, I did a check on the sstate sigdata to fi=
nd any deviations but those sig's are identical.</div>
<div>- Also, when the test failed, I tried to find the unique hash-id's gen=
erated in rustdoc in the generated rlibs of rust. I could only find one has=
h-id in rlibs where the rust sources are actually built. The other hash-id =
not found in rlibs of reproducibleA/B.</div>
<div>- The '<em>diff .../reproducibleA/tmp/work/core2-64-poky-linux/rust/1.=
75.0/temp/depsig.do_package_write_deb .../reproducibleB/tmp/work/core2-64-p=
oky-linux/rust/1.75.0/temp/depsig.do_package_write_deb</em>' shows -</div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>8c8</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&lt; -rw-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;15932884 =
<em>6a6618ccfc171ea507ad39eb95bc239116b5f5c9e85a50ce9de3b43c73ff17d7 </em>.=
/deploy-debs/core2-64/rust-dbg_1.75.0-r0_amd64.deb</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>---</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&gt; -rw-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;15932940 =
<em>4dcbe007aa8d46e658f95a3651938d67ca5cd55409c503861f365cb9c38f14e7 </em>.=
/deploy-debs/core2-64/rust-dbg_1.75.0-r0_amd64.deb</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>11c11</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&lt; -rw-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2902068 =
<em>564925753476842ea9052311afa27cbc099136113ea9f5394b5554eccb09e8f3 </em>.=
/deploy-debs/core2-64/rust-rustdoc_1.75.0-r0_amd64.deb</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>---</span></div>
<div><span style=3D"white-space: normal;"><span style=3D"white-space: pre;"=
> </span>&gt; -rw-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2901612 =
<em>c0cd05fe344400c0a9d31fecd808c3152481f35dacc0556c006b88a239209358 </em>.=
/deploy-debs/core2-64/rust-rustdoc_1.75.0-r0_amd64.deb</span></div>
<div>&nbsp;</div>
<div>I am not sure of what that diff indicates.</div>
<div>&nbsp;</div>
<div><span style=3D"text-decoration: underline;">Can I get some pointers on=
 -</span></div>
<div>1. Why only sometimes the setscene setting on reproducibleA (which cau=
ses rust sources not to rebuilt)</div>
<div>2. Is there any way/tool to analyze the above depsig data or what is g=
oing-on with setscene.</div>
<div>&nbsp;</div>
<div>This helps to identify the issue is happening due to sstate? if not I =
can look into rust.</div>
<div>&nbsp;</div>

--NxkOZlL3FhgtgKn9kM6P--

