Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE453C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:58:08 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.8388.1667545078905070022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:57:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WNG00Rxv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667545077; i=@fujitsu.com;
	bh=Bao70V8rIbf2uM+5/+aPwvbDqZTGK/a/SeHSJffL3lA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=WNG00Rxvej5EVpwJwVkxzSx1QAuuCZJ0bKk4r8T6nsyZqnAPRA3/AQWhoEahOoayu
	 DAGg1RcRqpNK9J6kiM7RoukMpCQ0CsrT2nX/ku6kWby8Vgt/ew6yvmDn1gIJf+vIIa
	 LB1FOh2JHJHCZy0/XCWSKjSKvSgg5vwSUydDhwZKihyK/34AbafHanDkzTG2eMDCyA
	 dM4r+1Y6wZgxfSD38ACiGQrjMV/mDHmeK88Nw/YHUCZMLNiXqcuOdtum0R9/9faN2l
	 QVUPZ8oIOOBGItSJ1J5jxADVYXbOaoROdsBe4VAi+k1Rovocp7ELRR6ONunocnKv3R
	 Kgx566JkGtYgw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8OxWffL9pR
  kg3trBCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxfry6zFezgr+jZfYGtgfEGbxcjF4eQwANG
  iXP75zJCOJeYJHa8mMoO4exnlJiw8glLFyMnB5uAgsTCrWdYuxg5OEQE9CSu/hMFMYUF3CWm3
  AKLsgioSEy64w9i8gJFD/0XAOmTAOqb8vA9M4jNKyAocXImxDxmAQmJgy9eMIOUSwgoSsyeLg
  9RXiExa1YbE4StJnH13CbmCYx8s5B0z0LSvYCRaRWjaXFqUVlqka6pXlJRZnpGSW5iZo5eYpV
  uol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTopeXmrJJkZgqKUUM5btYOxe9kfvEKMkB5OSKG8d
  b0qyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnevG1AOcGi1PTUirTMHGDYw6QlOHiURHh/zwNK8
  xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnPc0yAwBkKKM0jy4EbAYvMQoKyXMy8jAwCDEU5
  BalJtZgir/ilGcg1FJmDccZApPZl4J3KZXQEcwAR2xrToJ5IiSRISUVAOTz3tufqOUx1veJ1w
  6EjJbS/tOVP7/7U/YeXw4OQWbHL+ttGL/NKfn9ZxdL/v+qp8/rntc7lvOgwPJjOxTrqUedHp5
  cKOE4f1/57IYjnW/EtG9GbDyZ+HRmHqbB9skF2xb3VN0u3djonkfg1K25Iw1r3SdxA9vPW9yp
  LOZlcliec8R3a9VYseFmm3LpfU3F7sHrGbeIvx3H5te2RfB50fdE1rPsH3d9ZrzpQXXsWaFD7
  HKQUYJwQbZIf4pMhsbs/jfySvcqsnkdJgdzZ1Vul73ZH9WQuWBOmu9gJOLlplrTI3iZzS9nrw
  oa8udPt9V/EGztvT9LVt7099V42/qk4YlZ9friTMmvHu6b0HLUkUlluKMREMt5qLiRAAJk6Ch
  PAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-27.tower-585.messagelabs.com!1667545076!109318!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10040 invoked from network); 4 Nov 2022 06:57:56 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-27.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:57:56 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E3AF2152
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:57:55 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D746273
	for <openembedded-core@lists.openembedded.org>; Fri,  4 Nov 2022 06:57:55 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:57:54 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pyrsistent: upgrade 0.18.1 -> 0.19.2
Date: Fri, 4 Nov 2022 14:57:46 +0800
Message-ID: <1667545066-2456-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 06:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172698

Changelog:
==========
 * Fix #263, pmap regression in 0.19.1. Element access sometimes unreliable after insert.
 * Fix #159 (through PR #243). Pmap keys/values/items now behave more like the corresponding Python 3
   methods on dicts. Previously they returned a materialized PVector holding the items, now they return
   views instead. This is a slight backwards incompatibility compared to previous behaviour, hence stepping
   version to 0.19.
 * Fix #244, type for argument to PVector.delete missing.
 * Fix #249, rename perf test directory to avoid tripping up automatic discovery in more recent setuptools versions
 * Fix #247, performance bug when setting elements in maps and adding elements to sets
 * Fix #248, build pure Python wheels. This is used by some installers.
 * Fix #254, #258, support manylinux_2014_aarch64 wheels.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-pyrsistent_0.18.1.bb => python3-pyrsistent_0.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyrsistent_0.18.1.bb => python3-pyrsistent_0.19.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb b/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
rename to meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb
index b4d9e3af39..0b309de8b1 100644
--- a/meta/recipes-devtools/python/python3-pyrsistent_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-pyrsistent_0.19.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/tobgu/pyrsistent"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e"
 
-SRC_URI[sha256sum] = "d4d61f8b993a7255ba714df3aca52700f8125289f84f704cf80916517c46eb96"
+SRC_URI[sha256sum] = "bfa0351be89c9fcbcb8c9879b826f4353be10f58f8a677efab0c017bf7137ec2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


