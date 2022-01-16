Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74788C43217
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 14:52:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.33671.1642344750126257843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Yra9vvPR;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80157207cb=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20GEhVXm030928
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:30 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=pBrdq72VUSJ52vkTi+0SZE3hn9Zsu5mxYjQtHLrdRcM=;
 b=Yra9vvPRIxlLTCF587yikyM/7D1qREQP8X4NHsV94TzOQJ1lMs1WaGSwhoGeDK11sK9i
 fbYD8gkfQV+w6kZtlkrNNF+aUanqr6k8EYxju7d+tOqOB4iL1RU+ojM0VwN7T8CDj+0k
 slnpJ2YMQbB2InHoTeYuFRgPJkgcl60FOyN9tVFokxMRXtCL4V/Ec0Af4YmZ2NoCYcG2
 9Bqe3d0XZGo2niRLn9XblqM2xelYj94QBI1opDTTmwS7uBpG6szmfCEgeFDv6jl3nu+G
 5UtaFrG25Vki7GzYk1EbyihogFW9Oy4jBW0dk/6G3Jw8moaQZ+EVUGidJG7x4AWP2/MF WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8j3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20GEqSqg018694
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8j3m-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 06:52:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VK/aoFPpVY0VGAb+r4APXNLFsY3qwihMdqEEZ/nZ7yCVyl8I4SiS5mcgMeRPg4dY9oA1xtAdFQtgYcofZx0RWq3PdlRK5orBb6/6U271OW9UL4dalmofoExm/xF4ApPG+HklyR3j/UuTrUTV+zrWTlicI4LeiwrCnVoOqXPMTWx1Enfl4lKITF2CyAzulIpcm29bSZQTKxoXCnmCkxxMh/yD3tx/VDpVz8BASzBbOceU8rP4WeDIEaA1OvE5OWX7wA1BPH6EWfO0Yu7TTovVqkL6mXMThWbnxnCqb4ZAZYZBcvQuIaDomfYVPMg9NtIwhAQ6LeyQmASLNJvYZK9O5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pBrdq72VUSJ52vkTi+0SZE3hn9Zsu5mxYjQtHLrdRcM=;
 b=UAF+A09fa6ST5+rw4avWT4O/eIo+7jpwQpEcW7QKOhwWO9i1j6xhguKsBDSUf/wwVD7jLmYSGYcFvUBw4xIn0apPZui3u1CZYYilbLbU2yQpfOSj1N5OA5arByY9smCwRegOy3+ZZazZUxs6o7RqQnV0c5PqEymkwbJxD9820ShpY9x3mAtQ6JK0s7hg+WFpwTKmMGDt6tK7YSo99prFqG36omnMi3M0qT4n+9gCRvxK9/jg5+INL8Ki6c06/ckBvpwDC8pe4dYZP239X/CCO9XtLcJybLcsVu9Sc/hkiQVB0KCJl44KpyuscYn6vCWSaL6JanXiFJF/dV83Xz5rsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by DM8PR11MB5654.namprd11.prod.outlook.com (2603:10b6:8:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sun, 16 Jan
 2022 14:52:28 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sun, 16 Jan 2022
 14:52:28 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott v2 3/3] tune-cortexa72: Drop the redundant cortexa72-crc
 tune
