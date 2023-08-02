Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997DDC04E69
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 16:08:16 +0000 (UTC)
Subject: Re: [PATCH] kernel: Don't fail if Modules.symvers doesn't exist
To: openembedded-core@lists.openembedded.org
From: "Andrew Geissler" <geissonator@gmail.com>
X-Originating-Location: Brunswick, Maine, US (75.68.245.129)
X-Originating-Platform: Mac Firefox 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Aug 2023 09:08:13 -0700
References: <CADkTA4MxqDTacjdsJkN6Gxf8PMmqV5iy6_0e-Umn5BDjybDbPA@mail.gmail.com>
In-Reply-To: <CADkTA4MxqDTacjdsJkN6Gxf8PMmqV5iy6_0e-Umn5BDjybDbPA@mail.gmail.com>
Message-ID: <5783.1690992493049046066@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="pCl4JSFIrDc4IaASg5g8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 16:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185414

--pCl4JSFIrDc4IaASg5g8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 06:38 AM, Bruce Ashfield wrote:

>=20
> On Wed, Aug 2, 2023 at 9:15=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrot=
e:
>=20
>> On Wed, 2 Aug 2023 at 12:45, Fr=C3=A9d=C3=A9ric Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>>=20
>>>=20
>>>=20
>>> On Wed, 2 Aug 2023 at 13:47, Joel Stanley <joel@jms.id.au> wrote:
>>>=20
>>>> The one liner tests using `[ ] && action` need to have || true after t=
he
>>>> action,
>>>> otherwise the line returns false and the recipie fails.
>>>>=20
>>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>>> ---
>>>> meta/classes-recipe/kernel.bbclass | 4 ++--
>>>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/meta/classes-recipe/kernel.bbclass
>>>> b/meta/classes-recipe/kernel.bbclass
>>>> index 247ef4a48aa7..f1bc41e82be8 100644
>>>> --- a/meta/classes-recipe/kernel.bbclass
>>>> +++ b/meta/classes-recipe/kernel.bbclass
>>>> @@ -486,7 +486,7 @@ kernel_do_install() {
>>>> install -m 0644 System.map
>>>> ${D}/${KERNEL_IMAGEDEST}/System.map-${KERNEL_VERSION}
>>>> install -m 0644 .config ${D}/${KERNEL_IMAGEDEST}/config-${KERNEL_VERSI=
ON}
>>>> install -m 0644 vmlinux ${D}/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERS=
ION}
>>>>=20
>>>> - [ -e Module.symvers ] && install -m 0644 Module.symvers
>>>> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION}
>>>> + [ -e Module.symvers ] && install -m 0644 Module.symvers
>>>> ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true
>>>> }
>>>=20
>>> By doing that, you simply silent possible error of the action after the
>>> test, below is a little snippet showing that
>>=20
>> Sure. But the test is looking for the file, so if it doesn't exist
>> then the command install won't run.
>=20
> Something doesn't seem quite right, that test for Module.symvers (there
> and in the shared workdir code) were put in place for the scenario
> you are mentioning .. if Modules are disabled and hence Module.symvers
> doesn't
> exist.
>=20
> At one point, we even tested that sort of configuration.
>=20
> I didn't dig more through the logs, but maybe we had lines after that
> command
> previously, so the last return code wasn't a failure and hence no task
> failure.

Yep, this is what happened, there used to be these 2 lines after it:

install -d ${D}${sysconfdir}/modprobe.d

install -d ${D}${sysconfdir}/modules-load.d

https://gerrit.openbmc.org/c/openbmc/openbmc/+/65313/3/poky/meta/classes-re=
cipe/kernel.bbclass

Once these were removed we started hitting this failure over in OpenBMC.

