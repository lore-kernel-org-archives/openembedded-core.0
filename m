Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A34C2C433EF
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 18:42:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.881.1648752170909336394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 11:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PI3kU7eV;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=10890727eb=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22VGpZNA023733
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=AGpr9Vc+orRgugmUxvFbJUavmfknUErj0nwDSS/hEYs=;
 b=PI3kU7eV2Tv7DN1GR7LcUOtnL0Y26W4bRctWeHtCTpV9RcxM1QFNb9o0M706sZV5AbOS
 yC9j0C6icsVM0sYMvYDRbNG87jFsvmKKMnGxsLQblZnR9sbesHP58JbnMtuG6q+JNojX
 SgCvYCqyP3fJdMb8GZQKsQh96+GOAW/uAOA5vYdGWSoj1EreJzmzetzJjbPFHMHbWTCW
 eOM3GuDmRC25j0a8qkfGb5BVfZ9ofhAYLrK1Xde41j5r+Psev46loXkBViCCh+KI9CTh
 ORRX62ZKNJ6qih44+8jWP+yZlmVpqHjHAib2SRp2/FYSlWmBKNKHPV3YJJWXhc39H6lO 2w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f1r214xfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 18:42:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THjwTOzCv/4gAjHzEpgE+gLUoa01sclm7zbg60ngMsMbhJtoP3nngfOhEHlQak4yptOE1I0sGpuDQYirO8TaenzkvxuU3XAk8PgTy1baMravW16R4/eVC1g+sJF8OuepM1lF/LD1I1u08xgivPgPQscqdqJG6Xhw3drUu24UOBo80o3tT7WwgiMeAjFcyZLeSb3YrSl3oT/ehTB1zTj5ytSYtCM5/pNh+CBCPwtyleuQeMIhQ6dvjFLtvmK0OEiV+lA3ewSR6QrKVS/B/J2Qc7ChG5gNOPUoBnVHqp+M9JnA4YT0ajjYPHFlcYvEAhPS5C4yH7nvpu1DT0ywyWblbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGpr9Vc+orRgugmUxvFbJUavmfknUErj0nwDSS/hEYs=;
 b=blLRWhkszW68gi2+KS4djQSVF0I9RMBOiVSi1R1z4/UM+paVrQJUg5gGNRScfVvI+uoF4GGbxrUcL2UPxw3vwreig+cR2KROGZ4WHRuH2wGhkcanAaiMy82G5H+MRVAAl9aysF7W254jWP6vrQS6PHPpiV6SFI3ztsCfMXSP+EjgVJuxtbFz74yLuYJV2RliYme/RiXLCNcXMfzuiTdUukD3L0vp6o+X0thXTBypg+HFExXDyJCPW8QAzOe/AUMya7dgrVDPb2JqrxEUfbp+dKQkV30fB2TsbHc7piKtwN1PopwiIHe+Agv6DSvhgvbvBnCeHTJj52dYZyjpYRZ1rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BL0PR11MB3506.namprd11.prod.outlook.com (2603:10b6:208:31::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 18:42:46 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::389d:5330:bc19:13c4%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 18:42:46 +0000
From: Joe Slater <joe.slater@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: joe.slater@windriver.com, randy.macleod@windriver.com
Subject: [oe-core][PATCH 1/1] unzip: fix CVE-2021-4217
Date: Thu, 31 Mar 2022 11:42:30 -0700
Message-Id: <20220331184230.27859-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To BY5PR11MB3992.namprd11.prod.outlook.com
 (2603:10b6:a03:188::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5231cc02-aed8-4dfa-c375-08da13463f99
X-MS-TrafficTypeDiagnostic: BL0PR11MB3506:EE_
X-Microsoft-Antispam-PRVS: 
	<BL0PR11MB35065603CCB25ABA2A3C4FE888E19@BL0PR11MB3506.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZIgVvl6lE3/+36SuLnJPiNpCwoWlXEvq59KAtgH75rgdOCTfDOFXY4vCOe0TdPm72bFN1rpESddHLgKGDhjXja2u/pEPX9zRZ50i0bPbZvdkXdze9sWIt7+1HRqCPkdm6ArQiIyXgFTntTTubt6z574c+A0exv/jYlbAE+3ljXa0yo3Lr6WsC9+tDzf5vPFl2dPK7CYJM/MUOJTerc8Jb9m+SxisFwIkdyEC3aVztIi8VWdd101Z8F+Boigp+9uxit8RQ7O5ho0zYIDkf319mhy/iM/LLoY/GWUkPSFERIvxaj3+7SQg0Na/sewGKkxt560sSfjUjCoMY3OcT+wmzt2BdoZmxmYIBLCcnZi6+5Ua4/BHrNxtr37q50MHFX2FdeIYjAwUx11MBTaDCMBHTym04LRMG9TAvkBAR1QmCVYJcpR4lUtK6U++tLIuC8sBwmoYv9fYGDFsyL4i4Tvb/Q7+36K9JSiutAfdYmTxfOTKvQPXxkLz83u7CKQc1+1iFQmQecKnd5sShIFQvfzqwl+jMkiesr1vDgdRKOascZP+FSpyT3QU2/eF5Q+T0OCwe5BZDK+Ub9mVtuNk0xXmf51EJYqfJj8abTYqs4CcGU88IbzR0slk88B+NPol+J1gT+Ad1XFPh8p1DCkH+6M60XQOt0/dAmqt8HlKvAhs40wDyf96qsL6jt9ELbGCATfE0seRRMwccbSw+xT2CInyuQeVg1kwe52RgKokC1cG0YovzINtZqnbNfgcNmK9VRG8r4xCfFlU7LZtfH/4Ih6G9w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(6916009)(26005)(2906002)(86362001)(38350700002)(107886003)(6506007)(2616005)(52116002)(1076003)(508600001)(6486002)(186003)(6666004)(6512007)(36756003)(4326008)(8936002)(8676002)(5660300002)(66476007)(66946007)(66556008)(83380400001)(44832011)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dLjz+jd1tAG1kJT7KDcWXS4nTTcSfcYlz0gK0alNpL3YkwKClZm7kHq1DaLq?=
 =?us-ascii?Q?mO+BXIy7Lacsm03/0jn7x7EavsaaigXc6qKSCv06O4jj3MrY2o5LS1FcScSO?=
 =?us-ascii?Q?n2XIOtuwCCcdp7tOxZAlyvq1R6SgpDeeOcaErzCeUOVTBNp1EzZQW5C/jEJs?=
 =?us-ascii?Q?Mi0aQylhbGBGBPNJfqWkL170aMoOMcg17XG3nE/tUgON4EjH4vgbpo/vaMe1?=
 =?us-ascii?Q?9E2LO/ihNO3Ofb9A2Jz5IuumxWEYpCDXwI5LzhCSQ0OM+DgqYrTgPFq423y+?=
 =?us-ascii?Q?PfPdKsFduEupFMVClUNbts3Cn2jb6PYtz4iz8462nbigVspQfAb8KXZn5JWS?=
 =?us-ascii?Q?uxAhZtaR5rSM6y5h7xER38/4Pne4heIWR4EXC0ARP9zY4cXnXFaOCu2uQZxg?=
 =?us-ascii?Q?H0avuzcVYMlfVh1vDXe9tNsHp8dv5b0i+ieOJ3KeGcFg+j3uhx+gyyo6u+lH?=
 =?us-ascii?Q?+T3/tKSXNJJ1/FR83gt4kFli4qmn4KbHbELxu5IJBxLgDo4k++Ytle/oeaI9?=
 =?us-ascii?Q?NY02lp2aAJfxgy8lzwUs/LszHYmvtBcr9ceXbV3UPdlca9W/JSsgdLWySzQ+?=
 =?us-ascii?Q?dXOGLgFwMw6yEUp7ylBP6k1WvXwdmy+xQZYVfY1X6RndqcrUBlDa8hWOea4w?=
 =?us-ascii?Q?L+DGFnOYsUBVXZhICMIFFvDvX8ERuxjaTn8bjuMggSG1AXnVvip8uLAn/4nm?=
 =?us-ascii?Q?c5L2mXiQ4h+IbAPwAgFQyfaTCbSou2BQ5qhza/f3haupsJ2dJXmo4RkgV54M?=
 =?us-ascii?Q?fhMn+BjY0wQMBHaMpcW7RmEO8sbMvygf0zVtclVkmMgXAkH0tKdOmDGMjCUp?=
 =?us-ascii?Q?PwstehOyUGlfYbhEPCwv/nuw0T7emhxXzzCMSjr+84BjX5TftsVFMmqwlIFq?=
 =?us-ascii?Q?r0a51dty6F1CUcWadefxWsXbXtpbzWl3bCf7lW7wDatAnr6/SGmmko2SAyHU?=
 =?us-ascii?Q?yP67xhe29cSQpfTKhnnpn/xUZaqoRVTSMxu3L12Hd5S1jLlECDJZoKVDQaGO?=
 =?us-ascii?Q?JMb2ybYNEHdYB6DhryK7/KaxENMH8HZS+w/jjGb/lzT4AyS7+zs5MASu/0jm?=
 =?us-ascii?Q?wXwhctgO3sr71DRkp3YHtgl42G+TR/AewfpBUfg3g4bmLkv3wT8Vgebvzu2B?=
 =?us-ascii?Q?YsWPrgpMcySNN6kMnwLWY9srFIhRd2DCLemip3rMyPCtFMal+Wi/arJ0lFAN?=
 =?us-ascii?Q?iXxYDgXx9J4za1lPGa6VE4/UlV5x9BZ4DEE5DcLOYiCicNcwmkpm2GW/wIuY?=
 =?us-ascii?Q?EL1VaaJ0gxbCB2DNa2udxxtRGczbSE+MUyXZXj2W9H2KFj47SdxVwIzFKjuZ?=
 =?us-ascii?Q?A8EbQdEPl26Q+EjjYo7FFGpJ7o0DKDmmyC6Soebmy59jGEcBheCxg1FSOGp6?=
 =?us-ascii?Q?eMCnSbMYDbRLphX811+wxkx0ZsivWElC+UhCnpw126Xjs6GspQ9D0KWrBjHv?=
 =?us-ascii?Q?aT+AZI2/EXYcJKJVm2Bcta3MEf+TGcJHucymsjMHul5wxghBMa5AkjygoOiD?=
 =?us-ascii?Q?U8FELeRkr/AUvFr/iuXCsGZzCtO19G90KMd5q9U/6sRr9mV0fYvvYvAyxE2W?=
 =?us-ascii?Q?uHbnaGwfknNn84hLf9oIr5dHzOlFFydsW0vY1lghMgKX39qmxp/QGCNH2G5H?=
 =?us-ascii?Q?BEiLdCrPCC4WlAz0Pb/PziP1LMuBW5daEXeWyc9hSWHPvZEGbQ8OWh/8P1C8?=
 =?us-ascii?Q?SJOT3P7gc62McDw4c7F+ZUbcGnhi0PwNH/3LH2ZM9Gp48fkr+lt7n2tphh5f?=
 =?us-ascii?Q?QrvRjVzCY1wS/MfjNQFkqZdmVC3/MJU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5231cc02-aed8-4dfa-c375-08da13463f99
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 18:42:46.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Oml9K985Fv7T1wRuMwLGJw719xXnp5+IKn4tV6D0EJs0x9UBP7BGeNn5rIBvJGkVKHhttYonzGNaMjhguMYikQISGeV4MDqpThuBicHe6TI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3506
X-Proofpoint-ORIG-GUID: FF1dKm_7xxesFUrpXHsF5qijEf5vr9Lx
X-Proofpoint-GUID: FF1dKm_7xxesFUrpXHsF5qijEf5vr9Lx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_06,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=654 mlxscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 18:42:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163865

Avoid a null pointer dereference.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../unzip/unzip/CVE-2021-4217.patch           | 65 +++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch

diff --git a/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
new file mode 100644
index 0000000000..7262d14df4
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
@@ -0,0 +1,65 @@
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
+https://launchpadlibrarian.net/580782282/0001-Fix-null-pointer-dereference-and-use-of-uninitialized-data.patch
+Regenerated to apply without offsets.
+
+CVE: CVE-2021-4217
+
+Upstream-Status: Inappropriate [not author]
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
index af94a39195..c222a684b4 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
 	file://CVE-2019-13232_p3.patch \
 	file://unzip_optimization.patch \
         file://0001-configure-Pass-LDFLAGS-to-tests-doing-link-step.patch \
+        file://CVE-2021-4217.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.35.1


