Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF60DC5B560
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23015.1786337588554905745
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rjWqRvui;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4MfDK755820
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=; b=
	rjWqRvuiP/cTzO9+EAfllAoFJTosV3a7eEgK9Yh9X6Frc/5fDK4+9Z0ZtXHgn2sK
	fpC/qaZaIkCyupy8/GyoUCNPwvprpqQJ/qaE7WVLmDybX2bknkWCHHN7edMpClhz
	rrWN20uU3En/aiKrXy2TlAbT+Acr2b5G0XDzp4/8MkOdGKlYJ4Jv1hc+TyWxedZU
	9eUtr8ChQOin3Rfy7jisZ6+qeksUJ2LbduWUB7bLXbBNuay4JoSfn/VtILKbsM3/
	uc6YKYfsY8XiRsWMr3E2UvPH0wdJO44qD4mh7W/cuIUH6biOeYYo1cT7KBwqc2SD
	2Gz8QXJ0cS2+OdyuFuQLbw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue81s4j-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 04:53:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaHGxQvyTRzslDkksi4SkxuBhikU3QhyuNkj/0Yi0Mt/DG+PZvN2WD11r/0D3+c0Zrgu1GS1U0LpxfeNdqE/SqYtnUhol+lrtZTszAgry59dmyah452pTYqhIeK+ycZcbSn8yFX7B32DVXX+Lx8+YMYR4wdPLG6YBnElpokEGGUXmZdfRUXzLwTAHVE513bGVSfacli6+rXVS9rqJbTL7TGJH1H3ZaijdDvUu7wG3wLRHtJB4DQIn0UGcOtey8/D7Mt7nRSI0sImyEP3jHEDSutUyxdxlrk3ewIS4MQezwNVqaxVL9fB9JZ6tslzwlvKm2coJORU39GeZFI/+CNKAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMSnjZ0Om9lyxUFPVbIQJjkiscHUQYRXHfWjUy1dvfU=;
 b=U+Sk6HGtWkLnTG1nDZjQAO1fPmq7aPgsaqsiDnQJveIgFQkx0koJtp1w94ZSuDwcG4wWP1F7GSQGyssPThXzYi61OZ18QKB1vSY12n8tzT7XtNImzQhPyvgBfiHhKj25Fohbel46tImRvteEuaBDCOHCwIg/WgLnNHs/krfFA3rS4oewIV0nW07UGSidpMxPXcMvD/0sR1/Bx7y/PqWG0XXI8vlvw7S2vh8wiOEkKR3lQDnw+ShRlSDZ6b9Qvy5KBB1p3AtIHlSPZsi8KyuqnKiQiUhXPbN+7emmUEPP91jIXM4U5qXqMwg6biGkuzIC6lxXBNmrO2QeG6Za/M2yhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:04 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:04 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 02/10] package_rpm.bbclass: Define _lib and _libdir for rpmbuild
