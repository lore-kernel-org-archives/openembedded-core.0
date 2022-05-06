Return-Path: <aryaman.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29070C433F5
	for <webhook@archiver.kernel.org>; Fri,  6 May 2022 13:22:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9266.1651843367233543874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 06:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kNaLS6i4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=2125085cd7=aryaman.gupta@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 246CwirL005603
	for <openembedded-core@lists.openembedded.org>;
 Fri, 6 May 2022 06:22:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2aL2LzkF8LDJ+3zv53qeWIDypDgKJlgZMbKnRb6H0N4=;
 b=kNaLS6i41A9UovC5QUAexM/gr2DUrcdk6gpmjdVuKvPGM2fEu11tcpoj5C0+LsQBdE5+
 mPhphtN/+ubW5Ya5benB20tggoXesKMI03GxQAGIPLQLDLINgjqh+CjVOCrnr8quTa99
 PxEosLZ+3I9DqJvMbGl7Qo5+siOiJrzs5W9a/ClvVJXrIcJT4cX2+yrh7ed6wH9QNlVa
 yBd+GlNm3vZxX3OM/jZ1THymtwWPIs7b/MWP8bH/GwW3j6ibML3VsabtyEkqm6iM2cDR
 OtWkzXPTTEBbnMwcmfT5E+sQeDO6GpnG4wqJKqfXlWFXoDhEMorvCY1/K1jqzxQbPvZp gA==
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fs0d3cjuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 06:22:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSXnVaF/HugE+GxGC6fidoAmoXkZirp3163E8NAzAW2EChtDnF1rzd63BECDhwjqa7b8Rme+XwglaGeFZfzyhssvn2FsmZTtrLr+8LzgYLLr2p+jLFhKzZsbkjcaO8tisJW9Wfwl0dxeBdjavQb8XoSf388bt+ZsQXPqDoZ0mGvE2gJoInhijMXenhfi72Mi/9LOoxWkX2JGbhUEmdcPdA0VQihYRoW41tOI8HmJyd2i0unlmmtScvB8tZmpqsX5aZM5vfmLVfdE8NUx2OjLdRsQZzjjaQ66aH3kYlExhIhL195tgaXP8th81UPinYeMktusovH9l3PMMNRTWetCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aL2LzkF8LDJ+3zv53qeWIDypDgKJlgZMbKnRb6H0N4=;
 b=LBBxOrpw5bVJIZYQepM0sZsvoOhTPJZ0B36LlbxRBg/CXCZaHYHXLjgRQFGEXl/vqD8sWK71DlWfpNaJunXyXtTbpMXRiOvTni2CD7SCUWnPwvv/v0lE2FiXuKKtnurqHZz68lcgugQbvw/5kdX3Fb0aCeGH3xS4ArH3BsMNI9UHsc71/9RryUjtRiGUc3+aJ/BNf4CXEaWlbHacravx7HPHVslbmn7gccUzhUXHVta25gV6w+a097mQ87oVQlxD9pbwgmHbFi4u7u1eg2kvHp0z7nxEBGWe23OAtgAz1Ncn4YsN2lNQi+uPaaJQdHZigqDwQtK7v2jf5SFtgwnLJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19)
 by MWHPR11MB1726.namprd11.prod.outlook.com (2603:10b6:300:23::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Fri, 6 May
 2022 13:22:43 +0000
Received: from PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf]) by PH7PR11MB6030.namprd11.prod.outlook.com
 ([fe80::b854:f057:e8f9:f3cf%7]) with mapi id 15.20.5186.028; Fri, 6 May 2022
 13:22:43 +0000
