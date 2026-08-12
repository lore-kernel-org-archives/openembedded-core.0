Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E00C5DF69
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:49:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8371.1786578571465764282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NErE72+U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNgGpZ3893031
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:49:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=WHsFlDnBtena1qCHH8eCi4Tx1XKYcbsYr7x+WiBIImw=; b=
	NErE72+UF93vz9JnGhDlVyjZJ8kk5CMVwBMEITPsxEQETxqw9v85DAFhQAqJU+3T
	zEqwN80HqN0BjR1GmDfL18Q8PhUzevGbf+BqW/kB4r/WQ4C1Cyc7IOtGzumlAATM
	dPQQcUcXPS7fhUgoTdp8euFgE5JxDFBPUl/VCV5WqDdMxSpT8RV69lD/NmCJIH8C
	dP31/7wMmx/+QZMM7CDb70EaTQyU01l9Q8xCv6XJ3I6PE3FtJQ4/hADWRXA41pWd
	yBhNjNOb/LxH0HqSGkEpefOGI3Vtuoxn79QBPSJa0eXRjruJOx373ENcCXhUxPgE
	QTf6pceCVaL6ZXqbZdniTw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022094.outbound.protection.outlook.com [52.101.48.94])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysggc4em-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HhXq6Swuhtv/GWKnI5gfjGZ8biK6ISkXSYEV6gOaJspnCI1J2EsPRXPuAQn7nvkPTo42LI2c4TXpLYwWH+QpR7lMl1ixllhC3hDAdKlOz/hxKptmRnEnrGSNmHMR7lBIOQ69MkHTci3i/Yz7osCwTrGULMoavUXL5k2j9K6xCjEIXJqOrGhaPGeNdeXi2dklBlEgQr2Jh5mbP8L0NG7YzIupRguarJmt8NfTl9yWv0cSH8k6EWM0Fd8lxRV4alTmdsJ6WpFEN+aQIovtpLhQUPybbYiucwmW/V76UroWXzLiQ/fDVbmVKxJvBtf4i6uub+9CfIcuBo3U3NnDuR7Nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHsFlDnBtena1qCHH8eCi4Tx1XKYcbsYr7x+WiBIImw=;
 b=Q/yWPJLljn3tjPNnNgaKis2ZUQ5WxUYmevaKUNuk+hARHfLYFcPsuz3EF4MVhN08iuCqUSMhZz8X32LFnXeMdN7aPx4aHJJd0//SdGJLdSqLcEaklN0B0CpJABDlF5epnS+W52LHy/NmyykaFethtNQ/3pf3uCHYrp/dFGX+IloBtHIBBdrtTT1B7Ml4mEMwbQhCmXA32bdBpq00hH8WOLOUqdKCE2qlyWgxiMDCkZ6v/VV8zBZwxDiAPzHB/fXOl1+xnuUCj41cHtXIBTvrTLfOY9NWEQmctd3z0V/Kb8PEegHXyeDLwSP1wiyNYPKeHYrAaSgfUIwsXpJ9tOTwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:49:28 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:49:28 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v14 10/10] libarchive: Disable RPM filter auto-bidding and update huge_rpm test
