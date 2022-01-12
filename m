Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086D1C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 17:21:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.233.1642008062211197609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OsG/rzzz;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=801136dcde=saul.wold@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20CErive030377
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=sPLCAMq4hj80UNeda+r6VX0t/9Oi/qe52EipBYqbRy8=;
 b=OsG/rzzzRuG0CDFzy4JFTpY7w5dXrS7GIYPYI0j47o4Fl8Auj33ibP6fXfnjLqkO3y/7
 ioQY2gMiyUOTQGm/qPNvf+unrYGMI+mnBQGkuaEuqx7sIj0TArDqfqpXr8NGRrf/A8Qr
 D6ARyH+a6Je9nUY/p/x1Md45akiaQ2ZRkVKDUq8r5Gz3Fx7ziEEnI2BxtIt3+7263yNr
 ltpNpSkBKdGIsLwN1yLdHNn9P7qgJ0LEklONfX18nwpOnj3cQ6irfOF2h85uo+Y6ax7B
 IsJMZhFU3sqq/WRuwQCFwSCniz9bsZx/pUDbnGX3GI+Uk3HqK1IIOilf9tYLtg7hF4t9 BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20CHL0Tk026388
	for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 09:21:00 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2049.outbound.protection.outlook.com [104.47.56.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy0786nf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jan 2022 09:21:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqWKl1pN8xwN19rCoK2wgBN4Xbg4WL5+kUwXsEi93Ek+1NA0Ngnv4dhRT++dC/BKJReJ6g4yyfmNx0y2JTjzU2ukBg7/IiNifxNmkuxz0AqEs3oKVS6PnF/jTeXGAJVbavGr8SjSiGaGJaTPS2N7ilzfqvHYS+D8Gg7Mb0dfY3TFQ3W4h5+gaVJH2NTXvedhNF9PclP52aiO+l0d9z8FfrZRuuLr0H7jcrMSp8/gWPmmxe+qElS70Um+XTBnCkJjud73qqzmaiaawx1T+0UM0lH8lNbbp9o6zJF+67OCYzuKHjaE913TVWjOaHDKpL9z0UjZNgdCDma8157AQpc1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sPLCAMq4hj80UNeda+r6VX0t/9Oi/qe52EipBYqbRy8=;
 b=c0C6PMd2ATCY35jDP0SiG4hiAaTy9z+sdIsUlsEFEIhC2cE7skK3jHEX2T01lXpKpPmYBl8dCOj+E2Q2qgZIAxvwM1TWO5Opu/tGIxbix6KghYkkBi5CIOhX31xHDsy/YAZbxIJpYUODvXAhHrQrt/paHoaursEkv+p9g3vRdPkGYgnyiuzJ+4oQ6gTecXxtjxha5D5BgnRhaUdZaiJcRwmblj2CGbj3lHsLwwysVtgMK0QlyP23Q/NXyvG+jijC7p1TQa+a8AojYFFt/jPwy6YdK3faT7O32Jh+0DxLUhnTFx/vrbeKZmpuXzSYL/e0hmS6PW5O2J2IeDZPayTp4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BY5PR11MB4226.namprd11.prod.outlook.com (2603:10b6:a03:1bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Wed, 12 Jan
 2022 17:20:58 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::2027:9b43:472b:13ac%4]) with mapi id 15.20.4888.011; Wed, 12 Jan 2022
 17:20:58 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org, bruce.ashfield@gmail.com,
        JPEWhacker@gmail.com
