Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AEA0C61D93
	for <webhook@archiver.kernel.org>; Tue, 21 Nov 2023 11:51:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.38033.1700567492404270732
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 03:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ciP/xJXh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9689cbffc5=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ALASEm7025999
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:51:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=D4tUGhxGsR37I0qEWm
	n7N2+rvaMotPMXVZkFYZ7g+cQ=; b=ciP/xJXhMqb7Gh9F4YKWVFaybclj2klEcO
	U3/3PQAr+WCFA6ZKqXZdwxEHaYn2k55Knzr8IpRNvyVAKHvVliMhsjAJbDx4pbRa
	P3jL+g6wNfoiW8koTIStr6ZeQAgFdqnnpr5iGXsKF1UoXsrKbjhmxGm5CGxtQGNh
	1euQoBrAePsS1ItUeo23tcUWmtDftfNl20DyFwr+Tv2Ki99+63dGleIxUKj1BftQ
	cRDhud5JQYv6oODMw35H5kn+kQKNGvFl9Vc5A1VZHUjXw6gd/Zlb+atCDL0bX4hh
	YemaiIGDOH3PdjO/ZQmdKZ9ywFjbyNgP5BtnwRa8klqfyrV7MH2A==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnkt6aj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 03:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z32uWB4oa/bR6k/GqNLgrxCYa/L51D5F90NWFt5TgmlRp1KflpMgvb718bdTBvDdoBVwlb0Jtoo/pPT9jMlgAT7njZ0Ep9BpnHrumTQtOK/aWPpbyaojib5dTZYv/OH06O1pHlC4AWhzaheWdEKBm1G5bbWuHwe3ryU/nwQmb5M8CVcGK+H63PzLJhRCRilGAyxahfxoL96DX5rEdjGgvlN4UT/FAre8/1eJ9L2qh9WOkSIBgs45Od91qyM/nwFkzHpID5Sasul7QXyi2kULeNsgqGDuXvFOBrJlLtqiQ5Mlw4s2uiRxDJ6D3LmM5CsdJBk1b/B+ZTqESBsdRp7FZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4tUGhxGsR37I0qEWmn7N2+rvaMotPMXVZkFYZ7g+cQ=;
 b=jikeZ7U5DINRucgn9njaJ/73rghrO4hL4mkLjUS9WGStdLsEFCLXuFdQOutZjWZIpbCzPlDEX3bCuu1a8rAYfG8jC53MVmnZBh9Vhx8kDvY33v9oyVIGoJn+qfbxixZCxGl2df3GOyA2V4nDKZor3yE6gf/2v8Gx4iakbVUBIe5NdwxKiZmZYtkZkKpM+HZTTGZ+u2XEN4nxuEtE0yXWe29xjFOcYZLdqATJs0XDGLSkjPDcoth1mfZ8A9d2+p+i6yBLWEiTQF8MPMZdNoxxYr8lKi55Uyp1M84w51bmP3BMMpWO3+nrgHCTvqPrtSv6L7Sf+gh/vID9qoJF0AiJ8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by BL1PR11MB5478.namprd11.prod.outlook.com (2603:10b6:208:31d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Tue, 21 Nov
 2023 11:51:27 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::d722:19c4:2468:6024%5]) with mapi id 15.20.7025.017; Tue, 21 Nov 2023
 11:51:27 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: Fix CVE-2022-47007
