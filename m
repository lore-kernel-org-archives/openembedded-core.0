Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C83BEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 04:36:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1166.1687149378342979987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 21:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=PuHqSSiV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55343858d1=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35J4SA2f003726
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=7RghpuxazdWbWBdDNju33hcYbeWWkKQktHb/kjY5/s0=;
 b=PuHqSSiVx3KMyEWv77NOCWHm0ZEKGLdIJefxLCxDI76ssHDgambLK+YHKy76sEEi2nmi
 GvZ5vPIo6nu2g/T4pv17Tf+HbW5FgZQMssYYPlX5yLdc2hLPmBU5qqBPz7sp2/ekzDvq
 AGB04IinGKlg5HQGClaKmSfTM8AeOkSR3nkAcqA7G49HbiDXNYrtG+J9+VtFiQFJVgfS
 BubmsnbSzwNe3FbjVRuCIMv4GEMy9e30SQqdef3CbkMu+p12iW+YOPTRQNje6r8E69dq
 mNa2XAaVyvqHuulD+QZPenO81BvMxh2itTWMC5NVtwfZi3CowOTwtxeYJbvJXGKDaXN1 pQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9842s4f1-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 21:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6qlUZqG6gqEbCoZruUrxoPW8rE4mxsPp8HPIpWmTqFNWMDkp7Sc5afmDAH+W5r66qIFbc0GMPSxd+MiwVRKRLHI7Q9Q1cX/CKPuZs4+0ck53y30zpuNwofxJhLCEgcbn3jAHvRxndxOZjpelfF0j/biyXP2ofSmJDM5kqjV2xiCdt/DPfO57M+S207fdMqkencTOmWCExIWWn7gswI0Sa6iwWeGLbL34kOWyLXZSXWetjuvXAhFTg31vj+55AEfe95acnpcCJeURtSZGcAuu3yKVaZEGqEkLcbd6WrTlraxXWxhBPf0Tch7LvNTRhVxi+npnOQHW1iCOhIraQM3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RghpuxazdWbWBdDNju33hcYbeWWkKQktHb/kjY5/s0=;
 b=Q1hb6v7tYkaqeKt8Yyi8RM5Aft7ja+pWX+65NaBfMqk+JsRPauiCiCq6KlpPSWOFlcYMCCKCpyaIE6YKVbsy+1ZKUI0Y/KZzP7IpulVTyfRBv66EBJxBABr2yYRWe8WS90IA8+WTIhwkgNKS0L4l4lnoiM1YGz0+AqwKwSztZlgjJZqTZ0dZLvFPAHlr6Qea7Istk0chzzU9egMcaxGechSMMNJC34YeBFIByFtVle5YKZ6L26s3duHqqPSYcXyeP53pojZExuO2U+KFt6yQZIsUUeVYVEHN1EwafxqZ0BwkXZThYUtaHp1uRhRelPIVhTZlc6t4K4cBhgc7cxvOyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH0PR11MB4984.namprd11.prod.outlook.com (2603:10b6:510:34::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 04:36:13 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 04:36:13 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 3/4] unzip: fix configure check for cross compilation
