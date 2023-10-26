Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486BDC25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 13:50:07 +0000 (UTC)
Subject: Re: [PATCH 1/2] distcc: Fix groupname gid change warning
To: openembedded-core@lists.openembedded.org
From: "JD Schroeder" <sweng5080@gmail.com>
X-Originating-Location: US (204.77.163.55)
X-Originating-Platform: Linux Chrome 118
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 26 Oct 2023 06:50:03 -0700
References: <4e91e1a677bf0e5e2799a982501d7b4cb81a485f.camel@linuxfoundation.org>
In-Reply-To: <4e91e1a677bf0e5e2799a982501d7b4cb81a485f.camel@linuxfoundation.org>
Message-ID: <6763.1698328203367625894@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="FUFYIFYPvExyFxo3P8dA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 13:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189727

--FUFYIFYPvExyFxo3P8dA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 09:01 AM, Richard Purdie wrote:

>=20
> On Wed, 2023-09-27 at 06:07 -0700, JD Schroeder wrote:
>=20
>> On Tue, Sep 12, 2023 at 06:03 AM, Ross Burton wrote:
>>=20
>>> On 1 Sep 2023, at 11:03, Alexandre Belloni via
>>> lists.openembedded.org
>>> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>>>=20
>>>>=20
>>>> Hello,
>>>>=20
>>>> This fails on the autobuilders:
>>>>=20
>>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/344=
9/steps/12/logs/stdio
>>>>=20
>>>>=20
>>>> ERROR: Nothing RPROVIDES 'distcc' (but /home/pokybuild/yocto-
>>>> worker/reproducible/build/meta/recipes-
>>>> core/packagegroups/packagegroup-self-hosted.bb,
>>>> /home/pokybuild/yocto-worker/reproducible/build/meta/recipes-
>>>> devtools/devel-config/distcc-config.bb RDEPENDS on or otherwise
>>>> requires it)
>>>> distcc was skipped: Recipe distcc, package distcc-server: system
>>>> groupname "nogroup" does not have a static ID defined. Add
>>>> nogroup to one of these files: /home/pokybuild/yocto-
>>>> worker/reproducible/build/build-st/meta-selftest/files/static-
>>>> group
>>>=20
>>> The same problem would hit the ppp-dialin but that recipe doesn=E2=80=
=99t
>>> get built in the AB in an environment that has static IPs.
>>>=20
>>> Ross
>>=20
>> I'm seeing the the warnings being generated in a multi-config Yocto
>> build environment. Is there another way to address and fix the
>> warnings I am having with the distcc and ppp-dialin recipes (possibly
>> during parsing) even if they aren't being built in the AB with static
>> IPs?
>=20
> It might help if you could describe how to reproduce the problem you're
> seeing?
>=20
> "nogroup" should already exist in the underlying base-passwd file so we
> really need to understand why that isn't working. The patch appears
> just to mask the real problem.
>=20
> Cheers,
>=20
> Richard

Sorry, it has taken a while for me to get back to this. I'm still seeing th=
ese warnings:

WARNING: yocto-4.0/poky/meta/recipes-devtools/distcc/distcc_3.4.bb: distcc:=
 Changing groupname nogroup's gid from (1018) to (65534), verify configurat=
ion files!

WARNING: yocto-4.0/poky/meta/recipes-connectivity/ppp-dialin/ppp-dialin_0.1=
.bb: ppp-dialin: Changing groupname nogroup's gid from (1019) to (65534), v=
erify configuration files!

The "nogroup" *does* exist in base-passed in group.master with "nogroup:*:6=
5534:"

So it appears that something is originally setting the nogroup's gid to 101=
8 as the distcc recipe is parsed and later it gets changed to 65534 which c=
auses the warning.

My patch fixes the warning and probably is not addressing the underlying pr=
oblem. If someone has a patch they think addresses the underlying problem (=
clearing up the warning at the same time), I would be more than happy to te=
st it for them in my environment and see if it fixes the warning.

To reiterate this is a nuisance warning fix and not a fundamental issue I'm=
 seeing with my group ids. Addressing the warning in my build environment h=
