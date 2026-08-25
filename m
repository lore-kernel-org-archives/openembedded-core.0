Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE3E5C5DF81
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12515.1787621620196725211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fwJeSsUG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1K2FK085912
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:33:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=; b=
	fwJeSsUGhRJBuTFheIcCtHl2A56x2rHXISSX3K+6sd5xpy+EHyuddyYBBgS0SULJ
	wMeb2nD6fYmwTmB6pNrWvg/RQ/Zg7a6F+9Wi1ocYRMoVSISV1jKjXltap2wbbjQ9
	lfGUf4vGx96Ixq7w9IOBVYPkYqXpxcmUwLry3dxM0/6rUqGGWi3DITUs4eSzWFe2
	xaL/3J/k4NRj+FtcnPmPD83hPZ8vgfU2Mj4he4E2JzOndkuVKfr9TimUolVWrgNL
	coV0NlFrPK5N8HXGF08PkZarGSqsA3XAFF6qZEuAOeylEfqA+3KN+ZWJOP29NDD1
	pUVVTXNn/QTU4KBVq6LaPw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022139.outbound.protection.outlook.com [40.107.209.139])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g7721kme9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Aug 2026 18:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OdVONtlZNb6IDo83Uk6d29YsE5qxw46306CqoIUwSAphb0Dv/oEQrs64JMivab70ZvvZiB6gu/qUz2cNdnBAmiwHQE/U3jLmyczHNToB9Gqhkl2tRxnO5iU9tXHMfPSzxWVX9NYiL9qt7JgjV0fW4hFHwG/HikVb4GmSFfpnkNUxokJTEWrgHRLKu7nIrsyARzIWhui+tPxZOeKby579KUdSDaB4k+u+9blZzRwzZ4mPFhqXnTqKkqznJcLRh5XP/SsYDrfz9AOd6p69+bkdSuuz1km5HejvcB7TAXDOGT1Idi12HSHKPQEA1rEQH3TqLTUveBAO0nW8pKlhKeHZrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGvlrlWArdVviZENMUVVcISa3tiJlqfQvViIAGrgaho=;
 b=M2g8+zCH5ItwZzCKm94CX58CI5qiLWsnFVahnzhyD8hcNrWRERZDvyDZLkqJqZHoAfGom/nCj5kUg6Fp+6XHQjlblkGkQHgswZ1okXiqOWtCCuQgdfTIflr1PblzvaybXO+G9kaABH+nRMnJlBQErgA8dI8OWciCQD97AG6MjFrCd/v+4yd6vjTyFRmhVNvySZLsz2qxENE9kVL0hWER89M/+CUTVwPhGgAzpAcWnvMow9GjMofYtRpf1JUe1lqdN1dYAppEk6mIqh/xgasuvx4aiicxzkJNYV5PGriYrYl41ez9p5/bpdoCx83gR5HPDreZnfC2pJHqt4ho8Eq1gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:35 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:35 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 11/14] package_rpm.bbclass: Suppress pkgconfig() Requires for sstate compatibility
