Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07ED0D6D226
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 13:44:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42217.1766065485512640449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 05:44:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C6pEpG5G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BIDRxhQ1442866
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=b73ah8NGTEdG8gCMQtPx1y366dDq5aiFb7ONZGrbOxk=; b=C6pEpG5GRa5m
	eaSjfMEAyxI2otKWXnZ+pi1fHftulqRfUtY/+PHi5KXemWgOgRRH+PPE+xiuJgSU
	MIbdoj0gf67yX0z46+orTlVwDu9sPYbBWDrOEL6N8CM/8XSpO++dfoTX+MSofeqU
	sFKgJ1DFausj7CFexyZnulM4Ox8uBATY+YvKNewBNjT6qG7QySLgeXHbAgzFNHWl
	79zPb+Tuy85kaJB+Murmun0eZ/cPZ8nqs3x5+6vWmCFnsnhCt7mNEDb5ZOMiZiCs
	8JiY6JsEijPCTdiBRXllbte4BFF0LDA+zJZ83Ujz8537bWOeWmtB9aoTGgZME+gr
	vD2ZHSeprw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012031.outbound.protection.outlook.com [40.93.195.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0bt132-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZS66leMSmtuaLa1vYsho2xsqFwMxIRjmQwnkQdYMA//YXyP/TKmRxJqrPTk1Vv+kpL5vC8D7sG2lqA05c+OXkOHwLOQFWj8/BxcqO4jP6Wa7aytxv2bJqhQX0uXJ55yvGDP5Yzk3/SZ3yqdQ57quaBInW7EPDmrooibbv75JuqRBHyzL+gEMTXOrjxWNRc/BXR6dS2BGTFIzKh5omEGH+XVLZdTZMM1Qfn530rfbKsrLFV7K23W0WbwwH6u7kDchssmRnX3r4d+UgospP3PG0jRuwGOkWbVArAXQOaAuualnlyPPh9zHJw045EG/oZ3dA1g4ZAIPG8moUeA7t8JdNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b73ah8NGTEdG8gCMQtPx1y366dDq5aiFb7ONZGrbOxk=;
 b=qFID7rSq4bvVNs9vGZsH0IqcpuqHAtFJY66edt948GUw2E0g4z5MbUciNxCWEBI8owNNxxA8g/qcWk9cW3e+hecDDlVeEtFQI41ZJ3DVLMV6ZZHXAMyw+9/QKf31J8/FtWqhe5GDl/Tm1fHXKE4GfhS9z95hZLM5onzHzmxm7oZSSKbNtqwtwktNddWJdmSZ3R+lZ7SLoejZUPgI67sLTmR70AeSMOM6EJxwmKvegK/qP3i8isS0aP8vCj3kgSJwTJznmrvSJ2EnmuC4mLKMfATKPH3/kTidxS07mJy3fZ97+qFrusWOcgMkkR8SQHR/Ec1YrawUOBOtDx2IpDhePA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 13:44:41 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 13:44:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3 V2] kea: replace keactrl with kea daemons in initscripts
