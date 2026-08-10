Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCDBC5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23022.1786337595536121234
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QvsONg/p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4iwHM1002694
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:53:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=R2W4t9rW4aWdHP16R7XZs9kXGRfzBiamh897UfVOfaQ=; b=
	QvsONg/pHyGlK22Dt4AcDkyuXSwsKxrXyXiPO2vgdD/EzC6FfMf+G9PygsWSn/3y
	WCy/PdRQ3sXTkgQeBda1j3mW31TjXOiASRoh/R8WCzmUWU6ZvxJK+NULaoPZu8NF
	ILzLOfn2D2rQ80C7jiuOy7PrbzLml/kOsPIKENyXC0XCWbjlvq1AOASmmlx1X7ll
	GEqxRJOgkbjA4iZfIcDjsrT3PlpxuUtQdkDmlB8/IXJ6Nf58ewsp01YkJYuhOcpr
	on+D1uOZLVuObJcpnKsVFSzTmUYUavbYzhogD7zF+FuHsTPK71au7FqV8PiLhMzq
	3zgghwmnGUKIygMPo6WiIg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwyr1smpc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 21:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFAdqcQczohOhcgQoOITcMZtpOyVmteAkrO2yKVMGzivydoShqWf6KyngiZUe7JHnMiJXNiiv5d5pLJ+tcvWjRui9SR5SBlW9Xm8+9/5gDU+55s3IsruPHeDI/mPpRe/4LXZQuK45S5OuNCiMUGl4i+wEupdTbt5lx4i9Fp9AoSOQHIDCUuSCcLiDmAxr2aJs6eHeRNqDVE5QCmB3IosvgNHHX5YaQQ2dyaxRaSj7wUBd4BCAclTgd+iP/pes88ezXK06bwkKEJboQ5RQ/+/IPHh8jDZXnUOdpOa2A3ikeBUnmQG8p9k1B8MKBVQwslZyE+R/PHQjheph/lyUMIg/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2W4t9rW4aWdHP16R7XZs9kXGRfzBiamh897UfVOfaQ=;
 b=V8cmmo1HPMUItSEqhATZWTLhQJClWungyOQkfRe//Zj3RAmTgfpYOP4trgjogMwUWb2I3A9bcn6cnCDbkAUlrfSzPe9D4llXU9J+L6qz56CEntNk+UeIc4LoXg/2jIvZCEbU4uJPWrYFygvqgU8EkkBwlhxHGZ9cDUzUVp7WF2hNR/4VIixLFO6px+oQplChCf/qgk2RratLm30N+qPFb21MOREqjEGOER2W352XcE7j4P83zHEZ1gC9ZOzhEhSxfwwmxgnZ0/0oycWDdKZ7saWXCTzpDn8+xzqy+7+zGmQ3WNKSZ/mfRLxM1sRG/WHf1kasq0BkZJ2plshXKB9WwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:11 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:11 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 09/10] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Sun,  9 Aug 2026 21:52:49 -0700
