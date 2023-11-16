Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6ABC47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:01:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2536.1700121706542244371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UOsv6hq6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9684758189=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AG7Z2cm009449
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=3a3ME+RzikPxgmYNfOEJTtCjxruIHN3JMPP8Nm/sCbc=; b=
	UOsv6hq6utnQ713XylENwzUiBlFIejm3lqym+tsSfDhYEYTMqUI8/YXch7Jqy+s0
	S2JGq6K/UF1NBB5a/opKBZ87PUpEHEbsYAUlcXNCIlRFSA1WOPphYatH7NEQ03rS
	pybG5rgMnynsjFrbTWmHQnGfW8Y5fvtoKV1YZb9QutOsj1RD1tPh8jAYCG4G3eQ6
	9bUsI49K/Rqn/KPqHexLsATJ137HFvdyz5B0qMDxHttBfL6iLrLAHLvsd9/AwsTh
	CJGKK6vfMdOxE7Tmg0Gs6BJiIi3GW6xFnfEXeNRzN5aH1sxVI9sS6lVLiO1vEaOt
	+FPN0Ep+me8uXIfFAqCPAg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ua0k6cndy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:45 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 00:01:48 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][dunfell][PATCH 2/3] vim: Improve locale handling
Date: Thu, 16 Nov 2023 08:01:23 +0000
Message-ID: <20231116080124.3175506-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231116080124.3175506-1-archana.polampalli@windriver.com>
References: <20231116080124.3175506-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Ttj4sNUWU7yqPrzYOYKKI_80m-qWlIe7
X-Proofpoint-ORIG-GUID: Ttj4sNUWU7yqPrzYOYKKI_80m-qWlIe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_06,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311060001
 definitions=main-2311160062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 08:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190765

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When making checkouts from git, the timestamps can vary and occasionally two files
can end up with the same stamp. This triggers make to regenerate ru.cp1251.po from
ru.po for example. If it isn't regenerated, the output isn't quite the same leading
to reproducibility issues (CP1251 vs cp1251).

Since we added all locales to buildtools tarball now, we can drop the locale
restrictions too. We need to generate a native binary for the sjis conversion
tool so also tweak that.

(From OE-Core rev: 042c1a501b1dae5ddb31307b461be02c3591c589)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-support/vim/vim.inc | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 10406d8b26..a12e3c8d89 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -40,22 +40,16 @@ do_configure () {
     cd src
     rm -f auto/*
     touch auto/config.mk
+    # git timestamps aren't reliable and we want to consistently regenerate these generated files
+    rm -f po/cs.cp1250.po po/ja.euc-jp.po po/ja.sjis.po po/ko.po po/pl.UTF-8.po po/pl.cp1250.po po/ru.cp1251.po po/sk.cp1250.po po/uk.cp1251.po po/zh_CN.po po/zh_CN.cp936.po po/zh_TW.po
     aclocal
     autoconf
     cd ..
     oe_runconf
     touch src/auto/configure
     touch src/auto/config.mk src/auto/config.h
-}
-
-do_compile() {
-    # We do not support fully / correctly the following locales.  Attempting
-    # to use these with msgfmt in order to update the ".desktop" files exposes
-    # this problem and leads to the compile failing.
-    for LOCALE in cs fr ko pl sk zh_CN zh_TW;do
-        echo -n > src/po/${LOCALE}.po
-    done
-    autotools_do_compile
+    # need a native tool, not a target one
+    ${BUILD_CC} src/po/sjiscorr.c -o src/po/sjiscorr
 }
 
 PACKAGECONFIG ??= "\
-- 
2.40.0


