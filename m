Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1468EC54E65
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 01:36:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39262.1747964164487911250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 18:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=723806c938=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MMhiKC008621
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:36:04 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrbakd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 18:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZMipXQvlzTM0R7dUTOiRyPoeJK3EcqV3d6zkCgJfKY4tD2tnyc8FKTMfMBbHgFzzExRVjaILXjedwMza+dG21qgQtWAkUMyucULuXtunXZw909DD4YPZVQRYddi/HdG2JtQdBfkytoJSAjoig5AmzQkPiPDqddb8A8Tga4jiFo1DSj0QV3uVPTkPfJ+sh/3fV16l21GwiRZ5cDOItBFD+zQjSjvZt8sefo9hj3u8r5GPwBe4YyfFHDNpwAReuiuKFIE3XOgVOOwWhdjtTdPqHynd3WjQXKXHTnngcbi309eM5w8P8R2YueNGTTLNaz+r+ZUjCBli+h68MHtJXL6JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAm8WJ0IZrxe7OkT7CnhwqB7tk0C/lBKOQr8mHxdeWw=;
 b=ggGh9zjmhmDhB40v3ZlZXcAyxMosL7xALZlJLUXyFJlGCR+u0D0gP6uPreW1AKqv3PxpHpkLjpGHua1KoMvojOSkZc7yPp/xltEFiopQpU6+onW8J8076GU/8kruP+EoyJbD7RUOEKxkAkSHP+eiSjChAU5wna9uMgYnzlqcMRUIRVs9kF45iZUUQbguyuar9lCQDC9FH97QawuEGG/jy7N/GztpS+xMg+O17BdFH0ySATvUM/ZrVXw0+LqThjDpp05hoyQuDsXlVLED3EHvxJ0VrMhbvwx93e756/NzO4R45C9GMAWAFB2ZFaaV8hdpimAow0qqy6BL+wIJ7lvvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL4PR11MB8845.namprd11.prod.outlook.com (2603:10b6:208:5aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 01:36:00 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 01:36:00 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [walnascar][PATCH 2/2] libmatchbox: upgrade 1.13 -> 1.14
Date: Fri, 23 May 2025 09:35:45 +0800
Message-Id: <20250523013545.3748765-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250523013545.3748765-1-yi.zhao@windriver.com>
References: <20250523013545.3748765-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0069.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: a60d48f3-916f-421d-8230-08dd999a2bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jqlQGPUFne46dpzWxFS2v4hfIaaLATxsuPLVMrGFBlmpbYxqFywp72THiOQI?=
 =?us-ascii?Q?R6NTZwHPKLvO01LjQdIMaZupUe54EAVyzzBN/iKFKAvgiG1A4GFhDbizvWdS?=
 =?us-ascii?Q?1vY+j/fxkig/zT8VAGoMmWoEuUuriYcvWHdoB81ap6YxqXmYAMZZIW38YNDr?=
 =?us-ascii?Q?U9r/kMRtloROspDJq0b2K/W3qKgW009hx0yIoFA6k3IHBww25XYdGZZ6RaX6?=
 =?us-ascii?Q?c4aHEuCDI5yWn7wETs9QyIRYk2GhRkNOvbl0tuYIZaBPHf7NrSJT+2/V1h4B?=
 =?us-ascii?Q?FZPXRkZfFVXpimlrw0vsb5HSDUJxQCusMYnPPiwKU+IA5ED4ni1PzIG5cLcs?=
 =?us-ascii?Q?z2aq3b84qQRziUiiexEfHqUewPjraEZy7u3EXb/PiQ/QNCHKU1PRK6q9onbu?=
 =?us-ascii?Q?VKsy9RD8f2a6znpZw0xvbNp2jNB+5kqJNSSi7hRACWirqjtaQq8DOIM9Zcnn?=
 =?us-ascii?Q?RWvPI964sjdMY0bNUlF+SgUyrHxmq3gCpoa5/TiA1yGubSm6WOkpx+lg4Nys?=
 =?us-ascii?Q?GuwVpTFPxLGIjR7HKXpk9IboNzq+ipzDeODbM1NUHG9pjxFqn44YWtL9le2c?=
 =?us-ascii?Q?aPhKfspPCEvGUursAVJ+y+86qhc6Vz2dooJRO4MrsvPAlXP9+m7JeUvILexg?=
 =?us-ascii?Q?LXtocCGkhWRre9cixZujlC9lJ0xKCE3SZxbrCs4Xv7K1NWtM1XwgK8wWqpHm?=
 =?us-ascii?Q?tT5PZwZYYqn59rQUq6r0GgK4ocG9i9oz2CHZWDlrgI/RnjuPCggokmbtLb7N?=
 =?us-ascii?Q?+uM4Q/XebinyYuzu6SBIXB6VF03TEMO3PL0drCDirXLRvg5WGCzThKUBG47A?=
 =?us-ascii?Q?XJmm56Jx3pnSLf08xobsYWpNjEjNqvyTfhco2EYs9tQVU3vEltbpMeOKabQa?=
 =?us-ascii?Q?reMWwWePTNTS9pI+t0Xu8zjNSmkV5eXTHh3N4WQ8gJmYIZ/nRVJXNSsPA963?=
 =?us-ascii?Q?2Pcyz/ySJ4/QxYlTkLmZIGyfzpBDMxYAzEC/ptjmS6TWCnhbYIXCsSnMtv8c?=
 =?us-ascii?Q?GAzak/fBJHWNtsajkgZf+FU6uVtdEBWKPNlta7H71108F+F/Zy82NbbS9Cc6?=
 =?us-ascii?Q?G0Ssp/i7FFt5NkVeNwwS0+ZpvV8wJ/ei1FKxj8f0aq5YpVvkgmyQqmnmHIwZ?=
 =?us-ascii?Q?AURxOoGhijtkmeTM3XbCegzUkM8thDiDC7b/IJaK6Rn6LWiVkZAxvLcR1a3v?=
 =?us-ascii?Q?y5m9MKMYUSEKIgnhRrGcvec8rH+Iz5cVXlnG+Gg70lYylA/1cNWTs+tqKvcp?=
 =?us-ascii?Q?IJ631m8A69wrlFrGy0wJ1SEo1NYr6sFR8jov/0T1UlSUOja1klSFyK7N4Jel?=
 =?us-ascii?Q?WFJSCVJLzp5cfz+dwWs+zFMoxt7ZoVyHTwGmxItjC9j0W7Nnx/Z6eSiOTDEo?=
 =?us-ascii?Q?ME+L1fbFlb9+om3c+V7paDBehCSLQojg7yy7mbwJNfYebgZuvJJlHRIM5uk8?=
 =?us-ascii?Q?c6188b8M03f92qH50vo7/yzmlPek1L1yJabc/Cd4TpL3f2bfmKNv9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PSLhoV/oXAZ13r++UndRdoMCwIBhOG0l6G+fzDX7gL2z2FH5wkQgVKHgZmC0?=
 =?us-ascii?Q?EJg0TZX8SEzQ0cLxWmtehRJIXO/7TRraNP7kaDHCn7hPSInzEauZmHjs+20R?=
 =?us-ascii?Q?JgnWyfISPkJQVveBkd/J67NmxJBNs67uYC5kB9Mh8rkYubf+B3Z5oHw0DmtK?=
 =?us-ascii?Q?yfKY35qDxQMlHq7FeI1t1Y9lgUFiWz9KlQdp1C0K7Yw97wh4V+KR4JOl44aq?=
 =?us-ascii?Q?tuhO0/swJQ8oAihvMNxpb3k1qQ+rv6puGqNSnECp7II/5kAfORdZnlXT7UD0?=
 =?us-ascii?Q?H08FTGdeW2kbVihyeYtooUqqcqkfnhLe4Av8ULBP0OZXISg0EOzuptBQZ5QG?=
 =?us-ascii?Q?i/GjCum6kWg6wrFQ5TmAvVzG0RPTohHN2NKHaZNMhQNiF6Lz/LprkkY+gIhf?=
 =?us-ascii?Q?GmO9Hy9TzNEM8vABKB0TlChgB/sk8HKH7O/gM1crp2p27XuxRWVQA/jg5MQ9?=
 =?us-ascii?Q?GT05O5zrOWaljFprjxxZU0aZHtnUUrfYsG5r1gtSth2dF8KTusgY11pz/yHF?=
 =?us-ascii?Q?Uh6SnDouSPNKKqJYiGQwVFJKmsWQBsNgUb8NefCfNioTqZlt5ADCQytJ+RFX?=
 =?us-ascii?Q?bAIxtz8kUORw+gWKfrlrKQuwV8rlEuPB4MyHQxb7rY6RD9WivUYvzZhRXL63?=
 =?us-ascii?Q?CMUcs5K78/DJsyxVjwdiJDTYMD/zjZ/s5C/kPUYn1/Cb/TJkTBfmMK+nCzyN?=
 =?us-ascii?Q?uozDAJJ+SCZgbhljIimmcqz3XN23CfIbn+ELJHxfG6Hbr4k2m/5/ST1xvPH/?=
 =?us-ascii?Q?8OJ7wVshPbFqfq7b29bTK4vlfJPO2YUHFqQaoF4FpBZxFq/D/rXDM3zOzEcP?=
 =?us-ascii?Q?IgVUM+614tJLrKYR7rvKpWrxLfzw3kC7rq5ELnHCEndvLrkXvsTkAzTAlzWe?=
 =?us-ascii?Q?5FAkIspPzmBCyPMFKUOVObGfv0q0ApTjjR4vCVg5B6nWM/NRIjXdGUPYbidQ?=
 =?us-ascii?Q?st20Du05qWmeYm5RFpgMXu3vsx0ymBR4eviXncLaglOgDioYCQc6GU3NK6yT?=
 =?us-ascii?Q?F9bZNgE36jCJfaETZftbbEvLL1V6Qv88nOSf3lUwtj4udLxvOJyObGkruNK0?=
 =?us-ascii?Q?DIuGEuCc0RnF3ESNoOPj/5qGChNakDk4vNvUDHBIQeTQopog2pd1/AV2lorf?=
 =?us-ascii?Q?VkBMJW4AD3lIZct6YGogS/qOAzIZ3pfum9C2MuEiBZGELW09eeDmWBBvjpgt?=
 =?us-ascii?Q?84tRR7pkMAthc0IIBl96kQv4ByB8Dn6knNt9m0Bp+6aeFSxzXrfMrRPAoNH0?=
 =?us-ascii?Q?/7K3C+UgeJdtY1F00bC5wlmKfvwRdYfFlN1tsbWILQMpeZOh1RXhxKFF2jvP?=
 =?us-ascii?Q?EoDkrSO8KssxPd9dtg1/P1wejf9mtdKV/LSVbcPwMCiuF9/Ng2gUZDGjXKfJ?=
 =?us-ascii?Q?Gq3XnZLZf/Tyl8ysRLTIsIILu1JHF1uwnVyIxNIDW7UXjRmRCdUS4+U8qWDd?=
 =?us-ascii?Q?erYvYGtzLO+0CD6uYyFApB6PWNQFNLV+a+iZN66cyf9i8QkMTbVmXCdcXWgn?=
 =?us-ascii?Q?dP418nT/4/F/7Fe1lNRQsK9MuaDjaLWSd3pL+74di+P14jyW7/wi5w/+hRJ4?=
 =?us-ascii?Q?P+HXkYN2553+PfKla2ZU8UWatvtfKHdKGRQvEfic?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a60d48f3-916f-421d-8230-08dd999a2bdb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 01:35:59.9013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1XPiBqkx8vz3yr88wio9U1lIG6UX344J+PJ9WalmdQ4jwNMz/ptEvbXGe+8tKZRxnLqR4HoCYnpgvv0xCEr2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDAxMyBTYWx0ZWRfXwApLPhYWrDsV 8mTSD57NZ5ERUrVVoIJ5HanaQeT+/uAOfEwJWTjKhss2Hh993zZ5JbnXDsKLfv6R/2vUt+4Dl7/ YGBSmB+P96jXRqmkZvvpwkW+n3s3fsTo8hcn7ugd8fae2i0yz+zkrYLEVOK7NXD2DUO70I66BZV
 u8ffI8SP7FfAUUcuHRwOjW+Fd1rM+qsWLnEc8gfDLc7glXFVeob9l4WHH5xIVitH6hnFxD7NqyR X4ylkGnGFKBYUUOEUC2dqZDT2YM1mx6mCkDWH4s7gmY6Wwd12BEDzUXE5+2Q+80dByLTr0qt4SW 88braKa4A4r8wwIXnBQEt2CQ4b2tmjJaydL6PPvl6DGuRbpYxrvHqGex049vdYOzcIzUowT12Vh
 AhgrifpM0oI/S9+jEXtjA0MJzlMm+5qKehQ5Kd+KRtuNfzVFCVTEQOsa8pRNtcnCnEka0gb6
X-Proofpoint-ORIG-GUID: 5KgRtt41tyt4hrhrniBZCDPaownW6Tpq
X-Proofpoint-GUID: 5KgRtt41tyt4hrhrniBZCDPaownW6Tpq
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682fd103 cx=c_pps a=gu6RomWtnwV9OjqK3d0IpQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=pGLkceISAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=iGHA9ds3AAAA:8 a=SPa2hWq9dvtPS2NJTIwA:9 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_01,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=988
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505230013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 01:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217157

From: Gyorgy Sarvari <skandigraun@gmail.com>

Includes a fix for the library version to match the tagged version in git.

(From OE-Core rev: 3ba4b22ef7e50e017d25ba974666f2fdf190a8fd)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb} (95%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
similarity index 95%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index f212eb5e96..87ec4c812f 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-SRCREV = "35cd78efa3120efc46497f55c04382be960d1864"
+SRCREV = "04b214a0d5cf8285e196d90bf2332626b12c74ef"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


