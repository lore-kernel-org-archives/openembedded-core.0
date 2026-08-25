Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BAAC61DC3
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 01:33:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12590.1787621617455446861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 18:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P/2sxJhl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2697b458cb=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P1FfU84038832
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=; b=
	P/2sxJhl/qDrW94CRisZbN/u17M07756Ck3hsEXR01a7QRuleK5byGBM76CJ6HdL
	muzQ78yGFDdwCG05IcqOoe9X5J4EyGeRDgQXdEKaEkzb+XlfVfJNxweRznM4IQO1
	oQ+codqXv1zsO48MXZjy4JgULJHLoTb8UAa8BfQgyGYEYbEb0vjisiB/rrVW7g8M
	K8pK6ETJ5UWAKiS4yXwhhf4aWc1HR4TOH0nVKTMkIJ52rU/6Gzk99xd1KB7L9i6s
	YXZTFs/wa3eclHlz6otLkU7WLz1ACPSw3weKZomqbtzQ983sQpD09htK9Pm+5p3a
	RZZz+y9jayCJPIuIpI1nVA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022093.outbound.protection.outlook.com [52.101.43.93])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g72r6uqvw-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 01:33:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5Kkd2xx1hDZyl7G9BX2QDHbZofC34iHW9YGSLyW6lq1/itYbBkcXt2AJqDcPRUANhNONP9YcJGG1K95DHp5cQsnn3ijbcfDXD3a4U35yGveUVbSDYG0kAH50Qo7PGwyG9lB3r9i5Uw6nKWCIMYno/X67H/YTVr9Vb5jjEs0T8HQ6pa6w6QOV9hoT+CjEf9P1eDti8pavFmoEfYb+q8rxeCt5677WD4iruAF/pEBFA2BL+6tgKamSnFZHKO+YDXiT0fdYjpKguZpT/Ze5xvA9TAbsH5nX7qICLcs2plxXboPItqv4ROAkmUCV/o/Dq+QOisjIfXIkpvQW+ItJQVw5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35Qxh84yHI+1o9HDeg824GHThz4SBZwBX8hBqd49wyc=;
 b=uMixA3jtJlbB4j44qWtBzIrh6oaTf0SIZHm6DSC2Jlo6C+vV6Qi/DV1WagH/FU1CNIodmrFVmTlulMnQUdyaQPkEh5VPKu3DXxrYlrqn3kvvS7r2CI8kdTIjB9El32V3/j/3RWTK1y/ZQNn6zxzpraPKUz7iE/c0RjSERN/qruPPd7cIYYyFI9RhHy0Aj/+CaVGaDAyOc5rW0uUH0d3/ui7Ic6JXS7ITm0U7fpFCzOxBOxDZQK7JFubf8DMOa40jdtr3rm5r3yJ8NnaDVllqrOvvpxbo/vS6BGV8mTmFv5bS6U3qJjWztoWXj3b8B79oI7G+sGW/KI69njLog5ooqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 01:33:33 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 01:33:33 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v17 08/14] rpm: Fix pkgconfig() Provides missing in cross-built RPMs