Date: Mon, 24 Aug 2026 18:33:09 -0700
Message-ID: <20260825013312.2695028-12-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
References: <20260825013312.2695028-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:254::28) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a4be9c-7316-44c6-4398-08df0248e1ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|23010399003|366016|5023799004|11063799006|10067099003|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	wJTku2qPf3DNUeAb9JAtp40PVyVIL1tnRJWQYeNJT05OncM69asnm2OttmL+zcDlfSvvO3FbkMmWfdNQHmfM6G/bCkC2IgXHzfSk2kYBMFktt4zA7OPeiRjgvaaVRR1lHYeXLyyTsUans1lMPeYvMN65dGNcxCCyZzvJWIWWOeTIuAX0RW48DwM9bABoEgkXUwK3oA9tBbbBLmYlUi/Lm7yN+27BKzuCD74UfhyBRTxkQPuM84bGxocJyj+1dvnE7cXFaIWGIn/YUBEAOcnw+dDtjQjNdhlnxOLVYwUaGW53uQtPkDQ3EAsbCi8Gv+IhH41xdjJq5QMgZAE82rd/dNH7YCNPCizYu7NIkCkwQwZOVkp6SAA7HoKCYWqDYDxMN3N5T8L66Z+3uXCl0xK0qNoCNrIbxtosPNZieL1H69tnPNc9WqEEGjeAIWMmrc0fiH1KjNwNU4LDsbxaxwQL9a+feJBkjBPSe76upJWbvKan2hDw5Bh6jQETUDHlgZdFg024fAblOUiyH9SadyiGDvOp7SLmyn8F7Z3eZuidtqbqB1OinlosrZcfSMLJ0aZr4iVC9ykIf/vh585pl19kN6Lr25MgLX1FXcLCNDQKo9UcPpjMtLl99O+Gag4QMq97gC6GcExLWO53ydBq6WBl4U4odnUO86DXKr0mKWEhK/4IJjARHCTrL3qnXqFKqDWcNnJD3u+qPq4YupZe5ih3mgJ1eNBKil2crI1q4jwwcp4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(23010399003)(366016)(5023799004)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Crndee+DgSzizxKew3SIlYS9GXU0qJG4r0/MlBwtoRsfMwxszl1fYy4equCf?=
 =?us-ascii?Q?XhEEksvNn+1TZiPyjSKnODSS9pq/mg/Ho3BXtgWh4v6iF41EALrjwMI1BhnO?=
 =?us-ascii?Q?0HbVaRzMELWMZ6LFEtoFq+VdXWjt7z1tvlPVy0tyRffHqVykpPun6xjCjuDj?=
 =?us-ascii?Q?jzKwXa0jABudwx639buS1EcPdFjcIUPiVNncL/HCWiVCoI5xzQcllKqp4Uqc?=
 =?us-ascii?Q?btT5KvONQyxx6Iue99Qu/F5QUw6H8T6CIKvdQAMzaqLW/V/K0krAvBhRDrbT?=
 =?us-ascii?Q?IuNwfOXetljNbvzWC03EHcwExTIjH4P1bnre3dkN6DKuXvTLR68RFQCvjEdY?=
 =?us-ascii?Q?ahcA7gKLRYV8rsw23Vhk51GiMZX2tP/7sHTXzufPFI9aC2xfEZF+lVe7/vN+?=
 =?us-ascii?Q?SJFRZTnJ4WXM5fvVBAybhAfp6vwEhcguCLlCfbDeP/k+e9+WDIGgmVqMPlP/?=
 =?us-ascii?Q?tcf7Sc9LBlN6PaT9lrh4xewBvsULfGI1OOxmdZ3rr9toj2rYO83NfPtcmhX6?=
 =?us-ascii?Q?JfsnmPTjZdGpupELaD7OohwYzsn+JhuIGriOiCe08v99+oJupOgWNN/7A1bT?=
 =?us-ascii?Q?Eza+5uhV5iWRPZcfc0bkDDG6fqjronY7t2JOKAHZ8ZC9xeI8k9LZO7Vm1tpj?=
 =?us-ascii?Q?Kds97qHw5ce36Wu+YLOGxjmi7I5PT/kPF2npfvCfZ3xKTxBGKuU6unLjvXev?=
 =?us-ascii?Q?WcYhbFCyJ0z5WDVlNCeMY4Y93VB1yDNvCi/n6yh+DJmWsjoSwLvC9KpntuRp?=
 =?us-ascii?Q?txJ/amdcd1pwCoenBEGomS86ggviKQ+u9fUH/99vAEMPNsUhEHdobOWC6nGx?=
 =?us-ascii?Q?87ymhCMrliyA6LFYmiJh2cRSiHz2FsQe2xRMJ6/WLRJ6kJUMfNeRSkep3M11?=
 =?us-ascii?Q?qKWnugblL7oz6HOMhNLEZyoTqgsrW2KEpeRZ1GnKVZoAxd0gikFL5q/lDEa5?=
 =?us-ascii?Q?wsSr8e4xi7WX77Xjo42D8lHuCKx7M2EQ4QexsKq/kHn1ga3C3+1ZL/eKKKlP?=
 =?us-ascii?Q?QIbVr0fgk22NtbKT1zBvqARqIIka/19NYO14GfSxsouUhhhaz6oxMQ7c2sue?=
 =?us-ascii?Q?AuH0svtcTQXL38AJD/Q3SYu5EU+NcwQ40n/FtJBp+MxwMbi2auMxEGUs3kGD?=
 =?us-ascii?Q?c0FwHzLFWtexdRkfccmRMyE3HEuoxuL+5GNA4BFORujIR3hWLz9bMi4T4m6/?=
 =?us-ascii?Q?YBPCS1Cl7s/cBNuRLTtxtpySvNnrFNiZR3LKnwi7tVuJhtB80HbWFQPos+VH?=
 =?us-ascii?Q?Fq46yGOd5Nl5waawa/IjxYknrBGNFb32rUEn22JeNOiUUIvZFilG5GB6fHV/?=
 =?us-ascii?Q?ktMYgjnjrfzbDc5+yVqCRWQXpFLnhszvKuMFb/rsHxgO6MAcQru/hKFtHDkK?=
 =?us-ascii?Q?dRZ3SVbsZhqHXGKynJSxrHHNJ4Zh2hnv7L2C5lcBLSSGcxgt8Yhh+Z2q7W7G?=
 =?us-ascii?Q?X7OSSao04rCszm1Fl9PIhO44CwtTc8F184W56EHxJYQpDDlMXVFJxSX1eRwA?=
 =?us-ascii?Q?/o9RuRWa3bBpweLfuph0ot2L7p6kjJ32PYZ9lms1oN8WBBcNesYuJF91dPsO?=
 =?us-ascii?Q?3j1eyRp2YoM7ICRDfwcMLCvLQjpPIi2BOgP38vsNIXHYAJuDQV/5QsUcYFoE?=
 =?us-ascii?Q?gSg/Oa8vpOPjIk3ueIwAI5eYZ7ZVC9WoLWn89Ozne1ch1N5Y+cxD6QuPiG49?=
 =?us-ascii?Q?hDXZ1iH127oceWX8sfvbkOn+dGJ3BxJSv3lHVnXWi2G6jDpkSUF+KycGq0EB?=
 =?us-ascii?Q?IUbQlssNWjMo5xAPJ5FIY3uVd1Oo+IM=3D?=