Date: Sun, 16 Jan 2022 22:49:09 +0800
Message-Id: <20220116144909.1924922-4-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220116144909.1924922-1-kexin.hao@windriver.com>
References: <20220116144909.1924922-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6356e51-c9ac-4a97-eda3-08d9d8ffd0b4
X-MS-TrafficTypeDiagnostic: DM8PR11MB5654:EE_
X-Microsoft-Antispam-PRVS: 
	<DM8PR11MB56548DA4A2973B68EC90DFD0E2569@DM8PR11MB5654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yb58GnE9Jls4hDQb4zd4j3BWh+NrXSs67P8D/oD9XNSXtIYgwerxo50oi+vVVaMQkdY8I5bha4K3l2TGEGQjl1Pv9Ge7ACFwfJ1vD+khXbvtiZGUxLHgjxICtkk4Ftr/ZAvJJgrztCMvBK5J8WHIaFVPr/DL+gRdwxjG1aAzclZsVo4VArHXnZ/av3JKXwedaqLcvGsWxkdj6b52peZ2mA20E/ETOT9EGbvvQ/iG7QJZfASUjPZtsNld7cce7aGQvIxCWfdTB2g2QDHbSfEPeQRY0hA37RB1xtucG8TDcJW8tfFOEJjRKpxe29p2NhJhX7uNfwvu42I0Uc7p+zIqWvxV5HUVuYIMrHsfrp/GkEQQCFtgVOn71A1qX8f1nhHIroQbFJeRN/sTYeGsrYTU9IUwgD8gi+j8f8QFJwzSegFITZ00Ix7MA5m9dbP2MSvz4KHAzwoPi8rYhiKCoGxxP8RWrC8iNbwvbT1qEGVVRYR2Fi51Tz1w/oV12wjnpbIYCA2Zj+iFog2/RN1LO71QeJGS2S0JXztfm3QmY0WOjdasrkZ0Y52Ry/6hi/5D5S5asz6n+r+XnHJGTZv+QTI/APQok+y03RW2sJj2JyVqxiJBYVsz2gEGWj7HaR5LzkRVdiQLHLtGG5UJvm61vY60DAx88EnBWgz1g725OhOvVDfpmz/keuv0eYLGVrXAQMuDkAKiNl7How+kbKGv/nF8nw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(5660300002)(6486002)(8936002)(2906002)(186003)(6666004)(86362001)(1076003)(6506007)(508600001)(36756003)(38100700002)(38350700002)(66476007)(2616005)(316002)(66946007)(107886003)(66556008)(4326008)(6916009)(83380400001)(26005)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?P0x3yJdaiXRqbO1VgOap4LNGAIfdARMTlIY6SoARpR7DPmge+lsQRaEKc0LY?=
 =?us-ascii?Q?Z1hsHrTmEunMylWXcqVkGBciPkbfA2oWk+XnRlywn4Z1HufGdseUVwuXTv2+?=
 =?us-ascii?Q?PwwM+xA36v/m5YQhmYEu3fTwwMlKuBySH9ePhBQ8nZx4VEFn0M+mcg71jAP9?=
 =?us-ascii?Q?907rSOnaYa9CiqBh6eUh8r1mQIh34TE1kNFBHrpb8nlL3P2qO2l5U1VrUvlF?=
 =?us-ascii?Q?y40tz2Sz38WxYiLxpd+M7L0vnEyQ7OgTzabRHuYMH2I+mS6fD35uicCjXAqn?=
 =?us-ascii?Q?A6DbqFOxSbQ/08FgRRnmDCxPR04ZqZS6EGqqg6F7sQYurNxR66pupvXF8zdO?=
 =?us-ascii?Q?880BHlPCf8G7DbRAEVR5TZfbfZzuRS1g+M58ThI04qGE9swemd551BkOcaDt?=
 =?us-ascii?Q?c7ZegyxBSxVxOEOM3iXLWFcXejy+PEi3ajU6a/lCVngdDrwZBL5youQl9zdw?=
 =?us-ascii?Q?xdCneDiTKKKTZEZZxIPMILChoxSeGMc1Agg9R58lcDHwVSr9p6T7gZ2EJhuf?=
 =?us-ascii?Q?dc/0R027XjOWB9mWSabEA6X0oYfwwZe1ZEP65hyICw4WKbMMso2zoJOZIAfh?=
 =?us-ascii?Q?FZFVtypeyak4VNYGoSSHlNpomz4QNb0fv42sM6IjNHuW1rSMT/Rv34Uz5XHA?=
 =?us-ascii?Q?SYDGhn7XtnfC9Hdz0lMqgd93i2cVX8Hea/x6qHHD2TR8VYK2d6We89OcX+Ni?=
 =?us-ascii?Q?aXuJB1y/iJ4Yb5mpjHqlH4pIKO0QTKR1oop7u4sA77acFb1wx29kKC52QsK2?=
 =?us-ascii?Q?HVaFi9C9sTvGT15w7EZaQ2ct2ltgD9JH/FCRMtClM41W7L0yNW/q2Dm/uUC0?=
 =?us-ascii?Q?f0Ltj0j8qF5mpbrPzKvp2nT1vFFGTeTKBUInEU4YbsmW2D7kSvdO4O6RYhaD?=
 =?us-ascii?Q?HMQrvVzE5TDNiole8DEO7bqgoT5B+rXPuZMcSlRDH6amv7vOO8ikWbWSzY+q?=
 =?us-ascii?Q?prOM+z+dx59nwYZkUmeLvtu00vEiYjQSHf3s/l4Gjt6K44kzkF3B1XZuChDP?=
 =?us-ascii?Q?ZxZUkkIoinrDoX2MISy9APxcTlS3yw4VHGmmanBNF0e3uPAyZgsO4e3Skqio?=
 =?us-ascii?Q?8Xs0E9WEYxGzUDip3iRZ5xNFNJCqVSfbwhrym8y3LkEDn7xD9earA9s8vT8f?=
 =?us-ascii?Q?tNvglFe8ryJGpmYzXMs2zoIxCVxQFNoiKWk4D+uZ6VbuEn+8EOZpz1c0iXJL?=
 =?us-ascii?Q?JGaLTkF3Zm96Lim7jeYSfre4hgarpq6vpzPAx9vNQRbPvKigQtEZW8sUAFTi?=
 =?us-ascii?Q?y0APGWfIyjc7PUHmGkSQjkNkcU3SA4hm/PPtFNWNNqpmWuH6coymkC+JKbhR?=
 =?us-ascii?Q?UK8KPqFu/TuFwXVY6N6PKcU6PsjcolP9oEza02Ekkgc5TIyu/CgnTjczdiJb?=
 =?us-ascii?Q?9X1GqSdLqru2SOK9VA4CjMCg5KPG+aKhN5OXjHe6hfkyLg8By9w9qWdZdhT9?=
 =?us-ascii?Q?HahaVOg6ANu9xZTPNB1qq5ViWt0GvgexQt6U9wD2OHZWVbrbZKk5UjkH+80z?=
 =?us-ascii?Q?LAOD1TCpIAH7A+UnPZ18R2AgQJTrCHdugJGoCzzyuhfipOu7I3xWZ0v+1HwI?=
 =?us-ascii?Q?v1VK1goloONGJDAYLqqMrmYo0zXk5Zr0+2psdW/Zu5RAz5oEopt4wI5/KUNF?=
 =?us-ascii?Q?8C1NP4AaSrioEyZFdGyd/gw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6356e51-c9ac-4a97-eda3-08d9d8ffd0b4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 14:52:28.0678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZNBrlqny1E1cK1Tc8wpK6Os3uOoxpJeHE8YfasInPXWljpU7MrIFW1G/GF+wr2AA2jSJi6OkNSqn1WnJQFgAug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5654
X-Proofpoint-GUID: 1ul5U8kLZX-TXYLDVXfKZrk2k2LQejR6
X-Proofpoint-ORIG-GUID: oJa5SuW24xVObG6loiZRFrNsA1tm0O2L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=363
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 14:52:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160611

We have enabled the crc extension by default for cortexa72 in patch
("tune-cortexa72: Enable the crc extension by default for cortexa72"),
then the cortexa72-crc seems redundant. So drop it. We also rename the
cortexa72-crc-crypto to cortexa72-crypto. With these changes, it will
break the BSPs which used these two tunes, but it should be easy to fix.

(From OE-Core rev: 03cebdd7ef923a8ac5c8b7c12c7cefe7ca0158db)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
v2: A new patch in v2.

 meta/conf/machine/include/tune-cortexa72.inc | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 30480efd8328..efb71ee0a1f3 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -6,16 +6,12 @@ TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa72', ' -mcpu=corte
 require conf/machine/include/arm/arch-armv8a.inc
 
 # Little Endian base configs
-AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
+AVAILTUNES += "cortexa72 cortexa72-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
-ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
-ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
+ARMPKGARCH_tune-cortexa72-crypto      = "cortexa72"
 TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72"
-TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72}"
-TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
+TUNE_FEATURES_tune-cortexa72-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
 PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crypto = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crypto"
 BASE_LIB_tune-cortexa72            = "lib64"
-BASE_LIB_tune-cortexa72-crc        = "lib64"
-BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
+BASE_LIB_tune-cortexa72-crypto     = "lib64"
-- 
2.31.1


