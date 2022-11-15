Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0266BC433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 13:45:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5708.1668519955115637858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 05:45:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=dGa0fTOg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=831860dec2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AFBho7M013965
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-type : mime-version; s=PPS06212021;
 bh=pbVZX2+NcEC2h0wax3l9m2z5xQ8brhNowPPwnJEnT84=;
 b=dGa0fTOgt+CTuD9kb3256DjMJsCyYVqnGxxnCAGPvqxqoN6oKUepXF7H6v98nl/vvL8+
 EyDZYQIUvsigZvgnphOxuC2of/osQUdCTqJpd1dJCZWn9R1OsVI5RWvESyN9kNDYn2LC
 bGwf3093zAAsFGLnGJunqYx0G/Tt7U7EJK8lrEe871Yxa4+V+T2cX46xgHq4BsYmu/m6
 T3P6WtS5aE4zs0BaWtdNH5OJ7xRrmGDzlty7do+V7la8/vAVZHSIfy6tIg4wQXMefAIz
 UruqajwcN5in86ACSngNrBnTGwKmU0rztgzg3kHHei7DaTgVs+MbPs2g5GLOiWTS5drf jg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kt2faads3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:45:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZGgUWVa6Hh8He916LdU6gERaKCQYBUsnEvZoTn+FSseu/B3sMQ1aRBGc+JZKLUXic2mmIf/BYVIssy4uQEF8eX24fEfr9ErbywaVf8rrHsgUDaV9IVzPnNcjGd5xbSUKE1XnDY4/Rn+fxOr8IWuftSb0sJW0Y2jehD58napaeNZ93cy2jZ7UjxlWSCJbYiKhP9ZxbyeQY9ZhaQVDxRFbShs1fpLHwI9CsRc71teP8Mtt1P1RUJc8YXp6xcrDDkcnnvGCYPiVUfLmTY89EghqSZ2Ad0LRu+3C0BaBiWjemVh9aQx+T7i3ECIaKmxLZES2ZSDZ/6oJw2Rkka1g2ozqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pbVZX2+NcEC2h0wax3l9m2z5xQ8brhNowPPwnJEnT84=;
 b=VOmj0fomZBInontqNFWZjdkViAchN7XlTT4D1c0exd7H8pJbZG/mo49SiReDE2Bnj2zSdhHy6HE6DPckFbp6rTybMSU2wJxEDpYdZ1uxSyiLPWUt5qlN8DPS5W0FZcGUavfhi2uDgYbhrvzYCG//FJnEQz6oY+eiVHuPX8mMVOBFWDHwIGW/rPNIH0Iom4Xe5H1/ZIE0gFqy8nLU5bVgW58Y4DNDdE2ybMDu3zwBRw+DDgHZBo7kyvmd0HAcrb6GxRvtEGWgDL5XH5Zcsda/iAnBVpjgRXtd5W42O7AHwevGVuOtNWXLlu94J72tyBCeZqGADSWsNDfetBfa48bSTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4550.namprd11.prod.outlook.com (2603:10b6:208:267::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 13:45:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::accb:b6d:487e:717d%3]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 13:45:50 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] resolvconf: make it work
