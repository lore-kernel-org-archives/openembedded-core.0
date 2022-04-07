Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71485C4707A
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.596.1649348637824488164
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 09:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=GxlFnykn;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1096a7935c=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 237ENnfA021561
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Apr 2022 16:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Yck7xP1l7lsuYd5AtjUl5PPyHlYMYPW1PUnlgKA5U3Y=;
 b=GxlFnyknVJpZjrvsOQW05QXOzRApO2E5K/EnOrYnnV1/QArfUDphBl5iI+mOjSjsd9Om
 TNrmskBiRZymVvMC7iyNqrX7h3rsCfZf1zoWimvh2ezqq8dZHbRg4HOefbyoYjM/tRck
 zdn9etEEMR8dHWCd/h/41OJXwMGVhtSWjvkbS1u2lVp52+ZvLK3/afcWtffwKuQd/jhd
 tt81K+Qt5XhPPcUy2JEueyGWlARCwoF2KW2rhWSlabNUcnoDM+V8CoKj0lktMvGEnUEJ
 95cat1ipNeVz+ZBNN1PIQkXbjnzzzF7brbpbgfcV5bD4hFVT9WFWRhJzcgxaPcxvbYj3 Iw==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6df8ve9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 16:23:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cS7GskcewIIFOLK22joIdJjJAluRvAJcSBtFTrSStEEzpWlzyNFbz0bNVaFZ/ftAONBNzL7hLwcMyJzKuGp/r5KJ2FFhLwZ3QE84TTRySMttLKXBrhOwrcc0uSSaH869F8D5DrvIBV7eZVifBoBy0ZKYelxKO62X6pBWVTcHKuhyHPXw4KrdBiJ/tSeV0hurXPesCKgPDQQdH/yJuNHoPFQUo8k3iqybyl7VK+waYw04ApY9p7mztliZXi4eMPXjZv5U/uewfBQqfPgE6uBLyPplmHJTl+7o9ASD1AVALkpFgtoCT+jOQ8CxEiCdvbRQtCxI6N0dGJLoXlw48X220w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yck7xP1l7lsuYd5AtjUl5PPyHlYMYPW1PUnlgKA5U3Y=;
 b=WiEzMJ7qwWqj+O7vOgPMfmIsRmviWCPhMuVoY7AUwHvu78oPCK/v9J03dIiZw6/cxjlRTIf5Q1Tkhqa09XCJ+vlPndVNCp6g5ZCwyCJ9goBEvQJ+iwjCeY4Ta8QCmzUqZZF5Q1aAIgVIMbUN4J3ClS91YTYzMx96TTOTgz3UvyxrXt/BDf/e2cRcuuY3AydZeYPhrayDYcPA10YsDIHI4tSj/7FwMA7a+7IoycQ9l73NRZOjv4gIXTFK9pycUzQq7Mkf60k9v23pPOCgsdGxNx/zDk0yoPn1ruA1JhQlYaVTIJCYaT96kMlbzYm9X92Y8+T3/TIr1cTJqhNTmZGpdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2597.namprd11.prod.outlook.com (2603:10b6:a02:c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 16:23:53 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c806:62e2:4539:626b]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::c806:62e2:4539:626b%7]) with mapi id 15.20.5144.021; Thu, 7 Apr 2022
 16:23:53 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][hardknott][PATCH 1/1] unzip: fix CVE-2021-4217
