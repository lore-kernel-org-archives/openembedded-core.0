Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B5DC55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 04:18:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36424.1785730681517293534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 21:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ip8bun6H;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=267553595e=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6734Bh6O453680
	for <openembedded-core@lists.openembedded.org>; Sun, 2 Aug 2026 21:18:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Nfful0nth
	HZjNcHqRmBYBqSeK174KucVldUktPkt0wk=; b=Ip8bun6H9UVsoISpvC8+ETX5X
	QwMcsfo1qgVz4Xf9EYo2kiosaBODhvWSt5pFzFsaBZ3kyWJtVC8mVmCC4Q7dJVtM
	YtUuMi0hhrP2iwqrlkXql/oJekm39P9W1+W1musZCs11BDwsR45zdXyBRHKUbzly
	TfTNtgdYh6WlGu3pYKDcufLHdn9gBBvGnWqh6kkGpiTHIt0CPIsinkwakwTvJIIk
	CRsOj/sYbWv406dcbcNXGrvOh15zbdZPMkGY/j293RQVsa063rL15BXZrCiwQeRC
	8Op42IacYCT/LUANLkpnCueg9dx/Oc9vFmj7UEkNX7lAfkSz/7HOMjoxrwJtA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013010.outbound.protection.outlook.com [40.93.196.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fsgah1hjp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHZTfwMcbbhoZeF5eEEq967N6WI89xg0jDNkfc95DRuRIUxgmA/KUJy9Ju8cop2VnOJv6TKVyX7r97l0r/4lWodAEhzAiJJERDemqzI+aPzW/tTk5ruVCmCbPP5XFhfnH75V+KxgbDmaXFvmijnoDrKElqV5quaU1LBrQxr45hljbw/mjMb5msiHyQFLTRokpQXPz/OwY1avJJFc71o14/wGsEtI/P0Ljde0jsd96JjrRaeTkycWrhjNSTDk0TdNw6m0tq4PrEU/NCOYbQ/8orRLotzJc+LyIGuNMx1qhVzf++colt0O/T7iFE+uPZd0JTCuBE93cYKg+DXmkpu0fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfful0nthHZjNcHqRmBYBqSeK174KucVldUktPkt0wk=;
 b=V01JDcYwQ9mReIznDIR1ucmDOAR4vin74xnSv9nkH34cLty90bJlhJVqb8ndFdwIGxE3kZ5wEvMd7NG1iA/xkmKqVGlVreR2H8zjGmYl/IqrDyzemGksmC+sSY9KQqydmTjJ73DrIM6q3B2T7JczFHrh0IdRlLwInojHJzPn8/o7oVVEMO5HWqvbAb6UVCuSm/3qSUPklwE15P1CZkmMnlXXz7Bfd4FQjGD8tA1DvhWLEl6ZXsCWfjm5vuL/8lZ7eSd0IsYfx3f+2OP+4RhRfiw05o5AQwNbbMz72v+r6mbkdFcrbZw+066n0IF9SSrWqthpytR3rzLmqDflnk6WoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 04:17:57 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 04:17:57 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH 0/3 v7] Oe-selftest for Clang, LLVM, LLD 
