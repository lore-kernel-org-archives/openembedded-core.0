Return-Path: <Noor_Ahsan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C7D7F770F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 10:14:15 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1ZpCsw-0005fv-UL from Noor_Ahsan@mentor.com ;
	Thu, 22 Oct 2015 03:14:15 -0700
Received: from EU-MBX-01.mgc.mentorg.com ([169.254.1.18]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Thu, 22 Oct 2015 11:14:02 +0100
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [RFC] rawcopy.py: Copy source file in image creation build folder
Thread-Index: AQHRDBpMmQJRJH2xI0egLkJjuEGttZ53TCyA
Date: Thu, 22 Oct 2015 10:14:02 +0000
Message-ID: <365E1805BC95084CBE82381A0B86999401095FB9D1@EU-MBX-01.mgc.mentorg.com>
References: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
In-Reply-To: <1445443468-8394-1-git-send-email-noor_ahsan@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.76]
MIME-Version: 1.0
Subject: Re: [RFC] rawcopy.py: Copy source file in image creation build folder
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
X-List-Received-Date: Thu, 22 Oct 2015 10:14:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



-----Original Message-----
From: Ahsan, Noor=20
Sent: Wednesday, October 21, 2015 9:04 PM
To: openembedded-core@lists.openembedded.org
Cc: Ahsan, Noor
Subject: [RFC] rawcopy.py: Copy source file in image creation build folder

From: Noor <noor_ahsan@mentor.com>

* When a file is given using --sourceparams then wic directly use that file
  instead of copying them to build folder. At time of assmebling it os.rena=
me
  is called which rename all the files to name. In that process the origina=
l
  file get renamed. When image recipe is rebuilt then wic complains about
  missing file which renamed in previous build.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py
index f0691ba..f17da27 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -74,6 +74,10 @@ class RawCopyPlugin(SourcePlugin):
             dd_cmd =3D "dd if=3D%s of=3D%s ibs=3D%s skip=3D1 conv=3Dnotrun=
c" % \
                     (src, dst, source_params['skip'])
             exec_cmd(dd_cmd)
+        else:
+            dst =3D os.path.join(cr_workdir, source_params['file'])
+            dd_cmd =3D "cp src dst"
+            exec_cmd(dd_cmd)


dd_cmd will be replaced by cp_cmd but I need review of all impact of this s=
o that I can send proper patch.


         # get the size in the right units for kickstart (kB)
         du_cmd =3D "du -Lbks %s" % dst
--=20
1.7.9.5


