Return-Path: <ovidiu.panait@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15992C001B0
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 14:19:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9565.1688048342466330483
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 07:19:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ej+PG7mb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6544a6758f=ovidiu.panait@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35TCAmEH005056
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=kleWwHM5ECoQt1e0lC
	ul2jqyGCeUZLlBryeTlW43abA=; b=ej+PG7mbCRcjBKTlD0a8zYWs/chSWHXtUp
	7IfIJu99gOr9XbdMg1nTI/7fQrTGenzpOczRVEzN/UeoI0JLjZPQeym/H/3MqeXk
	oLaoTtCZ6By5EC3ANaY9aS19XkK/kC1N4J+uFWIGR55OpNMBl+c01yqr68hWElOf
	DGT+7a9WHXOewbajzVHuLjWTiY12Vks70MqMgESm0vccIoFETAfIUM0l8c0Y2P8y
	sPQOEkfROYGAG/OiAx+zWy7XLzv60YQ38pMMM2px2ieH9M0X+sP7juccG5bg9WkS
	DyQKItjRDaYtKaxYYH6lE8NByZnUbx9j86DDDaF1WJqu6IZkiiIQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb44ec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 07:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht2BmSRpk/CBZyPcPAKHHby0nuf5bIPAE3D8QdLmOq0psTCVcrA0lROIrXmdq2h+TrEbkRCvGP+h6xn+NjMf1/1z2Key1yWaSKBzBoRLb6DKfaNKlXRuqRnDONuIM97F+DjG2yaRIF04w8hEd5Blb2iSs+HfVT70ZQKooL/iYShxEVwxWGpC0jH80rcWv8sVp8vQZBKK7tzzZrc/a0S9+2cerjgWRu1AXk5bnrDyuQEvUhn1Bl+rsUJHFLZZMkn7h29CFH/ZYGLJkmmHIlnudIo8S2exO55BcAPYTuaDMllm2IYvrN8yIpsK/JxZ40FawB2I/FE0D3h3ypG2ZKW7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kleWwHM5ECoQt1e0lCul2jqyGCeUZLlBryeTlW43abA=;
 b=YOXvIZvUCwyX02L0E0FhjplOWMc04dO9ltu4DdUo+uOuXp1hnL6ff3UZMiNDm5/GfsW1nkM7sUxHyGIos5tz70mm/QNBlO4NWdJwbN9HPZsKuzYpi0aVE8JLei3LPhOfgk3EKszrpF10yhceSUYUlk79eb6vpKqxTfWZ5PafzQusUwysKTdwlUgXAq/kwTXVnBcJ6nSHwJbykmF/XOn0jDa6xYk6a3CT32s1T76orFHrt/Jh7tMowIQowyK6L8JX2gzlspNGjOPRtPgXdqZVucMLWNJ5LzrsPNeSy6r1G2ucJW57+fAtEnQZpWGb/JFReXYmlVoiKcbVMVJT2OvMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 14:18:56 +0000
