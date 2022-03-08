Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17082C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 00:33:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.2986.1646699633751030622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 16:33:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mhNT09eg;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=0066b5df50=saul.wold@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2280UZ3a002389
	for <openembedded-core@lists.openembedded.org>;
 Mon, 7 Mar 2022 16:33:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=yiqhK4PLeG3bkVYmS1L0w0sG9O7SKmzttnjBEWSporQ=;
 b=mhNT09eguqLMN0Rwvj0prHe4Xm8j0I7VTBEW5k17mgZLfQNHYZQeCsBdMRbKiqPIdfzu
 J0lYTIGRPhrQ0ICwhhRF1MabWO8GUZsDn5GBns06wfIaS5N3DRfTV/cnvoOoVa/HPTpn
 9S6exJgEm0vy1EuBXOBj8w3MbMDLcGDH8RGXqGosy9j4XSacuAWDCm/9aGmSJca/VWFt
 ReK8+IdTtfS6Oe4wWYpmbrwkQBcbn5+L26XvkeoiDjVN5pFONw48iyvuInbN0u+FoaFI
 UzNxZJgQptdMS/AV9ZdkJpmXIalSa3ngvpgFADGOJQGp60leTpEULefgmCptL8QssBjC ow==
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3em4169vgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 16:33:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnNsdHAulLVpWuxTiE/tKw6XA+rNHmnc7wqqCxiOq1gc8XKeLxBvjhPWCo/l7at5VkrCIwzPSp+XD0MdulmpBTBdebmz0RaIdygG6OUrjMUdXynrJI5a+5m06fZQBakQ90/HrZJiH+KLy7HD2LiCcRO9tfqKEzPHvgZBTLMZkg31tE886u3joCgtYhUNYqs6Z4W+CAmYXF7Mi/10KRNWFGS7BPWPzHmy3d41GBzSv0Y4b6CrczfuEYbrg7ASZEF4cXtJfxaSZQca2WJ8vpFfPqJ9C0CmYJFr65Z+XPVFdLwb0rzev4HeR7SLMJ3kTKsofvZdE5ZAFzbi3voWKiGn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiqhK4PLeG3bkVYmS1L0w0sG9O7SKmzttnjBEWSporQ=;
 b=MFcBUK3XcRTSvnCwPc8Q+MIg6xc/HyAqEu5hCJSFy5nM2ZZPCbveYIsboikW+NfUl0nqiDEcQe+AW8Iw2K7s84HEmf5AUWMnKKSwJEAJNC58dL9T5nnxICRqapfG8VZML7jdcpX5u8C0fBXS6PWWOlvKKNbiebsMsYQcU0ud6wTKljAe5/pCZKHQtvs0h/wgQgY6jpU6HR42gh/6FNQTQ94px9KJLP2HA6SLQOOgyjH/AzEpJPs6n48rLDHmJT4FFY02sw1HULsYKrWURDUAjPQaTJyDWFKkct1KMoAHmpIEWbjb66/U141lwOE2ei4zIz8IcQylD4aXtBvrIw2Cyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Tue, 8 Mar
 2022 00:33:50 +0000
