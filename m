Return-Path: <florian.amstutz@scs.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC459C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 10:15:15 +0000 (UTC)
Subject: [PATCH] devtool: deploy-target: Remove stripped binaries in pseudo
 context
To: openembedded-core@lists.openembedded.org
From: "Florian Amstutz" <florian.amstutz@scs.ch>
X-Originating-Location: Malters, Lucerne, CH (178.197.217.246)
X-Originating-Platform: Windows Chrome 97
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Feb 2022 02:15:14 -0800
Message-ID: <x2nP.1643796914734675638.1xeB@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="gME8kmoDWEn1WLFFPlQz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 10:15:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161188

--gME8kmoDWEn1WLFFPlQz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

deploy-target may fail the second time with "pseudo abort" because
devtool-deploy-target-stripped is deleted outside of pseudo's fakeroot
context.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
---
scripts/lib/devtool/deploy.py | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 833322571f..e14a587417 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -170,7 +170,7 @@ def deploy(args, config, basepath, workspace):
srcdir =3D recipe_outdir
recipe_outdir =3D os.path.join(rd.getVar('WORKDIR'), 'devtool-deploy-target=
-stripped')
if os.path.isdir(recipe_outdir):
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.remove(re=
cipe_outdir, True)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_fakeroot(rd, =
"rm -rf %s" % recipe_outdir, shell=3DTrue)
exec_fakeroot(rd, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdi=
r), shell=3DTrue)
os.environ['PATH'] =3D ':'.join([os.environ['PATH'], rd.getVar('PATH') or '=
'])
oe.package.strip_execs(args.recipename, recipe_outdir, rd.getVar('STRIP'), =
rd.getVar('libdir'),
--
2.25.1

--gME8kmoDWEn1WLFFPlQz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>deploy-target may fail the second time with "pseudo abort" because</di=
v>
<div>devtool-deploy-target-stripped is deleted outside of pseudo's fakeroot=
</div>
<div>context.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Florian Amstutz &lt;florian.amstutz@scs.ch&gt;</div>
<div>---</div>
<div>&nbsp;scripts/lib/devtool/deploy.py | 2 +-</div>
<div>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div>&nbsp;</div>
<div>diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deplo=
y.py</div>
<div>index 833322571f..e14a587417 100644</div>
<div>--- a/scripts/lib/devtool/deploy.py</div>
<div>+++ b/scripts/lib/devtool/deploy.py</div>
<div>@@ -170,7 +170,7 @@ def deploy(args, config, basepath, workspace):</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;srcdir =3D recipe_outd=
ir</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;recipe_outdir =3D os.p=
ath.join(rd.getVar('WORKDIR'), 'devtool-deploy-target-stripped')</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if os.path.isdir(recip=
e_outdir):</div>
<div>-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.utils.remo=
ve(recipe_outdir, True)</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; exec_fakeroot=
(rd, "rm -rf %s" % recipe_outdir, shell=3DTrue)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;exec_fakeroot(rd, "cp =
-af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=3DTrue)</div=
>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;os.environ['PATH'] =3D=
 ':'.join([os.environ['PATH'], rd.getVar('PATH') or ''])</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;oe.package.strip_execs=
(args.recipename, recipe_outdir, rd.getVar('STRIP'), rd.getVar('libdir'),</=
div>
<div>--&nbsp;</div>
<div>2.25.1</div>

--gME8kmoDWEn1WLFFPlQz--

