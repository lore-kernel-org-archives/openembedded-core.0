Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 3F31073E11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:19:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99991420"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Aug 2015 16:22:20 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7P8J3R4024075
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:19:03 +0800
Received: from G08CNEXMBPEKD03.g08.fujitsu.local ([10.167.33.86]) by
	G08CNEXCHPEKD02.g08.fujitsu.local ([10.167.33.83]) with mapi id
	14.03.0181.006; Tue, 25 Aug 2015 16:19:09 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] sysstat: add systemd service files
Thread-Index: AQHQpNbvlYSu3sfuAUuTzkwaCooj/54c06bA
Date: Tue, 25 Aug 2015 08:19:08 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E8011BCBCE60@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1434089620-1683-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1434089620-1683-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] sysstat: add systemd service files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Aug 2015 08:19:12 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Ping

Thanks

>-----Original Message-----
>From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Sent: Friday, June 12, 2015 2:14 PM
>To: openembedded-core@lists.openembedded.org
>Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
>Subject: [OE-core][PATCH] sysstat: add systemd service files
>
>Add sysstat.service to support systemd systems.
>
>Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
>---
> meta/recipes-extended/sysstat/sysstat.inc             | 11 ++++++++++-
> meta/recipes-extended/sysstat/sysstat/sysstat.service | 12 ++++++++++++
> 2 files changed, 22 insertions(+), 1 deletion(-)  create mode 100644
>meta/recipes-extended/sysstat/sysstat/sysstat.service
>
>diff --git a/meta/recipes-extended/sysstat/sysstat.inc
>b/meta/recipes-extended/sysstat/sysstat.inc
>index 4063007..5c761fa 100644
>--- a/meta/recipes-extended/sysstat/sysstat.inc
>+++ b/meta/recipes-extended/sysstat/sysstat.inc
>@@ -6,15 +6,20 @@ SECTION =3D "console/utils"
>
> SRC_URI =3D "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.t=
ar.xz \
>            file://99_sysstat \
>+           file://sysstat.service \
>           "
>
> DEPENDS +=3D "base-passwd"
>
>-inherit autotools-brokensep gettext
>+inherit autotools-brokensep gettext systemd
>
> EXTRA_OECONF +=3D "--disable-sensors"
> EXTRA_OEMAKE +=3D 'LFLAGS=3D""'
>
>+SYSTEMD_PACKAGES =3D "${PN}"
>+SYSTEMD_SERVICE_${PN} =3D "sysstat.service"
>+SYSTEMD_AUTO_ENABLE =3D "enable"
>+
> do_configure_prepend() {
>     export sa_lib_dir=3D${libdir}/sa
> }
>@@ -27,6 +32,10 @@ do_install() {
> 	rm -rf ${D}/var
> 	install -d ${D}/etc/default/volatiles
> 	install -m 0644 ${WORKDIR}/99_sysstat ${D}/etc/default/volatiles
>+
>+	install -d ${D}${systemd_unitdir}/system
>+	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
>+	sed -i -e 's#@LIBDIR@#${libdir}#g'
>+${D}${systemd_unitdir}/system/sysstat.service
> }
>
> pkg_postinst_${PN} () {
>diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service
>b/meta/recipes-extended/sysstat/sysstat/sysstat.service
>new file mode 100644
>index 0000000..aff0710
>--- /dev/null
>+++ b/meta/recipes-extended/sysstat/sysstat/sysstat.service
>@@ -0,0 +1,12 @@
>+[Unit]
>+Description=3DResets System Activity Logs
>+
>+[Service]
>+Type=3Doneshot
>+RemainAfterExit=3Dyes
>+User=3Droot
>+ExecStart=3D@LIBDIR@/sa/sa1 --boot
>+
>+[Install]
>+WantedBy=3Dmulti-user.target
>+
>--
>1.8.4.2