Date: Sun,  2 Aug 2026 21:17:38 -0700
Message-ID: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0050.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59e::12) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: de88bebd-a4f3-4e67-ee47-08def11632be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|56012099006|11063799006|5023799004|10067099003|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	kzyJD3WZLixswfpOULiPom5HN2vyLNzAjsg7s/08NJn6DtwhkWJv9C0vXX0wkZa9mIMKJBBoessBIJq7sIyXF++N7E4Mh8Mo16x2WKllI0dn10i0XOq5CG0qNeIkxqt2Z1swPpl89BZb4wMeC9NBwv9QKmb3kyflqrqNTHXq2A6Vq37RxaYkzWekqIvj/vfFhmeIagdsDC5eGHXrCMAS7p+7vlkkeEgHkJ9WLDPht53pCTDxKl6Z34eM9hi2LLkfaco8o9DZ4huYKPc82NohCA5rb2fIN71Je1+8wP2YUVaArG1V2zIYHS2qqGdplDPxkY0BaAU5Lq8oKgzk0Z9lVGzpDFDuHd30f8D9m66jlMCylnOA0EjPw8/O54xsZPCrBhaURFnFFR0BsvArlBvAHk+CqRbFXFA5BLfxl4Luvf/lY7O2490MJK7T9yjZ4zPe4ygEy6EM1lzq5Zc9kH2dWOTvIp4iqn1OrHoEOmqGQgbBti2ecMDK3xaqf8wPrfi+txlD7RYC7QjrJui2kb4U2kD3V6Ju6qQdW6EV0pB2tPUZEIktXLFElbaHhoKTkgGBzMLIp8nO3yHUMkRn7h387fE0qt1pKtohv2qIbcvFqD6rKpIAA6Ku4UF/dXibzffBXl94KTnGj71VS7ETd1uZ0NqcMTDLLWm6jZ5wSmbWv61tqNCpRa2IvRiZIzWBud4Rd/bqLfU4R+j3cdyGZFlkf0HX+stHgboDIdw2qDpPnkE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(56012099006)(11063799006)(5023799004)(10067099003)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AmnwaNit/vRq02EFQ1hZQkY3/MAqeD19XXY1iYOjqlyh5ydyeuceJ3FQZL1p?=
 =?us-ascii?Q?c49Lys48oxXyLcBB2fXtmzSaWTHYIsLPoInHJ6iORpCrvQCHkvOQEpDrYqLI?=
 =?us-ascii?Q?9SM4nw5NmsD7bjl6u703LIJSmXbFFvwFfE9lyIgE6AOzQ9vM4MnEJ0Wb89lh?=
 =?us-ascii?Q?hpyCGgv2MYW8G1LaHEi8kP3MXPAf+pomhloCRR2BOpdpIB35OiBCuOXJwCBT?=
 =?us-ascii?Q?0KASat1kC8jyDalGqJT4uISwdF/WH1tc3NBaMW9dr8oUqragzXDrQLkc6JpM?=
 =?us-ascii?Q?WgymS0R7vdV/6ThfIF0eb2f6ad7i2R6JnvupVB3OLjPRsAcdby5coZptST+t?=
 =?us-ascii?Q?JLLG+sx/jD3Fdg9EiqUbbbmSU3KnasCfoK3OAJD5uie/7M+8DUMGXCAVFSwR?=
 =?us-ascii?Q?AemPl+dsneZI1w3OsrXdARHBSPqRpU4GhoEpuy2SfGLsd8poVUClFnnhKbR/?=
 =?us-ascii?Q?u0F+Zl1PJmRum8CamDvmls6JTC8Avekw0Pe49qop4Oc4srb+hN6BA+NtMr+r?=
 =?us-ascii?Q?qQ0Pnwbnb8S6u5+OdGDvx82YGI+LvmHC7YqIQQ/8b8GtE4QKFDiHftF6Upt1?=
 =?us-ascii?Q?vk9KoRJIWSUpGJ6gxTeBCUF+wzwD1H3BTcJzlM1xResvrB8gWhs/G5Rx91eU?=
 =?us-ascii?Q?la8xgDIMGr6H2NPnipDyDD5KwoTMN4dif+LSb6FdSCu8MNniglJgiem7jYPt?=
 =?us-ascii?Q?5K/YnXZ2L/VepYqF8qKnCXthABcmzTW/sD8ljD11ZyVa36EB/QpeCpJ+KzVc?=
 =?us-ascii?Q?UCPOk+edrW9YmdVM8bfmEX8nNazoRtL7VzQ7BzxEKSzmHjy0TzYs10EDZ0Lm?=
 =?us-ascii?Q?K9Tpl9btAg034sefo2uwd0zD3rdoGEaTctpW+9RdbRWQtIwPCpi2Mx1nusrv?=
 =?us-ascii?Q?0eJN8NsJNMYiBETJGRIIEOSq9Mr0gld/3hRVi5fAtSOUzWrh4GrMf54Tj7qM?=
 =?us-ascii?Q?7PDDBZA/KerV/egSZUBMUiPGKzaCnnhfNLRCGxhs2sHjaUgIDYeHLFxCO4aP?=
 =?us-ascii?Q?+BDhkV30FYnlUtY6i47ilb2l0K8UcjqigZEvTa9Ym5bYnUvcdsFSCZk4yT/B?=
 =?us-ascii?Q?kuv8fsPrGSgMvqAponHBCUJpqdDTWqDFaxB1A6bzk2Nq0ciTzcBvTzph/A2C?=
 =?us-ascii?Q?GfBkK8RQUoilNk4x2auAbAKut5WN0HQCodDcCXc+tHg4rv8LMtySWD6+ae4s?=
 =?us-ascii?Q?dWzPvA2b9P8qvaLKI6FqanfsFsJmC9n8wQ9JIzePKxYDzL0Dp9v425PvRjku?=
 =?us-ascii?Q?3XXGAyfXXy3a8RftAl4aMrWXMUTrdpyRGlQMFlvQMyeYJl0T+XMlviM5LrO5?=
 =?us-ascii?Q?PKTHIgfF8hjEldi0A62yHtSPLfPOIglxiWE1lkPAVdpYi69sGKCYOu0zKXNj?=
 =?us-ascii?Q?p7n17PVa1ZS+akwsEKgfwq9jQ5zrLLQgtrKHdIkxCLF8TukplNv7MNo0Ci23?=
 =?us-ascii?Q?cIxR/fLRn+BMpgN+z7YbcY7rmID8euYj9NXWAuWdg3MaPIGQ9wzRun4Bs3Ya?=
 =?us-ascii?Q?s6fE4dXckFLdDtAqYppaX0ez04TVPXstSgCRbijuzMqw7zwEKpMeEZp95544?=
 =?us-ascii?Q?ejRin53TxBEQBSkFIpvadd/kkX+hiNY9qCOAnMFzyXTt5l+HZLOHHN3ngbJo?=
 =?us-ascii?Q?Lvhu+aJ8/94fATGI4m6dymAnL4QUaNNr8q3er3mUp2NswHJ1IM2XYEKOFchh?=
 =?us-ascii?Q?a2PsmfY32lTvH9VT3WluigRUPMJJXOOOcMdxM/+CX1HiAVNw7gJrZi0CduLb?=
 =?us-ascii?Q?NVhSL+LRMj9jCbig0rP1JhqJpmUQc+JL56BP7S0TWpkBkH+X4p8v?=