X-Exchange-RoutingPolicyChecked: 
	p4yMWC3VTW+/oxVpoQ+FTE0Rca1iDpszcRYiVgzhGyZteCLIuafFScvH67m5ooWBprW6QidEJcyfuLyAJ7b5Pd64HjZMmS4092FogYyLlrbXXOLbSySIMhp9Udvau/b++gfGqIQ4GfNE8X1+6yeiZ1BahZTQvKAXTzTq6GZ+ikyiQ/GVDvcHaAPYFshqpYBSEBClJUZF7H/zQ05KWL7qjaQUMtG33AaWWWH/o9gGp34JLX/xqcR7a5RXL6Yk/o3U7Hne0uj64rsZczbZte1T9E2JY7d67apxEoxtY79WBX3qINbu08tJw/Ycfj1ifk79hgQ/JdDMsAzBONqtSqTd4g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a4be9c-7316-44c6-4398-08df0248e1ab
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:35.7994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjgfQEXfkU7IiaVE0xUtAm6zqK/rcLSWW7dE+AzXdxVwjD/eBqKj2xngYOEJ12ixYPNWGdY4V6ZVuw3fFY+pUC7tXGjOKFFFI6sXEs2eBkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d8vFDxjE c=1 sm=1 tr=0 ts=6a8cf0f2 cx=c_pps
 a=A91p8pFdSY8iZOlwlHItIA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=0YVC25x4kLZrtsW4MIcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: e44jECcVPEeLWu3K22WBrYaoCcJW7N_i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX/yn+opj0xPNc
 h6Do/TMdTDCS9hSUfqhmb4A2u1Ii7MkWwm2e6rZsLIOpwr8B+LgdjY6rcxr49jhi0+8lM6JhWty
 dQPD7/SsPDKs/+gKx7584Y0VGZJDtuydThW5y5bzOyppbixVKBklGDhRVxV1I8AWe8IYrrllzgM
 wr3pN2ULXkRQxyWddc6bLMJP7ZT9MIH9I8KRAiUyKQn27oxrF/Ejq28VPkx8CWfRuPnM8y9Vgnp
 NmVGM50IMU6vnoQFlHiFotwtaL+O5+zItoqbQl1pFp/iOlG09Xjx/eB3vag7PMiPK7IyruaBTR5
 HtDNG1S5AmIZeDCLRZEVkG15Mwq2HWQmhLBI9are7lLObgqUGZBgjWAQKHwmkg4pEUIb3B3ECw1
 ylC3KqCXJ86wxiZ5lFQzMNlWy3kmVSaGpqCS22tJfRbCst+TzGPt8/Wvn/WMXui2j0kz9G9vQ57
 /dG0OQZL1ce/EDSJN9g==
