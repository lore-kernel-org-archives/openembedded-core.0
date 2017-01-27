Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6114877416
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 16:54:32 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 27 Jan 2017 08:54:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,296,1477983600"; d="scan'208";a="57996855"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga005.jf.intel.com with ESMTP; 27 Jan 2017 08:54:33 -0800
Received: from orsmsx155.amr.corp.intel.com (10.22.240.21) by
	ORSMSX107.amr.corp.intel.com (10.22.240.5) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 27 Jan 2017 08:54:32 -0800
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.23]) by
	ORSMSX155.amr.corp.intel.com ([169.254.7.181]) with mapi id
	14.03.0248.002; Fri, 27 Jan 2017 08:54:32 -0800
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: "Ohly, Patrick" <patrick.ohly@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v5 09/12] runqemu: also accept -image suffix
	for	rootfs parameter
Thread-Index: AQHSeLKXLhB2RPlHFUewFmBs07llZaFMiaR8
Date: Fri, 27 Jan 2017 16:54:32 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B6118F7EEC@ORSMSX112.amr.corp.intel.com>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>,
	<707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
In-Reply-To: <707323fc8105d9a1cf77fe340ebff387862c8e8e.1485530988.git-series.patrick.ohly@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Subject: Re: [PATCH v5 09/12] runqemu: also accept -image suffix for	rootfs parameter
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
X-List-Received-Date: Fri, 27 Jan 2017 16:54:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Just curious: is this test for "image" in file name really necessary?=0A=
With qemuboot.conf the relevant files are already spelled out.=0A=
I don't see a need to force "compulsory" names for images.=0A=
If I comment out this test, everything works just fine. Am I missing someth=
ing?=0A=
=0A=
Juro=0A=
________________________________________=0A=
From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-b=
ounces@lists.openembedded.org] on behalf of Patrick Ohly [patrick.ohly@inte=
l.com]=0A=
Sent: Friday, January 27, 2017 7:30 AM=0A=
To: openembedded-core@lists.openembedded.org=0A=
Subject: [OE-core] [PATCH v5 09/12] runqemu: also accept -image suffix for =
     rootfs parameter=0A=
=0A=
The magic detection of the rootfs parameter only worked for image=0A=
recipes which embedd the "image" string in the middle, as in=0A=
"core-image-minimal".=0A=
=0A=
Sometimes it is more natural to call an image "something-image". To=0A=
get such an image detected by runqemu, "-image" at the end of a=0A=
parameter must also cause that parameter to be treated as the rootfs=0A=
parameter.=0A=
=0A=
Inside the image directory, "something-image" has an -<arch> suffix=0A=
and thus no change is needed for those usages of=0A=
re.search('-image-'). However, while at it also enhance those string=0A=
searches a bit (no need for re; any()+map() a bit closer to the=0A=
intended logic).=0A=
=0A=
Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>=0A=
---=0A=
 scripts/runqemu | 6 +++---=0A=
 1 file changed, 3 insertions(+), 3 deletions(-)=0A=
=0A=
diff --git a/scripts/runqemu b/scripts/runqemu=0A=
index 17d79e9..4d7168c 100755=0A=
--- a/scripts/runqemu=0A=
+++ b/scripts/runqemu=0A=
@@ -218,7 +218,7 @@ class BaseConfig(object):=0A=
             if not re.search('.qemuboot.conf$', '\n'.join(os.listdir(p)), =
re.M):=0A=
                 logger.info("Can't find required *.qemuboot.conf in %s" % =
p)=0A=
                 return False=0A=
-            if not re.search('-image-', '\n'.join(os.listdir(p))):=0A=
+            if not any(map(lambda name: '-image-' in name, os.listdir(p)))=
:=0A=
                 logger.info("Can't find *-image-* in %s" % p)=0A=
                 return False=0A=
             return True=0A=
@@ -267,7 +267,7 @@ class BaseConfig(object):=0A=
              re.search('zImage', p) or re.search('vmlinux', p) or \=0A=
              re.search('fitImage', p) or re.search('uImage', p):=0A=
             self.kernel =3D  p=0A=
-        elif os.path.exists(p) and (not os.path.isdir(p)) and re.search('-=
image-', os.path.basename(p)):=0A=
+        elif os.path.exists(p) and (not os.path.isdir(p)) and '-image-' in=
 os.path.basename(p):=0A=
             self.rootfs =3D p=0A=
             # Check filename against self.fstypes can hanlde <file>.cpio.g=
z,=0A=
             # otherwise, its type would be "gz", which is incorrect.=0A=
@@ -381,7 +381,7 @@ class BaseConfig(object):=0A=
                 self.kernel_cmdline_script +=3D ' %s' % arg[len('bootparam=
s=3D'):]=0A=
             elif os.path.exists(arg) or (re.search(':', arg) and re.search=
('/', arg)):=0A=
                 self.check_arg_path(os.path.abspath(arg))=0A=
-            elif re.search('-image-', arg):=0A=
+            elif re.search(r'-image-|-image$', arg):=0A=
                 # Lazy rootfs=0A=
                 self.rootfs =3D arg=0A=
             else:=0A=
--=0A=
git-series 0.9.1=0A=
--=0A=
_______________________________________________=0A=
Openembedded-core mailing list=0A=
Openembedded-core@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-core=0A=

