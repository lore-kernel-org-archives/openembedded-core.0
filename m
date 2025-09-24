Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DD9CAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 22:48:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.27896.1758754092945873355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 15:48:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eHJBe8Pv;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58OMluiO1303703;
	Wed, 24 Sep 2025 17:47:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758754076;
	bh=yAHOGWOf58t84PO4CyMtgsY4DaRxxr5tyA6+x4xDfUY=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=eHJBe8Pvmyty9Oj7ojswRtCeB5QnICOcMZv+guWHBvxDmGtWwWVCIRh4OD6u6aNrP
	 D2ZQecU3mmsVYyG1Qr44wsGkut4/ZSn/dsA2gBiH9DDPSmn7CBTYpGpZsSsUM9NTM2
	 jAbhg7IYg5xlUqAlhH9Fb1235Mz9n0wF+g1M0jQk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58OMlutn2758203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 24 Sep 2025 17:47:56 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 17:47:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 17:47:55 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58OMltIi2484191;
	Wed, 24 Sep 2025 17:47:55 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Sep 2025 17:47:55 -0500
Message-ID: <DD1EACB7UHYA.3OG9HIG2W5CS2@ti.com>
CC: <afd@ti.com>, <detheridge@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <openembedded-core@lists.openembedded.org>, <vijayp@ti.com>
Subject: Re: [oe-core][PATCHv10 6/7] xserver-nodm-init: convert to
 virtual-emptty-conf
From: Randolph Sapp <rs@ti.com>
To: <rs@ti.com>, <richard.purdie@linuxfoundation.org>,
        <mathieu.dubois-briand@bootlin.com>, <alex@linutronix.de>,
        <otavio@ossystems.com.br>, <kexin.hao@windriver.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250923225150.2407390-1-rs@ti.com>
 <18680B2C26D3ACFF.17085@lists.openembedded.org>
 <18680FA2E4B5FED3.1251@lists.openembedded.org>
In-Reply-To: <18680FA2E4B5FED3.1251@lists.openembedded.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 22:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223994

