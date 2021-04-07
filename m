Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.6272.1617798143329035027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Apr 2021 05:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Gel8k+w/;
 spf=softfail (domain: windriver.com, ip: <nil>, mailfrom: kexin.hao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvnFQKcWyBWIeB79rC2eIf6amhQQgiqNEKbLbggL2nfxgyLdI2tKsa3RrzgdZBLK89NjOAtOkD1lbCQLGJq9WhUwzR/Pl1c3lmVhIAgMIryC/h87efibtFQZdzNHN1g99+BrMg3gg/zOkGRhbkdf3MUirwi1nhovCikQ52pe+4ALukAxoFi97aqGaDNvOjedm3DZJ1Z7g5l5EhoaOFu9viYox+n+Jg5L1t8xoJtAhvwiO9ljlwx0+lvgRuxNz4usAqfP0+kk0lfvBOS+gymdrXGoabmmU9ulBEjSQLJ25mf6rPillGMb5TvUlVJFYJlAOnfX3tvM5rGiaruoNGIiOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qfFRrexPTEBCY3C3kaVa+wkWh53kdjn4cqD8jIrti0=;
 b=GakxJax6PBwdOgfifI67Ynx8zFe5lISz3kfvNnWXgJM/jcXMFl2HzNjWNBMG1wymoeYh9cNsfF7jQ090KmOn/JJIFEK/OJjuwVX6DlK/R4ljqY+NWNVd217QglcVCE8qCazRU5tzi3RSgLBCSaYYefLFnLouwaSLU++mULNLrSLKQmfU68iWfGeXADZNFILH1KaZqRpwQJwqtZPoZN08ivoSlrxXQreePHGjihe69L1+zHz/Azgd+Ndxc+hWE+vKNsbd1G+bqxskjDFWw50ymehHqHrQ5pDFOQnf4vOD6fjbzgYlcztWmOLha6RMZVy7VoZpELtn8x9c5GrFz5fj6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5qfFRrexPTEBCY3C3kaVa+wkWh53kdjn4cqD8jIrti0=;
 b=Gel8k+w/DZBbAfNcEuhaXAwkwsQsMl+PpTYFPP0Gvlj5BpkS40+PBgsg1dpOne8dgeT2RHDVu8gylr4HXVxZQkMQyeyhpPkirGIa8MuG4tD5rGQWc45QB26WqZ1Kx566YC6huAMcOI0uezrsI8ym3Jb00NdJj5iFn1B/c7lmX+A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2682.namprd11.prod.outlook.com (2603:10b6:5:c3::15) by
 DM6PR11MB3883.namprd11.prod.outlook.com (2603:10b6:5:19f::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.29; Wed, 7 Apr 2021 12:22:25 +0000
Received: from DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810]) by DM6PR11MB2682.namprd11.prod.outlook.com
 ([fe80::b080:6177:793a:2810%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 12:22:24 +0000
From: "Kevin Hao" <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] sysvinit-inittab/start_getty: Check /sys for the tty device existence
Date: Wed,  7 Apr 2021 20:18:11 +0800
Message-ID: <20210407121812.4099-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407121812.4099-1-kexin.hao@windriver.com>
References: <20210407121812.4099-1-kexin.hao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0058.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::22) To DM6PR11MB2682.namprd11.prod.outlook.com
 (2603:10b6:5:c3::15)
