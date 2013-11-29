Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B75866C73E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 12:47:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rATClpWw028270
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 04:47:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 29 Nov 2013 04:47:51 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Nov 2013 20:48:08 +0800
Message-ID: <cover.1385728901.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/18] Fix the problem of implicit bash dependency
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
X-List-Received-Date: Fri, 29 Nov 2013 12:47:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

If package A has implicit bash dependency but there's no explicit runtime
dependency written in its recipe, the rootfs task would fail if A is intalled
onto an image which doesn't have installed.

For example, if we add nfs-utils to core-image-minimal via:
    IMAGE_INSTALL_append = " nfs-utils"
and then build the image from a clean build (no previously built bash package in
the package repo), the build would fail for the reason of lack of bash package.

This patchset is an effort to solve this problem. After this patch, there's no
such problem in oe-core. But other layers also needs to be fixed for this problem.

//Chen Qi

P.S.
The bash dependency problem is automatically detected by the following script:

#!/bin/sh

if [ $# -lt 1 ]; then
    echo "$0 <rpm repo> [report file]"
    exit 1
fi

RPM_REPO="$1"
REPORT_FILE=${2:-bash-deps.report}
echo "Analyzing packages under $RPM_REPO ... "

for pkg in `find $RPM_REPO -name "*.rpm"`; do
    echo $pkg
    result="`rpm -qp --requires $pkg 2>/dev/null | grep -w bash | sort -u | sed -e 's/[ ]*$//'`"
    if [ "$result" = "/bin/bash" ]; then
    echo "MISS: <$pkg>" >> $REPORT_FILE
    else
    echo "OK: <$pkg>" >> $REPORT_FILE
    fi
done

echo "Done. Report could be found in $REPORT_FILE"

Please refer to https://bugzilla.yoctoproject.org/show_bug.cgi?id=5555 for more info.


The following changes since commit 7b9f4b2cd0fe6dc9a536a2db98ed93ffa8c05a8f:

  base/gcc-common: Ensure umask setting is consistent for shared workdir (2013-11-29 11:24:48 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bash-deps
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bash-deps

Chen Qi (18):
  linux-firmware: de-bash scripts to remove bash dependency
  apr: make the dev package rdepend on bash
  libpam: make libpam-xtests rdepend on bash
  hdparm: make wiper appear before hdparm in PACKAGES
  lsb: de-bash scripts to remove bash dependency
  xz: rdepend on bash
  dtc: make dtc-misc rdepend on bash
  lsbtest: de-bash script to remove bash dependency
  libtool: explicitly rdepend on bash
  rpm: fix RDEPENDS for rpm-build
  nfs-utils: add bash to RDEPENDS
  apt: explicitly rdepend on bash
  gzip: explicitly rdepend on bash
  pm-utils: explicitly rdepend on bash
  ltp: explicitly rdepend on bash
  kconfig-frontends: explicitly rdepend on bash
  pax-utils: add bash runtime dependency
  kernel.bbclass: make kernel-dev explicitly rdepend on bash

 meta/classes/kernel.bbclass                        |    1 +
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    2 +-
 .../nfs-utils/nfs-utils_1.2.9.bb                   |    2 +-
 meta/recipes-devtools/apt/apt_0.9.9.4.bb           |    2 +-
 .../kconfig-frontends_3.12.0.0.bb                  |    1 +
 meta/recipes-devtools/libtool/libtool-2.4.2.inc    |    1 +
 meta/recipes-devtools/pax-utils/pax-utils_0.7.bb   |    2 +
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 meta/recipes-extended/gzip/gzip.inc                |    2 +
 meta/recipes-extended/hdparm/hdparm_9.43.bb        |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_killproc         |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_log_message      |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_pidofproc        |    2 +-
 meta/recipes-extended/lsb/lsb/lsb_start_daemon     |    2 +-
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh      |    4 +-
 meta/recipes-extended/ltp/ltp_20130904.bb          |    2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    2 +-
 meta/recipes-extended/xz/xz_5.1.3alpha.bb          |    2 +
 meta/recipes-kernel/dtc/dtc.inc                    |    1 +
 .../files/0001-linux-firmware-de-bash.patch        |   47 ++++++++++++++++++++
 .../linux-firmware/linux-firmware_git.bb           |    3 +-
 meta/recipes-support/apr/apr_1.4.8.bb              |    1 +
 22 files changed, 73 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-linux-firmware-de-bash.patch

-- 
1.7.9.5