From: Aryaman Gupta <aryaman.gupta@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] e2fsprogs: update upstream status
Date: Fri,  6 May 2022 09:22:22 -0400
Message-Id: <20220506132222.37627-1-aryaman.gupta@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::40) To PH7PR11MB6030.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4c49c3bb-dafc-4142-f491-08da2f638099
X-MS-TrafficTypeDiagnostic: MWHPR11MB1726:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB172662E452FC00B5C796377AEBC59@MWHPR11MB1726.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3MRTs73v6pxmkSua5UOWvprpurwZCA51sYSZl1ouv/LpsvBOWf9j4Rul3eQK4NIQa1JliZ7zaeCSGKLdsTDLQ38dSwo+EckXrc8jatSzLvpVLAFwf8m69f3ZFDlCRzNTJUDY9CHQiB6etclKkN9O+DtNe3wMyDPAMdf6Be3zvlngPKSwsI4EyABl8iXDUZhZb1bfYeoAMmY/+QBO9mymWDUf7OUX3RJvqrRL2pHU93GT7jRRa+fpRAT9x338G3Ek6+UkA4Qp0AZrFHm4OC6+mJJrbp3AutsKaBRfSdeJAA+okpuqsKR1tH2kPaWP5jW/MDCu6cxzTEwMZ/BTYUBX5kYYF2rWAc+jKBjy9lwUW9I7C+hexTjMltVp8TStMenrec/HCNx+BHHR/yuIYa/fazQy0kq+t49fzncn+10V6yIjixdEUNZqToFr03xDCdOBdLPCX6FwR9mAu2WQ7p1cJRz2GKOnkzACNXArUf+R/+JxxDgbnxY+TNIn6Pgy2AWUDuSLJXLEFgILBxA8Yf/UvjFQRhk10IGGWcwp15QIaM9fm7we4c7EXReDXszh4twdV0aVx1FOXg6vHlyypFvPBDF2LIs3kgF9njHeJizOxGBD3W+uVjIGIRw47kDpieeSPDx5SXtuj1Y3hZjWRJsIvpIoKe4f+L9Dfo9nsDrMJoiqZOBf9YNcGBUSC/qjfYMrDJTdnkFJMt6MV6LH0PbY6J/J+6sgWRMZTj/dklgvu+mOd2jNxXT3g7NWjWiEJSV+bA3ULMKjeEYkaB/wFyWXHPAnjHETDe3JK4jT5PXi2vY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6030.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(52116002)(6506007)(8676002)(66476007)(66556008)(316002)(66946007)(6666004)(6512007)(38100700002)(38350700002)(36756003)(15650500001)(26005)(6486002)(8936002)(2616005)(83380400001)(6916009)(5660300002)(44832011)(1076003)(4744005)(86362001)(508600001)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lbuL1fiNmV6+C/V2RCIgpJ7sMTUKUYaG5Wxd2rWe0QN9ho5PVwIXTqd1Ko/A?=
 =?us-ascii?Q?PZ1zv5U+8A3cHMJwTSDTi1GV3LQ3Lw7Wz5pJtzf29qZD86xb3rwWySWBSprg?=
 =?us-ascii?Q?q/cAfYGf55X3jJqomvYezNdf/22ovkg131IBj/Oz2qjr4YRH3HsVFeCPqvoS?=
 =?us-ascii?Q?SpDW8HF5kBx60+ET6r9iLr94Kq6IOXrRnENfaOueZxKlvx2qxcnW8IBw1qsL?=
 =?us-ascii?Q?bWayM0KSBMwVazY0tYtCvY+cBRnK4gXyVzKxGSJCumUT7kb91uV62Hn121u+?=
 =?us-ascii?Q?vEhs0LRwJSEZD84VetFLMh3dk9tko/v6M2AvuQbhe/Cu5oWKPcq0ZnVhJz82?=
 =?us-ascii?Q?RMrPb81bTp3UPNsbJE5LZHu/vRkpLGsuJO1eA+yDRoApsfcjjc9uMsC5hD7x?=
 =?us-ascii?Q?rqBF4oMqMaVbQ6rV9/TXO5PoPnU7SohUb8twnRAxmFDT8KbINiCtvY4UrfK5?=
 =?us-ascii?Q?s8/SCak5EUj9Cr6V6hJF3QYuc2h+PM7ydsbNQPM3gsPI/wrcNJsZJsg5h63R?=
 =?us-ascii?Q?muGwXH6LxHuznoCjOlzz/Il9sRfvA4yIbWS+PsLNHNojqFmmy94oyAoQDkS+?=
 =?us-ascii?Q?sWHeP9llREkUlP7JsMqcucyQxCXlRK/I6DuVk5aorzGrc0616b7UdP9NI/1s?=
 =?us-ascii?Q?L1ZqMGc/O8zz0JkKYxzksp7UjHQ5HDTzO6UtvkxMEEPMy04b2ZXDVBGIf/uW?=
 =?us-ascii?Q?NkdXosXcylyE2mtJBUA7DTENMa7zvxwaIye8h5JKg4eksuRxAhvNcaCeLX2U?=
 =?us-ascii?Q?G9BmJSnKZpDvaSo4ApDzyT58MWaqQ4UETNJItSvoOEz8Ff1KQw6t/MXvOWll?=
 =?us-ascii?Q?Y3oo9reuNJMs61leij2hMrCEm9vxaTbNgr9JRIgtY6lx+tHJEgD+lXqc7WZf?=
 =?us-ascii?Q?Iq8Fk8AbwusKPOxi3LRf/5Hl4haFz0GpKEcAjaboJU24Opms7jKI9U2VdYl+?=
 =?us-ascii?Q?RVcAHLgMYbx2pUwYnBU0ispUQ+AG/v2IdXRGzi2KS2/4S5cs1ff2HGR8LrDs?=
 =?us-ascii?Q?GVWaZI7jyrsue2KhbFwP6EbY/4GAvdltiRwv1JB71MOCzFCS/Ia6iGTo7OoM?=
 =?us-ascii?Q?+52eevFrDnarNWSkCdWXk/9uXSpj8Pn6icxfxUjhZ+tIAPb4Hkwd1uQUgloM?=
 =?us-ascii?Q?VIiEUVrSW2sbhHesuNYM4USSCMZfzBJptmMCFTB5dspRqcgFBam0uSqrtWwE?=
 =?us-ascii?Q?M5LyEbCOPDjzwtrh/tqPQJxiOdbQZx96PWypHipTpa2hUJu8dHQfJntf051F?=
 =?us-ascii?Q?rEn7JtwW3xGEJBenv7PyQGyBT/fs1I0n65D1HiGGBaXOENuoAL6LiYXktIPg?=
 =?us-ascii?Q?mK8EnoZjiPigOVWi0FfdUD1InwnZHz7xFPyZ/uJhy5aAkc1ZBjIVGy6LrMfR?=
 =?us-ascii?Q?uiGQerZWTvL8SRZwbyF2LoSml/e2DBilPAmICVvcyT2JP6DVs6RBewsPWf/5?=
 =?us-ascii?Q?voA9qnnws5WEnyv/Jb+bGAShC3sLZt+6i/5B053kx55ke7OO2ScsW5qI6mw6?=
 =?us-ascii?Q?JiOzAOK9cu1rfUsmlaGTRe3Ki4VkcT4qYlm6hOS5JC610PyLCvX0K/V1EgXS?=
 =?us-ascii?Q?M/U8pQzuy/IOpuNUAZ1qMj7JKFfBHpQudoWL/6s9FRr+F4NYgvKD6GMP9vv4?=
 =?us-ascii?Q?7Pp30d+XfvkMfpveOx7GfM0r04W5FmwIZXfH+q4afLUN2HBG8ullucfHI60P?=
 =?us-ascii?Q?cjSXbuP5OXKzoOWO0KGVJQXsScbR4RUEYrrZ8EskkbT8+U5/QddORmQI4aWz?=
 =?us-ascii?Q?mRz0qRMmmnXWAV1r8isPINAjpkx6nzM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4c49c3bb-dafc-4142-f491-08da2f638099
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6030.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 13:22:43.4687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LXaNx3KSR03ymqCSIadkYrO79y2g+tz4vX1eTERa2A86RKctYD9lruUhTlDz7loRKNcCNSf6AzsfT5SKwqYQAATOQx8Wg4JM6AL10D2rHzk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1726
X-Proofpoint-GUID: Pw77pq1SN3kt6vDuhlxjzaxNXHzuJ0cv
X-Proofpoint-ORIG-GUID: Pw77pq1SN3kt6vDuhlxjzaxNXHzuJ0cv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_04,2022-05-06_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=629 spamscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060075
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 May 2022 13:22:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165337

Status updated but using the existing patch since it is functionally identical.

Signed-off-by: Aryaman Gupta <aryaman.gupta@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
index ffaecc622a..2c09bb276d 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/extents.patch
@@ -1,5 +1,5 @@
 CVE: CVE-2022-1304
-Upstream-Status: Submitted [https://lore.kernel.org/linux-ext4/20220421173148.20193-1-lczerner@redhat.com/]
+Upstream-Status: Backport [ ab51d587bb9b229b1fade1afd02e1574c1ba5c76 ]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
 
 From 347084c9c1ad20f47dae16f5a3dcd8628d5fc7b0 Mon Sep 17 00:00:00 2001
-- 
2.33.0


