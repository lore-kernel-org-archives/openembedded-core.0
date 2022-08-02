Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91BCEC3F6B0
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 09:45:31 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.113])
 by mx.groups.io with SMTP id smtpd.web09.4269.1659433522060516685
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 02:45:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1
 header.b=hHanCRXC;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.113,
 mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnZsLa78KMajjR9piJ0RonCZT2mnTHqP8neS+fZA9JRoyL64BOPKoGQSkyfp3cbpoPiN7UuF9etnHfL1n5Yh127S5FBi/4WN46XbJgnVaQriPMuVV4ZowuOpHRobSNlePFz2aXablYwiiMkWGtldUsE4z7SWPT9Qt38hfJ2ioUjKsWJTD+y34aUze/mnQXV44aPHSe2pUxNO+KsasIckvYABUq6hXAEINgBHluyQM0CarKVfweftigfvxH0k1a6o8s1a3iuSeYYfsBgZNlGKaGMvv/5aDF0BG/l8Q0RN3PmdhAn6EKQLUt+f0PSXyQUcYkqgYw7K2TgsJ4kNq/JPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ANElvpnaFN66TVspy13NL2u3bLYcnnseUwJA6+cyOw=;
 b=GyJiMg0ru6CFtBYnadsrbeFziS2iFaQy7u0qG9q5zrlGs1HBh9Dv6BApw1ffykK/PwR2cqbnzpc/WojqsRxVizaY+Nw2+tD2QRfx/MQFXWI7fvltJE/nVxNzhNKBMrMW7vLlIxf5mrDDzObrH+PQmytXb/ITpYJpOpHXtdkeZvv511nZsE5EHkk0hyjaFVHTYQ/+tQhDar7H9mKgDNPMZzpKpAmSQcKtPf/BQ3//t2JNVV8usuJgNTvVVbSoYLLfSon1XtlKVd2pQ4D2qOAOG/zhE3yCsK/fDfsZdBLFmD5ew4dB6grJQwiC1+0KtddhsNo5BvbEh5b/i04isLg8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ANElvpnaFN66TVspy13NL2u3bLYcnnseUwJA6+cyOw=;
 b=hHanCRXCOw8TnX5/L5ZsD3wKTbEBmgKik++a2b1ofFhkY5kpytpHL8EqyevGBxZWoGyparC20mAElEH+fXo7dswl70QCnPToXUh5Tz4Zq9S6kfV9s22+yeIr3tINeXzCvU6H6P8vLP+uSOQ64Hd7fiyDW1sY1bTE813+DNUCr3A=
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com (2603:10a6:6:54::31) by
 DBAPR06MB7045.eurprd06.prod.outlook.com (2603:10a6:10:1a0::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.11; Tue, 2 Aug 2022 09:45:19 +0000
Received: from DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b]) by DB6PR06MB4008.eurprd06.prod.outlook.com
 ([fe80::ac78:c445:6beb:699b%5]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 09:45:18 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Marta Rybczynska <rybczynska@gmail.com>,
	"ross.burton@arm.com" <ross.burton@arm.com>
Subject: Re: [meta-oe][PATCH v4] classes: rootfs-postcommands: autologin root
 on serial-getty
Thread-Topic: [meta-oe][PATCH v4] classes: rootfs-postcommands: autologin root
 on serial-getty
Thread-Index: AQHYplPkKCy8cvZ4rE6LcznQc4bXK62bW0j2
Date: Tue, 2 Aug 2022 09:45:18 +0000
Message-ID: 
 <DB6PR06MB400881FBE2FC40CD2FF9119ABC9D9@DB6PR06MB4008.eurprd06.prod.outlook.com>
References: <20220802094019.962927-1-johannes.schneider@leica-geosystems.com>
In-Reply-To: <20220802094019.962927-1-johannes.schneider@leica-geosystems.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4e0f7d-c2c2-40aa-4953-08da746bb5e2
x-ms-traffictypediagnostic: DBAPR06MB7045:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kqXwJOF+VmZGwqs7H8g7nZGyBMWAQGVGaxiaIm4NIOGUZphmkO60FMqMMammAlnbZWdc1MfbpttH3n+NEU+Rx2K5MM8gpeev9luDINc3mb+tMHsaPmP0inmiS/hb0kJvW2tMfRV0RzLl+UV4l1wodhU3aUN2EgYGN5pX5GmSEUPQhR+VEUNIVlSYZBupE1CJBoZeuvEQeg8NQPV4Gw9YxnoVRfwHQIDUxhCc0NKX3g26M7PWaBiztCHCB0NoolTOIX6+C821btKTfjq21Z7uLmCTsO15nD5lPsDMakxu1oZuKVDAjfJSw6MRrFZQZ+c9JoTo32tLa9VWyuwza04BY8DXKSCJaCZuYKy2GHN30lY0TD5/ZwwcAZ6BFVLy2RFLgVO4OIUaKFZe9Zgz0C6C/Bf8x/w5G/RC9Q+fh6Ee0in7qG29RrXDyn2MZdeqsfQrqj9oNZDfu29T/lJQArJ1XLd7z/u8go5puz1y+8eRg/zUZ90+IkoipBINL9Ffl9Nm2TbFhBUbx7QiJLriB9Qlxl1swhzbQ0ytXi/JtDWD1sGXX/ckEGhDYFFw6S5ozxOE0S+CZYj1jlx50dKWzGhzNuTxiQtgV0TfeUzeRFWuuC2KrR8PagcyHA97fYdeyS9B8y2ly/rSEO7KXLWWAiXF1AGxIWXlvvu7CTbdYjKr8tJwJ4OL0r8xm4vvJwleHdljAdZl9dkT2r0KlugOJp3YwcMgBEGJq0/TxVTQPQQjYef6Es7FKZvoihimDownsnejzql8wxPZq1mi2pDuCvp7wYSWdKSWp5kfjRdrwTgL/T6iN/ug9Bim3D9MJ57iG/+4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR06MB4008.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(366004)(136003)(39860400002)(376002)(55016003)(110136005)(19627405001)(316002)(5660300002)(122000001)(8676002)(66476007)(64756008)(66446008)(66556008)(66946007)(91956017)(38070700005)(71200400001)(76116006)(38100700002)(7696005)(186003)(86362001)(478600001)(26005)(9686003)(8936002)(41300700001)(83380400001)(33656002)(52536014)(53546011)(6506007)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gzdjCXfR7m8qKHZpNveOdBdFYXfsqAIP7KQXHqJJ1SSabrnHlcyK1+l9na6c?=
 =?us-ascii?Q?sAOo0yCrmSO2v3pEcmh2bjEVxQMO0cW4vNjWLe9qHJLk5DLOFYJNlGNSMV1N?=
 =?us-ascii?Q?d7PjRIav5yUNzfAL9vB+TIJKS/bG4wbSctoG8VRcbDlQbN2jw6ECr/VPMvWk?=
 =?us-ascii?Q?T4fyp2NnLypkwrB5WI50MKksiWL1oVH8fNTekElZKmAsSrDRpq2OgUGYt5V4?=
 =?us-ascii?Q?+kSxFxTx/yPA3xGqiz1EqrcYQQfHItn5otvzd4jUg5epEYc6rE77BVQybQEu?=
 =?us-ascii?Q?RfTEMzZbBbzixu2usBW0D+EhBxaTnTSBJH4AFf4YWwV0tCfL3AkWHMjybJU6?=
 =?us-ascii?Q?m9XDKK92I8pogHTJ2GpAwCyzlN/O2ZvwlIissAA0bl2sbtC9pCzU2mDb0QC7?=
 =?us-ascii?Q?JooYlx8jNHlkDXCPqzMAhGlkKWsWDPSSS6qI8hjx+TIs2WalN590QqeizIri?=
 =?us-ascii?Q?4a6QYgked/CAFe0v/Q42iQiNlsdQGaN071iEq3X+GAMa3VniJCQYaX11yZnh?=
 =?us-ascii?Q?MWaZSC/KSM4O95jtwMqeiMviKADAQzo7a0iRbE4r/f1yjGyrilZxxdt/bxRE?=
 =?us-ascii?Q?mDoX3SEZ5Vb6nmqxGChquZKj9vSHriSHPjooerH0Oq6Ax0DhpkXMGNm/n/qK?=
 =?us-ascii?Q?IvNeCwpD4RmCOKd2UwR//QhZSmGx6cBFxOLijghF117iDRrM4fHhc+ZtRloj?=
 =?us-ascii?Q?YPZ9FlTz//+9O6zSeiOmnyuFgAiQ88/9/wkQE5i10gmWG4Icg4ENcteSD8a5?=
 =?us-ascii?Q?zH65CgSRuL2MIuBn6M+YVZ0lof5IzJ1b5WYGlR1FMQ3pP7U2hrJo12GGiQgJ?=
 =?us-ascii?Q?AW5vJOoJ7VgHryduAi3iF/SrFzBQqNMDe1fUSD2vZSPZDDMnzTsbbPbbsE7o?=
 =?us-ascii?Q?Xvh64BbK22BmQrV8lnmTXR8wioplgeG8Yn3DYjKCk0O227yTT+AztDB2Uhkf?=
 =?us-ascii?Q?kJ/6PAnrfK+QooRceNqQXe+jqVnOGfnTj+qGJUAQp4boJdi5FYK5lZQo0Jxd?=
 =?us-ascii?Q?qusBSTws+kemzg15nCsKKoMd0uJMRwZ7l4AyJ5Ma5OpyRO7lq9adBEwUCGsM?=
 =?us-ascii?Q?vjPfN4rpDF+uY0YNX3ccbJZycFngsWXsuR1o2JNoRMC3ql6k+b3jJCMQGbDj?=
 =?us-ascii?Q?FSZpg9vp+a0v4Y7gTC2chXOHJtplOq+wL+U3DvkgIznwX6woT+IEy4pGsmW8?=
 =?us-ascii?Q?AbzzzwLr/6cjIW7nXYnL2OzRw56mOTK4UhU4tnn2+FHKYZMVmh8paBh148HZ?=
 =?us-ascii?Q?GWdfOhJmd2PYJHboT8ad5XuaLKgj+r4vevBj1oC1eaPSzLJhN9PNPQEDb8nP?=
 =?us-ascii?Q?O/95YIMOugr9Hyj5HveGzaSw4D8iwm6kEXy7o3YZf5mBSxcF+tOaM2PVC5o/?=
 =?us-ascii?Q?0U1tuH7mqXTEEHyyELaeAfEC+5W4gb/hfjAl3+4rKhcDuMQsxAb29yzkRkDn?=
 =?us-ascii?Q?KMnOLgRXIxD4tcphn0bzLJWVSNEJFs3mYmv/F5xvtvIQKM4vbWOmt1dtM3j9?=
 =?us-ascii?Q?xNVEr/ijh/hmGp/wtmnstuzxk9lF0ackzo6ONSsua0QBsuIELaqnjTdXR4CT?=
 =?us-ascii?Q?sT4/3Vd3Q2MjPFQWfv+oXD4PDGNgMayfMML+rim1h5rtdJ6zT6bn1WQztPd7?=
 =?us-ascii?Q?ELwGD1UH5NZmZ1LIxAPDUuI=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB6PR06MB400881FBE2FC40CD2FF9119ABC9D9DB6PR06MB4008eurp_"
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR06MB4008.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 de4e0f7d-c2c2-40aa-4953-08da746bb5e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 09:45:18.8018
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 TfRHUrtrKViCIm+OuyH/OlB0g960OoBtCW8XIPhdRyYIsIMTJTIdgLtqm4bdGX97YVDrhqsWZ1ieI0Yt1oLKY9bYAjDB0h2Ysv3N+8YiM26ube3VS1PoO8lLak+fkSK0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB7045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 09:45:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168775

--_000_DB6PR06MB400881FBE2FC40CD2FF9119ABC9D9DB6PR06MB4008eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

v4 adds a variant for sysv - when/if using util-linux getty, since busybox =
does not seem to support an autologin option
also adds some documentation to the bbclass

regards
________________________________
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Sent: Tuesday, August 2, 2022 11:40
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
Subject: [meta-oe][PATCH v4] classes: rootfs-postcommands: autologin root o=
n serial-getty

when empty-root-password AND serial-autologin-root are part of the
IMAGE_FEATURES, save some of the developers time by not having to type
the (then still sole) 'root' username on the serial console after each
and every reboot

this is done by inserting '--autologin root' into the command line of
the responsible 'getty' service

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 meta/classes/core-image.bbclass               |  1 +
 meta/classes/image.bbclass                    |  2 +-
 meta/classes/rootfs-postcommands.bbclass      | 20 +++++++++++++++++++
 .../sysvinit/sysvinit-inittab/start_getty     |  3 ++-
 4 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbcl=
ass
index 84fd3eeb38..6764035729 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -29,6 +29,7 @@
 #   - allow-empty-password
 #   - allow-root-login
 #   - post-install-logging
+# - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console
 # - dev-pkgs            - development packages (headers, etc.) for all ins=
talled packages in the rootfs
 # - dbg-pkgs            - debug symbol packages for all installed packages=
 in the rootfs
 # - lic-pkgs            - license packages for all installed pacakges in t=
he rootfs, requires
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 2139a7e576..fe32cdefd5 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -34,7 +34,7 @@ INHIBIT_DEFAULT_DEPS =3D "1"
 # IMAGE_FEATURES may contain any available package group
 IMAGE_FEATURES ?=3D ""
 IMAGE_FEATURES[type] =3D "list"
-IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login post-install-logging overlayfs-etc"
+IMAGE_FEATURES[validitems] +=3D "debug-tweaks read-only-rootfs read-only-r=
ootfs-delayed-postinsts stateless-rootfs empty-root-password allow-empty-pa=
ssword allow-root-login serial-autologin-root post-install-logging overlayf=
s-etc"

 # Generate companion debugfs?
 IMAGE_GEN_DEBUGFS ?=3D "0"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass
index a8a952f31d..3dadba6047 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("=
IMAGE_FEATURES", [ 'deb
 # Allow dropbear/openssh to accept root logins if debug-tweaks or allow-ro=
ot-login is enabled
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'allow-root-login' ], "ssh_allow_root_login; ", "",d)}'

