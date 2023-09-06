Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A782EB8FA5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 07:32:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3317.1693985542965068555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 00:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k7LyWpvG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76138bfad3=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3865wqu5020890
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Sep 2023 07:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=6pvCE9TENuxSMY20R9
	lp6R6NFX2cP6uWsvuV8lKr9eM=; b=k7LyWpvG7RFpOZ6rbAdChaHsbiSkuptWSI
	cztwrVSSzeLeaW5RJ+l9R20FEvULEASNi8tHJiSBByBN0fq3noh62MIWIgVWieyF
	sNxs9P2vUGeFoGPXIPL0hdP8c8vwSHLJ3DquOmb2Mz+IJh4ps6TufrpcbSUCUXh9
	Du8/lJBEQrM424npLMDVE5EvnE69V+pHewp5fkzqivIVN0RjHhlrXL91TVD9BHJ8
	Vt8X/5KVKMkaN2vfzDuhRoakNXllqFBmCX3+BSJWIFfrjDOaQOCqwVWk6vKnwgHN
	2cHSaU+BfbFwmOWzQZ+kwjabYyto7QECk6o87M6aDNVlJzjPT+nw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k24yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:32:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtCBDy/+fG4YrZJoJ5WT4XHrg6HViNMzMqPsyxHc4u1wg68HPQeae65tjgTHZt0LzGOVYdmsh4bUqBkMBdTixzV/uuR2YyuwGhKHb5+TdDaRGC9gJrW45cuSNsXXuFI6gUQffiB5jZN+RAcm4Q3W1oYaw8BlKYHPiAfJLtXAEXGdXirtJ0m9QtSl+KhpUVku/MA/Wa7htV+W2sg0bRtYgkDJalGL/nXx/EqgqluCwPhrLla2ZJWnAhqvWJZLnBIrpkdEL9NOnvN3Jn10E7LIYTsK6sJcbXXdYtLgRkwtaJePr11eiYD8gvyOuTWOQ7YkfHfWVXDeCgWwgtk6tqDDVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pvCE9TENuxSMY20R9lp6R6NFX2cP6uWsvuV8lKr9eM=;
 b=X6Gq+5YHfjOUJDnhR/j/TRy8WDtDp4WnrNYMOhlM1vtiy5AXBqgTDKGAgq3V1t4T841AM/mo/ZDHk0yt55CJG/pbZ1lxN6+ntmlncslRADprfgrUAiLJ3GwJeoHxU2GSCE0YJkQN+TEjRbT4LTq2ljYgA9H9zcNOWCTlYno31U6H4PrUP3znNc08fnkuJNttLqyQ5kLgnqMCBIUBwfnR+CMh/I2maIooqEIQQpNX3lX8AED7UxLMEMTQxtsW1CvLN+vKMqwwTa8xAuaR2QQ12poorsHXW+uIdTE3RwPZ18hkplQHbYN9Mu9XO41tjqYkSDmjLihp+ILAlfzUxqhQtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 by DM4PR11MB5392.namprd11.prod.outlook.com (2603:10b6:5:397::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 07:32:18 +0000
Received: from PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d]) by PH7PR11MB6449.namprd11.prod.outlook.com
 ([fe80::6f95:6ed:cf39:91d%3]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 07:32:18 +0000
From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kalappa@windriver.com,
        Naveen.Gowda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH] binutils: Fix CVE-2022-47008
Date: Wed,  6 Sep 2023 00:32:02 -0700
Message-Id: <20230906073202.480705-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0029.prod.exchangelabs.com (2603:10b6:a02:80::42)
 To PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6449:EE_|DM4PR11MB5392:EE_
