Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EB90EB64DB
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 02:17:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.163.1687313821130027540
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 19:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55360c7e74=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L1mquw017942
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 19:17:00 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9cbhtwca-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 19:16:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiXu+kpMk/6W4coJ88ha0rF4j0GgxllLN1jNIO2Klo3sPOSi1lyE0D5tUHZToYrvVmTGfg8SiXnkD6WtWk0X2E183qyN2LeeK4Qu8Nip8tOeXloj6C6s84f5vXxC4uSPXW45by9pkzulMj9JADHa/Jkg4KvogMY5A3LB/A76YT98UtuFrSlotF+vcrZ/2VUJL9c3ltQkdua0q5mSx7PMltKxMCcaoG3wYofYu9ioKvc++pYnc0kEXkoW0U8zSkHLetb3T+nlfn30oW++G2S5yUbvSVQDrkaNaymRFr/49GUqX3LJgfoVNq0qiXa16CTJ1v5mAs3wF3CTuVcLxdd4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mah5jTIg8xd8rxQ7Mnzkq5NAYaN8LK9PirmxKOtu1aM=;
 b=Q1nn9Ay5JunmVUNL8/iE248BPaKL6joinXzfnX4s1XNXk3zqdVinNYxBohpJ++LUvekyOITBk1NDM1Xn6fleSAR26dQ8pKPNoAU0t/GVMI3UBucOa6roKDdIds8kjlcx31UdF5eXHQZH86gVutt48fupamo+2CbJjuj7i8q7mwNwn3rTOz8oGQeg3Rp9ocJFg8TxXrZLcq/kx3mxZ+v9BvSGFMwKpAx2hL+EWbk1GfPUJCDf3F+M9jtF5n8y44eUh3Vfqk4w7yj7bdMMwsJtNQTUOabLrOiSoVfgLDsuZO+VHAznNnqh5guwIRinprbcs3lTKZbknfU7jJO+l9Jc6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by SJ0PR11MB5893.namprd11.prod.outlook.com (2603:10b6:a03:429::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 02:16:58 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::bda2:a93e:72d:6f64]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::bda2:a93e:72d:6f64%6]) with mapi id 15.20.6455.043; Wed, 21 Jun 2023
 02:16:58 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][mickledore][kirkstone][PATCH] dbus: upgrade 1.14.6 -> 1.14.8
