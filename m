Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A700CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:42:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8098.1758703371391241248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:42:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LcQCQ1Qg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1362298a6f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O6aGtP973595
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 01:42:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=uHrBXTXgbbCJ0LsfDkei
	GjtxWdfq1vKX5NWlaVNhGN4=; b=LcQCQ1QgwtZ+off72wRcOHdgll/zQ2aD2HlF
	lcNzX4gyxomYIXfaUzT9XjFFhhZdcXmwdL0WPEbklYu9Le6ONFZKMQcw83kItt6t
	lMeQzCzdlBHjI0Q2MV18sycWFcijBiCQYdWPF6ncsFUYxQXlDwbtemfyUc5IWKpa
	GyGo1puLiKIyGuz+GVJ0FsL1Oc0sf694WZUyV/T03SCncv+Oreis5dqNvui2JKUT
	ffi6982TBQMPrz9sJxCesZ6fDTkwzPjqXelE7uBifRH6vG7WDKwQwAlCWZOTGrB5
	4rq9Dsik0YAJbT3fvcvaX4D1dB/ViuT89ZswJwf3G5NMI3QFQg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010003.outbound.protection.outlook.com [52.101.201.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2vdd1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 01:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wmrNLZCI0cb7fXAP/2d7YmGF8P0nXgtfmQ3B9GLWUga+ocH1PqjKRdf+2imc47dkq1yJWAyIzqx3VodK+dIi+MhzgdMtUrD5+eRSqZvMX6NCFYBCr+ZbncBNWQYLuOC5WeO07pVVStqIRzxnWt2gYkxyiXQRwpFhrv5YD0d6cmsNC7O3i2yiGLkcEPpew8tQIP7wZ3/HmLZ7wBXqcxw47wqT+/KBpDnH77l7UYKzN4XdUMkXPR630qoIbCoBrO5FYNJNPYA3onJZB+ZWAdFYwddYXbFWdyEVDEkVdgMLrsMInmEHIqmWykC1Ne6aW4et+FXvfUVyCw59YPfwYx4gFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHrBXTXgbbCJ0LsfDkeiGjtxWdfq1vKX5NWlaVNhGN4=;
 b=M53/MrZUsCjO1gBtQXxMHjgJXMSdqcGnOedS7E4MwZ8zFFY89VgYc1pWMBAd1ZWGmdkakd14mKzikezxytwtcfrRI9Fc+1o6KVL3goasWM3kCSspprQfjraxlVTSfeD9pQv51ixoQlcCrvkBvHBuH0s+SBTQTOWkcvTRiZMHAslIFBgt0ld3nkTRhWCRsV2Oc6QsufusHgSy2FZ1k7QgJpX8PZSLhpAYrgTQFw72p4Ndx5rR0l98EvMRHgJu4PKMW7p/qmwYxXA+cNDQFxcIVodNOjaol9TOSiXeuz/Geix4cQ8J9J2br3ujGUgHuoS8wSk2mlMhT5J0qkd9z5F6mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB6993.namprd11.prod.outlook.com (2603:10b6:806:2ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 08:42:48 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9137.016; Wed, 24 Sep 2025
 08:42:48 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_manager/oe-pkgdata-util: fix complementary package installation
Date: Wed, 24 Sep 2025 16:42:33 +0800
Message-Id: <20250924084233.3429501-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0018.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 455d7011-2ec2-4034-d9bb-08ddfb4656f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7GKTMVQCPl0FfHcmntutLUKu64+BdqujdlQdMil4zbDA3kIOnqNNxRiMRTvC?=
 =?us-ascii?Q?w9R1eN7ygkLOsGliLzswJ/iqxM0SRpKwK2Yx5xAGkgAl8u01ZiBOuhteaES4?=
 =?us-ascii?Q?bzJRwmdrX1lq1hg2T5MpiOTp3im/zQJcl7p62vZK6jsrmVjlEBnqgiyxVYIN?=
 =?us-ascii?Q?Az7M1ZjbEQcbLEQLsHsk3LAL6brsKip96MQ/OyJxMEJVsyyd4DKQ8i1BlHOY?=
 =?us-ascii?Q?GkF60KqUXtF6f1R3vvSp986iP2vkHTV2c+Ak+uvGKdj1SQbC64ROGmYvz9Vd?=
 =?us-ascii?Q?VoYV1pmLRq87gfB1k0DSqX46M8WWM2gzavYI4MqgEv2wi6wLrMDiOc5Kixm9?=
 =?us-ascii?Q?5FlN6JqO9jCzLvtsYAxe9HYmF/oqRQvHT10TyjsuWkQCfjIsGD6ZgzcTgCWC?=
 =?us-ascii?Q?WsdksJ8rqpMGEb0tFAB6suhBSZZhIg1iySjqlDzj9iQDk/yZ+lOgqDR/PCBz?=
 =?us-ascii?Q?p+bZreMh12PhAM+2uCSIVwEDSQzq50CCYyKfkUSu8neVTyTMoS46/uFKhmq6?=
 =?us-ascii?Q?PkcTaCNUGJTS6gGbwlrpif00agfaykyONq3jU5wvAr1fV5CszibkSm/a3/JW?=
 =?us-ascii?Q?SwDXf2sPkm/4K3I8Cmbb7/qClSSKegNaFStDo+sqpWoh4GoetsDqYe748Saz?=
 =?us-ascii?Q?wwL7mAtxT1Kh4hJFbu19fgkfiSUfqcEfcAT/JMh1V1I+oeGJD85Zs16MprUs?=
 =?us-ascii?Q?XElBwjjYEmAWMAuGFDg6Vc7E9l76M/OjsJ0P0BE910CfJqcFudB2yLT7Co0t?=
 =?us-ascii?Q?G8iiZ6b8JFCcvZ10EJGvDpEiCEfVIoNHUECS4gSLZhZ0U9sQqCCR0KfJBgq6?=
 =?us-ascii?Q?huH2jFwmWz46txX6VnIFcCTpAtFvy47qA2gNmrsgT8sCbpXcUW8y2qKymOim?=
 =?us-ascii?Q?7+kZ6+J9XUZZMMmycgodaGmLWaxs8hj8KMMy6c2aqDZnuA1eNou3zBBgej0G?=
 =?us-ascii?Q?1uk5ARF1P1UWgdx+RSq8Qpe2+in1dYGFJ/1NK48sfDJ9VHjOoBzH3R0Vyj98?=
 =?us-ascii?Q?IrHerFz9cWXaTgW+tMwrh2Tk0Zg4QmtvXKbRL46W3aRlc7tpgBQpmrKM0HHI?=
 =?us-ascii?Q?592n0B+Lep8zWCs9O55IzhWCqLbwxEuYpoxIq5Wde5JAg0E/fYHLVYmaFIR+?=
 =?us-ascii?Q?aHlH8Hox5QydG0dxUjokcT7XS0O3Tq9WO6XC4QR2NuQ+uRNsYf60+uG3RK89?=
 =?us-ascii?Q?rqK3me+wNFGg+yvEk3sFW9277vbarMPHSwKY0ZlE/UGGyOsVzRK5IUtKBR53?=
 =?us-ascii?Q?T37UT09Rp4TG7vmD5pzPU+F5gBblxOHPf6LQitK9fJML/vha2mZbdpwIERH4?=
 =?us-ascii?Q?168e8oO3wCsW6B9xKJx9F1WIIrWYOL7npRcgxYoAgrmjKA9cYWffDxZEr/A/?=
 =?us-ascii?Q?027sE+SydyKGtKNa9kiV41YxQky6fGs75nmwVHW0dpeanYlAm0hO+NhXkdki?=
 =?us-ascii?Q?3n3v/FaTgGa51XNWfUdQk04ZHWriUT8t?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FqwuRv5Ltw6kvTy7VUFvkIRIG3hT5VESvuzktRi2as9M6jwnIkoOwZCID2Zg?=
 =?us-ascii?Q?c3+cl8eOlF2/ddTSDi+vSjDmgYLxFcDLJfVnzhuEz0/EVgj4qGH59Hp36rFK?=
 =?us-ascii?Q?J1BRYCeCpHClo+Zw6UeMguSDMdiO3O7QITjaugwuCR2ekCuWjPnOEUhRqNqZ?=
 =?us-ascii?Q?905LMyZmed/M0T17/vHjKCoeTb2q9SxKkO3JGNfV0IhyzM/aBOftBoeBJTd0?=
 =?us-ascii?Q?EnloNj20FQGxddaEXOwZCSmvF+1F6FY2ChYUq1QUfQjHtu9z2JNr+mpmL8lZ?=
 =?us-ascii?Q?ePqaR4G2npiTg2vnZ+5jnXw5tmB8Z+FhBRQTtq/RKwe9cHkkyKkxLh9t3Xrf?=
 =?us-ascii?Q?jejddca+94jSLY6qiwsAwR2iOU3wVIqKVTSD10+BCz6CacaXYvidparkCCxq?=
 =?us-ascii?Q?vcLRfqt8rjOCR8r6/ZYahBbG18RIcHryb+8gKyY2CWVnEAEXKnUhlhAdYkNv?=
 =?us-ascii?Q?jV3lvd+oxI3X0JXoyGoWaLxZL5Y/Ucoq6Ey6CNMSE9S73wL8RAxnhd1MXtLM?=
 =?us-ascii?Q?EVGYV4teMhPlFf0xGplGB407hhp0K7BP4Z4DQ4arfWJCJ2MUTZJxLMy3jsMI?=
 =?us-ascii?Q?I2VEuwameuph5pprcUq8CqlxQQjuJcdSd5gFz38NVUcTiB7IUyHM6mJuIU5U?=
 =?us-ascii?Q?0L7KVoQoQiN//USXq6v2HRYCxv9rn8P6aZtG/SuYyXMnJ/no3bFmtlZJVpEf?=
 =?us-ascii?Q?MsBAvuWx5bk9w8vxCrlv8pBvojsf89GLz8sLj/Gz9LxmFmjK7KrfP8ZAzj5b?=
 =?us-ascii?Q?ZtQeCfnXUffsKVfaucT944CzdFRSfeT2EeyLsCfUAVZKsHP1rEmjV0itHnrm?=
 =?us-ascii?Q?kIwqLIBLNyA14BYvL99w0J34EkpsdK5BEfOm27ThnWzeeNPAVrlnT15Eyfeq?=
 =?us-ascii?Q?S1V5TBsOwn6kaxWTjFBn6kDifoIqby30DC641rpOFbMRl5hl3zVr1ys51yKe?=
 =?us-ascii?Q?i/oSn7zFras7gwJSJ/fw+QCwF1hMSen63v0KTgE6darI0VtJJTOc4kMiIrRE?=
 =?us-ascii?Q?P3YBwLpHzZHuBh2cCoOoVpCk8Xh/nX6cgpkDTrTe5l1ZDWHT7qP6QFVAGLfZ?=
 =?us-ascii?Q?if0tQpSuwCDCnTDeSkmjknoH+Kh0VwLHcALf0uwgKvGA8j+aRwm+GNCoER6N?=
 =?us-ascii?Q?tFlWbp1C+JEZjlABjGz4eLkSI1oO5avAMHE+oXMwtQl+B/S+ymc3rIk+sMbK?=
 =?us-ascii?Q?FXyTiR7rL0DVKSN3ruQ13IQKjujAMYC10EaZav53AAobXIkntakdNHMPXx2Z?=
 =?us-ascii?Q?uU90TqAhHeDYfeuLDaro/aUlKzUYf2namQbAf/Kx1j51PcTyz5v6cQcUyZbM?=
 =?us-ascii?Q?IkqHmNapXEFtunfNcGZKPDIY07xdE25IqMDyhrsHDTbqVc9s2oVGV2XktAIq?=
 =?us-ascii?Q?K9VeAffNcPphT0DQTI8lCr0hog49NF3V0o6EHD/pPsufCbtXZ8CBDqtJQweh?=
 =?us-ascii?Q?wMVjmA0yv4b6Lobb+Fwe/OqxTQnO5GIF9ojbahOiKf7ngwIFNmPZPb+g+VQQ?=
 =?us-ascii?Q?kcNdMU1qNWMVIn8CimxGhsPvlDsxXdSOvXLpq0/3AK2ettxNupNLr4X/A7WH?=
 =?us-ascii?Q?34LLUYRYT8kSDzUJZyBL+hGpK6U1eUURkc+WU8Q2?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 455d7011-2ec2-4034-d9bb-08ddfb4656f6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 08:42:48.4140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXVWFoznbV5ZBjdjeq6WDurVquMme3fKTSl+GvpbPGcCtrzoR35VfAjlYt5EFSPnJ9aIo4DcfeD+OQoWCAfuEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6993
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA3MyBTYWx0ZWRfX/ZW3xjULRJYM
 +tqCAn4xzneuP+zp7udUDBjrCbTGhape8/fOiVAdczCac/KvbG5R7wAjLGlATBMBU1iq2V84+Ng
 au+c89rZDo6nEhfhrY+Fhjanx5wAujzEWv6CasR6sLl799XklvIOSAn5pir7boOdn1neFd0huh6
 KWiUfEZ5IpGMa+o7MHDwQrt/UzuUHhH17WcsXfGzKDeBemPt0x48aNoRsMmBp799djbnbDlcOqQ
 lTNcPBX7rDt2nDlWBuuMpX+XZ2GCTYkk1iDltn6QuWkjnSf9YZptcPNE6YZ3H/mDEC0udvzEsZ3
 hHXbvhtVZy2N88kbFTqSue1VHwxOHpuCQNqt/3asLSVPRSRtfvLG6ORwhyMiw4=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d3af0a cx=c_pps
 a=LQDsqUhXq6x2TIKBD9Oruw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=1011AmDLJHh65kVMvewA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CKCxwfOr6jfnRCd4q2thTIzNVPNgqm8w
X-Proofpoint-ORIG-GUID: CKCxwfOr6jfnRCd4q2thTIzNVPNgqm8w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223955

From: Chen Qi <Qi.Chen@windriver.com>

We currently have a problem regarding complementary package installation,
that is, if 'oe-pkgdata-util glob' maps out packages that are not in
the oe-rootfs-repo, we will get error like below:

  No match for argument: lib32-glibc-locale-en-gb
  Error: Unable to find a match: lib32-glibc-locale-en-gb

Here are the steps to reproduce the issue:
1. Add the following lines to local.conf:
   require conf/multilib.conf
   MULTILIBS ?= "multilib:lib32"
   DEFAULTTUNE:virtclass-multilib-lib32 ?= "core2-32"
   IMAGE_INSTALL:append = " lib32-sysstat"
2. bitbake lib32-glibc-locale && bitbake core-image-full-cmdline

This problem appears because:
1) At do_rootfs time, we first contruct a repo with a filtering
   mechanism to ensure we don't pull in unneeded packages.[1]
2) oe-pkgdata-util uses the pkgdata without filtering.

