Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A2DCC7EE23
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 05:46:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3525.1685425567812617355
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 22:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=q8d+Rms4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5514bc5d66=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34U5fr9H013253
	for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 22:46:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=71QiASRhJgSSRrgMOr80823TgPrsCbDfDayD5CCZBsE=;
 b=q8d+Rms4Y7JKEyBmX8xKxFB4QtxdkQZmz2/1J7K/oAUFNOtuk1OeRcXwfGP5zEuKIMOe
 j9cfNjTXxO6jIQtRh2RVdLhvpyfsXGD0vzoFPbaQse5YzXj4oZ/GjErsGJHS5rePFzXE
 AWSkdiOjUQO5EtGOz1DyT9PGWT87Gfr0B49Ad3NeQ6LX5jWPS0BTq78IcYH3RjFAHXIh
 IjbbbJ1ak53pC8FQ3rV4PSHFEw7ak0xAEW9F1JQpM/uxOI5KxBKvbMVjo4NtMLoJZp2q
 FE9Pb1xHyU+UAR20jfvjqzDLUTQAlPK4ISKD5dQIJn40hvtAN+hEvK6EwVUX6aMjpmgK Bg== 
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcj9xys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 22:46:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcoEY/1COzL4cN/SyIYwDZKiuAvjw63BHdq3bcMFS/tAKXmmPPWHyyAxBVwxdfNc1mZihYqHmyjTEmZ8aRPX/LH2eaDMmYmPkqA+7oKsa6kFWoEbw1nW6zbgk/RXApF6IbQNjLXOkWMNDI3D2s15QjqABiCJpuH2KmIYTsPAV7BEheKAc3sCuHjsl7K8fnfwt8KQRwLmqbGr60pED5VATCmYFBXZWlMOLWMmZ/3NZexZF6ekPV7dBalzjngiNFWy1oSK6bQaT3hNCPr82lL4WTfAhncp8YFewaU7dMG/+jC8E0Kpy5gyrHSOmTS/j6NtLOieeh4wJiFD+hPjPqtkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71QiASRhJgSSRrgMOr80823TgPrsCbDfDayD5CCZBsE=;
 b=mO26Ou/YCGbiSly9phE9a3K83uxqVXPT/DQrUHXJNI26MuM9nGCWU4AqBOQjA/owJHUDPUF2BME6rXkXSPlCwwp+xOKrOBvcUNw2COG7G+APs6v1hIwsR4Ww+Ja2Ge2Dbq2TYWJ2/nf5djpESNzESXuYE3x806qYo3Pw4auS0YWGcvhlwxdFIwhP2uc43HuJZwZ490dh25jEFftrHxczaNeNR5unIwB7bNQ8TIP8jU78Fl0h5E+a5NL2cChXT68ASjIzPFlwR0rCy5bamV55DcBP54mS0NRe/rkUpq7S+ajJ36ZSXEKJ00rQo++2GQYk43C4JlZ93bAXG9sJVtMEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 05:46:03 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::b504:c7a0:9ce8:6f17%3]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 05:46:03 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] libsdl2: disable SDL's own ccache
