Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB099C5B549
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 19:49:59 +0000 (UTC)
Subject: Re: [PATCH v2] systemd.bbclass: generate preset for templates
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: Viborg, Central Jutland, DK (86.52.147.220)
X-Originating-Platform: Linux Chrome 136
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 12:49:52 -0700
References: <20250529174427.2731440-1-patrick@stwcx.xyz>
In-Reply-To: <20250529174427.2731440-1-patrick@stwcx.xyz>
Message-ID: <26404.1748807392945644245@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KHwkUtWhxvXDDnkAzBVD"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 19:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217677

--KHwkUtWhxvXDDnkAzBVD
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 10:44 AM, Patrick Williams wrote:

>=20
> There was a regression introduced by the change to use
> systemd-systemctl-native rather than a python fake implementation,
> which caused template units to not be properly enabled when set in
> the SYSTEMD_SERVICE variable. Through investigation, it seems that
> the best way to re-enable template instances is to handle them
> explicitly in the systemd.bbclass and enable them with `preset`, like
> most units are handled[1,2].
>=20
> Per the systemd.preset manpage, the format for template units is
> different than for regular units[3]. We need to coalesce all the
> template instances onto a single line and emit them as an additional
> space-deliminated argument.
>=20
> Ran this against openbmc's phosphor-ipmi-net recipe and generated
> the following preset file:
> ```
> $ cat
> packages-split/phosphor-ipmi-net/usr/lib/systemd/system-preset/98-phospho=
r-ipmi-net.preset
>=20
> enable phosphor-ipmi-net@.service eth0
> enable phosphor-ipmi-net@.socket eth0
> ```

Thanks again Patrick for looking into this. I can confirm that the patch re=
solves the issue I encountered - hoping for it to be backported to Walnasca=
r after merge.

Martin

--KHwkUtWhxvXDDnkAzBVD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, May 29, 2025 at 10:44 AM, Patrick Williams wrote:</div>
<div>
<blockquote>There was a regression introduced by the change to use<br />sys=
temd-systemctl-native rather than a python fake implementation,<br />which =
caused template units to not be properly enabled when set in<br />the SYSTE=
MD_SERVICE variable. Through investigation, it seems that<br />the best way=
 to re-enable template instances is to handle them<br />explicitly in the s=
ystemd.bbclass and enable them with `preset`, like<br />most units are hand=
led[1,2].<br /><br />Per the systemd.preset manpage, the format for templat=
e units is<br />different than for regular units[3]. We need to coalesce al=
l the<br />template instances onto a single line and emit them as an additi=
onal<br />space-deliminated argument.<br /><br />Ran this against openbmc's=
 phosphor-ipmi-net recipe and generated<br />the following preset file:<br =
/>```<br />$ cat packages-split/phosphor-ipmi-net/usr/lib/systemd/system-pr=
eset/98-phosphor-ipmi-net.preset<br />enable phosphor-ipmi-net@.service eth=
0<br />enable phosphor-ipmi-net@.socket eth0<br />```</blockquote>
Thanks again Patrick for looking into this. I can confirm that the patch re=
solves the issue I encountered - hoping for it to be backported to Walnasca=
r after merge.</div>
<div>&nbsp;</div>
<div>Martin</div>

--KHwkUtWhxvXDDnkAzBVD--