Received: from CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36]) by CO1PR11MB5076.namprd11.prod.outlook.com
 ([fe80::3dab:fd3e:8d8:4e36%8]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 00:33:49 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Change internal variables
Date: Mon,  7 Mar 2022 16:33:34 -0800
Message-Id: <20220308003334.1609494-1-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::46) To CO1PR11MB5076.namprd11.prod.outlook.com
 (2603:10b6:303:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2421a0fe-5b86-4dd5-7df2-08da009b5020
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31126746148B42B7BFF69EF5EE099@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d1/xQa6r7eRSsFfsR30VgVdTfHFrRq6sTB0XklQo4gsfm0Q4QeyIQnq4b1wQbcT4GLWTrAfj3iB2P4X8cRKPZ9VySQkq0zOy2FPlnMuegewTDWi6vquHcKsM3Z2WFVXjqyzQr/S42SDRHEaxLyWo+2NTzjY6hWAA9m99lwpxA9snx93PMUGIYAhqpK1AI6YR9AqxJV/zI/UjCjlYYbBsFNafvWWtMhzMATaeo0VEOgkeOwhxsaFxwyj9CaDK/MWzRDJAHSdlHMKn5f+G+T+XeFP1GmnVCtnflU8m9ylO8TBx8l1nj3+lgwS4V5OkDhm0p1f8t14wffkE4xNczHQxdJo8drsylZgkzzvYrZtmVMEQUZxcrDLH2T7hFnfthjgY8/csuBa+1mDvTPPdwpHMbw8MnpC0/WE05x+oamuvAppIyzsOGqytliqPKWiMgQiAFwfLbFQHBLmTacUg37BKtUD3yubdeFp15yorgdAf89gVJ9ZWE8Yyw5q+uACGb/xpCFEXhHQDsYF9b7zlbJA+LFc15Pif1nDCMB4HJeH45rkFYMt2BQPVTbzWQwQxlE9dIfEh3l/g5Pzc9gnH+pmsvAJSCx/xNaKoOjYZedgzaahOpw/Wl8C3+zr0Fdgjlf79N27m4NMEz11zl2JKHlXymw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5076.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(508600001)(86362001)(1076003)(83380400001)(2616005)(6666004)(6506007)(6512007)(52116002)(186003)(30864003)(2906002)(44832011)(5660300002)(8676002)(66556008)(66946007)(66476007)(38100700002)(316002)(8936002)(36756003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DQ6pzXtZtQ1e8dI+zoPCcYqXQCpaMVfmw599FDWKGP2NsgS1Un3e9VmR1yuV?=
 =?us-ascii?Q?tWqzQ8HZ8FHP+ErbqHXRgaUN0cNFhLJlePSz3sdp6RtFOYJ/XTiQQy7nslgy?=
 =?us-ascii?Q?91D22yHyLDVVFZNcWv6hqp91D/9fSSw2qF6RT5ysu4+ogqDJ2dcOjHWr6zh6?=
 =?us-ascii?Q?OBpgnXmfe5fsQu961Y+abT0F4iwn3hufkuzlKNXHRT2PGkULxwekH347wBQx?=
 =?us-ascii?Q?aus6t/Qpu+/zExRfbXKGPKmecaM58frJPSzewbDyrdCAivllDjFcYTpmr4Kc?=
 =?us-ascii?Q?S0tD4BZg6kDH0d3AidUgDpQrM54bP8k1/WqJ/5IaB4OieVZQ3iPOZXjLzhD2?=
 =?us-ascii?Q?k0YlrM8QYhWrBZISB/4pLbOeboTpAZFRgRyIzvSuaSy9f5Sdsb2kiAi3DRdR?=
 =?us-ascii?Q?eaFxnv9PmQv76LuiIXoV9W4zUhS8dx5Z21VBTPZpqfR6nSJe/kYRM15F3V8y?=
 =?us-ascii?Q?2s1/z8ZW5pBwmNA0DsgCEneQv0aycDXQOcARWOLO+NOvALNXVdVrozSDu5tn?=
 =?us-ascii?Q?+v+2ABiUl2I+bvY+vxM75mPVnAz24DTjiwliEgsuuXhB7KoU/ciAWadLBQkH?=
 =?us-ascii?Q?dZUBztBSqMu5P+4wy5ZzDKc2I6pbK3UBv/Il/WyrD2Gr/ciHxBkUL9j4qgH8?=
 =?us-ascii?Q?WfTTncc1w8mLHyaoKp0rxMuuK2+6yR7efpcuSwyyUjiiWlWfNLxV6e06VDIM?=
 =?us-ascii?Q?YBVW7RrRgja2CiQugto6k8sr5V35q9mrodVJSDtGJ3T5CaCA+Z6PdIZ5sb2H?=
 =?us-ascii?Q?kVSbWpSvl8e7XDMNp2ON8aOCWPx/VE0S1m0rHGVqGOM53Duuzvw/5cdmlltx?=
 =?us-ascii?Q?EtpnmOlFUPXRPRiO5skqwTlSg0l3NdNc7k7G+KkH4Oy0ffTMH9jgrpMIGotD?=
 =?us-ascii?Q?ouA5mjyi6YD06ZUXBl3P5PwrCZYGW2LhLmmBDWKlHPsLifAEJs4v0so2YYkB?=
 =?us-ascii?Q?xtgVcj8vGKlsNA3owaS9WMFnraeIgFyTE4feBbKPH9VtCbw73CctgHY//iDI?=
 =?us-ascii?Q?FFDa8iJqWv1/zIhzl55q4f2e3w2G1AOWJawmG35dFZSjl2wx3QnoQG/sPf6T?=
 =?us-ascii?Q?q8+jmgH4LsGVwKxdPGekFvNuBBToYY4XBqW47WnnMjketm+qvmk+0GtcuNe3?=
 =?us-ascii?Q?zopgJLfMgGCHhDxw6xAEbRwvDf+Xf6dH9NQZzpeh3C4hwOGpaqEPnagtIPiW?=
 =?us-ascii?Q?sqTp86D1+xbJRcyBrigZ3YF9LMnmivBntQSRZK4OKwfRkX1NgOzkgqkTCWAQ?=
 =?us-ascii?Q?oOcTijg325L5Px0WGPTl7cMKlMcngT0mn3EhxEmcKoxN8kbWuIhslug3Lqay?=
 =?us-ascii?Q?MJ1EAF6Ey5iioYk5aLX1gr1Us6GuDU+M4Pia7b3HG6vfLbMWnBi7G8qfwXYi?=
 =?us-ascii?Q?GUsGq0e70Te0BmU9t/ntbr7qWmaE2HjgdFYMzdLfzSx0cPLzS1DiD4GO3YyA?=
 =?us-ascii?Q?ut8s9+rZ7KGPjFYBK4ii5KJNDC46urQXkeWO1lei0RwvtpygkK1GjcSmlJph?=
 =?us-ascii?Q?iJFkfQVga2RSwnqxAxMH/wcKbOylRvnSNJhUYqfU09rBq2+ap4I+RAAXjWVX?=
 =?us-ascii?Q?ve2tGyi1VUZgrYIEK70ga//W4/gHfjYfDz23xNj+GkzL93ZnHde3ylWehAlW?=
 =?us-ascii?Q?JOXrZFZ3QRHI76xvMnwxfi+jzrm+WPSLP/TPZxeTb/On?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2421a0fe-5b86-4dd5-7df2-08da009b5020
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5076.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 00:33:49.8082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ePhwV3aFyiJpa69vMmyEyF0kYuZfc6KJmzu7sQ7QXKe1veg5BIjLYj0IJbLV/8Y3TnciQQkBmhd2y6VOuPxrSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
X-Proofpoint-GUID: lO1MUAaEJORajktRI8hdW5mr_hjwgi65
X-Proofpoint-ORIG-GUID: lO1MUAaEJORajktRI8hdW5mr_hjwgi65
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_12,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203080000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 00:33:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162871

This patch is another part of the inclusive language change
to rename internal variables to more understandable names.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
---
 meta/classes/base.bbclass                     |  4 +--
 meta/classes/cross-canadian.bbclass           |  6 ++--
 meta/classes/cve-check.bbclass                | 31 ++++++++++---------
 meta/classes/insane.bbclass                   |  6 ++--
 meta/classes/populate_sdk_ext.bbclass         | 18 +++++------
 meta/classes/sstate.bbclass                   |  4 +--
 .../distro/include/cve-extra-exclusions.inc   |  2 +-
 meta/conf/distro/include/security_flags.inc   |  2 +-
 meta/lib/oe/utils.py                          |  4 +--
 meta/lib/oeqa/manual/bsp-hw.json              |  2 +-
 .../lib/oeqa/selftest/cases/containerimage.py |  2 +-
 scripts/lib/checklayer/cases/bsp.py           |  2 +-
 scripts/verify-bashisms                       | 10 +++---
 13 files changed, 47 insertions(+), 46 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b7869da3b3..cc81461473 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -329,9 +329,9 @@ python base_eventhandler() {
         source_mirror_fetch = d.getVar('SOURCE_MIRROR_FETCH', False)
         if not source_mirror_fetch:
             provs = (d.getVar("PROVIDES") or "").split()
-            multiwhitelist = (d.getVar("BB_MULTI_PROVIDER_ALLOWED") or "").split()
+            multiprovidersallowed = (d.getVar("BB_MULTI_PROVIDER_ALLOWED") or "").split()
             for p in provs:
-                if p.startswith("virtual/") and p not in multiwhitelist:
+                if p.startswith("virtual/") and p not in multiprovidersallowed:
                     profprov = d.getVar("PREFERRED_PROVIDER_" + p)
                     if profprov and pn != profprov:
                         raise bb.parse.SkipRecipe("PREFERRED_PROVIDER_%s set to %s, not %s" % (p, profprov, pn))
diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index ac82e86356..a0e9d23836 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -36,7 +36,7 @@ python () {
         return
 
     tos = d.getVar("TARGET_OS")
-    whitelist = ["mingw32"]
+    tos_known = ["mingw32"]
     extralibcs = [""]
     if "musl" in d.getVar("BASECANADIANEXTRAOS"):
         extralibcs.append("musl")
@@ -51,8 +51,8 @@ python () {
                 entry = entry + "-gnu" + variant
             elif libc:
                 entry = entry + "-" + libc
-            whitelist.append(entry)
-    if tos not in whitelist:
+            tos_known.append(entry)
+    if tos not in tos_known:
         bb.fatal("Building cross-candian for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS"))
 
     for n in ["PROVIDES", "DEPENDS"]:
diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 079d09a76f..2dad58c13e 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -43,11 +43,12 @@ CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
 
-# Whitelist for packages (PN)
+# Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?= ""
 
-# Whitelist for CVE. If a CVE is found, then it is considered patched.
-# The value is a string containing space separated CVE values:
+# Ingore the check for a given list of CVEs. If a CVE is found,
+# then it is considered patched. The value is a string containing
+# space separated CVE values:
 #
 # CVE_CHECK_IGNORE = 'CVE-2014-2524 CVE-2018-1234'
 #
@@ -101,10 +102,10 @@ python do_cve_check () {
             patched_cves = get_patched_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        whitelisted, patched, unpatched = check_cves(d, patched_cves)
+        ignored, patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
+            cve_write_data(d, patched, unpatched, ignored, cve_data)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -176,12 +177,12 @@ def check_cves(d, patched_cves):
         return ([], [], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
 
-    # If the recipe has been whitelisted we return empty lists
+    # If the recipe has been skipped/ignored we return empty lists
     if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
-        bb.note("Recipe has been whitelisted, skipping check")
+        bb.note("Recipe has been skipped/ignored, skipping check")
         return ([], [], [])
 
-    cve_whitelist = d.getVar("CVE_CHECK_IGNORE").split()
+    cve_ignore = d.getVar("CVE_CHECK_IGNORE").split()
 
     import sqlite3
     db_file = d.expand("file:${CVE_CHECK_DB_FILE}?mode=ro")
@@ -198,9 +199,9 @@ def check_cves(d, patched_cves):
         for cverow in conn.execute("SELECT DISTINCT ID FROM PRODUCTS WHERE PRODUCT IS ? AND VENDOR LIKE ?", (product, vendor)):
             cve = cverow[0]
 
-            if cve in cve_whitelist:
-                bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
-                # TODO: this should be in the report as 'whitelisted'
+            if cve in cve_ignore:
+                bb.note("%s-%s has been ignored for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'ignored'
                 patched_cves.add(cve)
                 continue
             elif cve in patched_cves:
@@ -254,7 +255,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
+    return (list(cve_ignore), list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -279,7 +280,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
+def cve_write_data(d, patched, unpatched, ignored, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -312,8 +313,8 @@ def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"), d.getVar("PV"))
         write_string += "CVE: %s\n" % cve
-        if cve in whitelisted:
-            write_string += "CVE STATUS: Whitelisted\n"
+        if cve in ignored:
+            write_string += "CVE STATUS: Ignored\n"
         elif is_patched:
             write_string += "CVE STATUS: Patched\n"
         else:
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 270b7860c7..40eba73ce3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -441,7 +441,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
 QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
 def package_qa_check_buildpaths(path, name, d, elf, messages):
     """
-    Check for build paths inside target files and error if not found in the whitelist
+    Check for build paths inside target files and error if not paths are allowed
     """
     # Ignore .debug files, not interesting
     if path.find(".debug") != -1:
@@ -1283,8 +1283,8 @@ Rerun configure task after fixing this."""
             options = set()
             for line in output.splitlines():
                 options |= set(line.partition(flag)[2].split())
-            whitelist = set(d.getVar("UNKNOWN_CONFIGURE_OPT_IGNORE").split())
-            options -= whitelist
+            ignore_opts = set(d.getVar("UNKNOWN_CONFIGURE_OPT_IGNORE").split())
+            options -= ignore_opts
             if options:
                 pn = d.getVar('PN')
                 error_msg = pn + ": configure was passed unrecognised options: " + " ".join(options)
diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 9c9561c5c6..e2019f9bbf 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -282,8 +282,8 @@ python copy_buildsystem () {
         bb.utils.mkdirhier(uninative_outdir)
         shutil.copy(uninative_file, uninative_outdir)
 
-    env_whitelist = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
-    env_whitelist_values = {}
+    env_passthrough = (d.getVar('BB_ENV_PASSTHROUGH_ADDITIONS') or '').split()
+    env_passthrough_values = {}
 
     # Create local.conf
     builddir = d.getVar('TOPDIR')
@@ -294,15 +294,15 @@ python copy_buildsystem () {
     if derivative:
         shutil.copyfile(builddir + '/conf/local.conf', baseoutpath + '/conf/local.conf')
     else:
-        local_conf_whitelist = (d.getVar('ESDK_LOCALCONF_ALLOW') or '').split()
-        local_conf_blacklist = (d.getVar('ESDK_LOCALCONF_REMOVE') or '').split()
+        local_conf_allowed = (d.getVar('ESDK_LOCALCONF_ALLOW') or '').split()
+        local_conf_remove = (d.getVar('ESDK_LOCALCONF_REMOVE') or '').split()
         def handle_var(varname, origvalue, op, newlines):
-            if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
+            if varname in local_conf_remove or (origvalue.strip().startswith('/') and not varname in local_conf_allowed):
                 newlines.append('# Removed original setting of %s\n' % varname)
                 return None, op, 0, True
             else:
-                if varname in env_whitelist:
-                    env_whitelist_values[varname] = origvalue
+                if varname in env_passthrough:
+                    env_passthrough_values[varname] = origvalue
                 return origvalue, op, 0, True
         varlist = ['[^#=+ ]*']
         oldlines = []
@@ -356,7 +356,7 @@ python copy_buildsystem () {
             # We want to be able to set this without a full reparse
             f.write('BB_HASHCONFIG_IGNORE_VARS:append = " SIGGEN_UNLOCKED_RECIPES"\n\n')
 
-            # Set up whitelist for run on install
+            # Set up which tasks are ignored for run on install
             f.write('BB_SETSCENE_ENFORCE_IGNORE_TASKS = "%:* *:do_shared_workdir *:do_rm_work wic-tools:* *:do_addto_recipe_sysroot"\n\n')
 
             # Hide the config information from bitbake output (since it's fixed within the SDK)
@@ -438,7 +438,7 @@ python copy_buildsystem () {
     # Ensure any variables set from the external environment (by way of
     # BB_ENV_PASSTHROUGH_ADDITIONS) are set in the SDK's configuration
     extralines = []
-    for name, value in env_whitelist_values.items():
+    for name, value in env_passthrough_values.items():
         actualvalue = d.getVar(name) or ''
         if value != actualvalue:
             extralines.append('%s = "%s"\n' % (name, actualvalue))
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7aca415159..163bdf0b5f 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -259,13 +259,13 @@ def sstate_install(ss, d):
                 shareddirs.append(dstdir)
 
     # Check the file list for conflicts against files which already exist
-    whitelist = (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or "").split()
+    overlap_allowed = (d.getVar("SSTATE_ALLOW_OVERLAP_FILES") or "").split()
     match = []
     for f in sharedfiles:
         if os.path.exists(f) and not os.path.islink(f):
             f = os.path.normpath(f)
             realmatch = True
-            for w in whitelist:
+            for w in overlap_allowed:
                 w = os.path.normpath(w)
                 if f.startswith(w):
                     realmatch = False
diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index 85b40207bf..6c19cd293d 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -26,7 +26,7 @@ CVE_CHECK_IGNORE += "CVE-2000-0006"
 # There has been much discussion amongst the epiphany and webkit developers and
 # whilst there are improvements about how domains are handled and displayed to the user
 # there is unlikely ever to be a single fix to webkit or epiphany which addresses this
-# problem. Whitelisted as there isn't any mitigation or fix or way to progress this further
+# problem. Ignore this CVE as there isn't any mitigation or fix or way to progress this further
 # we can seem to take.
 CVE_CHECK_IGNORE += "CVE-2005-0238"
 
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index e469eadca1..8374cb8544 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -1,6 +1,6 @@
 # Setup extra CFLAGS and LDFLAGS which have 'security' benefits. These
 # don't work universally, there are recipes which can't use one, the other
-# or both so a blacklist is maintained here. The idea would be over
+# or both so an override is maintained here. The idea would be over
 # time to reduce this list to nothing.
 # From a Yocto Project perspective, this file is included and tested
 # in the DISTRO="poky" configuration.
diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 84790b7dff..46fc76c261 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -221,12 +221,12 @@ def packages_filter_out_system(d):
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
     pn = d.getVar('PN')
-    blacklist = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
+    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
     localepkg = pn + "-locale-"
     pkgs = []
 
     for pkg in d.getVar('PACKAGES').split():
-        if pkg not in blacklist and localepkg not in pkg:
+        if pkg not in pkgfilter and localepkg not in pkg:
             pkgs.append(pkg)
     return pkgs
 
diff --git a/meta/lib/oeqa/manual/bsp-hw.json b/meta/lib/oeqa/manual/bsp-hw.json
index ca91987e31..308a0807f3 100644
--- a/meta/lib/oeqa/manual/bsp-hw.json
+++ b/meta/lib/oeqa/manual/bsp-hw.json
@@ -26,7 +26,7 @@
                     "expected_results": ""
                 },
                 "5": {
-                    "action": "Remove USB, and reboot into new installed system. \nNote:   If installation was successfully completed and received this message \"\"(sdx): Volume was not properly unmounted...Please run fsck.\"\" ignore it because this was whitelisted according to bug 9652.",
+                    "action": "Remove USB, and reboot into new installed system. \nNote:   If installation was successfully completed and received this message \"\"(sdx): Volume was not properly unmounted...Please run fsck.\"\" ignore it because this was allowed according to bug 9652.",
                     "expected_results": ""
                 }
             },
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 3068c9ba26..e0aea1a1ef 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -13,7 +13,7 @@ from oeqa.utils.commands import bitbake, get_bb_vars, runCmd
 # The only package added to the image is container_image_testpkg, which
 # contains one file. However, due to some other things not cleaning up during
 # rootfs creation, there is some cruft. Ideally bugs will be filed and the
-# cruft removed, but for now we whitelist some known set.
+# cruft removed, but for now we ignore some known set.
 #
 # Also for performance reasons we're only checking the cruft when using ipk.
 # When using deb, and rpm it is a bit different and we could test all
diff --git a/scripts/lib/checklayer/cases/bsp.py b/scripts/lib/checklayer/cases/bsp.py
index 7fd56f5d36..a80a5844da 100644
--- a/scripts/lib/checklayer/cases/bsp.py
+++ b/scripts/lib/checklayer/cases/bsp.py
@@ -153,7 +153,7 @@ class BSPCheckLayer(OECheckLayerTestCase):
                 # do_build can be ignored: it is know to have
                 # different signatures in some cases, for example in
                 # the allarch ca-certificates due to RDEPENDS=openssl.
-                # That particular dependency is whitelisted via
+                # That particular dependency is marked via
                 # SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS, but still shows up
                 # in the sstate signature hash because filtering it
                 # out would be hard and running do_build multiple
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index 14d8c298e9..ec2374f183 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -5,7 +5,7 @@
 
 import sys, os, subprocess, re, shutil
 
-whitelist = (
+allowed = (
     # type is supported by dash
     'if type systemctl >/dev/null 2>/dev/null; then',
     'if type systemd-tmpfiles >/dev/null 2>/dev/null; then',
@@ -19,8 +19,8 @@ whitelist = (
     '. $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE'
     )
 
-def is_whitelisted(s):
-    for w in whitelist:
+def is_allowed(s):
+    for w in allowed:
         if w in s:
             return True
     return False
@@ -49,7 +49,7 @@ def process(filename, function, lineno, script):
         output = e.output.replace(fn.name, function)
         if not output or not output.startswith('possible bashism'):
             # Probably starts with or contains only warnings. Dump verbatim
-            # with one space indention. Can't do the splitting and whitelist
+            # with one space indention. Can't do the splitting and allowed
             # checking below.
             return '\n'.join([filename,
                               ' Unexpected output from checkbashisms.pl'] +
@@ -65,7 +65,7 @@ def process(filename, function, lineno, script):
         #  ...
         #   ...
         result = []
-        # Check the results against the whitelist
+        # Check the results against the allowed list
         for message, source in zip(output[0::2], output[1::2]):
             if not is_whitelisted(source):
                 if lineno is not None:
-- 
2.25.1


