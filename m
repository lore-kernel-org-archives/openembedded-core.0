Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AD6C43334
	for <webhook@archiver.kernel.org>; Thu, 21 Jul 2022 02:53:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1797.1658371974037768502
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 19:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MGPGSMVB;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=420186b963=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 26L2lChm008533
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 19:52:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Pm4IuugRjbcP93L7f0Ml+0XoMDKu0vyCupO7cOSRkNo=;
 b=MGPGSMVB3fxSLgLlqx0BizIt29CxGL/Bw5B2cZRUimgX2JxuwetOEaxRrmNpCB5YkWxF
 iqvfIXcFw24yjBF7XN95pua40aYRT0wjNOVRRGWM2/sHX+Zeg6eHbfXoPvoDSPOm9Ajx
 NGXgzpv0B/Vr7hkw+uui2wRMgB5RAk3XJ5+Be3nKeT+DO7+jV4p2/0AASIPlS9bP04mz
 JIiOjk4lFGDFDkQ3yeauyRQWLJxKoeMaKJn6dGnIpg9PDahcspVTdIB3CSH6iLjSTSKu
 wiwZ6fu7MOpvIko3F0/U1ygo1AbtOCOs4w+G6M6sCCP3VPi5BnxOlpKtv7Cy1/vkb/4Z +g==
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hbvukugr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 19:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBVnaLEaOWCm3A5oUpKf6zYacWv1DKKM6T5W7U7XOUgfv9LWdO444AUaN4Z/On+nnPY0t/dY6jPzTP2QkXENavKgkYJzI1o2MTEw/WYXaxU9t8IEEcHS7uts4+xvIWtRp+gY4CKCEUCBD5hlON3PH1TapOpLgjcZ+PjMTV/RHgSzjSRFdlNHkF00m+WF8lyfItdHJHi359xq1BLPKMXog3hmS3/cihtxJ0VVLRZbcS+iWThV02/aYZyFDzZx4vrZXzCqNKAzxGuxW/x/s5P9kts1rfU5SnttHpe4cwt9y09LtkzzoSPfmzaOU1t6c58DVxSFrJiRtx7g83APnKEmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm4IuugRjbcP93L7f0Ml+0XoMDKu0vyCupO7cOSRkNo=;
 b=mU8oU2RzQr/A7f6Ekr44jgm9UdAeu1i8k791Ke5LLXDijioJ9NmQKkDzB6QiBbBFeyWB48ENs+a9gJQyXHZsdIIdaNymJdZJMKVv6neKqz1+FeuKM5UjDw5phIAyfowY1z6Yp+5r+FCb/A3gbthVjOVUhE6vpfcUHCAp7hWUcd8+W90nFLjOT6Ga6GPY2qxNHOWVNV10Nnp3d6bxg078qqbEbFYbwIMgcotDbVaMFuGQ8td03N7n1Gpb2rJVAeliJ3KRZ4VsXrBwlhrGsnM+iBP98jWZDvL9L/QEgdCzjFvrWRoKJCd7161x0+ipcL9IFyCXycKlOq8Qw5m/y/fVWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA1PR11MB6806.namprd11.prod.outlook.com (2603:10b6:806:24d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Thu, 21 Jul
 2022 02:52:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%5]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 02:52:50 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] glibc: make glibc-dev depend on kernel headers
