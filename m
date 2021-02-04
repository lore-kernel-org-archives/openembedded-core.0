Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web10.5016.1612427106398095929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 00:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
IronPort-SDR: Hh6c46Hj+1miqy2K/1qeL6mQ3aW3dn8+JFbX3WSwluibGJATW19Ed6XtfqEYWYMaCG8QFTzMyt
 DDP1i2ebAT6di+DawwA1x87hyS6ZaYEzgz3EH9cMByBjuU1KERD1sbbxyD7bg6wW6AqKBMVV3C
 Bc0gQ0BXl7MRNBok6Z0AXcls+rLKmMKyhNj2gyEf8igA3R3wL4Gz9YawqYsSGAVWD66WegbPKW
 Aq+CjylKb6hCp6T/EyAzy3E9cVNH6tPPPKL9RECArUcL36QarR5zaZc8t8MSQvi4sGytkGpZ3+
 Twk=
X-IronPort-AV: E=Sophos;i="5.79,400,1602576000"; 
   d="scan'208";a="60060548"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 04 Feb 2021 00:25:04 -0800
IronPort-SDR: ZhLwH8VETpYKs0MFQKcJFcx24RrgvBE9LZR/XclyYIWo6Dnx2usIX287bk6baXYbmQCRJoNFIH
 Ra6hqW8G+JO1KQter+bkhCNEaYE0XF/63cY8hb/V7773QCu3SsAYiGONjrosR5YSAfrAfSIYvZ
 4JSG4tTAUkDGfwAkoyseU9o9TXQoXUvYo/mN6jQlgR+jvU2xufmBd+ZhrTRdyDMVL+YoxSs6A1
 yRgr9sEpLSsprEmpi3Futxd7NuHGaMog1R5JC9IQCfbd1v9MP+/vDosL7d2XQhtrjtmWDn4dXA
 plE=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: fix deployment for initramfs images
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: fix deployment for initramfs
 images
Thread-Index: AQHW9jxcF9Ph7kzjp06tWJ6Ayv0IYKpHsaIQ
Date: Thu, 4 Feb 2021 08:25:00 +0000
Message-ID: <931232d223874e60aef228ad4c77f8d7@SVR-IES-MBX-03.mgc.mentorg.com>
References: <165EB485E3CC1C7F.12832@lists.openembedded.org>
In-Reply-To: <165EB485E3CC1C7F.12832@lists.openembedded.org>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The do_bundle_initramfs() only processes kernel image
types that are found in KERNEL_IMAGETYPE_FOR_MAKE whereas
the build system can generate other types that are not
directly supported by the kernel build system. In which
case when we come to the deploy phase not all the images
mentioned in KERNEL_IMAGETYPES would have a respective
initramfs bundled image. An example is using vmlinux.gz
in KERNEL_IMAGETYPES and enabling initramfs and then we
see

install: cannot stat 'arch/arm64/boot/vmlinux.gz.initramfs': No such file o=
r directory

So we align the deploy phase with bundle initramfs phase
and pick up relevant initramfs bundled images using
KERNEL_IMAGETYPE_FOR_MAKE instead of KERNEL_IMAGETYPES.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ddff2ddcd2..8693ab86be 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -759,7 +759,7 @@ kernel_do_deploy() {
        fi

        if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =3D =
x1 ]; then
-               for imageType in ${KERNEL_IMAGETYPES} ; do
+               for imageType in ${KERNEL_IMAGETYPE_FOR_MAKE} ; do
                        if [ "$imageType" =3D "fitImage" ] ; then
                                continue
                        fi
--
2.17.1


Ping!
