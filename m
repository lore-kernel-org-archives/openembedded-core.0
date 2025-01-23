Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C124DC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:56:59 +0000 (UTC)
Subject: Re: [PATCH] classes/spdx-common: Fix patch error for recipes that inherit dos2unix.
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 00:56:47 -0800
References: <2a14a7e2d97936c5e0f68a8320bddc20dd4005d7.camel@linuxfoundation.org>
In-Reply-To: <2a14a7e2d97936c5e0f68a8320bddc20dd4005d7.camel@linuxfoundation.org>
Message-ID: <10954.1737622607458995424@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OIP4dSVQNld5B8GJOl2r"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210181

--OIP4dSVQNld5B8GJOl2r
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi RP,

Try to provide to suggestions:

1. Use V2 with DEPENDS changing, and correct do_prepare_recipe_sysroot to a=
dd it before do_patch
but I am not sure modify do_prepare_recipe_sysroot will cause any side effe=
ct or regression
such as:
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -649,7 +649,7 @@ do_prepare_recipe_sysroot[deptask] =3D "do_populate_sys=
root"
python do_prepare_recipe_sysroot () {
bb.build.exec_func("extend_recipe_sysroot", d)
}
-addtask do_prepare_recipe_sysroot before do_configure after do_fetch
+addtask do_prepare_recipe_sysroot before do_configure do_patch after do_fe=
tch

If V2 is acceptable, I will send a patch to modify do_prepare_recipe_sysroo=
t later

2. Use V1 as temporary workaround, until we have a better solution and clea=
n them

//Hongxu

--OIP4dSVQNld5B8GJOl2r
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi RP,</div>
<div>&nbsp;</div>
<div>Try to provide to suggestions:</div>
<div>&nbsp;</div>
<div>1. Use V2 with DEPENDS changing, and correct do_prepare_recipe_sysroot=
 to add it before do_patch</div>
<div>but I am not sure modify do_prepare_recipe_sysroot will cause any side=
 effect or regression</div>
<div>such as:</div>
<div>--- a/meta/classes-global/staging.bbclass<br />+++ b/meta/classes-glob=
al/staging.bbclass<br />@@ -649,7 +649,7 @@ do_prepare_recipe_sysroot[depta=
sk] =3D "do_populate_sysroot"<br />&nbsp;python do_prepare_recipe_sysroot (=
) {<br />&nbsp; &nbsp; &nbsp;bb.build.exec_func("extend_recipe_sysroot", d)=
<br />&nbsp;}<br />-addtask do_prepare_recipe_sysroot before do_configure a=
fter do_fetch<br />+addtask do_prepare_recipe_sysroot before do_configure d=
o_patch after do_fetch</div>
<div>&nbsp;</div>
<div>If V2 is acceptable, I will send a patch to modify do_prepare_recipe_s=
ysroot later</div>
<div>&nbsp;</div>
<div>2. Use V1 as <span data-slate-fragment=3D"JTVCJTdCJTIydHlwZSUyMiUzQSUy=
MnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjJuZTV=
LM29CNjVKJTIyJTJDJTIycGFyYUlkeCUyMiUzQTAlMkMlMjJzcmMlMjIlM0ElMjJ0ZW1wb3JheS=
UyMiUyQyUyMmRzdCUyMiUzQSUyMiVFNCVCOCVCNCVFNiU5NyVCNiUyMiUyQyUyMm1ldGFkYXRhJ=
TIyJTNBJTIyJTIyJTJDJTIybWF0Y2hlcyUyMiUzQW51bGwlMkMlMjJtZXRhRGF0YSUyMiUzQSU1=
QiU1RCUyQyUyMnRleHQlMjIlM0ElMjJ0ZW1wb3JheSUyMiU3RCU1RCU3RCU1RA=3D=3D" style=
=3D"white-space: pre;">temporary</span> workaround, until we have a better =
solution and clean them</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--OIP4dSVQNld5B8GJOl2r--