X-Exchange-RoutingPolicyChecked: 
	jStM1aH5cAbxO5mvYPvw+FN0k1Qdg2mXMAPza/TgY8vz2MHYL/3+DX5sLazB+b9IsBRmDqekKvGqaA/CmR8azgD9jepk+4ATBI4IzAte5j9Wi4tNwPNtJNi1PQTZ73K2eT3yd2/RtcN9w77CVQHaZLp9UNosbx5qrEAajlYW8u6D0NAHVlad4AV4zQlHyorCgaoGfn5mnqwbFJlSLs2E82kg3oX+W0IcsJuWJ0sUORvXP42sDrdmFO3Se+zxY2OMRpL9enqSdBZCp+iA7Xg/EBaMEAnqNP1yYzYpMwRAuP2qVRTPKZy30eeg8RtII41IxVQkOQtbj7wAikWniF1llw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de88bebd-a4f3-4e67-ee47-08def11632be
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 04:17:57.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dvxw468CLdDswVDvp79LwXuqxCgwQsRiNvR5zqjQKmJxA1tFPG8TkDegTTW8g4sLBgM1mPr/ZlvRiBvlhAx8zZLyKnH0e/WgVBE2lnsArpoH6o8YlmZiRR63ubQ3Mb0T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
X-Authority-Analysis: v=2.4 cv=cYTiaHDM c=1 sm=1 tr=0 ts=6a701678 cx=c_pps
 a=GLOgxCHNDJEaGAThK2D1wA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=UkVybHAxW8VqRsf2u68A:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfXy3fEP3mHe4Ds
 foNmo+xsrYVhKXhJDDykdfYToNOy7UB2cujyrtJxwJNt/rmKqKhr0BD1j/QPzLISQs69sdTqbEv
 KrIDJaQ0AhYK7VxikcgO2BOVqBR6pSy5F5KXzjudhqqtf2CqbFm+rBjC1EuLGimfOciHbcO6uwq
 djRsT5ddShLPnPA9tTC7erm9Xk522MPO8BeUWRXVhU3BULZglkE8C36+O73XsD+SlyqfKTdhMti
 1ST3GPgfM9ebssbAucO5bqsDf5eWDlacm7x37UFgSG74I5yok/5v6NQ9kVctz2glXDmJhDWivJA
 IDyDTT6GyFMekrC3vi6mlfb/Vn8kxcDzuq3XzNCbsG9IIb4kHsdcWWKa/tTdmYdflBIs0auF13K
 94Y5s/DNPDTdZbnqgutM4rucDUZfZZgEvYIuX9Snb47HRTGr2nOiM8J1HTucrnpVj+f4+i7aipV
 ad0R1oC7j1jq8h4jxUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAzNCBTYWx0ZWRfX6MkYAhFORlzY
 +qKlsc0TC5cdUfIA8Vgjk2Lj6XFKQciqKGyxB5VmIxcwqOADF4tTqWSe+7hA7QyG1c9IXwLerEn
 o8HagrhoPERPpIpwKrFHTw1EwHk77GD4VGTx1rkWSXLKpZ6rujar
