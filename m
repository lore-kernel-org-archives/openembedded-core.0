Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02241C54E5D
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 03:05:47 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.12112.1710471942406760682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Mar 2024 20:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GIWvPE2a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710471942; x=1742007942;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5/8GFExdXHdfwjupZjW1QvHM5F4MJkIXPTymA6SLGIA=;
  b=GIWvPE2aMsH8Q5U4YPmDbXllIycGsfPYA4yf+cH2PjnnyLIMam2AKxeI
   2Pgo4W8LKJ4TO9A0OHi5z3WdGROwX+F7nfIqFl4Gdnc7QkO38rNsumkOA
   8PATC6NktXkSqZXTLNDmxNcnmpgoKwDL3Lu3qXSOkG/AFyLqnuodKqcB6
   +1N/4n6Q9otDMl57oQRQ61lIj0aM/nthsswLq4Tc10AHKPn0Wc8DUCy3Q
   lTEbYCdq7ae3TBYId60R2bDWhXhDhaiTcPcNoQX1uSIXUbPqFjFUobfnv
   v1uGUpHOMU9Lylxf64wuPPFCbQFxJ2udcer79mFuewHPk6fQF6ZLkgwt7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="131641386"
X-IronPort-AV: E=Sophos;i="6.07,127,1708354800"; 
   d="scan'208";a="131641386"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 12:05:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA5D8D4801
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:05:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0745DB1C13
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:05:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8366320093265
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 12:05:36 +0900 (JST)
Received: from ubuntu20.04 (unknown [10.193.130.22])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0DB5D1A006B;
	Fri, 15 Mar 2024 11:05:35 +0800 (CST)
From: leimaohui@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v2 0/2] glibc: Fix conflict error when enbale multilib on aarch64.
Date: Fri, 15 Mar 2024 11:05:29 +0800
Message-Id: <20240315030531.1179974-1-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28252.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28252.004
X-TMASE-Result: 10--0.458600-10.000000
X-TMASE-MatchedRID: OrmchdgBibAvKBNTYKG+pX1JIA4rhsZ/sk61leL8Ml/URn+XOe/hRZ3E
	YchBzOdXfAO+znDa0GYZzvNKCoURYFpCIuRr0RxKuce7gFxhKa19LQinZ4QefCP/VFuTOXUTl7B
	AyKmXjyPkwjHXXC/4I8ZW5ai5WKlyPH5WlUjV9VB8jLDb2jcZIXhEUxKRVpYBDh11ze+Ie/Zu1O
	iuyxJlXWztpzsSPkUyYf974snQnVtc1Nbqw5nV3lPtrB6h52VOEWW0bEJOTAVAdUD6vW8Z1mZAM
	QMIyK6zB8/x9JIi8hKhgLRzA45JPQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 03:05:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197123

From: Lei Maohui <leimaohui@fujitsu.com>

- Fix conflict of finclude/math-vector-fortran.h error when enable multilib on
  aarch64.
- Because multilib header doesn't work well for fortran compiler, a compile
  error will occur with above glibc patch. So, disable multilib_header when
  fortran is enabled.

Lei Maohui (2):
  multilib_header.bbclass:Disable multilib_header when fortran is
    enabled.
  glibc: Fix conflict error when enbale multilib on aarch64.

 meta/classes-recipe/multilib_header.bbclass | 6 ++++++
 meta/recipes-core/glibc/glibc-package.inc   | 1 +
 2 files changed, 7 insertions(+)

-- 
2.25.1