Date: Mon, 19 Jun 2023 12:35:55 +0800
Message-Id: <20230619043556.3432048-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619043556.3432048-1-Qi.Chen@windriver.com>
References: <20230619043556.3432048-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:405::17)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH0PR11MB4984:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c458ec9-4dcb-4fe7-68f9-08db707eb653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NQBbk+QCNbkwR289KVZxSThIDTPf2QXr/V991otvv9uN5+cvETpg5Ewh3b+4Vce1S56z44t1m9zf9ynVVcgC2EQX2tuGHF3R2pW49dDqUZmiCVk3EsD1rvQX/2lKh2j2z4LiqVYKnWwUgafFoVgwd0XEvYlJDmfFHSq71rz0i6twAaP5a68fm1PaNOf6Nm6Eb47ovN1hxo+vAOjk7qWps1grhoq1ouWBLQUNn5Iqdrs4ge9B5YgzQ8BBhVwIqvpHEzUE7LCVou7BLHrtWk0BcdRgVbWgBWVqbcXUmKzbexcjBC8xwj/qVdsfBoqYASXgXpL3mrMwf/aIHZWlldaU0iEF958FtAam3L5mC7n7J+sFICCIXVIxq0tNVN1O8iBGmrQV41LDti9ositH4WHwhsMI8An2xS67vK6T1J3TeJ9sZgAPMVRx+Ybd4snF5c0kZcLhmx4IeXg7UxsDszVoRi6h4ieLRFhPqiSeNv86ShtqQBx/AchaTnyI0yFqyCAOOYOpQ31Vw90phGBpPIaEAUjwzIc7JVKkLLLkRjR7s9hKL4cXuwcOyGt1MLU/gz11CSeThDRjtSTmGki06LWkIJXznl2Gs+9r8uLSnf+hulfWZQs4UEsP88nsIT2Mh0AH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39840400004)(366004)(396003)(136003)(376002)(451199021)(186003)(6512007)(26005)(9686003)(1076003)(6506007)(2616005)(83380400001)(38350700002)(38100700002)(478600001)(41300700001)(66556008)(66476007)(6916009)(66946007)(36756003)(8676002)(316002)(8936002)(52116002)(6486002)(86362001)(6666004)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oklM2HIbnKbuKYajiZXPHx6XbTD5s/YBBaOvI+vu4AwdRglNIbzJYwlN9upB?=
 =?us-ascii?Q?yZ0eIPlVO8ea1+WDYVJO/EFhf/ECFn5ZhmbK2FrMomNynZWfeYrwd6i7Je1W?=
 =?us-ascii?Q?kxVDgtDG3gTlWHY6vqg9PJMEG4kmOGcq87R/MpqUyknHkSj6iBtHP7ziZDhS?=
 =?us-ascii?Q?p3KEswSjYIPsdYX/+uU9kU0UixEp7bouv0QEX/3mTaH552GVIJiYzefPBuel?=
 =?us-ascii?Q?UCtngDUsN+C+EYlmM8ajYHP3l6tE+ACmp+UvH5H6KcNq4QJ97yUJtlm4ldCb?=
 =?us-ascii?Q?jZdYmJID60hjlVEiltOXCeuOfoc2ZTFHfBvjtXgcTu7YE1iUV6ErPZdJqEAh?=
 =?us-ascii?Q?pp9bJOTxhJDxWQ7LtoOhMGcxO/tlpVnusDBVNhhLJVpxF2wfT1PsLkbsMtDo?=
 =?us-ascii?Q?VWmFdN0RlSWLZZsyUwPPMnmoLHcWAwK19+r2Dx1ZQYAKev3jbkCkPUJtNWgz?=
 =?us-ascii?Q?RF1gEO3tXx/fIIH5/NvCxihC4CntcRFxl/kTkyu62tfGLNw842SsIUs6xPEw?=
 =?us-ascii?Q?iLWIn1JPk9vM/5KU+jIxnE/2oV7+ZBjqTSNAHTpSMI1zXtekGO2UbjlndAIS?=
 =?us-ascii?Q?5oCxiTPU893oCv1AzcQBSNSGUZDBN+UUT9LD/z3PBB4B9bAhxypWejUtb5nY?=
 =?us-ascii?Q?iba5EWej2bviLLxQTHoIro7Cy4fMRNBm3ylCcAlr0AkTNfqiXdDkOlggWbNy?=
 =?us-ascii?Q?1sDlYalLSov6fxh3R1sc0vFWRrZfIn+yqOS7OSK4iJGFGF+k8QPNX4HWUF6a?=
 =?us-ascii?Q?vVGv2Raxww5q0sq+xDJ8oWBKFkSBtnxuv12Z+UNyRluMLxLzVBXXqHXMRAB7?=
 =?us-ascii?Q?aTYXTkkq0m33AHeGfpP3W7WHs/MGSuZXGd+ZeAGnBB1pXFTdANBhxi9WYvFD?=
 =?us-ascii?Q?DwJqeUFegQisK0tjBuy5S1HoHfPCKTHAyK1sMISx9Rz+b7qO51FURm80f/tY?=
 =?us-ascii?Q?JBn/RJUjEkfTd3VLijhJCCJUcwbGaf5MzWEqnSEWT2yTJ/aX+BEIF2K/K0Z3?=
 =?us-ascii?Q?+epBD9WCH+TiPBaF63PB7+Bt8SxDf4FWjPWS4/YPO+uOHyjr62HHOEPWiwey?=
 =?us-ascii?Q?ZX230+D5XiHSeXU0rwsqkzmRmoRfQrDDL/Gi3pCLKXla8nx5Vcjz10n8Mg2T?=
 =?us-ascii?Q?xZtNRUoZj1Nsrdg5wirdtx0NTFRro+BnFBzw51RgvY9NBbARsG8XgjMZRU59?=
 =?us-ascii?Q?gOUoyTGX6W7OxC01aYCXpFOc0i34YKqxLA+mU5YtoyQbmmZwGMYVthAf4q/Y?=
 =?us-ascii?Q?1WqJ5r+/Pm1JK3GtdDpwnSWN894p0abAqcaLh9EoOds4AzKTx/ScH3d1jhj0?=
 =?us-ascii?Q?6uynd1GFZJoATJLGbnx7mTQRh2LmjoTsH+ncj+R1ow9kUGxJzMiFP8NZtcno?=
 =?us-ascii?Q?ZMNmRmulvOznRjfgYQSNH12AUodx/ZQc/7cSCrR5+hqOd8CubO3dqt/7P8FN?=
 =?us-ascii?Q?kLeeUtiLZbi43XULGqTjjG0iFgAw9EWRP2p3f51tKNuBFsoaFAB/C/UeyzmZ?=
 =?us-ascii?Q?+haZI+2r5F+n1L1OCX5jPpYr994VkYEh1OHBArSpgOhpKJ/w9HBh5Gp/5UEg?=
 =?us-ascii?Q?eGttC5f6suYeuEZU1m6pqnnMvQWTFmboYu9ypTL3?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c458ec9-4dcb-4fe7-68f9-08db707eb653
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 04:36:13.1834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJ9oalXZJTLBySVLPhL3CVchE+DWyGPyJLv8AKnJhbIhv0tlaSNrIELI1M8mJjm5YmJODIcvIYtnUiBKpvsPVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4984
X-Proofpoint-ORIG-GUID: IuJXFI3PN2P2VyCavN6TmUVzhL3SW_Xx
X-Proofpoint-GUID: IuJXFI3PN2P2VyCavN6TmUVzhL3SW_Xx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-19_02,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306190041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 04:36:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183089

