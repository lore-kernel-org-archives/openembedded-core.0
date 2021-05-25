Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.49])
 by mx.groups.io with SMTP id smtpd.web12.6617.1621929591995953798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 00:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=OBmD1cZ4;
 spf=pass (domain: kpit.com, ip: 40.107.138.49, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKFLcgRKxZ3Fh1sfdMpbKU7zEAG3DeXPX/HMO1sk1Ce3QmDzYEw7Sa1WY0OMBu7P9qQRRK54Gx55CXlNTr5RJTKTfNoIefz3pkDrrH1eoigd2pkmVwj8TiM6ryQRhd/QY078BOYc/s3hsYD5nZji/lPnSd9V9m/7zpciKmoCdAKaXfrN8bS3lWZHIQizdkB1zT2fxlUvbzPAhfE2b6zsFVgmns/WPPXgNUy/AePKO3nK/IMZaJqi2w3ffMXatf5AspMswyLeqbTNY6XOmwluqii1e+oYUL/DGKbQaaJIHpCn0jLfxp1gxdhdV5sAk/P7eEVugz1kUUlNOfaZm1pQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQDBaTnByqZeUf9bN7gg5kzrYMAubHmigz8TCXyzUkI=;
 b=LLksmTn6QiKzDSZUheulQxP9XXrGDnrm5t59Iw01cjmDYvG9+0qqfONaCoXdrWta2fxnr7d9Uqf5gub+7Xe85BsNEGXNjhWUqgXTPy06DpYTFYVDiQ+Y3bUL6jnJjGUWpceop/QalvOgU9Kwcz2PY3lW7nuxtrHufFKEb6cnIQjSFKbku1rSlGEF5amBHopVkvHfy6VkHiWtw8/h29YfqrDx/kdPeVToizZpQ/x+j5vH2EBKSFWyxGi24tmMBTIbYMRewi9UHKpl4pkXKbkKt7YAM1iLJdnQaYXk+mOJNgnaJei72d5PwDvqNoOSBDP7SzH1Mbc7Ywy5JN1O5HhzmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BQDBaTnByqZeUf9bN7gg5kzrYMAubHmigz8TCXyzUkI=;
 b=OBmD1cZ4emAD+je9U08uwHqaHd8T3pn19ZX0rdv+3aLc5JhMMC7+nvYMD0oNBG1KzyKe+WU6lYsaVA4+3lElOMaOx4TmKWNz7p/njVBIeVmPKppmIQYGb7ePP72Vy6mGW6YkIxL0eEat7Eug4sZt0FoLbE7GtlCpbxKviFUbrUM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN1PR01MB0670.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Tue, 25 May
 2021 07:59:42 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 07:59:41 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com,
	"akash.hadke" <akash.hadke@kpit.com>
Subject: [meta-oe][dunfell][PATCH] opencv: Add fix for CVE-2019-5063 and CVE-2019-5064
Date: Tue, 25 May 2021 13:29:14 +0530
Message-Id: <1621929554-4038-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.110.167.10]
X-ClientProxiedBy: PN1PR0101CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c00:c::28) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from L-12026.iballbatonwifi.com (103.110.167.10) by PN1PR0101CA0042.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:c::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4173.20 via Frontend Transport; Tue, 25 May 2021 07:59:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8073d22b-9229-4091-0e74-08d91f530d2d
X-MS-TrafficTypeDiagnostic: PN1PR01MB0670:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN1PR01MB067024F6CA7E603CA8498BF68E259@PN1PR01MB0670.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DFdtF/3KRXjTnCzWcQxywvCS7OtIj+vZkjidEvjnE9RRRTkW9H8pzQeT+e0tK1kmCm1482KQoVHL4epYm5f+VYcmrNxuJQD2IyLTuMyZheZqxj8C91ERbdcGIqRfwEx7wkx1oGx2Clz7vGgdDLauTVknMNqsso2ZvsA2LX9GwuVrRAwSZ0L9HJXOVP1B/QyoAojaqrpbX6UCLtaEecF56/4J4XnGCIhUYbsDy75KUbY2xebqkpdWCRBS+Ml9ZdSfXU85dH1/wnuXyzSGDQnYX8b1Al7Gk9vCXRHNXEVo8BVMFKQjB7aVBmZws0IE/XUCA3iIpgunsKwfbL1GTM1To0uROO00GHUqpTr4UuuB7L4vtbXWAMIjljN6PZNzCa42ZtaMqXaqLmiUG82drxzpjMjVwMGc4CXXdh87YNK7yyw6eMnriSzSKyDgm0kBMGRp4XEfsKImLaPv4cPG5v/Xw51Hgzl+3medEbiFjmbEgDNJRdZNO0UREt3YXvuB0EJNMuaTYCvL7Yvs7SpMbkn4oeg1ep4r7MAR8AiI8s0LTDn5xWUY1OdEHd6u/m2gkUL6meVYuhzR7uOoyJwctrDSiB5hMxip0fIqV06zW5myy93Tpmr0Vz9BWXp4IBP4r0STU9VHq0hpMuVkAW6PG9Mrhl0e2X542X98JVDqxUfLkVLKN310UYj8bu/CGCfOez3RYCkcJBlSfKoUqRd/8zCOhZoV0IVLv+BWdwtLARbIFK/PDOr6jaTsmOod9fqK7XVIq3BeX07pGOhur8mCKsK8kA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(376002)(396003)(346002)(366004)(316002)(86362001)(66946007)(26005)(107886003)(6506007)(16526019)(66556008)(66476007)(5660300002)(2616005)(6512007)(6486002)(956004)(186003)(966005)(52116002)(38100700002)(36756003)(38350700002)(8936002)(6666004)(2906002)(83380400001)(8676002)(4326008)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OgC6G//oag+OaDqSTVgHZNkltN8TO2uwv+kVJ+pr0MCblQ91k3Nu6cS1ONhW?=
 =?us-ascii?Q?Xo0Zo+z8x/QBJRK61WSPUJ8uOD0JYfUqwuPBfS//bNPszWouYfwQyzlYcAvm?=
 =?us-ascii?Q?tsZJIaLCC/+07RtgoddnzDvW3uMDFx5a6f0wbGF8gt+wTmD34Gb/OcausicY?=
 =?us-ascii?Q?VEGxG/szcp+6iwtIYzDpoQfov7t/ApGfd+wGJq6WvA28qMR4sxx6yca/UPM4?=
 =?us-ascii?Q?AR2rWq3XuOwE8+07Ugv+Lpa/6ru05o+9dTKVrEeNBw4hA4uV+eYyjFddyeDW?=
 =?us-ascii?Q?r1toPXGIQDVsfaNIjL1D4xQlx7c2mHNa0CY5Le+dLXEytAiwka1f9nT3Kw35?=
 =?us-ascii?Q?rluHewSHOK2sL502IQ15O290mWp+DQFRBP9fS9gwXNCUEh6It3osO1iCfOvh?=
 =?us-ascii?Q?Hl/Yh3wKC8/dbzI0Lveppyhk4TTHJDQ3ynSIfzzKfxzLdl8PLbkXzJWCXMHk?=
 =?us-ascii?Q?R6HgklVrcxe8278MnzWNap2kdNpYsLLvCRZ97Kk/8bLPRM4ytWSXzp/0WOiV?=
 =?us-ascii?Q?k7T3I2vdjKoce4ie1Ik3xQ0v8y2s6J+OZYK6huVbBB+Ccd9lAaFqdxINMQU3?=
 =?us-ascii?Q?T+sFnYV3NG6erUZ3G8prhM0xsk/EDHHtU5eYsyAhRurO0kN67up/D4SP/hnv?=
 =?us-ascii?Q?zQI+prKsdIqH+Gws1kvZXIR6yrCGoUTCKJ3+oM41XziR1xJcIx3dmOnnFH5I?=
 =?us-ascii?Q?Ka35zZqA0dHZpd5Miu43RwFLpHCFF9yIvzTFU93C/Us5VGSj5U33wDgjDZtv?=
 =?us-ascii?Q?ntD+RKl9uTARfU+jONmcQJsW01uJbx8svk0azVZ5QNL1XXdkB3QkuVHjgGlL?=
 =?us-ascii?Q?DAY9FFo87ThtM4xbtZQVoO8GRNVseqgEOM/sNfR6JApKznSwcpY7eYJAzRuO?=
 =?us-ascii?Q?Xoba0JVUBE2igqL3XEjSVd1DTCjqmSxQo9jpv63wZ/JMpoiLv5KGu9ybSbvA?=
 =?us-ascii?Q?HPEAnRkMTky/h5d0PBjjja5CdF+ec8XYaVjjKQaZMCENh3PEEhkcx/6kWGPo?=
 =?us-ascii?Q?faQ9gGvNLLq3bmYppBS6snVDrX33hBQ9fINMbRB2Vjr5+jRlmUJBuDGvRN/a?=
 =?us-ascii?Q?Mr/dPVAtVluxkPXmXhDkCWo+M9OeSapHWuw0OehDQwEMRzRvzu+wlfYb8hae?=
 =?us-ascii?Q?dAd6+hyHpclRj16u5rfE1CIUSIO5lxMsSvAphXIsAWIjl/2reiAKekjcGA5u?=
 =?us-ascii?Q?bnOnfqz4o1jh/Fnj8a1WL/xBSp5lOd2IIc6NRxyEbGN/c0tmAvN1B/FObSVJ?=
 =?us-ascii?Q?hymR1OCkw/HNAFnf23ooEnTuhe4exJ2QMUw+w3ChtPyb1buCNCzDFiey7XaV?=
 =?us-ascii?Q?3Q/GsDqSgH6qe3QbNyiuVw2l?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8073d22b-9229-4091-0e74-08d91f530d2d
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 07:59:41.6827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vaNhL5ybcH5YJlLBAaBccN/wWjsVSOwUAviWEOxvUiXHNVkeqg/nkGTX+JWJPLx9J31aKv0HCI6QI87fP4tQ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR01MB0670
Content-Type: text/plain

