Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4DDF532C7
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 03:13:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11964.1774321974695115443
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 20:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PW6XEVkL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543dce132=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3ASwr3548742
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:12:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=08txzjHlz2M4Huy/+igr
	MRr01cRfLDUy9KuT0QkUtuM=; b=PW6XEVkLUrKPXy99o2O/ZoGPjXxNUtOpBNxN
	x490QX3LG5tVLoJg8f3xTFfEOnhT9xeDsfVBBJLt1HHI+UKgYwA6tZaukjI2VeBF
	QXnMScVI2Ao1SjgTfdQgdbPQMphwZoMBfTuGXQKU0He62XmVTegvLPmNC44oAYTU
	exPv+Dvj6FvzLMAkD7G1Sckbt51277hdYRKXw+qXMFqXl9Cmo2EBtpaNsbQppZXk
	AyRd1gx4Choh7neCZzMqH8m5HRGb9bz0lnffzZe/nThsTBDWCyRaOlj6vKSNPph2
	JSwps9OoNdzQf7HsgxZXe3FIMoMG0N0Q+575d4pMbm0HpHXKBw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6tse6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:12:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXwjEKRixsdNZcpXDhNTZgw7uyXlCv3NQT7At89awrasvv+qDZ7og8GxkOu9gZ5eY9/nuR2w943B5u1ynuC9aCmmZmCsuB2SGzgb59Tm+TLD7pD5hGQSedgIuHvUi2M851rHhiIlCH7y79OdDt7y1EpJ+Yt086TsbWfxIma64iOBuGs8i8iJYwOKAyZx5Q7pLHW+4P4LNfl6abYX/bDoVS4Vao72d3pQ8/XKb+A40r2Cnn99dSp8GYSAZS43QelAS2TS8iYqKd5w7xjUDu9KN9FIMgxj9gGSKabCt/Or/J5LYSrA/j6j8LNe6JlUPexBdyZRVdXzHcX4NUFQC1hq7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08txzjHlz2M4Huy/+igrMRr01cRfLDUy9KuT0QkUtuM=;
 b=ESsoXyisMZXx4HAfrs1hm9Onu8YQaOiE6yQOB5bvweO6nmkTQdC8ClYeMY0aiT3LZJGeuMqWDD6W55mKGR9K9pXwnVGQAswhrseIRHW4pAVlqOab0UKrWhikNKDguFeEX8VMbpdRSpK2QaXnHxTpHwsLf0OZ62DIOy2k08opdmhx6hTrTJjI0Nwx6HP60nkFqVY8YRD8i/ytXPumhjTirhz5IrqKeZuk0Fily8V1PBhg9szZdZTvRBmD9D6Qr1tH1NXXMHBtuWcZGRcPyRrRxElVxHhPKkKvqHp6QkuIBBs3aLpZz8Zop/wqhNkC4+oHa3v3Fh+0ttfVPQV8MTVgug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 03:12:50 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 03:12:50 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] selftest/files/static-group: add empower group for systemd