--pCl4JSFIrDc4IaASg5g8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 06:38 AM, Bruce Ashfield wrote:<br />
<blockquote>On Wed, Aug 2, 2023 at 9:15=E2=80=AFAM Joel Stanley &lt;joel@jm=
s.id.au&gt; wrote:<br />
<blockquote>On Wed, 2 Aug 2023 at 12:45, Fr&eacute;d&eacute;ric Martinsons<=
br />&lt;frederic.martinsons@gmail.com&gt; wrote:<br />
<blockquote><br /><br />On Wed, 2 Aug 2023 at 13:47, Joel Stanley &lt;joel@=
jms.id.au&gt; wrote:<br />
<blockquote>The one liner tests using `[ ] &amp;&amp; action` need to have =
|| true after the action,<br />otherwise the line returns false and the rec=
ipie fails.<br /><br />Signed-off-by: Joel Stanley &lt;joel@jms.id.au&gt;<b=
r />---<br />meta/classes-recipe/kernel.bbclass | 4 ++--<br />1 file change=
d, 2 insertions(+), 2 deletions(-)<br /><br />diff --git a/meta/classes-rec=
ipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass<br />index 247ef4a4=
8aa7..f1bc41e82be8 100644<br />--- a/meta/classes-recipe/kernel.bbclass<br =
/>+++ b/meta/classes-recipe/kernel.bbclass<br />@@ -486,7 +486,7 @@ kernel_=
do_install() {<br />install -m 0644 System.map ${D}/${KERNEL_IMAGEDEST}/Sys=
tem.map-${KERNEL_VERSION}<br />install -m 0644 .config ${D}/${KERNEL_IMAGED=
EST}/config-${KERNEL_VERSION}<br />install -m 0644 vmlinux ${D}/${KERNEL_IM=
AGEDEST}/vmlinux-${KERNEL_VERSION}<br />- [ -e Module.symvers ] &amp;&amp; =
install -m 0644 Module.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KE=
RNEL_VERSION}<br />+ [ -e Module.symvers ] &amp;&amp; install -m 0644 Modul=
e.symvers ${D}/${KERNEL_IMAGEDEST}/Module.symvers-${KERNEL_VERSION} || true=
<br />}</blockquote>
By doing that, you simply silent possible error of the action after the tes=
t, below is a little snippet showing that</blockquote>
Sure. But the test is looking for the file, so if it doesn't exist<br />the=
n the command install won't run.</blockquote>
Something doesn't seem quite right, that test for Module.symvers (there<br =
/>and in the shared workdir code) were put in place for the scenario<br />y=
ou are mentioning .. if Modules are disabled and hence Module.symvers doesn=
't<br />exist.<br /><br />At one point, we even tested that sort of configu=
ration.<br /><br />I didn't dig more through the logs, but maybe we had lin=
es after that command<br />previously, so the last return code wasn't a fai=
lure and hence no task<br />failure.</blockquote>
Yep, this is what happened, there used to be these 2 lines after it:<br /><=
br />
<div id=3D"left-content-487" class=3D"gr-diff contentText" data-side=3D"lef=
t"><span class=3D"gr-diff tab" style=3D"tab-size: 4; -moz-tab-size: 4;"> </=
span>install -d ${D}${sysconfdir}/modprobe.d</div>
<table id=3D"diffTable" class=3D"responsive selected-left">
<tbody class=3D"gr-diff section delta total">
<tr class=3D"gr-diff diff-row side-by-side" tabindex=3D"-1" aria-labelledby=
=3D"left-button-486 left-content-486">
<td class=3D"gr-diff content left no-intraline-info remove">
<div id=3D"left-content-486" class=3D"gr-diff contentText" data-side=3D"lef=
t">install -d ${D}${sysconfdir}/modules-load.d</div>
</td>
</tr>
</tbody>
</table>
<p><br />https://gerrit.openbmc.org/c/openbmc/openbmc/+/65313/3/poky/meta/c=
lasses-recipe/kernel.bbclass</p>
<br />Once these were removed we started hitting this failure over in OpenB=
MC.

--pCl4JSFIrDc4IaASg5g8--

