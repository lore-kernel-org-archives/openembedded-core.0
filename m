Return-Path: <ohnatiuk@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5107C3ABC9
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 10:30:21 +0000 (UTC)
Subject: Re: [PATCH] package: disable renamed dependency error if allarch is overridden
To: openembedded-core@lists.openembedded.org
From: "Oleksandr Hnatiuk" <ohnatiuk@cisco.com>
X-Originating-Location: London, England, GB (64.103.40.18)
X-Originating-Platform: Linux Firefox 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 13 May 2025 03:30:13 -0700
References: <CANNYZj96qMX_tZf-yu+jSac6R3+_BqjigTO=4kvkuSW=ja-G4A@mail.gmail.com>
In-Reply-To: <CANNYZj96qMX_tZf-yu+jSac6R3+_BqjigTO=4kvkuSW=ja-G4A@mail.gmail.com>
Message-ID: <1013.1747132213222480212@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="tdbAizH7qH1XYXNoNqgR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 10:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216409

--tdbAizH7qH1XYXNoNqgR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I will have to check why such packages are included.

However, consider the following. Here are all the parts of this issue:
* a packagegroup explicitly inherits packagegroup and nativesdk classes
* same packagegroup depends on a package which is subject to dynamic packag=
e renaming
* packagegroup.bbclass unconditionally (because of immediate expansion) inh=
erits allarch.bbclass
* nativesdk.bbclass overrides PACKAGE_ARCH with correct value, preventing c=
ode in allarch.bbclass from executing (because allarch.bbclass tests this v=
ariable before doing anything)
* bitbake raises an allarch-specific error by testing whether allarch was e=
ver inherited instead of whether any of its code was executed (see 4)

Regardless of whether 2 is justified, the behavior in 3 and/or 5 is seems i=
ncorrect.
allarch.bbclass is unique in that we cannot test if it is really used witho=
ut checking the value of PACKAGE_ARCH.
If we simply check via bb.data.inherits_class, we get false positives (agai=
n, see step 4).
Thus, it is incorrect to issue an error for packagegroups that inherit alla=
rch without also verifying that they are actually allarch via PACKAGE_ARCH.
Without this extra check, the error is produced for packagegroups for which=
 code in allarch.bbclass was never and will never be executed.

--tdbAizH7qH1XYXNoNqgR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>I will have to check why such packages are included.</div>
<div><br />However, consider the following. Here are all the parts of this =
issue:</div>
<ol>
<li>a packagegroup explicitly inherits packagegroup and nativesdk classes</=
li>
<li>same packagegroup depends on a package which is subject to dynamic pack=
age renaming</li>
<li>packagegroup.bbclass unconditionally (because of immediate expansion) i=
nherits allarch.bbclass</li>
<li>nativesdk.bbclass overrides PACKAGE_ARCH with correct value, preventing=
 code in allarch.bbclass from executing (because allarch.bbclass tests this=
 variable before doing anything)</li>
<li>bitbake raises an allarch-specific error by testing whether allarch was=
 ever inherited instead of whether any of its code was executed (see 4)</li=
>
</ol>
<div>&nbsp;</div>
<div>Regardless of whether 2 is justified, the behavior in 3 and/or 5 is se=
ems incorrect.<br />allarch.bbclass is unique in that we cannot test if it =
is really used without checking the value of PACKAGE_ARCH.<br />If we simpl=
y check via bb.data.inherits_class, we get false positives (again, see step=
 4).<br />Thus, it is incorrect to issue an error for packagegroups that in=
herit allarch without also verifying that they are actually allarch via PAC=
KAGE_ARCH.<br />Without this extra check, the error is produced for package=
groups for which code in allarch.bbclass was never and will never be execut=
ed.</div>
</div>

--tdbAizH7qH1XYXNoNqgR--

