Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD991105F798
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 10:50:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13006.1773398999341547399
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 03:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=D7owMWai;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532d94ec9=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8sTIA418831
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 03:49:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=0DOpQB1ELe/qY/pvV5SNci/gFWiscAwKU7wkPfqw4Fg=; b=
	D7owMWaiJdWl1pKfmap7hv2fi99z7djfMvxENCi9qBn0Ik1TF2c1DR++2CqLFNK7
	cel0booC0ykhLLHHjjoAJr21ZOcnFn+ivkod4NF3WEsdH+LewVhZax6cPU7yY6o4
	aIEuC2FieC+h1pET7n+Vjnrq6mm8gu5AtU/IhZg0T1Kui7ic+k993hXoKyak6BSt
	XDc0bV64kxAJ5qzGefHItmpYGbgAw/KPqDKSpo3yEMRwxN2a2C/5dbystMW2H+TE
	17QK1t84LuN9PYJ8ykV7mahRLIGzL0Ba3PzBkBogNkg+9faoCs7wU3ypbUP0kGNg
	oCsrjjZAl6iJYGD/QQ4KWQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011001.outbound.protection.outlook.com [52.101.62.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6ta08a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 03:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n79pk5epNPVDEfs+TVqWvLcMH7V6C+VYmQq86WyViWmqjtyhpjGKVo44/yLbqI2uD1NPWZZPoiWtiYxW1dp6fpxOOpMjJtsu+6dhhzFLWwRJo0HFK+2iufToPYmKLuqg/h9MuzVAG448niGj2xnW9XsnOCx1BXG/MbBM2JPUr7PRfOVO8w1abT2JI81ak8GDLr80b3IT3Hqwzvt3aOUbMOqFpOcurry6aeorpTqKHvZrA0wNhj1ntz4f0V8LR7AReNa0Aa92M/U+oG0IJ1uqabPxTQJIRIQniZpZSJctiJB4pY645+GfQw680wgC1Spl0HJZ9PkraiJcdhYhDmueXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DOpQB1ELe/qY/pvV5SNci/gFWiscAwKU7wkPfqw4Fg=;
 b=OuWI0bqcsREEt6LUJLTGeA0KYwEN2VMN1otfpSF5QiHOJpPmKbZ06n+whDJBUA4Lmx6HziCLHiPGJVDudQMXdo8Te3G1mia0qyXnPFGY63b+1+CIzxLMbZjfzqpO8eYEvN+4ZRc5Y+Xmwa5Wxrm312Hf607APNk/y/d4kcuOSoiIwCa/wUxVikCCMRhSaGdXPKUp2MQZ0DU3LMbO4YMofTQs+Mn64j8Np8U2X1UO0d+lCtyFijc2+sbwq5QFqGT2JfMkkwy21o5Ph2TDNvNLUog9DJBnZxxTpzpFMi1KnRfMJsjLs4ZeHp0v0tY1TSChP3mSVgI+RPKX4SbZfYol3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Fri, 13 Mar
 2026 10:49:55 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.004; Fri, 13 Mar 2026
 10:49:55 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com
Subject: [PATCH V2 2/2] webkitgtk: remove PACKAGECONFIG soup2
Date: Fri, 13 Mar 2026 18:49:08 +0800
Message-Id: <20260313104908.449221-2-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260313104908.449221-1-changqing.li@windriver.com>
References: <20260313104908.449221-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0116.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::20) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: e49ddd14-0bfb-4fe2-0861-08de80ee4348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	RqBoAB0X+7+5ZfweLdxxVPfJv4XN0sE4I3gqU0epZAGgxovHsqnIi7scQR/nRZSdi6o4+0QnGyLau3Z650AtByPuHPMsdu+khZJHKNvCuXXj8hz32AYquHSIbHsWwGGdTbBLYwXrQnMM37GV9qJ+dK+fDa+eRbHCHha6xAhUW6dsFvpcGHBxdA+0KEB+MRX0mI0XHCwmrG8r/hjUGDn0eZ60QJmAFRud+KSEjYALUdeBlM30rPYzbN8/eEmaks8/KymJEaLo/UfKGPoIwTDV/cFkjZ8TGs4b53rL7ivcNoa1F8lXni42B4MZcUdVeH0avjJEb9dHSuA/5hFLUENFlF19Vp6PXeqkHZ1Gjv/l/a7xLvIlbXexV9MhtI1dt2lX7JZGLzDe1egnM2sYWUJZSMJ/ASvFAQqrJZ34rIEqS5QxnhsZ2lx0kdZrxRfybDAcSsv4tS3rsgXX0rQgdGB7ADejNjwN4+ac6v+cJuLofDd2Z5i8i3v59NWovjYiX36GgkGyhnQPjFobZmXeJdGGlVi4ZUcP4lZwCfO9T/W+Iqlsya6R/72WSvp2+X8tVTNLAMd0hGm0HG5HplN9gm1YgaDJPi65ZUHfuIo6qEfNnTmLrk/Xio64jIkohbmnfJCoSfu9qCuvv3VAz1yuNC+VrOscXGsg+NSl/ShbfUfTit1H2wDwwuruf+hVntJCpAXSbff0VefRG81UOeXsT+flqtho4R0bXCX4oFE8eVoHGECwhde/vRSp8QAovkT5qlqs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o88sP/KiE3AwMZ5QC9hAy/a0PkcvT1A6nUkH0NzJSOf+gqD+YfbkwuxNwPDR?=
 =?us-ascii?Q?R5LDOHHac/1uXbaLZ/CADvfx4lLDZTG/3/dkuD5scJovZLQgvdED7srIZwFk?=
 =?us-ascii?Q?hj20xC8k+dpPfJbl80ZZJFKHaUsGVW9yOSHfk2zEwY9mPA3y0Up9hSuABPRl?=
 =?us-ascii?Q?dBymG5xI9xLrjJsgnOOCgSx8JzhZ0I1wiJU0W83ClCQ6iWU/gbM5doKyXbOt?=
 =?us-ascii?Q?6u65fna9qkWHpfoYqBx1N9rrZV2Z7IjXb510z907j18YD+Xh9AstePlkjIRf?=
 =?us-ascii?Q?TBejPGYXQhoJhvuJzHakcVWtLurmC1Qx0PKlr0od6R2b8fztyCpJr6jyrl9B?=
 =?us-ascii?Q?ihytq+sgjt16wE8TKIpgAxPz979H+PW5/BhMXeY2imnGxy90i+k6daqkx04+?=
 =?us-ascii?Q?8L1FVmzwwyedh6ubz05cSmmZKjlE/HBAGqv03D5DI/XQIviphVDiQMsb73/0?=
 =?us-ascii?Q?eB/2Nvcz8+IxJvxm0oFGXnWoAp7v5Mo+zdqdX+wLAzVT8SigAC9hTvSmXTip?=
 =?us-ascii?Q?PpFFpDl/4HTsyTiK7mbMPUGVY2p+EB/ngSWS6REMAvuS5IVUb45X8hYQvSLF?=
 =?us-ascii?Q?kKeDE/68UatyHQyj8T6sSYaqB5zsZ6GXrRtukpYVFI9wJOI4FMsUJEWly73H?=
 =?us-ascii?Q?5f4os6RndkuSVxUZTTgDQHtXrGvnUa2PHe27O8RAHuoXnfX/+dctY1MwQy55?=
 =?us-ascii?Q?gC8LcHOCdYpPnt/dD6WjtVtVQLx35u2R0FAIPmyGUDZO5PtDMCCNWDNrdscH?=
 =?us-ascii?Q?Nj6zyx5xGn/pzsCjoYDB6pjEfpM4N4MOu0ULWTs75ffXQkr6EQWjMGDMytuS?=
 =?us-ascii?Q?taJJjpzvDSCW2zzDcN/SMkT59MlPlkVCqR01GaJmySJrFiEtJXUEJEDNnq4w?=
 =?us-ascii?Q?C4tFKR1N/cQV4TtXJyL9/4yQ6xiM98PrfcMfx4e8DPIQBybSFWLSbbqND+cy?=
 =?us-ascii?Q?HOwU1rBOPP+Apkuc4uKyoDV0klqO+hVIg664idUUcV0Q2P1RSeNUVhsGLlYs?=
 =?us-ascii?Q?cZEt3Mjfb+ZGC/mW0NZMlsoErR7yXtysj9ynm5YfdAyaVJtAcwTkWCdZSaOv?=
 =?us-ascii?Q?1oFYsSC2taMCwjiY6rWmGrRCI17dvNh6x7mDBQAU6udzML8dT8G42/3bf0qr?=
 =?us-ascii?Q?gxcARNLJU2X6NKSTY7wfJrQnDFH9WQu7abuTFmUY4gGt+EDZgnIydZAP+gGr?=
 =?us-ascii?Q?LbzO8lkmsGzA5UOy/UIROLYJu1ZG+oCCW/yhj7xpB7IPZ/nMrdwv2evRsyi9?=
 =?us-ascii?Q?ZJ9h0nr00utX2bR+3OL00ZijpNILxt5sIBI5lzixlOaDgzwd4IfSLLv8Ofam?=
 =?us-ascii?Q?VaNJd8jQ6+0cT1/HXKDdMZb3SBveq5rEa1uCru9maubiFuwAqJuclCW23N7S?=
 =?us-ascii?Q?zwvwYqxPBStL9z7wWgnvoepB5pmG4fWxBW860bhVs7Ee9M+fpNzmjAZqufzW?=
 =?us-ascii?Q?blrGgtkTGguHX/M/syZSxjrQDGHfBHyA8HqjC1ozFa/awVkWXV/gwGaexv4b?=
 =?us-ascii?Q?A9XB2y7myPgu8aw/h9QpxsJ4Wa4kQnClJkuu39dWYgpmCcEylMSuXkL5rMOd?=
 =?us-ascii?Q?jl33+mvN68HEzc6klydOGDljQN9dyfNoLG57SCdJ8D7jxxmBCTJPl+YZrmHA?=
 =?us-ascii?Q?SbDNOZKntyr7KvKprlH3j0MGna9VqwxIszh1EB2MjJ2Bo2ot23ATQ9dfTShn?=
 =?us-ascii?Q?mYpwAcP9urW3lRJBXWIpRnWuzZdDiupL6zJxtjLnqqlcCM2++i4eSdqPUjGZ?=
 =?us-ascii?Q?tPVIDJ9cXJQgWIzVFbnDbyx7YIGWkKQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	o/3CMB0p14ykpl2CAbobTKB44l56vTEpPnIjYeW/KYuKuO2MCiBUhnR/QXd7rWRC6/BSHvWioreUZgiOr7NJq5HcADtYaRzikhHuoGehLBBfl2Kv+uzvhuU6F2sfFdX+dQh65b7v+/MPNWqJhHpN8MsqJq/CiiT014o/VhE/4nhiaOpj6YTTG4d828oB3k1nYg5FqEgRMWYf+8JLRFJ+S3TUy4HmGzai9TbxOW8mLKMMObS9pBLN5tPKeCO+OUglbFekwSwU4WzcBeWWNYLKMXb1O864VIKVPfXq0BDlkGdfXSg2XDVm1qqli/cUteTdXrp7S6ksRPRMbEPSLOMaZQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e49ddd14-0bfb-4fe2-0861-08de80ee4348
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:49:55.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cUcqFcjohdm+Em4Su9tF+PqVFZNQA/5e3Ist4buHuCcia8t88rC6u3FCee1Bh8IDqIdiOY4vNmDc3FdkfOm6BIX3qHuubsXejTI0AAbLpSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: r__If_V64A4Rf4wQuttb4tyA_03zLm7C
X-Authority-Analysis: v=2.4 cv=Cf8FJbrl c=1 sm=1 tr=0 ts=69b3ebd6 cx=c_pps
 a=erT4cWMnywdrD7/NC3b1Og==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=LXCGm8LIAAAA:8 a=t7CeM3EgAAAA:8 a=IBxIli6kHwKOGcHDB3IA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: q0Rlp4r5cFk8RCuucZrj5A1UwH5APBcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4NCBTYWx0ZWRfX7KYZVXwPJV1n
 Vkg1lGW8irsLvlwCvo8tw8PSjm5DvjV/JJAYp9JN7BrPhkQWV/LiIm112MBG9HWDn1HDgRIrjPH
 56LI//Db+MeuqLuZ5jDqVeqlXdcAlNRRwWXmRAoNgy0d/uumJ9n6qKX78Uvo6lajLahglbAftMA
 U2W/HPBSsFrzx0GTzm3ox5wPzrqaEsWBCXEcz0K69tg5/qbshEuSbgL8+QhCEJVfdRJtpGGVdVS
 K1g1St08NpwG1uLaRkdN8N5hW8T+KyHN5nybtyr+7rifK/B0idAg7o66KraoVjj6WrHDkHjSaWP
 qRAwTyz7+d2KH09WhWdW81IVMZQwRao8A5FJibV4YoAVmcvS03AB01prBhSg9UxDFd70nob7OG4
 MJa4YMA7lpxs/zeia8NhZcjijJgXZ6hkUX/0GYnwL7Q65gBSdMELrNeDJWx5cjGHoenaNpAzGfL
 RVLCDDBrUGBvTFZmG0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 10:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233038