Received: from DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949]) by DM4PR11MB5327.namprd11.prod.outlook.com
 ([fe80::3686:e9c9:56d6:8949%4]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 14:18:56 +0000
From: ovidiu.panait@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mdadm: fix util-linux-lsblk ptest dependency
Date: Thu, 29 Jun 2023 17:18:33 +0300
Message-Id: <20230629141836.3431391-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.39.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0041.eurprd03.prod.outlook.com
 (2603:10a6:803:118::30) To DM4PR11MB5327.namprd11.prod.outlook.com
 (2603:10b6:5:392::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5327:EE_|IA0PR11MB7306:EE_
X-MS-Office365-Filtering-Correlation-Id: ef541320-3ea1-434d-5c05-08db78abc60d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wMLaKm6QYIiOTdb+nENb7VHrvqDSMRQEFzCNgg/B8L/BCz993DHb9Djg16FiSUKyO7KG004yadjWvqZ24nlhZDXJ5qeKQAu/7DcBcGz8PLdP9zAEopvAvovw08zcEajWG1O0guYcD4OrPlL1qF69ldZkSQrQ1T3TgYF/HoxpI8pLrl4sN5+1w3B0C2LQTyA6aYh9ML2JKmvjZ5bgG2dpYI9atK/ChwjgNoa1uTFSaBB8BaRLJbLYa9k/9hf42Vrpav8V9lpAoMAHjStg6j97ukB1D3WbhIYVNAhlZifVYTlZQfkjpnpD/XauzVcSm8B3oMXkYKrAbKeAwa0VqMRDk/zFB7ygH329amBLMgJQ3u1fN/IzRfN/4yeuDTtAqU5z/7Gri5BTUxtclXgPfc2hLMfeH2LgenpeHGEP8eIwaUKCH3oQjjKgCiaeL++lNCmJfbzCp7sMMjvh0LLWUCr2oRo1wYMVLXxuA31d040+TSon/TmkjCIY3NvqgYgXpqYSco2QZT2EA7HjjSlOEvjsj+VeVq8Ax4EH24FlVRxhq4VxmxNcwQIXOlj8ihNfg+pxCmurm1LDbnBMRuVZ0bjeBEK44kS+3obxsMjlpD4kwUhZUAyMIjQi4oqyuR9EMghD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39850400004)(366004)(376002)(451199021)(26005)(9686003)(6506007)(5660300002)(2616005)(478600001)(1076003)(52116002)(186003)(6666004)(2906002)(6486002)(83380400001)(86362001)(41300700001)(36756003)(66946007)(8676002)(38100700002)(316002)(8936002)(66476007)(6916009)(66556008)(38350700002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+KL+9leHDwFACgW/dmPRBLQlY/2f3ytSBm2JcSgyus7vz0Bhki9QjeBs4P9D?=
 =?us-ascii?Q?RV6FtyIyfiLHCAqmxozz9GG7UOB2wtKEr72h5jkBvq7EVdbdIyOlaZ3rjvgL?=
 =?us-ascii?Q?6D57GEcKyxleU0zvYoRbS5jmj1OpqV+0/LpEszrrA3jko5Slj+mCbh2xWVPa?=
 =?us-ascii?Q?RcqWv7hVuKL/bgKoJC4RIN0NMHhtuxn79abPM+UtPRf560FOhCCntFM/QN3+?=
 =?us-ascii?Q?cEMwsr4JSexUHnCjx0HaY/d/cXoM6vY90Iogp9g7TZhIht6Glda1Rmy7I9PH?=
 =?us-ascii?Q?vhxsnXigkySnJH/Wp2cJcKQQPufrJEQWHO0jpAU4P2TcM4RObVfpWMAVHmZp?=
 =?us-ascii?Q?ed0e6rmUoh0AnFM36S0QXb/VH2VCBaC7dKKul5+RKWX4Jr7BUGnnnQy9C8Rb?=
 =?us-ascii?Q?pIMnx20UKMjjTYSKPt4JHkslFUo5ONoYJSr8HZJCv3wAPaziiOtdGxUGPZsV?=
 =?us-ascii?Q?FDB5ZbFZYXNQEdC+W9Y1thdv2+GkYifUSum1uRJYLDPakowZS5jwpDTmAMmv?=
 =?us-ascii?Q?LvTrH5HSTRfjRQjgMPlUkTtPHcTi4rB12GY/k82Li8lsCDP7rR0u/3kzR4e+?=
 =?us-ascii?Q?B+7uPOw++yMfAWo9640XImKenYnEzcen4pWFer6BRRw249nTTVcdOraScdev?=
 =?us-ascii?Q?37H3/zs1UEmmzVYjY46SbDi2WqcgxdjWfdSOEdE5YCHlgAkiNMNnFgxjgUOZ?=
 =?us-ascii?Q?wQ9zIsqHOjSkKyqBZMC4psqBIB8Otim9mQijgIBC7w5SOJ6Et174tdECn9zR?=
 =?us-ascii?Q?/D0qgs/OQ97wbJEGdAr2l0tOCZWuqpGNjQD0GTu5QiFWpWf9Hym0Zn6ULKWx?=
 =?us-ascii?Q?UFdTAs4wKZNEEfD7SsIyDpBwMkJBIbQBCJX68y9BycJHmye02wRJ0/rIxKey?=
 =?us-ascii?Q?6CUxsjS01dtbGa1cPth/TDKVsSTZ2QvjV3RIoLi/rp3KYXLMahRXQFnV9N3+?=
 =?us-ascii?Q?4WWMVFnHj23W83GOqd52ghBBs4+erQWVxSaO7sn++AUXHqTm1ebKrkcUsdea?=
 =?us-ascii?Q?EaXTw7Rq5Vb35Qs6D5ez4BQovXDS52y75JWe20i80QLLMiyMoSc0P7K1xQCx?=
 =?us-ascii?Q?Evw4z1VY1pkxjVm0LGlvEMK7dC3EjpxuS1vihyTth2SAttDZOWXbsIvcBwnK?=
 =?us-ascii?Q?UAZZuZBKID4ZM1HtpT+/UYKh/FKK05mc0L3xkDhERy+a8/5pSZN7tpGh/7+9?=
 =?us-ascii?Q?LFpNjw7ivKc9YhEv+aF/9AD5YOsGbN0VFxY8qESsGSlBWfpstyNaCwEAlaZo?=
 =?us-ascii?Q?8NyBNIyM43xS68ls8icZUwp3BqiNTzoBwN0Jvatr0U2Uylxu25f760Spz65S?=
 =?us-ascii?Q?MX4XB89wnY0VD8huxs4lunjSgwWr+TPvKkypmi0oEHbxhR9hlTjxSUUnXmiy?=
 =?us-ascii?Q?/Qjyt5ONFQVfwVdbueQ2KZGjSnlceH6RG6FjKkbTBIqn+MDS35Sy7nzA8WTC?=
 =?us-ascii?Q?DWgLbenm5bFmNi4pIlKjGMe0zO2Rie3YJB94Q5r9Sl13skaVCoMdHToq3vax?=
 =?us-ascii?Q?3C+q6ldN3DGZnLBnJ2Y4bbgh9us6fc4rQvNPZCLp+4gRIMH/ums5F6CELn3/?=
 =?us-ascii?Q?+Qs8037rwjjlytWAd5UXT6UNSg+ccwSmNMiRpzGs/6hqOe1G56O8a9YKVePX?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef541320-3ea1-434d-5c05-08db78abc60d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:18:56.4369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1mDMldmbxzPBPSuSWec2DRek4hIRAeQYLx4zH9UM9o7Ftv9K2DThjdBY6keQhOOWDcQKMuvL772Qf2UL3Vm0FIw5rSKN0PliAxhByGgPLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
X-Proofpoint-GUID: RWSxTCe3Ot7K9HxKNRQWeqLn4cj4S2Qr
X-Proofpoint-ORIG-GUID: RWSxTCe3Ot7K9HxKNRQWeqLn4cj4S2Qr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=651 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306290128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 14:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183631

From: Ovidiu Panait <ovidiu.panait@windriver.com>

Trying to run mdadm-ptest in a core-image-minimal build will result in:
root@qemux86-64:~# ptest-runner mdadm
START: ptest-runner
BEGIN: /usr/lib/mdadm/ptest
which: no lsblk in (/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin)
lsblk command not found!
DURATION: 0
END: /usr/lib/mdadm/ptest
2023-06-28T10:14
STOP: ptest-runner
TOTAL: 1 FAIL: 0

To fix this, add util-linux-lsblk to RDEPENDS and remove util-linux from
RRECOMMENDS.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/recipes-extended/mdadm/mdadm_4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
index 14de9d88c2..0a122b0b01 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
@@ -101,10 +101,9 @@ do_install_ptest() {
 }
 
 RDEPENDS:${PN} += "bash"
-RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs"
+RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk"
 RRECOMMENDS:${PN}-ptest += " \
     coreutils \
-    util-linux \
     kernel-module-loop \
     kernel-module-linear \
     kernel-module-raid0 \
-- 
2.39.1


