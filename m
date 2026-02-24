Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB94EEA4FC7
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:48:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11078.1771897690137395425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O6scwqmF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O1LK9t2856145
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:48:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sGqNRN6xkT5jLhGsvRmR
	OIUqIInS5BKGu2AxMLrbeGE=; b=O6scwqmFClb2ZNx22YPvY8+BYnC7A6F+1Pjn
	GCvspRNEyGEoYZh8puRYqfGt/WR2RDbqz4beMrgZ7yDwMze2ToriQkDKkK9xI43v
	W4gBcQDh9HT293FUrWmfdfGvzfIY32HkCW65ogQnWWPIVYRCk03Ya8c08hlmjhiM
	idyKAXJ48dfu9GkEhsS1lfUKSZomNlEcs6q6K4+CmTJNb2E6b1tD6Q7EJPvBmPKr
	3e/B23dFHjV6WKDvaKwoCxWVJQzJJSLr2StyaNu+0yIpu/a4LBIV8hK1vQQfveCI
	zZr7O+BlSXVL8oKEdytmI6d0HgjzWc8d79oiMkwG+5lkhkd0OQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011029.outbound.protection.outlook.com [40.93.194.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v42dpy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:48:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IRQMZ+IjmfzgV0uAtwXIh6ujCiy/5WuAqt1V0bDZNhjujYKVXoYYyefdC75JxcuOdE+dwvVzgKCY/Cg7usRw/K5geqOOrELFGqLgzarpn9BpSB0GW5qPO4oaE7b5ATxEibgKZTw8knI6FQ7aGWJ/rNTFi7TIROEUo+16dzWASRTugg+WIzVEicHBIxSQKO7WPjO6ctCWY7rfBuZXL8JqqbtXuCLa/cOT+AjG1riek9egl64agG0wbrP6QS0H5xEb227PvGHlhkN41T6ZxquRtjmgQsQ2HX/kP24WZdx5mOOnBAZ41n3I5Syn3Z6gJf2Kluw1JrWSCWYIcuQJxSQsUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGqNRN6xkT5jLhGsvRmROIUqIInS5BKGu2AxMLrbeGE=;
 b=ljEjbIWiJ+2HM8zGNomUbHPqJRhIHfm2Wb6JkQxDRsvkenAfketlk0HVo0RIgYitk1pBCr9t4+vNwynawZIPyG4eFRne2pyv0zs/b5IH7WjEQSXx1eUR3FtYK5tVnoKCIQv+6DC64JtWrtyMJP6EwveI3plb1bKpxaKKLR5LKwFB4qIk1PxPFcD5GOlwatep3M1BSiXNTw2bPOXXtpOkSSoA3g4WEE0HJO2UYF+m+CYOV+NxUOEefEesCRPUS3DXba26qixRx5aH1vtKjbW4lItKaw5SQSLFNWAZWHjFPkZv84HEdn5OPfi0j1GZ2AuKZpErQzK+yDJKmwEhH8RwPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by IA4PR11MB9393.namprd11.prod.outlook.com (2603:10b6:208:569::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Tue, 24 Feb
 2026 01:48:03 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:48:03 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] procps: upgrade from 4.0.5 to 4.0.6
Date: Tue, 24 Feb 2026 09:47:47 +0800
Message-Id: <20260224014748.3336195-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|IA4PR11MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e156ae-8873-4fec-b1dd-08de7346bfd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nN6NJGfIcMAKjXzLkpgPkmLVNMKXawRswuKogNvNYwnH6GAkl2L5ErLV9MTs?=
 =?us-ascii?Q?KKVnaYR7miYD/rlw4xet1+qzQxe1T/njhkgTQfe5t6ZIAeENYo1zxnNBntZ/?=
 =?us-ascii?Q?sMvgF8iwwSUnhnA2nvS5t4wwc8oWFx/ppzXk9HumSlBpU7ydwAahRYREAL1e?=
 =?us-ascii?Q?MmyyxeyIuCbZDBGmxQhrruvATScr2l6axUQxdDhatUgomJPbU5pycSX214sh?=
 =?us-ascii?Q?/8YJ/lBMsXhBwaJ681OTVvsEoEFv139b3thmCOPjnwnRB881So00WWqHGr/E?=
 =?us-ascii?Q?PTbFBRPCpeBxnbFicoXuqHfx6x5IneRJLW1bsI/VSmxgaQnwNrIBCjwMAEBq?=
 =?us-ascii?Q?fmLnvXN5f4vhSgB2fcUNC9iCN9dGTNwk0f681Ixxa0J1SLDeyEQTJJaw1lDR?=
 =?us-ascii?Q?mJzmpiJBixQuQ/f/EAYRSGsWpC4YyEp9OYbC7d9gFanZ3TmcsXxDUDhGWM3j?=
 =?us-ascii?Q?Yvqxtb/siWuzW6drNtD6TNc9EkgF2kah7/jxB/fbk66uEPCQVpYdDjRtQ+6k?=
 =?us-ascii?Q?LgHUz+eFxHKQB/oWqaVASLZHMT+t/IGgDH79xPpaBeX6rTc9qFIE7ywMz2Td?=
 =?us-ascii?Q?xjWwZ5olFiUBgUvBIsfoT+MTznQr2vr37HKhQ3KdE5n6732XYF6xUFpWFMFk?=
 =?us-ascii?Q?HWwxTTerCfMkmFZ/VL3zDqRgL/bnoJpFlW16bhPt7liH8D1KBGF0Sg8ra/TC?=
 =?us-ascii?Q?t1sh57Y/mVeF+2m0GvMZEP13+OeVHbzCyH04oZlFXqWiXBpdwaFTe0lLhAlu?=
 =?us-ascii?Q?srL/6XR7MF/rljvbtpjBgf5LV8aaLyOR3shp4u3cKYsEPwVC/DVudnbdkP1f?=
 =?us-ascii?Q?6M4v9JENFuFOC6U5yvsyENBsGBfjU+45A6paKP2qnIJbD8gZH2798RwUzEzx?=
 =?us-ascii?Q?Dx/BMOg9UmBumuZIddxTgnsaX7Zz1e2Izj3IsvP/iE7XaVs/0dIp2DwG5Czz?=
 =?us-ascii?Q?/tTtvxL9l2QjixlBwgYwK4a1RHHT3T5ktGYuLAIFc1gK+P3SWVJjy/Su2wNa?=
 =?us-ascii?Q?QGdBX9+t4ydH0TdD12YRb4R/zUdTvNzu0k563H/8o1yKI1Uxv0gSQV8fTYgt?=
 =?us-ascii?Q?Xdet2wMX9+6e59Bl7VNhHVRbfTT9rkxMyE0GWLrUSJgpuNS43GnpbfEe3Tjm?=
 =?us-ascii?Q?R+mdNAZq5xAWDKZLtONSTjBYo5fw2lv0hWaFHv5sDf1tNVlKWzDZN646jQVl?=
 =?us-ascii?Q?7fqdGfG0vS9WyyMOVWZK/b8B2PQGFAZztWFsAweqlJS7/O18c+EKGuUE8GnX?=
 =?us-ascii?Q?STKA6zE5Gs76AJ3ZzZXPB2ZWuy4qKiSeEXRNhtAgnXukKVl54rHuWGjMX1o/?=
 =?us-ascii?Q?irTLdeKT7OWCZxfJX1mIBhHmIPCe/tXdb2FLmJVMe8hFeRCRL7eoLIObJnm6?=
 =?us-ascii?Q?pLneps8DgolpGohh7a61qPRWMdxlT0R+nlMGtiwuY1ROQU2Po0igg8uy0YSC?=
 =?us-ascii?Q?ZHqG9tQiCG5vw363WRV2lvfrkySSeKOM78fwBU2sm+i9ZTMlfpQbVENvYCnN?=
 =?us-ascii?Q?ys/3W1xUBOZBZ5ioR3X77GP4PNcspqimjatD9Aj+mj+pIrSTHOumzoMDopBC?=
 =?us-ascii?Q?HITXr6KtwlXEVrAZR7ahAUvQ9ztBcEh5VMeWlvMb0QI75fU+eTmQ/aOAnBEo?=
 =?us-ascii?Q?bAf44/QgLzjcW4t07GVeCOY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p1phExJI0QJ4P4JtEONug2uYZfWi6NqkCtOyt1w6y31UQ7zjyU+d1wksN2TS?=
 =?us-ascii?Q?n0hyP5vP0nR6jDPKp8ezDgOxUi6eK8S2VR3EvB6CLmh5cL8qDyyxcvrs7zeT?=
 =?us-ascii?Q?ub+OzHBkHe2gEQzY6qXQ/hA2V1AuARJBi1vHnofw2CL1b2fxV0KKY0APJ3zY?=
 =?us-ascii?Q?rnFZ1wnC5Ji7IKaoDTZ+QyUkRghu4nSyj2x5IYMIosRSfPtrPtCocLT/zE2A?=
 =?us-ascii?Q?+WQpqGbBYimyBgfk00ypyBHZqAQqkLtR0I2KeTjR7N3oL/tTC86ET4t47N+B?=
 =?us-ascii?Q?0QHIetykhKhFHXe4/x/sNZ5RvewbgsmqroD/FaV7M9tNS7g+972399S3MM7A?=
 =?us-ascii?Q?9q5Zj4lMA3O12vIdPQ1LZWfCtDe55WqPCqdhMfrJy914DbOLiNiSS2txX7HT?=
 =?us-ascii?Q?rv1RlAC5NQ/oY92xKCEWgrLdGsb4tMngJ4B3h5MDfbea3P0r6BuWmpdIlc/m?=
 =?us-ascii?Q?sa6O15rAPz8iIQisVfNXDC/MAlbLtoK1eHOmizmcGIAHO5PEU8BxYU8Sdk7U?=
 =?us-ascii?Q?JrnfwYPMdpbsk6fj8Skd07RRvLmuKBkOTDdhqq+mpb9IwPrKY1JqBB9OPlXc?=
 =?us-ascii?Q?pj/p/tcm/gccjlSagPyM9SYC26Hlua0MxGxeqbRK5juuj2r3vsYf+9VRZIrL?=
 =?us-ascii?Q?IBhVVJi3m3DBZ2Br+UQPOC5EbeE9EJCOynOap58A2OIdonRxCoXia8KRtvaG?=
 =?us-ascii?Q?MjpwWzLcDdn3a33o//lzGI7A9fyVQ+XGpfHSICbY9UBtAlX2kCuUylHD9kvM?=
 =?us-ascii?Q?xtjRHKDv0Vve3ID42C3Yy3xvCEIC5pMeb201Y06Q4niRcWvFdScA1UJ3Puzm?=
 =?us-ascii?Q?lH38M/kiww7Z7x7+uwXObquV4DPzzNRpmq1hxE4X6hcv91dx7vzUNX3E+pTR?=
 =?us-ascii?Q?cSBt96K6F1K8EeCvRijTfmQrESOmazIc8+iqxF+3XZfgwSfqpZmxS+NHBbwb?=
 =?us-ascii?Q?hpHu4fPIaQwleUfuypCgxUFtkcj5kjTgnkOXpuX6rW1hozdPdA0PCGcAZaJg?=
 =?us-ascii?Q?QJyia1jxh4ujDUygKzzvg5cxeFIqCrEAggkBbR15GgS3gPGlJXlGP+KHW9rm?=
 =?us-ascii?Q?xIXzhv5a3TZC2T1sko1XryNDU+hk0nU9efuLYjJ2Rl1aXy1jJG9Si8V7FA4r?=
 =?us-ascii?Q?DU0sgtN1hAYN2xKlVYu/IV3de/ffHiCGOC9LKeDB7bz79aUfiqvWFXvZiTW7?=
 =?us-ascii?Q?sqQN5maTb6Mlx/xe5WkDpIgEItsAxscCx9RDd92mMys8s9dJ67FJRJHhMCpR?=
 =?us-ascii?Q?ivyuxCJT11FHroC7iQRexG/jhfuZ0xfuHK3wXN2x1AqV80Bsm6oR9CwiE/NB?=
 =?us-ascii?Q?Qxjc5EvFnPeZwuwJuj+aJCr4/nltmO4y/VGZvlL2EM8UFHJKzpl+zUSEx9AY?=
 =?us-ascii?Q?u0IaOWQ5vIdU9Q50alIj+mo0b0we3riLH6IKOft7+FTQYddx/yjO1LQa8Mrp?=
 =?us-ascii?Q?VAlz/LvsPD1xOiEZiN2k1UrhMQK7aqEbb7IUSrHInALI45YCJWxp1eLglICN?=
 =?us-ascii?Q?4pRnMSW+ZLoty5fNYJ/K45H1+frWkOPOhm/VMMn2ugTKmQH42j3ikqvcfrga?=
 =?us-ascii?Q?8aoG6eamtyoJ5gRbYnk0pplRhpVpv4SRGJOtSURaw908bckEWrMGLY6Tmw09?=
 =?us-ascii?Q?pl7Wrg7dd/IPkdTLHBfsScw5L01apKUZrGxBeORUnmF5RvenfCSN8lJoNvlq?=
 =?us-ascii?Q?7Z8hzzIx/QxvvuPMjRAyuqMLGBy2EugXRM651nuisZL08YPFc/rGXlaoGOQk?=
 =?us-ascii?Q?7d8rsOCykA68FvspQOmZrheriW9EibE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e156ae-8873-4fec-b1dd-08de7346bfd1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:48:03.7658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pMmX8WRH5e7lXpHNFnNcJOTZsLZgZgnlKYBYzGH3IgEGNCS8ZTpqFVzOeEEhrb+g9Avm9ZFGZc5qIrJnhIfvy7f4h7sevG56thyW2Gx63MM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9393
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxNCBTYWx0ZWRfX+chgcFAp+gTq
 ArkLsdwWggCiNY6h+N8DpJsptK5tdy5hX3WgrQmNyH+ZQJ0aOMBntebRUfDlWush+Cf0haw2nj/
 4NE8kHpnme9vLWVEfvzh7N7Cz7VniudXwil6xi9NGHOAbd8rYMi6IMPgawOpw3XCQTcAgE7kbmP
 hoYG8YS6/wlbZgZVfcF6YFtZbuXHtvU5HtoOaYtjMaRlYClFUGgw77ZZXP6hXv7wSj6eOTL28pW
 AQdIf9/3uxuMR+zbgH2r38X5HCkXFJ7N4K14gSzEgUNuOpWj0aAuVwbLwC67P6r68qZ5Lx3x5jO
 SzedB8dsj+0TqOmrsUDzuS+J3Z6m2IEsFwhonN8kXM5c+1z3cd1kj1j7skt3Wp8M6JmGtxzejFE
 xVSvQovpkoIeby055bOZ4cqG355NAeNkY2UnOclgnUFi9IS3T5RrS+NaCXnbg2Uu7h/ts2Sp79w
 jK66rFzgtNYAGuMfbbQ==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699d0355 cx=c_pps
 a=Y+Of8T+w2jezINbWzwznEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=p0WdMEafAAAA:8
 a=t7CeM3EgAAAA:8 a=C_IRinGWAAAA:8 a=QMRr_laVAe3Ksow-sF8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: hX6jiQkgX9Gvbx5pOHd9XD8jCcQ3rGvu
X-Proofpoint-GUID: hX6jiQkgX9Gvbx5pOHd9XD8jCcQ3rGvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:48:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231727

Remove patch top_large_pid_fix.patch, already in 4.0.6

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../procps/procps/top_large_pid_fix.patch     | 52 -------------------
 .../{procps_4.0.5.bb => procps_4.0.6.bb}      |  3 +-
 2 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta/recipes-extended/procps/procps/top_large_pid_fix.patch
 rename meta/recipes-extended/procps/{procps_4.0.5.bb => procps_4.0.6.bb} (97%)

diff --git a/meta/recipes-extended/procps/procps/top_large_pid_fix.patch b/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
deleted file mode 100644
index d7e3141e06..0000000000
--- a/meta/recipes-extended/procps/procps/top_large_pid_fix.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From f21fc624d960d12afa399af7333d4f9193fb2ffb Mon Sep 17 00:00:00 2001
-From: Jim Warner <james.warner@comcast.net>
-Date: Tue, 16 Sep 2025 12:00:00 -0500
-Subject: [PATCH] library: avoid possible segmentation fault, <pids> api
-Upstream-Status: Backport
-[https://gitlab.com/procps-ng/procps/-/commit/5461b50b1a85c5e556c4cd2739ca8ffdbc69399a]
-
-In the issue referenced below, that SEGV was caused by
-passing a '-1' pid to the procps_pids_select function.
-That value, in turn, is caused by providing a LONG_MAX
-or greater number for what was assigned to an integer.
-
-So, this commit will help ensure we avoid a match when
-we should fail plus skip some unproductive libc calls.
-
-[ the same problem occurs in that old 3.3.17 library ]
-
-Reference(s):
-https://gitlab.com/procps-ng/procps/-/issues/394
-
-Signed-off-by: Jim Warner <james.warner@comcast.net>
-Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
-
----
- library/readproc.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/library/readproc.c b/library/readproc.c
-index 2dfe4c9e..d0e039bf 100644
---- a/library/readproc.c
-+++ b/library/readproc.c
-@@ -1434,7 +1434,7 @@ static int listed_nextpid (PROCTAB *PT, proc_t *p) {
-   pid_t pid = *(PT->pids)++;
-   char *path = PT->path;
- 
--  if (pid) {
-+  if (pid > 0) {
-     snprintf(path, PROCPATHLEN, "/proc/%d", pid);
-     p->tid = p->tgid = pid;        // this tgid may be a huge fib |
- 
-@@ -1546,7 +1546,7 @@ PROCTAB *openproc(unsigned flags, ...) {
-         did_stat = 1;
-     }
-     PT->taskdir = NULL;
--    PT->taskdir_user = -1;
-+    PT->taskdir_user = -2;
-     PT->taskfinder = simple_nexttid;
-     PT->taskreader = simple_readtask;
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipes-extended/procps/procps_4.0.6.bb
similarity index 97%
rename from meta/recipes-extended/procps/procps_4.0.5.bb
rename to meta/recipes-extended/procps/procps_4.0.6.bb
index 0e0e06f0d2..168027077b 100644
--- a/meta/recipes-extended/procps/procps_4.0.5.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -14,9 +14,8 @@ inherit autotools gettext pkgconfig update-alternatives
 
 SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master;tag=v${PV} \
            file://sysctl.conf \
-           file://top_large_pid_fix.patch \
            "
-SRCREV = "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
+SRCREV = "4dafddf4c3f4646caa517f039a2307e92657ec93"
 
 # Upstream has a custom autogen.sh which invokes po/update-potfiles as they
 # don't ship a po/POTFILES.in (which is silly).  Without that file gettext
-- 
2.34.1


