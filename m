Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.7872.1585061087308698415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=o2LfnOLX;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmDmdsLUBwQ8wjpHhB0T9qwIvQPNYMpDtPiXw14cLPW1wvsf6/y/B+GihXrd+lp6JZH0ZTNclhio48R973n5qoyYDub1Xr4aV4qx4HtxIwZ+iQ91KLUugtk0zBshnRlsEH3EFjFcVmpU7/NuTiOQJXAX7Ybft4wCd+TEW2EHu8NJKGdmV1xyMWcll+4Ily373tawQbehfzwzdxRyLPHDqUEHsSW+VeKRmh1QdaGGJyUobs6Cxvw/ujMhEnYZFs1cxRDOZhB5cHkmNusUVfaJav1/yALJuobOG/FTDTkHzmD57Avai6CYibb6lJQTlnOBl4XKB5fePI2Mj3u6LuqILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPb0vLKcac4+gEp2LjJAdUSzL4bz9/HjG/sOOZijzBo=;
 b=KG1TQfgkVOcXz0S+nWJnAKrMbs5PQp5wuuZEBLO2gqnU6jKl9F+v1od5iS1PFiYBPglUVJNORniOwp+D1Gp/YOKtmFo03lDjHhYSxuEL/uoC3Ff1MhPbm4v40EgPcdXq7PZTaiC1adL+Zxu2ykrlE0XV5mEmLrF66DIvGuZRI2/ZBMJEI81jALFMSSno7s7hs8iwwy04kdoOIJ1p+Ln53stSYg+PMvwqWBknwO6G6uFzoy4oaHwZJqAhwJKHhYkzQgBOdNcistOp46S631IjRjS4fY4gPfbtaHn8WhuG/OAbCC9pbY7ivReBjryxi8En6BZHhR53RGSqGKHw4OaPsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPb0vLKcac4+gEp2LjJAdUSzL4bz9/HjG/sOOZijzBo=;
 b=o2LfnOLXrfvshHLcvrNCK5PSJwaVkiWd7OEjztFhwjya8PSAQy9s6ORLD0sdDUE/hLGcHw3PfyqJouD13GjnZkZqHiQf7gULwXn7fV/W23rGei7LuUZigWIt3KNJrmyKd6orMXYqXC5d8MAAEDWj2VEoJlEq19KS5sR29DTuAls=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0393.EURP193.PROD.OUTLOOK.COM (52.135.128.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 14:44:46 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:46 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 4/5] buildstats*.sh: add recipe parameter to scripts
Date: Tue, 24 Mar 2020 14:44:40 +0000
Message-ID: <20200324144441.41230-5-luis.martins@criticaltechworks.com>
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
Received: from localhost.localdomain (213.205.68.220) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 14:44:46 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11df14c6-1173-479f-d799-08d7d001e5a3
X-MS-TrafficTypeDiagnostic: DB7P193MB0393:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB039359AAAAA749B0244A13C085F10@DB7P193MB0393.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:257;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(5660300002)(52116002)(26005)(6512007)(6666004)(44832011)(36756003)(1076003)(6506007)(186003)(66556008)(81166006)(81156014)(8936002)(66476007)(956004)(2906002)(6916009)(2616005)(86362001)(16526019)(66946007)(6486002)(69590400007)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0393;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OVMqCCAv6txUu2yjiVNOJyv7H24+rcEsZxOVadGs2QzpkpRtb/B2qu38WSjictQkNe6wHrnuxS0k8SmjNamenBFffcMmzTlFkuVdthQEYJ2RCe17kVu8E8SZNvnYJzU1mF8Hmo76CYbVQ7NIjfAgsN0+3VLrXh1Mi02bdXOOStj7aecH4JccEz9JuLhQ8MKR5Nflq38McCdspb1EhFAYKLtbUSxcvtIsx0i27j2xKsNIYbsGXyT6+rKI/q1oQoin8qFJlOOk7PoGLcFgds9yog2kM33D67duAqB/MDk7z7OpB0ynXKh4+R+9tcWUouJf8fI8tw3h5RPoRx2YsG98yjIx9YwpnRTffTIgUwtR5Chz+q+ag880r31LFQ2VYAW76/HKXo7omMNh+YotGzUeQXCCgfZeQKWQTbc4bOVGek7feiymDksx2xZhwR2IgVp9jSTRHCjOIdKsxJxKZIPHbyku6ITuktxxfwhaz2czYb/2OdvS+XQiDS4YBsju6PBK
X-MS-Exchange-AntiSpam-MessageData: 
	wjgmxIwOvehgcnv9dzTYM81+iALQOMIRBnvEldvkNNKKNQXGZyLApsrmWcEyxr9jpGiZ1XK/Aqvac9ijrFlAu+MpdlkStf20cYBSfXchHIchQIRwoghXP+Anys+tIh5akGzZzu55b/sTsF4mrzzx7w==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11df14c6-1173-479f-d799-08d7d001e5a3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:46.5397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgwNwzhX4qngUWeT/8rbYog8OZdG2aBnrjNo0kVArszHZeWK08dQYcQFEIa7ZO/OgYBDQ+ZExHLYXVNPA30/k8AwaB3HmstwKhfiLlTneIE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0393
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add option to filter the stats results for a single recipe, allowing
to easilly visuality the task resource consumption per recipe.
This is specially useful when debugging the performance of
the overall bitbake build system.

