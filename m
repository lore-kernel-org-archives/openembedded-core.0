Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9C3C6FD1C
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 20:09:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4226.1679342968865251258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 13:09:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=g5+APsW4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2443696a82=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KJNgOQ002463
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:09:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=FMdazihQnYkgITEnEhlsULEx54qYU7tgjm/GgO3FYNA=;
 b=g5+APsW4CahZh4WKpWJw5ZJ8fyFgqco8gY9+IUJ6wC4NUaP7eE6TtqpLjDgR6kjhq1El
 aWPP6dqDGppZF9Z4AKUGXzvN4bMtS6bnLTjVUPkHXpPzpR/rGc1EFVMfTZwbboXKBmr4
 TVIW7bDcCN5nvt3uJYxlrcpH4JYAZJZGM3h3aHjtIv0oPgeB3qzWjgKez4p2hn59lau0
 2RSIlO1tFLAwj1Qqj43cFvr1aCtS0NsSR2lFmsD2xQ2dNcaKmAmNEesInTvHdKBkPUsR
 GgwuZyKPjf2huknrPnizhqMvY6OH9SPdN7I1iJNispV5wpT19Q67lZZFq9v2wVOsqUr+ xw== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4t3h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:09:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUMDnWD4oYB6PADO4GfzMNkICzZ572ecHiuYrQxNKdBh9x9AtHmpYr5MTBK9h9Rj/yy+EDxsZ5rE2QPi2BQ0+otgsi65/8ZAo/q5/uvdHHkVzkRkds//znoWAh3mZ8XnJ2/NQbd+Zx51YQzwa3H4TNgyUT2lR9wXtJHplO4olyaMmbXa6FuazPCGNocZMkShTft02Uab5GygnamoSK9rrm3Cub0PRqTWGygsv37jgZ2LPIv6LVgTDvtNLuLJl/gWTrzxjz0DYiphPAox8mL5u1kEUc5TaTONQrQ5fRRa+uxmU/6Nxcdh0NoGALCp7b9xzO2bq3AaicWJMqRbkhMSPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMdazihQnYkgITEnEhlsULEx54qYU7tgjm/GgO3FYNA=;
 b=jRoTI4CAvV3pToRZ7B0B9YEzj+Sif+CXU3bNcwSEPNBn2f+G8dUl3TCtWZyL5MOjpYTcECFPq9u7zhzzngVPgOAo9ff7IyCSxt0p+ROoHz5EHKta+1yOFOLMMiFyhbqY1sUQTJP3CFR3MTnHuAUtwGfvDli2p9yP7XjCAowbZFsMRBbhA6UjmfBEC388D4XVCnJka3vZK9P08zFbLwlkm05zJWA1Z5Zt8V1bucjS4up5Fn/y3nojD/X7483/4orQqegyLB401eG2rBuqT3aiFRxmPdl6wZXX/HaP1CU6M/0pEUgkIJUfxtI6erbe3qe0D8705ZbaD6GYbEvdOOah3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 IA1PR11MB6075.namprd11.prod.outlook.com (2603:10b6:208:3d5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.37; Mon, 20 Mar 2023 20:09:23 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4f46:b639:f638:d5f7%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 20:09:23 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH] go: fix CVE-2022-2879 and CVE-2022-41720
Date: Mon, 20 Mar 2023 16:09:08 -0400
Message-Id: <20230320200908.1233173-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0036.namprd02.prod.outlook.com
 (2603:10b6:207:3c::49) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|IA1PR11MB6075:EE_