X-Proofpoint-ORIG-GUID: e_fPbqDBxtcr1TyQAGVPjt7trV8vWy7K
X-Proofpoint-GUID: e_fPbqDBxtcr1TyQAGVPjt7trV8vWy7K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 04:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242595

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

v7 changes:
- Add intermittent failures seen in AB to exclude list.

v6 changes:
- Removed the workaround for the llvm-config to fix Rust build failure
  as it is no longer required.
  https://git.openembedded.org/openembedded-core/commit/?id=8aace29b692a8f3902a675fb4c022c223ba49531
- Removed CLANG_ENABLE_TESTSUITE = "1" from the meta-selftest layer,
  as it caused the check-layer script to fail. Test suite enabling is
  now handled directly within the test suite script.
- x86-32 bit testing for llvm-module is no longer broken.

v5 changes:
- Fix intermittent failure seen for arm64.

v4 changes:
- Fix intermittent failures.

v3 changes:
- llvm_sysroot_preprocess_testsuite function needs be added to
  llvm:class-target not llvm:class-nativesdk.

v2 changes:
- Enable required CMake flags only when running the testsuite.
- Ensure default build time and package sizes remain unaffected.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
          when CLANG_ENABLE_TESTSUITE is set to "1".
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list

Testing:
1. The test suite has been successfully validated on x86-64, x86, arm64,
   riscv64 and arm32 for all Clang, LLD & LLVM components.
2. Clang, LLVM & LLD all together ~80K tests are there and we currently
   ~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstate
enabled.

Default(without changes):
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
+-----------+------------+------------+------------+----------------+

With the testsuite changes applied:
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
+-----------+------------+------------+------------+----------------+

Comparison:
The additional overhead is minimal and primarily due to enabling
test-related build configurations.
+-----------+-------------+------------------+------------------+
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
+-----------+-------------+------------------+------------------+

Impact on package size and Fix:
The testsuite changes has a negative impact on certain package sizes,
as below:
+---------------------+----------+----------+-----------+------------+
| Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
+=====================+==========+==========+===========+============+
| clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
| clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
| clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
| llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
| llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
| llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
| llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
| llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
+---------------------+----------+----------+-----------+------------+

FIX:
All testsuite-related changes are now gated by the CLANG_ENABLE_TESTSUITE
variable (default "0"), ensuring:
- Test-specific CMake flags are applied only during test execution.
- Standard builds remain fully unaffected in both build time and package size.

Deepesh Varatharajan (3):
  clang-tools-extra: disable tests
  clang: Enable cmake flags for llvm, clang, lld tests
  oeqa/selftest/clang: Add oe-selftests for Clang/LLVM/LLD test suites

 meta/lib/oeqa/selftest/cases/clang.py         | 332 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 ++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 6 files changed, 437 insertions(+), 1 deletion(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


