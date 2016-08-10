Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 343BC771E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 11:02:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bXRHF-0006MU-0M from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2016 04:02:25 -0700
Received: from EU-MBX-03.mgc.mentorg.com ([169.254.2.210]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Wed, 10 Aug 2016 11:59:43 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [[PATCH v3] init-install*: /etc/mtab make a link
	rather	than a copy
Thread-Index: AQHR6+hfdjsa0Swi3EWatLFo0SUxIqBCFLiu
Date: Wed, 10 Aug 2016 10:59:42 +0000
Message-ID: <2021B186DC632746BD5A3CE32F12BD28011FCDA296@EU-MBX-03.mgc.mentorg.com>
References: <1470051103-4924-1-git-send-email-awais_belal@mentor.com>
In-Reply-To: <1470051103-4924-1-git-send-email-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
MIME-Version: 1.0
Subject: Re: [[PATCH v3] init-install*: /etc/mtab make a link rather	than a copy
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
X-List-Received-Date: Wed, 10 Aug 2016 11:02:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping!=0A=
=0A=
BR,=0A=
Awais=0A=
=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Belal, Awais=0A=
Sent: Monday, August 01, 2016 4:31 PM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [[PATCH v3] init-install*: /etc/mtab make a link rather =
     than a copy=0A=
=0A=
Using a copy would only make management of devices erroneous=0A=
and makes the system unstable in some scenarios as tools will=0A=
have to manipulate both files separately. A link ensures that=0A=
both files /proc/mounts and /etc/mtab will have the same=0A=
information at all times and this is how it is handled=0A=
on newer systems where there is such a need. Same is=0A=
suggested by busybox.=0A=
=0A=
Signed-off-by: Awais Belal <awais_belal@mentor.com>=0A=
---=0A=
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 4 ++--=0A=
 meta/recipes-core/initrdscripts/files/init-install.sh     | 4 ++--=0A=
 2 files changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/me=
ta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
index f564f4e..c5db2f0 100644=0A=
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh=0A=
@@ -122,8 +122,8 @@ umount ${device}* 2> /dev/null || /bin/true=0A=
 mkdir -p /tmp=0A=
=0A=
 # Create /etc/mtab if not present=0A=
-if [ ! -e /etc/mtab ]; then=0A=
-    cat /proc/mounts > /etc/mtab=0A=
+if [ ! -e /etc/mtab ] && [ -e /proc/mounts ]; then=0A=
+    ln -sf /proc/mounts /etc/mtab=0A=
 fi=0A=
=0A=
 disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut=
 -d" " -f 3 | sed -e "s/MB//")=0A=
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/r=
ecipes-core/initrdscripts/files/init-install.sh=0A=
index 72ce92b..bf92acb 100644=0A=
--- a/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh=0A=
@@ -118,8 +118,8 @@ if [ ! -b /dev/loop0 ] ; then=0A=
 fi=0A=
=0A=
 mkdir -p /tmp=0A=
-if [ ! -L /etc/mtab ]; then=0A=
-    cat /proc/mounts > /etc/mtab=0A=
+if [ ! -L /etc/mtab ] && [ -e /proc/mounts ]; then=0A=
+    ln -sf /proc/mounts /etc/mtab=0A=
 fi=0A=
=0A=
 disk_size=3D$(parted ${device} unit mb print | grep '^Disk .*: .*MB' | cut=
 -d" " -f 3 | sed -e "s/MB//")=0A=
--=0A=
1.9.1=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