Return-Path: kexin.hao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp6.wrs.com (60.247.85.82) by HK0PR01CA0058.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Wed, 7 Apr 2021 12:22:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 35ba2eb9-d10e-4fc0-65dd-08d8f9bfccaf
X-MS-TrafficTypeDiagnostic: DM6PR11MB3883:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38837FE27D3F52397B023D3BE2759@DM6PR11MB3883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kSXOAYlZPna5NaMp7cxCx7/mFQndiZ5vB57xMpqEldj2OFSPb3j2UgSsOMsxVnUK9mB0Ey+DyrEmrfrOAmTFW3hVg5CREmi6JrFbc8hdpwhvbocNRYIyHuzAHrM8RNm+i12Djf8QMJgBLhSdEzA1Z5qNZzx9UB2WDnDF5i49tkzAgfDt1FqTBvKuwfuG6QD/8tQEKIxBZrR/ltNlG36ln/wsXn4M14kYsvBwwZNZDzkbkCX6bcCH1Zxa1hUj5H0ATLMFILTYTbMODW5QD4FjMa3hMalmzCX0tP8I14uknVLJwk4OBIAgLK7JuOYNmlqtyfG+hMVk28l8pIAnSv8J4o5cBSIiRXtdBEzTur0w22KpcL73y8YxMKyHzcVfD45nzSuIo+Qi+t0woWpqQ5FS19FJHgMwgVFqOOLYZXQ4CGbqV6tKXFhTJXWEVdBxGtSPAT02eXY4nSfakAWTTPEc5bzPAAQDd52rZpYu8gFa08sJCHYyZqZvow4u1N4tav1607YThaavLq2PJlCVkvQ8G3Xs3HYfNCXgjnMC0xb5i3LSyPTVfRnc4HsHIZTIRXrqWNE+RL3fnmZXzSCJ7081OS4H+rzQmEuJYKZpt44HD7b0kTSCCjzV3eMGq+D/fdvYGDBEfrdv6LZtB15hU06UldpzLdOuBAt9+OpLj9cMljBnIwAR6BAL2SlwITHMGASD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(346002)(136003)(366004)(26005)(2616005)(956004)(6666004)(8936002)(38350700001)(52116002)(86362001)(6506007)(8676002)(6916009)(5660300002)(66556008)(66476007)(6486002)(66946007)(36756003)(1076003)(2906002)(478600001)(316002)(38100700001)(83380400001)(16526019)(186003)(4326008)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?AvnidiJuJweXxtfrG86K7cpAAb4FVuA+bqmo9OdGO7g84wF9uJEg6ez851P8?=
 =?us-ascii?Q?7Ua8hNBCCs8IsAN9WrL3lPYHrJL3jgd8IvoACzLazml6UCw4hJM5EY+aOrLS?=
 =?us-ascii?Q?HmuzccBM8g4ld69yExOKfOi4Rn+W+gYr94FnLTULq9X0rpf8/LbFtc2upKuG?=
 =?us-ascii?Q?QFANssaC/aWKUGOB1eXViSUclb2Om1gvkX+jFthPQ9jdj8XNfdSYNjlJltCd?=
 =?us-ascii?Q?V2jFswYAwrCJ5RVlasOhd2/w/8X31v2CQ1cL2WHVGwm4rS0sIO29vcnMQq+Y?=
 =?us-ascii?Q?He/3GEaQZ618ZW31U8vhoCQ9oDhCM1W8OegcSZsD/DMzkaVhSgjHPSwzrx/E?=
 =?us-ascii?Q?eQ9fJfCfRH7g9yRUmDJB/+rbR/VEogpf4J/mL4fLrg4r1FcNg/jxvcxaeIYu?=
 =?us-ascii?Q?H53AjGaUT9I+K7KEymLGAJqF2+lxrfA37arN8r2WmGAdF8g0mkcFtcX34ZIi?=
 =?us-ascii?Q?um1LpsS3VPEzrp45H1DxEpFX/gVRnGR6oRJFGDEGacBvn1zY4UN8zY21gjv5?=
 =?us-ascii?Q?1Sc4qIBIHhLeuzKTUgreJm8AyFaYFiFW1rW5YPIeZL99BXx0Q58iwk8Gn3O7?=
 =?us-ascii?Q?wLLy69sNt4/vlgz/rpUHxNgd969hKF7CTbQsmGD4Iyr+rU+qt9wjzzoLHTk3?=
 =?us-ascii?Q?UNAHdX8pGRK+u/M4hdCTcXDJF8aDATRFC5EsBSZE/Z8ajxC1nOgXOMq5rh9E?=
 =?us-ascii?Q?w8hB6OLgz0sgfOeHg5dfFxm+tUyDZAhQBx5mVVGUY1eNMNVbNDUrG98TppyW?=
 =?us-ascii?Q?ay2aDVP7N4yKXYSJa6ZX7IFWPLa73kTvE5kPznBnWEkBWID9Sq8htY7+2Bx8?=
 =?us-ascii?Q?1g8ido72eL5hTSA9LbKcY5T1nMuq4WF9b22tGeeRj1jJURpy1cUKuMOHFzpu?=
 =?us-ascii?Q?nq8ALuDt0OtwfA4iIRKx4szOls0xQ9dTE8/KG+yZHP5bWOsF5JLdLoJ6i2cl?=
 =?us-ascii?Q?mMSOD3NlKS75qgopshK2cl9h3ZMzAynO0+ic+7akR0Qc6lcuMEW+H89Zyxcd?=
 =?us-ascii?Q?AUpQmosiFElqdBDyrbg0hMyA/Aurah0rbWhccoikBFsOFSWcJ4vYziS9yP7W?=
 =?us-ascii?Q?T+5svzGCnRuI4IJiGPsOpOxw/hNhnTzJcQQyrTqnWVzAmNkwbhg3BcQFOLEi?=
 =?us-ascii?Q?hyyRc5iowPqMxkxggqDE3EQ8X2UCkg40v1lCuMAMxRrMGZ3lRsLUI7ZGvUu3?=
 =?us-ascii?Q?9C/BtjKmKyvIBETzBGkPRUsJkLZsigbWh38STWqkcjENnJOBTqeplM5LJIuT?=
 =?us-ascii?Q?lakOgfVuvFl0hx3JeR6Ji+Y5GrzWya8C3evBcuKi5TDO1WJgDtLK+60iozHN?=
 =?us-ascii?Q?xzu7PnkPdLy478hdJJYLFkpW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ba2eb9-d10e-4fc0-65dd-08d8f9bfccaf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2021 12:22:24.2580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RU/YFwtkjp32Jx2+ECRLvVrzXto5qo17JqzBTAF9PvL0L1HnyvqEJbQ2stj2nT3V2scHKtku1c2u0PtsteFSKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The hvc tty driver doesn't populate a file like /proc/tty/driver/serial,