Message-ID: <20260810045250.3903576-10-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: f31867e9-99e5-4471-bc6d-08def69b4743
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|6133799003|3023799007|56012099006|5023799004|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	svXejcKBWqECUmZC0K/ie/TUZLfLeSgrA8gpbxWYP4XdEBYt0gO6IFvi7f8mEPXDx6vh3gsC0hBnXJCVK/9CchWRHH2A32hYTu+ZjOJ6+pUl46N/Th954caVtpIHIFI29kqSQKHTwDr//c1WaNmuhpyNLmRv66bmNEPbPH28O+xc//Q5FU73zqMLC5+/HZrTzNIVKP1Dgip48jFKY0eaZXj1ggQbbni2+CNIczEa/JLFhl/GwUtUQFV/10BcATcHBOa6Q4oE8jv1DiDYM24oGDfsaK3olCibY2y+LWQ0yTUQNKeGjXt0y75Kfroi2jetukcCCRvOYIKsD5E6KWFG8m4d4MPRweTZh0cX5+xW0WD4LMsfdDdDedzx+bMQzm/GrQv3lSZSfqSZZAiiwighuceAnc1JTYzKG+CMU91WNs9SqUT+Dn0/bUw0eVUhGc5oejmn7+8Ru6Ij0+8kB66aGScUR6js/QLq+lscMPYmLMsXlr6sLVeuVMJ1D55UAL8jSjwxHf6nPel1KiitP0S96gb73ag7e8jTBinGjOL6vo/rmR14hVs1oIFxg3x1iTSvOWxOvw+eq44JuuujYcGUaMatYRjH5eBrjZ0HqipNzC7icvviPjU27IzgQztuYp2OSLtcYuM+NXBrK8sgGdEdwyprdm/wWWw0Mz3D7R/OjP65EUs0VZzC0+WYnNW+WL8/7fQjxvpVDSFW7VWlVqcdJOHjwSYfppq+kYQRxE49/fk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(6133799003)(3023799007)(56012099006)(5023799004)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7qSokcor9ael1JeTaGDrnpzzJ525jASDlgCyh8gUWGDzUhw9tB5kzGl0pBVm?=
 =?us-ascii?Q?JM4sMOJmrN8mhD60JMDzrsFx04yJq+4vWAQXYih+8v9iD01d7PLE732BUQd8?=
 =?us-ascii?Q?fkEJBgempcsTo84adGFGwo4uv0RLiQy0h4g1IH6051/DXjQcslDKjKLrhr/Q?=
 =?us-ascii?Q?GDM3CLNXf6ON8yvv5xN7m7lo/RlJSMyyk7Skmw7VE8ze29xGeKEQWHTJgNkf?=
 =?us-ascii?Q?AS72mGBvRgE4zNga6NKupzUBvq/UvtWD40RZNH+VXhOJP/wpokA8h3wnthnZ?=
 =?us-ascii?Q?Tf5D+o4EX71jcLx6xNOe7eSVyYXZwzFmhY/t2NPmN8BTRv1fZ54Bq4xQPeFk?=
 =?us-ascii?Q?GIdpc8Fe1bTfEr1lDlCXT/8OlUKCqGNLRCM1kIDI8JPNyHLFhZwtfcqTsEDV?=
 =?us-ascii?Q?4GVR/jjdNxFNX1CIU7YIX3PN0jR2gzVSwh8t3H4a5aqpnpHn/zREu05HnU7+?=
 =?us-ascii?Q?thApkO+S814Uan/Jj+ENSwYbP4DoagS1KrA7C51uDB1E8PsPTOjiGGggac8f?=
 =?us-ascii?Q?CY07aoxXlknznTyvFiGORLEP2Kgcrdr+kLGcbrG1fZ+4y3QqTIrFnmnGVYFC?=
 =?us-ascii?Q?MPuUnzdBbgm351yxBrJuRbQXEkPNtGlNZWQ9TDBKevd5JWDopebMbl251Nnj?=
 =?us-ascii?Q?bftAlgjsmuPR9N/YVEMGAoYuKOAvcgvWWWcXPq7Xir/269uV17aurlyYH1uX?=
 =?us-ascii?Q?90riee59EwjGxdjdwBreXqqwVlnE9sWB39SYlb13T+1XyF4knT/Q2XLoVgn7?=
 =?us-ascii?Q?EQo3bBEMf2UATD4uzEr4v8hkQ6OiwOnde5Fj6XFE6DOzGIUqMKbaGS/LsAjt?=
 =?us-ascii?Q?z6gYiXtULkA2Xt4cdWi8QUoa7WXMSjHYnUVEQoI//inloTUNEPz5RUaR0pqZ?=
 =?us-ascii?Q?3hzmZj17TJ+FtWtlPa4HujyOq0+goU82GH94HPdtKpYknL0bggnNg3iNkUEK?=
 =?us-ascii?Q?HgWSMIXsc4kImMMCyDvZ9V6riXKpO6IynD5HkosCT3K2akaXAF0HvUuzm2pO?=
 =?us-ascii?Q?qr/Dirl8M2dGVLZTvh/Fxmg+18jp9Hdjf7pUDZPzESVUR4Tl8cIv0iLjNzpP?=
 =?us-ascii?Q?tyvOSQA//oJMfX1lvYoiRtM0M8ZU0cAYFG2WawL2XNUaAD+7FWAqFGio2WOW?=
 =?us-ascii?Q?Sd4fbjdKoKBGyolGnV3S4MsvKYjQiM5HxTsFC/W8Bm/wyKaT0il2YITo/O+a?=
 =?us-ascii?Q?taFxl7bF87mq3BS40Aro8XI74G6+jU5XXxSvJl8FE8ma55jYWbeQvChjygCW?=
 =?us-ascii?Q?3nWvyVW+uZut5km7vN5feI4wa1IjXbAF/6/qpYwRUP++bUVklhBauwUhGy4T?=
 =?us-ascii?Q?ud6XnyzaLqzC02wk9ZixLcxsbqb6dokK/d3/d3DfWviFOMaLXnv2rrKFCWWx?=
 =?us-ascii?Q?czDpOazbX3SCvDmb/LLpPDpKo2RfRJbxLunnUoyiXrdyyP/JuYj8P9GdhY9e?=
 =?us-ascii?Q?yyu2vYcAn9oeHO1eLd98Vrd3frrGZVb+KWxdGhgoD9SAe2R8NTBHh/L2Daod?=
 =?us-ascii?Q?x9EmsAAiQ/SkAczcYZh/7ZpZVmxwq1yiIURXoIU+aRklItque3EdKHFhwJap?=
 =?us-ascii?Q?Hj2x6ih1zH7wSD4bb2mwE5O8U8A/TCWjVu694Z4z+wQnDevJDlYGllC5vAcv?=
 =?us-ascii?Q?oa/zbNAi4NlAvHrCi4wceTl91ld0oGKTyd81MTPtzjZwz33u5pArfzQnNmbi?=
 =?us-ascii?Q?ynwUfnObGrVnsKVOoHODKf3uAmSjmhrQFrPCw2I84w4wfql+0qTh4Vjs47LZ?=
 =?us-ascii?Q?RzTa8/R5ShFLyqOcaRnXA/Gw6iP+3kY=3D?=