Date: Thu,  7 Apr 2022 09:23:37 -0700
Message-Id: <20220407162337.29763-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::28) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4706973a-68a4-437b-383e-08da18b30167
X-MS-TrafficTypeDiagnostic: BYAPR11MB2597:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2597041638B57863F497727D88E69@BYAPR11MB2597.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IrqD50586jREmB9LLO8aIN1fejG3SYotF5Lrb7T+wT+LErByiX7tHtH/izI6yH5h1y5mA4gVEew5tgHzxMpDmX52IIf7lWA+DLi3xjkzghSPs7o2bH5s+dS10oeHfifSHO3762XrrS4ltkeka4zsNMvgDi4BX9y75hIQ3UGHaXMzkJEDo69lSygz0HI+RDZZuuVcAwAUUnumWyqMlECqAyk0ZpATyhEU+Oe497LoKqU0hPZoxZ/N5TwlNMu39/LT2ALzXXwQgk3YDKeZObtNQb96nHBzvfZna0kvOi3TKj46kvfk80qpnKg2TQbupDy7/t4Cae1Q0ZGMG/P94GB1aDmDbsaeakyScHYj/5xxPC9Ns/ARP8TfBFDIJEWYkUbAOZumiWKx4KbrbTWtTKsy/4PuNmIzZ3lFFgBF/YBnEMPiW1zx+EPsFmr7N36+5Slp5A2CB54iJZ2DRgehEdf3Cj6gSjycstFws3roVbf4fU56y59OU+U7cgqNyPIEShBhlzdh+HcMvozIAZV82DZj3pgoxtAUpgUgK7AAsO6wO68o4JCTxshzDNePk+ZVn18LwSBOVNO7xO+1zrvNZ3ypFHFNr95Txv/PQLB3PwrF/7LKL/oTaYIDIALG0sUkEBBpa+QSYic5743e8DI3F6rNnlf4G1DMZk8V8Thngdn3edkacJ20n6DTfsAnLCVQRi0BebVdZWBgk1UGu3S7qqHP/YoPQTNfH5cQmOydkCbSxcSDjSOvMAjD+hRL87gXMZ9uBd1Pji9IQZ4dBLzs1gCE46bX69PpwtGp9WEWM2pabC7fluxqJGNt2kzH0KtP45XAkTN3YVevLEAfY9I0ES4vMA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66476007)(4326008)(8676002)(66556008)(66946007)(83380400001)(6486002)(6512007)(6666004)(6506007)(52116002)(86362001)(508600001)(5660300002)(8936002)(1076003)(186003)(2906002)(26005)(107886003)(44832011)(2616005)(36756003)(316002)(38350700002)(38100700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8eUItIEmV2Rgc/Pkl/OlRdRPRTc92XCR6pdLnGbxfZMcpzn/lHb9dw5BJqGR?=
 =?us-ascii?Q?hmo414LaoUqGc4rvJVpJ7/noONQH9YrJ1T+vMYaU4AOq+n2gH28sfhizXTsd?=
 =?us-ascii?Q?rEyLvn1mYiFzBHPrAWZ8S9Lpcpncn4pC4YazZi3T4bLVSM8qWsPfNXn2L24z?=
 =?us-ascii?Q?zCuF/Xwz7aXUIvufi7vilcoM6QlIe6XIHoS8iGmJ0FrRPy5xa/PKwbCkJNAH?=
 =?us-ascii?Q?p+juQLcGHFllJ0COfCBOqbYLzImIlsuk9B8dSJzHCJcHKWOVm+D7YqmPSy1b?=
 =?us-ascii?Q?lKSIX17hP1uqQ1ZfOIB9Y6ky/VThUN6CpsMsrd5kJ6FI8FSptZUaDLZwKpYv?=
 =?us-ascii?Q?4ANYiLmL2gOKLNKNaVZVzCee4D/e4vdD/NtJe+k1riahv7FPVkwMNN9n62A7?=
 =?us-ascii?Q?k9kRbuqQX5ePKt/Y7D7SLQVfLtcvC1ZnLTqhKao7A8mYEOYa6b+1p1lvw31b?=
 =?us-ascii?Q?q4F2V8a/zAFk4sfO+JKkWnCpYVUqzK1kV07ZEeyPxT7TVhPtByuio8Miwlj0?=
 =?us-ascii?Q?ZiYJ19wOEBKCBrhIpG2Py/8xn9dpjXHmKGWuuPOw3PKmNfbPXeFqClm4TuZV?=
 =?us-ascii?Q?wloLy4SYOLjjg7fmWuCT65vLGxuVkcZUS3neS6H3AcFtaO0GeDRGAyhbqXZh?=
 =?us-ascii?Q?XkdpSBsKgRwRgJfD32ozKI91M6x6VIsY6waphFmZz4vQboLra8QsZi20m6V+?=
 =?us-ascii?Q?PuRJxiJXalBY2O1Ov4znsKtMkcjeMOSglX0NpT9FLg2rHa6mcF26pOJxuG8i?=
 =?us-ascii?Q?FpekCw8yCB95JmKdCEaH7jVg3hLGa+1UqXqdxLaG8T51PaMFZbfnFIRfm7wi?=
 =?us-ascii?Q?pjJiae218VeQs25AMG8cOvleObDMsGUp1a2qQ9QEENQws2NJu5l557PwDM/q?=
 =?us-ascii?Q?dANIYmgbIpbqrCb7bv2QIduHhXScLd+x+zkInfkBTKZJvPkqwzvd9iPkXhtk?=
 =?us-ascii?Q?pkZeTrdWUjFG9mV8JiJQpWr+PtnlgsYk0zCt7dbWaJwHwLCedLl48efHPtUN?=
 =?us-ascii?Q?2heCwWJmjxRmAkzPhaoI1NR0Epb4JOJC55WEJAt4m15qYmltD3f4oMzv2Pgj?=
 =?us-ascii?Q?0WPVrGoDBqqH6aUr1WNBd6LsUeBlymL1/hWSU0P/boDxZQBV+VhptcdKuyGr?=
 =?us-ascii?Q?YFVAhWWlsOdVC7PTwW5+d+5PpHWkyLury8oIfGJdjVIHQfqdwJHqKZ2Ixvr/?=
 =?us-ascii?Q?AH9xaDVrS+KePr/tafRSIE0yU/1An1Cslin+N0+DBMzsCvtyA4fFH6/9O4zW?=
 =?us-ascii?Q?WEFaWJx8tlfa7byjZr0ty3cWRSDR44umktamJsXNQAcblI9nrL2PAOIno+iq?=
 =?us-ascii?Q?aD+zFokKeTiFPk64zSL7wM76Dgc9MItqMYm5NKMHLVj4y8CPuvZ5wUzcYzTJ?=
 =?us-ascii?Q?57WaHWHjNyx3ypQRyorxkBw5sJQzMGjE8f0hmDQRurMQOWqkkSVa/fw7/fYe?=
 =?us-ascii?Q?rtov5I8wuUl8JUhB31n2Uud4E9T8ZJVWJl2CqzcSF+kKUIjw9nhKeqpCHz/g?=
 =?us-ascii?Q?Ec8JNWRnkiSuCeuO4U1QBHqK5A+H9pqSCc1SbPlD1vi83rXTfvokZMfXFd71?=
 =?us-ascii?Q?klAdw1sdeSwi2Dj1fFmhg450uM6oWSzSlwMDYfdBhffS2TBEuCF+5o5fvr2t?=
 =?us-ascii?Q?B7NoU/1naIxLZQiPStODd9x8gqSX6/cXkYEHezz/70eG03v9TlZmSYhuJkjO?=
 =?us-ascii?Q?IMXkqvHz811t68LHoG471MQP9JwaFqElRBghWK8D7IpNI4j6pVr+NZe7RpJk?=
 =?us-ascii?Q?ncicx5GCH3flh7Kz1hfhIWtnFIR9Rb8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4706973a-68a4-437b-383e-08da18b30167
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 16:23:53.6694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eVgJEssl/YfN9GsHXEZ6YSsIS4Cib92+ST9Z425HAxlVqZAD/9+e9rmuDLVKkv/mgW9aTcrSBeJgAJ/ZyGcXPePJ73d4hSfPduElzp/5ZIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2597
X-Proofpoint-GUID: JC_DKBx2bztyAGM-cw6fK7U1qlxE-oSI
X-Proofpoint-ORIG-GUID: JC_DKBx2bztyAGM-cw6fK7U1qlxE-oSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-07_03,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 mlxlogscore=566 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2204070081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164114

The patch is identical to the one in commit 36db85b9b1... but
we cannot cherry-pick because of different context in the
.bb file.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../unzip/unzip/CVE-2021-4217.patch           | 67 +++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
new file mode 100644
index 0000000000..6ba2b879a3
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
@@ -0,0 +1,67 @@
+From 731d698377dbd1f5b1b90efeb8094602ed59fc40 Mon Sep 17 00:00:00 2001
+From: Nils Bars <nils.bars@t-online.de>
+Date: Mon, 17 Jan 2022 16:53:16 +0000
+Subject: [PATCH] Fix null pointer dereference and use of uninitialized data
+
+This fixes a bug that causes use of uninitialized heap data if `readbuf` fails
+to read as many bytes as indicated by the extra field length attribute.
+Furthermore, this fixes a null pointer dereference if an archive contains an
+`EF_UNIPATH` extra field but does not have a filename set.
+---
+ fileio.c  | 5 ++++-
+ process.c | 6 +++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-) 
+---
+
+Patch from:
+https://bugs.launchpad.net/ubuntu/+source/unzip/+bug/1957077
+https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+Regenerated to apply without offsets.
+
+CVE: CVE-2021-4217
+
+Upstream-Status: Pending [infozip upstream inactive]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/fileio.c b/fileio.c
+index 14460f3..1dc319e 100644
+--- a/fileio.c
++++ b/fileio.c
+@@ -2301,8 +2301,11 @@ int do_string(__G__ length, option)   /* return PK-type error code */
+             seek_zipf(__G__ G.cur_zipfile_bufstart - G.extra_bytes +
+                       (G.inptr-G.inbuf) + length);
+         } else {
+-            if (readbuf(__G__ (char *)G.extra_field, length) == 0)
++            unsigned bytes_read = readbuf(__G__ (char *)G.extra_field, length);
++            if (bytes_read == 0)
+                 return PK_EOF;
++            if (bytes_read != length)
++                return PK_ERR;
+             /* Looks like here is where extra fields are read */
+             if (getZip64Data(__G__ G.extra_field, length) != PK_COOL)
+             {
+diff --git a/process.c b/process.c
+index 5f8f6c6..de843a5 100644
+--- a/process.c
++++ b/process.c
+@@ -2058,10 +2058,14 @@ int getUnicodeData(__G__ ef_buf, ef_len)
+           G.unipath_checksum = makelong(offset + ef_buf);
+           offset += 4;
+ 
++          if (!G.filename_full) {
++            /* Check if we have a unicode extra section but no filename set */
++            return PK_ERR;
++          }
++
+           /*
+            * Compute 32-bit crc
+            */
+-
+           chksum = crc32(chksum, (uch *)(G.filename_full),
+                          strlen(G.filename_full));
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index af5530ab38..f0ee38c178 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p1.patch \
 	file://CVE-2019-13232_p2.patch \
 	file://CVE-2019-13232_p3.patch \
+	file://CVE-2021-4217.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.25.1