so the current implementation of start_getty doesn't work for the hvc
console. By checking the /sys/class/tty/ for the tty device existence,
it should support more console types and also make the codes more simple.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 .../sysvinit/sysvinit-inittab/start_getty     | 44 ++-----------------
 1 file changed, 3 insertions(+), 41 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty b/meta=
/recipes-core/sysvinit/sysvinit-inittab/start_getty
index dfa799adac2e..699a1ead1a40 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
@@ -1,17 +1,4 @@
 #!/bin/sh
-##########################################################################=
#####
-# This script is used to automatically set up the serial console(s) on sta=
rtup.
-# The variable SERIAL_CONSOLES can be set in meta/conf/machine/*.conf.
-# Script enhancement has been done based on Bug YOCTO #10844.
-# Most of the information is retrieved from /proc virtual filesystem conta=
ining
-# all the runtime system information (eg. system memory, device mount, etc=
).
-##########################################################################=
#####
-
-# Get active serial filename.
-active_serial=3D$(grep "serial" /proc/tty/drivers | cut -d/ -f1 | sed "s/ =
*$//")
-
-# Rephrase input parameter from ttyS target index (ttyS1, ttyS2, ttyAMA0, =
etc).
-runtime_tty=3D$(echo $2 | grep -oh '[0-9]\+')
=20
 # busybox' getty does this itself, util-linux' agetty needs extra help
 getty=3D"/sbin/getty"
@@ -25,31 +12,6 @@ case $(readlink -f "${getty}") in
         ;;
 esac
=20
-# Backup $IFS.
-DEFAULT_IFS=3D$IFS
-# Customize Internal Field Separator.
-IFS=3D"$(printf '\n\t')"
-
-for line in $active_serial; do
-	# Check we have the file containing current active serial target index.
-	if [ -e "/proc/tty/driver/$line" ]
-        then
-		# Remove all unknown entries and discard the first line (desc).
-		activetty=3D$(grep -v "unknown" "/proc/tty/driver/$line" \
-			    | tail -n +2 | grep -oh "^\s*\S*[0-9]\+")
-		for active in $activetty; do
-			# If indexes do match then enable the serial console.
-			if [ $active -eq $runtime_tty ]
-			then
-				if [ -c /dev/$2 ]
-				then
-				    ${setsid:-} ${getty} -L $1 $2 $3
-				fi
-				break
-			fi
-		done
-	fi
-done
-
-# Restore $IFS.
-IFS=3D$DEFAULT_IFS
+if [ -e /sys/class/tty/$2 -a -c /dev/$2 ]; then
+	${setsid:-} ${getty} -L $1 $2 $3
+fi
--=20
2.30.2

