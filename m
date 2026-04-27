Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC5EFF8850
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 06:34:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37331.1777271641919470556
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 23:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Yt0KAd4I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85776b2c12=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4UDXG3372081
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 23:34:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=tKBiVVzZ9
	tlQQ39rmAldlTvKNMFMQeH/10naJfUWJD0=; b=Yt0KAd4I8FwA8ujFsoaxuaLHs
	dNFufZkOsHK+xwCttu5uB9EOlwAxebR4G8QV9M0KZU0IsSdk3yzDXI0qVZP9tVx9
	bXaQW5IOcoNFR5eImEuDRar9AvJfioX9icTYIrOpL4uvBpvtv7WFKw0cPnVWE7+X
	tMNYYYbmQeTJ8k3hSpL5LiX2UlviAsLeFk3mDdE9LaLBRq+8oTOZeHWsuodO9c7h
	O2bJJYkV7bYPo/vC2DO+ecMFgO3xUpvD1W880i/Murq1Hyth0TIBNMYxJpe2qJlY
	H4blAe/TmdPO0l4xY1H241rxh+5XotrPZlShymbq6VGNLd/3X6xTKnpVtkFEA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drw4j19w1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 26 Apr 2026 23:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zan1921zDRV7KITUE5ut94Rq5KEDkTHC1iNtHvp+FXq825Q9GCGJhF896uJXmZ9PM44AK4BIxY1hAj9O67ZI3AjSMHXqKmekD9QI/bx/McZDP4Pv5uZX+Jy99m3OyfELdGhX1RZZyeXrfiFp8jo2uncShSFtaXlSSbwjcxKSLWhJ3ljWNLQQhpp+Ez36GKjj1Ky0yUqG3M8rqtJ1aHUcxbZ0spK06aozq6Nru4yYgDGn76N8QMOqxjchp8iwusyDtg1BppJF89nnSDhcC+jcjtq+Pf9Xb1JEAyzEnNzFCfq6H0OQeyyajug7zCz+LdnuB+v7WYrIjyTQLhYhCh0eSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKBiVVzZ9tlQQ39rmAldlTvKNMFMQeH/10naJfUWJD0=;
 b=DGyNTiTDKoH36ID1f1S+bvtyUceo1xlrEXkUuAnHW6/NRHZfSgPFiJaYUYYat3iiaIvP9SHMsEm3dJBlLSC+d7QdUyKs7QRY1aWHbjZIaTcNy1TPHKqAS++xpMYbTGjp8ZLZyvQthV9elLxUr9msxU+B40C9d0lyfeLIvlvIx1ZKR2vSmGWSR3DFm9Ggmx/CVKAQApWh5TrTLS8PlQrOzAZSP8Rq/CoyrWuYT6MKEDaA4PF+Jtgc57H13EheMtZP04XBkfLKTt1Q1iyIFCStdsTrh+rYaY9lxHNDfvCy+gKlcjE/qJRVLdgT03MCTjWDzNwvvvhaNHEWnTGbFhI2Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA3PR11MB9424.namprd11.prod.outlook.com (2603:10b6:208:583::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.15; Mon, 27 Apr
 2026 06:33:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.20.9870.013; Mon, 27 Apr 2026
 06:33:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] binutils: set CVE_STATUS for CVE-2025-69649
