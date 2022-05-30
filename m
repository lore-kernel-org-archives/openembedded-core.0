Return-Path: <simone.weiss@elektrobit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6018CC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 09:48:09 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.50])
 by mx.groups.io with SMTP id smtpd.web11.35002.1653904078589835122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:47:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@elektrobit.onmicrosoft.com
 header.s=selector2-elektrobit-onmicrosoft-com header.b=mt5dh20J;
 spf=pass (domain: elektrobit.com, ip: 40.107.236.50,
 mailfrom: simone.weiss@elektrobit.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OE5tKiwk//m++/31zIVCBcKHkChF8myM0ZOuVk5VGT9X357SBUoaCLkwq24/m0/URSsY+pSAYFADmTNWLnWeGXBW9wgAoy0cTjkbOUEVkWQqXz4x2mYB2kD+bR47750IOoQE+lxAdGvbjYuK682NwtrB0fULfPZiZN3DubCKBKBvwiGbBZ+oYBDCSQwV0FMtpou5UKSLHTnvNZOznDIat6lRSTtbHC1jGV6MnMDp5GXqQu1kj5D4UIdLXPP+yylMRK3BKMU+sOMp7OyXWFHa3TYQWaOECPakNrMlpFyVAi3XgSEFgPDrHCEdzgwVf2kKJCxE5xGm0wvkUNOe+O10xw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWo/5h00e8mIO40djEqay105j5WLj/nhJDvlhYs8enY=;
 b=U6CQ46Ckr2LXwaa7A3pyU81vqmnfQzhk/B8/iSEYjLR3sfNO91JkPRzibSUZb2P69hvryyBiIT5l9xAH3WGrTomiFNbXgDpxzOe4FmnzKJ10qsVm8E9eZ4n+HAREQyS7GqoOdbhTx9KnnJ4X2esPyBX6yWreAbIz4EXyT+5DkcYK5bJmG1gpneX4dTLaDxBFAMTP7JLHh7jW+R3soMqmZ0dgb6hvc17SVr9MsUYWGFO8IyZTgHxtUvnBxAh1e2zJTRvpJ0aj37Zthi48neSeE1f06IB6ltVUYPBwwQwJAA4cOGTzuoDl0k1qSpoW8pBKkfyP6pQAbaL138VHKUfaDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 4.79.107.243) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com; arc=pass (0 oda=0 ltdi=1)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWo/5h00e8mIO40djEqay105j5WLj/nhJDvlhYs8enY=;
 b=mt5dh20Jcom1SWU94LQ0UUKzCXygaQLpwBP8vgnB8Fe25Cky7ov1XYmcNREFJgYZqNZDEJMptOM5nMSG0g87frNsxX/TaUknHmxdVagIauohLbt0g79zr6bEcfobt9I3xxPBGgVGq0bZKq0I9PvkIfwbnmrDn6GRvkbEVFgwvzA=