Signed-off-by: Luis Martins <luis.martins@criticaltechworks.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh | 9 +++++++--
 scripts/contrib/bb-perf/buildstats.sh      | 9 +++++++--
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/b=
b-perf/buildstats-plot.sh
index f26312f355..320c4910a1 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -39,6 +39,7 @@ set -o errexit
=20
 BS_DIR=3D"tmp/buildstats"
 N=3D10
+RECIPE=3D""
 TASKS=3D"compile:configure:fetch:install:patch:populate_lic:populate_sysro=
ot:unpack"
 STATS=3D"utime"
 ACCUMULATE=3D""
@@ -53,6 +54,7 @@ Usage: $CMD [-b buildstats_dir] [-t do_task]
                 (default: "$BS_DIR")
   -n N          Top N recipes to display. Ignored if -S is present
                 (default: "$N")
+  -r recipe     The recipe mask to be searched
   -t tasks      The tasks to be computed
                 (default: "$TASKS")
   -s stats      The stats to be matched. If more that one stat, units
@@ -69,7 +71,7 @@ EOM
 }
=20
 # Parse and validate arguments
-while getopts "b:n:t:s:o:aSh" OPT; do
+while getopts "b:n:r:t:s:o:aSh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR=3D"$OPTARG"
@@ -77,6 +79,9 @@ while getopts "b:n:t:s:o:aSh" OPT; do
 	n)
 		N=3D"$OPTARG"
 		;;
+    r)
+        RECIPE=3D"-r $OPTARG"
+        ;;
     t)
         TASKS=3D"$OPTARG"
         ;;
@@ -112,7 +117,7 @@ CD=3D$(dirname $0)
=20
 # Parse buildstats recipes to produce a single table
 OUTBUILDSTATS=3D"$PWD/buildstats.log"
-$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" $ACCUMULATE -H > $O=
UTBUILDSTATS
+$CD/buildstats.sh -b "$BS_DIR" -s "$STATS" -t "$TASKS" $RECIPE $ACCUMULATE=
 -H > $OUTBUILDSTATS
=20
 # Get headers
 HEADERS=3D$(cat $OUTBUILDSTATS | sed -n -e '1s/ /-/g' -e '1s/:/ /gp')
diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-per=
f/buildstats.sh
index 26bfaca86b..2f017efeb8 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -36,6 +36,7 @@ Child rusage ru_majflt:Child rusage ru_inblock:Child rusa=
ge ru_oublock:Child rus
 Child rusage ru_nivcsw"
=20
 BS_DIR=3D"tmp/buildstats"
+RECIPE=3D""
 TASKS=3D"compile:configure:fetch:install:patch:populate_lic:populate_sysro=
ot:unpack"
 STATS=3D"$TIME"
 ACCUMULATE=3D""
@@ -47,6 +48,7 @@ cat <<EOM
 Usage: $CMD [-b buildstats_dir] [-t do_task]
   -b buildstats The path where the folder resides
                 (default: "$BS_DIR")
+  -r recipe     The recipe to be computed
   -t tasks      The tasks to be computed
                 (default: "$TASKS")
   -s stats      The stats to be matched. Options: TIME, IO, RUSAGE, CHILD_=
RUSAGE
@@ -63,11 +65,14 @@ EOM
 }
=20
 # Parse and validate arguments
-while getopts "b:t:s:aHh" OPT; do
+while getopts "b:r:t:s:aHh" OPT; do
 	case $OPT in
 	b)
 		BS_DIR=3D"$OPTARG"
 		;;
+	r)
+		RECIPE=3D"$OPTARG"
+		;;
 	t)
 		TASKS=3D"$OPTARG"
 		;;
@@ -133,7 +138,7 @@ fi
=20
 for task in ${TASKS}; do
     task=3D"do_${task}"
-    for file in $(find ${BS_DIR} -type f -name ${task} | awk 'BEGIN{ ORS=
=3D""; OFS=3D":" } { print $0,"" }'); do
+    for file in $(find ${BS_DIR} -type f -path *${RECIPE}*/${task} | awk '=
BEGIN{ ORS=3D""; OFS=3D":" } { print $0,"" }'); do
         recipe=3D"$(basename $(dirname $file))"
 	times=3D""
 	for stat in ${stats}; do
--=20
2.25.2