X-Proofpoint-GUID: GfCmgRy4Ax1Lwy1uJGTn_OwpuDYHNEFn
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX88F6Y1OmkS2W
 0JnC26XGSiyaA7LK0okmIdUTWHdhVlq9Ej4OmsaX3hezHW9AEutH4u8m9VRLJ87eV6YUU3hfyq8
 gy34BCiUssMXLm+8v224RuHVS8DCe4Lj4wqMLqBs/QoD88BzuxuO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244183

rpm 4 had two dependency generation systems: an external generator
(System 1) and an internal fileattr-based generator (System 2).
OE used System 1 and disabled everything via:

  --define '_use_internal_dependency_generator 0'
  --define '__find_requires %{nil}'
  --define '__find_provides %{nil}'

This meant pkgconfigdeps.sh (part of System 2) never ran in OE builds.

rpm 6 removed System 1 entirely. For v6-format packages it only runs
the fileattr system (System 2), and _use_internal_dependency_generator
is ignored.  So __find_requires %{nil} no longer works, and
pkgconfigdeps.sh now runs for the first time in OE builds.

pkgconfigdeps.sh --requires generates both "Requires:/usr/bin/pkg-config"
and "Requires: pkgconfig(foo)" for each .pc dependency.  This creates a
sstate compatibility problem: packages built before the pkgconfigdeps.sh
fix (which unsets PKG_CONFIG_SYSROOT_DIR) have no "Provides:pkgconfig(foo)"
because pkg-config was failing silently.  When DNF installs a mix of old
sstate packages (no Provides) and new packages (now generating
Requires),
it fails with:

  nothing provides pkgconfig(zlib) needed by elfutils-dev
  nothing provides pkgconfig(x11) needed by libdrm-dev

In rpm 6, the correct way to suppress a specific fileattr generator is
via its per-generator macro.  Set __pkgconfig_requires %{nil} so new
packages don't generate Requires that old sstate packages can't satisfy.
Provides generation (__pkgconfig_provides) is kept so packages still
advertise their pkgconfig modules.

OE manages build and runtime deps via DEPENDS/RDEPENDS; auto-generated
pkgconfig() Requires from rpmbuild are not needed.  This follows the
same pattern as the existing __font_provides %{nil}.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 51ad195baa..1e016971f5 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -599,6 +599,7 @@ python do_package_rpm () {
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
+    cmd = cmd + " --define '__pkgconfig_requires %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"

