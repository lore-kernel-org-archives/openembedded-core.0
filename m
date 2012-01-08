Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Rjnmp-00057g-9U
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 09:07:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q087MLOF013069
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 7 Jan 2012 23:22:21 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 7 Jan 2012 23:22:20 -0800
Message-ID: <cover.1326003199.git.xiaofeng.yan@windriver.com>
Old-Date: Sun, 8 Jan 2012 14:13:19 +0800
Date: Sun, 8 Jan 2012 15:11:22 +0800
To: <openembedded-core@lists.openembedded.org>, <mark.hatle@windriver.com>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q087MLOF013069
Subject: [PATCH 0/2] Add function to package source codes tree to source rpm and tar packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jan 2012 08:07:27 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add file "tar_archive.bbclass" and modify file "package_rpm.bbclass" for =
packaging source codes tree to source rpm and tar packages.
After adding srpm function in file "package_rpm.bbclass", user can get so=
urce rpm packages beside rpm package.
User also get tar packages of source codes tree according to the requirem=
ent from bug 1655. The final result is as follow:
Take qemux86 for an example:
Get source rpm pakcages
1 Inherit tar_archive.bbclass in package_rpm.bbclass.
2 Select the type of packaging source code tree in conf/local.conf(ARCHIV=
E_TYPE ?=3D "SRPM")
3 Run the following command=20
  $ bitbake core-image-sato -c copysources
4 Get source rpm packages:
  $ tree build/tmp/deploy/sources
  build/tmp/deploy/sources/
  =E2=94=94=E2=94=80=E2=94=80 qemux86
    =E2=94=9C=E2=94=80=E2=94=80 all-poky-linux
    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 encodings-1.0.4-r2.=
1.src.rpm
        ......
    =E2=94=9C=E2=94=80=E2=94=80 i586-poky-linux
    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 acl-2.2.51-r2.src.r=
pm
        ......
    =E2=94=94=E2=94=80=E2=94=80 qemux86-poky-linux
        =E2=94=9C=E2=94=80=E2=94=80 base-files-3.0.14-r70.src.rpm
        ......
Get tar packages:
1 Inherit tar_archive.bbclass in an suitable position (for example, packa=
ge_rpm.bbclass).
2 Select the type of packaging source code tree in conf/local.conf(ARCHIV=
E_TYPE ?=3D "TARGZ")
3 Run the following command=20
  $ bitbake core-image-sato -c copysources
4 Get tar packages:=20
  $ tree build/tmp/deploy/sources
  buildx86/tmp/deploy/sources
  =E2=94=94=E2=94=80=E2=94=80 qemux86
    =E2=94=9C=E2=94=80=E2=94=80 all-poky-linux
    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 encodings-1_1.0.4-r=
2.1
    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 encodings-1_1.0.4-r2.1.tar.gz
    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 log.tar.gz
            ......
    =E2=94=9C=E2=94=80=E2=94=80 i586-poky-linux
    =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 acl-2.2.51-r2
    =E2=94=82=C2=A0=C2=A0 =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80=
 acl-2.2.51-r2.tar.gz
            =E2=94=94=E2=94=80=E2=94=80 log.tar.gz
            ......
    =E2=94=94=E2=94=80=E2=94=80 qemux86-poky-linux
        =E2=94=9C=E2=94=80=E2=94=80 core-image-sato-1.0-r0
        =E2=94=9C=E2=94=80=E2=94=80 libzypp-0.0-git1+15b6c52260bbc52b3d8e=
585e271b67e10cc7c433-r17
        =E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 libzypp-0.0-git=
1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r17.tar.gz
        =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 log.tar.gz
            ......

if inheriting tar_archive.bbclass in one bb file, then only package sourc=
e codes tree of this file.
Take zlib for an example:
Get source rpm pakcage of zlib
1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
2 Select the type of packaging source code tree in conf/local.conf(ARCHIV=
E_TYPE ?=3D "SRPM")
3 Run the following command=20
  $ bitbake zlib
4 Get source rpm package:
  $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/deploy-srpm/i586/
    zlib-1.2.5-r3.src.rpm


Get tar package of zlib
1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
2 Select the type of packaging source code tree in conf/local.conf(ARCHIV=
E_TYPE ?=3D "TARGZ")
3 Run the following command=20
  $ bitbake zlib=20
4 Get tar package:
  $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/
    zlib-1.2.5-r3.tar.gz log.tar.gz ......


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1655
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofen=
g/1655

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (2):
  package_rpm.bbclass: add srpm function in spec file
  tar_archive.bbclass: Package source codes and log files to tar
    package

 meta/classes/package_rpm.bbclass |   65 ++++++++++--
 meta/classes/tar_archive.bbclass |  216 ++++++++++++++++++++++++++++++++=
++++++
 2 files changed, 271 insertions(+), 10 deletions(-)
 create mode 100644 meta/classes/tar_archive.bbclass

--=20
1.7.7