In order to avoid any hardcoding that might grow in the future[2], we need
to give 'oe-pkgdata-util glob' some filtering ability.

So this patch does the following things:
1) Add a new option, '-a/--allpkgs', to 'oe-pkgdata-util glob'.
   This gives it a filtering mechanism. As it's an option, people who use
   'oe-pkgdata-util glob' command could use it as before.
2) Add to package_manager 'list_all' function implementations which
   list all available functions in our filtered repo.

[1] https://git.openembedded.org/openembedded-core/commit/?id=85e72e129362db896b0d368077033e4a2e373cf9
[2] https://lists.openembedded.org/g/openembedded-core/message/221449

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oe/package_manager/__init__.py     | 78 ++++++++++++---------
 meta/lib/oe/package_manager/deb/__init__.py | 26 +++++++
 meta/lib/oe/package_manager/ipk/__init__.py | 20 ++++++
 meta/lib/oe/package_manager/rpm/__init__.py |  8 +++
 scripts/oe-pkgdata-util                     | 14 ++++
 5 files changed, 111 insertions(+), 35 deletions(-)

diff --git a/meta/lib/oe/package_manager/__init__.py b/meta/lib/oe/package_manager/__init__.py
index 88bc5ab195..b9a4218939 100644
--- a/meta/lib/oe/package_manager/__init__.py
+++ b/meta/lib/oe/package_manager/__init__.py
@@ -32,7 +32,7 @@ def create_index(arg):
 
 def opkg_query(cmd_output):
     """
-    This method parse the output from the package managerand return
+    This method parse the output from the package manager and return
     a dictionary with the information of the packages. This is used
     when the packages are in deb or ipk format.
     """
