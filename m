Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id DF68660762
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 13:37:58 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-05.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1aEdQU-0000Gj-Jb from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Dec 2015 05:37:58 -0800
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.44]) by
	SVR-IES-FEM-05.mgc.mentorg.com ([137.202.0.112]) with mapi id
	14.03.0224.002; Thu, 31 Dec 2015 13:37:57 +0000
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] grub2: Fix CVE-2015-8370
Thread-Index: AQHRPXKlzc7mBgdn8kWc/p76Y4njxZ7YbAUhgAy59M0=
Date: Thu, 31 Dec 2015 13:37:56 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FB77C39@EU-MBX-02.mgc.mentorg.com>
References: <1450869034-27510-1-git-send-email-awais_belal@mentor.com>,
	<2021B186DC632746BD5A3CE32F12BD280119AC1F0F@EU-MBX-03.mgc.mentorg.com>
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD280119AC1F0F@EU-MBX-03.mgc.mentorg.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [PATCH] grub2: Fix CVE-2015-8370
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
X-List-Received-Date: Thu, 31 Dec 2015 13:38:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: Belal, Awais=0A=
Sent: Wednesday, December 23, 2015 4:17 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: RE: [OE-core] [PATCH] grub2: Fix CVE-2015-8370=0A=
=0A=
This applies to jethro as well as master.=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Wednesday, December 23, 2015 4:10 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH] grub2: Fix CVE-2015-8370=0A=
=0A=
http://git.savannah.gnu.org/cgit/grub.git/commit/?id=3D451d80e52d851432e109=
771bb8febafca7a5f1f2=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 ...E-2015-8370-Grub2-user-pass-vulnerability.patch | 52 ++++++++++++++++++=
++++=0A=
 meta/recipes-bsp/grub/grub2.inc                    |  1 +=0A=
 2 files changed, 53 insertions(+)=0A=
 create mode 100644 meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub=
2-user-pass-vulnerability.patch=0A=
=0A=
diff --git a/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-=
pass-vulnerability.patch b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-83=
70-Grub2-user-pass-vulnerability.patch=0A=
new file mode 100644=0A=
index 0000000..f9252e9=0A=
--- /dev/null=0A=
+++ b/meta/recipes-bsp/grub/files/0001-Fix-CVE-2015-8370-Grub2-user-pass-vu=
lnerability.patch=0A=
@@ -0,0 +1,52 @@=0A=
+Upstream-Status: Accepted=0A=
+Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
+=0A=
+From 451d80e52d851432e109771bb8febafca7a5f1f2 Mon Sep 17 00:00:00 2001=0A=
+From: Hector Marco-Gisbert <hecmargi@upv.es>=0A=
+Date: Wed, 16 Dec 2015 04:57:18 +0000=0A=
+Subject: Fix security issue when reading username and password=0A=
+=0A=
+This patch fixes two integer underflows at:=0A=
+  * grub-core/lib/crypto.c=0A=
+  * grub-core/normal/auth.c=0A=
+=0A=
+CVE-2015-8370=0A=
+=0A=
+Signed-off-by: Hector Marco-Gisbert <hecmargi@upv.es>=0A=
+Signed-off-by: Ismael Ripoll-Ripoll <iripoll@disca.upv.es>=0A=
+Also-By: Andrey Borzenkov <arvidjaar@gmail.com>=0A=
+---=0A=
+diff --git a/grub-core/lib/crypto.c b/grub-core/lib/crypto.c=0A=
+index 010e550..683a8aa 100644=0A=
+--- a/grub-core/lib/crypto.c=0A=
++++ b/grub-core/lib/crypto.c=0A=
+@@ -470,7 +470,8 @@ grub_password_get (char buf[], unsigned buf_size)=0A=
+=0A=
+       if (key =3D=3D '\b')=0A=
+       {=0A=
+-        cur_len--;=0A=
++        if (cur_len)=0A=
++          cur_len--;=0A=
+         continue;=0A=
+       }=0A=
+=0A=
+diff --git a/grub-core/normal/auth.c b/grub-core/normal/auth.c=0A=
+index c6bd96e..8615c48 100644=0A=
+--- a/grub-core/normal/auth.c=0A=
++++ b/grub-core/normal/auth.c=0A=
+@@ -174,8 +174,11 @@ grub_username_get (char buf[], unsigned buf_size)=0A=
+=0A=
+       if (key =3D=3D '\b')=0A=
+       {=0A=
+-        cur_len--;=0A=
+-        grub_printf ("\b");=0A=
++        if (cur_len)=0A=
++          {=0A=
++            cur_len--;=0A=
++            grub_printf ("\b");=0A=
++          }=0A=
+         continue;=0A=
+       }=0A=
+=0A=
+--=0A=
+cgit v0.9.0.2=0A=
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.=
inc=0A=
index 312771b..a8c41f8 100644=0A=
--- a/meta/recipes-bsp/grub/grub2.inc=0A=
+++ b/meta/recipes-bsp/grub/grub2.inc=0A=
@@ -27,6 +27,7 @@ SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz=
 \=0A=
            file://0001-Unset-need_charset_alias-when-building-for-musl.pat=
ch \=0A=
            file://0001-parse_dhcp_vendor-Add-missing-const-qualifiers.patc=
h \=0A=
            file://grub2-fix-initrd-size-bug.patch \=0A=
+           file://0001-Fix-CVE-2015-8370-Grub2-user-pass-vulnerability.pat=
ch \=0A=
             "=0A=
=0A=
 DEPENDS =3D "flex-native bison-native xz"=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