Date: Wed, 12 Aug 2026 16:49:00 -0700
Message-ID: <20260812234900.866436-11-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260812234900.866436-1-sumanth.gavini@windriver.com>
References: <20260812234900.866436-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0102.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::17) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 46947252-b9ac-468b-f199-08def8cc5929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|366016|1800799024|38350700014|6133799003|12006099003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	HRxHksSqyxF2NmSqfdlvsseX8HeIscF2d5Q+hQTNT7vxIyBJ7nxsbgRNJ9h2WzN4YnaRdL+xf8vucmLTlXdQN2wvvezmFjEVxe5hq7LZWVW/twZ09Kakg+MLpUaWTfDFn1XAHAkiWkg0TvkWMHyh659RnMNsUmOzl5lzx5sZ3kpAGbDEYiuY6LMIid3j0ghbst1Sg/KxyV/dnGd0ACyPOrOrFv0nqX2VQCzsq6JsSJSofjsOLAuvCmGaESOBAEVIkvE5gbU/sjLca3p/3y+q8QGXWtEs9V8e0pmnxvcl2uK6F+3Etinx2BYoFSgSdK+YAn+peY+DNdFPvImN+Ci799vsgIEWXi9jLnHjpUEPNnHcId8zjvxqsSOXofo3q5MKUNDFXZ/M+Ns+RtUyjtx75koRQRjMUsRMgVeqzJAeddlhhqRsMhqNrSvUErmoZsqjDO1AX4zS8xINMJ+UPVyaXu7s8eUYky4NnMqcMGO56Nhgy58yuSrioCpMrlBIHgE8NnjxAo1ckdg4Z1ytQBWEjS1OFGRRYXI6TnI8eU/DwRewHPYArxJ1bkX6R2VGAtYhJr9vuezfdP9ZkoOt+/jV13lJXeABxCXKx3yfs1RI35th6Khz0O8VFieSdG1qwt+16fxi7ktc9k/l2ARxFJM296aQhA5eNoFrZXFPfvvKPDc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(12006099003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8X2Scj/W9FWDDPGQZK783uKxtKu+MyUty/N6AYJui0PT5iFONtnLMe6/lNN9?=
 =?us-ascii?Q?YXBfmvajfAU4yjHI4ag2dBKiCWJTlPzlgtXEo6kk3YzQiIkFps2WbStFcRtj?=
 =?us-ascii?Q?qRFM18M05/sqUS19bsdy0XrAznzgPG+RqhwxLrakucKFq28AzqxMmL8LwOMk?=
 =?us-ascii?Q?6wx5DEffeHAJmD1diFzk5SuYMvfFUXWzEdUabHGiL//iKNuwL0D8yQffB4TX?=
 =?us-ascii?Q?OhPk5V4vBXTIgGS/qUY6wd73AvpJjPCNxUBAGmtOmRJ4S8wMqqp/u7v7uIx+?=
 =?us-ascii?Q?WHDmS8cjJdzSSlkiujZGgei6kTRXb1WGMf2DNK++RQe37t/FjXZF+PwTgT5E?=
 =?us-ascii?Q?bf3PG3BUFA3aJ2yCu5bKjOD5/VVah10X3X09ESFrsDG7HN50pEnYPMKZz3Is?=
 =?us-ascii?Q?Q/lSrWBH5YZqsqzQNeySVg6CaMHXIyk2YdO0MT2boLLfltXLinvhrH1dHbJq?=
 =?us-ascii?Q?IsajYFNRCRVNLG/6RM3f8iYZD8Lzqfme+TN84WhkfQXAILouUTy61GWH+oIb?=
 =?us-ascii?Q?ljLZxTe0cxmkkDyNaZNAcmO+oGQgp/nUVPcMP09dcwp7wUvNRCbWzPsvn4TT?=
 =?us-ascii?Q?7/JEcPIfObyTtkmDkNShr3IpX5LKHHCwe52UdI4sA4uvSwoSHgScLc02Bmy7?=
 =?us-ascii?Q?9pY8GW+mDI06lN0qLivZ9HBf9x5/9NpvIhrdVPZnY5HsERaZHI4ESeAg5CT0?=
 =?us-ascii?Q?8eh1qqQNDAFcgK91Mkij3wuNdXvhehSgI0maRZsbdnDfLlpaFiygUeJD7ZeI?=
 =?us-ascii?Q?tHxdmTyn/9EmzFW1hbfvwVn9svpAWzLLHipV/II2p/UY38B/m4LIoe7MNAp+?=
 =?us-ascii?Q?J1R2UwH9Mcbsd/42KYEMYKUMeJU6O6fty77HXNXPFKjZFaHi/8ouUl1Q1gyL?=
 =?us-ascii?Q?+/yU1rmu5iCqf8p5KVuE7y/yhafmTlRvlzR3FbDsWwmn5C2NwbomCAREwHYY?=
 =?us-ascii?Q?8U4Yxr/wG/pQbbEGG081twkEdcdfatO84WqwriX+iZZJIqNOUbwa9777Wo7A?=
 =?us-ascii?Q?1KExDWUwdhcowRPTUz27Sfs26YGiJ/f2ovgeS0wq1Z5dZTQGeoTnH/UeVnZc?=
 =?us-ascii?Q?oXAcFEbByJrr9PUM1ATm4DYkLnukmCQ4s4XImrITxYVv38XP66sehoXc/F3n?=
 =?us-ascii?Q?mURDGH7CJkRAA2g3bi5vdLj58NlLa3IIefap5tfyaDUR1h7nlZoniunbg62G?=
 =?us-ascii?Q?7nS5gdESN7BQOjcQcWqBokzsqLnhqpuoVNbZoIbKPEOeOYelAjs8NGnoXa0m?=
 =?us-ascii?Q?j1xQF7kY6reiObk8JItXSXs09yH7c/8T1wsUndOroEcpeS6abbXir4HK2E5I?=
 =?us-ascii?Q?OSHZfD3A0DBPvhAKpdMzVFw5PPnMXZIbYmpef7I+pRk3zIuXd7BMXvJn2Q/M?=
 =?us-ascii?Q?5mMU8rybolixZyTN1GEKVC7oLrC1Q6KXfk4cFmDiYEmhoByayuGedJfUp+Po?=
 =?us-ascii?Q?7tEvbd2giljMsC4ezr4bcVHcbT/TD1Ud8/lX6p6rpH42o0ECh8f0ACaYb921?=
 =?us-ascii?Q?oomMRCS+sQ8DkK8GHqQAEk4D0emO0NcLdLIS/ddZ3RMiy3ugud+D6nKLqRG3?=
 =?us-ascii?Q?zyCuh8Kx636wVZOyDwiAtaTvL5/2R+uiWF4Nk+ep92Oih9OBG+VnAcKfqDl/?=
 =?us-ascii?Q?Eo1fETT101tcVeZPf0MA2V5/Y0BfWf7armn+VT89H7FB1XItenz33/orsd1t?=
 =?us-ascii?Q?SM+Zki1kW8hCjF4RcXU6B9xgwZR9IbxRS+dBciMKIbo3N3J6apaLDBvZO0yG?=
 =?us-ascii?Q?9y7Lct86HFVyVTrSIQl2z6jud/7g8wo=3D?=
X-Exchange-RoutingPolicyChecked: 
	f3eAwqTNqGyYw/PSIVSo5tgzW3q3LjR5tZR9L7QuOT9SOtUATKKWIqiH1YtG0iIqMfh3zkvwsKEcwnR0kEGrRrGenTWxzi1Kq4dgAxKRHoKnWItfDNBOKoQRHPn5L8DE6cYtDfFwJ4ZU1D8RSCeCX1HY/M/9LOPrsz8+XuALLGeXM0rq/yNCOITnY5/VYzkn72u2QF7GgA4zU+wMiU46dqVOEgRUvRMINTlDaiVzWSIgTHadSSj5KcMazk1YcJZuUyt/weNn3KRQ6p4nQgRTdzNoXEcqX7BQHjYbw2VgBJF8l/Ea2CJ/RPAyfIUyC/gD6U9rUDpcbeyvb45FLJ5tQA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46947252-b9ac-468b-f199-08def8cc5929
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:49:28.7618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 39r4r8pT3kAjF4xt0dNbxUbZUlD/QaBY92kqlzenAUM90jXaH26Dh+9Exfhzg2t3kUt4JJ6d4pAUEn8l9Au/OiwoROouRo8Nb0O89lwwWuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: gQB5AOZvlu8ONXcd6NbTz5Pl7oNZrdz7
X-Authority-Analysis: v=2.4 cv=fr3sol4f c=1 sm=1 tr=0 ts=6a7d068a cx=c_pps
 a=kWDUzu7Sg0boEHrzbzcNEA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=NzkYBEk6AAAA:8
 a=NEAV23lmAAAA:8 a=3uWsZ661AAAA:8 a=t7CeM3EgAAAA:8 a=9_fcTNOi7W61J8-o3-UA:9
 a=DC3Xf0KLC0SIM7_k:21 a=zqED95DPWUTvcrp2mxve:22 a=fYNom5PXsM5enKJDCoVv:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX97FBfOeYJqzg
 RwXkNzmvm3aP++5gFVXz6Kg4wrxesyuOPUStz9ZrnEFeQHXvtrqBgGtl6E3vVFbJDleMi2+vYNb
 gxepBdIlg4ErYdmjiesFRlD0sc4MXYOYaZgR/xggKXJyUSBQ7H5AUEQiYJbno0B8y2VdQgUMQ7R
 M1oIGoL/lWZbETdS2Z872XHq18aifqIJhD9YOOe2RqbkUm8EL3B4xCqijFaMyOQNpoQdSitqIRW
 52a9eDs6dGVJI9xktPKwlXTwzxdC6/KGswelzu3kizg13n5nZPkqU/lDRfKZ6mPsmu1p53KN4Kp
 9p9CnW7mqcCY1xbusy6bT/l84FZw0vqZYUocwAOysNC659eYywJFYx9sOtAlVE9eat3KDQ4lBH4
 xIMUEoGXHEmDMjTL5a++xz4xXOx3NTOjo71ia0FGRcWxCbnq5eiGgCir+VtYdFMo9/7+y21yq6e
 +znD2iVRicLHUPtlcPA==
X-Proofpoint-ORIG-GUID: 13UpciR-55alXEbLRz26KrmVnrZK-WaD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX81hxVCcO2qTJ
 hGc1FCGDtu33ri+oUkY/8Arvq1I9WbZog2UJpRShKjjQz/hGWz8hIOfDLYRRtY7G7ChV7k9F1Af
 7sfneybq4e4h103YvSREBwjACGr9W5nvzzQtKCdh7/bHKD3prPv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243319

 * Add 0005-Disable-RPM-filter-auto-bidding.patch:
   - RPM is now handled by the format reader. Disable the filter's automatic
     bidding (return 0) so it never intercepts RPM files during normal
     archive opening. The filter remains functional when explicitly requested
     via archive_read_append_filter(ARCHIVE_FILTER_RPM).

     This ensures debuginfod and other tools that use
     archive_read_support_format_all() will use the new RPM format reader
     for RPM 6 packages, while maintaining API compatibility.

 * Update 0004-Convert-RPM-reader-into-a-proper-format.patch:
   - Include the test_read_format_huge_rpm.c changes from upstream PR #2846.
     With the filter no longer auto-bidding, the format reader handles the
     truncated test RPM: opens successfully (ARCHIVE_OK), returns ARCHIVE_EOF
     on next_header, and identifies the format as ARCHIVE_FORMAT_RPM.

Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 .../meta/nativesdk-sdk-provides-dummy.bb      |  1 -
 .../recipes-devtools/pkgconf/pkgconf_3.0.5.bb |  2 +-
 ...vert-RPM-reader-into-a-proper-format.patch | 42 ++++++++++-
 ...0005-Disable-RPM-filter-auto-bidding.patch | 73 +++++++++++++++++++
 .../libarchive/libarchive_3.8.9.bb            |  1 +
 5 files changed, 116 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 6075770bf0..37dad54409 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,7 +11,6 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
-    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
index 79ac3208d3..3343857867 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_3.0.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://pkgconf.org"
 BUGTRACKER = "https://github.com/pkgconf/pkgconf/issues"
 SECTION = "devel"
 PROVIDES += "pkgconfig"
-RPROVIDES:${PN} += "pkgconfig"
+RPROVIDES:${PN} += "pkgconfig /usr/bin/pkg-config"
 
 # The pkgconf license seems to be functionally equivalent to BSD-2-Clause or
 # ISC, but has different wording, so needs its own name.
diff --git a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
index 29d12bb539..03a207f33f 100644
--- a/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
+++ b/meta/recipes-extended/libarchive/libarchive/0004-Convert-RPM-reader-into-a-proper-format.patch
@@ -11,6 +11,14 @@ Without this patch, debuginfod cannot scan RPM 6 packages:
   libarchive error: cannot open archive from pipe: Unrecognized
   archive format
 
+The test_read_format_huge_rpm test is updated from upstream PR #2846
+to match the format reader behavior: the format reader opens the
+truncated RPM successfully (ARCHIVE_OK), returns ARCHIVE_EOF on
+next_header (no valid entries in the crafted file), and correctly
+identifies the format as ARCHIVE_FORMAT_RPM. This test requires the
+companion 0005 patch (which disables the filter's auto-bidding) so
+that the format reader handles the file instead of the filter.
+
 Upstream-Status: Submitted [https://github.com/libarchive/libarchive/pull/2846]
 
 Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
@@ -29,7 +37,8 @@ Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
  libarchive/test/test_archive_read_support.c   |    2 +-
  .../test_read_format_cpio_svr4_bzip2_rpm.c    |    4 +-
  .../test_read_format_cpio_svr4_gzip_rpm.c     |    4 +-
- 14 files changed, 1162 insertions(+), 15 deletions(-)
+ libarchive/test/test_read_format_huge_rpm.c   |   13 +-
+ 15 files changed, 1169 insertions(+), 20 deletions(-)
  create mode 100644 libarchive/archive_read_support_format_rpm.c
 
 diff --git a/Makefile.am b/Makefile.am
@@ -1398,3 +1407,34 @@ index 6062c48..11dbbb4 100644
   
  	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
  	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+diff --git a/libarchive/test/test_read_format_huge_rpm.c b/libarchive/test/test_read_format_huge_rpm.c
+index 51208c7..10c7fb7 100644
+--- a/libarchive/test/test_read_format_huge_rpm.c
++++ b/libarchive/test/test_read_format_huge_rpm.c
+@@ -26,6 +26,7 @@
+ 
+ DEFINE_TEST(test_read_format_huge_rpm)
+ {
++	struct archive_entry *ae;
+ 	struct archive *a;
+ 	const char *name = "test_read_format_huge_rpm.rpm";
+ 
+@@ -33,11 +34,13 @@ DEFINE_TEST(test_read_format_huge_rpm)
+         assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
+ 	extract_reference_file(name);
+-	/* This archive is truncated -- if it has data, the bid has screwed up */
+-	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_open_filename(a, name, 2));
+-	assertEqualStringA(a, "Truncated input file "
+-	    "(needed 34359738384 bytes, only 10256 available)",
+-	    archive_error_string(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_open_filename(a, name, 2));
++
++	/* This archive should have no entries -- if it has entries, the bid has screwed up */
++	assertEqualIntA(a, ARCHIVE_EOF, archive_read_next_header(a, &ae));
++
++	/* Verify that the format detection worked. */
++	assertEqualInt(ARCHIVE_FORMAT_RPM, archive_format(a));
+ 
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
diff --git a/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
new file mode 100644
index 0000000000..26a0159908
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/0005-Disable-RPM-filter-auto-bidding.patch
@@ -0,0 +1,73 @@
+From 882166d7fa113f0c2108864b8a579d01816e1fce Mon Sep 17 00:00:00 2001
+From: Sumanth Gavini <sumanth.gavini@windriver.com>
+Date: Tue, 11 Aug 2026 12:02:31 -0700
+Subject: [PATCH] libarchive: Disable RPM filter auto-bidding
+
+RPM is now handled by the format reader (archive_read_support_format_rpm).
+Disable the filter's automatic bidding so it never intercepts RPM files
+during normal archive opening. The filter remains functional when
+explicitly requested via archive_read_append_filter(ARCHIVE_FILTER_RPM).
+
+This ensures debuginfod and other tools that use archive_read_support_format_all()
+will use the new RPM format reader for RPM 6 packages, while maintaining
+API compatibility for code that explicitly appends the RPM filter.
+
+Upstream-Status: Inappropriate [OE specific - keep filter for API compat while format reader handles RPM 6]
+
+Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
+---
+ libarchive/archive_read_support_filter_rpm.c | 37 ++++----------------
+ 1 file changed, 6 insertions(+), 31 deletions(-)
+
+diff --git a/libarchive/archive_read_support_filter_rpm.c b/libarchive/archive_read_support_filter_rpm.c
+index 01bd1bf..8e90da3 100644
+--- a/libarchive/archive_read_support_filter_rpm.c
++++ b/libarchive/archive_read_support_filter_rpm.c
+@@ -79,39 +79,14 @@ static int
+ rpm_bidder_bid(struct archive_read_filter_bidder *b,
+     struct archive_read_filter *f)
+ {
+-	const unsigned char *p;
+-	int bits_checked;
+-
+ 	(void)b; /* UNUSED */
++	(void)f; /* UNUSED */
+ 
+-	p = __archive_read_filter_ahead(f, 8, NULL);
+-	if (p == NULL)
+-		return (0);
+-
+-	bits_checked = 0;
+-	/*
+-	 * Verify Header Magic Bytes : 0XED 0XAB 0XEE 0XDB
+-	 */
+-	if (memcmp(p, "\xED\xAB\xEE\xDB", 4) != 0)
+-		return (0);
+-	bits_checked += 32;
+-	/*
+-	 * Check major version.
+-	 */
+-	if (p[4] != 3 && p[4] != 4)
+-		return (0);
+-	bits_checked += 8;
+-	/*
+-	 * Check package type; binary or source.
+-	 */
+-	if (p[6] != 0)
+-		return (0);
+-	bits_checked += 8;
+-	if (p[7] != 0 && p[7] != 1)
+-		return (0);
+-	bits_checked += 8;
+-
+-	return (bits_checked);
++	/* RPM is now handled by the format reader
++	 * (archive_read_support_format_rpm). Return 0 so the filter never
++	 * wins automatic bidding. The filter still works when explicitly
++	 * appended via archive_read_append_filter(ARCHIVE_FILTER_RPM). */
++	return (0);
+ }
+ 
+ static const struct archive_read_filter_vtable
+-- 
+2.49.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
index 3b3824e778..2eefa28532 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.9.bb
@@ -36,6 +36,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-append_filter-Verify-that-bidder-and-filter-match.patch \
            file://0003-Remove-bidder-name.patch \
            file://0004-Convert-RPM-reader-into-a-proper-format.patch \
+           file://0005-Disable-RPM-filter-auto-bidding.patch \
           "
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 