Date: Mon, 23 Mar 2026 20:12:42 -0700
Message-ID: <20260324031242.4065751-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0050.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::25) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: 212693d6-3719-441f-6fce-08de89533aac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	0Hu3/6igIPTCLEufDeWeBQWlNKh8OrS5N5rYOgtBgKDfSKXAdV8mmqmc2lNd9Bn8d+UBWUFhzRwMtzBE+3RFzqhlozvmdRck/gnljRoofARO/0rSGs9/3vMh2c206SoHiPrOlJP1BEUpTKgEjfArmepDnYhJBelqavZs3ds5nYqYVTrMP5YHX4BpedT0qQVO+SSAG5X/Om4xf4UQrLghTKJmOXYNaG8Z/NV3mEM3qYjRYBnlHiZ1jacRMHo71/kvg/HXFZEvHj/Dq9SzLHQVcEkp8mW0OHF+BWF5qJv30cNW1cXfemZKUmSs/QRt6h63JQbxC1ahbKdPXtYwxNmfDd19FipTVvPlP2j9o4gGCZmwdo+fgvOwhfFAjenAjRESA9OJWeo7qJLEDa4woxEz1r/m+0KiOffONFPhaDdisSBIhEWgBnDKb0k1lUmejflkqVUkQyUDcSIMbx/K7rLSAcbIK6wnCbT7GZ1F84o4K6DyLzdZhcCK+eDOjxOzvRgulPCLidd98ydMfJiOWRqyICr9pk9yc3l0IBYBCzpp68JfhUIFOrDfiIuHwqTEKBmYNRt7EbpwijEsmBYn02BozMarxaWW9tSi1xuWtK2Lx6wXhzY91LUlZ6qE2Oh/cX19Ie6VMNZKjvwGteLCqPs9i2O10EhWZXIUUCp7CwXyvOnG2TBu87lP87XrV614TCJEMmtv6W7mc6abwS//NMHKxMqpn/zN5Upd2H5bU0XL2rgHyvvLegIOFL6l/VFUr+oqbz6Fc8Tcys5r8A/zammt7szE74izpN9enWbBg+4MiXQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a22JwZwJD8CXK07eisw3ck/GllasX5buqK9g0/A7QiTR61wcCjERnr7FPygx?=
 =?us-ascii?Q?En9Bz5OPaSBOXI2rLJRvvfEKOTnDN1gW9l7XL6ozkUYxZERe5VFPXXQgFR1C?=
 =?us-ascii?Q?lxXDn/BsXXY3B+0JJOOPt5ghsCk5iE0CP2HBhDRWJO6bgEavwpr1G6S7CtPI?=
 =?us-ascii?Q?v+PS1iQlUGhuPgO6OZhLhHj9+ZXUN3+IBCkP2wh7/ykO3eL+Fbms6S7eCD0U?=
 =?us-ascii?Q?AE7uncgQu/xuD3w4fZWYwol3LMwRaPriOdYyZxxop0i/76Uv7D4HLIZfGIlL?=
 =?us-ascii?Q?4XlBQPAzYMp5KAwY4b1KZxTSknMfQOFgVd8hz8B8sh6BriheFiFpplsa/xxN?=
 =?us-ascii?Q?A+WmGe2TF0bOoUX3as1WBnwzCmNFueO9QDscKtoKtcFiL0k0c4vxviZFZSWy?=
 =?us-ascii?Q?zqKbMBx5AHcIgcWmWfkqi+VEdIRYGy8rW5nqg5wAdIBS6czzVV2oVdCLT8B7?=
 =?us-ascii?Q?DLrNn7EejjCVlVCsu9Atb03aNfeq9ADSurJ66HniySamPbVl5yr2h/ofWLS5?=
 =?us-ascii?Q?fK3jHxUpQWhRxavm4gH7gfnYRUsvnZ6LkF2GQF1b6hha57bsvCl34KKwoZtk?=
 =?us-ascii?Q?gcZV8ggC+D/5IXWA11Oy5d/Xn0JmfvwkUwZn18RsxvYsOm9OUMGaMM5Chidd?=
 =?us-ascii?Q?cYuN3kBI+fYHH9nasjR24b21vVB3XplBUow6C7ZY4i8FpViyyIYJ0ooKyg5n?=
 =?us-ascii?Q?ySts+gSbz+n6frMC7MMzAtwIH4hszWfyWUbVcLWsIpvKp5ivrYlFeVZ2iYi4?=
 =?us-ascii?Q?Q4xFF/ozPgvnX+82VY1kdLo8/aKm0V4vOK39pu+8zZQdfHJQmsEap8rbWTYn?=
 =?us-ascii?Q?9AfQ/Le9bX1k4gCVD9zbra0jISlBbgGWyta5BSzxMXXRjjPwV9EepsMXbSUp?=
 =?us-ascii?Q?V9r1a3c05vQVhmnKJBM+AwAROa2cmYWm0Hx/CKy0/jOmu2MVwMVwVlR/wL+a?=
 =?us-ascii?Q?J1H7FoYmARkrhuam8Cjnjo3+ASUmMlLjHuxB50pddeBgxpheJVekG8vkGwhE?=
 =?us-ascii?Q?uOYJDOuKOgcHDxeOvreuZ5WBI6f3qd+1MAhQuJBUxurirJal+CqG2IfvU52b?=
 =?us-ascii?Q?bMS5qLV5Nhu88klOmz2wjKvgonT9qs88At3mT8nmK68irnTrakS7tOAdqwit?=
 =?us-ascii?Q?6KuleH6uTEBUdODhVNinH9OvZKfzW2RnCTMUGacIlZv0QaQoBQMt0jUfRqgT?=
 =?us-ascii?Q?mJGVRh8sC2nun3QqV6nv4UJiyWtR2w461YHwQHLP3Hkjf0JXj/R7dfDrBh2N?=
 =?us-ascii?Q?wbSk9J4Q0e/GGKpDbW0bgSoWF6uJeD7MibIOZ29I2QbjbQr2NPtWRIwh62PV?=
 =?us-ascii?Q?DhaStv2BvjiNatrRRS+Yyu6MgsiIhEYd9+lr0b80lAUE6CDWGtBIe5+4C6Qf?=
 =?us-ascii?Q?QBQfpHKnhhrejjGXPBRrrrq1qaPDgvvt81NdfBM3+TZ69gbYvgRTyRvcHpGa?=
 =?us-ascii?Q?kCmatRkfAYBrs1ueYLgyAikA3K1XEB8WmDkP8wUo/0GJI4tkst0B0RogQyEI?=
 =?us-ascii?Q?UlD2Tjl18Pklb4FRCTmuO0FfCIDxV/Jk+WgRoUrdqeom0EXVoJTyei3POwN0?=
 =?us-ascii?Q?7/7fYPBBj8JaMr/mDnYP27qYqDovF16uHwzNoDqEZ248QCSCaqure+UjZsAe?=
 =?us-ascii?Q?xGPJtgyHkUS/Db0+/026w4IGRviZEOWtl3VFf+GHmxkoPUFto/Cd22c7LEgL?=
 =?us-ascii?Q?O07U+4hklOC+y2JfIecrqzGZjfkXEbX33vhHDUsxZ4nPQa1zDWO6yfzPCNMI?=
 =?us-ascii?Q?wZJLuHiyoQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	c0bwZwArmd/l+hiys7YffdwBkT+a+aXXW9r0ddrKtg7JPaUu4scUiifH4igZiIRWm3oLuNtkvn/cAGcVMSvBYdBbkGmOgJJ4vzQZHQrwYQ6tB6BX4fMhOx/AlYV2iJ+pH/xdWLppzKaGn8bl1H4cAoSq9oFuP9WEM4NepHIzBOL9UCvUbtpBYzPCf3MrZAcWvrjp7V+4JeiTijacuDdPiF1fnG/worjKwLYpjXbLJGNNjXYS7U1OX2RgOd1LSdB9VZTUzF/OuUiNs+a9/M8U8ett8gkLLsHfAOqeBWKp+3u/R6m/epK8YxMqChshinTWl4ROx7SVPPaMJ+WwNhR2Rg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212693d6-3719-441f-6fce-08de89533aac
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 03:12:50.3903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeReuKJKv+06s1xlY1OpegdMHzQnoudX2HPDM7Y/EE9DzudxfBeE3MWJt+uDBHWtgrqyMoKjzwjvmHaEATfKcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyNCBTYWx0ZWRfX6/fJveUifthe
 Jhccx3+RR2JrKxaqfW7KITaYjEqTwjXrpzhhxz0XvzqaspyrYG6C0chh1aKyhaRVDZlHfoTdIrn
 v9mkFQ2xVHnvpQnpUHDYsEYmReJza8fK0V1MGmWXTXOGPH0OODBxLmYITBTPoq1CLcpi9VSYyp/
 bby8zpjbjaRQwiTfAbkDRBhf3XmBBND0HzEEfwKDz3iGKnwli1deSJ3TI8k78XarIdzfwyOVAh6
 +aIkl1yxntWz3wdoiHSVjCAZVKuvRz514q+mt4ZzxWvuQo22xEgHws1cbCwh7+8EI5AmCyfbpiZ
 TVsuc8ZQXHwkJNx6dBKeVrscSsJ823nWHmgSTWKhJKKJ3g/5eQahYVRA/DSYtB3dhi6KUR4U/p6
 Bv/qz6mxTMHKoNw6B2ZZAh48Ij+gUHVNzoyMu/VoI9AzXQr6AdfLYzREoUx270LhUfB/QvSYXr7
 Eui/+Ba0q4q6S8s0BDg==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c20135 cx=c_pps
 a=kgXPJ/cF3Xw5T7/w5pCavQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=Hw9qRXKqu3HRbZh9P1AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Plwja-ceTVF4-lt2qgL_oxtApLVPiLFB
X-Proofpoint-GUID: Plwja-ceTVF4-lt2qgL_oxtApLVPiLFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233771

From: Chen Qi <Qi.Chen@windriver.com>

When using systemd as INIT_MANAGER and run reproducible selftest,
we'll get the following error:

  ERROR: Nothing PROVIDES 'systemd'
  systemd was skipped: Recipe systemd, package systemd: system
    groupname "empower" does not have a static ID defined. Add
    empower to one of these files: /path/to/build-st/meta-selftest/files/static-group

The 'empower' group was recently introduced in systemd v259. Add it
to files/static-group in meta-selftest layer to aovid the above error.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-selftest/files/static-group | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-selftest/files/static-group b/meta-selftest/files/static-group
index 3fca4aa5c9..4cc37ddea2 100644
--- a/meta-selftest/files/static-group
+++ b/meta-selftest/files/static-group
@@ -28,4 +28,5 @@ ptest:x:529:
 xuser:x:530:
 seat:x:531:
 audio:x:532:
+empower:x:533:
 nogroup:x:65534:
-- 
2.49.0


