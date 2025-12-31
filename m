Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481FBEEB56D
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 18:51:04 +0000 (UTC)
Subject: Re: [PATCH V2] gdb: Upgrade 16.3 -> 17.1
To: openembedded-core@lists.openembedded.org
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (106.51.219.31)
X-Originating-Platform: Windows Chrome 143
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 31 Dec 2025 10:50:42 -0800
References: <20251223094411.2919323-1-sundeep.kokkonda@windriver.com> <DF6BX97B9AVC.XYGAZDNN5E39@bootlin.com>
In-Reply-To: <DF6BX97B9AVC.XYGAZDNN5E39@bootlin.com>
Message-ID: <359949.1767207042798785049@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7zn1GlPoTduhxd4G5vuw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 18:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228748

--7zn1GlPoTduhxd4G5vuw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for reporting this.

This appears to be an upstream GDB issue affecting musl builds. The failure=
 comes from set_custom_baudrate_linux() in gdb/ser-unix.c , which directly =
accesses struct termios members c_ospeed / c_ispeed. These fields exist wit=
h those names in glibc, but musl exposes them as __c_ospeed / __c_ispeed , =
which explains the build breakage you=E2=80=99re seeing.

There is an upstream Bugzilla report tracking this issue:
https://sourceware.org/bugzilla/show_bug.cgi?id=3D33747

I=E2=80=99ve been participating in the discussion there and shared some inv=
estigation and a possible direction, but there is *no agreed-upon fix yet*.=
 A few important points from the upstream discussion so far:

*=20

Simply switching to cfset [io] speed() is not sufficient in all cases, sinc=
e musl rejects non-standard baud rates and the existing GDB code intentiona=
lly bypasses that API.

*=20

Using libc-specific field names via #ifdef is fragile.

*=20

One possible approach under discussion is using a Linux termios2 -based pat=
h guarded by TCGETS2 , but this needs careful handling (e.g. BOTHER values =
differ across architectures).

Given this, it seems best to let this get resolved upstream rather than add=
ing a temporary OE-Core workaround. I=E2=80=99ll keep an eye on the upstrea=
m bug and follow up once there=E2=80=99s either a merged fix or a clearly r=
ecommended approach we can backport.

Thanks,
Sunil

--7zn1GlPoTduhxd4G5vuw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<p class=3D"isSelectedEnd"><span>Hi Mathieu,</span></p>
<p class=3D"isSelectedEnd"><span><br />Thanks for reporting this.<br /><br =
/></span></p>
<p class=3D"isSelectedEnd"><span>This appears to be an upstream GDB issue a=
ffecting musl builds. The failure comes from </span><code><span>set_custom_=
baudrate_linux()</span></code><span> in </span><code><span>gdb/ser-unix.c</=
span></code><span>, which directly accesses </span><code><span>struct termi=
os</span></code><span> members </span><code><span>c_ospeed</span></code><sp=
an> / </span><code><span>c_ispeed</span></code><span>. These fields exist w=
ith those names in glibc, but musl exposes them as </span><code><span>__c_o=
speed</span></code><span> / </span><code><span>__c_ispeed</span></code><spa=
n>, which explains the build breakage you&rsquo;re seeing.<br /><br /></spa=
n></p>
<p class=3D"isSelectedEnd"><span>There is an upstream Bugzilla report track=
ing this issue:</span><br /><span><a href=3D"https://sourceware.org/bugzill=
a/show_bug.cgi?id=3D33747" target=3D"_blank" rel=3D"noopener">https://sourc=
eware.org/bugzilla/show_bug.cgi?id=3D33747</a><a><br /><br /></a></span></p=
>
<p class=3D"isSelectedEnd"><span>I&rsquo;ve been participating in the discu=
ssion there and shared some investigation and a possible direction, but the=
re is </span><strong><span>no agreed-upon fix yet</span></strong><span>. A =
few important points from the upstream discussion so far:</span></p>
<ul data-spread=3D"false">
<li>
<p class=3D"isSelectedEnd"><span>Simply switching to </span><code><span>cfs=
et<span data-placeholder-token=3D"true" class=3D"text-token-text-primary cu=
rsor-text rounded-sm">[io]</span>speed()</span></code><span> is not suffici=
ent in all cases, since musl rejects non-standard baud rates and the existi=
ng GDB code intentionally bypasses that API.</span></p>
</li>
<li>
<p class=3D"isSelectedEnd"><span>Using libc-specific field names via </span=
><code><span>#ifdef</span></code><span> is fragile.</span></p>
</li>
<li>
<p class=3D"isSelectedEnd"><span>One possible approach under discussion is =
using a Linux </span><code><span>termios2</span></code><span>-based path gu=
arded by </span><code><span>TCGETS2</span></code><span>, but this needs car=
eful handling (e.g. </span><code><span>BOTHER</span></code><span> values di=
ffer across architectures).</span></p>
</li>
</ul>
<p class=3D"isSelectedEnd"><span>Given this, it seems best to let this get =
resolved upstream rather than adding a temporary OE-Core workaround. I&rsqu=
o;ll keep an eye on the upstream bug and follow up once there&rsquo;s eithe=
r a merged fix or a clearly recommended approach we can backport.<br /><br =
/></span></p>
<p><span>Thanks,</span><br /><span>Sunil</span></p>
</div>

--7zn1GlPoTduhxd4G5vuw--