Date: Wed, 20 Jul 2022 19:52:31 -0700
Message-Id: <20220721025231.1690-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e544dd0e-52bd-42a8-927f-08da6ac41987
X-MS-TrafficTypeDiagnostic: SA1PR11MB6806:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NCx15MQiPi+IcsIB/k5sJHSIrDVEiC2sEt/fizrKyAHvPESwoqzcGlOUKHtIRu6KxYPtw4+QoLj+Zi3qQDSTrc59I3F6VuB7MJitiSHmHLIg6c7Kyc5WaAzGoHSypxbgeX82rlzvExi+UNsaDzptg9Xj/GehyjydI0B0x0amiDISDCe1xA0TDqNzC+6rRo2nyvJ0AaC1T3SFDffkim0ox3KrVL0MYV4YDNc0eFjMkbJO9xMpYXSnm3kMnSCx2YVD04a3K5HIa8v8GR69dGZXMkVYhlawVb2YmzGuhHej02y3wqnyyLG+yO0pUjNdiEMV8G9bf1o4rKvzd9QYyfUKqgO6WkAhb0ipXOEz/xBTBD1x2N8q6g3Tz+kFsf48L7GCe97bPqKmHE7z88fjRFwC5P9Z+2F9qn4i4CJPaCRwm0MxITanV13wKfaqJ5+nV1cAkCIdPVZ0A+FKHGSr6SglPRa4IHs6yn9h+QuZj/FXeJs526v1JQA7lrRTS1MuHWwg6A57XLvqMjzEXRJI8LdZM7rRprOmvPNCvmtqCzOcHQ/P6i0AkSKkIEhIjjtUgCgzgpBBw3VlGH4/Szyle/sWF2dhP+hK3WxnZKFVMH3nKadKGlzu7jtEd7f6xYaAQiJ3jVVh/L4/MON2dJRr4OpF/DOA9RUFUzIbHtv0unau5DOrSxUnfFjggKOEQhA2P4eu/IQsl0qIi8L6P8EtZhaQ+ShUqKmRxhXNr4U4htJCMBPDrKlpRC5VcTgU8T4EtFCl+7CP27xbAsKG5hnQ5MV6ud2lAFR+XxrAHJqcPterCQQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39850400004)(136003)(376002)(396003)(366004)(83380400001)(8936002)(5660300002)(316002)(6512007)(186003)(6916009)(2906002)(2616005)(41300700001)(66476007)(1076003)(66556008)(6666004)(38100700002)(52116002)(66946007)(8676002)(38350700002)(6506007)(86362001)(36756003)(478600001)(26005)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5IioxGgvPFrdCYDcMHdOHFqANAWU4Hq2NfAhVIZGuFQWzmcidIIehLs5yhL1?=
 =?us-ascii?Q?l662xL9kCb6FCG2MeONaJoxBSSOGMqaBIQOiO8K3EDdQdm4ARVqU1RnyictF?=
 =?us-ascii?Q?pKAgIu9uLW9waKE2pOtUK0iTBSWGMstibBfjagb4JAIpgGYLGoXyOvgtgkGq?=
 =?us-ascii?Q?8f3XVyjeHC38idVpTvSPNuZeapL4ezvIym3A8A60PCofHE5WUg14tN4KJRtZ?=
 =?us-ascii?Q?eJMc48kjZY0dgVhpVqZY/8U+6RP5ZGY17mT0pYrkKg/li6j3uW9bN2v/0i/a?=
 =?us-ascii?Q?jZ/9I6bP7DvBpXqg3YbiW2z6vLp6dl3gkBD/PcpMAXVIt1z+ZKVRThjlJeh+?=
 =?us-ascii?Q?Fdx1aafMmoSsK5AiDXiPuhVoSoW6trQXvbnGj47rmD1zPN2eg8GRTiw5KsXX?=
 =?us-ascii?Q?hfTPUH/9fh9PFFlhSZWjzFhxAgQfplGidSwHxleeN4mis2BVRvx+aENv0HpU?=
 =?us-ascii?Q?2b1rAl3nN44IaeuQcOWQ5tkikRNypqFQEE/v1B21ksU9GGL5KPdOLtKHZUWz?=
 =?us-ascii?Q?VQ7Xia0maj6TLa1iXheX1Nd7SRinGxRX80QvcSvTMehMSN/DUo0yB9bYs+Ef?=
 =?us-ascii?Q?79nRomndqPqIQ0huvcvm9lGOrPASGP2jGMupkFPJ0GD+5G++9c6muBr9L9+p?=
 =?us-ascii?Q?vS9ketcjmJ4n3eDtgJZNExSrPZJHbYs1Me9DaTFP1C7OjLcjBp+eodi2zZpK?=
 =?us-ascii?Q?eeQAUtU13MKFV6nLF0OA/LBhlNONYhAPIRSLFjd8oUYZJB6ilmKNHQfl/qXe?=
 =?us-ascii?Q?HiaafUsEowdsHNuazdsrf2blQd1s4rTp8JAVi9Aajn7P+NPqi7vlyfbFRdh6?=
 =?us-ascii?Q?v0kWww6A5+JsC/XwOHwZXbPi+naEgyLavRwsFB15TrOx651kh0BO4kbEryCP?=
 =?us-ascii?Q?5c6syETiUNoNO4DX7iPW13pV5uKbik69HwM6vZjAdndQZDlGqYhRBhdNNshP?=
 =?us-ascii?Q?itUInJy7O/8OchFIIPUmZCqG/r7GGdFYa4a2dHmRsWXMOCU/OuFrkHSyMm9E?=
 =?us-ascii?Q?6SbDsux80WvIc+gJiRlr99tmaETtT6rZAlKzvxRjRGrC3xXTTh9yd5EBlqxW?=
 =?us-ascii?Q?Dp1U1EkDsoJGLTMMbe/SxRlYDVNzj/Ql7uRktK4GYlckDSapc2joltNLEHjN?=
 =?us-ascii?Q?BwDFnmPgBXZPZTL/DqMFGab6mNkrlPQJ6S/KVe/OJikK46X7dSQnfHCB1wUL?=
 =?us-ascii?Q?03ZOZSYhAJt57pxnC4PG2bFy40MKCCEpVUF2YwvBZuYZFnZy5Gwt3dkrVzbp?=
 =?us-ascii?Q?hnztNq7gf3cSPnVAevos5QNCWeelyOoqWLpLr932xF1IYpsrX3bZ7gbyQZOr?=
 =?us-ascii?Q?RLBELUwFL33skTM9teZzb6olW9nOHtXHRrSfk0bgTZ7TQY0LdEYCzJDmZD8q?=
 =?us-ascii?Q?Zgh8RfbtAI7sMelAmKHHEu8+cXBuT8V9RX+pJ6upm4pG0qvTfGLLtAV/5k/V?=
 =?us-ascii?Q?Bg3UFn8DU1Hy1NEnREDg+IDCjmmsKTRL1U6o2jcUBGaHTxHSLMa9p6O2tt7s?=
 =?us-ascii?Q?4Wjl6/Zyki3kt4SE23DRISuxMF4eS8LHFIRwiWUSVG44HwA6JyYiK/7Ucgal?=
 =?us-ascii?Q?WSIx/E1JC6udmWj2uR8i2bYSMrkqNKfwTPP0XmUV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e544dd0e-52bd-42a8-927f-08da6ac41987
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2022 02:52:50.3452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TINTaCMo4vB6YPfDNGqoqXMGYrUiY2mL9w4ET4x5T4KK4JqWKZp3ZwiX5e5h6KgXRjWBQN4L2gYWmZO4yZiIBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6806
X-Proofpoint-GUID: uyBDWzxvD6pKxqVydnt2Lpc7k31TJM1t
X-Proofpoint-ORIG-GUID: uyBDWzxvD6pKxqVydnt2Lpc7k31TJM1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_12,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=828 suspectscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207210010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Jul 2022 02:53:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168376

