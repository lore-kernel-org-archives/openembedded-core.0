Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.79])
 by mx.groups.io with SMTP id smtpd.web11.3774.1585049599895105746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=KHoicKRo;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.1.79, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0Xy03y+YPLdTP7bjZ2lcoedqHN6nxdyGY0HfvYUGqgrOLyr3esLNo/LQEy1QLufBApcgX/8BtHB0hGVUVisTlI8xq6G9jPVNoFPnbD2XBX5NwaPcF86SSufSLKM8LYU9hNk+Ps5Rix5BKhZ10icjGSAbmVlOTGv9Xb4o3e9huKmtpoMILkrqfPoBzhXt8SgRzjdAB65qY1HOkZjj4BFFS2t/y6rjKjvBQB0vxsvuj3Q8ftle/97G7zbObMYIsYCZPylcysvnKkLJBXDb+KvLFH+XREzeux8TqMaiGghth/ncq58Ft17VEW+7BZlfvps8yHakAngU85mhL+o73MKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkrTrF1UerMF6DfgJSkCvlYaYA4rI4oimefxMcJMzVc=;
 b=jQEJM2ojG3CLaOLDIMLnJm71Wxu8pBLOmlMcQyol+8wjKRHulNgOcxq80SNqw/vSIYZwQM7jiY/cWL51ZOFXNNO013kaZdg2R+PtUB7xnTytDEHBqJI9giI++ypR01BYQSCTfZjgav0P6JqQrLtj4ud6N2rvmp5RL4B9HxTDejvozvOqXYNkHHe17DfQJB8dc3QV8cQcQfmJsV92Zmd97JezjyMHemH0MnhwywG6TylYBjzP0fIYzAdokP/UnJuMqv3lhtO+Rh2gC8Q+Y+IMEDUnNW10zxos8JpyRTqGa2Awc7LiyOZBtUzDDMp4bQ9enTqvwlC55r4LUu6QJSWsNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkrTrF1UerMF6DfgJSkCvlYaYA4rI4oimefxMcJMzVc=;
 b=KHoicKRo2VNegGyxCNtrfQtoeQZXgr9mXhm+tWFlXu9Uvb8h76PdBtiO7Cd3y8bXNi7vFlGJpWpUUM7CEaZVuCim620uKr1kBIsTCVpZ5OqHWjYlY0Ir3g81i+VRXSh7u+Rs0bOHOklZ4d1TGl5z6iozUkTts9anvXOQpa+VRWs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0284.EURP193.PROD.OUTLOOK.COM (52.134.111.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15; Tue, 24 Mar 2020 11:33:16 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 11:33:16 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] buildstats*.sh: add accumulate parameter to scripts
Date: Tue, 24 Mar 2020 11:33:11 +0000
Message-ID: <20200324113313.39528-4-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 11:33:16 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed1d0f86-3eb0-4204-0d4b-08d7cfe7253c
X-MS-TrafficTypeDiagnostic: DB7P193MB0284:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB028437579388ADA6ECF301E385F10@DB7P193MB0284.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(5660300002)(6506007)(36756003)(478600001)(44832011)(26005)(52116002)(6512007)(16526019)(2906002)(186003)(6666004)(6486002)(1076003)(81166006)(81156014)(956004)(8936002)(8676002)(66476007)(69590400007)(6916009)(66946007)(2616005)(66556008)(86362001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0284;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ia7TN6IDvrQwrgO8miAbAzfgJbGSSgG81+p0eXMQj0HeCzRSOHd1OA5B6aHr5W8glCWUWJJdsh2fUnPIPyoMpenjsGjnFmHw1Byh9QAw6/1XttDhWjprRpZoIlbH8jXuBf4TcQp1GIfta0VVCnKMwq102Di8mHtbzYFMKylKq+tvJAtnbKwwjeA+76FvSvonRf9Jxx8mlMcS3WTWtBrlBs4EbfiTqiZMO6KJkzQidnkmd/4Ro9MlOvMD82rrKuiXVm+E3y02wWgClkDyrah3wbJrUc7Kzjo5wkajeSCPIk3sNw6Nsyr8jj8hYUUI0qGl2P6I1GTBzj7FfXqKr3FWbLFXCY6PMkCe/hBjQfU/6oiS//4S+PDy1GuQ1z/zHBSskZeLA8eh4XqiGCd/FSXYXPuMP722OFa/tjLsheQW7+h9Bker8GePNaMIKLWQXQSI+9SPxMboMtRh2gJe9rrFMv8mlpohQdBZVwv6siJjXMg5gzikoW+c4WUxHUqEpELR
X-MS-Exchange-AntiSpam-MessageData: 
	gxK57IShPe3x1tjzKM6WsYFL4XtaERL4nnNfLyHJ+3+BQf69it1m0VYToSBpqObBZTNQkZ0C8EbaYJfxxwPqNhbcneVY3jTygAT24ETZH7GUKYcKJTbv/na0eFfM8MaVcXC8kfxKvmGrmkxxGjm9Dw==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed1d0f86-3eb0-4204-0d4b-08d7cfe7253c
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 11:33:16.8070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOCdn2BRbUh1Crk0Ch+OQkhztZxEEhsvJKMEB/tuCBBC3/kBrYad1Go20A+Cz7DjA0JZ5RS01cbQQRJGmOhfqPP5UVGoHnHUBZHl9mbXiug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0284
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add option to accumulate stats values per recipe, allowing
to sum related values such as memory (main process + childs).
This is specially useful when debugging the performance of
the overall bitbake build system.

Upstream-Status: Pending

Signed-off-by: Luis Martins <luis.martins@criticaltechworks.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh |  9 +++++++--
 scripts/contrib/bb-perf/buildstats.sh      | 23 ++++++++++++++++++++--
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/b=
b-perf/buildstats-plot.sh
index 1d22e60d73..f26312f355 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -41,6 +41,7 @@ BS_DIR=3D"tmp/buildstats"
 N=3D10
 TASKS=3D"compile:configure:fetch:install:patch:populate_lic:populate_sysro=
ot:unpack"
 STATS=3D"utime"
+ACCUMULATE=3D""
 SUM=3D""
 OUTDATA_FILE=3D"$PWD/buildstats-plot.out"
=20
@@ -59,6 +60,7 @@ Usage: $CMD [-b buildstats_dir] [-t do_task]
                 (see buildstats.sh -h for all options) or any other define=
d
                 (build)stat separated by colons, i.e. stime:utime
                 (default: "$STATS")
+  -a            Accumulate all stats values for found recipes
   -S            Sum values for a particular stat for found recipes
   -o            Output data file.
                 (default: "$OUTDATA_FILE")
@@ -67,7 +69,7 @@ EOM
 }