Date: Thu, 18 Dec 2025 21:44:25 +0800
Message-Id: <20251218134426.4187527-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218134426.4187527-1-yi.zhao@windriver.com>
References: <20251218134426.4187527-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0174.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: fd9c50e5-7ecd-4e46-7572-08de3e3b9873
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GMtPAMSrg5k8LWvyL8bWa3J+VDj84PkzAWWO2U03mGlmEs9wTcdp6iNAkM0h?=
 =?us-ascii?Q?yejde4451DIJq/utwDbbkn2yyAPw8Ew0y9m8N0Hc+/PahVPukyXdVnUZhG2L?=
 =?us-ascii?Q?PqRL1E7qpg6uvTLCVDFpG2akeFC9Fa69uBYmmfvnC4Nt9FgXf4UBpNVSnVmR?=
 =?us-ascii?Q?BhFIOK7RPqNdoB/vbvC2o2COMrCmPJfDUIp9LPEAX1RFumWWSdRgN3SBJuiH?=
 =?us-ascii?Q?ugbrNVBjld3NDGZ/8C+LmwFUXM1+wbs/ZbwWVRU2w8QVBMYp5b0ONvzRHp86?=
 =?us-ascii?Q?awgQ+KyzmzA7BNGUOrRdBLflKdTsXJkrTiCWywl3N4xoUZ9gi7h35TFQXXjG?=
 =?us-ascii?Q?h3C2xJPutj4m2roNUPHLpA3BFEjEJ7zT6F1F2xPLaXFSnFxhe28pnzQOAuxs?=
 =?us-ascii?Q?paudwxZqJ9Z99K13Dkte4LxUGQq1vAWcZwOfJb6HrqLs19u9cQBTa1HOPrwG?=
 =?us-ascii?Q?CxBsUzF1MWM3KtFRP4DzsUBo14Lv5YawNybbQ7dhstNst0g+2tyJxELFoSkO?=
 =?us-ascii?Q?Nd64hToKxbmiRXO3SGzAKBuT/16Oo+KJf2fk3Xv3pkhgIevZSzVZaHU6rIjI?=
 =?us-ascii?Q?1v0XZDksVL16+oZR489fU1AFsVzcy6yAhrQxODKslRmdLhK91flY84JQxQ19?=
 =?us-ascii?Q?gIVVbsY5MZdLKfGdJPqizUIliFnCxh9frVFQ5Z6RfB796aIzNqoh57EGgGeI?=
 =?us-ascii?Q?jcOFlYfA4zBTaiX2DR2+snYkcLJLh01WHS836cQxn2ouDWaDsQOzz9jxO6cp?=
 =?us-ascii?Q?JPMsUA0JaTZidBTsu/wE2Bby4Fm9VfBL2O+g6rrW6ERIlo1XIC/eR70Apusr?=
 =?us-ascii?Q?CgHMgMC7O1U7tJXlv/t6+oS+DdNhRZT3HkHXXqegrOZmzcsD9iB38AmLHE0c?=
 =?us-ascii?Q?Iczcp5sQd/zE36sIXGe1ryKS0ZjpusM3CeLEzX7koAcDKb+CDtydISBOo0+G?=
 =?us-ascii?Q?ahQQPQ8ueX4J2EC/86mLpY+Tchnu9qAZSggsH73EmBFraQkB9YdrbjmG+2fb?=
 =?us-ascii?Q?zRC2qrLTaFI0fLZ/4SJNN0EO8JccxHuHWrXno0XAPTTeJ1mT0djoKq8y+ct6?=
 =?us-ascii?Q?LXmsFPWBehfmzf/NfMLcaIbF2VBXUaP4ifMCBmWPK8EZWgbwxFONFhsSRFSV?=
 =?us-ascii?Q?9gGakxgzrEG/BhpVEbJkMbAm+skMSBsNz7KbISI7VdvQZAURHiYXH2Kp+jB7?=
 =?us-ascii?Q?jx5CGikBFgowGvuH8aK8zQ+hfp1xjuzzG8lPF3SVZmqfYGtPGin3HFwrPC2G?=
 =?us-ascii?Q?CnqUdHMhqp84F3kn0JaMJR8HVOHm+p3f7IuuHfmvmaxjf5IUqCZTIrhOdt80?=
 =?us-ascii?Q?W3dCmXRxWoNL8Hnf4Zz0m/+ywQR0tRBgqtpJ81V1LWnNIIcdMZZJ/wjfu/X8?=
 =?us-ascii?Q?rxqdy687MbSvSkpsZC35hK50cGaawuFFHqN1s61/o2RHlW/iMTyN+DnZYBUS?=
 =?us-ascii?Q?Iue5UZusGvlZxNngdEXcazeVCcqae3uJx/0k/7X/esWogsurkOxxHQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tdSBtL4HMZjR1+w7czLTbkXp+KgFIwLj0seUSzG2YrtHkg9hJ1x4hjRMPjmD?=
 =?us-ascii?Q?yYZUP6H5hjPdprPon3uYcEXhZphn+ExdGGmmPoIqEDOUsvWZHPowQtrcPjIm?=
 =?us-ascii?Q?5IuhDBK6WEH/9V3UFfi2qhBLwLGXUWKVVgrlDVufmKFM47JCvWMGDkvs16V9?=
 =?us-ascii?Q?LuUePf752SurEOVszaCH8p5X7T1FYHInssP4Wh4eymaTcgzuqGuoplCsj8SL?=
 =?us-ascii?Q?YMd7/RLsNf3BtBBz25ha+4DcYSLUlvmHKONtfIWn0NAuIm6bohQrNRcUJ/sr?=
 =?us-ascii?Q?Adg2cGhnZSaZk7v8tZ1lbvh2xGYxxucBLqf1SQNyp01k1esLkXB7JI5quy0B?=
 =?us-ascii?Q?btC776vdRIX+RhUGhuHtt0xEOs4QzlrvLpgnCGf7ox7ph4tVg/2+VeD+ZjuZ?=
 =?us-ascii?Q?RWsu8sgpj3I1/CNCYuxlYlz4W1tlK8VFZh4XDgD3JtT9ozP0v6wqNzgjcuJj?=
 =?us-ascii?Q?DkMPecYA+dQ8Ji+GAlonaGSEbH4zam/xNm+JpzDMlP7AKIq1EMdlDqhmvtwc?=
 =?us-ascii?Q?5bmle6aIYkyI0qyANKttI5vIXLrOFhxGhWTl5Z3K8o99Qtx2enex4+G32KMs?=
 =?us-ascii?Q?mkLdZyyh5wTXo43yySsI1NUQGEyqWLhPUK6Tw+jU3wvtSfEUyEFdlYYTa9Bd?=
 =?us-ascii?Q?a8ztCs0jSC5IXQE01sZ+8VyMiIPnXdjEKIb6uxFawt09+2yMGrR0Gm6WeNuV?=
 =?us-ascii?Q?j4DwaDbxx5RRPWgeHW8zWloaozCkDgoAM/+hbAjguNy00a3kfZN9lt2Nip2I?=
 =?us-ascii?Q?cH1jXZUPq7jcAepkGKPGnb+Z4vEHsGUoGzo83zMBgJYouZOnqMqwuDF2UdD/?=
 =?us-ascii?Q?maww0bqSdBFfwXbrTw7IRGI7TVLQdIvk2NzVi+BTlbYumEFgDRxRmZE2JBdo?=
 =?us-ascii?Q?giCT1BD8D/NaOCIQzGSEirp0xszVsCOQrAp2mEC2bD6YVgt71nzadNEUM1c/?=
 =?us-ascii?Q?3hcS70zer8cSBGaWlGAA9E1+sXv2lx+Fef5PergAiJGP8eAQY9vb62gpnb30?=
 =?us-ascii?Q?oGKVMMjkUtx4e6eZlU+ILRBElOfrx8uKI69zrhWs+WP79PxMQAWf6zLNAItj?=
 =?us-ascii?Q?zPR2ErdENM0ATrjxsIDGKegkot3Dx60LMmfrdQxg93OGRT7/AKJyA9D2fZkf?=
 =?us-ascii?Q?IoCb9CX/eSVYTVk8oU3pcarJ7mDeIaBlit91aSYQPT7fQgbmzON8KdICkycR?=
 =?us-ascii?Q?dmUq1FrGfXptKCMMvGIs3hTmxWNf42ulwwntq0a0UXQip8Jrle0+UeG/BfA3?=
 =?us-ascii?Q?Y+mY2i5w98AkFfct6+AETg6KBVpD7RK9yAhHipMix5cxoiJVc6l05C4tC5bf?=
 =?us-ascii?Q?g+oyZbXHUlPUznGA9maDEDAMuR2ER2MbdKXj4iN5rsdg2PdcFvWuG1rOAY9z?=
 =?us-ascii?Q?VhhV5+OZeeAdaSp3UUpm/po7obccrECFkXYVTt0yIRUftjyYqJbxKV/CXH+m?=
 =?us-ascii?Q?gW/xNVIpnyggCA2gRUE5ftvYhVpPQH7T3wuVTCYDk+x/MESzmQVlguWpTF4f?=
 =?us-ascii?Q?NkrsXEcp/EI9+e4hPDqy0/EvZDu8sf8WVfb/xBxwTzbpklFSq4bJRkvjnS0+?=
 =?us-ascii?Q?s/k90einXRK5PB0EwTS/ON96swZhwm6O8s5OwaO6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9c50e5-7ecd-4e46-7572-08de3e3b9873
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 13:44:41.6642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F6uNqh3kbT7Yknld4ZKPI7dHjYjdFpodPMPxIsa4SUN4VJYruXFbsgoIUPamJ/MbvR0OdS6g6TUVcqb4EBhO9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDExMyBTYWx0ZWRfX8pbXgLJjetri
 j5MManjyB/9zkpVCvB0NdUCP91d7N+oVNH9Bbs1/OV4DlvlsEYAK9KiGfMXlJGpHVqGybYzVpjs
 3+LS8oBHiYCX27zoN3z0Di5s+f2Y5peEAvdZuJNwqBuHtNuDhn+GoQOnRODBRxIeCEfzO+DfnuH
 W+2hPI7AEbbBhiZ0DxIv3Ye5pM8VB1GsFywluoUVuEq7JOoeJvwfqU0qxqR8KxxChTpwsRqu/Kh
 PwPmuBPM92GNEYifjoZdX+aSP8QJFScbZyZ7qJnNFbm1oBZrKWEZRBQ5hHe4H94xQHtTtsRfDZO
 fWhod2jMSqOocAkbyZ3ZTQ8EFc0EMby8ESB3QmHv55gtk7hp4PyE9j9U2cnRWt3DqT27OWDmAZ9
 4K/dCrMb+z8UxfDk8NhsC749kyl34A==