X-MS-Office365-Filtering-Correlation-Id: c6850a85-05c3-4552-3433-08dbaeab6653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QDilhg7ltQDuTNw8PKF0X0SHnIQTn/RuWVKlhYWxua9jPwzswUaP3SloPBDbY0GbKrInDLsZaeF8Zi5sStjzaUXj0lmjHTlQ6zwJJ9kUWOGDXUFDVa3zrLFEyTWDh9+3QQrPjk9hGYCqnOr0e+wqz2Rg3cD2qWluIjnijs/ph+e64hqMsU4G50XTLxoN98OKpAYizLCItf5Ms2oEn3TAXyR1TNrCGVUHIqq/ColW9QnZ3cxMC+TCdaNziNL+K1w3MSRamriperqEmHkhnHkf1UN9TWSRO+YzvVFqF7tVEFYVLdAKpqvaFPbsOuufMp2wLQjlzNkZJfqliC9wNlF9JARIPs+tMUGtAm3lxkVaBIxbqA3km7R1Gxsppo9UaYlq86EN1OjQpXP8wdpeH5mWlpJZCpCv+h8iIv9DdaEv1659nIZNMUg0NIDwxf3Sq4hTXNjwxDnjoJmFG+u5L7ov/OXgKWmJvCtofdMwPw0fWAtsMNe5fykb6930pBUphzW+EJimdF8NVIAjaf7wpUYIEv2o0idk697hcKiC+lvdgTsE+imyA4s7isq8OuunpM9mcfhXgwdiXijjwHDDXY4VpS/59LZzuAkGPxCKjYOgsCxmeHhUD5Dpo7LZiHDccdmp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6449.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(376002)(366004)(136003)(396003)(1800799009)(186009)(451199024)(2616005)(38350700002)(38100700002)(26005)(107886003)(1076003)(6486002)(6506007)(52116002)(6512007)(36756003)(478600001)(4326008)(8676002)(4744005)(8936002)(66946007)(66556008)(5660300002)(66476007)(86362001)(6916009)(316002)(6666004)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qovcPSxyj4w08CrIKb9xkrmBQAItESJvRuT2vRLRWRLwS3TZevtUD2cSR10H?=
 =?us-ascii?Q?r3GNLVBhyyHp8+RTY5KuEtRTGAiJWPOkX/gbe48FXBfl0po4vpKj5k25sPYu?=
 =?us-ascii?Q?7ZAfXYLbXUkdBOzDqYfEz5POJg/SLKpTrZ4QpwJ32AbyU+O5K70j4w2ncSYS?=
 =?us-ascii?Q?vUXkV/QNrG9tYE0YmfMJUSldUxv1J54zRKwMxF0yqBaBO2HU98gy0TU9L+wB?=
 =?us-ascii?Q?PXGeqDhIXPO/nifxUcQV8RzVaaBqF8wmvGI7w0yoNuZ2rmE0azTCZAKDuCAm?=
 =?us-ascii?Q?1f3gHsMyF68nk6b2du0FvVPs+0iNiIcBPXa7XoTxvA1zNVblwk7xP7Xsl+OR?=
 =?us-ascii?Q?xCBX/tr8P7kdimU7ULg9YyIRX7PeYteNOoXkUfttdaa4LQiFuNA3BQAth7Eb?=
 =?us-ascii?Q?wM/iOfpX4yft4pnQi4iHaSs6HMDeW3WiktYkK0B/MW3n/m/bmVZYFv6ljh8Y?=
 =?us-ascii?Q?q8zU32htpMZ90S+5Bmix/wzPhuIIG2w/KanYBQVAGqCJEdbPleKwtLaSr5/d?=
 =?us-ascii?Q?vk2N8TGxVn9fX6U6v7eLvWiSEKEL5Mmt4Kgjiq/ijD5gH+za9blYVvzK32oE?=
 =?us-ascii?Q?gr4vr7LDrFHGGuEEZX3V2F/T2AeqCh2gdKbV0jLQSrBs+kwPzOceCyBx3zIT?=
 =?us-ascii?Q?Jcfj5KYAmHAEoi+AOW7nIgqjBW3k5GAACnELvd2P93eBJ7oDTAOdWBqxpbgY?=
 =?us-ascii?Q?iXSFk0baebpYFbwcUbh6WE2lmFjisTAuP/8YEipXPqQVY+fVqQFeBaBHeXbF?=
 =?us-ascii?Q?H5/Ik/SzkplqGpUXVhlHooUgvMIrzhWHIZWo9oZcfXXOhQn6mmf0KxN8MeMg?=
 =?us-ascii?Q?suEI/X3xBhuarUUoxj6BCrfLJWDFs+6TrUJnomKeAqvfqLx+gELdirnWFZl+?=
 =?us-ascii?Q?ZLDPRJZTd+sO3UG79tTGO7fL9V1C4fcE34HxKlwpTj9YJx2MgaKCJ8cpnCmM?=
 =?us-ascii?Q?mEmaOjrSlLo7u0T7rD+WuwXHnVgM9HAEeYpNRiv5U+OE5BVI2OmuT72RlAAG?=
 =?us-ascii?Q?mhNNoModPCt3EwDjy8VC6OSRLuafXlyR7NT9eJKdHyh1w+M928rotuZKN3AC?=
 =?us-ascii?Q?fNgfvdWjh6ZQsmxIh+YaSXDzcI7KkHaAFe9Zlqy9YQEXHn4crtTlXZtvwOm6?=
 =?us-ascii?Q?H530ghEtYjueAbSA3CHBwwA4lXrkN1qzky/JjAl5uzj4cxSf9eO+FuF+g3JV?=
 =?us-ascii?Q?8SJDWOUrLOpmbnisF2QA/s6cGSaYkiXUm6vqrBKuxqw3SdiHdjtqTU50GjPc?=
 =?us-ascii?Q?M88eAl0lT30Aw5cswFZOphhDM+Lk4nw37OY4OGpjalXqI7wx8FOsQ4VPw/w4?=
 =?us-ascii?Q?tvtUQTLLpSxYyWNLh1yVNk6nsJjBNDyskX7z6evrWwA+90JF5mHzTe4NmOOv?=
 =?us-ascii?Q?nV9mIk3T4LKTOCktgUDsj4CZ1wUvSO/hJ4OQKSDpewsUyZFwRVxIUG4mHB37?=
 =?us-ascii?Q?q4Y1qIewgCqOgcPo/NYGYGxTztcTDCeJZYVXQY/vLsuZlbQSfdmRIQhsA7aV?=
 =?us-ascii?Q?qlrnyR3ZTkQJGNGSylkEGLkBHECGM1gXGxmXqgtMqQTBoqn6f3dWmt9uU1ki?=
 =?us-ascii?Q?wQQIwV8nOYdHwjdPXpZxXHcVTrMaqoxw0O/Hg3jlESpthWXNXgZSPOH24rXx?=
 =?us-ascii?Q?RA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6850a85-05c3-4552-3433-08dbaeab6653
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6449.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 07:32:18.4190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6y8giESRVCHkh/eq8NENCvV/R7zjGIZcWo3O9gF4KGpsVPOQHmXZxTEZGjWl4hC4yGziUJDOjituPUT73770fL0VTgYoiqStmUR/WND7lA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5392
X-Proofpoint-GUID: gRHaGfRV1d1Tk9gynqiH5Qwvz7zYB5zO
X-Proofpoint-ORIG-GUID: gRHaGfRV1d1Tk9gynqiH5Qwvz7zYB5zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_13,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=328
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 07:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187280

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.38.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/recipes-devtools/binutils/binutils-2.38.inc
index 5c3ff3d93a..9bcf7ad4f5 100644
--- a/meta/recipes-devtools/binutils/binutils-2.38.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
@@ -56,5 +56,6 @@ SRC_URI = "\
      file://0023-CVE-2023-25585.patch \
      file://0026-CVE-2023-1972.patch \
      file://0025-CVE-2023-25588.patch \
+     file://0027-CVE-2022-47008.patch \
 "
 S  = "${WORKDIR}/git"
-- 
2.39.0