Date: Wed, 21 Jun 2023 10:16:43 +0800
Message-Id: <20230621021643.1418328-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:404:56::17) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|SJ0PR11MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0e2600-55e7-46fc-acb8-08db71fd9717
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mcrl4y7MLrHbQJ77RVweX2yxSm50Axa4iJ6froOHvSihlrqIH61a7VdatDfMS23SwrukQblY2fDwqJkiTGkPBv66NjhsBOAGk2WpwGqSdNPo9deteHdsDf+0IeW8TK+VQIuNbuahZATh/nvKVB9Rj69S4s69Okph8sMHYmBWhJ0nJMcaX0HWMib3ie1mKURqpxU03pLse5SbtAzTfa8GElVAnlwQFyBRXEUA++vEz6sTx+EbRchnU7jznGisr6IelNg0nKTqnakieQ5JQ3sieAzwGctMGHjxSRPMt50psWSaXmXVgMxtr6RM/YxHIVt18byZzb+PN5KjANo37O74PpaNE+t7EzhjpI5szdtsPD1skNCsMH2Geg+rWXU6vaYdi80PaDw4tivOHR/PjVEUynaXIdeQyweHvgD+/ealPPm4LJI16wr8OFsHV0H1hwY3DrjpfzVSGT+0w4Aoo9dObNhZX0gU3X+nGb7zlF4Q60jCCwfYWOtmGikwLQWkqc28esm+FxypOdQERKxbpCxlIl3cS4zygFCaumWqtMpKMI+iVcPzaQX4lHaee9iqz+w3rmHp9SQCB1RWXtudO9iBhIrDhgNkxaU5Nyae9XmsxAg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(39850400004)(376002)(451199021)(66556008)(6916009)(66476007)(66946007)(83380400001)(38350700002)(38100700002)(6486002)(6666004)(52116002)(6512007)(8936002)(186003)(1076003)(316002)(26005)(41300700001)(966005)(2616005)(6506007)(8676002)(5660300002)(83170400001)(44832011)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UYiF8oIgR311wZ+I4kd5AOjNNQlUSXAxlylews+zpMxllacSx9rbp7yWjyec?=
 =?us-ascii?Q?ei32wpNjVLIBhkgKJwP+USudgciweRTxfGAivmVpA7Xwd5Een+ecpfGsZDhX?=
 =?us-ascii?Q?SHz6qzU93v2aBq16Pzcfk5ShjuCoHVnoUZcZTQsJx7X01W+g0FhLJWPxYiDi?=
 =?us-ascii?Q?8nDiiS4hq0WE5arbOjt2mKgQKdd3xCJDGxSbVh/wwUE8S5h6ajY/crGC+7xM?=
 =?us-ascii?Q?RNXaOttcGAtDg+P/aOx2NmGNooWVwgj7V1EP4EJy7kjpITqfdTlBBiuSDI1K?=
 =?us-ascii?Q?uIzWPh3i+SFSpf5uuWxmh1y1aSgXbSAWqkWa7QHOO32O0VPU5gLpb868599h?=
 =?us-ascii?Q?D+KxcD7d40zTqVPIx4WaCuLbwshguDinio85fgvwYYcnNKYu7jDUaqQ5a7Um?=
 =?us-ascii?Q?B1KV7+CF+9tbP74vwmkeCn3VIDdSyhRdhbUqWL81ii7cQyOvux1jnwc2rOf7?=
 =?us-ascii?Q?AIkoq4oN4XiwOlkzK9Ggz9YdTDEhclreD4XasJYjIG98LC1VeJ7W/pr26MNk?=
 =?us-ascii?Q?MEv8sPhm49fRRFZKhGlqZf24OIVrtPqODD2xKDB4+lWhRVUapGN179LTispL?=
 =?us-ascii?Q?0qZRXbkhJ5u7ibMt1EK8Ws7BB9fM4+xsodfYWaqZoNPsC4Ho/lz7u4tKk+0n?=
 =?us-ascii?Q?x/T2/4j7+cnQYTPAGSS9n6XLiQ+BHw/V5nMvZDLdtB6mJloBhTIBQl/+rdui?=
 =?us-ascii?Q?Ulz344j71qqFk99c1STBfhXgOBF7CMQV8HBAxKiOvTcFCSQn0Jm/JJjJm/oc?=
 =?us-ascii?Q?OLrQRwB1kT+6Vtk6TScBkQkJA3ArcAjvOJDFgXOP+jS98cVENCesEb/WcJ7i?=
 =?us-ascii?Q?eX1YkLRoqKOgPip1cUWKbvg74II6zL170aVl3RcqzgVQvAdWIOTiJcZxUsWd?=
 =?us-ascii?Q?AGW+R6Qj3Dzct/ThnCIZbijwbmNw0rjMGyyOTBevVqty33cAHOBd8EWqax7a?=
 =?us-ascii?Q?9v9svK7SLG63C7ZDxa0INQUGSDCQVVZfM+lN6QZxqnx5tgkKC07e+ouTWhnJ?=
 =?us-ascii?Q?PFqGPqpa8F24mO3cBtJns0gOc7PU5cFeQcVfNQj4s5pEt59ITn5Frf8+vqHo?=
 =?us-ascii?Q?/fqvoGqI1OpBNsBmJPDmnbMqnT7faId1RbEiys+IiiyzmwOgDRmYXj+mNgBt?=
 =?us-ascii?Q?dnR5HRThILPSypsoL1W5WegMzQdem5/1mk9DRPjUPjuIAdy9HKREBbq6d6LQ?=
 =?us-ascii?Q?zExF3Lg3Yx0gQiNH4FFO9g5R8yK2TqwFfvKAUqqzQ7cd8qS6Gw0FmriJKrOS?=
 =?us-ascii?Q?o/7w1iB+Y1uCSygz9Nb7m9rCItbnAVwMouZIwOngvC6fumNpcG++2HdpVZ7w?=
 =?us-ascii?Q?enzMvk6ytABFN2g4HX/aKOKMEluNzyhJfX3ku1MNv/bY+Y6DOGYTjsBQd4Mc?=
 =?us-ascii?Q?h+9pWxUzb4NK3BJwYwW5z1Z16W/fnCwNZL29Zk9WupMpsYOquNbEHPwDAmtj?=
 =?us-ascii?Q?U7ewEy1xJGnP0J2zzs45DCIXtyrUKel9ICnyOv/VsLKU5llN2VXfX5BUDryg?=
 =?us-ascii?Q?LpuK84hEnByd834LahN7D41ZEIL+GtgfxZYZ68TMUpab0zb0u8MQsd7xrCmd?=
 =?us-ascii?Q?UDoQzGvnSwktqgJGE/jswdkFCDtZ9Z/r6U7E9clZvvy4V9JS2VeafooddxHZ?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0e2600-55e7-46fc-acb8-08db71fd9717
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 02:16:58.0571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZ92OZOYnz2E0FK8pR4EkjzOCluoX2qrS6U0/6ssEF+wnPgI8OKEHu9ZnX1irxYVerFJvP+2wxf+q9jGSm4TzkMeW9bJBiedCZprIyuHpYU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5893
X-Proofpoint-ORIG-GUID: beNHwkofDTNpP-7Cp0BAWCcAxPVTM0PV
X-Proofpoint-GUID: beNHwkofDTNpP-7Cp0BAWCcAxPVTM0PV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_01,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 02:17:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183165

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Update dbus to 1.14.8 to fix CVE-2023-34969 and serveral bugs