X-Proofpoint-ORIG-GUID: -iQQkwVGcNksECkNVRFeRF5FhxJ-yLI3
X-Proofpoint-GUID: -iQQkwVGcNksECkNVRFeRF5FhxJ-yLI3
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=6944054c cx=c_pps
 a=+CNvbeBFiKBwJ3WcPfu9pA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SCo1hh1FAAAA:8 a=UXIAUNObAAAA:8 a=t7CeM3EgAAAA:8 a=xM-FUPNtTvUpdSPhqdkA:9
 a=MN5MmQDxNtH1qPK1:21 a=Hti1SrPgC-EA:10 a=nwb-CePKZZm3gL-ai9HY:22
 a=a1s67YnXd6TbAZZNj1wK:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1011 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 13:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228123

The keactrl script is used to run Kea from installation directory and is
primarily intended for developers[1][2]. The initscripts should call kea
daemon directly, rather than through the keactrl script.
Also add a volatile file to create runtime directory.

[1] https://gitlab.isc.org/isc-projects/kea/-/blob/master/src/bin/keactrl/keactrl.in?ref_type=heads#L10
[2] https://kea.readthedocs.io/en/latest/arm/keactrl.html

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../kea/files/kea-dhcp-ddns-server            | 16 ++++++-----
 .../kea/files/kea-dhcp4-server                | 16 ++++++-----
 .../kea/files/kea-dhcp6-server                | 16 ++++++-----
 .../kea/files/kea.volatiles                   |  2 ++
 meta/recipes-connectivity/kea/kea_3.0.1.bb    | 27 +++++++++++++------
 5 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/kea.volatiles

diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
index 50fe40d439..ebdf6f4dd6 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp-ddns-server"
 NAME=kea-dhcp-ddns
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp_ddns"
+DAEMON=/usr/sbin/kea-dhcp-ddns
+DAEMON_ARGS="-c /etc/kea/kea-dhcp-ddns.conf"
+PIDFILE=/var/run/kea/kea-dhcp-ddns.kea-dhcp-ddns.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4-server b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
index e83e51025d..247f15d7fb 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp4-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp4-server
@@ -11,8 +11,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp4-server"
 NAME=kea-dhcp4
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp4"
+DAEMON=/usr/sbin/kea-dhcp4
+DAEMON_ARGS="-c /etc/kea/kea-dhcp4.conf"
+PIDFILE=/var/run/kea/kea-dhcp4.kea-dhcp4.pid
 
 set -e
 
@@ -25,13 +26,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -39,8 +39,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6-server b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
index 10f2d22641..c04393ddb8 100644
--- a/meta/recipes-connectivity/kea/files/kea-dhcp6-server
+++ b/meta/recipes-connectivity/kea/files/kea-dhcp6-server
@@ -12,8 +12,9 @@
 PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="kea-dhcp6-server"
 NAME=kea-dhcp6
-DAEMON=/usr/sbin/keactrl
-DAEMON_ARGS=" -s dhcp6"
+DAEMON=/usr/sbin/kea-dhcp6
+DAEMON_ARGS="-c /etc/kea/kea-dhcp6.conf"
+PIDFILE=/var/run/kea/kea-dhcp6.kea-dhcp6.pid
 
 set -e
 