X-Exchange-RoutingPolicyChecked: 
	kZJ/CiFEzfQu7a5Q0qAoqYh3TkoG12+Oap4YMKrPSBtc7Toym+fIazKqQ1jGvKqGYgEnELjSly0720XHfshkA6eUKXDhPjR3kLBYh5XPS/GV0tEhhY1s49f0E8SQYfimHM6P15BkRncLIesBIwHxZMnhhBIfd8HcDWroR5rINj57ZJgjtzyluXcyLauao2ZKd7diFDjdyMzcFXKBShm7lmKHaYDQdgA5bgsLYhHO1l1rXdMblmV8rHb7P/DLiZiWdxn0KkWuWQGY05y6i+qMgqUMsdkWDnZ7tC7MBktZQZc62vflk6nhygShrGF5NRLw6KpzP76F0OeFgGeDZuL7iQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f31867e9-99e5-4471-bc6d-08def69b4743
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:11.0713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCTkYnc2AbD4z1gNMLMinpTvDdGoyzrep/4uNrLhveX4p0QaG02i3HrPxAtEKbYMu5LwRm+ohZErxnKQiUtyxhYLaowKC3OC2SsXm+mIrKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX3JyI+Ra5wZ4i
 SC4nvGMPwAR4iG1jwM8UyNhcjTqmXra9PAJf2dsOg6VPuGMPHBN5Zmn/f/6+3HIxSqliVekEVpn
 SbmOBmrWuBTKGBuyOK5NlM4N9SOE/ka49ruDHCHsq16wuOMUK7Ekpo0vJSI4sO3xUdm4zw7o/8E
 7d0IMioWCdJZLSqcUZ+HhX3sAT4cg5+bgcEJZkrU1HXObMiSkdulgSDNzYMHyVSaDXiVReAy16I
 9OoNVkblv81J3SsmoentbXKXpIOucGZoyLiaF9PxNWiLjalU5WyF0MBoRUpoFlxjrRQUZtWIcEo
 D7vW/d0DgeIHGoPwND57b6/1cs/uP7eyBYjZTddmDvqvAjUuLOZXbUS+8FUJW2YJzoUx5pWiYNh
 mmuJJ0QYGV2AkbJxam8As0r7IwE59mAuX1e/eUDMTay4HZZNtOJDjoB6MLT3M55M5YLDGa3bK28
 sxJ6wdNPY/8tZq49gOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX5hN+8OTy+H1/
 jI5LZCXMdcz3VKQbPzqacw8pJ7Wn55eJz61ub7V26wAcsoPP0Tqf8C7+KN/256myZi8tgkiujpZ
 39nP6azvPK7i+uQ7ZRFda65+uxQ20OSDxdb6opEeYS2idrL2yONd
X-Authority-Analysis: v=2.4 cv=Z5Lc2nRA c=1 sm=1 tr=0 ts=6a79593b cx=c_pps
 a=CjRpyDoPu1ZhyeacGh9KdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=A6YZNiJOG_xbVXSWyD8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: E4D1lgka0UykY04NfTIF0W8z7Efm74l0
X-Proofpoint-GUID: igF15cnPpM83IMjfG2Jm8pOPU38O9LiZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243101