Date: Sun,  9 Aug 2026 21:52:42 -0700
Message-ID: <20260810045250.3903576-3-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c63c005-4e0f-436e-f25c-08def69b4350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	bEV2/fXc+fxLtKsI9ECJ00Zgew6zmHS3Io6IRh6cT7H7CuNOcNVrNL+l6GSlHHBPZOHGPjxMZWV5oQixtPCTyXn3LDN1j4ioHCK/Y0B8DHcSqNr/6/LCbXfeJmZpVM0GwBzbApYedflnxyBpp8iXlghR83kGUnRZrb6FbZz99RJsG3bI633ZiXdAoP9i+F/Z9oNbCGLgnOW/J8GJ9kaM+QzlC9zyTwZSRWvhIuvGPo3fYJqg6kbzIc01n8h7HXAUtIADL5yEXhSnL4xtIgxCRfch/NLlhipHiuLjXmdquzUJZcbFDaA9j9xiB3FoUm6G9zikhHzWGKhDWiJ62gWksjPHZAA1FN7tGUL6UMZCAvN5648op66ZE1EivI/b4/wFfz9e7+bsgw3z3R7M5LgTUo0ki6V6ncg6ab+Is48pDxeD+qN3i7vwxPfBh8fbFgi922IKYlu5DI4Ksy6SHUr877XA7Yo0HJXi8vXsw7RdHfZywccSn8tg1BsukaB6mEX7hz8/UGEz/AqoU3zk3VMgZkD+acyAR9ynXpWSruSTdfqVFoyXF2gbk2Nsav5zzlw+03IAUVJKQBRT5L95/HmJvrqN/bF0mEuPSrhQXyRzc4L0b/dDUoSuLiTla/ehRgccgEpXG/8KtGsCZgWIfQK0YpfxdDqQVTldr72O5FSthZnh7c4tap6EupmBdm/OSyoKHPgU/UBobjUeac8wWnTI+rSZB4lxShD/Ab22e34X6QA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ddtZhon5MBtlb4lXjLTeT8UPociDEKQ6zDnQV7IySXpwfjBzqjDUOMSbbmpp?=
 =?us-ascii?Q?E3CcLVDVPdQJVWaztfmnSbVTdu0J1iID0si0TZIlD35nMJ6llotI8HEj2od2?=
 =?us-ascii?Q?y1upIgi2SFYScW4zE+dAJ+SJlu354LtXHczztIy3nGmgADCrkkW9LPRsPJra?=
 =?us-ascii?Q?NTIt7rI73SKv/G6ehYr2iCTY5lYSwaqWFUcRvlq25DeG1New/Rwk4rUYF56T?=
 =?us-ascii?Q?lT3LyIWcGpQ+aOz9o1dftDbQfQs9hXoSueOJKKlYpvPrMZr/nvmx5SUp2ErK?=
 =?us-ascii?Q?TfV8uOTcRsLSJjjirdf58c/dt+uEWXU2UjbUkXBi+dm+TRb6UdOXrYVc7J2m?=
 =?us-ascii?Q?ZtPmAv6r7AZEcvf1m02EWyCbNBcJ/elCTF/tm8BEvkxSvLGHcBpSQy5pDW1Q?=
 =?us-ascii?Q?SDTLID1AwdQ2sb0yjWcEI3TIBulIz9NEQ4uaMm34yvZES5hPJbmtvKZgw0Ow?=
 =?us-ascii?Q?sSkDN/OWNfAViXwhE73O1k7xzjNhxkoy4V3g3QXJJWrmhlfFP7HQIe2Q1MBy?=
 =?us-ascii?Q?BCMwkotNBI+8qZjJzCTjOvtVAvtU23mfaRpLCrA55cOrdAeVvs0UrQKBBm/X?=
 =?us-ascii?Q?OuWDKgzP5c3Tf0TjzzOwlMSjnh6Vcc7c177ubERmDwOKsBNAmOvU1lNVO34M?=
 =?us-ascii?Q?0H5p0pvWlebeICq8Rxnl7fJXlxwLwU2gXNhsEXbOgjutd6vvLonnSVmXq4vg?=
 =?us-ascii?Q?WqcoXsRHnkiQTa+yI+VcuQ/hDdqGyf9LTSs9NkCB1LVEsx3rJbSClWjcDE/6?=
 =?us-ascii?Q?0epoaXOPNWBhLP+s/FkYBV2dV2a4qGPfy1vm4YqnkZxpJDFHIiRWkKYBQuYy?=
 =?us-ascii?Q?As4+mHnUp/nR6MtIpRFM6yk9UBYbPUweHRz/z+vm+bBIHqfimrHk+GMW0hBz?=
 =?us-ascii?Q?s5yYDeYoffkJl0S8AsMWQllygnZmfJnezApf3zRVbMS2TpEHzziqL4uUbLOy?=
 =?us-ascii?Q?rHadrSeyRRV6L+xWotQ2NtfSD5b+L4MZ5n+PQuAtmmX3LReNwUkjw+UxFOyr?=
 =?us-ascii?Q?nISC7PW/5yNFZ2OWjb0TQAtEdlL1OEq2Doh6AiWI8FBZvTLzyG0859WtYd5Z?=
 =?us-ascii?Q?utsC5C3ES8YEAetpANMWvlfUeW6Y2nyJoqrRAqPnEUqMSDPbtT/7tJss4jeo?=
 =?us-ascii?Q?sVDrmmC+Ejrn1DdVKOTCCdWc8DY4RLYeqcqmDaFLGM9pBCMbkJiK16lrhDaf?=
 =?us-ascii?Q?jwi3ov0yWloCLuW2s3qFqhmIot3iFntiE/KRylMMFNlE6ttHgIcjc+ot/2cX?=
 =?us-ascii?Q?sJF37KURZ+H+xYS5hSmSFwB1Zq6bEhJsakniiDw8ktrkDxrCjtCDX92Sz+wE?=
 =?us-ascii?Q?+vxC2LiWAvSNYDl38H92cQ1Tb/q9LqUlFVMVIYhdq3gX0PKXUA+vN9rYPQot?=
 =?us-ascii?Q?iuWLFWUrGkb0zrUJYhGTY2b5C6csptFD3PmvBaI6wO+8dZq2ljtVxxR4Lzog?=
 =?us-ascii?Q?fkqvMvAEpSZSZP3iBjRACB9X4vBAwJ/XHZbADJ7HDw1qkaGwomGSyryx6cr2?=
 =?us-ascii?Q?S8jTdHDc1XqSbd3VsxP4rwcVrt3mDd+xPOkz5XQOaxrWlQExQkQ5s+j0A9YT?=
 =?us-ascii?Q?BJpikzNigyEVS3w17ShFc9jnS6PD9AO0Nwx1rVLIeeoDWqpNVJvvdpOz4f8T?=
 =?us-ascii?Q?v+D5CzXTGQe06X5HVFNJlejxErbv872feh7VL5h0h/AIwZ8HURWXejKVq7sl?=
 =?us-ascii?Q?38w55atki9KpsJY4+SXwiGFeJW9xllBcAdpVwqk+gcxiHfK5fEiMSSzgGJXe?=
 =?us-ascii?Q?Soqs6GaXn1IpUXTTzRpwJORof7GnokY=3D?=
