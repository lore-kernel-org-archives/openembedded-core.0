Return-Path: <lxy204899@163.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AAB8CD128E
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 06:42:05 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by mx.groups.io with SMTP id smtpd.web10.9300.1711780918635462856
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Mar 2024 23:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@163.com header.s=s110527 header.b=U136YlCX;
 spf=pass (domain: 163.com, ip: 117.135.210.5, mailfrom: lxy204899@163.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Frn6c
	tiNS0zBXKCKgRqwUVDal7oVoJqg+WH/cVzChRk=; b=U136YlCXXaBhzlNZqrbss
	8v0WW82yOlvbGqBJdCVdKePgU47K763mtYxXxzCdcOWGcoi+Uj4lN2i9m67r2bjx
	f11XN+wSz0WsaMFgLoZu+Wur6Qax7q5zX8IjFfZrP0rLFTC3Jo6C/CqJYTlJTzsy
	StjpcigwSFgIQdTNKwfW40=
Received: from ubantupc-ThinkCentre-M920t-N000.. (unknown [139.159.170.28])
	by gzga-smtp-mta-g2-4 (Coremail) with SMTP id _____wDnl6YktAdm9nRIAg--.28555S5;
	Sat, 30 Mar 2024 14:41:50 +0800 (CST)
From: lixiaoyong <lxy204899@163.com>
To: openembedded-core@lists.openembedded.org
Cc: lixiaoyong <lixiaoyong19@huawei.com>
Subject: [PATCH 1/2] utils.bbclass: enhance readelf command call with llvm
Date: Sat, 30 Mar 2024 14:41:10 +0800
Message-Id: <20240330064111.2531269-2-lxy204899@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240330064111.2531269-1-lxy204899@163.com>
References: <20240330064111.2531269-1-lxy204899@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnl6YktAdm9nRIAg--.28555S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4fArWkJr48urWUGw43Awb_yoW8AF48p3
	W7Jrn7GF1UJF18Aw17AFyDW39I9a1IgasIqryUXw12krs8urykKa4Fgr15KF18Jay7Xry8
	XFs2gay5ua1UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwucNUUUUU=
X-Originating-IP: [139.159.170.28]
X-CM-SenderInfo: ho01jiiuyzmqqrwthudrp/xtbBdRqxomVOBVe3rwAAsd
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Mar 2024 06:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197645

From: lixiaoyong <lixiaoyong19@huawei.com>

Replace `${HOST_PREFIX}readelf` with `${READELF}`.

When utilizing llvm for compiling packages, the invocation of GNU readelf
will consistently occur if the oe_soinstall and oe_libinstall functions,
which are defined in utils.bbclass, are called. This behavior is unfriendly
to llvm. So prefer `${READELF}` over `${HOST_PREFIX}readelf`.

Signed-off-by: lixiaoyong <lixiaoyong19@huawei.com>
---
 meta/classes-global/utils.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-global/utils.bbclass b/meta/classes-global/utils.bbclass
index 8d797ff1..95738992 100644
--- a/meta/classes-global/utils.bbclass
+++ b/meta/classes-global/utils.bbclass
@@ -15,7 +15,7 @@ oe_soinstall() {
 	        ;;
 	esac
 	install -m 755 $1 $2/$libname
-	sonamelink=`${HOST_PREFIX}readelf -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
+	sonamelink=`${READELF} -d $1 |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
 	if [ -z $sonamelink ]; then
 		bbfatal "oe_soinstall: $libname is missing ELF tag 'SONAME'."
 	fi
@@ -147,7 +147,7 @@ oe_libinstall() {
 		# special case hack for non-libtool .so.#.#.# links
 		baselibfile=`basename "$libfile"`
 		if (echo $baselibfile | grep -qE '^lib.*\.so\.[0-9.]*$'); then
-			sonamelink=`${HOST_PREFIX}readelf -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
+			sonamelink=`${READELF} -d $libfile |grep 'Library soname:' |sed -e 's/.*\[\(.*\)\].*/\1/'`
 			solink=`echo $baselibfile | sed -e 's/\.so\..*/.so/'`
 			if [ -n "$sonamelink" -a x"$baselibfile" != x"$sonamelink" ]; then
 				__runcmd ln -sf $baselibfile $destpath/$sonamelink
-- 
2.34.1


