Return-Path: <leimaohui@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 25F896010E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 06:46:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.90,938,1371052800"; 
   d="scan'208";a="8569340"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 20 Sep 2013 14:42:58 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r8K6k9Fs016107
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:46:10 +0800
Received: from G08FNSTD100511 ([10.167.226.63])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013092014443548-1650810 ;
	Fri, 20 Sep 2013 14:44:35 +0800 
From: "leimaohui" <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Sep 2013 14:46:03 +0800
Message-ID: <00d201ceb5cd$1440b070$3cc21150$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac61zQ8JDgXxKy1ZTIiB+KwNFfN0fQ==
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/09/20 14:44:35,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/09/20 14:44:36,
	Serialize complete at 2013/09/20 14:44:36
Subject: [PATCH 1/1]udev_182: creat a symbolic file /sbin/udevadm to fix haldaemon starts error.
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
X-List-Received-Date: Fri, 20 Sep 2013 06:46:10 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="us-ascii"
Content-Language: zh-cn

The haldaemon requires /sbin/udevadm to start.
So creat a symbolic file  /sbin/udevadm that links to /usr/bin/udevadm.



Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-core/udev/udev.inc |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index dd250f7..fe53979 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -93,6 +93,9 @@ do_install_append () {
    install -d ${D}${sysconfdir}/udev/rules.d/

    install -m 0644 ${WORKDIR}/local.rules
${D}${sysconfdir}/udev/rules.d/local.rules
+
+   install -d ${D}/${base_sbindir}
+   ln -s ../usr/bin/udevadm ${D}/${base_sbindir}/udevadm

    # hid2hci has moved to bluez4. removed in udev as of version 169
    rm -f ${D}${base_libdir}/udev/hid2hci
--
1.7.1



