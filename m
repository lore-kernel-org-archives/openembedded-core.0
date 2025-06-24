Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDBFC77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 10:42:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5511.1750761734009279182
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 03:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=827047d704=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3GYFA028307
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:13 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mjp8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 03:42:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtwziHf/D8iS5J9gDcS3IPUltBaRNma2Fc2hlOIBhuIvtavOExsh/+Y17mcRgM5dty7zcznVaRHGFg6EG+OaAromtgtEKNuZu2olu/XiA5533ObdwMKx1p5Fn/mP0tvJkaQBUDX36lP8Bs0TtRhGNcDBZuu8INMRbSt88CYhmSZoW0nWLxqqG1iNe7bvqvk2lW/gb6kElw0xpZl4gLfWLF8Np8Oh6vOHNKXaWC2PXD3lyRAIKe9rIwI2eip6IS7b1ihSZhQkBCV6KS0ngGLO8ErpSy68HJeGBjZ6/DVktYF7EaBfFsYUrtMQaK95IpB+pEJqDdy9Jbt0YgwqFXMF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LISfKPeiG47u/k/phtKa/OogHdJAwa23bl/uvughOls=;
 b=CUpNrCebtJj7sGBXNVJrS92aKCLovqmCHaFMBTai1YK1/OBHWk93YL+hA4F7WUPygUaC40916Ff4zrlD0Bws1G6SqXepx3odaahij6aorCH9gA0vO40tFWTzOGe9j9hhfbqQop3gbEeU7PuGIe2AeKXdyS0g0PD/OlwHzmkvNaswrmGyJ2ntbpc19KTMo1sF8dxRzdUDacv6lzSZjpf8/NyTqUo55XZVR4jN/aeWeLb+DxN5W5nP70O6uL7WumZv22R17PKfEmBTawf2LQV1jnZ/aRpteh5QmpAlufMbuMNZRFlopcYOIJ7RIMJ7eZqZgemUCqfMH3dqV4kN5l0awQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS0PR11MB8083.namprd11.prod.outlook.com (2603:10b6:8:15e::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.30; Tue, 24 Jun 2025 10:42:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 10:42:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [RESEND][PATCH 0/8] fix runtime versions
Date: Tue, 24 Jun 2025 18:41:47 +0800
Message-Id: <20250624104155.559827-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0116.jpnprd01.prod.outlook.com
 (2603:1096:405:4::32) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS0PR11MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: d9eee2ef-a71b-459a-376c-08ddb30bc5ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oAwa3Wh6ukhq70AuvJcm1LSLPbWEdkboLSRWbyyi8MAFWG+fTcjcgeqqzHez?=
 =?us-ascii?Q?3acLTb85utJD1CEQsCJ3kT6vlwQSBr+z3G0MBHFjyOXSoNAlMTddxqQpewOz?=
 =?us-ascii?Q?hEjwYrK4ffdnDizJh669u2qoXKIkKepEflwru0/zVamDm1BZ+FEwErixg4Eq?=
 =?us-ascii?Q?HzElg/1ZijD0CbJK5igay+NrPuwbzzsbpua3jVwILMig0Dh5gnfk0Hmicncz?=
 =?us-ascii?Q?j1nZYRwCScena1sitEq/3cZTf5djPyGv9DLeiGFF6BarDus5WT5zz2VCEKTX?=
 =?us-ascii?Q?v859xg3/O3V4JOBHP0I/3XmoYYRXVukxOnYCsQyojkdOoql6cod8mCNLp4Rn?=
 =?us-ascii?Q?MfF6eGRL4djsAopK+sVzL47OjCRMpgr8q2xLw/0dfwKcoa4MiwqcpMk/0UIs?=
 =?us-ascii?Q?5oEOWeda/00q1X6zv1moAGCFnS47peSYrWF8xdWy2B6fVcfZ37IoAeNGhsZ4?=
 =?us-ascii?Q?k1do0Apy+HC1suGCZuzr2Uxg4TRXAPTdQeQnjOOZcsH6mm8Bx58Ff2A9Odpu?=
 =?us-ascii?Q?XwDgteQ5ByV4FO70yv6JT5j8BRvzgLdaQ+mHhrMdDQgpJ4VZJlHUwsC3kuWR?=
 =?us-ascii?Q?PztjDZHgyNAWWRxJAOYgAVPjZgq7OPUCdj0qW3vx2dxsLEHbeCTRCKbBQpE2?=
 =?us-ascii?Q?pnTxPCQWv5neosvtNODkDL9M/p0igqJ/kQbVpvl7SrtB4yMaFvGF7OVp7LUV?=
 =?us-ascii?Q?+JMVoPcd/Az3pbjGckrPIvc7vXoUkox1uCTTLTntCqQHIwmWoICYhxM18WUh?=
 =?us-ascii?Q?JaY907LfwGJ2MBppfugDFx4tF7iGneBup/tgey3zo5M1EGjzRkb/CM+BdM3B?=
 =?us-ascii?Q?a3xHsPkclQ50T6ueMAPkyobhBwHyWfT7Gm8rt7oRDht//Ezvzh3vUM5ADrxN?=
 =?us-ascii?Q?SZGfSQuhcfTGGbSitVNAZ6Modw9CI0Ghk+ln7a2yeBmMViCl9666HZsOCGTE?=
 =?us-ascii?Q?3KjNJWYx1bjZANInkBq/CMvcPuqhl4FpFVcTIe8uHQfgaSX+tKxltByb4ZHG?=
 =?us-ascii?Q?5dx5/tTpCZk2qr15VDcavh4vSxYotuf9Cgm0kCJ4QmFEZw1hlHpTXGT7yr8V?=
 =?us-ascii?Q?MXBpFNyzwbPWc2neELllfb8RamPeqzEVUQ0icfiTtRQV9krivVFG0ExFyzS/?=
 =?us-ascii?Q?LDCzhEcehz+BEQhnHFHg19cdlZVTW+bN6Z35rNnUvjliw1ZdVLLKSg2jmpup?=
 =?us-ascii?Q?Byx2TGVubWJCbQ7n7YATRx5AATpbjn8toNjcQ1UOpm5Ab7hD7lvzJ5NaRIwD?=
 =?us-ascii?Q?EDPzvAK8o+MJ/6feiUuWrWwRbdK0qDjvpLkq8ymfqvMbs7Gxg56OxjCnScsU?=
 =?us-ascii?Q?fzsqWutLEPRTmbcPolfeExA1h73wVX7LS/JewjylyOIk8IgNM67A6X8sVh9s?=
 =?us-ascii?Q?byjTLqv7y57tX0C0cmOE+MIaJJJVpasXFN1V0ZtiTuiOXREK31zDJWlijs7F?=
 =?us-ascii?Q?H8gZN3inn3w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8ryqKczNW8acnTTKYSDOXQu0kREZk05Ca/f1FCRIe1AHqoTV3BOZbnJFQmwZ?=
 =?us-ascii?Q?XZiCpFjHptej7EUL6YvNeN6s6H4e8idonh+KOcx4YTSsMmfg/IwFlw7rI9yo?=
 =?us-ascii?Q?SnX3m4B4Q5DkM+SxUl/noADG+dbKoNTLRyJ3NVfbeZPASru6ozUSJznIJQ5T?=
 =?us-ascii?Q?dYpHjMc/FKZCwjB/wqg4n93qJaSTayhAV1JKzeAaIq91LtUbCIZ1UpI8ptZ8?=
 =?us-ascii?Q?/dlJ1C8+64WgwcuBPQQsPMCdrDrwUitKvPDoVMSA/HenN18RJBJzIpVR+SIE?=
 =?us-ascii?Q?4Qnh6zlzB0PxQK/OIdownj4UVDbNsz/yTSioIVydwGqnhYCQy1YU+ExlFMG0?=
 =?us-ascii?Q?FbNBhxAsG8JQB6ikqR2pqdG17lI2w1meVTPo5YTKnlkiO/PNjOnG+peTNkhy?=
 =?us-ascii?Q?1+m9VAL0gfaUJZys2TdgcfIVmM91L3m8hRABTxAWOTLFAPN1iNoBZuqFGV1f?=
 =?us-ascii?Q?/47nN3DdJG+abxYGP75kviqZvoKqVlcX7q5egxRRrin51ASzkHP82aSgCKCA?=
 =?us-ascii?Q?Hpocmb2L9u4CI20giZH1ogt1f0wZiT1wf5ExTIdaWr6hUUuhbU1Ir8QzI/cf?=
 =?us-ascii?Q?LzgGmayDvLjPA20Amm0CsZLaMmcAk59R7NeVF9dvKw8oJPM1R4VvitCr3Nht?=
 =?us-ascii?Q?aQcdxYtNC7BmRiwRzupuNVAUVSpLIF3c5u6Q4+QRKi6f7DPqnYDBvmfC4zrj?=
 =?us-ascii?Q?cpQBiQtQcTtNo7gqdqjOqgfuavsurWru2Fp7FIc8Jq5y48xDQ77boHZ5rF2d?=
 =?us-ascii?Q?gutSUX93aLWp8hJx2i1MSbeuGwgC4sZ452cCgj5PXszx73eRqCasNW8Kj0cR?=
 =?us-ascii?Q?JEhLVhKir4B/U3tURdy6LgM7fVg8Ht/GnxCeCShBkQALWs3whXbiLSNadPon?=
 =?us-ascii?Q?gDyU85PqUxVmriKzNoX1uyhZ0hlxu9bmEliequp6p34O+HtIHCQxXDNQI+i3?=
 =?us-ascii?Q?uEHjOcsB39Usv3kFvMQL8Ehk7kQf/vj5/JhGzFQNCr/a8Qtj+XEAth/W7eg+?=
 =?us-ascii?Q?U9J+3yDjoAoaCq+nk49MjWyNLW87J33xY58SNtYlOQWdQhSYXk2ulW1ufTON?=
 =?us-ascii?Q?WA7xeREooqp3CRDFaAsifKgZkXHJQilkLyn1Fx5ulKeQAuC4bl/tZIx9zlAY?=
 =?us-ascii?Q?GaGM2rPBGZIGBTJogPslsk5+uyfdp/fPOC+eknc4UJi6JJFGTVz1prnmKCkX?=
 =?us-ascii?Q?bevq+owc0E5fxwFP91z9CKFcClphE7mTJHqeT4fiIVfZXlCn12TzS31ax028?=
 =?us-ascii?Q?onOiebU1BKlX2VGoeLLbjmb0PXsTO6vfJ2R3F7m4+aHw5TZe0ImS59KebYAo?=
 =?us-ascii?Q?keu0ir2sn6epIYZITcU1V2jR4Yqb3++zxNlpDotpoQuV4Tz9BweoURwqn0fm?=
 =?us-ascii?Q?eLR5Bd4Y7D0q3sLgvdvvfnm8ZQslXRbVzcKhQcerxM/iXxfh+S4tl5AEF0tz?=
 =?us-ascii?Q?dygx+RV6lKqqb0sYSk5fIZ70HMr8eLuQ92Fst0FeK7wAYUTED0K+epYudRlG?=
 =?us-ascii?Q?VMCvuGlPk9V0cY3PoAq6lkf4JA96dWGjiuCes1gOhAJYsV6/N5v5NEh6XL9k?=
 =?us-ascii?Q?MLeMlyPJiOTiseDjaz4ZIgDTZukhpA0goQdj5S6K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9eee2ef-a71b-459a-376c-08ddb30bc5ff
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 10:42:10.6111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3lPD1sECBo8zoPPK7q5IFQWEEPwwB2INKUCdwQmwTGVXWzjsncI9wCLHJTJVPLr0PTwQi9pBN8CMs6rhbTddg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8083
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfXy/pyl8hHxxKI /3tRC8OPAv8ZiXq+Kip5J+VHRshZR1S0UdmzGoN+Os0uvRVNNDV4U7iQb7TUEfaaOFbSi6dxq5g ko7qSVGdQqXv72tqrCIvsPVnsKR22iSwZFMlMW4jQesWceHw6pGyJCNu44TxyQ05W8EVKmew7+i
 EVdv0jdjMpwTCSCgmqFsHN0Bwglle8EElg7bB+X0uNFnj6Tzenp7W55rXrMfjcqZx/Ebe1XO8zW pRc12wHOCnuRJmxKyoFu6JfjHOcGVk3bQm7NjSuzeouxQ+khRew9jKVRwheI8UxMN5vGo7vcWOR xqNm0dGJ3tYC6Td1wBXtpgF7msaPCeUJyMY0ICmwfmZhUP0QFExgxu7e1L/R6tL9+oiO5WKAUCy
 U0AtDTxqS2YJPpSIyOIWsUr4H1JAxLhTnz7YaZVGcu3E8LbjJfDOB8Hock+19mxOLTLqyddF
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685a8105 cx=c_pps a=EDI2sMUdhBp/6Fwy26P2Vw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=GwUem0DFAAAA:8 a=xNf9USuDAAAA:8 a=2R51jOvwHnZT8D9jGp8A:9 a=zcmhbJOrE-8A:10 a=O10gGaTY_lwA:10 a=LeceX61Ea_4A:10 a=r0dl5i_q2XGqDZkti5dn:22
X-Proofpoint-GUID: EptjZuXGdOhUFgZx5QHFkkO_rciay56Q
X-Proofpoint-ORIG-GUID: EptjZuXGdOhUFgZx5QHFkkO_rciay56Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506240090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 10:42:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219241

This series of patches was sent in April. Ross suggested discussing this
with upstream to see if they could update the scripts to address the
issue. I talked to upstream and they declined because they believed that
"autoreconf may result in different built source code than what has been
distributed"[1].
I found that Debian maintains a similar patch in their own repo[2], as
it was also rejected upstream[3].


[1] https://lists.gnupg.org/pipermail/gnupg-devel/2025-May/035913.html
[2] https://salsa.debian.org/debian/gnupg2/-/blob/debian/unstable/debian/patches/debian-packaging/avoid-beta-warning.patch
[3] https://lists.gnupg.org/pipermail/gnupg-devel/2014-November/029068.html

Yi Zhao (8):
  libgpg-error: drop -unknown suffix from version number
  pinentry: drop -unknown suffix from version number
  libgcrypt: drop -unknown suffix from version number
  gnupg: drop -unknown suffix from version number
  libassuan: drop -unknown suffix from version number
  libksba: drop -unknown suffix from version number
  procps: fix runtime version when using git shallow tarball
  psmisc: fix runtime version when using git shallow tarball

 meta/recipes-extended/procps/procps_4.0.5.bb  |  4 +++
 meta/recipes-extended/psmisc/psmisc_23.7.bb   |  1 +
 ...h-fix-find-version-for-beta-checking.patch | 22 ++++++++----
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libassuan/libassuan_3.0.2.bb              |  1 +
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgcrypt/libgcrypt_1.11.1.bb             |  1 +
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../libgpg-error/libgpg-error_1.55.bb         |  1 +
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 meta/recipes-support/libksba/libksba_1.6.7.bb |  3 +-
 ...p-unknown-suffix-from-version-number.patch | 35 +++++++++++++++++++
 .../pinentry/pinentry_1.3.1.bb                |  1 +
 13 files changed, 201 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-support/libassuan/libassuan/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
 create mode 100644 meta/recipes-support/libgcrypt/files/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
 create mode 100644 meta/recipes-support/libksba/libksba/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch
 create mode 100644 meta/recipes-support/pinentry/pinentry-1.3.1/0001-autogen.sh-drop-unknown-suffix-from-version-number.patch

-- 
2.34.1