Date: Tue, 21 Nov 2023 03:51:13 -0800
Message-ID: <20231121115113.200854-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.42.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR20CA0001.namprd20.prod.outlook.com
 (2603:10b6:510:23c::15) To PH7PR11MB6449.namprd11.prod.outlook.com
 (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|BL1PR11MB5478:EE_
X-MS-Office365-Filtering-Correlation-Id: 32726f96-92ad-4267-fe83-08dbea8831dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	or1NsT2IHDBHBiCIXtC3CZ+xeOCeWdsjC86Hpoo4yyIpk31C7/NY6eNb6Wa7X+CzrFkrDDqliLCwEUMEQCYZ6xGm6BRXBqVI2JRNSB9CuY+aK1jIPdYUa2ceuOQULKPUNDfAgRM2QHn2zFfpzC9Y4VEQINuWER6kJWJJYeHtd6n/sRnKObQeVEYEl9c51vrZTY3OXuUTMcmOjIaPOaNu2kQcu6Fxi/b3SIO9xySpJe8QWLy4wjpQ47efkw0JyjP2Jw6d9MhiNl9P68SiNb9sershJ8MJKhzrA8hovOZV/awKPVz4c7Oek4tUni8HamG/Ep+woQPaAnNIofRF6YXoQrVubqTw3h3pE2OwxOs0k7ALEKyzk9D+aRl9CMDxaMJTqyaOpiJtGd7cLeYQXduwePnT6btUaYofAp7791c96rpeI9Jk0/N1YHWN7mduSRwcG3yGR3l8lzyssK/v0rHOaZAPUo4PtESlYTOD+GjGEZFVpNMtnAWR9YJN5oHf4wSLsYK7KspWj9ZGnt23YmkZC+YKzVfgTc+UtI80BWb8Lzk8o/rn14yAFyh4XPXafIKFqZpwftDFGJwQ7GA8yLrJsE0HCrIJy9HFBHNWFtXZ2oI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(376002)(39850400004)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(83380400001)(9686003)(6512007)(52116002)(26005)(1076003)(107886003)(41300700001)(4326008)(8676002)(38100700002)(8936002)(2906002)(5660300002)(478600001)(966005)(6486002)(6506007)(6666004)(6916009)(66556008)(66476007)(66946007)(316002)(36756003)(38350700005)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ztx4HQYWfNB1Y+JEh5QimfF062XTra9lpuCUoYIswNRgWIT+LbhR82IBId3c?=
 =?us-ascii?Q?L8ArMW58a3U/BbXmupaKgkNeO7ohmfGznToArdIHm6+hfMTSV+PosQ02gmD2?=
 =?us-ascii?Q?jZuyvQpXDTE6Um0hrC2tL9evtFcsJnQhV/CUEYk/Q9tJkAIj7xGIcyOBxJfE?=
 =?us-ascii?Q?meBfuUobNN+vX1eauds2nngGQwKF0X0gdXKQ1gjGWQam0afK2+uEJ0fAK8+h?=
 =?us-ascii?Q?EF1a+Gd3FzmeFAEO34lQJdOq6yUbVySHtgNsZZh8uwgwuEGVdn5Hl0RRWAPW?=
 =?us-ascii?Q?2weAwaJ9mlR+xXylVrE8WA9smyVdcO2aF93XwE1ci/CDgAc7qZzNQr0oAB+6?=
 =?us-ascii?Q?/M7P/lBmfG5jMS80rVZ09osG9+ydHiALq7LvPH1koFSBSOsOyAHjuGkYbPmW?=
 =?us-ascii?Q?H3Fmo0x3OfJtqpSeNVom+Md/8ffwsZYHH5vD9MRSZPbG5wI6E4rONncuY7uK?=
 =?us-ascii?Q?LLfyN2p6sCHiTCDjyMFyGNcFILXqiGVL0tQC0aSPI9xufPfNM+I1nk5OnoYj?=
 =?us-ascii?Q?DkyvYoIn/qgD+A5CWAtVNBp6Q5bPrQgASBWPMUpXRHWCe/GwHtljc1elfbWq?=
 =?us-ascii?Q?UyqgYCp8rwAFwGdcFxLOgmVdqHdxyZhYH1W7RlbdAgAPECCUrr+QlGy1B87d?=
 =?us-ascii?Q?8bn/erH0NW0xuEV280sSivzZ6/Xk80teMY9JBBWDC6kSyJCa5m1U2p6iFEAm?=
 =?us-ascii?Q?+YV0HNfoLxBC9tZ7YBr+KxjHW7KpHUQe6xbqFfepiFb8BPc7PhS6H0bp8w0c?=
 =?us-ascii?Q?+j3TV/FpsRKGG7YLmNW3MBvem6C8InX/R6AZBwbJkgZ3NLbuXBZET5wIwGE4?=
 =?us-ascii?Q?NEJ6+jTzuSjbu2/MBXeII4BLcsrPX3gMUWXnyH9bf1Oh0aSncwu5H/F89CFf?=
 =?us-ascii?Q?rRQEjZ+nZb0l4bFEZSkb0KDM7AGlal63R0IKqzp32/rh0AAANeSIVANn62gt?=
 =?us-ascii?Q?tgLwB44R/0NcA2SAq96a6sPhFNgpGoGkWePuCJLlzaElk64f/1M/njTLrBca?=
 =?us-ascii?Q?2JyBPE8uBWDHsb5+IKLemmZz/XMmfdTbhliGtSKstucPWgh4ua42ligPo2hr?=
 =?us-ascii?Q?JMR/0V6n7F8LIdDDtLBaaSe8EMBcPm0AV+1Ol516UxupMkNkHRrW55kA3J2x?=
 =?us-ascii?Q?smtNGoo2h9r1COXQ25+tvDI1A0vWD/USCh31jJgKnpL88OrGRWuqvRmmpf2X?=
 =?us-ascii?Q?TQXtozzT/YvtXMLUjHTWtvtnjTyC1MpUyBc/YCPxJTjFjYAr5VALO25M/Dsr?=
 =?us-ascii?Q?PrUGigAta/t+U0qToMsCyGDs46XKaHwIg1Gqb9hyc9Sn3u6TdhawwT7mIULR?=
 =?us-ascii?Q?IsyGOJpjDnZ+ED7kPXLKqq7QR4G5cCbcoxrqUuOIM21qEJ52nJ2quTeLEWup?=
 =?us-ascii?Q?msUjIeZKa4AOEISdNOr2lWYvZsVMKvtvo7ccIlyz4uTSWq6kKjoHhR66VrIm?=
 =?us-ascii?Q?bFS2hws+L0uWkifYFYKgn5ORGHJEJ9LfOWeb5doRhJd5AzfWB62zej3ooWJW?=
 =?us-ascii?Q?lCmKsoGvaa7CkjXk04TLQmo6FqMIu/hhHoGLU5moSjK0SqVdIYm/y2tZWQ9m?=
 =?us-ascii?Q?DrKSIOdV2JtbzsnsU5CZrf6/Y2PiVPB7xLHBj3wkzkkSNatQag2WrndHMjOI?=
 =?us-ascii?Q?yA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32726f96-92ad-4267-fe83-08dbea8831dd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 11:51:27.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fv0xy1ErV8s7UlvbhYW0WqmhPVo8J7YwMJ3Q03AEy6ADaN50+mv3xVbwhjG9lupdJSmKwMpKyQPwK3JwhxsaX0uFSJAKe752sqJ1xcZKm30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5478
X-Proofpoint-ORIG-GUID: tlHr_jxYYjA8tKLckzNX-zb-Wlfe7L4e
X-Proofpoint-GUID: tlHr_jxYYjA8tKLckzNX-zb-Wlfe7L4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=689 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=4
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311210092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 11:51:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190971

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../binutils/binutils-2.41.inc                |  1 +
 .../binutils/0016-CVE-2022-47007.patch        | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.41.inc b/meta/recipes-devtools/binutils/binutils-2.41.inc
index b4934c02a8..bba87abba2 100644
--- a/meta/recipes-devtools/binutils/binutils-2.41.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.41.inc
@@ -34,5 +34,6 @@ SRC_URI = "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
      file://0015-gprofng-Fix-build-with-64bit-file-offset-on-32bit-ma.patch \
+     file://0016-CVE-2022-47007.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch
new file mode 100644
index 0000000000..75ad6ad3ba
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-CVE-2022-47007.patch
@@ -0,0 +1,35 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
+Subject: PR29254, memory leak in stab_demangle_v3_arg
+X-Git-Tag: binutils-2_39~237
+X-Git-Url: https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb
+
+PR29254, memory leak in stab_demangle_v3_arg
+
+	PR 29254
+	* stabs.c (stab_demangle_v3_arg): Free dt on failure path.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff_plain;h=0ebc886149c22aceaf8ed74267821a59ca9d03eb]
+
+CVE: CVE-2022-47007
+
+Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
+
+---
+
+diff --git a/binutils/stabs.c b/binutils/stabs.c
+index 2b5241637c1..796ff85b86a 100644
+--- a/binutils/stabs.c
++++ b/binutils/stabs.c
+@@ -5467,7 +5467,10 @@ stab_demangle_v3_arg (void *dhandle, struct stab_handle *info,
+ 					  dc->u.s_binary.right,
+ 					  &varargs);
+ 	if (pargs == NULL)
+-	  return NULL;
++	  {
++	    free (dt);
++	    return NULL;
++	  }
+ 
+ 	return debug_make_function_type (dhandle, dt, pargs, varargs);
+       }
-- 
2.42.0