X-Exchange-RoutingPolicyChecked: 
	RHEUy+8HZmZfyhCG5NP+JtdjZ+huEYvatMJKpHas11AMfZ9yhZlkG0FiPIuAVFNaZtWV2HMxjiOUJB3Bi5NE7RjkEnlWUsQxYWGf3/iwkZxhEBetDLxxTL6nDR/m4GiP9zrJVq6hAW0BYM199gqUMHYhLGurCfrRv6SbvrotLkTICos5A16rkaM+5U9uSxQq82q8VmIZXeSVAkZaJVr/CyvpGV0zRFO+f2JDkU1TScSJWN6p9mxLXYLuVTdUfZoGzJkOQUDDS5l/ljOri71pLIDSqsqcXrzICqsCEluLWVB2l/zv3IStUjhmqfYvHnzs6pBdTyRLBz7zFpjDaHzIdg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c63c005-4e0f-436e-f25c-08def69b4350
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:04.4134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEKLs/SZS7E+yyZ/xhFnakO1TFzv8InBv47CvpS0w1a8kA4HT9V+dgIvoXmWrwq6AwjEZHK4M9UEUb4iAQPkbE7rUFBtNGsWKBjZIY7UwQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a795933 cx=c_pps
 a=Eb813/LJkoRL1pr8t+D1ZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=uhQZ5Q_QBcnTBNJc4ooA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX1pBoCgL2Vpco
 Ah7X6YEYjXIUA0sNGAm/+XEYvBXIgMjF8zPLccVMDkQx8kH4fItClzmggC+YlvbtTPrGvUm/OnN
 PQUEqA6EbF48G3MHhKZ1xTTBVChFXtSTKGnafHDoXxCjmlkbXbwY
X-Proofpoint-GUID: NzQhI8EJRZuG75PYkUpyM5FPKGThDINj
X-Proofpoint-ORIG-GUID: jNe4X59xzFsGBMIG2ls6c9HoH1aOO0mS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX5rNXmzQV9t8L
 udjr2lykRr3TnToZ1Qj5gBQ4dqRWj3TZnG5YofY8dtgJAU5kjhHft7Qr1O6WH1dROahhKbv0BKG
 MDN2/+xSYRZgyD6SivMFo0pzPnm1Ps8bPLwQIje34YPqFT78x0AciWOYoFCpprBfD+hENOZoaET
 fAu8uFUnnQCkLVP3mDVrC9QlhgFdmXdMkSKlzsBX5Lgy/57jlmn6zvrrjnPkk0sxns7/lHWqTfY
 zOR8I8/lwliwH6aqRgjBijoyD7dMGgkgXbes5DhqtuIaLHL+vam65mkfqrSmtjnDKkmhaEGKvNl
 NWuGzTxCTKnXbjmlzE70971oLpLZcxN+fMLTzV0ur5+AAp/LiZz+zff8CdzFAA5CIMo4W5EA/sq
 bmgOmnToBplMb/ojoBDjCbYC9RUvPlXFqH7o8Rg6yCnSQK8xnwYGkh6W4cJaJCtSkiYhoJovil7
 9B+S6rKA8d/5LJYvxkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243094

The rpmbuild is from rpm-native, the lib and _libdir may be
incorrect for target, for example:

* rpm 4.20.1:
  No pkg-config files can be found for qemux86-64 or qemuarm64

* rpm 6.0.2:
  - qemux86-64: The _lib is lib64, this is incorrect when multilib is not
                enabled, and _libdir is RECIPE_SYSROOT_NATIVE/usr/lib,this
                makes the pkg-config files can't be matched.

  - qemuarm64/qemux86: The _lib is lib64, this is incorrect, but _libdir is
               correct (/usr/lib), so the pkg-config files can be found,
               this also looks wild.

The rpmbuild is like cross build, define the values when run it can fix the
problems for rpm 6.0.2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index f286d3a0e2..9af4cbdd94 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -585,6 +585,8 @@ python do_package_rpm () {
     cmd = rpmbuild
     cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
+    cmd = cmd + " --define '_lib ${BASELIB}'"
+    cmd = cmd + " --define '_libdir ${libdir}'"
     cmd = cmd + " --define '_builddir " + d.getVar('B') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
     cmd = cmd + " --define '_binaries_in_noarch_packages_terminate_build 0'"

