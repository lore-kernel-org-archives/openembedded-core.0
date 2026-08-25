Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685BFC61CE3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 00:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11823.1787618773981312504
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 17:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nk2kB2tr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ONb080158523
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 17:46:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jsN1qdWX8
	I8d+3fyQBgpNUJQbgUR6oruId5xQ5RVsAE=; b=Nk2kB2trTI7rxRAHqJFbe6MrQ
	B85u6oD4xFwPiEdXrH4C6t47eOGLeWO2mbnNGGPV8nJzIYgsqjHlXidq9THFvTJg
	FbdDU7aJsJt/EbJKeIgwNMiIFeayNtnfSeJsPbcXEuvPSXTBjeGBYLILOzP9AdmX
	1ev/BUSOinfeSUwS5sSZe+xl+uQj0fEgh8EiGOqhyaOx7JOsJ4/Zrcmr4SUUftP/
	Fx8EqjAuU8l+5DXDpdusJItxpSKxXnluKIUhDk6NU+dMk18s4lO1mAS42A3zKKR4
	xntmvI6rw5O8nIQv0txDgeT5voGnzI/HpS+h9urDFJzsfXFC0x4gKvaSoxXOQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021075.outbound.protection.outlook.com [52.101.57.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7b9gkdu9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 17:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bha4q0hVTI2U0hKOx2VKNeJzF/0SO8LZA8Ch4TEpaZSmWOhV3rEijHdEOzDfv/ObI82kifjveEYUtCIPL8S3ZbkU1OQAetbhUTCZCKrGM5SiI3BTOs0EFYXqrpFrxsLxY52YNnfTSaHXVNn37fQyE91z11yQBGi+I+oSSctEW0l50h8KDbbCD0fAq6GM+E0Y6AJTc109SXwidkmPE52pKAq7O+Hbo9gyIsrhcqnTlYg/0Lp3l08zH3rs5zCiRUp/4XeTOQbLRgS0Y9YKPGOXc2otZGhaeeJHm00vGo8NkKZ63GX32k63eqNrUR6OrO57Dv7zeA5+qZsvf5L2jFIlwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsN1qdWX8I8d+3fyQBgpNUJQbgUR6oruId5xQ5RVsAE=;
 b=caExBWYKZv2zSIc+GNi7t1cZiHcjJqNCamiOPBvUmeLTnSc8rbo4FPv29BrLulFR6hetZrhWFITjcHlnVYJze5ykTD67d7mGdF9MetHFo3RzWw68aJY29mlYk0dsoxG2hkZGgUnujVfUzhkCuDgUw9hZXb/x4f6aJxFTMyRQP4lIQP5fG4kj/c/LQJZ5Pi2ZYerzQIEv236ftxZ6gimUS7yPG0VQX6m0k1g2l9ZAX1V7F5o6J5gZUqASYJgKiAu3XjDnfLyjaEHapGk+9lJF4MtCK+Kqj5ffIvmycG7YVI/RiHeoHuSqLL+KMR4OhGA3LRkmalLM2zoja1ypt31sGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by LV3PR11MB8768.namprd11.prod.outlook.com (2603:10b6:408:211::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 00:46:08 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 00:46:08 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v16 00/14] rpm: 4.20.1 -> 6.0.2
Date: Mon, 24 Aug 2026 17:45:37 -0700
Message-ID: <20260825004555.4111831-1-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|LV3PR11MB8768:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c272ee-bfec-464b-fcdc-08df02424073
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|5023799004|56012099006|11063799006|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	stANJSyM8NaGLz7f1ncAj4PP5XdkquepgqVM2jZOk/kOlQI7jf0Qh9R28vz3ecqR4xJOmVN3flJFmDkZyZRsx6YS11Ou0c0qkIgEBQp+LK06vrUb1LSti7G2fFQzeJC6U3R3ThUHygwPe2bkg5GG4li2OgilmQV0JbfG99LdLNznaFJ92rzssmMQtQtOdZNflTppgwKoN5JDT00Zpe79gf8DcVSQHdgW26W56OhJaXHwR00PaAmwbc8x35d6GQEq4XU3SNq0KGLSBPhLXsX+z66jMy4hn0LX4KVrlckZnyJl6bw3Cq3FA5Gt+6rRCJxLJz/yekUjc9QYpD2702Wz/0J+R5VZ8bvBb5ylliWBSe0r1/HFZD9nJ3PCd/OaDDoJZgpJM50npX2BeXHSYsN81igj4wkIjXNCxWHOtTG2c5ZwVyEMTJM2URCF3HRdEIn8+Itc7RAeh2FF4uF2PZgHMQN018Y0uWngldSCQFa2ustHgX0WdgQVNbXkv1/FP0gxV255MYfkZY5oRTe8/bKRxvXxK/uJTqvyIpVP8uVLf6kXRZusH33BAl7MCBuH8OOUq8Dgnc6atPf5YxsPuKpn8KMOthexMMggnJ6YT9x+RpMT/MzNnxs9pT5XnaqWhjXD5PSHHMW65YBIDvcaN/3hVuWTyPlALMUiV8X81VI1MpxUd4fLl57dagnZb+XhD5LcY7S3UElMOmDq2huHh4zG0lowvde80iaq6yrIUFx0tyQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(5023799004)(56012099006)(11063799006)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6DFXugBqlf8fbydkly3cuax42FbEg0Da1e/LzKjLgm6LTbZyJZcXbO/wgWgQ?=
 =?us-ascii?Q?3WwUiWARyXcDE2xJ0nUacijCXxOTth6JlekAeHgBIycTcgVqYPRwlDWSJd1/?=
 =?us-ascii?Q?/c48awqH/3wQaQPU1p/y5nCpFmbtcaHFp31BZpWRLh0cNTUjcbxxR2cZ+ddz?=
 =?us-ascii?Q?jRxgsz0wTVQSq0Pwze2MV/4IIABuWdyNrXX54C/pKiEUdM9MAmOtU5AZlY0F?=
 =?us-ascii?Q?IBzKyqJ+C8TWV8sv0v8FjfgIr9V1HeQtWIQeS3iqYp/seBN/cxesGtHG2SG/?=
 =?us-ascii?Q?nYfPb+4erHT5w0W2yF94T7lYuAsFLZnMsfoH7y6HwkdMWz9TojTNRzWoqm6Y?=
 =?us-ascii?Q?O0a2WoxBHzfaz4H6BAzk0icQpUbRYIbr4NhrO+cZoawGEfN6XHOrsjwBisKB?=
 =?us-ascii?Q?XynzEEDpQXo04DXYCWnGByOa3qK4+3iYl/YtS8giMs5IZxaY1x0uvlOY97q3?=
 =?us-ascii?Q?jvpD5thasSE5Pg8r4O8rKMzuKiO8IhT6IpGZgBH/5JtK35kaAXMqeRosjcZJ?=
 =?us-ascii?Q?3KPyutZ1aTCRh+e5MrAlwqNA4O/opwdyuNRpEsELnq1aSRRunCD9/JBoe1iS?=
 =?us-ascii?Q?vcpamrSg1RfdCLbmDeKkCYChwztVq3cCAjIpeu1IuOCvQ16aJ3xkSknWOKIG?=
 =?us-ascii?Q?rU30tBrwqpTiotjcJpX0jfIjMwoleEd8RWSRYSkDek8t1jywxU1uZXlauxa6?=
 =?us-ascii?Q?++6e8tQxpDsNuKkRzKVyzYnc0jjowy3k6KBgk/T4YJr1kIYj6vB9I7H/4Jxo?=
 =?us-ascii?Q?2oZOMpyQHpFdxollazrTlSEsYOl5mptK98rLr6LvfAzMCvlvP8pKCiTzCN24?=
 =?us-ascii?Q?9BL2neN3cBApfiCQYyeMZsRi146nnY2I1ihJQL2Ajk6Qvyf5xRUg/GW+S34c?=
 =?us-ascii?Q?B8etSRSQnGIQ04ulgm47aQgtV6wdi+f3mDPIb5h9ktzDsBSg9640B3QYL2r5?=
 =?us-ascii?Q?aWI1/mjTcbhsd8GoRqIYCd9LTm7EzaTy1Jt7H9K/3S4bgGFTcg2pwxwwK3a1?=
 =?us-ascii?Q?yzQgf1/pBZ6EnAY9lwVIO5QYYhH4GlbcUr/1nzR/Jn9IkvAdsWeeDhruoUrk?=
 =?us-ascii?Q?XI8OrxlGvEo+PI9mnRyBedOWxiEM2qdMuxeuMOFsN37LIDdoQX3wFrzJ0o/L?=
 =?us-ascii?Q?LuTYQCkL8FA+9RpXj1ZdG5d1/IGMTDFgmZMzK7dMEqWMcmk5blhVYPk4wqam?=
 =?us-ascii?Q?RKQhF14j62eOXPDci8Tuj+8du7mV6zdxIm5X2cMjDv32xQgorfMCe8sTl7bN?=
 =?us-ascii?Q?YZMTyv+Gi4t1NGq91mb/3snH//jXdWlBrs0KnNRmF4nmqg64/Jgg3CBff7Z4?=
 =?us-ascii?Q?/Ge77UkBL07qVvx/hN9Il/IoR1j7eEdri7qtaKOb/0LS0rpO8I9/KeWjts/M?=
 =?us-ascii?Q?UUFayR7h9/7rTkyjuj/K35YWQkGpD/9O1ro06ZxXoK8H2cclQ2gfxQkkJ6oI?=
 =?us-ascii?Q?8xGjHAb9olAtUEnFhbuyRVkaZkV6UkZDOaeYzJqRJXfuqvseiGYS1NHf2j6L?=
 =?us-ascii?Q?VaOp9UNwSpfSq6Z0SZ/6OdxxOmK8BBAADbzFKVmYOkW8cLbF4X5LHahrJM/A?=
 =?us-ascii?Q?XHyYsPkOqllM2PLGB99AdSispz3u8hDGOyC+8tHn9qqQr6H5bAGm1CgrYFuT?=
 =?us-ascii?Q?DJWByRDEBkE2P66A1wV/EU5kM4K6x1sWBGlXxazbNPWYF9OrIoivVH8awfRt?=
 =?us-ascii?Q?JGmxo6jrkeK2vOyf7vAMLtnjFfUY21B23aSL2aTnG2d/XTIWCU9AuGHdcW50?=
 =?us-ascii?Q?cxyS5bRi++XWgHsPK5qEf64Q9NRdXI8=3D?=
X-Exchange-RoutingPolicyChecked: 
	VQ8DfPMMd94JyB7iFqEl4fryIkjf+Ri9V5Rfg8Cyc8RrDLHEKb+qD/UxN5+mNEjzql/lrY4vV5BXsjo3kX74VjUpVofUXDbsfHx6eCx8yUslo+7us5w32vPgz00D4jh+X3sJ1MalkvrOrF2tal+tLPFu3riGEDa276t62OlZBMZUmBWyzxjyxHuP1kRgy4usxsg7GHMgu6iILNvEBpBNCs9yY7GP/js25+95Es2AVnCZ/W2MVB5hMrkVvPjV/2UXBGvGX7nlcXQhIlXDlGlrZmHw5wOP3Ohh9J8+jXDb3iVsKpuujkR2JZiODtbBwP0miSrcYkvzrsuaT2jrB3Astg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c272ee-bfec-464b-fcdc-08df02424073
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 00:46:08.4524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 447pfCOTQwz/+Og7RAV9IuVklhSpHBLwfRCDXyx0wdcepJJC2GqVDnzsuftRar0PFxvmb5kkK43mKYzmvuzk85nqx6ny2WtBW/I2iuQ5cfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 7o_Dp9pW9OIy1anFoG8ebHkl7lEOH92k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX7EnmyPoxMHgA
 oyNPRcth2RsWdxD5a8681ZoblATV1EyFQsIUPw65HJShZdsDo384dV9VSeNLnS1d8pRkhCm8top
 1WjUvKzIPGyEjDiIZz8b9RwsVNivGQkU9thb+5TCZ60np1Xy1W/iCmr6RtGaZ1wVu4/1jAPTRep
 Sl+nkZ54DurpaXV2VHYe9+m9PK3B4TPchd4UlOGVqNooKSqr5efne2znXTnYewK6oTWYx7pA7hz
 83Mcock3//Ks9mbt0YaaaQOhSnHNHAbhDmEbq1RnZnjYCU/7x+vDMP1fVqeAtfK2Re9GDqrxRl+
 kWfmPSQvXfK105jllKW79+xPgRBLnVTNNxbtg2UYT1f9pru0DvWMis+TiX8MPSoTWZycuJCuxJa
 5ComdkptBVDLVnDw/pRB1UgKP0BozQjvX0QnrkoDE6rm6An6ks1LWbqNUw2v1VdRXh1dQ0rAnK0
 3cRFPMvZfhzXQzse7yw==
X-Authority-Analysis: v=2.4 cv=LtaiDHdc c=1 sm=1 tr=0 ts=6a8ce5d5 cx=c_pps
 a=aQ32ZPuKfpH9dcZYVOilFA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NEAV23lmAAAA:8
 a=MgDwocIahWBvzQjp8rEA:9
X-Proofpoint-GUID: y72SXKAbUqysDf0ku2ZWIzqereF9rHNx
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAwMyBTYWx0ZWRfX5shCqU89Vp7p
 yNe4+ztelbRYPLJtm9fSKah/okUVurdiNsizUw416aovGz0Lpn83tVSR+72dILjifivvCemX+T+
 l7tTTLyaZLr8JzXz/PQwWu/b5/vQxlpy632po1tScA7YAZlEvM2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 00:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244160

* V16:
    - patch 01-09: unchanged from v15
    - patch 10: updated - rename target path from pkg-config_3.0.5.bb to
      pkg-config_3.0.6.bb to track the pkg-config version bump that
      occured after v15 was submitted
    - patches 11-12: unchanged from v15
    - Added "package_rpm.bbclass: suppress RPM 6 fileattr dependency
      generators" (0013 patch). Suppress all RPM 6 per-filetype 
      fileattr dep generator macros
    - Added "lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on
      %post failure" (0014 patch). RPM 6 #3819 causes rpmtsRun() to 
      return -1 for warn-only %post failures via ts->scriptError;
      intercept in _invoke_dnf() so install_pkgs()'s existing 
      scriptlet scan runs as it did with RPM 4.

* V15:
    - package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
      compatibility.
    - lib/oe/package_manager/rpm: Enable DNF filelists to resolve
      file-based deps.

* V14:
    - Dropped "rpm: filter /usr/bin/pkg-config from RPM auto-generated Requires"
    (pkgconfigdeps.sh patch). Per Ross Burton's review, instead of suppressing
    the /usr/bin/pkg-config emission, added:
      RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
    to the pkgconf recipe so it satisfies the auto-generated Requires without
    modifying the upstream rpm script.

   - Removed /usr/bin/pkg-config from nativesdk-sdk-provides-dummy.bb.
     RPM 6's internal dependency generator auto-detects file-level Provides
     from installed files, so nativesdk-pkgconf already provides
     /usr/bin/pkg-config via the wrapper script it installs. Keeping the
     dummy entry caused a DNF conflict during do_populate_sdk:
       nativesdk-sdk-provides-dummy conflicts with /usr/bin/pkg-config
       provided by nativesdk-pkgconf

   - Added "libarchive: Disable RPM filter auto-bidding" (0005 patch).
     With both the RPM filter and RPM format reader registered, the filter
     intercepted RPM files first and failed to parse RPM 6 packages
     (debuginfod scanning still failed after the 0004 patch). Disabling the
     filter's automatic bidding lets the format reader handle RPM files,
     while archive_read_append_filter(ARCHIVE_FILTER_RPM) still works
     explicitly, keeping test_read_append_rpm_filter passing.

   - Updated 0004-Convert-RPM-reader-into-a-proper-format.patch to include
     the test_read_format_huge_rpm.c changes from upstream PR #2846. This
     test now correctly exercises the format reader instead of the filter.
 
   - Updated patches 7,9 and 10 for the latest master changes; no code 
     changes; removed upstream modifications   

   Tests verified:
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
     - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native
     - oe-selftest -r sdk.SDKTests.test_sdk_manifests
     - oe-selftest -r sdk.SDKTests.test_sdk_runqemu
     - bitbake core-image-ptest-libarchive:do_testimage
     - bitbake core-image-sato -c populate_sdk
     - bitbake core-image-sato-sdk:do_rootfs

* V13:
  - Added "rpm: Fix pkgconfig() Provides missing in cross-built RPMs"
    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh
    so pkgconfig() Provides/Requires are correctly generated during
    rpmbuild.

  - Added "libarchive: Add RPM format reader to support rpm 6"
    PR #3346 from v12 was insufficient alone. Added PR #2846 patch that
    converts RPM into a proper format reader for RPM 6 packages.
    Existing RPM filter kept for API compatibility.
    test_read_format_huge_rpm.c excluded (filter intercepts before
    format reader).

    Tests verified:
    - oe-selftest -r debuginfod.Debuginfod.test_debuginfod_qemu
    - bitbake core-image-ptest-libarchive:do_testimage (libarchive_test PASS)
    - bitbake core-image-sato:do_populate_sdk 
    - bitbake core-image-sato-sdk: do_rootfs 

* V12:
  - The previous libarchive-related changes for 3.8.8 are no longer
    applicable because libarchive has been upgraded to 3.8.9. Updated the
    implementation to work with libarchive 3.8.9 and applied the upstream
    fix for "attach filter to correct bidder".
    Upstream patch: Upstream patch:
    https://github.com/libarchive/libarchive/pull/3346/
 
 -  Dropped the following changes:
    rpm: lib/oe/package.py: Filter out /usr/bin/pkg-config file dependency
    rpm: Filter /usr/bin/pkg-config from RPM auto-generated Requires
  
    Why drop the old change:
   The filedeprunner() fix runs at OE's external scanning stage
   (do_package), but RPM 6's internal dependency generator runs later,
   inside rpmbuild itself. It re-adds Requires:
   /usr/bin/pkg-config regardless of what OE filtered. The old fix simply
   operates at the wrong layer it's like closing a door that RPM 6 walks
   around.

   Why the new changes:
   It operates at the same layer where the problem originates, inside
   rpmbuild. By setting __pkgconfig_provides and __pkgconfig_requires to
   %{nil}, we tell RPM 6's internal
   scanner to skip pkgconfigdeps.sh entirely. This is the RPM 6
   equivalent of what _use_internal_dependency_generator 0 did in RPM 4
   just scoped to pkgconfig specifically rather than globally.
  
  With these changes, the previously observed test failures have been resolved:
  - bitbake core-image-sato:do_populate_sdk 
  - bitbake core-image-sato-sdk: do_rootfs 
  - bitbake core-image-ptest-glib-2.0 
  - bitbake core-image-ptest-libarchive
  - bitbake core-image-ptest-libarchive:do_testimage

* V11: 
 - Added 0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch
   To fix "bitbake core-image-minimal-dev" Could not invoke dnf. Command...
   pkgconfigdeps.sh unconditionally emits /usr/bin/pkg-config as a hard
   Requires for packages shipping .pc files. In OE/Yocto cross-compilation,
   pkg-config is a host-only build tool not needed on the target rootfs,
   causing failures with -dev packages.

* v10:
  - The ARCHIVE_FILTER_RPM macro was commented out in a previous
    libarchive change, causing do_compile_ptest_base to fail with:
    error: 'ARCHIVE_FILTER_RPM' undeclared
    Restore the macro definition. The ptest now compiles and passes
    successfully.

* V9:
  - Updated SRCREV to the 6.0.2 tag.
  - Incorporated all V8 changes and updated them as needed for 6.0.2.
  - Dropped
    0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch
    from V8, as it is no longer needed. After filtering out the
    /usr/bin/pkg-config file dependency, "bitbake core-image-sato -c
    populate_sdk" completes successfully without the patch.
  - Fixed the filtering of the /usr/bin/pkg-config file dependency.
    pkg-config is a build-time tool, not a runtime dependency. Filtered
    the /usr/bin/pkg-config dependency automatically detected by
    pkgconfig.attr for packages containing .pc files, preventing
    unnecessary hard runtime dependencies in -dev packages.
  - Removed v8 libarchive-related changes since the latest version
   (3.8.8) already includes the required updates.
  - Fixed the "oe-selftest -r debuginfod.Debuginfod.test_debuginfod_native"
    failure observed after upgrading to 6.0.2.
  - Verified that previously reported Autobuilder issues are no longer observed.
    The following builds/tests were successfully completed:
     "bitbake core-image-minimal"
     "bitbake core-image-full-cmdline"
     "bitbake core-image-sato"
     "bitbake core-image-sato world"
     "bitbake core-image-full-cmdline:do_testimage"
     "bitbake core-image-minimal:do_rootfs"
     "bitbake core-image-sato -c populate_sdk"

* V8:
  - Fix build with systemd (Check patch 7 for detailes)
  - Make rpmbuild can find the pkgconfig (.pc) files in /usr/share/pkgconfig 
    (Check patch 7 for detailes)
  - Backport a PULL from git/libarchive to fix oe-selftest failures.

* V7:
  - Add 0001-scripts-pkgconfigdeps.sh-Use-pkg-config-from-PATH.patch:
    To fix "bitbake core-image-sato -cpopulate_sdk" error on Ubuntu 24.04 when
    pkg-config is installed on host, now the host contamination has been fixed,
    and the patch has been submitted to upstream:
    https://github.com/rpm-software-management/rpm/pull/4127

* V6
  - Fix -cpopulate_sdk error when DISTRO = "poky"

* V5
  - Fix RP's comments: Don't hardcode libc6 into package_rpm.bbclass
  - Use SKIP_LDCONFIG_POSTINST_FRAGMENT:${PN} to fix the loop dependencies
    between /bin/sh and libc.so. 

* V4
  - Fix loop dependencies issues for libc6 and busybox
  - Fix issues for can't find pkg-config files (.pc) on qemux86-64.

* V3
  - Fix Alexender's comments
    a) Suppot rpm 6
    b) Move rpm-setup-autosign to rpm-build
    c) Remove -DLIBELF_FOUND=False

  - Fix build for nativesdk-rpm

  - Drop patch for createrepo-c since it has been upgraded (rev:
    804a238c8a4e86c2bcfb2192d54cb861d5fd32a6)