Date: Tue, 15 Nov 2022 21:45:31 +0800
Message-Id: <20221115134531.34920-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:4:197::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4550:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e49d4c5-977f-49bb-a6cf-08dac70fb416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HWipkYWr/c1g6G4ldlzueXAYKDSS9OUwvSyjhB3YZZtBM+i3I8BBC8+eCM8MYpYk7Gw3V8zCOO3JrBYVX6ddqJFFhVG+WHzb6JwArem82bolOzqK64tQENU00pLh6MLeoCjo/bg9doY4Id3MtlJ97mBrouhDVjDgh9trE+vIzbGGS3bcVb3FixGGYioxeEzDPMptBSX6MS2zHnUxKbZD+TY70gKGWqN6Re+TpmRe6n8MaC/lz1JNc44PPQdBU0RttIDEaYe1/1Unn5xQBAOAhEWohfepd0+MVEc3xPe76VeObL6XP3T2trht7iLCwvi4vJF2kSwKuSx/buUb89gBOEiU3zhQnBWi09hngQGWUikfKG7C+nbliV2u8SPdT/qfSVNXjDSgO+gC34D+WoOho1YwHSjy9QS62ENd1DnMopapdBJtmrE4aZjIqRszz5YPzXwnPri3RiLk2cQaOrWnPyKl7XqmFgZNtTbFlRiyHzBqD9KWUBwYZ8f4E6E77KXXoBbOcp8kNqvycvI/7qhlChrjPQkVtPJ/sPITXbl6QIN7N7/nFQW0cbqz4RngeiE7AZ/ZbXByiFVk7RnS+0EYKwgtr+pJS46cajv+TzSO7ozSVNajvqkkzSsru58n8qQ07wINcPmUKovzHmdDaHRZsoODkn3cPa0yekDvnXv2Taby/3QQgBYfIe2aoC1lEIV+Xn2VEvWtETTmXlrGImx13UXLgrSLt7UTaJaV20qnBXjWn6zC+n2IE9M9y0/SremjjLiV46EeNsBK00gwnm56fLYT+65NPh+eoFU/GP5SI0g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39850400004)(396003)(366004)(136003)(346002)(451199015)(83380400001)(86362001)(38350700002)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(6666004)(6506007)(478600001)(2616005)(1076003)(186003)(52116002)(26005)(6512007)(316002)(8676002)(66476007)(66556008)(66946007)(6486002)(6916009)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GzY+21357DwjwGNpMQ9oyxr8FDYvvrpQ+Laf54t0oHF3inOjcJpBOybN9sPY?=
 =?us-ascii?Q?q0Gs9sM9Wtk4DLW5H9GBsVFTcAazvWRfArwamCYCi7AVmbt2CXuIuvNOYQg9?=
 =?us-ascii?Q?pr17G5PaTqLthCnAq0yM22zRxYBQ/t6TsPLCt+Vm7FjxdP0HMWoQrKmSQUyo?=
 =?us-ascii?Q?9gRrqrDaPmRYOB5dMm/hBY7H+oXji40XIoFnLvdRgG5vF1CpK7t8zFlOSH5e?=
 =?us-ascii?Q?xM6jp0qsHa6+hHDMS0qOPsgHqL+fGiw9ND3ja3YaPglB0c2EtEs4QBiDjlJA?=
 =?us-ascii?Q?S3UGylhtYA0prPTdJyFdc69sFM/zhL4J60aKajXC6BsiPyxTCFRKCZOaOqIu?=
 =?us-ascii?Q?WJGYiTzIIXgF5RKjjXis7K+FD7oNR22Ug5nIHG5pFJdGp752i+ARdYdq+RPb?=
 =?us-ascii?Q?6YfJf1J47pVPa28ADeQTwVH5hUie1fZNV5bnq0ILqeWr7D58XapfAGTsQZkN?=
 =?us-ascii?Q?U3m/Y712bF1crt6OE3s/JWb9Zumh0UREwr/8X1hY6vs3CYEaAF1PIq2g49d9?=
 =?us-ascii?Q?4XBP8ZGIfAKFRQkUM6MbKbVNFs7hPzN0QG7qDrfiB0EBtyf5eafiBp5JV4M7?=
 =?us-ascii?Q?wTZcn0uQ5MUiwynDVdQorwWgXJbg2XUxircmMP4wH9uCOPR7ZFf4MYG4HXb6?=
 =?us-ascii?Q?DQQOqcv7W5Oj+RzWJsrAZWWpO3anz4H1exNejc7JTk1vPT+pK363Ugu+gQUD?=
 =?us-ascii?Q?c78K7mMoKdkySluh4FUip6tXletpBPpKT/Ncv/17NSTzet5oPfTj+aGPs1RM?=
 =?us-ascii?Q?tg0GPvK9DSbLZUR01YIFaBg3ghog4vL2ygBG9UF5aFTHV9Gh82hOns96mkAp?=
 =?us-ascii?Q?TCD35qjaBmOg+B0flIBxbcxgHPrSg+5QoYZN/BP6A8UvrA70rpyo5ipwEWtN?=
 =?us-ascii?Q?jh4ieW5M4AAeukCMbGPpRO88LPHuF9bGudMAGrfnZK7LneM/5BiEAiLViJnY?=
 =?us-ascii?Q?kBGaIld1U1DPutmMb8oN+4F5VJeivKGhxvY4udh/uPC8WsoclIgsk4Oj1g2/?=
 =?us-ascii?Q?Yw6bhMJfYLCnE192AnrZhjDEM40lllPTTjhXUvYPcC7ov3zGc7x49ue9/I6g?=
 =?us-ascii?Q?bDrNDcOup67a8UH8iWq/omqQ0MWNA/qpGyLUs/vW45e/y7/tMVmDOZ0XjE6n?=
 =?us-ascii?Q?gLCreLviN1W9B+ymxGXuPHdkzU2jKEURdbZdBXJkQtY4swbwLKrbwlzHjd92?=
 =?us-ascii?Q?uv1VHMh4AsDrSqEjBhkNzh1IDrrmC1TH2RDOoDQFJkYvRpPtxhE/xyuzELZC?=
 =?us-ascii?Q?P5kCrTlE8groc7kR8nU1qNDgbucEy5bcbAUgt3/SbRkSG7Jtvseo9OJijCY9?=
 =?us-ascii?Q?5R0Ab4rqZ/fZTlpE1tnz2vSx0pdbZC80y48DqrCLqngTkjIz2eMfQQX/AejE?=
 =?us-ascii?Q?ujMC5yBUTx1I6zokeE9RbKGuE8DXD21rZ+pTetABbr2RJl1I+p+YDqvUidWc?=
 =?us-ascii?Q?SpGeW14evQTghg/+WDplqmTup18dHj6X163MRRReojZPskCc8gkRDAxcObOq?=
 =?us-ascii?Q?CRK0cpM69c0bPXlDpSvH5oG8VPqIqTPyAmbtDJdMmu2y87bw+oBMPLBYnvcW?=
 =?us-ascii?Q?GgfYNpK9fcXO6M1VIEl3FwUnvTWBK/YydHZX+I6s?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e49d4c5-977f-49bb-a6cf-08dac70fb416
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 13:45:50.2252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pPXJUQnSURzS3jGgRmyfa4EuIpi7gH75/dAOyJNlaUPOcKcYRhtkzdUQGvxpj88A/Yav/hFMhZexqqWR+peigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4550
X-Proofpoint-ORIG-GUID: dyHQqzl0ifJIDlHW9pVuBM5R23zGdt50
X-Proofpoint-GUID: dyHQqzl0ifJIDlHW9pVuBM5R23zGdt50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-15_08,2022-11-15_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=805 mlxscore=0 bulkscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211150092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 13:45:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173345