Date: Mon, 29 May 2023 22:45:53 -0700
Message-Id: <20230530054553.2361595-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 958537c3-58d7-43cf-91a0-08db60d127ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X5EAW7HsDOEhKlpo2NFz4hJ1R3c3K6Pj/G8vM3nv/DI1d+wYIDTlLgMPYJRTXXIPgdjUGAj7XARJpsuSuLieDeWAk2gLlwrZztAqI489U7+ng0txEIVgVL3+6B7dJlSoNMQb5s0ILcPuW8pL6D1dgJOZZJHY/7FJ2L/GMcLBvnkOGJ3qSma6KjX0ecsYP/MjrvIHtZVzRZ/kRFdTGtec5Bq4XiwZX/4wAQAgWFXqmpYWvsDUzHCSXjSjsV+m1Dm9iUMd2/NtnyCQOKe3ZWEfM6095Hw4XxuuyAw7YRAmMpVZic4LNteCekRXF/uSYccKIhl9lh7gckUL9TCpmAEAFYRK/mISwmn6Upk9ttPkhtkapu1ULrsLt/tdgRXt9bASGMZz/3UlxA2r8clyaxibIdFXaOGBVm6YSxRcxXC2T205anh5FoVXQP97M4IpUun0p+By/l9cmgRI/3cQvataNpmYtJI5E1mHyyMfqGgQxet00PhFjzYXDA06oWTrI6UU6ZVP2fvN6wnp3cysRSii+ZPesQ8vXpaGDce3DxvO6t84plYZPCBY2j734Blqcid4EA0awHhsBtM4DjrvxwOxKNyQT0Pe5YCsTMPt6sq/vJlLlk51rDfRzbgNytzFuU2L
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(451199021)(52116002)(478600001)(6916009)(66946007)(66556008)(66476007)(316002)(86362001)(36756003)(9686003)(6512007)(6506007)(1076003)(26005)(186003)(5660300002)(41300700001)(8936002)(8676002)(4744005)(2906002)(6486002)(6666004)(38350700002)(38100700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F0TaxRirFh6OyYVGaWKtvMVPp+VRx6vbOsEbEINVLJ9YNHqJMgQNfD/JFz02?=
 =?us-ascii?Q?opg2GSn+0VP4w+YkTzFiOJvgRugZcCDvGi3gu/2M9lhIJUe9wVktAa3/q+oO?=
 =?us-ascii?Q?b33m7ztKcywmB7HsrkihAS/TXLUojdZD5pQ3VkgtSUrqDs3gZo3jlkybIyK6?=
 =?us-ascii?Q?zxlog0AzkYcKdKQBkI1LFcm2ErhGC+zYmDlJ2KaTEWq9K79m7t0qQaHbHzcu?=
 =?us-ascii?Q?xh4ksNMUX/vlEBmX93guFrOtiTmjrh3k6yb8rG5wokPUlRIsF0RTLzlsYiXT?=
 =?us-ascii?Q?xm1HUZqLCMRO/ttPoW27xJbZe+l4kSSdiMb3nTvlnQpjSZMNdxHPNBtBYy1w?=
 =?us-ascii?Q?1ZnBcwFqJAVMDezb0EJemn16Zv34oP+Mu8+cX8mLWTdhy33DCnoCGXCTY+Sa?=
 =?us-ascii?Q?9H2HfnBSU7bwjT5AHJmaCGsuZrd5nFkvxsRrYB9L+tqXpLI5Md1FaZg8KC+r?=
 =?us-ascii?Q?ScqNcop0/xNyzpQ5ekVnW6915SX7BPxix8cOfpH/lKf+MZOVnaIs+x8K8Vjj?=
 =?us-ascii?Q?Oldqw+ULouiNaxFvLcpRD7d8JGKGFL4Vyrbc1kBgUS5UADKP/pQ6hctQ5RtK?=
 =?us-ascii?Q?A3AaTm9EIk+VB9bC79VOGpl98SWuB2YieBJ5AJws6f8mcdAeNGjzsWicgNYd?=
 =?us-ascii?Q?F4D15ZuEwei7TMZlSdUof4Bf5XqS35btiyh6BLoEhK0ihn//9hmX5wIbPbjw?=
 =?us-ascii?Q?herC1qOW4wMPP47Uqnsots53AVGQyEkGPOMlhEim8N+VqPKlUYWWI1RgPNE8?=
 =?us-ascii?Q?2lLT75azVMaBeiqxNBYp5zUc+N3r4Eql5/MfV3AO0HdW/yl0xonHyy6rqUnV?=
 =?us-ascii?Q?PbN2tq45cJQYgQe36RS3EuyP9+i1A/atbqcBiCkpJIZJq/EP0CCEOTm5ZNBq?=
 =?us-ascii?Q?MLw4/nPwD8M1KyHKqMLlI+G/4gDsKzO4uWZeSJ4orfjCJqZFcpzoFitVOjSR?=
 =?us-ascii?Q?/3uw4dF7QbujM9ZbzET7+NzMfbgIs1RcSidU7wKw0w7GCMWEr6qSSuiktFYP?=
 =?us-ascii?Q?AKaq3zA1YT7AAMNAyvhDoPpvSRKuf3UsjOayaVapfeOA3ifCU9KdJMre3n3O?=
 =?us-ascii?Q?OnN4sphiQEXV1mWcyTPtUmaocnOsQllg0kLvrJE5FPyywghEK88BCCuyU5Au?=
 =?us-ascii?Q?QXAkbmRLRbB3uLsUCnJYCjd4DPaLa0t5Qj+cQtjt2yZeRHJGR2r6r2PCZ11L?=
 =?us-ascii?Q?KEPOGN09u4koMo7RJbfrJK9NrYXu6C/MaO7WsDzHoanfNthycyQGgaA4S5A1?=
 =?us-ascii?Q?AO3EzL5V3RytXOsWStX7hBkAzlKITJI7jl91XJA7MVWb59D26S7b9qyUgCTs?=
 =?us-ascii?Q?LWNKZLq+iK0VaNzMxAKlsZaW4sCjWo2aOYzmajhPrrEdR4K4ltMwMZjNYVmg?=
 =?us-ascii?Q?OiJ9ZetFHAnXGVY67br+lv0ciAFPvLRzsYcsECZx6qISuEebOCx47A1OXRiJ?=
 =?us-ascii?Q?i7lNTycBWfwIHuykkFuuWc2Q628RxEFarVVychtCgwz8/VC+ExE4uznKrmWe?=
 =?us-ascii?Q?ewqLvx7bUoSCUTZ2DHUF6KSpFR7W845OlLN9U7oC1XADLY6ErLFIeg+kGbVx?=
 =?us-ascii?Q?dtbi4/JgcuSSPFeZMftdjQUzcVzxt6dTeCMXb5J0vfJqjFZ8Q9ANQZpkMMA4?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958537c3-58d7-43cf-91a0-08db60d127ae
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 05:46:03.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cioNkfh4inaWzljeB/BahemRZ0KXoIAQYx5RXcRxgGIAi50Zx8vFidboIskROei+37H4COlDSzGv4y0pZ5vIUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-GUID: 3tbI0Avvzs-aOuzRIvKqdgS5j_Vhvra4
X-Proofpoint-ORIG-GUID: 3tbI0Avvzs-aOuzRIvKqdgS5j_Vhvra4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_02,2023-05-29_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=434
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 05:46:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181897

From: Chen Qi <Qi.Chen@windriver.com>

OE has its own ccache mechanism, disable libsdl2's own ccache
searching/enabling mechanism. Otherwise, if ccache is installed
on system, it will be used by default.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
index 3274475da1..f8319a8f29 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.26.5.bb
@@ -47,6 +47,7 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_X11_XRANDR=OFF \
                  -DSDL_X11_XSCRNSAVER=OFF \
                  -DSDL_X11_XSHAPE=OFF \
+                 -DSDL_CCACHE=OFF \
 "
 
 # opengl packageconfig factored out to make it easy for distros
-- 
2.40.0


