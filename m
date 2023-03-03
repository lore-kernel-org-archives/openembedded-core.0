Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A54C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 20:26:29 +0000 (UTC)
Subject: Re: [PATCH] meson: Fix wrapper handling of implicit setup command
To: openembedded-core@lists.openembedded.org
From: "Tom Hochstein" <tom.hochstein@nxp.com>
X-Originating-Location: Texas, US (165.225.33.88)
X-Originating-Platform: Windows Chrome 110
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 03 Mar 2023 12:26:27 -0800
References: <CANNYZj_icOJayS1odPQE4oi1bESHR5gTT=xJS7QA95ijRe=5fg@mail.gmail.com>
In-Reply-To: <CANNYZj_icOJayS1odPQE4oi1bESHR5gTT=xJS7QA95ijRe=5fg@mail.gmail.com>
Message-ID: <2193.1677875187297755462@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="C7yPL8uyvKt7AjvwhXVs"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 20:26:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178023

--C7yPL8uyvKt7AjvwhXVs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 11:08 AM, Alexander Kanavin wrote:

>=20
> This should have been caught by meta/lib/oeqa/sdk/cases/buildepoxy.py
> - why wasn't it? Does the test need to be fixed?

The simple test case doesn't have the problematic syntax. Should I add this=
 to the patch?

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/case=
s/buildepoxy.py
index ee515be188..147ee3e0ee 100644
--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -35,7 +35,7 @@ class EpoxyTest(OESDKTestCase):
self.assertTrue(os.path.isdir(dirs["source"]))
os.makedirs(dirs["build"])

-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D self._run("meson -Degl=
=3Dno -Dglx=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log =3D self._run("meson --warnl=
evel 1 -Degl=3Dno -Dglx=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs)=
)
# Check that Meson thinks we're doing a cross build and not a native
self.assertIn("Build type: cross build", log)
self._run("ninja -C {build} -v".format(**dirs))

--C7yPL8uyvKt7AjvwhXVs
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 11:08 AM, Alexander Kanavin wrote:<br />
<blockquote>This should have been caught by meta/lib/oeqa/sdk/cases/buildep=
oxy.py<br />- why wasn't it? Does the test need to be fixed?</blockquote>
The simple test case doesn't have the problematic syntax. Should I add this=
 to the patch?<br /><br />
<div>diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk=
/cases/buildepoxy.py</div>
<div>index ee515be188..147ee3e0ee 100644</div>
<div>--- a/meta/lib/oeqa/sdk/cases/buildepoxy.py</div>
<div>+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py</div>
<div>@@ -35,7 +35,7 @@ class EpoxyTest(OESDKTestCase):</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(os.pat=
h.isdir(dirs["source"]))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;os.makedirs(dirs["buil=
d"])</div>
<div>&nbsp;</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; log =3D self._run("meson -D=
egl=3Dno -Dglx=3Dno -Dx11=3Dfalse {build} {source}".format(**dirs))</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; log =3D self._run("meson --=
warnlevel 1 -Degl=3Dno -Dglx=3Dno -Dx11=3Dfalse {build} {source}".format(**=
dirs))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# Check that Meson thi=
nks we're doing a cross build and not a native</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertIn("Build t=
ype: cross build", log)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self._run("ninja -C {b=
uild} -v".format(**dirs))</div>
<div>&nbsp;</div>

--C7yPL8uyvKt7AjvwhXVs--