From: "akash.hadke" <akash.hadke@kpit.com>

Added fix for below CVE's

CVE-2019-5063
CVE-2019-5064
Link: https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch

Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 .../opencv/CVE-2019-5063_and_2019-5064.patch       | 78 ++++++++++++++++++++++
 meta-oe/recipes-support/opencv/opencv_4.1.0.bb     |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch

diff --git a/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
new file mode 100644
index 0000000..b4d5e6d
--- /dev/null
+++ b/meta-oe/recipes-support/opencv/opencv/CVE-2019-5063_and_2019-5064.patch
@@ -0,0 +1,78 @@
+From f42d5399aac80d371b17d689851406669c9b9111 Mon Sep 17 00:00:00 2001
+From: Alexander Alekhin <alexander.alekhin@intel.com>
+Date: Thu, 7 Nov 2019 14:01:51 +0300
+Subject: [PATCH] core(persistence): add more checks for implementation
+ limitations
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ modules/core/src/persistence_json.cpp | 8 ++++++++
+ modules/core/src/persistence_xml.cpp  | 6 ++++--
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+---
+CVE: CVE-2019-5063
+CVE: CVE-2019-5064
+Upstream-Status: Backport [https://github.com/opencv/opencv/commit/f42d5399aac80d371b17d689851406669c9b9111.patch]
+---
+diff --git a/modules/core/src/persistence_json.cpp b/modules/core/src/persistence_json.cpp
+index 89914e6534f..2efdf17d3f5 100644
+--- a/modules/core/src/persistence_json.cpp
++++ b/modules/core/src/persistence_json.cpp
+@@ -578,10 +578,14 @@ class JSONParser : public FileStorageParser
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+                             ptr++;
++                            if (i + 1 >= CV_FS_MAX_LEN)
++                                CV_PARSE_ERROR_CPP("string is too long");
+                             switch ( *ptr )
+                             {
+                             case '\\':
+@@ -605,6 +609,8 @@ class JSONParser : public FileStorageParser
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+@@ -620,6 +626,8 @@ class JSONParser : public FileStorageParser
+                             sz = (int)(ptr - beg);
+                             if( sz > 0 )
+                             {
++                                if (i + sz >= CV_FS_MAX_LEN)
++                                    CV_PARSE_ERROR_CPP("string is too long");
+                                 memcpy(buf + i, beg, sz);
+                                 i += sz;
+                             }
+diff --git a/modules/core/src/persistence_xml.cpp b/modules/core/src/persistence_xml.cpp
+index 89876dd3da8..52b53744254 100644
+--- a/modules/core/src/persistence_xml.cpp
++++ b/modules/core/src/persistence_xml.cpp
+@@ -627,6 +627,8 @@ class XMLParser : public FileStorageParser
+                                         c = '\"';
+                                     else
+                                     {
++                                        if (len + 2 + i >= CV_FS_MAX_LEN)
++                                            CV_PARSE_ERROR_CPP("string is too long");
+                                         memcpy( strbuf + i, ptr-1, len + 2 );
+                                         i += len + 2;
+                                     }
+@@ -635,9 +637,9 @@ class XMLParser : public FileStorageParser
+                                 CV_PERSISTENCE_CHECK_END_OF_BUFFER_BUG_CPP();
+                             }
+                         }
++                        if (i + 1 >= CV_FS_MAX_LEN)
++                            CV_PARSE_ERROR_CPP("Too long string literal");
+                         strbuf[i++] = c;
+-                        if( i >= CV_FS_MAX_LEN )
+-                            CV_PARSE_ERROR_CPP( "Too long string literal" );
+                     }
+                     elem->setValue(FileNode::STRING, strbuf, i);
+                 }
diff --git a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
index de708fd..19d5d0c 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.1.0.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/opencv/opencv.git;name=opencv \
            file://CVE-2019-14493.patch \
            file://CVE-2019-15939.patch \
            file://CVE-2019-19624.patch \
+           file://CVE-2019-5063_and_2019-5064.patch \
            "
 PV = "4.1.0"
 
-- 
2.7.4