changes:
https://gitlab.freedesktop.org/dbus/dbus/-/blob/f90d4f16933ee5153fe02c405eb883c9cb8f0ad5/NEWS

commits:
55d11f57 doc/dbus-api-design: fix wrong closing tag
a96f417f CI: Run a detached pipeline for merge requests
9e0477fc CI: Only run for pushes to dbus
077f7e43 CI: Remove an obsolete workaround
07fe44f4 CI: Update Windows runners
ec708d55 CI: Avoid using a no-op download location that gives a 403 error
45e6e93e dbus_message_iter_get_signature: Fix two memory leaks on OOM
0bb1942e dbus-internals: use `_DBUS_FUNCTION_NAME` in `_dbus_verbose()`
8df1b8be dbus-sysdeps-win: do not log function name twice
5c3a4e81 dbus-spawn-win: use `_DBUS_FUNCTION_NAME` instead of `__FUNCTION__`
8e457296 Update NEWS
e1ffce17 Revert "CI: Remove an obsolete workaround"
40c0802f monitor test: Log the messages that we monitored
a70c8f2f bus: Assign a serial number for messages from the driver
39b5c617 monitor test: Reproduce #457
f99e5de1 Update NEWS
21414587 AUTHORS: Update
f90d4f16 Release v1.14.8

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/dbus/{dbus_1.14.6.bb => dbus_1.14.8.bb} (98%)

diff --git a/meta/recipes-core/dbus/dbus_1.14.6.bb b/meta/recipes-core/dbus/dbus_1.14.8.bb
similarity index 98%
rename from meta/recipes-core/dbus/dbus_1.14.6.bb
rename to meta/recipes-core/dbus/dbus_1.14.8.bb
index da25155773..b6c245d40b 100644
--- a/meta/recipes-core/dbus/dbus_1.14.6.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.8.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.xz \
            file://dbus-1.init \
            "
 
-SRC_URI[sha256sum] = "fd2bdf1bb89dc365a46531bff631536f22b0d1c6d5ce2c5c5e59b55265b3d66b"
+SRC_URI[sha256sum] = "a6bd5bac5cf19f0c3c594bdae2565a095696980a683a0ef37cb6212e093bde35"
 
 EXTRA_OECONF = "--disable-xml-docs \
                 --disable-doxygen-docs \
-- 
2.34.1