* Added 0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
  - rpm 6's internal dependency generator runs pkgconfigdeps.sh during
    rpmbuild, but OE's cross-build environment exports PKG_CONFIG_SYSROOT_DIR
    which causes pkg-config --print-provides to silently fail on .pc files
    in the package buildroot.

    Unset cross-compilation PKG_CONFIG_* variables in pkgconfigdeps.sh so
    that pkgconfig() Provides/Requires are correctly generated.

    Without this fix, do_rootfs fails with errors like:
    nothing provides pkgconfig(ogg) needed by flac-dev

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 ...Unset-cross-compilation-PKG_CONFIG-v.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_6.0.2.bb        |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch

diff --git a/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
new file mode 100644
index 0000000000..eccf708872
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch
@@ -0,0 +1,71 @@
+From a1b2c3d4e5f6a7b8c9d0e1f2a3b4c5d6e7f8a9b0 Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 04 Aug 2026 23:30:00 -0700
+Subject: [PATCH] pkgconfigdeps.sh: Unset cross-compilation PKG_CONFIG variables
+
+In OpenEmbedded/Yocto cross-compilation environments, several
+PKG_CONFIG_* environment variables are set to point pkg-config at the
+target sysroot for recipe builds:
+
+  PKG_CONFIG_SYSROOT_DIR=".../recipe-sysroot"
+  PKG_CONFIG_LIBDIR=".../recipe-sysroot/usr/lib/pkgconfig:..."
+  PKG_CONFIG_SYSTEM_INCLUDE_PATH=".../recipe-sysroot/usr/include"
+  PKG_CONFIG_SYSTEM_LIBRARY_PATH=".../recipe-sysroot/lib:..."
+
+These variables persist into the do_package_write_rpm task environment.
+When rpmbuild's internal dependency generator invokes pkgconfigdeps.sh,
+the script calls pkg-config --print-provides and --print-requires on .pc
+files located in the package buildroot directory (e.g.,
+.../package/usr/lib/pkgconfig/ogg.pc).
+
+With PKG_CONFIG_SYSROOT_DIR set, pkg-config fails silently (exit 1, no
+output) when querying these .pc files because it attempts to validate
+paths with the sysroot prefix prepended, which doesn't match the
+buildroot location. This causes all pkgconfig(...) Provides and Requires
+to be missing from the generated RPMs.
+
+The result is do_rootfs failures like:
+  nothing provides pkgconfig(ogg) needed by flac-dev
+  nothing provides pkgconfig(libxml-2.0) needed by libcomps-dev
+  nothing provides pkgconfig(ncurses) needed by libreadline-dev
+
+Fix this by unsetting the cross-compilation PKG_CONFIG variables at the
+top of pkgconfigdeps.sh. The script already sets PKG_CONFIG_PATH
+explicitly to the directory containing the .pc file being scanned, so
+these external variables are not needed and only cause interference.
+
+This was not an issue with rpm 4.x because OE-core disabled the
+internal dependency generator entirely via:
+  --define '_use_internal_dependency_generator 0'
+  --define '__find_provides %{nil}'
+  --define '__find_requires %{nil}'
+
+rpm 6 no longer supports disabling the internal dependency generator
+for v6 format packages, making pkgconfigdeps.sh active for the first
+time in the OE cross-build environment.
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ scripts/pkgconfigdeps.sh | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/scripts/pkgconfigdeps.sh b/scripts/pkgconfigdeps.sh
+index 1cab58169..f9a3b7c21 100755
+--- a/scripts/pkgconfigdeps.sh
++++ b/scripts/pkgconfigdeps.sh
+@@ -1,5 +1,14 @@
+ #!/bin/bash
+ 
++# Clear cross-compilation PKG_CONFIG variables that interfere with querying
++# .pc files directly from the package buildroot. In cross-build environments
++# (e.g., OpenEmbedded/Yocto), these variables point at the target sysroot and
++# cause pkg-config to fail when processing buildroot-relative .pc files.
++unset PKG_CONFIG_SYSROOT_DIR
++unset PKG_CONFIG_LIBDIR
++unset PKG_CONFIG_SYSTEM_INCLUDE_PATH
++unset PKG_CONFIG_SYSTEM_LIBRARY_PATH
++
+ pkgconfig=/usr/bin/pkg-config
+ test -x $pkgconfig || {
+     cat > /dev/null
diff --git a/meta/recipes-devtools/rpm/rpm_6.0.2.bb b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
index 32ddebe407..4644051fa3 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
            file://0001-pkgconfigdeps.sh-Do-not-emit-usr-bin-pkg-config-as-a.patch \
+           file://0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch \
            "
 
 PE = "1"