* libsoup-2.4 already removed in commit [1], so remove the soup2
PACKAGECONFIG, which may causes depeneds on libsoup-2.4.
* soup2 will not be supported from 2.52.0.
* webkitgtk build with libsoup3 by default, USE_SOUP2 is OFF by default,
  so also remove soup3 option

[1] https://git.openembedded.org/openembedded-core/commit/?id=94ebc5b798aed6eea642c5e2a4df24b386520636
[2] https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.50.4.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
index a1b0a72612..2cc3977694 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
@@ -44,16 +44,15 @@ DEPENDS += " \
           gstreamer1.0-plugins-base \
           glib-2.0-native \
           gettext-native \
+          libsoup \
           "
 
-PACKAGECONFIG_SOUP ?= "soup3"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'webgl opengl', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', 'webgl gles2', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
-                   ${PACKAGECONFIG_SOUP} \
                   "
 
 PACKAGECONFIG[assertions] = "-DUSE_CXX_STDLIB_ASSERTIONS=ON,-DUSE_CXX_STDLIB_ASSERTIONS=OFF,"
@@ -73,8 +72,6 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
-PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,libsoup-2.4,,,soup3"
-PACKAGECONFIG[soup3] = ",,libsoup,,,soup2"
 PACKAGECONFIG[journald] = "-DENABLE_JOURNALD_LOG=ON,-DENABLE_JOURNALD_LOG=OFF,systemd"
 PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
@@ -94,6 +91,7 @@ EXTRA_OECMAKE = " \
                  -DUSE_GTK4=ON \
                  -DCMAKE_EXPORT_COMPILE_COMMANDS=OFF \
                  -DENABLE_RELEASE_LOG=ON \
+                 -DUSE_SOUP2=OFF \
                  "
 
 # Javascript JIT is not supported on ARC
-- 
2.34.1