Received: from BN1PR14CA0012.namprd14.prod.outlook.com (2603:10b6:408:e3::17)
 by BN6PR08MB3457.namprd08.prod.outlook.com (2603:10b6:405:63::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 09:47:56 +0000
Received: from BN8NAM12FT004.eop-nam12.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::9b) by BN1PR14CA0012.outlook.office365.com
 (2603:10b6:408:e3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 09:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 BN8NAM12FT004.mail.protection.outlook.com (10.13.183.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5314.6 via Frontend Transport; Mon, 30 May 2022 09:47:55 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 02:47:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SssNZ8OnTeBiv82HHNpeBHtMM9mwjGaYjF4U3oOx/aqDTcTc1O69Nx0s54FPWS+nRxS0Afy7SFdSGHrPcGQvtOxKWbsnI4Xbhq8ovlLlc6SNQiDQTB4pBN/DMp3vHmyzlf2qEBtfxxULyV9Xj8jpv+L/yQT3t5dTEWFvjCaL00qD4asnDwex6obNKmQNaoj4gUyxB/gJ23PcMmBfc7eULGalY5ZbvxAWF1XBvO9krHNTaRvurSO1Xz7fSTC1g1gFTC4L9932wd7lPLGTx31G3u+LxqmmGmBzYCKhkUWWw1Ny2VeHnRmxaUnAgNu/yFlnjmgRGnUL3D0yJUjK7VmX1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sWo/5h00e8mIO40djEqay105j5WLj/nhJDvlhYs8enY=;
 b=RX/JcgR5oHYurwJnmzGAWCK9CS/69GCT6GAhZ8rl3lybZKJSZ+nIDcJ1zeaKr0QpYcp7QZjoo7bn0dXGsvjZk8axENV2+Mm8ip4ZVbWRXI9uSkgI6dDvWdBN+gmd6iwK4T8P6ZrkCUsVPu3fZG7vXnyPPKWF4v8QN80jBx8x9h9po4jHe2hiPqueuOzyK9mTx6P+QAtUkrQXopeU0gYFctiK3Ritbs+9WJSbOkZUHNqf8j65FGlma9LBTP/PDLG6saORWMPQaKiRr4ctfL+rC1NFzbR7cDvc2a51WjFXHlqiwr0savlKJJIuQV0g8p1/KvEgW6NZ8IEU/iqa1sBjsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 213.95.148.172) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=elektrobit.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=elektrobit.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWo/5h00e8mIO40djEqay105j5WLj/nhJDvlhYs8enY=;
 b=mt5dh20Jcom1SWU94LQ0UUKzCXygaQLpwBP8vgnB8Fe25Cky7ov1XYmcNREFJgYZqNZDEJMptOM5nMSG0g87frNsxX/TaUknHmxdVagIauohLbt0g79zr6bEcfobt9I3xxPBGgVGq0bZKq0I9PvkIfwbnmrDn6GRvkbEVFgwvzA=
Received: from MWHPR10CA0071.namprd10.prod.outlook.com (2603:10b6:300:2c::33)
 by DM6PR08MB5371.namprd08.prod.outlook.com (2603:10b6:5:14::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.18; Mon, 30 May
 2022 09:47:52 +0000
Received: from MW2NAM12FT045.eop-nam12.prod.protection.outlook.com
 (2603:10b6:300:2c:cafe::b0) by MWHPR10CA0071.outlook.office365.com
 (2603:10b6:300:2c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Mon, 30 May 2022 09:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 213.95.148.172) smtp.mailfrom=elektrobit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 213.95.148.172 as permitted sender)
Received: from denue6es010.ebgroup.elektrobit.com (213.95.148.172) by
 MW2NAM12FT045.mail.protection.outlook.com (10.13.181.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.6 via Frontend Transport; Mon, 30 May 2022 09:47:51 +0000
Received: from denue6es010.ebgroup.elektrobit.com (10.243.160.100) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 30 May 2022 11:47:48 +0200
Received: from del01461.ebgroup.elektrobit.com (10.243.54.74) by
 denue6es010.ebgroup.elektrobit.com (10.243.160.100) with Microsoft SMTP
 Server id 15.1.2308.20 via Frontend Transport; Mon, 30 May 2022 11:47:48
 +0200
From: Simone Weiss <simone.weiss@elektrobit.com>
To: <openembedded-core@lists.openembedded.org>
CC: Simone Weiss <simone.weiss@elektrobit.com>, Kai Tomerius
	<kai.tomerius@elektrobit.com>
Subject: [PATCH] json-c: Add ptest for json-c
Date: Mon, 30 May 2022 11:47:45 +0200
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID: 
 <5e05e3aa-6b3f-44b1-85d1-8cd220310306@denue6es010.ebgroup.elektrobit.com>
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 1fd7d65c-9764-4553-37ab-08da4221790d
X-MS-TrafficTypeDiagnostic: 
	DM6PR08MB5371:EE_|BN8NAM12FT004:EE_|BN6PR08MB3457:EE_
X-Microsoft-Antispam-PRVS: 
	<BN6PR08MB345755391C2296C2FD598FEFE2DD9@BN6PR08MB3457.namprd08.prod.outlook.com>
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 O7G3j5jerIy9+BzdHQyx/OxOyZEJAfjFfw9H5+VFNRMZIKbWSnlELgXeMoPfM1Q4+0WLytmXUVrUdetuR584BwP6vxg8rsB5lvMv8sPSEuJHK4kaeXy17VOt0qRyB6o9PcNtuZEDstNDVpcRWHmzoDxJ1XR9XaUiOn7kJ+WRtVaGjAyqYWqN730OuYMQjXQOI6QDra+eVHO+/fMAIrzayO0LeMxh4pkB2TIDNKi9B/5UZYaolEZyCS9yndBgNn6wCs4BN3+SofVf5f1vyNLy7FUdlizDKBgkyOEWvtv69vluL0GxQYeTKTKdYoAieo0zOobGYxKeVvHcbtUDKWN/l+d9m1fSAcId8BMEG6uv7vVUoClAJ8yzewK0CQ3H6RKo093A/i2keJF/+vgmExoxwEw0DYXd2GXwQIR/iofhMTnzRe4I1/OBXp4IEENjYNb5+y9Uv3NGvUELvs//Ujn6HMl/MO29mVPlp30a2pkzShSE3HkR2jhs5ix15rUyEtsnRWYkEFq04KS7t3PPIrMHalNIpO5II/bKMowul3yTOq+GHGLpfzRtyhn7Pc4GETFN46pQkueFhBk2U+nP3iHk3Ev6rdqVZc/6MW5ZJAsuVtF2KfYPCJLQEehlQT4Mm1mIbweaAwFvN430mXI1osCTcRi2I6p42urL6uyu2UTKNXWdF0WSdMtsRa9xH9EdmWEtLG7xxx8Wn8tqvRjlw+vgTxMbTHwbPq7Xv2xRo7IY05w0ZfS7iddKd/NNziDE3npm
X-Forefront-Antispam-Report-Untrusted: 
 CIP:213.95.148.172;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:denue6es010.ebgroup.elektrobit.com;PTR:eth1-fw1-nbg6.eb.noris.de;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(186003)(336012)(47076005)(107886003)(6916009)(5660300002)(8936002)(2906002)(426003)(26005)(40460700003)(36860700001)(31696002)(81166007)(44832011)(83380400001)(356005)(86362001)(82310400005)(70586007)(70206006)(31686004)(316002)(8676002)(4326008)(6666004)(966005)(508600001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5371
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 BN8NAM12FT004.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3c92f865-1e73-4f9e-f38c-08da422176c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D8tYG5ElM/WtLUacBepUO0DesS0dMhlkA8u72SJLy4LxU2h9kwWTKdn/7qjMcCqg7g3UH8QLknx0e86hRhATDdabdendP6I8pHMxpg6xw0kyzTwKTgbENniS3m9mzuy1HJvVxzAI5mZ2c19+miAXMBxvZOWcZMYuryxCtTRlLmDT6vs+yQUdCq+3dqTOzOdHgKA9ZtdV62762g7IBRHhiUdPBGSzRQV/lfiMhXpiX/b6S42WAopp8Fj6wPexDcM+I2ZHJEW6yvvY1APE+AWwc58V2DZVYu7V8FMffNJUWafYYKzmMfjZ3f1yKrmCGGb84z4QkfHVnDmPspokAHtrdpnWit5rO5SYpEfWfBvMVmA206Y7ZiDBuW58LGSv+YHj1Y61VvZU2sgL3nxyPW65btURig9GcDkVjDF0cF2rUZ6xd091sbW2Ie/9PLoOQV+aY2I5XJIbC+ppX4SkpIlv+B4H75bEwQlrrfTsOBZuRcMgozv2B91tEpMFXsDWx1yBnZTp7xXXxRWpWGA4Y09byeUplhm4XqrvfmBt/r8WoyWsoGf99P1YPptppfIeP69Nh5siU6k9A5ruSxY0DcQNFzWD3yBw6/xWakE8i848+GeLZKQBYfmZyx8r0+BqHfgXB/Aw7yKH2mBvKkTiIo2ZUKntYVBECNfuibF7vjuxjq1Dq0ZOLtbAcjiANOG84aBUFsq1r3SMi4KD1BqXYvMYKiZrGaS5qDjdjbdiRzW232XznmTsASUDl88CXyINk2jDkFer5t4MGlttzjWbEdmPWw==
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(6916009)(54906003)(426003)(31686004)(82310400005)(47076005)(336012)(83380400001)(36860700001)(81166007)(31696002)(26005)(107886003)(70586007)(44832011)(2906002)(8676002)(4326008)(70206006)(186003)(6666004)(86362001)(508600001)(5660300002)(8936002)(40460700003)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2022 09:47:55.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fd7d65c-9764-4553-37ab-08da4221790d
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN8NAM12FT004.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 09:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166278

Also add a script for executing the ptests. All tests were sucessful on a t=
rial
run. Also add a small script for running the tests.

Signed-off-by: Simone Wei=C3=9F <simone.weiss@elektrobit.com>
Signed-off-by: Kai Tomerius <kai.tomerius@elektrobit.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/json-c/json-c/run-ptest | 20 +++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.16.bb   | 15 ++++++++++++--
 3 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index a1ead90649..0bfcb60c76 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -22,6 +22,7 @@ PTESTS_FAST =3D "\
     gettext-ptest \
     glib-networking-ptest \
     gzip-ptest \
+    json-c-ptest \
     json-glib-ptest \
     libconvert-asn1-perl-ptest \
     liberror-perl-ptest \
diff --git a/meta/recipes-devtools/json-c/json-c/run-ptest b/meta/recipes-d=
evtools/json-c/json-c/run-ptest
new file mode 100644
index 0000000000..9e96a8e755
--- /dev/null
+++ b/meta/recipes-devtools/json-c/json-c/run-ptest
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+# This script is used to run json-c test suites
+cd tests
+
+ret_val=3D0
+for i in test*.test; do
+	# test_basic is not a own testcase, just
+	# contains common code of other tests
+	if [ "$i" !=3D "test_basic.test" ]; then
+		if ./$i > /dev/null 2>&1 ; then
+			echo PASS: $i
+		else
+			ret_val=3D1
+			echo FAIL: $i
+		fi
+	fi
+done
+
+exit $ret_val
diff --git a/meta/recipes-devtools/json-c/json-c_0.16.bb b/meta/recipes-dev=
tools/json-c/json-c_0.16.bb
index fdec5ec9af..3fa5ce2c49 100644
--- a/meta/recipes-devtools/json-c/json-c_0.16.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.16.bb
@@ -4,7 +4,10 @@ HOMEPAGE =3D "https://github.com/json-c/json-c/wiki"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc35123ba193fea8ee216f=
2"
=20
-SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.g=
z"
+SRC_URI =3D " \
+    https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
+    file://run-ptest \
+"
=20
 SRC_URI[sha256sum] =3D "8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030=
c5ba8a0288d96b"
=20
@@ -13,6 +16,14 @@ UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\=
d+"
=20
 RPROVIDES:${PN} =3D "libjson"
=20
-inherit cmake
+inherit cmake ptest
+
+do_install_ptest() {
+    cp -r ${B}/tests ${D}/${PTEST_PATH}
+    cp -r ${S}/tests/*.test ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/*.expected ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/test-defs.sh ${D}/${PTEST_PATH}/tests
+    cp -r ${S}/tests/valid*json ${D}/${PTEST_PATH}/tests
+}
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.17.1


