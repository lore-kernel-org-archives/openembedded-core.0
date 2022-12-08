Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C321BC63708
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:10:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.6969.1670479832970527362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=A/Y4/Zuj;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479831; i=@fujitsu.com;
	bh=/CnCnAMiZofYjj7kKYf9QU0fMiUt2MQD+uGQ3/VKJog=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=A/Y4/ZujLNWVBu4zYpAHpPutWMhuu8YQfikqJW9zKulp05IBNGFIflakumogKwDio
	 xSa/QzNW2V5pldQ7LgHZ13rQrZZ24P1k9rLzhGt0P7shsJHBdcxaUKYV19udKW83/y
	 SqrBLgYp7eOQeKy8cNs21b711F+UrmrdLMzPPrVGEyk1Q7E9dG23MpMvoTjkW7RImw
	 zjqucpZJHkV7iLuxGWSWf9GJ+K/NO9tQWDEpS8VblSo67VbEjw+GtM3DoryDLcm/Qo
	 pSF5ozm9YhEfe3e+TwRg/OLn720dPluAYOsDZf/g7bSrszx/fICfM/bdVYQaLp5B4C
	 eAbGzwAtvIO5g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8MxSfda/cR
  kgyunbSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyXnbdZCp5wVmzZMoG1gfEfRxcjF4eQwGNG
  icfPr7NCONeYJK6deMsO4exmlJjX8oGpi5GTg01ASuLG/f9sXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBTwlmpefYQGxWYDiLa2bWUFsXgFHie17brOB2BICChJTHr5nBrE5BZwktr1tAbOFgG
  qmTpjODlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRrDi1qCy1SNfQUC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHhTihmm72D8ueyP3iFGSQ4mJVHeF9X9yUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeC9UTkwWEixKTU+tSMvMAUYSTFqCg0dJhNe3FijNW1yQmFucmQ6ROsVoyTF19r/9zBzLwe
  TMr20HmIVY8vLzUqXEedfVATUIgDRklObBjYNF+yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIx
  Kwrx1IFN4MvNK4La+AjqICeige/97QQ4qSURISTUwzZSWUVjsL6XjeWTjJZnlCgcfXakTXzbP
  8EJc/hKH/fc9zh37ul47JudCwYF1vvN63mx82/DFpLj37aSFriY7or2lLy38bBeWpjU773i3s
  GeGEV9kFFPTikqdJ4HPA5rVnNplc0okjt2255h5adH+3HkPRK//9P/utak13TQ8cVLK+n3V+p
  MO+56o8n38/fbPimtVXyPypnZHKi+3PHmWXWDq+s9eu8U/bXI2P1pqox376emsX49vMV5Ssu1
  hbMzxVTU55n3Y4L7jwR1NM954hi5ZvmHVvvSCvIR3Dzi1PaYZ5T9aU7cpX+P6lMzpurs/nptk
  ubjmrsBftUxNFv201/kBwp8WX5q4YO/iqAdF3UosxRmJhlrMRcWJAPJAn61xAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1670479830!45763!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7601 invoked from network); 8 Dec 2022 06:10:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:10:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9868E1000DB
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8BE491000E7
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Dec 2022 06:10:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:10:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-twine: upgrade 4.0.1 -> 4.0.2
Date: Thu, 8 Dec 2022 14:09:52 +0800
Message-ID: <1670479794-1225-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
References: <1670479794-1225-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 06:10:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174379

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Remove deprecated function to fix twine check with pkginfo 1.9.0. (#941)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_4.0.1.bb => python3-twine_4.0.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
index 0178dde73..161b4b221 100644
--- a/meta-python/recipes-devtools/python/python3-twine_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_4.0.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "96b1cf12f7ae611a4a40b6ae8e9570215daff0611828f5fe1f37a16255ab24a0"
+SRC_URI[sha256sum] = "9e102ef5fdd5a20661eb88fad46338806c3bd32cf1db729603fe3697b1bc83c8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


