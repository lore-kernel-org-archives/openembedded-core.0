Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DBBC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 10:15:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.9017.1651745720099414745
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 03:15:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=FY94ck6b;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=2124d45b50=zhe.he@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2459Tk3d012443
	for <openembedded-core@lists.openembedded.org>; Thu, 5 May 2022 10:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Jw4u0z6AEKj6dFvpl+7Dqo6CQUvaJsnCOEawu+Uu3ew=;
 b=FY94ck6bO/cW3j54EscI+VF94tr2qX0zab2spK95p6T00nrggiB6lSU3y09wjBpUQXq7
 jbeOmv3UGsfu6IzVz5xpfZP583jVC4sE5YqBeD/gHvNRQ5lPg9AIToiwoq7MLxrvzN1O
 xcHyHxyB8vPVMThP80DSZHNzxGYn/Tn+Y9cJQkuHLDFCyqHJq0hx517cZ9jUcb3vgO9U
 xmHf3G/CzxXCIhBQRP9Gy6u7Yn7bIfDHi6lUeyr6BjIy1uLEVg28VJa3lMlQvrSk6Cm4
 sjn4VO7W0ZCOlSAOo1h1Iy4JcNTKNJkAb+sEksKSiWi9bCj+yk/kHv2VythUKAJfmGFj Mw==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fvbfd819t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 10:15:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLnbH7k43heAmf8a0NBE+zIBSCWDVpRQoOGyxAz8t+WWR4gTgFOn+2M1Apm9J6IYCZ+ITVXsMhQq0GvxxHpI7pUzsu/+Un1Fk4LhG96IDMS4lc1eErAkhtWiNBUHUSzegYSVjBeUqiwq+QqfksvLa9OVftpjF7v+7Kiqmn2JDfiyzcQ8aRpE1vj2wYICMRTqrsXvFRtw5W/PRwHSjJMXCwZT4j5TCKOC0cJtFtL5gcfZM3wtkt0i+YqLei5STMiX3mMa0EFVlJWPH2bhyI9rMqav750aNP0dsTv+pzsGlsAKIIJkgsRpjeyGeah423B1kMLtafisbVRWYy0UDIj3iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw4u0z6AEKj6dFvpl+7Dqo6CQUvaJsnCOEawu+Uu3ew=;
 b=R94fDqQT/zABMjwQg2+aILTpEB8fDTGgTCJOORPMkM3OOKo3j2CzeAIKU9uesszUVPTMyr8ylW3v/YvTzL0nffATHj9ZusKL272Jy0/XVRtujB24NpD/vLmFwQqVIDqlgzuAe3ovJbVzO8vkKf7OcxMPq9EvMIfE3JO/sQmhnaaOcthAO/HMlAOC4Xd3s+vFOeH0C6mu/kxrJF0ax3qO0btEgI3CUQ8JophKa3yarMKifRf2KUZ1TCmoIgMgniwryQaGMpqyveIipa/Z02xJNeVP2ljwJnBNuU5wUr0qZFHzj3NWhi883aYgE7Vc4nw0N4AcXx53GYvWfI6x6kFxYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by DM6PR11MB3836.namprd11.prod.outlook.com (2603:10b6:5:13a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Thu, 5 May
 2022 10:15:15 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5206.025; Thu, 5 May 2022
 10:15:15 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemuarmv5: Change KMACHINE to qemuarmv5
Date: Thu,  5 May 2022 18:14:46 +0800
Message-Id: <20220505101446.1634380-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0062.apcprd03.prod.outlook.com
 (2603:1096:202:17::32) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bb00598-8f72-48e2-2c1d-08da2e80257d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3836:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3836BAFA7C2688377BCD886E8FC29@DM6PR11MB3836.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0Fsx4MNu6t0oL8j52ct47uvqyijURreFQ6MS0O/LQ9Ty/sKVwih3npHBdNdfWByZcgkIFwU1Ran9XhMPi/rpTCcXpn8ovXANCaZGFXa7KicTUnNxPcgSStKASV9m2szpVcKAE3QyLgRB7Mi5fQi+8APQoVOrT1GrFSSZolnSA4Vy2y1kJD/zevHIxuZzFw39U50FESYDcv33SMscDHe4VX1RjoHlgMh2VarzpE7qIRVNCTluwgk6K+Dgxa6cPj7jCF+CarQHmMCJUxWnDFGB1LLKkM79fyO7Qpsz+6FmIFjaF7g2FzXC0GR/snV5DseRcGmMYjF4s6awvB1r6YxcnmODWjjy15ox6MxknzwAFepdqjd9R9cTtgLvYvTC3JFaomYq/TZb2qzUE5W8l4ht8GtnUWdw+qqvPIOA5xUcRR1bHD1fMjeDnLYtwNqWBy2KfRzGxxOMulOamn4XmMGoXNwhKCncTVB4N5X1r33V+9Ae7xgKxPwpqT49QSLrcWV4/lAt/mwClx2/0kJriQn8I0AfzVr4caV8qxn8WOP9UEyRnIggaHZBbptwENeqFDk5C3emivnBCJVnLbiTtJ5Xjr1YUvsG/si0lrnOgtDVyqlPIDDhzGA1b7UwR2JBlzAqnb3sdbmA8RAEr09XsE9g1wXliMIM6Bc1mlpTqn3b61GfH4WAVnMI4sSEoy/Wf2HD1K0VG+bfGePGjtvnPvxycA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(6512007)(52116002)(1076003)(2616005)(186003)(6506007)(6666004)(508600001)(83380400001)(6486002)(8676002)(316002)(66946007)(6916009)(66556008)(66476007)(2906002)(38100700002)(38350700002)(8936002)(5660300002)(4744005)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xx48rqpH3JosKJFRGzVDTR9uXkTXkmLQmHDbQslJdpDw+G7GvmCpQUre8IjJ?=
 =?us-ascii?Q?W/WMkeFW9daFTkIPfGGWv+nBCil70uztlLewcjzv5weoTX1LlBKvPA0q6GDj?=
 =?us-ascii?Q?iA0jqU2DlRRe/ZdXfCE+MJOKoaRtb9AIPn+3DpZ/Yqdoq+NRRhu20L2bD4uM?=
 =?us-ascii?Q?MC1BYkUsmHHjuAeMx1E7DbPw1edH1POcrP4XWgqp/okq8qoVTHJwxnY5vQ5L?=
 =?us-ascii?Q?5nKev8TFhvs8IBKXl4T2DXiSCvjlCyj71UZwIPIba+uii3cTE02Q3lHoI3wA?=
 =?us-ascii?Q?KWx6oW11jqY6WsVLV1Uc/77fZxIAcKqT4X1TQfehZxjI4OVHLa8wi0dw1JQh?=
 =?us-ascii?Q?5HJhyqbbqfBJ8vakE5z/q6ms9MDTXkP7Zrk9vEi7gICa2NV9YZy1LCIfyLS7?=
 =?us-ascii?Q?zj2z3vKEu/adFDuL6eYjbiB9JmqhCZXkxvJJaUAaSqmA/DPIp8DLeVeyNVcB?=
 =?us-ascii?Q?NddB9DBLyVEWoFzk2xe6vQpqE172bMCBFxUygq2oBChRo4wfZaYNADKjTbTB?=
 =?us-ascii?Q?dkpl2E+U2s4Wml6wiMK2MyRB8M5XnXmj1rSLhwu33P0DWRnPzwM5GsOBC5wL?=
 =?us-ascii?Q?6MFVJhMU5HLfXHGWxLxMtiFUKGWat4mt8ToNWZOqiExOueeQ7YEwy71E5sNs?=
 =?us-ascii?Q?Q1TdZp0716jiH1T5AkadC5HbG3/n6YNdBQaJCoQjFbCXZ23CiD+bybmR8Z06?=
 =?us-ascii?Q?u/AfKMYggAfESiI1ZvgMmttL5FYpK1lGz8U6bUJAwE1nLRh2BjkPjMNx2eWb?=
 =?us-ascii?Q?Tg7szGRuzBCNg6ya9jIb5BrTWDhLsiwOA05Mhqjcz7tblzEP3+E3C6Dunooe?=
 =?us-ascii?Q?M8NsePanhnvOPTrU5/MauYIk6SzKzmulH1Tuhe7TRv0eDN+PygJ3WKCgq5Tz?=
 =?us-ascii?Q?vzv6uArMjkaT8XUnQwx9YR9ZXcQ77RrrR8Km6kl+6ed8vlc+v2/hpTIQAEBX?=
 =?us-ascii?Q?4U2tpj6aB2ODlQ8rZezSqbNI+IMXRzrjfAEZZ5jrDN/53n2tAnxSuXsnUmcO?=
 =?us-ascii?Q?/iM2sa7WabRTSk4220FTu/4Wdxj9DTM09ey1ehGnyyyua/PjtRNm7V+PViUH?=
 =?us-ascii?Q?7WKPcbVFz9MBpZ3yA0vAQ1F7Yudim9h8M4q54yZscKmqVp6k/bEjg7/XZmxg?=
 =?us-ascii?Q?QTyBtWWQDYXegvcTrQnDgwL6XkqyPjlYpfswnwKLG089kBv2JCIQ6DG9s+cB?=
 =?us-ascii?Q?OX09dxdI0JB4zpYq0LRJMGoJLKmTogcIXJnRnApYpSyOpTSrJDtDPBaESUSB?=
 =?us-ascii?Q?RMe4TO53Lozxp511sIbVoHniiI8QmpKKFkdpWCtDJwOPaWSlPZgCta/0Tzkr?=
 =?us-ascii?Q?KIvjdw4djmCiI/QQTENzd0ID+t4a00FQqRIMiPTBmwbIZCh8njhogYV4fowh?=
 =?us-ascii?Q?3e9Ezsxq9FWQi7clYHaCC+Bdc0QQFx/kv/aP9kR0ntCV0UN/G2yJJ9vBExIY?=
 =?us-ascii?Q?xQkpTYPPZ25gs81ykdCExzwyXAThV3JNlL4UPFdF6wA8otvqoEwvChVC1lC4?=
 =?us-ascii?Q?R/ptiMkOo+3E1eoLD4th+gn9s5Rqp7J9J73DzBx4f4Ovtazh+UlAz2YAzGRe?=
 =?us-ascii?Q?v8IDKySoiFqUpQDUeQTzUs5z5scGAGLohlV3MCRsPrqctfWQ0BJ9kYEUxFEG?=
 =?us-ascii?Q?HLpw8oEyQEOiLLQZzXhGWok2xqno84kUdAPxFu9DOSdFhs9CmAC1ew4gZGLO?=
 =?us-ascii?Q?umwvoeEcl9bwPQZ+GXuDq8b6Hb4rNZVKcJ/skBJdr4YxlXP7PFFU+tuWNa1C?=
 =?us-ascii?Q?R0b6j27CZA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3bb00598-8f72-48e2-2c1d-08da2e80257d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 10:15:14.9279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U9s+Ibqg64J8E1PDB6vOoXTdyWNcM9LJIsnEUfB06jjR9JwgyUHTsUfvF7Pyh5k7D0B4zpvSRvPuTWIh7LjiZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3836
X-Proofpoint-GUID: DTYDg27_YzwU83aoJT_-WKJ1cTOWHkLd
X-Proofpoint-ORIG-GUID: DTYDg27_YzwU83aoJT_-WKJ1cTOWHkLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_04,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 mlxlogscore=668
 priorityscore=1501 malwarescore=0 impostorscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205050072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 10:15:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165294

yocto-kernel-cache has removed the compability of qemuarm from
arm-versatile-926ejs-*.scc The setting here should be changed accordingly
to avoid build faliure.

do_kernel_metadata: Could not locate BSP definition for qemuarm/standard and
no defconfig was provided

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/conf/machine/qemuarmv5.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 2dad504c99..17148ab929 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -18,4 +18,4 @@ QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
 PREFERRED_VERSION_linux-yocto ??= "5.15%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
-KMACHINE:qemuarmv5 = "qemuarm"
+KMACHINE:qemuarmv5 = "qemuarmv5"
-- 
2.25.1