Date: Sun, 26 Apr 2026 23:33:34 -0700
Message-ID: <20260427063334.1391054-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:254::30) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA3PR11MB9424:EE_
X-MS-Office365-Filtering-Correlation-Id: 586565b5-f2bb-4a0f-3236-08dea426f62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8/+JyQqX1VB9pPBcY5K6tW9GPO4OIxbZyZa4+2bUHE5l351HzcC3l1iED72Sn1nrIdDHfuklRD5JJL58JYRv1J1g15UtocSdJIEAPXF5egnWduboiANDbM/l83Mt91OiYG9DRCHZo9sU7PhCv7jcuLyUSBBSzuWoWMmDZXA9ep0WFeM7GUxRirCwxBM2gyU+IsSqDaEoysmRDQ6ZYDOaf1iDhiXuO6kPi21CtnKo8MgHEBTKMUkOPOI1JsPz2taJ9btK7Mi1NSY5qMWZW1vzCX/ZdVY28kgkZIg2Qrbk9PVyHjVzDCgMAf9+ovK0GvEQd5clXpOle02p2s/w1SFqsUDD499MpO8h+UydlGCMbrBxj5xCuk3TDHKWmKs8KDE4MjmkU7ABmnFTkyOofHSklwu1w86EKxIp8fn7A1AvqLXPf165FdND/mIU8F7F4fgCuRmopXeyIdqfOr3BxlZwfwW5xqXhdebHBQiuAKblc9yIP2GD0Oi6xlc5+Q/D1qvqan3csbysOqC6FQndyiMEcmYEuPC31A7qTjbmMsnLf2rCtAh2BN+tVM9LpWjdNuVUTzCGf3u7mEdT7bfYGGs0PoAigyCacC4g2T86GvmYSVmTy6FOkJnx8TxQ369O8mId5JDteH5P9DowGLayD464hNROkHoLQ/qCg7wh0Jxv0lJWeA2mjCOVTUlHw3YRhK2OuPcCCykje/4qnPWaa9KYU1Cjg1y5Vs6KWHuFqXYWC4d0Wwoxmc+uf2HgzkNZnDmSGidPDESvDfRIm4o56Tm0kmKS2ZLds6SRm4M3mD+g7Kc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8JCr6LFR7+08TYwNYGIlP4exxJAIgfVqMxXl3cLPTO4sbIzM7mVdOGa/t+s5?=
 =?us-ascii?Q?l3s0uGDaM8wFoSoG0Ux+atO9r325ObXaGDdTbta0cAIF+3GtEvZ0HR3cIVX0?=
 =?us-ascii?Q?D58SsJxtFEtIWbY8e2y9P3kVFFX3LFaVYMd6dFzw4QrhPtq3iH4mbqUprnqT?=
 =?us-ascii?Q?Xp14XePEiZk/EJCSq5oxfGyggH6urjO3VjPjtQ521fqugL51Siwi+iYX9ZB0?=
 =?us-ascii?Q?hYECyQmxnREiGC42FT9+v0vskdk0M2wkl7sVLhoI1rASDGBQvZQbdWu3s6bE?=
 =?us-ascii?Q?Buk5Maxbo6u5a2CPCfMrfq4ZNaEGq9O+sVfZWbvgESrGpX+Omq0rvyEpi4XA?=
 =?us-ascii?Q?ekKkta7MVD2PR34UQNwbKHUzzcAPVYyu6DJ5+Qf9AbLw5bnhWB1u0Mj/zjxy?=
 =?us-ascii?Q?73wClGvs6Na6PF9j1ds3K3uxDUsAFwMN+KxmLZQXMEN8vyjaBrmKeKNEDCkM?=
 =?us-ascii?Q?hqBjVUZb7/w5IJgFhCh0JPRyOS6Un2sJhtJ60YZxX3IRw+gfZRY713EpOCVP?=
 =?us-ascii?Q?dw2d6QrmVV5r/ZNboteax91BMC9DMGLnnA016NOEDLlIsHto5Wp0BWDAUDib?=
 =?us-ascii?Q?q+sZed9sNCF4MhvV6qB0HW2oaxayhxj+VA6b+6jzXAZOcZxpIMUsFLig2cMU?=
 =?us-ascii?Q?eboa/Mpb1sML2AuxytjvUAnNNi7+uNQR5nB3Xc6t5J/Ee5I4gpBxjw0fdner?=
 =?us-ascii?Q?Fr4IG5N5Q5tDKsgvD/O2qEaF/O8DW/B3RtaK9HH7m190nOisgQUa2e5rdgmQ?=
 =?us-ascii?Q?kKMbZX7XzZ2yRPyGpx/HW8x0iCVv7p3/RI0xc4YckXsW6sHAxoF+NbDoHQKN?=
 =?us-ascii?Q?gWvvHpvxYGtxcXTcT+E1F30wfS48NW4PonfAwWwTiTp9jleM/66qBzoZRJPr?=
 =?us-ascii?Q?Hy+9mMsakUDvP7TsFYOolLyVVNJv2SNUQh6+dKOet9eHE4vgadATAlrEoycY?=
 =?us-ascii?Q?eRQjFIo3cZapEvGfugYySrHJ6JBJtZK5hD1Y3/HtQ+zw9EBcrNVVivBM6g88?=
 =?us-ascii?Q?F0CV0+/H8bIFE6Vw3c9Ay7gzat4n9FhizZu1hM79moNXB1F/ic7lzeaSmhnQ?=
 =?us-ascii?Q?P9M4vfGl9T0wEXhuhQ6kuR8EqmYFgMovX8lAZ/aZLYg+uobBhF9Rr33dvqiB?=
 =?us-ascii?Q?Tl8N+82x/s7lzoKjJ64hJITUBfLvcGmmwfkqQgr3weaWoaaaMXrv8ZK5F5fn?=
 =?us-ascii?Q?nQiBc7GcT9nepqcdR+6jS0zj52XIkpvEAvhFQ/E0t5mHxHDINR4jh/8LOqFU?=
 =?us-ascii?Q?B10DRzbMgtWadPdMiZOieQJE88BBTNiI5ZwIybcmq0Y7ShTUSqfLyvhr2X6d?=
 =?us-ascii?Q?jfASNKSGB2jLaUxs0hdI+eDWj6X0jVq8rUV/ra43Mz462N6RaxLfpVaD01Ur?=
 =?us-ascii?Q?CQXPlZfCI4ibHOgxqLGixweigs/rThbJTKDavrYhq3RoGD7PA+OT9ieIOWCn?=
 =?us-ascii?Q?cKVnET6fTzbhyxlVH38IUYuRLl1Ej+c5fn4d+eFQIfudAWxcfZvQxXvh8sUJ?=
 =?us-ascii?Q?emRHwzMucFksRN+JPyihLvtlAr4oDA0HAjPwxleCJsYFFJJqJH7xydA3zuZz?=
 =?us-ascii?Q?eDrbfpw2sopLrzjXytmoJHEMJ4c7/VqRcMpBbUpFyp22AUNZgFx2+nL3WkBX?=
 =?us-ascii?Q?ZNYXeseiBi/AkZe5GVzJqEgdZvv/+n17uXeomGchgOXs8h0WY0G06bKePtd6?=
 =?us-ascii?Q?iIjpZ12fDfUuqW+5zEdnf66jnyv25fy+FAbhdHVZmvGRLqrFbwfw9lKlrX9l?=
 =?us-ascii?Q?EV0tVv9TA5oZSE1OAhLb3BhASZV0HW0=3D?=