From: Chen Qi <Qi.Chen@windriver.com>

The original configure runs a generated binary to determine
features. This is not correct for cross compilation. So change
the runtime tests into compile-time tests to fix the issue.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-fix-detection-for-cross-compilation.patch | 103 ++++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch

diff --git a/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch b/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
new file mode 100644
index 0000000000..2fa7f481b7
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/0001-unix-configure-fix-detection-for-cross-compilation.patch
@@ -0,0 +1,103 @@
+From 5cbf901b5c3b6a7d1d0ed91b6df4194bb6d25a40 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Thu, 15 Jun 2023 07:14:17 -0700
+Subject: [PATCH] unix/configure: fix detection for cross compilation
+
+We're doing cross compilation, running a cross-compiled problem
+on host to detemine feature is not correct. So we change runtime
+check into compile-time check to detect the features.
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ unix/configure | 44 +++++++++++++++-----------------------------
+ 1 file changed, 15 insertions(+), 29 deletions(-)
+
+diff --git a/unix/configure b/unix/configure
+index 8fd82dd..68dee98 100755
+--- a/unix/configure
++++ b/unix/configure
+@@ -259,6 +259,10 @@ cat > conftest.c << _EOF_
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <stdio.h>
++
++_Static_assert(sizeof(off_t) < 8, "sizeof off_t < 8 failed");
++_Static_assert(sizeof((struct stat){0}.st_size) < 8, "sizeof st_size < 8 failed");
++
+ int main()
+ {
+   off_t offset;
+@@ -278,21 +282,10 @@ _EOF_
+ # compile it
+ $CC $CFLAGS $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null
+ if [ $? -ne 0 ]; then
+-  echo -- no Large File Support
++  echo -- yes we have Large File Support!
++  CFLAGSR="${CFLAGSR} -DLARGE_FILE_SUPPORT"
+ else
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 1 ]; then
+-    echo -- no Large File Support - no 64-bit off_t
+-  elif [ $r -eq 2 ]; then
+-    echo -- no Large File Support - no 64-bit stat
+-  elif [ $r -eq 3 ]; then
+-    echo -- yes we have Large File Support!
+-    CFLAGSR="${CFLAGSR} -DLARGE_FILE_SUPPORT"
+-  else
+-    echo -- no Large File Support - conftest returned $r
+-  fi
++  echo -- no Large File Support
+ fi
+ 
+ # Added 11/24/2005 EG
+@@ -302,6 +295,11 @@ cat > conftest.c << _EOF_
+ #include <stdlib.h>
+ #include <stdio.h>
+ #include <wchar.h>
++
++#ifndef __STDC_ISO_10646__
++#error "__STDC_ISO_10646__ not defined
++#endif
++
+ int main()
+ {
+   size_t wsize;
+@@ -327,19 +325,8 @@ if [ $? -ne 0 ]; then
+   echo "-- no Unicode (wchar_t) support"
+ else
+ # have wide char support
+-# run it
+-  ./conftest
+-  r=$?
+-  if [ $r -eq 0 ]; then
+-    echo -- no Unicode wchar_t support - wchar_t allocation error
+-  elif [ $r -eq 1 ]; then
+-    echo -- no Unicode support - wchar_t encoding unspecified
+-  elif [ $r -eq 2 ]; then
+-    echo -- have wchar_t with known UCS encoding - enabling Unicode support!
+-    CFLAGSR="${CFLAGSR} -DUNICODE_SUPPORT -DUNICODE_WCHAR"
+-  else
+-    echo "-- no Unicode (wchar_t) support - conftest returned $r"
+-  fi
++  echo -- have wchar_t with known UCS encoding - enabling Unicode support!
++  CFLAGSR="${CFLAGSR} -DUNICODE_SUPPORT -DUNICODE_WCHAR"
+ fi
+ 
+ echo "Check for setlocale support (needed for UNICODE Native check)"
+@@ -418,8 +405,7 @@ temp_link="link_$$"
+   echo "int main() { lchmod(\"${temp_file}\", 0666); }" \
+ ) > conftest.c
+ ln -s "${temp_link}" "${temp_file}" && \
+- $CC $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null 2>/dev/null && \
+- ./conftest
++ $CC -Werror=implicit-function-declaration $BFLAG $LDFLAGS -o conftest conftest.c >/dev/null
+ [ $? -ne 0 ] && CFLAGSR="${CFLAGSR} -DNO_LCHMOD"
+ rm -f "${temp_file}"
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index a4d10c30aa..391e5cd22a 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0529.patch \
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
+        file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.34.1