@@ -26,13 +27,12 @@ set -e
 case "$1" in
   start)
         echo -n "Starting $DESC: "
-        start-stop-daemon -S -b -n $NAME -x $DAEMON -- start $DAEMON_ARGS
+        start-stop-daemon -S -b -n $NAME -p $PIDFILE -x $DAEMON -- $DAEMON_ARGS
         echo "done."
         ;;
   stop)
         echo -n "Stopping $DESC: "
-        kpid=`pidof $NAME`
-        kill $kpid
+        start-stop-daemon -K -p $PIDFILE -x $DAEMON
         echo "done."
         ;;
   restart|force-reload)
@@ -40,8 +40,12 @@ case "$1" in
         $0 stop
         $0 start
         ;;
+  status)
+        status $DAEMON
+        exit $?
+        ;;
   *)
-        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        echo "Usage: $SCRIPTNAME {start|stop|status|restart|force-reload}" >&2
         exit 1
         ;;
 esac
diff --git a/meta/recipes-connectivity/kea/files/kea.volatiles b/meta/recipes-connectivity/kea/files/kea.volatiles
new file mode 100644
index 0000000000..d0350e38a6
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/kea.volatiles
@@ -0,0 +1,2 @@
+d root root 0750 /var/run/kea none
+d root root 0644 /var/lib/kea none
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
index 1be557c79a..6b07ab8a4a 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4-server \
            file://kea-dhcp6-server \
            file://kea-dhcp-ddns-server \
+           file://kea.volatiles \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
@@ -61,17 +62,27 @@ do_compile:prepend:class-target() {
 }
 
 do_install:append() {
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${systemd_system_unitdir}
-
-    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
-    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
-    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
-           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
-           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
+        install -d ${D}${sysconfdir}/init.d
+        install -d ${D}/${sysconfdir}/default/volatiles
+
+        install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.d
+        install -m 0644 ${UNPACKDIR}/kea.volatiles ${D}/${sysconfdir}/default/volatiles/99_kea
+    fi
+
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_system_unitdir}
+
+        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
+            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
+            ${D}${systemd_system_unitdir}/kea-dhcp*service
+    fi
+
     sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
            -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
            ${D}${sbindir}/kea-admin
+
     rm -rf ${D}${datadir}/${BPN}/meson-info
     rm -rf ${D}${runtimedir}
     rm -rf ${D}${localstatedir}
-- 
2.34.1