X-MS-Office365-Filtering-Correlation-Id: 48265450-885b-4e4f-3f50-08db297eff79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jXL6WChWiX3znMTTirHDZRepc09uBu66skUhlpN9JpDhQZTfXPgHOZuPFgUWqaxB92XqSzxpyb9AIvDy6s3Rm4UOqxjSj8+qiQd0FQyu0C6qJ+8OjaDUB5SA401mvvABImGzl+hHWgs0GsHFsZzzb1m1BaW+C84MrRz/LzC8Qjih1FRjBHDc60o9oJS2twqpEStv/tfhsoA43Yyu/6egJ7Zm/6Y5PI2M59m6BgS8WjeK4CmdU1PTR/wC9rA1iQQcg2taN0TliX/bsjPNV9zpBvyMMn5HcyCYoJH5KNH6kdh8kZUMDM6biS76BEC4ephzwemgRhadFPbnhoaG8UyR0wjnkYTo1Np1EtmH2QL+3yAnGvpr9PhPfD6xBCruQSjpQnJ2s8NhgA/PdQJkyHVhT2WDQiPC1ohRGEwe+PMhQ9TJm44vb2EHuGKERir7HKQ4zFRO5Q2n0MDm5+C8Ntpt1PZdTMlnX3ZlBpxITurnksDMRPGi6+a4uALvp+L44VZvz1yUwPAKSveKNDpTGb1D4j4BurObY9LM+2ZeI+sk6WhMlFZKXMaWj4GxTnBslUgzCRTSLVD26XnYSvb6uD+mR5VdQSjSDL5DcNX9mYMnM9t+EG+Xts3GMP3CONBEC6jKEStUb+gkteTxCtwHU1vpTjC3qIovjq9nRCPdPvzMseyAs8E55t+u6PHUNruXTDe9M3UYGmFL5chMKgber+ZAQEZHVgggVOC6zwDfVAHFXdUOSArIFjpNgwlkkxoXxHxE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(451199018)(478600001)(41300700001)(83380400001)(316002)(66946007)(66476007)(66556008)(6916009)(8676002)(186003)(6512007)(6506007)(26005)(1076003)(6666004)(2616005)(86362001)(36756003)(2906002)(5660300002)(8936002)(44832011)(52116002)(38350700002)(30864003)(6486002)(38100700002)(966005)(403724002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D3pNeFpWB8TLUhtD5O7Y5smm4fhnoAuq/ZX/fXh9aYoGyx8Rr41rIwzXbenY?=
 =?us-ascii?Q?0FpFPXJWy7M+Y2ubYzroYhMg5IRamFWPAvxUdeKp2LIKmHmRJaLq8hToUGQH?=
 =?us-ascii?Q?sv/WvPen2WzwwhewAFuLMzDyFF2/hd5zcPqPvc85wKsFHEf2xDZQuWaCiSH2?=
 =?us-ascii?Q?qzySjVJULLfhrzBl+txnmiLKL3q/x8eKU+bWhlkgISpAFxDkKArSsYEA8BcH?=
 =?us-ascii?Q?I5XgbsgznW2TSlosA+d+dXaiL2+umdR2QeGpDF27HZ2hgai+sbGPmQEcDIob?=
 =?us-ascii?Q?SeC45BMKzV1kXXFaYBr+bSvaHWr9cRVxZJzsSofJ1DLmoDKD8ltUqIJIPKcE?=
 =?us-ascii?Q?7wdMJgpY+50hNEyrLrjpJeLtrRXAHPLVfgTd0UhLzDvZ8QVPn4vbWI/wqCny?=
 =?us-ascii?Q?kHPT+SiAuJuMd57aMsgKkO57Joegb59/dyRfhUc461RXivRemJzR/7/Zd/2q?=
 =?us-ascii?Q?SKgsmdAOcBJ6SRoU+NivJ1AcUVRz00zOEjPjuhshRsj4nVaOKhEdJCpngHMJ?=
 =?us-ascii?Q?hqFaH6qH+mBe3HpT7wJWQAIXmIi0wMbTqF4Lfo37b6AwcZIyS1fV6BQ2CFG9?=
 =?us-ascii?Q?bkl5dR4a4/hw7ScfQTypklVc25MuHumqugIe1CpEuAxSUg0qLJw4dbi9u4zg?=
 =?us-ascii?Q?GCLL3IxxJUS+0LDUVG9KJ10eMIaVde/nKyZdR0px4uDx7CTi+3DUUPxAgukn?=
 =?us-ascii?Q?UvIYOZ0Xo8CUrl4bLjxfSSpcSJkTcYyKCAfkRdlW/KdBSCQQEIlIxZz8HurU?=
 =?us-ascii?Q?rb/aeEnu1AKtg7oINWBgh3nW5DcryPLb4xRmGn68R8W2g2W/zd1dEvkdp3N0?=
 =?us-ascii?Q?DS24VJPMQhEcwbbiL0koXvWWdn0piiYzJb+vbaondUc1EVvl3zDFO9v67q7Y?=
 =?us-ascii?Q?OlAVhy58UpBN9i7Ox04qjSH4j9AdIg16efB/CErbUVl9nR1+whybpGIL4UvR?=
 =?us-ascii?Q?CttV62Ni5YH8ekJ75LUDCKPGXR9ig9ssyfQol/Ba6prbrtMOIJsgly5n1ZUU?=
 =?us-ascii?Q?ZASjl3oW4dMIVeKSSj/KacejGEDKUZZ4MBHpRnhKBKn20NhPAXYmC1N7HMqj?=
 =?us-ascii?Q?K9qUAIeynG/XFVVjEkcKknzYkcbLARMdJJKYaCn4j2YX+UvH2UD1aPmh/VHA?=
 =?us-ascii?Q?TfLPCVoIG3lJmumEN/KwGh0gqNrNJEdAtcAP5ZKQoHcnySj3Bk9JS0gg7aix?=
 =?us-ascii?Q?uruoyqEyhBNVYlc3aqSXUdgq+bnWb4qCme25leB6D9jTKyc0Asfb2SfYz+Y4?=
 =?us-ascii?Q?pqRJLBPXUnIAZOFFLLYa7T0Tm6ngMNczX/g7XV22NC7yNOUf20GQS/N+CYml?=
 =?us-ascii?Q?p2GwFb6bugWW0mfSFV6y3cUO4/Pqqq7mX9gjCkb8Bc0GZCEtroqekTgUfh11?=
 =?us-ascii?Q?oKhGgWniVJfN2xbvy1JsIWcbCJl536yTYKwHh4YJVMfHrFvttNnujtB9bLvz?=
 =?us-ascii?Q?b/bn2cO+hU1IjcBqOOzV0RFBWjrzPdGDBFDYthz3HbhxDFxK7pFqPnuMAJ29?=
 =?us-ascii?Q?v33sw3avC7PFP15r4AZsQHPlNIs2LCB/XwPmAbfpgpShbV2isUmIEl9og0XE?=
 =?us-ascii?Q?kZjvHMfOtG+fluxtNhkqYdgH9kmNZDVqIDecjGEJ51Tt+l9mkgdKe0sCBD4Z?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48265450-885b-4e4f-3f50-08db297eff79
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 20:09:23.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6h/96VGUeojC20DY/VCEkSYflhyzbIUvwjaO4XZ/Ao5IlRHBWBbJrR5airybFRbZzFelbxgrGyKQthilxsRRrcci9nGLNL1z0LjqdX0b9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6075
X-Proofpoint-ORIG-GUID: NK3Czl49aj5bLTwz-thnFYYKZq3TaxYm
X-Proofpoint-GUID: NK3Czl49aj5bLTwz-thnFYYKZq3TaxYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_16,2023-03-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200170
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 20:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178840

Backport appropriate patches to fix CVE-2022-2879 and CVE-2022-41720.

Modified the original fix for CVE-2022-2879 to remove a testdata tarball
and any references to it since git binary diffs are not supported in quilt.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  36 +-
 ...01-archive-tar-limit-size-of-headers.patch | 177 ++++++
 ...d-escapes-from-os.DirFS-and-http.Dir.patch | 514 ++++++++++++++++++
 3 files changed, 710 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-headers.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 99662bd298..f5cf192361 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -4,23 +4,25 @@ FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
-    file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
-    file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
-    file://CVE-2022-27664.patch \
-    file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
-    file://CVE-2022-41715.patch \
-    file://CVE-2022-41717.patch \
-"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
+           file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+           file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+           file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+           file://0004-ld-add-soname-to-shareable-objects.patch \
+           file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+           file://0006-cmd-dist-separate-host-and-target-builds.patch \
+           file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+           file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+           file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
+           file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
+           file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+           file://CVE-2022-27664.patch \
+           file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
+           file://CVE-2022-41715.patch \
+           file://CVE-2022-41717.patch \
+           file://0001-archive-tar-limit-size-of-headers.patch \
+           file://0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch \
+           "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
 # Upstream don't believe it is a signifiant real world issue and will only
diff --git a/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-headers.patch b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-headers.patch
new file mode 100644
index 0000000000..0315e1a3ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0001-archive-tar-limit-size-of-headers.patch
@@ -0,0 +1,177 @@
+From d064ed520a7cc6b480f9565e30751e695d394f4e Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 2 Sep 2022 20:45:18 -0700
+Subject: [PATCH] archive/tar: limit size of headers
+
+Set a 1MiB limit on special file blocks (PAX headers, GNU long names,
+GNU link names), to avoid reading arbitrarily large amounts of data
+into memory.
+
+Thanks to Adam Korczynski (ADA Logics) and OSS-Fuzz for reporting
+this issue.
+
+Fixes CVE-2022-2879
+Updates #54853
+Fixes #55925
+
+Change-Id: I85136d6ff1e0af101a112190e027987ab4335680
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1565555
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+(cherry picked from commit 6ee768cef6b82adf7a90dcf367a1699ef694f3b2)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1590622
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/438500
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Run-TryBot: Carlos Amedee <carlos@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+CVE: CVE-2022-2879
+Upstream-Status: Backport [0a723816cd205576945fa57fbdde7e6532d59d08]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/archive/tar/format.go      |  4 ++++
+ src/archive/tar/reader.go      | 14 ++++++++++++--
+ src/archive/tar/reader_test.go |  8 +++++++-
+ src/archive/tar/writer.go      |  3 +++
+ src/archive/tar/writer_test.go | 27 +++++++++++++++++++++++++++
+ 5 files changed, 53 insertions(+), 3 deletions(-)
+
+diff --git a/src/archive/tar/format.go b/src/archive/tar/format.go
+index cfe24a5..6642364 100644
+--- a/src/archive/tar/format.go
++++ b/src/archive/tar/format.go
+@@ -143,6 +143,10 @@ const (
+ 	blockSize  = 512 // Size of each block in a tar stream
+ 	nameSize   = 100 // Max length of the name field in USTAR format
+ 	prefixSize = 155 // Max length of the prefix field in USTAR format
++
++	// Max length of a special file (PAX header, GNU long name or link).
++	// This matches the limit used by libarchive.
++	maxSpecialFileSize = 1 << 20
+ )
+ 
+ // blockPadding computes the number of bytes needed to pad offset up to the
+diff --git a/src/archive/tar/reader.go b/src/archive/tar/reader.go
+index 1b1d5b4..f645af8 100644
+--- a/src/archive/tar/reader.go
++++ b/src/archive/tar/reader.go
+@@ -103,7 +103,7 @@ func (tr *Reader) next() (*Header, error) {
+ 			continue // This is a meta header affecting the next header
+ 		case TypeGNULongName, TypeGNULongLink:
+ 			format.mayOnlyBe(FormatGNU)
+-			realname, err := io.ReadAll(tr)
++			realname, err := readSpecialFile(tr)
+ 			if err != nil {
+ 				return nil, err
+ 			}
+@@ -293,7 +293,7 @@ func mergePAX(hdr *Header, paxHdrs map[string]string) (err error) {
+ // parsePAX parses PAX headers.
+ // If an extended header (type 'x') is invalid, ErrHeader is returned
+ func parsePAX(r io.Reader) (map[string]string, error) {
+-	buf, err := io.ReadAll(r)
++	buf, err := readSpecialFile(r)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -826,6 +826,16 @@ func tryReadFull(r io.Reader, b []byte) (n int, err error) {
+ 	return n, err
+ }
+ 
++// readSpecialFile is like io.ReadAll except it returns
++// ErrFieldTooLong if more than maxSpecialFileSize is read.
++func readSpecialFile(r io.Reader) ([]byte, error) {
++	buf, err := io.ReadAll(io.LimitReader(r, maxSpecialFileSize+1))
++	if len(buf) > maxSpecialFileSize {
++		return nil, ErrFieldTooLong
++	}
++	return buf, err
++}
++
+ // discard skips n bytes in r, reporting an error if unable to do so.
+ func discard(r io.Reader, n int64) error {
+ 	// If possible, Seek to the last byte before the end of the data section.
+diff --git a/src/archive/tar/reader_test.go b/src/archive/tar/reader_test.go
+index 789ddc1..926dc3d 100644
+--- a/src/archive/tar/reader_test.go
++++ b/src/archive/tar/reader_test.go
+@@ -6,6 +6,7 @@ package tar
+ 
+ import (
+ 	"bytes"
++	"compress/bzip2"
+ 	"crypto/md5"
+ 	"errors"
+ 	"fmt"
+@@ -625,9 +626,14 @@ func TestReader(t *testing.T) {
+ 			}
+ 			defer f.Close()
+ 
++			var fr io.Reader = f
++			if strings.HasSuffix(v.file, ".bz2") {
++				fr = bzip2.NewReader(fr)
++			}
++
+ 			// Capture all headers and checksums.
+ 			var (
+-				tr      = NewReader(f)
++				tr      = NewReader(fr)
+ 				hdrs    []*Header
+ 				chksums []string
+ 				rdbuf   = make([]byte, 8)
+diff --git a/src/archive/tar/writer.go b/src/archive/tar/writer.go
+index e80498d..893eac0 100644
+--- a/src/archive/tar/writer.go
++++ b/src/archive/tar/writer.go
+@@ -199,6 +199,9 @@ func (tw *Writer) writePAXHeader(hdr *Header, paxHdrs map[string]string) error {
+ 			flag = TypeXHeader
+ 		}
+ 		data := buf.String()
++		if len(data) > maxSpecialFileSize {
++			return ErrFieldTooLong
++		}
+ 		if err := tw.writeRawFile(name, data, flag, FormatPAX); err != nil || isGlobal {
+ 			return err // Global headers return here
+ 		}
+diff --git a/src/archive/tar/writer_test.go b/src/archive/tar/writer_test.go
+index a00f02d..4e709e5 100644
+--- a/src/archive/tar/writer_test.go
++++ b/src/archive/tar/writer_test.go
+@@ -1006,6 +1006,33 @@ func TestIssue12594(t *testing.T) {
+ 	}
+ }
+ 
++func TestWriteLongHeader(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		h    *Header
++	}{{
++		name: "name too long",
++		h:    &Header{Name: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "linkname too long",
++		h:    &Header{Linkname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "uname too long",
++		h:    &Header{Uname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "gname too long",
++		h:    &Header{Gname: strings.Repeat("a", maxSpecialFileSize)},
++	}, {
++		name: "PAX header too long",
++		h:    &Header{PAXRecords: map[string]string{"GOLANG.x": strings.Repeat("a", maxSpecialFileSize)}},
++	}} {
++		w := NewWriter(io.Discard)
++		if err := w.WriteHeader(test.h); err != ErrFieldTooLong {
++			t.Errorf("%v: w.WriteHeader() = %v, want ErrFieldTooLong", test.name, err)
++		}
++	}
++}
++
+ // testNonEmptyWriter wraps an io.Writer and ensures that
+ // Write is never called with an empty buffer.
+ type testNonEmptyWriter struct{ io.Writer }
diff --git a/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
new file mode 100644
index 0000000000..6c2e8804b3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/0002-os-net-http-avoid-escapes-from-os.DirFS-and-http.Dir.patch
@@ -0,0 +1,514 @@
+From f8896a97a0630b0f2f8c488310147f7f20b3ec7d Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 10 Nov 2022 12:16:27 -0800
+Subject: [PATCH] os, net/http: avoid escapes from os.DirFS and http.Dir on
+ Windows
+
+Do not permit access to Windows reserved device names (NUL, COM1, etc.)
+via os.DirFS and http.Dir filesystems.
+
+Avoid escapes from os.DirFS(`\`) on Windows. DirFS would join the
+the root to the relative path with a path separator, making
+os.DirFS(`\`).Open(`/foo/bar`) open the path `\\foo\bar`, which is
+a UNC name. Not only does this not open the intended file, but permits
+reference to any file on the system rather than only files on the
+current drive.
+
+Make os.DirFS("") invalid, with all file access failing. Previously,
+a root of "" was interpreted as "/", which is surprising and probably
+unintentional.
+
+Fixes CVE-2022-41720.
+Fixes #56694.
+
+Change-Id: I275b5fa391e6ad7404309ea98ccc97405942e0f0
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1663832
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/455360
+Reviewed-by: Michael Pratt <mpratt@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Jenny Rakoczy <jenny@golang.org>
+
+CVE: CVE-2022-41720
+Upstream-Status: Backport [7013a4f5f816af62033ad63dd06b77c30d7a62a7]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/go/build/deps_test.go                 |  1 +
+ src/internal/safefilepath/path.go         | 21 +++++
+ src/internal/safefilepath/path_other.go   | 23 ++++++
+ src/internal/safefilepath/path_test.go    | 88 +++++++++++++++++++++
+ src/internal/safefilepath/path_windows.go | 95 +++++++++++++++++++++++
+ src/net/http/fs.go                        |  8 +-
+ src/net/http/fs_test.go                   | 28 +++++++
+ src/os/file.go                            | 36 +++++++--
+ src/os/os_test.go                         | 38 +++++++++
+ 9 files changed, 328 insertions(+), 10 deletions(-)
+ create mode 100644 src/internal/safefilepath/path.go
+ create mode 100644 src/internal/safefilepath/path_other.go
+ create mode 100644 src/internal/safefilepath/path_test.go
+ create mode 100644 src/internal/safefilepath/path_windows.go
+
+diff --git a/src/go/build/deps_test.go b/src/go/build/deps_test.go
+index 45e2f25..dc3bb8c 100644
+--- a/src/go/build/deps_test.go
++++ b/src/go/build/deps_test.go
+@@ -165,6 +165,7 @@ var depsRules = `
+ 	io/fs
+ 	< internal/testlog
+ 	< internal/poll
++	< internal/safefilepath
+ 	< os
+ 	< os/signal;
+ 
+diff --git a/src/internal/safefilepath/path.go b/src/internal/safefilepath/path.go
+new file mode 100644
+index 0000000..0f0a270
+--- /dev/null
++++ b/src/internal/safefilepath/path.go
+@@ -0,0 +1,21 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++// Package safefilepath manipulates operating-system file paths.
++package safefilepath
++
++import (
++	"errors"
++)
++
++var errInvalidPath = errors.New("invalid path")
++
++// FromFS converts a slash-separated path into an operating-system path.
++//
++// FromFS returns an error if the path cannot be represented by the operating
++// system. For example, paths containing '\' and ':' characters are rejected
++// on Windows.
++func FromFS(path string) (string, error) {
++	return fromFS(path)
++}
+diff --git a/src/internal/safefilepath/path_other.go b/src/internal/safefilepath/path_other.go
+new file mode 100644
+index 0000000..f93da18
+--- /dev/null
++++ b/src/internal/safefilepath/path_other.go
+@@ -0,0 +1,23 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++//go:build !windows
++
++package safefilepath
++
++import "runtime"
++
++func fromFS(path string) (string, error) {
++	if runtime.GOOS == "plan9" {
++		if len(path) > 0 && path[0] == '#' {
++			return path, errInvalidPath
++		}
++	}
++	for i := range path {
++		if path[i] == 0 {
++			return "", errInvalidPath
++		}
++	}
++	return path, nil
++}
+diff --git a/src/internal/safefilepath/path_test.go b/src/internal/safefilepath/path_test.go
+new file mode 100644
+index 0000000..dc662c1
+--- /dev/null
++++ b/src/internal/safefilepath/path_test.go
+@@ -0,0 +1,88 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath_test
++
++import (
++	"internal/safefilepath"
++	"os"
++	"path/filepath"
++	"runtime"
++	"testing"
++)
++
++type PathTest struct {
++	path, result string
++}
++
++const invalid = ""
++
++var fspathtests = []PathTest{
++	{".", "."},
++	{"/a/b/c", "/a/b/c"},
++	{"a\x00b", invalid},
++}
++
++var winreservedpathtests = []PathTest{
++	{`a\b`, `a\b`},
++	{`a:b`, `a:b`},
++	{`a/b:c`, `a/b:c`},
++	{`NUL`, `NUL`},
++	{`./com1`, `./com1`},
++	{`a/nul/b`, `a/nul/b`},
++}
++
++// Whether a reserved name with an extension is reserved or not varies by
++// Windows version.
++var winreservedextpathtests = []PathTest{
++	{"nul.txt", "nul.txt"},
++	{"a/nul.txt/b", "a/nul.txt/b"},
++}
++
++var plan9reservedpathtests = []PathTest{
++	{`#c`, `#c`},
++}
++
++func TestFromFS(t *testing.T) {
++	switch runtime.GOOS {
++	case "windows":
++		if canWriteFile(t, "NUL") {
++			t.Errorf("can unexpectedly write a file named NUL on Windows")
++		}
++		if canWriteFile(t, "nul.txt") {
++			fspathtests = append(fspathtests, winreservedextpathtests...)
++		} else {
++			winreservedpathtests = append(winreservedpathtests, winreservedextpathtests...)
++		}
++		for i := range winreservedpathtests {
++			winreservedpathtests[i].result = invalid
++		}
++		for i := range fspathtests {
++			fspathtests[i].result = filepath.FromSlash(fspathtests[i].result)
++		}
++	case "plan9":
++		for i := range plan9reservedpathtests {
++			plan9reservedpathtests[i].result = invalid
++		}
++	}
++	tests := fspathtests
++	tests = append(tests, winreservedpathtests...)
++	tests = append(tests, plan9reservedpathtests...)
++	for _, test := range tests {
++		got, err := safefilepath.FromFS(test.path)
++		if (got == "") != (err != nil) {
++			t.Errorf(`FromFS(%q) = %q, %v; want "" only if err != nil`, test.path, got, err)
++		}
++		if got != test.result {
++			t.Errorf("FromFS(%q) = %q, %v; want %q", test.path, got, err, test.result)
++		}
++	}
++}
++
++func canWriteFile(t *testing.T, name string) bool {
++	path := filepath.Join(t.TempDir(), name)
++	os.WriteFile(path, []byte("ok"), 0666)
++	b, _ := os.ReadFile(path)
++	return string(b) == "ok"
++}
+diff --git a/src/internal/safefilepath/path_windows.go b/src/internal/safefilepath/path_windows.go
+new file mode 100644
+index 0000000..909c150
+--- /dev/null
++++ b/src/internal/safefilepath/path_windows.go
+@@ -0,0 +1,95 @@
++// Copyright 2022 The Go Authors. All rights reserved.
++// Use of this source code is governed by a BSD-style
++// license that can be found in the LICENSE file.
++
++package safefilepath
++
++import (
++	"syscall"
++	"unicode/utf8"
++)
++
++func fromFS(path string) (string, error) {
++	if !utf8.ValidString(path) {
++		return "", errInvalidPath
++	}
++	for len(path) > 1 && path[0] == '/' && path[1] == '/' {
++		path = path[1:]
++	}
++	containsSlash := false
++	for p := path; p != ""; {
++		// Find the next path element.
++		i := 0
++		dot := -1
++		for i < len(p) && p[i] != '/' {
++			switch p[i] {
++			case 0, '\\', ':':
++				return "", errInvalidPath
++			case '.':
++				if dot < 0 {
++					dot = i
++				}
++			}
++			i++
++		}
++		part := p[:i]
++		if i < len(p) {
++			containsSlash = true
++			p = p[i+1:]
++		} else {
++			p = ""
++		}
++		// Trim the extension and look for a reserved name.
++		base := part
++		if dot >= 0 {
++			base = part[:dot]
++		}
++		if isReservedName(base) {
++			if dot < 0 {
++				return "", errInvalidPath
++			}
++			// The path element is a reserved name with an extension.
++			// Some Windows versions consider this a reserved name,
++			// while others do not. Use FullPath to see if the name is
++			// reserved.
++			if p, _ := syscall.FullPath(part); len(p) >= 4 && p[:4] == `\\.\` {
++				return "", errInvalidPath
++			}
++		}
++	}
++	if containsSlash {
++		// We can't depend on strings, so substitute \ for / manually.
++		buf := []byte(path)
++		for i, b := range buf {
++			if b == '/' {
++				buf[i] = '\\'
++			}
++		}
++		path = string(buf)
++	}
++	return path, nil
++}
++
++// isReservedName reports if name is a Windows reserved device name.
++// It does not detect names with an extension, which are also reserved on some Windows versions.
++//
++// For details, search for PRN in
++// https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-file.
++func isReservedName(name string) bool {
++	if 3 <= len(name) && len(name) <= 4 {
++		switch string([]byte{toUpper(name[0]), toUpper(name[1]), toUpper(name[2])}) {
++		case "CON", "PRN", "AUX", "NUL":
++			return len(name) == 3
++		case "COM", "LPT":
++			return len(name) == 4 && '1' <= name[3] && name[3] <= '9'
++		}
++	}
++	return false
++}
++
++func toUpper(c byte) byte {
++	if 'a' <= c && c <= 'z' {
++		return c - ('a' - 'A')
++	}
++	return c
++}
+diff --git a/src/net/http/fs.go b/src/net/http/fs.go
+index 57e731e..43ee4b5 100644
+--- a/src/net/http/fs.go
++++ b/src/net/http/fs.go
+@@ -9,6 +9,7 @@ package http
+ import (
+ 	"errors"
+ 	"fmt"
++	"internal/safefilepath"
+ 	"io"
+ 	"io/fs"
+ 	"mime"
+@@ -69,14 +70,15 @@ func mapDirOpenError(originalErr error, name string) error {
+ // Open implements FileSystem using os.Open, opening files for reading rooted
+ // and relative to the directory d.
+ func (d Dir) Open(name string) (File, error) {
+-	if filepath.Separator != '/' && strings.ContainsRune(name, filepath.Separator) {
+-		return nil, errors.New("http: invalid character in file path")
++	path, err := safefilepath.FromFS(path.Clean("/" + name))
++	if err != nil {
++		return nil, errors.New("http: invalid or unsafe file path")
+ 	}
+ 	dir := string(d)
+ 	if dir == "" {
+ 		dir = "."
+ 	}
+-	fullName := filepath.Join(dir, filepath.FromSlash(path.Clean("/"+name)))
++	fullName := filepath.Join(dir, path)
+ 	f, err := os.Open(fullName)
+ 	if err != nil {
+ 		return nil, mapDirOpenError(err, fullName)
+diff --git a/src/net/http/fs_test.go b/src/net/http/fs_test.go
+index b42ade1..941448a 100644
+--- a/src/net/http/fs_test.go
++++ b/src/net/http/fs_test.go
+@@ -648,6 +648,34 @@ func TestFileServerZeroByte(t *testing.T) {
+ 	}
+ }
+ 
++func TestFileServerNamesEscape(t *testing.T) {
++	t.Run("h1", func(t *testing.T) {
++		testFileServerNamesEscape(t, h1Mode)
++	})
++	t.Run("h2", func(t *testing.T) {
++		testFileServerNamesEscape(t, h2Mode)
++	})
++}
++func testFileServerNamesEscape(t *testing.T, h2 bool) {
++	defer afterTest(t)
++	ts := newClientServerTest(t, h2, FileServer(Dir("testdata"))).ts
++	defer ts.Close()
++	for _, path := range []string{
++		"/../testdata/file",
++		"/NUL", // don't read from device files on Windows
++	} {
++		res, err := ts.Client().Get(ts.URL + path)
++		if err != nil {
++			t.Fatal(err)
++		}
++		res.Body.Close()
++		if res.StatusCode < 400 || res.StatusCode > 599 {
++			t.Errorf("Get(%q): got status %v, want 4xx or 5xx", path, res.StatusCode)
++		}
++
++	}
++}
++
+ type fakeFileInfo struct {
+ 	dir      bool
+ 	basename string
+diff --git a/src/os/file.go b/src/os/file.go
+index e717f17..cb87158 100644
+--- a/src/os/file.go
++++ b/src/os/file.go
+@@ -37,12 +37,12 @@
+ // Note: The maximum number of concurrent operations on a File may be limited by
+ // the OS or the system. The number should be high, but exceeding it may degrade
+ // performance or cause other issues.
+-//
+ package os
+ 
+ import (
+ 	"errors"
+ 	"internal/poll"
++	"internal/safefilepath"
+ 	"internal/testlog"
+ 	"internal/unsafeheader"
+ 	"io"
+@@ -623,6 +623,8 @@ func isWindowsNulName(name string) bool {
+ // the /prefix tree, then using DirFS does not stop the access any more than using
+ // os.Open does. DirFS is therefore not a general substitute for a chroot-style security
+ // mechanism when the directory tree contains arbitrary content.
++//
++// The directory dir must not be "".
+ func DirFS(dir string) fs.FS {
+ 	return dirFS(dir)
+ }
+@@ -641,10 +643,11 @@ func containsAny(s, chars string) bool {
+ type dirFS string
+ 
+ func (dir dirFS) Open(name string) (fs.File, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS == "windows" && containsAny(name, `\:`) {
+-		return nil, &PathError{Op: "open", Path: name, Err: ErrInvalid}
++	fullname, err := dir.join(name)
++	if err != nil {
++		return nil, &PathError{Op: "stat", Path: name, Err: err}
+ 	}
+-	f, err := Open(string(dir) + "/" + name)
++	f, err := Open(fullname)
+ 	if err != nil {
+ 		return nil, err // nil fs.File
+ 	}
+@@ -652,16 +655,35 @@ func (dir dirFS) Open(name string) (fs.File, error) {
+ }
+ 
+ func (dir dirFS) Stat(name string) (fs.FileInfo, error) {
+-	if !fs.ValidPath(name) || runtime.GOOS == "windows" && containsAny(name, `\:`) {
+-		return nil, &PathError{Op: "stat", Path: name, Err: ErrInvalid}
++	fullname, err := dir.join(name)
++	if err != nil {
++		return nil, &PathError{Op: "stat", Path: name, Err: err}
+ 	}
+-	f, err := Stat(string(dir) + "/" + name)
++	f, err := Stat(fullname)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+ 	return f, nil
+ }
+ 
++// join returns the path for name in dir.
++func (dir dirFS) join(name string) (string, error) {
++	if dir == "" {
++		return "", errors.New("os: DirFS with empty root")
++	}
++	if !fs.ValidPath(name) {
++		return "", ErrInvalid
++	}
++	name, err := safefilepath.FromFS(name)
++	if err != nil {
++		return "", ErrInvalid
++	}
++	if IsPathSeparator(dir[len(dir)-1]) {
++		return string(dir) + name, nil
++	}
++	return string(dir) + string(PathSeparator) + name, nil
++}
++
+ // ReadFile reads the named file and returns the contents.
+ // A successful call returns err == nil, not err == EOF.
+ // Because ReadFile reads the whole file, it does not treat an EOF from Read
+diff --git a/src/os/os_test.go b/src/os/os_test.go
+index 506f1fb..be269bb 100644
+--- a/src/os/os_test.go
++++ b/src/os/os_test.go
+@@ -2702,6 +2702,44 @@ func TestDirFS(t *testing.T) {
+ 	if err == nil {
+ 		t.Fatalf(`Open testdata\dirfs succeeded`)
+ 	}
++
++	// Test that Open does not open Windows device files.
++	_, err = d.Open(`NUL`)
++	if err == nil {
++		t.Errorf(`Open NUL succeeded`)
++	}
++}
++
++func TestDirFSRootDir(t *testing.T) {
++	cwd, err := os.Getwd()
++	if err != nil {
++		t.Fatal(err)
++	}
++	cwd = cwd[len(filepath.VolumeName(cwd)):] // trim volume prefix (C:) on Windows
++	cwd = filepath.ToSlash(cwd)               // convert \ to /
++	cwd = strings.TrimPrefix(cwd, "/")        // trim leading /
++
++	// Test that Open can open a path starting at /.
++	d := DirFS("/")
++	f, err := d.Open(cwd + "/testdata/dirfs/a")
++	if err != nil {
++		t.Fatal(err)
++	}
++	f.Close()
++}
++
++func TestDirFSEmptyDir(t *testing.T) {
++	d := DirFS("")
++	cwd, _ := os.Getwd()
++	for _, path := range []string{
++		"testdata/dirfs/a",                          // not DirFS(".")
++		filepath.ToSlash(cwd) + "/testdata/dirfs/a", // not DirFS("/")
++	} {
++		_, err := d.Open(path)
++		if err == nil {
++			t.Fatalf(`DirFS("").Open(%q) succeeded`, path)
++		}
++	}
+ }
+ 
+ func TestDirFSPathsValid(t *testing.T) {
-- 
2.40.0