X-Exchange-RoutingPolicyChecked: 
	Mau/EI+QyiYDh6FkkZ39iUhc+wbenLhIFFGO3fh3D/cEzqkckv21rHGedLc8ljftzN5EBMLvYNEee8qBow2H3HMJ02wvcdBaWyeUtqlu9r556fOVdIRnnZosPzOKZcHieL0bYaMP8A9w6IwsYnhFm8DL4P16Rwt3W5TH2stjnHkC9grcONOMe4TBcUgUycXKShoqZGZIKXtGIFN4iE5VCLDBVL3EVM8lo6FPRwfwfRaq3U0q1mVhy8mJrvQoBV3l6qlvtBbvMmVnc8sxHIHTl4LMmbDDcTkYA+OgVEt4DYrHr6N+6OWzY+RO9bnvLooBFS4suXik+ws2/pN+mkrUKA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586565b5-f2bb-4a0f-3236-08dea426f62a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 06:33:58.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGbnpIYM+52tYueNHon/y8lS2y0Yl+LpeXoge5UeMNcMz9mjRA1FlkMCf7XjDppWptLISK6FWC5hLT6fzpVMD99Z0uRWt/b1apELxIeuqig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9424
X-Proofpoint-GUID: RxlUyj1j6A7ei2Wyn567HC3DHGOpy_HS
X-Proofpoint-ORIG-GUID: RxlUyj1j6A7ei2Wyn567HC3DHGOpy_HS
X-Authority-Analysis: v=2.4 cv=Iroutr/g c=1 sm=1 tr=0 ts=69ef0359 cx=c_pps
 a=42Ag0VRmng1YD8CjqzuPTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=4-ndGM75-CC2JeZQe7IA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA2OCBTYWx0ZWRfX0raIyiG7Ig21
 onVJByzEJuEMSPoyejiWXlhl60x1ih1kl7TJQC/6lHoAMhYY+o9qV9BLCnp6CWULH13zuiLtKXc
 WTgMtbYY1H1Hz7hnIsZ4STi8sAZcSXyFVnc6sVzQC9YToF07G0tQ29mlrrJHVnk6Kx1h3qNjq4X
 7Vxd/hyrm7+bVcEixs+ykwSXP3nZROfL+3r3dCFIB/CiwhHQkfA94FD0Nq7ThCt7lQoeIhrZHwl
 BEA9wgKXmqhxMqVHFqvsS3m1C8/qEYtFKdMfTNG6W302j7rSUhXTg5J7X+pSlGmY4H08giV4SmI
 vPa087d0de632RUY3GTZtoB5UQLxzeNo+htxGsIkV2wcZTt+djMElTfRmZyyauNcaveRQECQD0j
 7pd06Nn9VGCWeTU1xaGKYZdaQfI2oYEqjoLFNUis/bQdQIIFeBJ3vi1VOIOjERZnStQBPiW2Ksi
 mYzFFZ/tF84G80f0E0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 06:34:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235984

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Set CVE_STATUS for CVE-2025-69649, as this CVE only affects binutils 2.46.
binutils 2.42 is not vulnerable.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.42.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 839d31242e..ed079c0349 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -20,6 +20,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2023-25584] = "cpe-incorrect: Applies only for version 2.40 and earlier"
 CVE_STATUS[CVE-2025-1180] = "patched: fixed by patch for CVE-2025-1176" 
+CVE_STATUS[CVE-2025-69649] = "cpe-incorrect: Applies only for version 2.46"
 
 SRCREV ?= "f9488b0d92b591bdf3ff8cce485cb0e1b3727cc0"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
-- 
2.49.0


