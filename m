Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2519065D40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 19:04:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Dec 2014 11:03:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,517,1413270000"; d="scan'208";a="632802355"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by fmsmga001.fm.intel.com with ESMTP; 04 Dec 2014 11:03:38 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.144]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.105]) with mapi id
	14.03.0195.001; Thu, 4 Dec 2014 19:03:37 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Gaurang Shastri <gshastri@juniper.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] When building with systemd based image,
	udev-hwdb postinstall script will fail because of not passing	correct
	CPU option. So fix it by passing correct QEMU_OPTIONS.
Thread-Index: AQHQCkDII0+lBNYbMEap6LyFPzzahZx/1Ncw
Date: Thu, 4 Dec 2014 19:03:37 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB2F3C553C@IRSMSX105.ger.corp.intel.com>
References: <1417087023-29423-1-git-send-email-gshastri@juniper.net>
In-Reply-To: <1417087023-29423-1-git-send-email-gshastri@juniper.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "gmshastri@gmail.com" <gmshastri@gmail.com>
Subject: Re: [PATCH] When building with systemd based image, udev-hwdb postinstall script will fail because of not passing	correct CPU option. So fix it by passing correct QEMU_OPTIONS.
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
X-List-Received-Date: Thu, 04 Dec 2014 19:04:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Gaurang,

Are you sure that the patch solves the described issue?
Because I have tested with:
MACHINE=3Dqemuppc bitbake core-image-sato
and I am still seeing the issue in rootfs log.

Can you please clarify how you tested this?

Regards,
Cristian Iorga
Yocto Project
Intel Corporation

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Gaurang Shastri
Sent: Thursday, November 27, 2014 1:17 PM
To: openembedded-core@lists.openembedded.org
Cc: gmshastri@gmail.com
Subject: [OE-core] [PATCH] When building with systemd based image, udev-hwd=
b postinstall script will fail because of not passing correct CPU option. S=
o fix it by passing correct QEMU_OPTIONS.

Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
---
 meta/classes/qemu.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass index b2=
cf85d..c373855 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -30,8 +30,9 @@ def qemu_run_binary(data, rootfs_path, binary):
     libdir =3D rootfs_path + data.getVar("libdir", False)
     base_libdir =3D rootfs_path + data.getVar("base_libdir", False)
     oldest_kernel =3D data.getVar("OLDEST_KERNEL", True)
+    qemu_option =3D data.getVar("QEMU_OPTIONS",True)
=20
-    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " -r " + oldest_kernel + "=
 -L " + rootfs_path\
+    return "PSEUDO_UNLOAD=3D1 " + qemu_binary + " " + qemu_option + " -r=20
+ " + oldest_kernel + " -L " + rootfs_path\
             + " -E LD_LIBRARY_PATH=3D" + libdir + ":" + base_libdir + " "\
             + rootfs_path + binary
=20
--
1.7.9.5

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