The linux kernel headers are necessary for glibc-dev, so
we need to use RDEPENDS instead of DEV_PKG_DEPENDENCY which
specifies RRECOMMENDS.

Currently, in case of NO_RECOMMENDATIONS set to "1", linux
kernel headers are not pulled in by glibc-dev, causing error
like below when compiling.

  fatal error: linux/errno.h: No such file or directory

The problem could be reproduced by setting NO_RECOMMENDATIONS
to "1" and then running:

  bitbake core-image-minimal -c populate_sdk
  bitbake core-image-minimal -c testsdk

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 278e1b7cc1..7f9e7503a1 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -40,7 +40,7 @@ FILES:${PN}-pic = "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/libc_pic/*.o"
 FILES:libsotruss = "${libdir}/audit/sotruss-lib.so"
 FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
 FILES:${PN}-dev += "${libdir}/libpthread.a ${libdir}/libdl.a ${libdir}/libutil.a ${libdir}/libanl.a ${libdir}/*_nonshared.a ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
-DEV_PKG_DEPENDENCY = "linux-libc-headers-dev"
+RDEPENDS:${PN}-dev = "linux-libc-headers-dev"
 FILES:${PN}-staticdev += "${libdir}/*.a ${base_libdir}/*.a"
 FILES:nscd = "${sbindir}/nscd* ${sysconfdir}/init.d/nscd ${systemd_system_unitdir}/nscd* ${sysconfdir}/tmpfiles.d/nscd.conf \
               ${sysconfdir}/nscd.conf ${sysconfdir}/default/volatiles/98_nscd ${localstatedir}/db/nscd"
-- 
2.37.0


