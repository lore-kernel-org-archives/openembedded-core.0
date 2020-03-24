Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.7872.1585061087308698415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=t2TdGpjw;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=doOw1ukDQQzBSjxYUY/gPWnvRjXEHiWMzGoADplCM8qvZqlsWO9i4JBVbuqnSvHO2nzT5wVoOIJxiRMZEZmPMJd5c6ROnVDfieh5UDIBSLagJziP3X10pqKVaZ6M431FCgAGn31tnptNTJoACHrFHMb8zWYidUKF6doWxZTnTeqdoNgTgWScVP9NHArsLnvqxRkfGt5SVKeNr8RRYJAXk50ptS8Ov85bFPk8fssG20493rUtTF2OwJh9bDGOWvUYme+YnnKoNu/KWShkLTDmub8RXCWHMWtew34q6Y3n80KMHUShaCFc6Mcb/uSr7alcB0Q0+LJUW2gQZazmUCXELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imbvby4E1v0kevmjYbUHzUxST2BUiDncbceFelNduKw=;
 b=loBV68JmJkZqL+R+s3ZURXu/909fPfllaT1lR2uAcRQWjlSv60teagTYZxB536wqpmjcPeHBSvm8fFNrI19Py/2x5rDpawkFl5qhuuBp7n1qfZ9OTWqTcSs7yPBftnLU+i5wD22qR2BFCduZAQr9H/YEHOy5/mCVNECaz8qIZh6t9d3//Kft/1GXGjTSDPx0WepEtRaFJLCcd+W8JF359YjL7nL3Fb6els/+EXCRkKg6toB277xdUgSbxLc1n8qIA0+TRnTVpMmMgx3soiZpCaIGxeVjq2/CnRHhO8xvbdbLbARxSzDJZeowxS3T8ThbrwrFDFe7xbW+By2vETO0Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Imbvby4E1v0kevmjYbUHzUxST2BUiDncbceFelNduKw=;
 b=t2TdGpjwsOlvYMHkecsufEg8PjsQhXoVzMlomka/Wew83QkeIclJPXvyirPrTkQhzTJ44TEq6f2T5gyIHiJ5eFtxF+oTeX5ubsfAv2ctSaU7vTmiCfnq2qiYcU14eBE4PnIAyTEA3g27T56PHOeZV6JecnNsn/nPOzUX3VKbN+w=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0393.EURP193.PROD.OUTLOOK.COM (52.135.128.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 14:44:45 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:45 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/5] buildstats-plot.sh: filter by task
Date: Tue, 24 Mar 2020 14:44:38 +0000
Message-ID: <20200324144441.41230-3-luis.martins@criticaltechworks.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2e6708b-448b-45d7-373b-08d7d001e4ee
X-MS-TrafficTypeDiagnostic: DB7P193MB0393:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB0393BD6ADCE3235D8F6394BC85F10@DB7P193MB0393.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:341;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(5660300002)(52116002)(26005)(6512007)(6666004)(44832011)(36756003)(1076003)(6506007)(186003)(66556008)(81166006)(81156014)(8936002)(66476007)(956004)(2906002)(6916009)(2616005)(86362001)(16526019)(66946007)(6486002)(69590400007)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0393;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2PobcunS3fNc2hGsMoFYLSdpr7uCVnNDX5ZfFEqACBD5pwHQS3U6YkBVnF0U+frvZ+AUndVpSDcXXTb61iQRDB/1aHKqr6vpAxW77JYm+bJ+XsMVWF+8E/KTescu3slR1mz3Y6GIwRpVOSGN1PrpMZjTkX4HQB9KTJWQJEatZeKsV41a66VLzvHCbU9pVbzw19oSUvfdlU5dr9J4fJKO+4oTqxZqxbj4JgSnQahGksCD/u1OIlSAw0X0Yvs3Wac+neZ6c/q1SUufCucuBbOvf6+Ad14c4qXWRcUIc5vxokMfuHRlHcsM3Kdhgb4VBUb/mJhCL9cbqS4ABzYSRJHCqo1NzdncFwcThkxiv27GyBTi6JeayhHHAjEX1pru/CGwgs8k+kVJXpVewgfR6mQtbKqsDb8C4KWlBSlHJxbIanfhpfU1lFNIRuTPyFNC0Gbkn0C7v480OrDitpckTO1N0SgqhbW40B4905IdsRsjW3r26FyCuQbx7Nz2xwoMaIuQ
X-MS-Exchange-AntiSpam-MessageData: 
	9BpayRa1nhziEb3mz/ZR5CCVnAkY0RPYcLRzjlVnM2SVBECEpjUgHrQhJ5C5tfVRFkf0OqXa7BDxOwhimHjdR1p/u95p9EWuFPkCdYiv5lo4cORt0GPrKbB7RSGGSv6Qr14HcSUFg1od9Sqq0A6vpA==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e6708b-448b-45d7-373b-08d7d001e4ee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:45.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UHY57B149UakiwdeJWYtzKjBgzUZbbqBOlih5X1VVjKzLjUU/LX1hGQjQtqYxCQ6ElRvqnoKL/Ar2DYw94RQ2vNs75KnvGhUP5M5VDj+uPQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0393
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Extend buildstats-plot.sh script to also accept the name
of the tasks as parameter.
This value will be passed directly to buildstats.sh is
already provides this option.

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

