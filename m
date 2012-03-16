Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S8QdF-0003RW-3U
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 07:27:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2G6IWw1002539
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 23:18:32 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 15 Mar 2012 23:18:32 -0700
Message-ID: <cover.1331877464.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 16 Mar 2012 13:57:44 +0800
Date: Fri, 16 Mar 2012 14:23:25 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2G6IWw1002539
Subject: [PATCH 0/7] Realize archiving functions
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
X-List-Received-Date: Fri, 16 Mar 2012 06:27:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul & Mark,

I made some modification according to your suggestion. This is V3 for bug=
 1977
I removed the identification case which identify whether series and non-a=
pplying patches should be included in tarball or not. The default set inc=
lude series and non-applying files
Also, I removed the other one case to select packages filtered by copylef=
t_compliance.bbclass because the copyrights have been created as director=
y in archiver.bbclass.
So I think user can select the packages they want according to the direct=
ory name. I will export functions 'get_licenses' in archiver.bbclass inst=
ead of moving this to licenses.bbclass because if this function is moved =
to licenses.bbclass,  then this function don't have any connection with o=
ther functions in license.bbclass. If this function is in archiver.bbclas=
s,  then it will be called by function in archiver.bbclass.
all archiving packages will be deployed in ${DEPLOY_DIR}/sources

# the method to archive
inherit one of them(archive-original-source, archive-patched-source,archi=
ve-configured-source) in a base bbclass. for example, you can inherit arc=
hive-original-source in package_rpm.bbclass
$bitbake core-image-sato
<build successfully >
$ tree tmp/deploy/sources

  tmp/deploy/sources/
=E2=94=9C=E2=94=80=E2=94=80 allarch-poky-linux
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 CC-BY-SA-3.0
=E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 sato-icon-theme-0.4.1=
-r2
=E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 sato-icon-theme-0=
.4.1-r2.diff.gz
=E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 sato-icon-theme-0=
.4.1-r2-patches.tar.gz
=E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 sato-icon-theme-0=
.4.1-r2-prepatch.tar.gz
=E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 sato-icon-theme-0=
.4.1-r2-script-logs.tar.gz
=E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 sato-icon-theme-0=
.4.1-r2.showdata.dump
=E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 GPLv2
=E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hicolor-icon-theme-0.=
12-r0
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hicolor-i=
con-theme-0.12-r0.diff.gz
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hicolor-i=
con-theme-0.12-r0-patches.tar.gz
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hicolor-i=
con-theme-0.12-r0-prepatch.tar.gz
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hicolor-i=
con-theme-0.12-r0-script-logs.tar.gz
=E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 hicolor-i=
con-theme-0.12-r0.showdata.dump
 .......
=E2=94=94=E2=94=80=E2=94=80 i586-poky-linux
    =E2=94=9C=E2=94=80=E2=94=80 AFL-2GPLv2+
    =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 dbus-1.4.16-r2.0
    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 dbus-1.4.16-r2.0.=
diff.gz
    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 dbus-1.4.16-r2.0-=
patches.tar.gz
    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 dbus-1.4.16-r2.0-=
prepatch.tar.gz
    =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 dbus-1.4.16-r2.0-=
script-logs.tar.gz
    =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 dbus-1.4.16-r2.0.=
showdata.dump
    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 dbus-glib-0.92-r2
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 dbus-glib-0.92-r2.diff.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 dbus-glib-0.92-r2-patches=
.tar.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 dbus-glib-0.92-r2-prepatc=
h.tar.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 dbus-glib-0.92-r2-script-=
logs.tar.gz
    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 dbus-glib-0.92-r2.showdat=
a.dump
    =E2=94=9C=E2=94=80=E2=94=80 Artistic-1.0GPL-1.0
    =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 perl-5.14.2-r4
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 perl-5.14.2-r4.diff.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 perl-5.14.2-r4-patches.ta=
r.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 perl-5.14.2-r4-prepatch.t=
ar.gz
    =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 perl-5.14.2-r4-script-log=
s.tar.gz
    =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 perl-5.14.2-r4.showdata.d=
ump



Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1977
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofen=
g/1977

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (7):
  package_rpm: Add srpm function to this bbclass
  archiver.bbclass: New bbclass for archiving sources, patches,logs and
    scripts
  archive-patched-source.bbclass: Archive patched source
  archive-configured-source.bbclass: Archive configured source
  archive-original-source.bbclass: Archive original source
  local.conf.sample: Add set for archiving packages
  sourcepkg, src_distribute, src_distribute_local: remove three bbclass

 meta-yocto/conf/local.conf.sample              |   16 +
 meta/classes/archive-configured-source.bbclass |   14 +
 meta/classes/archive-original-source.bbclass   |   14 +
 meta/classes/archive-patched-source.bbclass    |   14 +
 meta/classes/archiver.bbclass                  |  419 ++++++++++++++++++=
++++++
 meta/classes/package_rpm.bbclass               |   47 +++
 meta/classes/sourcepkg.bbclass                 |  107 ------
 meta/classes/src_distribute.bbclass            |   49 ---
 meta/classes/src_distribute_local.bbclass      |   33 --
 9 files changed, 524 insertions(+), 189 deletions(-)
 create mode 100644 meta/classes/archive-configured-source.bbclass
 create mode 100644 meta/classes/archive-original-source.bbclass
 create mode 100644 meta/classes/archive-patched-source.bbclass
 create mode 100644 meta/classes/archiver.bbclass
 delete mode 100644 meta/classes/sourcepkg.bbclass
 delete mode 100644 meta/classes/src_distribute.bbclass
 delete mode 100644 meta/classes/src_distribute_local.bbclass



