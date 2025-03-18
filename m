Return-Path: <vs.yocto@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB59C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 03:17:10 +0000 (UTC)
Subject: Issue: /var/tmp does not persist due to /var/volatile being tmpfs in fstab #scarthgap
To: openembedded-core@lists.openembedded.org
From: "Vish" <vs.yocto@outlook.com>
X-Originating-Location: San Ramon, California, US (107.141.38.29)
X-Originating-Platform: Linux Chrome 127
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 17 Mar 2025 20:17:01 -0700
Message-ID: <ZACt.1742267821118468937.mtpo@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="bXj3DJ3ZDz2T5NSB0ukd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 03:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213134

--bXj3DJ3ZDz2T5NSB0ukd
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The current Yocto basefiles fstab mounts /var/volatile as tmpfs, which resu=
lts in the loss of all files stored in /var/tmp upon reboot.

fstab in base-files:

https://git.yoctoproject.org/poky/tree/meta/recipes-core/base-files/base-fi=
les/fstab?h=3Dscarthgap&id=3D3cc8c3520cedb66500757f843f757646da69ab30#n7

Since /var/volatile is a tmpfs, its contents are lost on reboot.

This commit might have introduced the issue - s ince /var/volatile/tmp is i=
nside a tmpfs mount, it gets wiped on reboot, meaning /var/tmp is also clea=
red.
Commit - https://git.yoctoproject.org/poky/commit/meta/recipes-core/systemd=
/systemd/00-create-volatile.conf?h=3Dscarthgap&id=3D3cc8c3520cedb66500757f8=
43f757646da69ab30 ( https://git.yoctoproject.org/poky/commit/meta/recipes-c=
ore/systemd/systemd/00-create-volatile.conf?h=3Dscarthgap&id=3D3cc8c3520ced=
b66500757f843f757646da69ab30 )

This commit links /var/tmp to /var/volatile/tmp
*Expected Behavior*

* /var/tmp should retain files across reboots, as per standard Linux behavi=
or.
* Using a symlink to a volatile tmpfs directory contradicts this expectatio=
n.

*Impact*

* Any application expecting persistent temporary storage in /var/tmp will l=
ose data after a reboot.
* This behavior may break software relying on the standard /var/tmp persist=
ence.

Should /var/tmp continue following standard Linux behavior by *not being li=
nked to /var/volatile/tmp* , or is this change intentional for specific use=
 cases? If persistence is desired, this approach seems problematic.

Would appreciate input from the maintainers on whether this is a bug or int=
ended behavior.

--bXj3DJ3ZDz2T5NSB0ukd
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div><span style=3D"background-color: var(--light-mode-body-color);">The cu=
rrent Yocto basefiles fstab mounts /var/volatile as tmpfs, which results in=
 the loss of all files stored in /var/tmp upon reboot.</span></div>
<div>&nbsp;</div>
<div><span style=3D"background-color: var(--light-mode-body-color);">fstab =
in base-files:</span></div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><br />=
<a href=3D"https://git.yoctoproject.org/poky/tree/meta/recipes-core/base-fi=
les/base-files/fstab?h=3Dscarthgap&amp;id=3D3cc8c3520cedb66500757f843f75764=
6da69ab30#n7" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.o=
rg/poky/tree/meta/recipes-core/base-files/base-files/fstab?h=3Dscarthgap&am=
p;id=3D3cc8c3520cedb66500757f843f757646da69ab30#n7</a></span></div>
<div><span style=3D"background-color: var(--light-mode-body-color);"><br />=
Since /var/volatile is a tmpfs, its contents are lost on reboot.</span></di=
v>
<div>
<div>
<div>&nbsp;</div>
<div>This commit might have introduced the issue - s<span style=3D"backgrou=
nd-color: var(--light-mode-body-color);">ince </span><code data-start=3D"12=
10" data-end=3D"1229">/var/volatile/tmp</code><span style=3D"background-col=
or: var(--light-mode-body-color);"> is inside a tmpfs mount, it gets wiped =
on reboot, meaning </span><code data-start=3D"1288" data-end=3D"1298">/var/=
tmp</code><span style=3D"background-color: var(--light-mode-body-color);"> =
is also cleared.</span></div>
<div>
<h4 data-start=3D"1317" data-end=3D"1343"><span style=3D"background-color: =
var(--light-mode-body-color); font-size: 16px;">Commit - </span><a style=3D=
"font-size: 16px;" href=3D"https://git.yoctoproject.org/poky/commit/meta/re=
cipes-core/systemd/systemd/00-create-volatile.conf?h=3Dscarthgap&amp;id=3D3=
cc8c3520cedb66500757f843f757646da69ab30" target=3D"_blank" rel=3D"noopener"=
>https://git.yoctoproject.org/poky/commit/meta/recipes-core/systemd/systemd=
/00-create-volatile.conf?h=3Dscarthgap&amp;id=3D3cc8c3520cedb66500757f843f7=
57646da69ab30&nbsp;</a></h4>
</div>
</div>
<div>&nbsp;</div>
<div>This commit links <code data-start=3D"1104" data-end=3D"1114">/var/tmp=
</code> to <code data-start=3D"1118" data-end=3D"1137">/var/volatile/tmp</c=
ode></div>
<div>
<h4 data-start=3D"1317" data-end=3D"1343">&nbsp;</h4>
<h4 data-start=3D"1317" data-end=3D"1343"><strong data-start=3D"1322" data-=
end=3D"1343">Expected Behavior</strong></h4>
<ul data-start=3D"1344" data-end=3D"1502">
<li data-start=3D"1344" data-end=3D"1424"><code data-start=3D"1346" data-en=
d=3D"1356">/var/tmp</code> should retain files across reboots, as per stand=
ard Linux behavior.</li>
<li data-start=3D"1425" data-end=3D"1502">Using a symlink to a volatile tmp=
fs directory contradicts this expectation.</li>
</ul>
</div>
<div>
<h4 data-start=3D"1504" data-end=3D"1519">&nbsp;</h4>
<h4 data-start=3D"1504" data-end=3D"1519"><strong data-start=3D"1509" data-=
end=3D"1519">Impact</strong></h4>
<ul data-start=3D"1520" data-end=3D"1704">
<li data-start=3D"1520" data-end=3D"1621">Any application expecting persist=
ent temporary storage in <code data-start=3D"1580" data-end=3D"1590">/var/t=
mp</code> will lose data after a reboot.</li>
<li data-start=3D"1622" data-end=3D"1704">This behavior may break software =
relying on the standard <code data-start=3D"1681" data-end=3D"1691">/var/tm=
p</code> persistence.</li>
</ul>
</div>
<div>
<p data-start=3D"1738" data-end=3D"1969">&nbsp;</p>
<p data-start=3D"1738" data-end=3D"1969">Should <code data-start=3D"1745" d=
ata-end=3D"1755">/var/tmp</code> continue following standard Linux behavior=
 by <strong data-start=3D"1802" data-end=3D"1845">not being linked to <code=
 data-start=3D"1824" data-end=3D"1843">/var/volatile/tmp</code></strong>, o=
r is this change intentional for specific use cases? If persistence is desi=
red, this approach seems problematic.</p>
<p data-start=3D"1971" data-end=3D"2061">Would appreciate input from the ma=
intainers on whether this is a bug or intended behavior.&nbsp;<br /><br /><=
/p>
</div>
</div>

--bXj3DJ3ZDz2T5NSB0ukd--