The current resolvconf does not work. Make it work with the
following changes.
1. Install normalize-resolvconf, which is used by resolvconf.
2. Add dependencies sed, coreutils, util-linux-flock.
   util-linux-flock is needed by our busybox does not support '-w'
   by default. coreutils is needed by the busybox's readlink does
   not support '-m'. sed is needed because we want to avoid package
   QA issue complaining sed is needed by no one provides it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
index 94fd2c1a70..3bf5ec6c32 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
 AUTHOR = "Thomas Hood"
 HOMEPAGE = "http://packages.debian.org/resolvconf"
-RDEPENDS:${PN} = "bash"
+RDEPENDS:${PN} = "bash sed coreutils util-linux-flock"
 
 SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
            file://99_resolvconf \
@@ -39,12 +39,14 @@ do_install () {
 	fi
 	install -d ${D}${base_libdir}/${BPN}
 	install -d ${D}${sysconfdir}/${BPN}
+	install -d ${D}${nonarch_base_libdir}/${BPN}
 	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
 	install -d ${D}${sysconfdir} ${D}${base_sbindir}
 	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
 	cp -pPR etc/resolvconf ${D}${sysconfdir}/
 	chown -R root:root ${D}${sysconfdir}/
 	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
+	install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
 	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
 	install -d ${D}/${sysconfdir}/network/if-up.d
 	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
@@ -64,4 +66,4 @@ pkg_postinst:${PN} () {
 	fi
 }
 
-FILES:${PN} += "${base_libdir}/${BPN}"
+FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
-- 
2.17.1