On Tue Sep 23, 2025 at 7:13 PM CDT, Randolph Sapp via lists.openembedded.or=
g wrote:
> On Tue Sep 23, 2025 at 5:51 PM CDT, Randolph Sapp via lists.openembedded.=
org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Convert this script package into a simple config for emptty. This is
>> capable of using either the root user or the underprivileged xuser
>> account based on the same ROOTLESS_X variable. The xuser will leverage
>> the nopasswdlogin session provided by emptty for automatic logins.
>> Runtime provide virtual-emptty-conf as we need to set parameters for the
>> default session.
>>
>> This also gets rid of the xuser security/capability override since
>> emptty sets up required components as root before descending into the
>> specified user. This does not currently handle loading of autostart
>> applications in "/etc/xdg/autostart".
>>
>> This explicitly removes rooted x11 support for security related issues,
>> as this recipe has always automatically setup passwordless login for the
>> specified account. This was particularly useful for the underprivileged
>> xuser account, but is quickly a problem for the root user.
>>
>> See the following discussion for additional information:
>> https://lists.openembedded.org/g/openembedded-core/topic/115318655#msg22=
3906
>>
>> License-Update: GPLv2 scripts were replaced with MIT based config files
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>  meta/conf/distro/include/maintainers.inc      |   4 +-
>>  meta/lib/oeqa/runtime/cases/xorg.py           |   8 +
>>  .../x11-common/xserver-nodm-init/X11/Xsession |  38 --
>>  .../X11/Xsession.d/13xdgbasedirs.sh           |  19 -
>>  .../X11/Xsession.d/89xdgautostart.sh          |   7 -
>>  .../X11/Xsession.d/90XWindowManager.sh        |   7 -
>>  .../x11-common/xserver-nodm-init/Xserver      |  25 --
>>  .../xserver-nodm-init/capability.conf         |   2 -
>>  .../xserver-nodm-init/default.desktop         |   5 +
>>  .../xserver-nodm-init/emptty.conf.in}         |   8 +-
>>  .../xserver-nodm-init/gplv2-license.patch     | 355 ------------------
>>  .../x11-common/xserver-nodm-init/xserver-nodm |  75 ----
>>  .../xserver-nodm-init/xserver-nodm.conf.in    |   7 -
>>  .../xserver-nodm-init/xserver-nodm.service.in |  11 -
>>  .../x11-common/xserver-nodm-init_3.0.bb       |  64 +---
>>  .../user-creation/xuser-account_0.1.bb        |   3 +-
>>  16 files changed, 35 insertions(+), 603 deletions(-)
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/13xdgbasedirs.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/89xdgautostart.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
11/Xsession.d/90XWindowManager.sh
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/X=
server
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/c=
apability.conf
>>  create mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/d=
efault.desktop
>>  copy meta/recipes-graphics/{wayland/weston-init/emptty.conf =3D> x11-co=
mmon/xserver-nodm-init/emptty.conf.in} (95%)
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/g=
plv2-license.patch
>>  delete mode 100755 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm.conf.in
>>  delete mode 100644 meta/recipes-graphics/x11-common/xserver-nodm-init/x=
server-nodm.service.in
>>
[snip]
>> diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb b=
/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> index 169269eefb..1fc10159e8 100644
>> --- a/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> +++ b/meta/recipes-graphics/x11-common/xserver-nodm-init_3.0.bb
>> @@ -1,25 +1,16 @@
>>  SUMMARY =3D "Simple Xserver Init Script (no dm)"
>> -LICENSE =3D "GPL-2.0-only"
>> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa88=
2bbe"
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfb=
cb788c80a0384361b4de20420"
>>  SECTION =3D "x11"
>> =20
>> -SRC_URI =3D "file://xserver-nodm \
>> -           file://Xserver \
>> -           file://X11 \
>> -           file://gplv2-license.patch \
>> -           file://xserver-nodm.service.in \
>> -           file://xserver-nodm.conf.in \
>> -           file://capability.conf \
>> -"
>> +SRC_URI =3D "file://emptty.conf.in \
>> +           file://default.desktop"
>> =20
>>  S =3D "${UNPACKDIR}"
>> =20
>> -# Since we refer to ROOTLESS_X which is normally enabled per-machine
>> -PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +inherit features_check
>> =20
>> -inherit update-rc.d systemd features_check
>> -
>> -REQUIRED_DISTRO_FEATURES =3D "x11 ${@oe.utils.conditional('ROOTLESS_X',=
 '1', 'pam', '', d)}"
>> +REQUIRED_DISTRO_FEATURES =3D "x11 pam"
>
> Ah, something for the future. PAM is a requirement for passwordless login=
 right
> now. Emptty supports generic authentication without pam though. I could e=
xtend
> emptty's auth_nopam_linux.go and config to allow passwordless authenticat=
ion in
> pamless environments by using a group dictated in the emptty-conf. Assumi=
ng
> people are interested in that.

Actually I was mistaken. It already performs passwordless auth for the list=
ed
autologin user if pam is not present. The pam dependency in this recipe can=
 be
dropped in the next revision.

