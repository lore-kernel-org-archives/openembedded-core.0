Return-Path: <mns@gomspace.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C88CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:03:20 +0000 (UTC)
Subject: Re: [walnascar][PATCH 3/3] systemd.bbclass: Make systemd_postinst run as intended
To: openembedded-core@lists.openembedded.org
From: "Martin Siegumfeldt" <mns@gomspace.com>
X-Originating-Location: Capital Region, DK (77.241.136.173)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 11:03:12 -0700
References: <20250912155712.3340513-3-pkj@axis.com>
In-Reply-To: <20250912155712.3340513-3-pkj@axis.com>
Message-ID: <29002.1758736992926980722@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hN3bJiIl1p7Zuvs9wu3R"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 18:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223978

--hN3bJiIl1p7Zuvs9wu3R
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

After pulling poky [walnascar] today, our image build broke with the below:

WARNING: nanomind-dev-image-1.0-r0 do_rootfs: nanomind-gpio-ctrl.postinst r=
eturned 1, marking as unpacked only, configuration required on target.
WARNING: nanomind-dev-image-1.0-r0 do_rootfs: nanomind-bank-ctrl.postinst r=
eturned 1, marking as unpacked only, configuration required on target.
ERROR: nanomind-dev-image-1.0-r0 do_rootfs: Postinstall scriptlets of ['nan=
omind-gpio-ctrl', 'nanomind-bank-ctrl'] have failed. If the intention is to=
 defer them to first boot,
then please place them into pkg_postinst_ontarget:${PN} ().
Deferring to first boot via 'exit 1' is no longer supported.

I noticed this particular commit, and reverting it resolves the breakage. T=
he recipe is quite trivial IMO:

inherit systemd
RDEPENDS:${PN} =3D "libgpiod-tools"
SYSTEMD_SERVICE:${BPN} =3D "${BPN}@.service"
SRC_URI =3D "file://${SYSTEMD_SERVICE:${BPN}}"
S =3D "${WORKDIR}/sources"
UNPACKDIR =3D "${S}"
do_install () {
install -d ${D}${systemd_system_unitdir}
install -m 0644 ${UNPACKDIR}/${SYSTEMD_SERVICE:${BPN}} ${D}${systemd_system=
_unitdir}
}
We are building a readonly rootfs, could this be an issue combined with you=
r patch?

Thanks,
Martin

--hN3bJiIl1p7Zuvs9wu3R
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Peter,</div>
<div>&nbsp;</div>
<div>After pulling poky [walnascar] today, our image build broke with the b=
elow:</div>
<div>&nbsp;</div>
<div>WARNING: nanomind-dev-image-1.0-r0 do_rootfs: nanomind-gpio-ctrl.posti=
nst returned 1, marking as unpacked only, configuration required on target.=
<br />WARNING: nanomind-dev-image-1.0-r0 do_rootfs: nanomind-bank-ctrl.post=
inst returned 1, marking as unpacked only, configuration required on target=
.<br />ERROR: nanomind-dev-image-1.0-r0 do_rootfs: Postinstall scriptlets o=
f ['nanomind-gpio-ctrl', 'nanomind-bank-ctrl'] have failed. If the intentio=
n is to defer them to first boot,<br />then please place them into pkg_post=
inst_ontarget:${PN} ().<br />Deferring to first boot via 'exit 1' is no lon=
ger supported.</div>
<div>&nbsp;</div>
<div>I noticed this particular commit, and reverting it resolves the breaka=
ge. The recipe is quite trivial IMO:<br /><br />
<div>inherit systemd</div>
<div>RDEPENDS:${PN} =3D "libgpiod-tools"</div>
<div>SYSTEMD_SERVICE:${BPN} =3D "${BPN}@.service"</div>
<div>SRC_URI =3D "file://${SYSTEMD_SERVICE:${BPN}}"</div>
<div>S =3D "${WORKDIR}/sources"<br />UNPACKDIR =3D "${S}"</div>
<div>do_install () {<br />&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${syst=
emd_system_unitdir}<br />&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ${UNPA=
CKDIR}/${SYSTEMD_SERVICE:${BPN}} ${D}${systemd_system_unitdir}<br />}</div>
</div>
<div>We are building a readonly rootfs, could this be an issue combined wit=
h your patch?</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>Martin</div>

--hN3bJiIl1p7Zuvs9wu3R--

