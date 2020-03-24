Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.3846.1585049596919824108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:33:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=o1CyxV2R;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHvVJ+f+83OQsAFEXU7xEwHc8UW5UC5wEw/H2T/ctFUJvrnQq5lKJoYKFgvqZn748gHeqH5Vv1+lhIknuFnJxE0t1/0U8F5uIRJ454K0cEarzUMpi2RaA5puj2IjeXLJFO8Tbo29gXqDnJtN+qkAGUdmpL6gMmvV/tJZWSmea88WC4rnQESp9oFNNbrdn5i02JMPFQLosoFIIpxZ3uLnf+7Oxh5rgSBCo3QqV1Z60JBoHPmVKrBCBxFTYrXR69jBmIVeJ+fuUIF/bxt8gZwwIkye/prQEhW95qWGO/W1zwCKe3TMEVJQPdO5u/CivHT6HcLWPbzVd5si+5RSQvCqDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjoQ5FdEgvCFeucnsYkHfKYs/MFHyd2Woj0f6yV7zF8=;
 b=L6/sMmX18DCbix4ubYH25JnL1vjOupU4Uprskmn8pVQwEMg62zO94Z+ndetxhOR/AXDN37JTOPqhcdmFi3Cw2CAWUUt7+N58MNaWOjiZt5WtOmzUI/l00m6jdKbJ6AoKP2iba9TYafZLE9tEvJX7O9thl4lQGbYXPCH/Y6fpSI+RvnTuB3Wh93zxcm0Nn0lbXsFR5pjKfA38kyIyqqd6NBsX+pngNi+MMWhZ3L7ztVX0SuCNQZNRDBAVT4Xr3jJuQU3L3fBKVRRwhXvO5jjPgh91Pqnaw4A8LIcaZFEZC1QQS79MRFprwfnaXgi0eKYaU6RBn2JG5VsPwHpnb+BbHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjoQ5FdEgvCFeucnsYkHfKYs/MFHyd2Woj0f6yV7zF8=;
 b=o1CyxV2RPmnxaCilL5PkzCqK0a2y+3ZbXfSIIS53qDLPul4M+D3m6Y1KMqSv7o91ZXjJgq8RbV2LkH7rK5C4GGNiz3ulyQ9wmtfgni6nlacvswr6ujzLrVCPnFEEFbREetKt1XGd37gyPRzPTLaixS8bck73occrIvB0tIaqU1s=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0378.EURP193.PROD.OUTLOOK.COM (52.135.128.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 11:33:15 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 11:33:15 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] buildstats-plot.sh: fix invoking buildstats.sh
Date: Tue, 24 Mar 2020 11:33:09 +0000
Message-ID: <20200324113313.39528-2-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 11:33:15 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cbc123a-39bd-471f-491a-08d7cfe72496
X-MS-TrafficTypeDiagnostic: DB7P193MB0378:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB03785F470A96DFCB47758EE385F10@DB7P193MB0378.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(478600001)(186003)(26005)(66476007)(81156014)(8676002)(81166006)(16526019)(69590400007)(8936002)(52116002)(44832011)(1076003)(2906002)(2616005)(6506007)(6666004)(956004)(4744005)(6486002)(36756003)(86362001)(316002)(66946007)(6916009)(66556008)(6512007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0378;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ayLKv+iQ1FRKK34yok8zmEItEqI8HlFWi+UeeBCB1NRULs5fhsBkIYtnSOm6d1up+ubKluXQOYeH1K2D9lZa0epKVQMS7MM/5KPaoKU7F+cVNR4iE/wFbLEjK0epG6rIvmELLJ4w/B68cRpm2JeCkQTVbmfpFv/eDMo8s+vkotJnerxHlbgOL5oyFsMQwNEGquaZAvrkRAkJkYlvGU45Chv2j64aMH+f6GsQXPTvBiAJi51F2nO3VZ13hL3BPNrrlOS8ZnOeVRgH/3doB6lJExWJ/kvudEZBDhCKyLNw9Ya98ZGRuU3dX96cYCODyro4Koo8e3hMQSy+UCq0U/wPxhCG9wWvkvYHRgB1kbki72Uqu7K255D169kUubLsCZd65nc2EvEclOJ0XiAyRCh89s9YFk7RQe+MULbzqvuK9nrHzZwbbkAjMq5Byjr/F1HCcorEZbeIDAmD1ToVcDjE3JAgUm8SicAu+sxXZ7lBo+QvLqwogyn0KufUvZTRpOMC
X-MS-Exchange-AntiSpam-MessageData: 
	vZ4mapxIFSyOKxKiZ54zSymmFob5nuibridPNElgj4d07lqqkoDFV1wA98UBv+EpWIKoK8S6SP/ywBjRDqgBt0oRQkywx+lNPEqaOxSr0fa97tv4eD7DL7JCZEjS/3oO35tsEMvBmqGnLzAScrF2Ag==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cbc123a-39bd-471f-491a-08d7cfe72496
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 11:33:15.6217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3qnlh/Nnqsvv9NtJ2EWdgMX17HmnLeDgtgc/R5tsXOL2fLfbIfpxzcYYbjrClvOGYzfhJNFIcoF+j9ihHhW9D6vMhs+z4a8I2WueG4Oe7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0378
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix the internal call to buildstats.sh by also providing
the buildstats folder location in the system, which might
differ from the default location.

Upstream-Status: Pending

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