>>  PACKAGECONFIG ??=3D "blank"
>>  # dpms and screen saver will be on only if 'blank' is in PACKAGECONFIG
>> @@ -27,45 +18,18 @@ PACKAGECONFIG[blank] =3D ""
>>  PACKAGECONFIG[nocursor] =3D ""
>> =20
>>  do_install() {
>> -    install -d ${D}${sysconfdir}/default
>> -    install xserver-nodm.conf.in ${D}${sysconfdir}/default/xserver-nodm
>> -    install -d ${D}${sysconfdir}/xserver-nodm
>> -    install Xserver ${D}${sysconfdir}/xserver-nodm/Xserver
>> -    install -d ${D}${sysconfdir}/X11/Xsession.d
>> -    install X11/Xsession.d/* ${D}${sysconfdir}/X11/Xsession.d/
>> -    install X11/Xsession ${D}${sysconfdir}/X11/
>> +    install -D -p -m0644 ${S}/emptty.conf.in ${D}${sysconfdir}/emptty/c=
onf
>> +    install -D -p -m0644 ${S}/default.desktop ${D}${datadir}/xsessions/=
default.desktop
>> =20
>>      BLANK_ARGS=3D"${@bb.utils.contains('PACKAGECONFIG', 'blank', '', '-=
s 0 -dpms', d)}"
>>      NO_CURSOR_ARG=3D"${@bb.utils.contains('PACKAGECONFIG', 'nocursor', =
'-nocursor', '', d)}"
>> -    if [ "${ROOTLESS_X}" =3D "1" ] ; then
>> -        XUSER_HOME=3D"/home/xuser"
>> -        XUSER=3D"xuser"
>> -        install -D capability.conf ${D}${sysconfdir}/security/capabilit=
y.conf
>> -        sed -i "s:@USER@:${XUSER}:" ${D}${sysconfdir}/security/capabili=
ty.conf
>> -    else
>> -        XUSER_HOME=3D${ROOT_HOME}
>> -        XUSER=3D"root"
>> -    fi
>> -    sed -i "s:@HOME@:${XUSER_HOME}:; s:@USER@:${XUSER}:; s:@BLANK_ARGS@=
:${BLANK_ARGS}:" \
>> -        ${D}${sysconfdir}/default/xserver-nodm
>> -    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/defa=
ult/xserver-nodm
>> -
>> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',=
d)}; then
>> -        install -d ${D}${systemd_system_unitdir}
>> -        install -m 0644 ${S}/xserver-nodm.service.in ${D}${systemd_syst=
em_unitdir}/xserver-nodm.service
>> -        sed -i "s:@USER@:${XUSER}:" ${D}${systemd_system_unitdir}/xserv=
er-nodm.service
>> -    fi
>> =20
>> -    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false'=
,d)}; then
>> -        install -d ${D}${sysconfdir}/init.d
>> -        install xserver-nodm ${D}${sysconfdir}/init.d
>> -    fi
>> +    sed -i "s:@NO_CURSOR_ARG@:${NO_CURSOR_ARG}:" ${D}${sysconfdir}/empt=
ty/conf
>> +    sed -i "s:@BLANK_ARGS@:${BLANK_ARGS}:" ${D}${sysconfdir}/emptty/con=
f
>>  }
>> =20
>> -RDEPENDS:${PN} =3D "xinit ${@oe.utils.conditional('ROOTLESS_X', '1', 'x=
user-account libcap libcap-bin', '', d)}"
>> -
>> -INITSCRIPT_NAME =3D "xserver-nodm"
>> -INITSCRIPT_PARAMS =3D "start 9 5 . stop 20 0 1 2 3 6 ."
>> -SYSTEMD_SERVICE:${PN} =3D "xserver-nodm.service"
>> +FILES:${PN} =3D "${sysconfdir}/emptty/conf \
>> +               ${datadir}/xsessions/default.desktop"
>> =20
>> -RCONFLICTS:${PN} =3D "xserver-common (< 1.34-r9) x11-common"
>> +RDEPENDS:${PN} =3D "emptty xuser-account"
>> +RPROVIDES:${PN} +=3D "virtual-emptty-conf"
>> diff --git a/meta/recipes-support/user-creation/xuser-account_0.1.bb b/m=
eta/recipes-support/user-creation/xuser-account_0.1.bb
>> index 04f506e7a3..f1e4cb674f 100644
>> --- a/meta/recipes-support/user-creation/xuser-account_0.1.bb
>> +++ b/meta/recipes-support/user-creation/xuser-account_0.1.bb
>> @@ -24,7 +24,8 @@ FILES:${PN} =3D "${sysconfdir}/dbus-1/system.d/system-=
xuser.conf"
>> =20
>>  USERADD_PACKAGES =3D "${PN}"
>>  USERADD_PARAM:${PN} =3D "--create-home \
>> -                       --groups video,tty,audio,input,shutdown,disk \
>> +                       --groups video,tty,audio,input,shutdown,disk,nop=
asswdlogin \
>>                         --user-group xuser"
>> +GROUPADD_PARAM:${PN} =3D "-r nopasswdlogin"
>> =20
>>  ALLOW_EMPTY:${PN} =3D "1"