=20
 # Parse and validate arguments
-while getopts "b:n:t:s:o:Sh" OPT; do
+while getopts "b:n:t:s:o:aSh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR=3D"$OPTARG"
@@ -81,6 +83,9 @@ while getopts "b:n:t:s:o:Sh" OPT; do
 	s)
 	        STATS=3D"$OPTARG"
 	        ;;
+	a)
+        ACCUMULATE=3D"-a"
+        ;;
 	S)
 	        SUM=3D"y"
 	        ;;
@@ -107,7 +112,7 @@ CD=3D$(dirname $0)
=20
 # Parse buildstats recipes to produce a single table
 OUTBUILDSTATS=3D"$PWD/buildstats.log"
-$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" -H > $OUTBUILDSTATS
+$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" $ACCUMULATE -H > $O=
UTBUILDSTATS
=20
 # Get headers
 HEADERS=3D$(cat $OUTBUILDSTATS | sed -n -e '1s/ /-/g' -e '1s/:/ /gp')
diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-per=
f/buildstats.sh
index e9ec2d476a..26bfaca86b 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -38,6 +38,7 @@ Child rusage ru_nivcsw"
 BS_DIR=3D"tmp/buildstats"
 TASKS=3D"compile:configure:fetch:install:patch:populate_lic:populate_sysro=
ot:unpack"
 STATS=3D"$TIME"
+ACCUMULATE=3D""
 HEADER=3D"" # No header by default
=20
 function usage {
@@ -56,12 +57,13 @@ Usage: $CMD [-b buildstats_dir] [-t do_task]
                     IO=3D$IO
                     RUSAGE=3D$RUSAGE
                     CHILD_RUSAGE=3D$CHILD_RUSAGE
+  -a            Accumulate all stats values for found recipes
   -h            Display this help message
 EOM
 }
=20
 # Parse and validate arguments
-while getopts "b:t:s:Hh" OPT; do
+while getopts "b:t:s:aHh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR=3D"$OPTARG"
@@ -72,6 +74,9 @@ while getopts "b:t:s:Hh" OPT; do
 	s)
 		STATS=3D"$OPTARG"
 		;;
+	a)
+        ACCUMULATE=3D"y"
+        ;;
 	H)
 	        HEADER=3D"y"
 	        ;;
@@ -118,7 +123,13 @@ done
 stats=3D"$(echo "$stats" | sed -e 's/^://1')"
=20
 # Provide a header if required by the user
-[ -n "$HEADER" ] && { echo "task:recipe:$stats"; }
+if [ -n "$HEADER" ] ; then
+    if [ -n "$ACCUMULATE" ]; then
+        echo "task:recipe:accumulated(${stats//:/;})"
+    else
+        echo "task:recipe:$stats"
+    fi
+fi
=20
 for task in ${TASKS}; do
     task=3D"do_${task}"
@@ -137,6 +148,14 @@ for task in ${TASKS}; do
 		times=3D"${times} ${time}"
 	    fi
 	done
+    if [ -n "$ACCUMULATE" ]; then
+        IFS=3D' '; valuesarray=3D(${times}); IFS=3D':'
+        times=3D0
+        for value in "${valuesarray[@]}"; do
+            [ "$value" =3D=3D "NA" ] && { echo "ERROR: stat is not present=
."; usage; exit 1; }
+            times=3D$(( $times + $value ))
+        done
+    fi
         echo "${task} ${recipe} ${times}"
     done
 done
--=20
2.25.2