* V1 & V2
  - Initial version


--
# Sumanth Gavini
# Wind River Linux 

-----------------------------------------------------------------------

Sumanth Gavini (14):
  package_rpm.bbclass: Drop external dependency generator to support rpm
    6
  package_rpm.bbclass: Define _lib and _libdir for rpmbuild
  lib/oe/package.py: Don't add ldconfig_postinst_fragment for glibc or
    musl
  lib/oe/package.py: Don't redirect stderr
  target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
  rpm: 4.20.1 -> 6.0.2
  libarchive: Make it work with rpm 6.0.2
  rpm: Fix pkgconfig() Provides missing in cross-built RPMs
  libarchive: Add RPM format reader to support rpm 6
  libarchive: Disable RPM filter auto-bidding and update huge_rpm test
  package_rpm.bbclass: Suppress pkgconfig() Requires for sstate
    compatibility
  lib/oe/package_manager/rpm: Enable DNF filelists to resolve file deps
  package_rpm.bbclass: suppress RPM 6 fileattr dependency generators
  lib/oe/package_manager/rpm: handle RPM 6 non-zero exit on %post
    failure

 meta/classes-global/package_rpm.bbclass       |  103 +-
 meta/lib/oe/package.py                        |    5 +-
 meta/lib/oe/package_manager/rpm/__init__.py   |   10 +-
 meta/recipes-core/glibc/glibc-package.inc     |    5 +
 .../meta/target-sdk-provides-dummy.bb         |    1 +
 meta/recipes-core/musl/musl_git.bb            |    4 +
 .../recipes-devtools/pkgconf/pkgconf_3.0.6.bb |    2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |   22 +-
 ...akeLists.txt-Fix-checking-for-CFLAGS.patch |   46 -
 ...et-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch |   50 -
 ...satisfiable-dependency-when-building.patch |   18 +-
 ...lib-rpm-as-the-installation-path-for.patch |   24 +-
 ...1-Do-not-read-config-files-from-HOME.patch |   18 +-
 ...-PATH-environment-variable-before-ru.patch |   16 +-
 ...lling-execute-package-scriptlets-wit.patch |   12 +-
 ...not-insert-payloadflags-into-.rpm-me.patch |   18 +-
 ....c-fix-file-conflicts-for-MIPS64-N32.patch |   18 +-
 ...kgverify_level-to-digest-as-RCPM-4.2.patch |   35 +
 ...ools-elfdeps.cc-Remove-format-module.patch |   38 +
 ...prefixing-etc-from-RPM_ETCCONFIGDIR-.patch |   26 +-
 ...Unset-cross-compilation-PKG_CONFIG-v.patch |   71 +
 ...avoid-using-GLOB_BRACE-if-undefined-.patch |   14 +-
 ...ge-logging-level-around-scriptlets-t.patch |   14 +-
 .../rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb}       |   15 +-
 ...-Verify-that-bidder-and-filter-match.patch |  103 ++
 .../libarchive/0003-Remove-bidder-name.patch  |  258 +++
 ...vert-RPM-reader-into-a-proper-format.patch | 1440 +++++++++++++++++
 ...0005-Disable-RPM-filter-auto-bidding.patch |   73 +
 .../libarchive/libarchive_3.8.9.bb            |    4 +
 29 files changed, 2190 insertions(+), 273 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-tools-elfdeps.cc-Remove-format-module.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
 rename meta/recipes-devtools/rpm/{rpm_4.20.1.bb => rpm_6.0.2.bb} (95%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-append_filter-Verify-that-bidder-and-filter-match.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0003-Remove-bidder-name.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch


