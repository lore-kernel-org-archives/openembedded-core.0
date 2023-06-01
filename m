Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B78EC7EE2A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 14:48:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33358.1685630875075365530
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 07:47:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=noEm0AF/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5516044bcd=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351Els6S012102
	for <openembedded-core@lists.openembedded.org>; Thu, 1 Jun 2023 07:47:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=w0O8HY7W+HkuX+oXooD+E1i6RwrW112s1aSm7Fm3DGE=;
 b=noEm0AF/xkgzD8aOL+TfJPRXHLVcmoF1C7O4PL9MIlt2iYMrHpFpCnDkNFrZFebOwL5w
 7RgFiSB9yrVWlEj/S41fRQw4Qv5sKOaspwa2xsqduY/0e2QPxIgR+1tkvblw0XfaGycJ
 pr1usEWZJN7EH/wxVJkdKSIKZhFfDdlVQ6tFTZrTr3r7/NwcPMDzty0Z4lRq2dZKP0WJ
 NC3dQU7qfTaM3gyoR0O2wyUl4gQj6tgJ7BEnHEn59oBKLgtVu7TvA0K0GpASzAxgoBvW
 uPy3jVSwI1kCXDUmD1rMi6AVjOIIsEeKShzd+Z/EzhMBB6RmyBleKATKr+GTZLcI1UvH uw== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2174.outbound.protection.outlook.com [104.47.73.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qud53cr4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 07:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeIgzPs7pFjIC1Ijqq+9ZmLO18Q2FAiLozoJoHchPeaVCfol57etgp2knM7CLSMX1WPPJvx4cShKL8gd1JblCQBTME+7x3m5WGjI6VJ3vFOfdb2Curaj3Q4THh7p5aaiiOxz0DfPTkSK2aCel+3XM/cKup9d0gc8dMCXnGbFgBLe045SM392AmKkiiKTo0I9rT1Dxa6/uaRvLap3HcyOo2MkESY5q72b6bYC4r6+tg8xhmHlSTS5OvGYPIcz2Lum8r+9S8MEcmp01Zcx2pXj+DuujAKmqajBi03tzKGQAX6BbJ9JkwfxEl/xl0/EbeCMOFpDufFYteNl44gFT4kCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0O8HY7W+HkuX+oXooD+E1i6RwrW112s1aSm7Fm3DGE=;
 b=QIjkbthc3H1zoySlmLTip3IktfxO0dH8w3ckoRvNkrbUgrRoo1DksB47+LGHtEzGyvpA2I0tlWooaNs1AIU+6AuEbhoSCEMFOysXn7kvM1tZkYJudrCv0AtJx1S6wKL+IZQomnAzWsD2+oVhwiBCDnNFzHfkJ2jSG8OY1OQ5u+aOGGMDwum1PXxwF0+M6CdhbrcVKeC8xzAIv9vqxvZzxasv4sUYG4+DxIrANj07Cs+yFp6j/KP0Mpznu2qCTw+N/AjJrM+rdq4wO1crF3/FK+iPOqATuyuJDS/F9lItkPeUqQwjf5SiSnlaYettQR+QW1V0s1wKl5jlB5UQcnhF/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Thu, 1 Jun
 2023 14:47:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 14:47:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] cmake.bbclass: do not search host paths for find_program()
Date: Thu,  1 Jun 2023 07:47:38 -0700
Message-Id: <20230601144739.1525861-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:a03:100::30) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec4707a-7958-485c-bbc0-08db62af2d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RoGPJpQSWH232senHMWI5cCRYEhGOnqZR9UlSJlX/oVQBsyvNqR29LMSAWS3O4tC8o80Zr28HV4A6nEsPhVYUjhCy+pKEkj7vVs8XelJ0ON9OT5udJ7a3/zdVvoWW5ezc3BzOkPbuerJ7MLViAhCDvwGcvy5ZvOQ7TyDx7V8ynlcOcYY1PqTPXhkSpuAVeC+K1JBFAGcxKbpokcRP3Q7h/cNjTGYSKb2SLDjWquU3q/HOI7XAYlKI49EBdc8Zm87huwelYfuSU8GYGLkUIIELRGytsDjTE68XvBndnqtVMXOGCNR1Yusd8NUDsFUoZvr6225ZQn8sP0dqqoJmxRcKuVtyuKa4rbOJaW4L0ur6vFZamRXd+N7lmjI+5tQHXmlZIABOe/gN+3uzz8yanw3gEOXlJFlorq164LIuKuDgdI0U4UuGoIoA3x/6IabcG1+gzb0aWGbIcjSOvoSCTAjF1i+UbMoIoCoDqpAM+18e4zGRlHBG/0PIBqrgCjLttdMigse6o0thjD4Bk+fLr3Tgl2GkNvfwVrZhCwmSsU0c6SbXLXtIacAj7jg86NpvYgP2baqI18uhJfziXgewuBrZ7210Tad3F+Tcjbp1JOAa4g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(366004)(39850400004)(346002)(451199021)(9686003)(6506007)(6512007)(186003)(2906002)(2616005)(26005)(478600001)(1076003)(83380400001)(86362001)(8936002)(41300700001)(6486002)(8676002)(38100700002)(966005)(38350700002)(36756003)(5660300002)(316002)(66946007)(6666004)(52116002)(66476007)(66556008)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ea4kpwV/8WQkg0Y5Qb820vjX7X54e4nUzPkc0B8jmf5SjedM0p+XrRVsrYvw?=
 =?us-ascii?Q?VI8DIu1JNnWy8/puVjdNqKq3MWe3t0kkziwhGbSvO8gvTNbDzxJSZLCkOzk3?=
 =?us-ascii?Q?ghJRcdpk9cHfyfeJZtbJFUb1sNfv9Nmm1YyfXvjpCh3njllnGy4QOjBZeD8w?=
 =?us-ascii?Q?s/VpZ9ziUzGj2+8KfX/hl2bpWEUS5LmHjslZMhOehmrfft3GFtc/GxhiZ3uR?=
 =?us-ascii?Q?kHrtv+GqpZc0tshlXZ4XhCzRaBaldPXsb7xlV7wmgBm806R6empCEFkrVqq6?=
 =?us-ascii?Q?t7h3AD55XPSE0to8yCMjBLUWTUlpCDVGlY+c17chCuLWojHMH0Dgpmp+GDMZ?=
 =?us-ascii?Q?BayMDaWwWwsE7m16HzQGahGTqWDYahGeXp7g56kJZCsKqH5OpgjArLtt0bk3?=
 =?us-ascii?Q?Ja8tjhVduBl27CtOp0+hthEjPPeANw1m52F1od+ihGWcpuFuX8U/ZBkYEM/t?=
 =?us-ascii?Q?l+xTimII0gaTLsAnqZjxW29F6XAl96g+6ObpHzbh/MIkESSmwCVczZAGX4to?=
 =?us-ascii?Q?nDUTnXyAtoAN00bJ73wTvoIOoGFqc9zNYqQq8e5Zw8DsQOlVSDvJyeaWL1NX?=
 =?us-ascii?Q?HGEJ7fYKtj+37+6Wp0K98cj++I/ghNcIDyP78fMHLG/kuF0qvItDwO2/zADz?=
 =?us-ascii?Q?ftTbifWNFcvkFZo5Ca5KPkYcRUB6cG/MRNtus7f8NSt2v5ojVxTC8OrzOzyC?=
 =?us-ascii?Q?3Lv4E07+Vfe2hwkp7y3+XLAeDkX8I8bjy8Mli3QE2R8BmSALj0uYI59RKsaJ?=
 =?us-ascii?Q?ah4apYejb3+ybjuFvg3W3cCMbBlPjfXGiRWX+NkycF28sEg9Bk/0wKYA9Zag?=
 =?us-ascii?Q?yTaQkrlMCR0nDmpLt/WoFgTVlh5+h4KYonhhfsK1A1qQhXpkwGGEdCf3Nm1Q?=
 =?us-ascii?Q?ipchz7NHfF2GCeVJMuPBE1IU/KyCwowfeMzYAd2fLUXRKmcHSg9umnrN3qA1?=
 =?us-ascii?Q?EzfuoZxkr8qgdFt932WMoeKrHoUx6uG3ACU7VBpTAAgUoPV54GH2WnNDPszB?=
 =?us-ascii?Q?KvV9gc6+h4vXkFDJhHhVe7i0WdQ0oUs+ttkIPjGfpZZLXp0YnTts6F+792lz?=
 =?us-ascii?Q?PCmGD6vwn3Fb981O749pgijRxWJggPth8KGcmsIL4tCKtEJh/7xc2kTIovux?=
 =?us-ascii?Q?YqzTYlOwYbz7mH2Gi492j1j0poh+bqADRrEGlDEICpCUBGMe2wwlemiV1olY?=
 =?us-ascii?Q?nUaxoHKaE+Z6Sywi/qUic3bsbYGGcSCn9HAwJA0k4QMbpIW1DRWVpxjqi1P1?=
 =?us-ascii?Q?HP5FZGNWTJi5XLsdNNsSdxycjVY1BXlJjJo56NIq72gY6sK8z5ciEGmcyrDv?=
 =?us-ascii?Q?AUlpNUKnQUDWu7SuyXwNsGQNwYpePQePQwc6FphlWGKiUc5hjgJ2E22cuUTK?=
 =?us-ascii?Q?EbyGTZ/y+/bo3LSyIPDjMwFhmbNgAdLiH9g/1TeZyQYAasa610FqWpuNFVme?=
 =?us-ascii?Q?mg///vSM1XaqQiZxy37q0Cg7M4fLPpcxeCaLsKE1Sf+s61ydV722cqZPSTAG?=
 =?us-ascii?Q?FAwpppMc9yhQ+1g6Keq06q4jJ6F1DkncAc4JpQpXUYUjTM1oRE3T1ucZ1TIc?=
 =?us-ascii?Q?VkN9TAdZbwfb3B+69rTkYKHX+u297ML+P873jXmK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec4707a-7958-485c-bbc0-08db62af2d31
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:47:52.1865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 40C02Sg1MLzj0XMztvW9DOYyj5qrir/fKQzPX4cAhcAS7yBQ14SJiZdvY9ouqtJN9f9xU5AzDVmnAMGGmxyrug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-GUID: JerN0QoPzYX3quvEVXQEUEHSSXPZi5KL
X-Proofpoint-ORIG-GUID: JerN0QoPzYX3quvEVXQEUEHSSXPZi5KL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=646 spamscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 14:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182115

From: Chen Qi <Qi.Chen@windriver.com>

OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM[1] controls the search
behavior of find_program(). When this variable's value was
first used in OE, it was deliberately set to BOTH to allow
searching of host tools. This is to ensure the necessary tools
from host could be used. The downside is that the configure
behavior may differ on different host environments.

Later, this cmake.bbclass was added the ability to search tools
under the HOSTTOOLS_DIR. This means we no longer needs cmake to
search the host paths. So we remove the class-native setting of
BOTH.

[1] https://cmake.org/cmake/help/latest/variable/CMAKE_FIND_ROOT_PATH_MODE_PROGRAM.html

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-recipe/cmake.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 301367b515..0dda104a69 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -61,7 +61,6 @@ OECMAKE_PERLNATIVE_DIR ??= ""
 OECMAKE_EXTRA_ROOT_PATH ?= ""
 
 OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "ONLY"
-OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM:class-native = "BOTH"
 
 EXTRA_OECMAKE:append = " ${PACKAGECONFIG_CONFARGS}"
 
-- 
2.40.0