@@ -369,40 +369,48 @@ class PackageManager(object, metaclass=ABCMeta):
         if globs:
             # we need to write the list of installed packages to a file because the
             # oe-pkgdata-util reads it from a file
-            with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
-                pkgs = self.list_installed()
-
-                provided_pkgs = set()
-                for pkg in pkgs.values():
-                    provided_pkgs |= set(pkg.get('provs', []))
-
-                output = oe.utils.format_pkg_list(pkgs, "arch")
-                installed_pkgs.write(output)
-                installed_pkgs.flush()
-
-                cmd = ["oe-pkgdata-util",
-                    "-p", self.d.getVar('PKGDATA_DIR'), "glob", installed_pkgs.name,
-                    globs]
-                exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
-                if exclude:
-                    cmd.extend(['--exclude=' + '|'.join(exclude.split())])
-                try:
-                    bb.note('Running %s' % cmd)
-                    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
-                    stdout, stderr = proc.communicate()
-                    if stderr: bb.note(stderr.decode("utf-8"))
-                    complementary_pkgs = stdout.decode("utf-8")
-                    complementary_pkgs = set(complementary_pkgs.split())
-                    skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
-                    install_pkgs = sorted(complementary_pkgs - provided_pkgs)
-                    bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
-                        ' '.join(install_pkgs),
-                        ' '.join(skip_pkgs)))
-                    self.install(install_pkgs, hard_depends_only=True)
-                except subprocess.CalledProcessError as e:
-                    bb.fatal("Could not compute complementary packages list. Command "
-                            "'%s' returned %d:\n%s" %
-                            (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+            with tempfile.NamedTemporaryFile(mode="w+", prefix="all-pkgs") as all_pkgs:
+                with tempfile.NamedTemporaryFile(mode="w+", prefix="installed-pkgs") as installed_pkgs:
+                    pkgs = self.list_installed()
+
+                    provided_pkgs = set()
+                    for pkg in pkgs.values():
+                        provided_pkgs |= set(pkg.get('provs', []))
+
+                    output = oe.utils.format_pkg_list(pkgs, "arch")
+                    installed_pkgs.write(output)
+                    installed_pkgs.flush()
+
+                    cmd = ["oe-pkgdata-util",
+                           "-p", self.d.getVar('PKGDATA_DIR'), "glob",
+                           installed_pkgs.name, globs]
+
+                    if hasattr(self, "list_all"):
+                        output_allpkg = self.list_all()
+                        all_pkgs.write(output_allpkg)
+                        all_pkgs.flush()
+                        cmd.extend(["--allpkgs=%s" % all_pkgs.name])
+
+                    exclude = self.d.getVar('PACKAGE_EXCLUDE_COMPLEMENTARY')
+                    if exclude:
+                        cmd.extend(['--exclude=' + '|'.join(exclude.split())])
+                    try:
+                        bb.note('Running %s' % cmd)
+                        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+                        stdout, stderr = proc.communicate()
+                        if stderr: bb.note(stderr.decode("utf-8"))
+                        complementary_pkgs = stdout.decode("utf-8")
+                        complementary_pkgs = set(complementary_pkgs.split())
+                        skip_pkgs = sorted(complementary_pkgs & provided_pkgs)
+                        install_pkgs = sorted(complementary_pkgs - provided_pkgs)
+                        bb.note("Installing complementary packages ... %s (skipped already provided packages %s)" % (
+                            ' '.join(install_pkgs),
+                            ' '.join(skip_pkgs)))
+                        self.install(install_pkgs, hard_depends_only=True)
+                    except subprocess.CalledProcessError as e:
+                        bb.fatal("Could not compute complementary packages list. Command "
+                                "'%s' returned %d:\n%s" %
+                                (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
 
         if self.d.getVar('IMAGE_LOCALES_ARCHIVE') == '1':
             target_arch = self.d.getVar('TARGET_ARCH')
diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
index eb48f3f982..0f74e1322f 100644
--- a/meta/lib/oe/package_manager/deb/__init__.py
+++ b/meta/lib/oe/package_manager/deb/__init__.py
@@ -112,6 +112,29 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
+    def list_all_pkgs(self, apt_conf_file=None):
+        if not apt_conf_file:
+            apt_conf_file = self.d.expand("${APTCONF_TARGET}/apt/apt.conf")
+        os.environ['APT_CONFIG'] = apt_conf_file
+
+        cmd = [bb.utils.which(os.getenv('PATH'), "apt"), "list"]
+
+        try:
+            cmd_output = subprocess.check_output(cmd, stderr=subprocess.STDOUT).strip().decode("utf-8")
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Cannot get the all packages list. Command '%s' "
+                     "returned %d:\n%s" % (' '.join(cmd), e.returncode, e.output.decode("utf-8")))
+
+        all_pkgs_lines = []
+        for line in cmd_output.splitlines():
+            line_parts = line.split()
+            # the valid lines takes the format of something like "findutils-locale-ga/unknown 4.10.0-r0 amd64"
+            if len(line_parts) != 3:
+                continue
+            line_parts[0] = line_parts[0].split('/')[0]
+            new_line = ' '.join(line_parts)
+            all_pkgs_lines.append(new_line)
+        return "\n".join(all_pkgs_lines)
 
 class DpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, archs, base_archs, apt_conf_dir=None, deb_repo_workdir="oe-rootfs-repo", filterbydependencies=True):
@@ -436,6 +459,9 @@ class DpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    def list_all(self):
+        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs(apt_conf_file=self.apt_conf_file)
+
     def package_info(self, pkg):
         """
         Returns a dictionary with the package info.
diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 4794f31f88..2f330ec4f0 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -90,6 +90,23 @@ class PMPkgsList(PkgsList):
 
         return opkg_query(cmd_output)
 
+    def list_all_pkgs(self, format=None):
+        cmd = "%s %s list" % (self.opkg_cmd, self.opkg_args)
+
+        # opkg returns success even when it printed some
+        # "Collected errors:" report to stderr. Mixing stderr into
+        # stdout then leads to random failures later on when
+        # parsing the output. To avoid this we need to collect both
+        # output streams separately and check for empty stderr.
+        p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
+        cmd_output, cmd_stderr = p.communicate()
+        cmd_output = cmd_output.decode("utf-8")
+        cmd_stderr = cmd_stderr.decode("utf-8")
+        if p.returncode or cmd_stderr:
+            bb.fatal("Cannot get all packages list. Command '%s' "
+                     "returned %d and stderr:\n%s" % (cmd, p.returncode, cmd_stderr))
+
+        return cmd_output
 
 class OpkgPM(OpkgDpkgPM):
     def __init__(self, d, target_rootfs, config_file, archs, task_name='target', ipk_repo_workdir="oe-rootfs-repo", filterbydependencies=True, prepare_index=True):
@@ -364,6 +381,9 @@ class OpkgPM(OpkgDpkgPM):
     def list_installed(self):
         return PMPkgsList(self.d, self.target_rootfs).list_pkgs()
 
+    def list_all(self):
+        return PMPkgsList(self.d, self.target_rootfs).list_all_pkgs()
+
     def dummy_install(self, pkgs):
         """
         The following function dummy installs pkgs and returns the log of output.
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/package_manager/rpm/__init__.py
index 20e6cb8744..a51057650a 100644
--- a/meta/lib/oe/package_manager/rpm/__init__.py
+++ b/meta/lib/oe/package_manager/rpm/__init__.py
@@ -275,6 +275,14 @@ class RpmPM(PackageManager):
                 elif os.path.isfile(source_dir):
                     shutil.copy2(source_dir, target_dir)
 
+    def list_all(self):
+        output = self._invoke_dnf(["repoquery", "--all", "--queryformat", "Packages: %{name} %{arch} %{version}"], print_output = False)
+        all_pkgs_lines = []
+        for line in output.splitlines():
+            if line.startswith("Packages: "):
+                all_pkgs_lines.append(line.replace("Packages: ", ""))
+        return "\n".join(all_pkgs_lines)
+
     def list_installed(self):
         output = self._invoke_dnf(["repoquery", "--installed", "--queryformat", "Package: %{name} %{arch} %{version} %{name}-%{version}-%{release}.%{arch}.rpm\nDependencies:\n%{requires}\nRecommendations:\n%{recommends}\nDependenciesEndHere:\n"],
                                   print_output = False)
diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index 44ae40549a..5b7cd768a4 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -51,6 +51,15 @@ def glob(args):
 
     skippedpkgs = set()
     mappedpkgs = set()
+    allpkgs = set()
+    if args.allpkgs:
+        with open(args.allpkgs, 'r') as f:
+            for line in f:
+                fields = line.rstrip().split()
+                if not fields:
+                    continue
+                else:
+                    allpkgs.add(fields[0])
     with open(args.pkglistfile, 'r') as f:
         for line in f:
             fields = line.rstrip().split()
@@ -136,6 +145,10 @@ def glob(args):
                         logger.debug("%s is not a valid package!" % (pkg))
                         break
 
+                if args.allpkgs:
+                    if mappedpkg not in allpkgs:
+                        continue
+
                 if mappedpkg:
                     logger.debug("%s (%s) -> %s" % (pkg, g, mappedpkg))
                     mappedpkgs.add(mappedpkg)
@@ -592,6 +605,7 @@ def main():
     parser_glob.add_argument('pkglistfile', help='File listing packages (one package name per line)')
     parser_glob.add_argument('glob', nargs="+", help='Glob expression for package names, e.g. *-dev')
     parser_glob.add_argument('-x', '--exclude', help='Exclude packages matching specified regex from the glob operation')
+    parser_glob.add_argument('-a', '--allpkgs', help='File listing all available packages (one package name per line)')
     parser_glob.set_defaults(func=glob)
 
 
-- 
2.34.1


