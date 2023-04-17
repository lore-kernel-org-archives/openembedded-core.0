Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C57C77B72
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 06:57:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.48473.1681714611412032169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 23:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TM7T9Pwe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681714609; i=@fujitsu.com;
	bh=+a8b8+geMpdIiDAKqrk9gSdolhI35bCBsVsxG9djd3E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TM7T9Pwe1MP0BCNeVpSpcUloXQ86ZZCZ+AbHawXTs7A0cIRsWgL+E+JRY78/dzb59
	 IXZEGCNXM5XE/swyw6ylhUFcD1Ur1r6movKXS2FKc5dYJVji5aQ67OiWsUeuhHpVJC
	 GURlrXNyPDmZvtLLfUs/sFL/9KKH/jSJ+4nlKdvZzJsE8flx6Q/sqzx4C8BjetsWk5
	 fWxLsR4iyp09TYfRQMij2tCe9tiO6Zs8oqyqy2m5vzAe5qYmPdhatZaR5W1G9C6DLm
	 /fKjJY3agCOF/bhPt4PrzJleXMwhfQKQ1djdK2HL83O+ygCDqCoanpPJpOkQjqvpVO
	 GzPC7lpB343mw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8ORqLvxrU2
  KwfE3HBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bRzttMBT84Kg7/f8DSwDiLo4uRi0NI4DGj
  xPw5rxghnOtMEkvOz2OCcPYySjz6/pu1i5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBfwkvi5uZQKxWQRUJW40bQOL8wo4STzcMJkZxJYQUJCY8vA9M0RcUOLkzCcsEHMkJA
  6+eAFVoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo1lxalFZapGukYFeUlF
  mekZJbmJmjl5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmAwphQz7t3BOLnv
  r94hRkkOJiVR3hep1ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgbXtukCAkWpaanVqRl5gAjA
  yYtwcGjJMJr/AwozVtckJhbnJkOkTrFqCglzlv/BighAJLIKM2Da4NF4yVGWSlhXkYGBgYhno
  LUotzMElT5V4ziHIxKwrzXXgBN4cnMK4Gb/gpoMRPQYjklsMUliQgpqQamlZpbbgjt8uDkcG/
  9sX+R8c0ZxmYPYraaOb9RyqwOdqzdLxOxvuwOf7uD/PfT1uXpa7Uv+RvlMN7/suzh74xW8cnf
  5L943D+fGr42SeOUmX/Rb++0hRdPB65IXLXvmYyy91lFXv6LsR7n9D7qbP/XucP4xVw+Hu1lh
  g/ObsgoXb2F0f00/xW/2us2s8WvsWty5H7ZE6crsVfGKTBQ/c3d/c1Ck6OnzmXx2nbS0OxP0a
  JrFpsqGW99+eG83ZH5etLRLX276xYnuTSKSNd9nGKqmv4q+JXne3VRllDpuUyP95f9z1x9RUD
  SOdvRWG2/AksP//+gC9zuFxt3n9zmkn6XbZr5kv1tal/dmu9639ZQYinOSDTUYi4qTgQA8KAv
  DEEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-587.messagelabs.com!1681714608!478151!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13098 invoked from network); 17 Apr 2023 06:56:49 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 06:56:49 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B8DEC1001A5
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:48 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id ABD591001A1
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 07:56:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 07:56:47 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.9 -> 3.1.0
Date: Mon, 17 Apr 2023 14:56:31 +0800
Message-ID: <1681714595-18749-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Apr 2023 06:57:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180136

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Minor fix for cell color issue.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.9.bb => python3-xlsxwriter_3.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.9.bb => python3-xlsxwriter_3.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
index e4acf4159..d556e8b6d 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.9.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.1.0.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "7216d39a2075afac7a28cad81f6ac31b0b16d8976bf1b775577d157346f891dd"
+SRC_URI[sha256sum] = "02913b50b74c00f165933d5da3e3a02cab4204cb4932722a1b342c5c71034122"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