Date: Mon, 24 Aug 2026 18:33:06 -0700
Message-ID: <20260825013312.2695028-9-sumanth.gavini@windriver.com>
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
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: a7e7ccb9-f697-479b-8a3d-08df0248dfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|22082099003|18002099003|11063799006|56012099006|5023799004|3023799007|38350700014|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ZnJ9ApNedJOyReWu4FYaKTVdt99u5kuumQxYAHZ76MUP6qRnE/91BLajWZtZSHDZvdg5qU+o1EA224F1jeR4JGAVaAqYkdPxTksvtZSzl+1pPoBrz9v4YgdYuC47RLAkyo05wGyes6IUSha18nBQOMGha8WnjJs4ayxc82+/S+IHbf9sd3ZDpUQ/mLiLgQAyEp36HOrTQcxrm8+UvTrq7jhcC7aM15H0UJVLv+ass1EI9fXPzfS0KSE1tosrjDIbu5Wuo9yZCajwumUix4jgSmd1H/Ndcr+ByriWTkeYFusyQaJ+fbdXl9VOpMFzQwi1u2uA0BsnH/uNu2xW9tkDlXFkfXeoLX9orfdL1GiRIAGtC8dEBZbXl2YxwxZ6fXcbWgDBKMgS2zx5tpungVx+YcNlthS8qAhoP7OHlYkxQrReLAza9PtOL91cB+uuqt0cx6GiAunlCHqbTJqn1F6G9MxSliilxJO/qovDZ8Q/J+AbbEJGYOyE/uKDa9LPN2CC7taKHGQiz9bOnuk7OfO+vN0vvqYRkxxPLTdMM2For996WTrpu+ymxtE25n8jiC64NeYRpz7qaQFIKvGPhNHVb1rk+XxQ+u3hVU9m6zip9AmoiEBsr7IJiV2LR1UrnIRidY7UVKTstK06yzJqWn4XATnxQrdECsfaSKYsQ5AEjAP/eSVcaahOcaTSz1aqxFr5xgltGrzFuCGU2p5zv8GESe9cFlY5y7b1psHhH+sl16s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(5023799004)(3023799007)(38350700014)(6133799003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZOH4rAvJQglcMLV9i6sFPdwpsHAxcjWxWPmg0QzlOCSX7oHsdkAIuPZDC8u1?=
 =?us-ascii?Q?ET40t+fgc6DtytufrKy3JgzUOxr8SuH/9AFsr877tC0qkL4IyRXbn82DLjqA?=
 =?us-ascii?Q?3L4sA1yPsa4qpxNYlzNKCpT03i6MAwv9a74osfIdX+GwaBQAMTYcW9wMJpq6?=
 =?us-ascii?Q?mSwSYgbReChazg0H/fSJGVq47DW/nH5D4qeKNmyVvyBZl+yb1IkL8a9Uhzsr?=
 =?us-ascii?Q?G2A45ij0OcG1jXApCPGY4UIlmRZS/IcytUIlEMV3rIWLpYIXbQPfDLfbqvq7?=
 =?us-ascii?Q?CpV1YpZ/sa5ZKR41bMwJ/o8FNtA39NX2ceflC5pf4MPzqXDBbTteoaQDatD3?=
 =?us-ascii?Q?O58JfSpQe5UJ6zLnR79QZt3RmM1LVLFkiLW8uHF1qcUc6EltUrroRnHJe6Aj?=
 =?us-ascii?Q?Ea4D5Bo8GzYK6uhRpxQJians9+sgL7XbtqBGRKRSCQkrh3hzZJLDfoKTRZd4?=
 =?us-ascii?Q?JDObe3n711N6aHo3ZT4k3+zx/TwoOkkSYFHqyT0gA2WiQg1jCV4zVRpZK0Bu?=
 =?us-ascii?Q?WWCMduxw2lQmlIwnpt8W8dVTfk7mSsJDDWPsY0PtRXj7GM1RrS9MkQZFHoxG?=
 =?us-ascii?Q?qazvFDXbFAhtgtIFCmIUrwBK2+7FwrhQHDZgkvOeoWUYNtQ/kehwFg07Xu7Y?=
 =?us-ascii?Q?EHqaINnCtFNKKMHeI0Wo6F2SyGZQjNrhDgMoth2wksPxs1VGBvTZUnT0I2WY?=
 =?us-ascii?Q?cBd6pRuZhSgkCRvGWnvQGy1OpgxNqUS1PT3j2dMrTLD/KRbn3SwXFPpTcXgA?=
 =?us-ascii?Q?HIfmKiCSU9YRhG3IwkWR+bS9c02T6l2ICnw+85SrPtbT4T1xUN7JROu9iye8?=
 =?us-ascii?Q?H+0X7EJYdapDhECO0ytsnJ7wXCLKap6SXt2inPH4pL9BuBLwJbSE1ez5R2fx?=
 =?us-ascii?Q?ByH5GHKAh8lHo8tFeZ5Gh3JFMC0rG1lLAKME+cWCJwPpuwWFKsaVngeXV7i2?=
 =?us-ascii?Q?Y+C3zhwhV/O7LVBfDd6NrrwttJSsmazBF7BdgBMki+3Hhw9QOgl7HXphhMBB?=
 =?us-ascii?Q?WXFcEd9fOZY0oTaclXB7fnNe5xP86APzAB2Qaq1SyBtBVf6oYxZ8nOG/n5R+?=
 =?us-ascii?Q?jVv7YLjfqIkmXzwsAKt1iwapVsEAKOLP6SlbvQYLRqZ0RznR7qhv9Ft62+F2?=
 =?us-ascii?Q?QEaAnrB67N7o7LumxXHhulLaj6RoJt2+l6uo9z1NkqKFvQyeodLUkFI7q/0T?=
 =?us-ascii?Q?s3U9zSHNAjlfkA1qD5xRTkiivP2D/oeLnzGxLy9YfPv4IU7o/gfSggWdjbkJ?=
 =?us-ascii?Q?7RjaJi3CdgoREtuISFwj5EXFVNNX+Mf7OG9fs9cbFzZ4HDBJnJ+8Rxmd5rQD?=
 =?us-ascii?Q?XYkhjZsS2Aj4gpSccojikXzVd7fWwdcPOA4ElWsXYNxo0iNPgv6TRDlibA/s?=
 =?us-ascii?Q?RBkitNdtgYmdg34SAhpdnpJP04t7HGu41RwUfKM8CP4dMHOhVjgN54WdmWz2?=
 =?us-ascii?Q?yFxUyQhdtTqcE8hVCWGKb2awv51HgRekfhaOvsNJ54zgbLStbXtB9uPIUAeY?=
 =?us-ascii?Q?PN4BzRt1MyGL1CRQuKDFdE8dcVsXlFbb+19oV0uv/II3yjFk10gjjmtOIG5f?=
 =?us-ascii?Q?GsV6SQYERUh6eLNvAmsbsP/4iU2W9leG5jL4rWeoj4AyHKzbU5wNO4hUxiAP?=
 =?us-ascii?Q?UzD/FpDxvJLE2ktnrg9mU/bqiIcmYCESiXZYHQFOD6A6VyBfab5rv+Tdymzq?=
 =?us-ascii?Q?onVfSiyp3dJm8CzrOe7zSxIcOYILSEm7gpJ6eC/hM6uzyA5q6Kb8b6bg5GFu?=
 =?us-ascii?Q?e6DpQJz0ORnw9IzUn4Ye3Ej1dzJg6X8=3D?=
X-Exchange-RoutingPolicyChecked: 
	IDrSF7QdU2LW5DfX5BuTtjiMnAfYlv0sF0/7NSpnHTw1gJewbAyjkIMImv3DQatcw+vbI1PczgK35a3FXFpJY36Psk9NahWUwHCSSZg1Y8gpZYsUA/uvSOy0DI+hYyDrRWSYbS5xfMS6eVGxxHseie8yHUH4Bh149WSJvOggGHBndswcTWj6Nb9QA3yUgCS+MN36tx3/06/l/5REcf4I9OxrKMvyCUxmRvneYTCnSUsINJwfVK5F8inaBkuEF1YdlJ1CZFqowqYOT1kPAQe8Ytr3rtXf2ZP7OkPmPRTBbMtiv3pSXWUZah5xF9jDX3Maad/l1cF4TS9wsSHsP98oAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7e7ccb9-f697-479b-8a3d-08df0248dfb4
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 01:33:32.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afXDDq6sRJ9vwHR3QHytaWgiiFZvd67K6pNoDqA3FBnG+0WBJUsFiJ0m22ZorlxvCsbd8k7FSQD/g00NHjL2L5mxRQg8cUA14k2a06DubHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfXybTaSJRW5CMZ
 M6tUuiaR1LFjqEtToAOmFLpbVuDq0UsGNon9VUgajepDecwgRUwKd6rfNQ2XVhgNduZIM7DAQ6l
 cfNFDL00n9ysmT5MYDYgK/9K3xReVzwdWua0gCHl+PoqJ+hLczLf
X-Proofpoint-ORIG-GUID: FwOtxEVvpTudNgeibPI6D0LH7l2DUHi3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAxMSBTYWx0ZWRfX2e9+8ArBj6lU
 eVSEXShsSefaAfQXNvCsEuZ8xsejGNcMtobH05XyI6Af17qDdIj9aIH4EwDOV018Z/BIuNNht5k
 YJq5YSmZWUxv5DD1cewfR4Cn6YCiwsc8+EwgBNRlCjTRqWlpXGHDPENKrQ4nvPcEQvuL4XGWpCk
 TSLjUAMeeb6VWLi0wskzIzS6rujr0qf0BKtmoM8D0rJp3ZUUbKBFCRUyDl7FfUf8uiKWzTivdvB
 MWYfFAUfRtrteJbPUjD/RWi0FDeg1prEiN2741EnurNhjwXi9UxzhDQ6XZYJ6nkgir5QpNMyXtb
 z6eY5WHQPn0FNzGDj0J9etgFuCPCypjktZcZk4aCZfPxsvBeYgzsKdQJFMBwSa2UfOwQNJbyPFO
 bOoCQt3A/SbynQ/um1FaHn6PISQYnn0A7+SVvYphPk8fIPxVT8lvKVRaYN0IVCGseYJAk5Tk7Zm
 ZDZoybHtJYUv/7UeckQ==
X-Proofpoint-GUID: D0IvvaEf9ffdOO_dPluIa65MeobRavtR
X-Authority-Analysis: v=2.4 cv=RLiD2Yi+ c=1 sm=1 tr=0 ts=6a8cf0f0 cx=c_pps
 a=+CKpLqsC5QamL8vULJ+FWg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=NEAV23lmAAAA:8 a=ojM18H5VpAenaKTG1r8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_07,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250011
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:33:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244180

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
index e8977aa31a..c0255941ea 100644
--- a/meta/recipes-devtools/rpm/rpm_6.0.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_6.0.2.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-6.0.x;protoco
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-tools-elfdeps.cc-Remove-format-module.patch \
            file://0001-macros.in-Set-_pkgverify_level-to-digest-as-RCPM-4.2.patch \
+           file://0002-pkgconfigdeps.sh-Unset-cross-compilation-PKG_CONFIG-v.patch \
            "
 
 PE = "1"