elps other new warnings that are introduced to be addressed and not ignored=
.

Thanks,

JD

--FUFYIFYPvExyFxo3P8dA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 09:01 AM, Richard Purdie wrote:<br />
<blockquote>On Wed, 2023-09-27 at 06:07 -0700, JD Schroeder wrote:<br />
<blockquote>On Tue, Sep 12, 2023 at 06:03 AM, Ross Burton wrote:<br />
<blockquote>On 1 Sep 2023, at 11:03, Alexandre Belloni via<br />lists.opene=
mbedded.org<br />&lt;alexandre.belloni=3Dbootlin.com@lists.openembedded.org=
&gt; wrote:<br />
<blockquote><br />Hello,<br /><br />This fails on the autobuilders:<br /><b=
r /><a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/117/=
builds/3449/steps/12/logs/stdio" target=3D"_blank" rel=3D"noopener">https:/=
/autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3449/steps/12/l=
ogs/stdio</a><br /><br />ERROR: Nothing RPROVIDES 'distcc' (but /home/pokyb=
uild/yocto-<br />worker/reproducible/build/meta/recipes-<br />core/packageg=
roups/packagegroup-self-hosted.bb,<br />/home/pokybuild/yocto-worker/reprod=
ucible/build/meta/recipes-<br />devtools/devel-config/distcc-config.bb RDEP=
ENDS on or otherwise<br />requires it)<br />distcc was skipped: Recipe dist=
cc, package distcc-server: system<br />groupname "nogroup" does not have a =
static ID defined. Add<br />nogroup to one of these files: /home/pokybuild/=
yocto-<br />worker/reproducible/build/build-st/meta-selftest/files/static-<=
br />group</blockquote>
The same problem would hit the ppp-dialin but that recipe doesn&rsquo;t<br =
/>get built in the AB in an environment that has static IPs.<br /><br />Ros=
s</blockquote>
I'm seeing the the warnings being generated in a multi-config Yocto<br />bu=
ild environment. Is there another way to address and fix the<br />warnings =
I am having with the distcc and ppp-dialin recipes (possibly<br />during pa=
rsing) even if they aren't being built in the AB with static<br />IPs?</blo=
ckquote>
It might help if you could describe how to reproduce the problem you're<br =
/>seeing?<br /><br />"nogroup" should already exist in the underlying base-=
passwd file so we<br />really need to understand why that isn't working. Th=
e patch appears<br />just to mask the real problem.<br /><br />Cheers,<br /=
><br />Richard</blockquote>
<p>Sorry, it has taken a while for me to get back to this. I'm still seeing=
 these warnings:</p>
<p style=3D"line-height: 1.42857;">WARNING: yocto-4.0/poky/meta/recipes-dev=
tools/distcc/distcc_3.4.bb: distcc: Changing groupname nogroup's gid from (=
1018) to (65534), verify configuration files!</p>
<p>WARNING: yocto-4.0/poky/meta/recipes-connectivity/ppp-dialin/ppp-dialin_=
0.1.bb: ppp-dialin: Changing groupname nogroup's gid from (1019) to (65534)=
, verify configuration files!</p>
<p>The "nogroup" <strong>does</strong> exist in base-passed in group.master=
 with "nogroup:*:65534:"</p>
<p>So it appears that something is originally setting the nogroup's gid to =
1018 as the distcc recipe is parsed and later it gets changed to 65534 whic=
h causes the warning.<br /><br />My patch fixes the warning and probably is=
 not addressing the underlying problem. If someone has a patch they think a=
ddresses the underlying problem (clearing up the warning at the same time),=
 I would be more than happy to test it for them in my environment and see i=
f it fixes the warning.</p>
<p>To reiterate this is a nuisance warning fix and not a fundamental issue =
I'm seeing with my group ids. Addressing the warning in my build environmen=
t helps other new warnings that are introduced to be addressed and not igno=
red.</p>
<p>Thanks,</p>
<p>JD</p>

--FUFYIFYPvExyFxo3P8dA--

