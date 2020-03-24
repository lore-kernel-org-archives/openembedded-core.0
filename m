Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.3846.1585049596919824108
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=vJzjhPI0;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpJj80ZBL6c9NBD1XzHWBAIYEIAtJZUK8c7LiFUTBtQnq4TDxtMZRFQ3yT1txQQzbvYGn4GrBedFj62taDkxWJnMqOL5kXEWL0PCYwiHNCgJz8qmINt5J5lw3EUweDSgM5O25DhTLnUhD9PpBvxXafI3B3fNz4FctgwvUGgzPUrki7zXEvOMjRoPCG8A/oW90VeJ78TEy8r6RK+nG86TemzxIcUe+e+20k8Y97WiT9QmKhdJlAyfJ+97WcXkEIcmu7ZFdL1csWm1u0h3BREpxYLVOmXR5mPpfPD//DiGQvu9BvXxeU05Ljah2cq1r8ZAaXkQrmABgNftZmfEciLaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYyBB/C1VSXw1sWt8db5Z03Ram3nyHSwwk8ZAUUUCjk=;
 b=exw3BGloANiG0IEyGdmEd/N+sKEYRvzW5eJmc6F633fO34a6FTR9a3tkLmpCXyN9FV4aWszYBiSvjKt0JDO3Kq2MDHxDbq89F+bcV5gpRlpTB3LqmBzm+LcDf+BKK9kVWp6/sNJ5dciso6zN7ioYe0ACyHij/yvn/I1d3IZNUZDWlmWeS8PM0znuEFXyL/akZLEUxdhFG8bSrt4XFwUHjeH4BaqHLnMMkK0jM8FLqT/0k7kZRFMm23v14f1LAwtJu+k9r47lKmDKGfN87uQZ8yKqug6DF2nhzbMPWTEBWVLAQMjNGdopw/+CiIeYGkTM7voAuXvfoAP/7yA4zzGsMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYyBB/C1VSXw1sWt8db5Z03Ram3nyHSwwk8ZAUUUCjk=;
 b=vJzjhPI0hcFhNeuf0Kz6LYaDnkV8GZNT/ID/2UPEnF2IsDaK3o4fY5wh/DqfvIXMJpla8oWqQ9HdHmC0nWliT7CI/sUvNQRMUJ5FhX6PJSDPxSMXJqt/7jSz5xGraiPwQyZqFBYmicpL5JYMvOS2SHgNWPA/QdJ3TPxD07V56aU=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0378.EURP193.PROD.OUTLOOK.COM (52.135.128.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.18; Tue, 24 Mar 2020 11:33:16 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 11:33:16 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] buildstats-plot.sh: filter by task
Date: Tue, 24 Mar 2020 11:33:10 +0000
Message-ID: <20200324113313.39528-3-luis.martins@criticaltechworks.com>
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
X-MS-Office365-Filtering-Correlation-Id: cadfcc51-a31a-4d54-2d71-08d7cfe724e8
X-MS-TrafficTypeDiagnostic: DB7P193MB0378:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB037893D0715598A9C18A6C9F85F10@DB7P193MB0378.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(478600001)(186003)(26005)(66476007)(81156014)(8676002)(81166006)(16526019)(69590400007)(8936002)(52116002)(44832011)(1076003)(2906002)(2616005)(6506007)(6666004)(956004)(6486002)(36756003)(86362001)(316002)(66946007)(6916009)(66556008)(6512007)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0378;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fDnTCTJ/9/LF8rvQFZsRdGeJWtGWAMJmZ8yOWZ+Hgkk8cIP8wUWuAsdSesQ10LYVNSnFCThurBIDY4hAdQzbpD0L1gm9tb7SwwiEC6a7Hkz9jugjVdDDlmj0y9krbxuB9THNLdoRR4wlBNTijpF7eJhpqsIqRSECTeLLc87EIFfOk0r0ZpBbxgGaq4sqSmG4jaSl/T5SOM+BuIvFmD3XUR5xlTQGIgKJa6aP1jZoghiTUA3dYdQjlo4uk9JovLUlCbyr2tVzP6PXv76j0Awgm8FNf2un7J6BA8rEojd1U5C9iXp5RwFiQ9m9dsaKRTf0CzLJuNSmdFG6rcGpCRHHh3yp0A+kk2VvMwKPwmX/B3jFISFeaXokA8nWP9mfo9/8I/1EON+VqXzrrBQ7vyZ6j+VLQRM7tjjYF7fyj6yRUggxDdbchcTnb/W+Xwb8BDn3Rh6aekU2QlU2XZ9LpuhTIhUi3CueL+ZTYctSssbNrxVzDF/2tA2KDF1pfsLyhAxN
X-MS-Exchange-AntiSpam-MessageData: 
	OezBJJH/637MZJRauzEJdzyXjAc4WofrExeBLj9S2SRO9uFMWVy5b9ouzdZFojuu9LfpI2l+pcdoVJuqmcBvR9lGUkqmRMSPSCKu4q0g5sm/MqfIuq/FfPpjwCAWD6GMK6Fv0C674mlkDHVEA+Tq1w==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cadfcc51-a31a-4d54-2d71-08d7cfe724e8
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 11:33:16.1844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2EGbdhq4r/3fCkYflQ9jESeXAKx3qQT3v/gcgJTQcnx+qpBQZcvNcEWFUJ1R++sGNWS7XvjtFpEyyePpGUSivkvLsnq3AImh91+cnPI/as=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0378
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Extend buildstats-plot.sh script to also accept the name
of the tasks as parameter.
This value will be passed directly to buildstats.sh is
already provides this option.

Upstream-Status: Pending

Signed-off-by: Luis Martins <luis.martins@criticaltechworks.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/b=
b-perf/buildstats-plot.sh
index 089621c9f8..1d22e60d73 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -39,6 +39,7 @@ set -o errexit
=20
 BS_DIR=3D"tmp/buildstats"
 N=3D10
+TASKS=3D"compile:configure:fetch:install:patch:populate_lic:populate_sysro=
ot:unpack"
 STATS=3D"utime"
 SUM=3D""
 OUTDATA_FILE=3D"$PWD/buildstats-plot.out"
@@ -51,6 +52,8 @@ Usage: $CMD [-b buildstats_dir] [-t do_task]
                 (default: "$BS_DIR")
   -n N          Top N recipes to display. Ignored if -S is present
                 (default: "$N")
+  -t tasks      The tasks to be computed
+                (default: "$TASKS")
   -s stats      The stats to be matched. If more that one stat, units
                 should be the same because data is plot as histogram.
                 (see buildstats.sh -h for all options) or any other define=
d
@@ -64,7 +67,7 @@ EOM
 }
=20
 # Parse and validate arguments
-while getopts "b:n:s:o:Sh" OPT; do
+while getopts "b:n:t:s:o:Sh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR=3D"$OPTARG"
@@ -72,6 +75,9 @@ while getopts "b:n:s:o:Sh" OPT; do
 	n)
 		N=3D"$OPTARG"
 		;;
+    t)
+        TASKS=3D"$OPTARG"
+        ;;
 	s)
 	        STATS=3D"$OPTARG"
 	        ;;
@@ -101,7 +107,7 @@ CD=3D$(dirname $0)
=20
 # Parse buildstats recipes to produce a single table
 OUTBUILDSTATS=3D"$PWD/buildstats.log"
-$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -H > $OUTBUILDSTATS
+$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" -H > $OUTBUILDSTATS
=20
 # Get headers
 HEADERS=3D$(cat $OUTBUILDSTATS | sed -n -e '1s/ /-/g' -e '1s/:/ /gp')
--=20
2.25.2

