Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B812175D07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 07:15:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6A7Ew10007627
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 00:14:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Jul 2015 00:14:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Jul 2015 00:14:46 -0700
Message-ID: <cover.1436512030.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/12] Remove invalid sed command
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
X-List-Received-Date: Fri, 10 Jul 2015 07:15:02 -0000
Content-Type: text/plain

The sed doesn't return false when miss match, I use a rough wrapper to
find out the mis matches:

1) s/sed -i/mysed -i/ in the recipes
  $ find meta -name '*.bbclass' -o -name '*.bb' -o -name '*.inc' -exec sed -i 's/[[:space:]]sed -i/ mysed -i/g' {} \;
2)  Add mysed to tmp/sysroots/x86_64-linux/usr/bin:
#!/bin/sh

for i in "$@"; do
    if [ -e "$i" ]; then
        cp "$i" "$i".sedbak
        /bin/sed "$@"
        num=`diff "$i" "$i".sedbak | wc -l`
        if [ $num -eq 0 ]; then
            echo "`pwd` XXX $@" >>/tmp/nothing_did_sed
        fi  
        rm -f "$i".sedbak
    fi  
done

3) Check /tmp/nothing_did_sed one by one and fix them.

// Robert

The following changes since commit 5a1f80e15d7fb60fd7c2b82aa769adef95d877a9:

  libtool: Fix regression from previous commit (2015-07-09 17:58:50 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/sed
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/sed

Robert Yang (12):
  elfutils 0.163: remove do_configure_prepend
  opkg: remove do_configure_prepend
  glibc-initial: remove invalid sed command
  qemu: remove invalid sed command
  rpm: remove invalid sed command
  mdadm: remove do_configure_prepend
  perl: remove invalid sed command
  python: remove invalid sed command
  python-pygtk: remove invalid sed command
  perf: remove invalid sed command
  cups: remove invalid sed command
  qt4: fixes for sed command

 meta/recipes-core/glibc/glibc-initial.inc          |    2 --
 .../{elfutils => elfutils-0.148}/i386_dis.h        |    0
 .../{elfutils => elfutils-0.148}/x86_64_dis.h      |    0
 meta/recipes-devtools/elfutils/elfutils_0.163.bb   |   10 ----------
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |    5 -----
 meta/recipes-devtools/perl/perl_5.22.0.bb          |    3 ---
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |   21 --------------------
 meta/recipes-devtools/python/python3_3.4.3.bb      |    2 --
 meta/recipes-devtools/python/python_2.7.9.bb       |    3 ---
 meta/recipes-devtools/qemu/qemu.inc                |   10 ----------
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 -
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 -
 meta/recipes-extended/cups/cups.inc                |    3 ---
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |    5 -----
 meta/recipes-kernel/perf/perf.bb                   |    6 ------
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |    8 ++------
 meta/recipes-qt/qt4/qt4.inc                        |    3 ---
 17 files changed, 2 insertions(+), 81 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/i386_dis.h (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/x86_64_dis.h (100%)

-- 
1.7.9.5