+# Autologin the root user on the serial console, if empty-root-password an=
d serial-autologin-root are active
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains("IMAGE_FEATURES", [ =
'empty-root-password', 'serial-autologin-root' ], "serial_autologin_root; "=
, "",d)}'
+
 # Enable postinst logging if debug-tweaks or post-install-logging is enabl=
ed
 ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any("IMAGE_FEATURES"=
, [ 'debug-tweaks', 'post-install-logging' ], "postinst_enable_logging; ", =
"",d)}'

@@ -196,6 +199,23 @@ ssh_allow_root_login () {
         fi
 }

+#
+# Autologin the 'root' user on the serial terminal,
+# if empty-root-password' AND 'serial-autologin-root are enabled
+#
+serial_autologin_root () {
+       if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "fal=
se", d)}; then
+               # add autologin option to util-linux getty only
+               sed -i 's/options=3D"/&--autologin root /' \
+                       "${IMAGE_ROOTFS}${base_bindir}/start_getty"
+       elif ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "fa=
lse", d)}; then
+               if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-get=
ty@.service ]; then
+                       sed -i '/^\s*ExecStart\b/ s/getty /&--autologin roo=
t /' \
+                               "${IMAGE_ROOTFS}${systemd_system_unitdir}/s=
erial-getty@.service"
+               fi
+       fi
+}
+
 python sort_passwd () {
     import rootfspostcommands
     rootfspostcommands.sort_passwd(d.expand('${IMAGE_ROOTFS}${sysconfdir}'=
))
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta=
/recipes-core/sysvinit/sysvinit-inittab/start_getty
index 699a1ead1a..7106fb72fb 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -9,9 +9,10 @@ case $(readlink -f "${getty}") in
         if [ -x "/usr/bin/setsid" ] ; then
             setsid=3D"/usr/bin/setsid"
         fi
+        options=3D""
         ;;
 esac

 if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
-       ${setsid:-} ${getty} -L $1 $2 $3
+       ${setsid:-} ${getty} ${options:-} -L $1 $2 $3
 fi
--
2.25.1


--_000_DB6PR06MB400881FBE2FC40CD2FF9119ABC9D9DB6PR06MB4008eurp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
v4 adds a variant for sysv - when/if using util-linux getty, since busybox =
does not seem to support an autologin option</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
also adds some documentation to the bbclass</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
regards<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Johannes Schneider &l=
t;johannes.schneider@leica-geosystems.com&gt;<br>
<b>Sent:</b> Tuesday, August 2, 2022 11:40<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> SCHNEIDER Johannes &lt;johannes.schneider@leica-geosystems.com&g=
t;<br>
<b>Subject:</b> [meta-oe][PATCH v4] classes: rootfs-postcommands: autologin=
 root on serial-getty</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">when empty-root-password AND serial-autologin-root=
 are part of the<br>
IMAGE_FEATURES, save some of the developers time by not having to type<br>
the (then still sole) 'root' username on the serial console after each<br>
and every reboot<br>
<br>
this is done by inserting '--autologin root' into the command line of<br>
the responsible 'getty' service<br>
<br>
Signed-off-by: Johannes Schneider &lt;johannes.schneider@leica-geosystems.c=
om&gt;<br>
---<br>
&nbsp;meta/classes/core-image.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;meta/classes/image.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 2 +-<br>
&nbsp;meta/classes/rootfs-postcommands.bbclass&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 20 +++++++++++++++++++<br>
&nbsp;.../sysvinit/sysvinit-inittab/start_getty&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 ++-<br>
&nbsp;4 files changed, 24 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbcl=
ass<br>
index 84fd3eeb38..6764035729 100644<br>
--- a/meta/classes/core-image.bbclass<br>
+++ b/meta/classes/core-image.bbclass<br>
@@ -29,6 +29,7 @@<br>
&nbsp;#&nbsp;&nbsp; - allow-empty-password<br>
&nbsp;#&nbsp;&nbsp; - allow-root-login<br>
&nbsp;#&nbsp;&nbsp; - post-install-logging<br>
+# - serial-autologin-root - with 'empty-root-password': autologin 'root' o=
n the serial console<br>
&nbsp;# - dev-pkgs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; - development packages (headers, etc.) for all installed packages=
 in the rootfs<br>
&nbsp;# - dbg-pkgs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; - debug symbol packages for all installed packages in the rootfs<=
br>
&nbsp;# - lic-pkgs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; - license packages for all installed pacakges in the rootfs, requ=
ires<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 2139a7e576..fe32cdefd5 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -34,7 +34,7 @@ INHIBIT_DEFAULT_DEPS =3D &quot;1&quot;<br>
&nbsp;# IMAGE_FEATURES may contain any available package group<br>
&nbsp;IMAGE_FEATURES ?=3D &quot;&quot;<br>
&nbsp;IMAGE_FEATURES[type] =3D &quot;list&quot;<br>
-IMAGE_FEATURES[validitems] +=3D &quot;debug-tweaks read-only-rootfs read-o=
nly-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-emp=
ty-password allow-root-login post-install-logging overlayfs-etc&quot;<br>
+IMAGE_FEATURES[validitems] +=3D &quot;debug-tweaks read-only-rootfs read-o=
nly-rootfs-delayed-postinsts stateless-rootfs empty-root-password allow-emp=
ty-password allow-root-login serial-autologin-root post-install-logging ove=
rlayfs-etc&quot;<br>
&nbsp;<br>
&nbsp;# Generate companion debugfs?<br>
&nbsp;IMAGE_GEN_DEBUGFS ?=3D &quot;0&quot;<br>
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs=
-postcommands.bbclass<br>
index a8a952f31d..3dadba6047 100644<br>
--- a/meta/classes/rootfs-postcommands.bbclass<br>
+++ b/meta/classes/rootfs-postcommands.bbclass<br>
@@ -8,6 +8,9 @@ ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any(&=
quot;IMAGE_FEATURES&quot;, [ 'deb<br>
&nbsp;# Allow dropbear/openssh to accept root logins if debug-tweaks or all=
ow-root-login is enabled<br>
&nbsp;ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any(&quot;IMAGE=
_FEATURES&quot;, [ 'debug-tweaks', 'allow-root-login' ], &quot;ssh_allow_ro=
ot_login; &quot;, &quot;&quot;,d)}'<br>
&nbsp;<br>
+# Autologin the root user on the serial console, if empty-root-password an=
d serial-autologin-root are active<br>
+ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains(&quot;IMAGE_FEATURES=
&quot;, [ 'empty-root-password', 'serial-autologin-root' ], &quot;serial_au=
tologin_root; &quot;, &quot;&quot;,d)}'<br>
+<br>
&nbsp;# Enable postinst logging if debug-tweaks or post-install-logging is =
enabled<br>
&nbsp;ROOTFS_POSTPROCESS_COMMAND +=3D '${@bb.utils.contains_any(&quot;IMAGE=
_FEATURES&quot;, [ 'debug-tweaks', 'post-install-logging' ], &quot;postinst=
_enable_logging; &quot;, &quot;&quot;,d)}'<br>
&nbsp;<br>
@@ -196,6 +199,23 @@ ssh_allow_root_login () {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;}<br>
&nbsp;<br>
+#<br>
+# Autologin the 'root' user on the serial terminal,<br>
+# if empty-root-password' AND 'serial-autologin-root are enabled<br>
+#<br>
+serial_autologin_root () {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ${@bb.utils.contains(&quot;DISTRO_=
FEATURES&quot;, &quot;sysvinit&quot;, &quot;true&quot;, &quot;false&quot;, =
d)}; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; # add autologin option to util-linux getty only<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sed -i 's/options=3D&quot;/&amp;--autologin root /' \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;${IMAGE_RO=
OTFS}${base_bindir}/start_getty&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif ${@bb.utils.contains(&quot;DISTR=
O_FEATURES&quot;, &quot;systemd&quot;, &quot;true&quot;, &quot;false&quot;,=
 d)}; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if [ -e ${IMAGE_ROOTFS}${systemd_system_unitdir}/serial-getty@.s=
ervice ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed -i '/^\s*Exe=
cStart\b/ s/getty /&amp;--autologin root /' \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;${IMAGE_ROOTFS}${systemd_system_unitd=
ir}/serial-getty@.service&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+}<br>
+<br>
&nbsp;python sort_passwd () {<br>
&nbsp;&nbsp;&nbsp;&nbsp; import rootfspostcommands<br>
&nbsp;&nbsp;&nbsp;&nbsp; rootfspostcommands.sort_passwd(d.expand('${IMAGE_R=
OOTFS}${sysconfdir}'))<br>
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta=
/recipes-core/sysvinit/sysvinit-inittab/start_getty<br>
index 699a1ead1a..7106fb72fb 100644<br>
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty<br>
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty<br>
@@ -9,9 +9,10 @@ case $(readlink -f &quot;${getty}&quot;) in<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -x &quot;/usr/bin/set=
sid&quot; ] ; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; se=
tsid=3D&quot;/usr/bin/setsid&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; options=3D&quot;&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&nbsp;esac<br>
&nbsp;<br>
&nbsp;if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${setsid:-} ${getty} -L $1 $2 $3<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${setsid:-} ${getty} ${options:-} -L =
$1 $2 $3<br>
&nbsp;fi<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DB6PR06MB400881FBE2FC40CD2FF9119ABC9D9DB6PR06MB4008eurp_--

