Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2163C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 18:42:01 +0000 (UTC)
Subject: ca-certificates: postinst shift count out of range error
To: openembedded-core@lists.openembedded.org
From: WXbet@proton.me
X-Originating-Location: Brechen, Hesse, DE (94.31.119.11)
X-Originating-Platform: Windows Chrome 135
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 22 May 2025 11:40:11 -0700
Message-ID: <HrS5.1747939211095331723.J22A@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="R1g0QD30w0zT3TtfbXJg"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217144

--R1g0QD30w0zT3TtfbXJg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

We see the following error maybe introduced with commit ca-certificates: su=
bmit sysroot patch upstream, drop default-sysroot.=E2=80=A6 =C2=B7 openembe=
dded/openembedded-core@90d9f0b ( https://github.com/openembedded/openembedd=
ed-core/commit/90d9f0ba674d4fe8e9291f0513c13dff3775c545#diff-fea5ef51cd53e0=
27c02d43f853be31c492bdbe8de48cfbe268bb6b1bcad5f162 )

Configuring ca-certificates.
/usr/sbin/update-ca-certificates: line 75: shift: shift count out of range
error: pkg_run_script: package "ca-certificates" postinst script returned s=
tatus 1.
error: opkg_configure: ca-certificates.postinst returned 1.

The postinst part in ipkg looks like:
set -e
$D/usr/sbin/update-ca-certificates --sysroot $D

Created from: https://github.com/openembedded/openembedded-core/commit/90d9=
f0ba674d4fe8e9291f0513c13dff3775c545#diff-d521676128cddb868864b5c8355a22f32=
45674db0e721c3458f7c35681ebd712R64-R65
Parameter $D is empty and so the shift-command fails.

Looks like there is a missing slash at the end of `$D${sbindir}/update-ca-c=
ertificates --sysroot $D`

or

the shift error in update-ca-certificates could be avoided with a patch lik=
e this:

diff --git a/sbin/update-ca-certificates b/sbin/update-ca-certificates
index 91d8024..0122c99 100755
--- a/sbin/update-ca-certificates
+++ b/sbin/update-ca-certificates
@@ -71,7 +71,7 @@ do
echo "$0: [--verbose] [--fresh]"
exit;;
esac
- =C2=A0shift
+ =C2=A0[ $# -gt 0 ] && shift
done

if [ ! -s "$CERTSCONF" ]

--R1g0QD30w0zT3TtfbXJg
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>We see the following error maybe introduced with commit <a href=3D"htt=
ps://github.com/openembedded/openembedded-core/commit/90d9f0ba674d4fe8e9291=
f0513c13dff3775c545#diff-fea5ef51cd53e027c02d43f853be31c492bdbe8de48cfbe268=
bb6b1bcad5f162" target=3D"_blank" rel=3D"noopener">ca-certificates: submit =
sysroot patch upstream, drop default-sysroot.&hellip; &middot; openembedded=
/openembedded-core@90d9f0b</a><br /><br /></div>
<div>Configuring ca-certificates.<br />/usr/sbin/update-ca-certificates: li=
ne 75: shift: shift count out of range<br />error: pkg_run_script: package =
"ca-certificates" postinst script returned status 1.<br />error: opkg_confi=
gure: ca-certificates.postinst returned 1.</div>
<div>&nbsp;</div>
<div><br />The postinst part in ipkg looks like:<br />set -e<br />&nbsp; &n=
bsp; $D/usr/sbin/update-ca-certificates --sysroot $D<br /><br />Created fro=
m: https://github.com/openembedded/openembedded-core/commit/90d9f0ba674d4fe=
8e9291f0513c13dff3775c545#diff-d521676128cddb868864b5c8355a22f3245674db0e72=
1c3458f7c35681ebd712R64-R65<br />Parameter $D is empty and so the shift-com=
mand fails.<br /><br />Looks like there is a missing slash at the end of `$=
D${sbindir}/update-ca-certificates --sysroot $D`</div>
<div>&nbsp;</div>
<div>or</div>
<div>&nbsp;</div>
<div>the shift error in update-ca-certificates could be avoided with a patc=
h like this:<br /><br />diff --git a/sbin/update-ca-certificates b/sbin/upd=
ate-ca-certificates<br />index 91d8024..0122c99 100755<br />--- a/sbin/upda=
te-ca-certificates<br />+++ b/sbin/update-ca-certificates<br />@@ -71,7 +71=
,7 @@ do<br />&nbsp; &nbsp; &nbsp; &nbsp;echo "$0: [--verbose] [--fresh]"<b=
r />&nbsp; &nbsp; &nbsp; &nbsp;exit;;<br />&nbsp; &nbsp;esac<br />- &nbsp;s=
hift<br />+ &nbsp;[ $# -gt 0 ] &amp;&amp; shift<br />&nbsp;done<br />&nbsp;=
<br />&nbsp;if [ ! -s "$CERTSCONF" ]<br /><br /></div>
<div>&nbsp;</div>

--R1g0QD30w0zT3TtfbXJg--