Cc: Saul Wold <saul.wold@windriver.com>
Subject: [PATCH 2/3] package: Add support for kernel stripping
Date: Wed, 12 Jan 2022 09:20:40 -0800
Message-Id: <20220112172041.143485-3-saul.wold@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220112172041.143485-1-saul.wold@windriver.com>
References: <20220112172041.143485-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::35) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c7fe3cd-dd1e-48a7-fc76-08d9d5efe622
X-MS-TrafficTypeDiagnostic: BY5PR11MB4226:EE_
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB42267C7E400AF222FDB243BFEE529@BY5PR11MB4226.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y672HyUDH1cBpiJZfDinLu8nMelrthSpoYL2QgGNxPXCaAD/FdOv9Yg7N9TZor3z3Wv94mx/o7TL9aP1kj8Jozm2WLtHiQcRr/DV8IEQ2+vH4GHO+BfPE6KBHsUDmx91rA6cPZu8FSSCaKVcOyIq93sjia9W1LH1GsTBVPHtRIydU8WrrQ4iJA9G2njv/vwaGOZP1aFZcVthZT19Db1GkpqzVo8CYkRyJbVjyDkMYbF8NwU0AzI5P0mZHwnbuCBvfChULPiiwj/R+Cha5E4oF2bVQDsQIUy3dvo0wwoHq6JwwyumwKB82Y3q9OU3Hn5oa3SrI+KYYngyi72vjVbwaN88yUBK3tSWRO7U1cSH0aD2CLdFnOYarveQTuTkZFoUUruFL7+9eNxRkRz8ROpQcHaXbcL2ZSdaCVdaPNJpII53WzHmOGzBJXgxCuuhm8epFfjgi4z6c1dbtb2O0jSbqaT39iXHHGKkDMBjDMoRJ0UceFgOB+gUNm/pDUxu60bfHPXj4zZy1I9C7KM8dRugECr7+LMLeZ5EE2hCiLO1huLrGVg0zniGpRMOBRAyfT52kNrTgBDWCyO590LIHnlnruGRZxlbeWr9lDtzS0bOLmoGcY04IswkRgM9GSWaccrd2AnEOSwHIhCxPXkP/GH0DG2w568vQT7UKvCw4LLSQj8TGZ2rZ/TwANAFHYvd1qfTpsi/JFjUurfDj7V8IV3qywMru3hJBDfXliHehQjE4bI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(2906002)(316002)(6666004)(8676002)(66946007)(1076003)(66556008)(66476007)(36756003)(86362001)(186003)(107886003)(6506007)(6512007)(38350700002)(38100700002)(52116002)(2616005)(44832011)(83380400001)(26005)(6486002)(508600001)(5660300002)(4326008)(168613001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xUUg4bd3UaTXCQE8cxoFSkshtEtg4YMY6XDaWI5JRP5ymiwNpAoGdfDtAS1H?=
 =?us-ascii?Q?/6OqzBZtvlNxLXp0NK3QzX+DZGvCmjOJKwfzyGlMgz1QwU2TxGxg3feJ14sg?=
 =?us-ascii?Q?xDS0jy6oOB96BAqHIQ5K1/LmGqRwUVBaAsUCEZOOBUHxlo4i7Byq4wHlCRKd?=
 =?us-ascii?Q?oQTUrHNmqbA7iNLVZYyIIYPmSlNwMKqgf1YyWpdFkroADPGHh3ya4zi1Z0iH?=
 =?us-ascii?Q?RximgHasZhl0GuPYzy2ovIg77/6c/HAfEj2f0OeQn/IL8zXRdK9Bxy26F/yY?=
 =?us-ascii?Q?ELjnroyxIc+6ptCuvoaRWywl4iJYlTq68PWBpPdMoOSLKFLoceYsbgUD2ogn?=
 =?us-ascii?Q?OB8uFBC5fMKwNd6PtTdXSV0LXOStUmpBRhbWSUVx5hx513fwUhqWhVT3Lidl?=
 =?us-ascii?Q?ljODlLJy72gWdiGSt3JZ4fvusZQnB2esBmOubbXQfpVam8Jjz5YB6SB/QwoI?=
 =?us-ascii?Q?FVQpP9xQlAuwj2fOn6BLNOuWrwh1joQ6C1CybAI4LmhjiaEyHvPAmh/lM0/j?=
 =?us-ascii?Q?YmMOUSaEaZ7YiaD0HLzKVMnrKZoiJb/9nNTmtfH3nX1TF3KDX39cm0wUXQVY?=
 =?us-ascii?Q?4alGeAvIg9wLQB6rQzlVAPiNd09FmFJZ7LEJvt/MshRcxGtE5Wo8BVJZPVOE?=
 =?us-ascii?Q?13ge+lcVYWAc6IonWQ2JZE+l4p09TlfrVhZk7/a4eKlwqCRnYj195q/KWnW3?=
 =?us-ascii?Q?p7U2l9CNQ8kC5LHcK7F8dsYWUGSC8tiCM9ZsyjVQwm7m/PJWhQ6zKG+h9lpC?=
 =?us-ascii?Q?Xee9AiM/rfD1te41Py48ytRj6fLAINFtAom3cPPUyQv9YJFYYv/eGVcykxGO?=
 =?us-ascii?Q?tDkGtv6VN2q+TaONxFBvWkpwN7o9XKunQGrqgVfiDtrLyv54sXYb74Db1AKl?=
 =?us-ascii?Q?6MOiLrQKClTZNZzMY4KpLg9e1IfOamb96DPZ/PAOCFO2sdkFyLk2MWRuzbUj?=
 =?us-ascii?Q?aJDouQsiVPI91x+6gPRlgsHyPySRlTAkeWcReR6Yre5+Wss0XyzqJojuzPrb?=
 =?us-ascii?Q?OUCqOOOxTbn7VaIsQZE/ZPZ9SktuzY4Djt7YJ2LBUx5tW95XlmrN7hx+mX6d?=
 =?us-ascii?Q?wwoM5Y8j4DVpHO+s03x0AJxYMNiM4A0+8WDjQLtRKERT8cYCRQNbniXJTEon?=
 =?us-ascii?Q?O0ugxkOiRcG2RayO0wrkkq0Gdeu1ZorJ2TPPb+ifKAK0VCz3vhKzJt/sP2v8?=
 =?us-ascii?Q?K0x8XQwUE5RJCYAxiu3LoOAscq2TtZoJOc+9T9OnxP67iQn2gWcCfVzetHEb?=
 =?us-ascii?Q?gf5u37lq0l8OhQurhU6nHz0xzf5Q41XbT7QxFChpjesvSCA1J9hl7FNDnRCp?=
 =?us-ascii?Q?uiPPY4a+HedyzulQmHOmO+8DcK1aG23cCm/3HAD334U6KhhA+M1HEUCMzJVl?=
 =?us-ascii?Q?2q6Cpn9+34z763CBSoapNFgTF3j0zUX+XZKivly8+0Lopcfo5Uk5j2vcywd1?=
 =?us-ascii?Q?eO8jYi9WcSHzRsa4ZGY9CVvp22tHxI250r3S6UFBPXmZ17U+QjZdy5VXzaT6?=
 =?us-ascii?Q?AjAUasjfrOaYc0nZxYLyLRqasJIV5xz0iORVUdcWoHgx+frwuVZ6qPpLxIV3?=
 =?us-ascii?Q?RpAWCdEyJybi6R90CiEKYe6mpfRwTl0pCcOe9SBpd+DeuviOYCUijgR+HxQZ?=
 =?us-ascii?Q?ywhjvNf9Kq2TcErcH7Fgna8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c7fe3cd-dd1e-48a7-fc76-08d9d5efe622
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2022 17:20:58.5838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hdi+1+VF8BJrYkIwn+WGYTwQVqYRQmLo0l216bC4MY7KfwUWtIj+VgrhE85EDef3BX2oJNT4zRlpImEJuX7qfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4226
X-Proofpoint-GUID: pN6Jd_YzeP5hAVBsqD-YTotPlL_Y6wYO
X-Proofpoint-ORIG-GUID: Kjspjecdypp_reF20A111EodL8tkCDPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-12_04,2022-01-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201120106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 17:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160494

Extend runstrip() to accept additional argument to enable
sharing it with the kernel do_strip() so that
KERNEL_IMAGE_STRIP_EXTRA_SECTIONS can be passed.

Since is_elf() understands kernel modules there is no need to keep a
seperate list for kernmodules or hardcode the values to runstrip.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/package.bbclass | 17 +++++------------
 meta/lib/oe/package.py       |  9 ++++++++-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 09cd376f4af..4927fb99ff1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -390,10 +390,6 @@ def splitdebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir,
     dvar = d.getVar('PKGD')
     objcopy = d.getVar("OBJCOPY")
 
-    # We ignore kernel modules, we don't generate debug info files.
-    if file.find("/lib/modules/") != -1 and file.endswith(".ko"):
-        return (file, sources)
-
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
         origmode = os.stat(file)[stat.ST_MODE]
@@ -1122,7 +1118,6 @@ python split_and_strip_files () {
     #
     elffiles = {}
     symlinks = {}
-    kernmods = []
     staticlibs = []
     inodes = {}
     libdir = os.path.abspath(dvar + os.sep + d.getVar("libdir"))
@@ -1145,9 +1140,6 @@ python split_and_strip_files () {
                 if file in skipfiles:
                     continue
 
-                if file.endswith(".ko") and file.find("/lib/modules/") != -1:
-                    kernmods.append(file)
-                    continue
                 if oe.package.is_static_lib(file):
                     staticlibs.append(file)
                     continue
@@ -1164,8 +1156,11 @@ python split_and_strip_files () {
                 if not s:
                     continue
                 # Check its an executable
-                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) or (s[stat.ST_MODE] & stat.S_IXOTH) \
-                        or ((file.startswith(libdir) or file.startswith(baselibdir)) and (".so" in f or ".node" in f)):
+                if (s[stat.ST_MODE] & stat.S_IXUSR) or (s[stat.ST_MODE] & stat.S_IXGRP) \
+                        or (s[stat.ST_MODE] & stat.S_IXOTH) \
+                        or ((file.startswith(libdir) or file.startswith(baselibdir)) \
+                        and (".so" in f or ".node" in f)) \
+                        or (f.startswith('vmlinux') or ".ko" in f):
 
                     if cpath.islink(file):
                         checkelflinks[file] = ltarget
@@ -1312,8 +1307,6 @@ python split_and_strip_files () {
             elf_file = int(elffiles[file])
             #bb.note("Strip %s" % file)
             sfiles.append((file, elf_file, strip))
-        for f in kernmods:
-            sfiles.append((f, 16, strip))
         if (d.getVar('PACKAGE_STRIP_STATIC') == '1' or d.getVar('PACKAGE_DEBUG_STATIC_SPLIT') == '1'):
             for f in staticlibs:
                 sfiles.append((f, 16, strip))
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index dd700cbb0c9..7d387ee81d5 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -16,7 +16,11 @@ def runstrip(arg):
     # 8 - shared library
     # 16 - kernel module
 
-    (file, elftype, strip) = arg
+    if len(arg) == 3:
+        (file, elftype, strip) = arg
+        extra_strip_sections = ''
+    else:
+        (file, elftype, strip, extra_strip_sections) = arg
 
     newmode = None
     if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
@@ -40,6 +44,9 @@ def runstrip(arg):
     # shared or executable:
     elif elftype & 8 or elftype & 4:
         stripcmd.extend(["--remove-section=.comment", "--remove-section=.note"])
+        if extra_strip_sections != '':
+            for section in extra_strip_sections.split():
+                stripcmd.extend(["--remove-section=" + section])
 
     stripcmd.append(file)
     bb.debug(1, "runstrip: %s" % stripcmd)
-- 
2.31.1


