Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.84])
 by mx.groups.io with SMTP id smtpd.web10.7872.1585061087308698415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=Ldd7wXZv;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.7.84, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+GwmJkMM5JAZq0O7i7mCvAp87LvMzC5rzGQUBWUBsNsRjiKpOY1zeg4CGZZdeRtFgXzYRgg6m4iUIjcntrIRCYoNxXcuwzjSCwp/ZtJHLNyf6AnROC/Br8zrMaf7WU/C1LFQIpbMUl5xxdeCZs1AMH3Wox5e2dLUUKSje5RI2xryxsfZTyGU+T9ZGF4Nw7MRUkL3V6rPKYxZrMLX7ZT5FhKGGxX3fJU7VREgqwyupNMzakUmr7D2xmE+6Vogc8HNFM+fApBW2mHQCNEnCQGLyArWy3EXgIN6tW0+VnYIaqbzhMcMtdh4yCVQl4xpJjQo9IZyC+cMRh7u/KD6w460A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAzn2BvvBsKSMWZx8fGwpWFN2ssV8qGVZNLhS+yC+wA=;
 b=nVf6bYOQWeivQFDvr55n8PE/vNh2MGOM3y5zFR9YTk/IxU2gCUnKccUhd4KzvRw4ZElUcFyPsjLFtl5r4oTRH8CGRu0ujqwNdsBtybwKeZwU7s0/E+dX1LucL/kLSndBDytQp8SRtR1nH0Rv5lUCDfqb9w42vrcpLkCqo/jFkJogR1c/ckl3/8hSUZRFVmBwdbkL/+8SPjNOL7cfZiKftLR4e94dBztbPVws1xqsv0HFmLkXO1uWMDto3CwZUeTZgTcQMdfkZeALS5GNLdqYVdYpjK/Af488YJ3DbUGviOjeZil1ON09pLGhB1wNyAH6VZKizSIA4YEfwAOg7yfBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MAzn2BvvBsKSMWZx8fGwpWFN2ssV8qGVZNLhS+yC+wA=;
 b=Ldd7wXZvpBwf0a8Meh915PbNuctg1ZA8HIvuW4tEspd/B09doE3zke8O4PgBMmOh/9nWYAL5Z9BNVUjKKbw6rRTdLktUe0BvWFaHf45oKS8wP/+7T4gn1TE54Wq+KOEQbnR328JJYGqYKwkmKiwpz9GmyUAquwqvJl2DzwY/UvQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0393.EURP193.PROD.OUTLOOK.COM (52.135.128.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 14:44:44 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:44 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/5] buildstats-plot.sh: fix invoking buildstats.sh
Date: Tue, 24 Mar 2020 14:44:37 +0000
Message-ID: <20200324144441.41230-2-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324144441.41230-1-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-6-luis.martins@criticaltechworks.com>
 <20200324144441.41230-1-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 14:44:44 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5962e660-f2f8-4cdb-a947-08d7d001e4a1
X-MS-TrafficTypeDiagnostic: DB7P193MB0393:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB039382EA03A32C33F8AE19AE85F10@DB7P193MB0393.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(5660300002)(52116002)(26005)(6512007)(6666004)(4744005)(44832011)(36756003)(1076003)(6506007)(186003)(66556008)(81166006)(81156014)(8936002)(66476007)(956004)(2906002)(6916009)(2616005)(86362001)(16526019)(66946007)(6486002)(69590400007)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0393;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0fI2gJfAKWNZl7QRdokJFNAodPHA4OiLfmQbaukz3g6bWJAbBn8NhBwBYBh2iheNwVPqH/F2RMe0VGLkQwgH8nECN10PDkJz6DiMu9LgX0EfIwYudLUeJpPws8qPBh0+Lyzvp4tuxAO7GDBwXB5K9f3P/0NjFXlgRt/VJ5YFRQmJVkpNGgotx3cgzagnETCkrsCEVbGMV3EsBwQs+bptZSgwwfBVwmoDUKsgZOQeulMFJQj8VzAidcPjuHAvFuvw4i97+u+AQnFhvfCEESXnGh01Y4QP7RScPxcvn36LYNNeomSVUaeF4e3PDQDgM5lsRBe2KqbX/2aSnCvFP3uMGloGJu9p/6GPqe07p9CGMb3NSYDcWsU3cunohBX8VjEpiM4MUIxidI+DHEXU8zf8duEwcRkvjfWaphyMGBEcXZKF4bO5F/6ayfUR5tssGutB3oPq3MyAIqYCVof41nSL9BkkQ8GdH/00XeahrbXiqtcDyQHehihEYw+SZz0VVD/K
X-MS-Exchange-AntiSpam-MessageData: 
	AI/ogzQyA1pvWFuOoy9RtZRywcQvqYY02G+feDFU/ZSbSpZlurtS5YvyDbaq4rZ9PvQE/v5x1xPOkUHxr1SBdjxRgqfoe/iyIzIfyN465IGEIrKUOYqcU7degV/ezS5cpOiAlkUZyoOuYwVlW3R/nA==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5962e660-f2f8-4cdb-a947-08d7d001e4a1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:44.7038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVB4VypOjV+2bn1Dg8sUxnfdsoHG/E81/qOKzjo9Xq9byRx2wiVgMaKXxFcp/9+YomCCk77BCQKZqYpbUkNpfsRk4zL3qgcwLOxibBYeYxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0393
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix the internal call to buildstats.sh by also providing
the buildstats folder location in the system, which might
differ from the default location.

Signed-off-by: Luis Martins <luis.martins@criticaltechworks.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/b=
b-perf/buildstats-plot.sh
index 898834e5ac..089621c9f8 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -101,7 +101,7 @@ CD=3D$(dirname $0)
=20
 # Parse buildstats recipes to produce a single table
 OUTBUILDSTATS=3D"$PWD/buildstats.log"
-$CD/buildstats.sh -H -s "$STATS" -H > $OUTBUILDSTATS
+$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -H > $OUTBUILDSTATS
=20
 # Get headers
 HEADERS=3D$(cat $OUTBUILDSTATS | sed -n -e '1s/ /-/g' -e '1s/:/ /gp')
--=20
2.25.2

