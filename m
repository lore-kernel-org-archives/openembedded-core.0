Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.7872.1585061087308698415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=TatRU8uZ;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=boILASAodDQMrTadXUF3y2huDdzd5cXpYtmq990son9e6+EYZZCybAEZ5x+/4JQwcstOdb0wZmsOXUi2rUp7qMODb2iIfFYLvwP2/NcVQCQW2nMhF4rrfjtfRxbk24V9MqyjvghJJK/NvN3XdICvAp/xMaaCV60Dj+hn2JQ/6oPf1Rg+zYd08qKTp6aDsGBspIf5AE7LKNvfyw0WUTJfoQf3qLvGAYrChBSMv3Oo4q9PGOFyc0SwHuBkDTloai3SmAeSO1fLWzuMTn+pCSmKQPJ/i8UaeMv88UgZutQDdLpXSQstpunUh+trfh5e2cq9MvAo9qH3u6mfJmNY+E5p8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf/VWW0FQr1MMBrN822ghHnylx+qkBR7FwZXkuBAXpk=;
 b=ajJB5ami92h6pYNWWw1xjfxRLpYtEH3I62nsJV91JZqVzLGfut25yeJUlzUr5iu0jcXQsYIsbnrh7jyYjHkqQ4H58ZMjwt0tZIYDa3iz4UfiPnuCM/2XfYFtTgFI6mRx8ZhPzzpFr7Ix5ebjBr0+oCKyO0kP8XzHjM0zj9M/Nj5uncMF/mcXsPQCwNxTyLw+z2iAyCxIgplQZaGomL67YL1cUHXdpmodJxfkj8Z7so8kmgR03iSZ59pMQBWrNFqqy/YSfgy/syy/iYyHdDy/krgKqGsCr3BLGcSdQrh+g3PCegG+Oap0Ok2mzY+befg8fIX5aHVnH2E9SdwMp2ihGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hf/VWW0FQr1MMBrN822ghHnylx+qkBR7FwZXkuBAXpk=;
 b=TatRU8uZWv/yZ+pVs284jdpd0ZSOSYdrFKVAplePBACktoKPjHfDfPuwpoTtByFRTndRaxj6S8fQFxe+IwAHHC+yuI699tatP4lieaqaYS/CpC0IlTUWkOaXYPbJqPsT1lrs6SoLLyW5wOLj5PKf5E0zdHuOLRn2QznA0xGzSGs=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0393.EURP193.PROD.OUTLOOK.COM (52.135.128.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 14:44:46 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:45 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/5] buildstats*.sh: add accumulate parameter to scripts
Date: Tue, 24 Mar 2020 14:44:39 +0000
Message-ID: <20200324144441.41230-4-luis.martins@criticaltechworks.com>
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
Received: from localhost.localdomain (213.205.68.220) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 14:44:45 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a952c0b-754a-4d1f-f010-08d7d001e541
X-MS-TrafficTypeDiagnostic: DB7P193MB0393:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB039322F93F2E4BAB5F8DFD0B85F10@DB7P193MB0393.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:409;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(5660300002)(52116002)(26005)(6512007)(6666004)(44832011)(36756003)(1076003)(6506007)(186003)(66556008)(81166006)(81156014)(8936002)(66476007)(956004)(2906002)(6916009)(2616005)(86362001)(16526019)(66946007)(6486002)(69590400007)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0393;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NBil+jyPLEF8z6iwEWqmHRqjt/CA3LsnyM2C+XYwyY9cfQBazj96cIKm6XsvHh+fr5+tMXAOXk+NhkTIzghZch2EdF5Hep9ZAO7gw8Wb2UquYzl4Ftbv5VD/vzlE/Vb1ivnwwq6KbhCebXZ+gh3AnmBqkPQGrvUFK213TmGHSGMlMQx/jS83GLAtiBq+D1W4KReRs/TvBNBlyVb6vzuUU+5jGIFGuPOmT6jHbRSTqi+OELWAj4j3g9maolrTPlYIRTq9sGA2zS+rdXND1KcGrUbI3tlFThnG2M/Nxe6mjgLd+LIq6AouhVBBR+ZWHcStTcT8Bn8kB+KLHkL/qUVfUrIH0FJtO9OlZMB10k2LGihJjsllgUf2/lQsBfd4VyMSwQvZv4mU/0xMdaUPtvl3z6kgEBsTFM+QJXs6pvc0SiGQv36N7T0wevMx5/OvRMJVj9ll+Me68BRywQqInmT+m60JkHq36FmYJ0kmH9nD0HU9jSm2dFZPH1GYGkx6yTEC
X-MS-Exchange-AntiSpam-MessageData: 
	zepx66+eN9KKaBVmE4Sd4WKVuFuue1lJrrEQV6QvMeh8XUDrq/I8hwM46v2dmXYa4O6UEFpzcg9K/FNEH5q97H+FTSUyYdlOItJ5Brti9MvaI1/5NAPvhrQEsMbV70DUyr3++dDivetR7aSlYDFOsw==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a952c0b-754a-4d1f-f010-08d7d001e541
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:45.8671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tw3Uglv6Nd7XlmweSfZbRQgLqXlxxJC0o93I0Bs0y9CzyC24lpoUTF00wqcv+rZv7CXFj8L71Qo3BfI5Gb8pI6IbIA48+nMWfstDr/bzR3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0393
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add option to accumulate stats values per recipe, allowing
to sum related values such as memory (main process + childs).
This is specially useful when debugging the performance of
the overall bitbake build system.

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

