Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B294CC61DD3
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 00:15:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1594.1788308139476007823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Sep 2026 17:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K5AmgGGH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37051437ff=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681LmTgv3160894
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Sep 2026 00:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Efl4uSysA
	Fvtg9Twg+Ehk49Q8cSY+2PozFM1YFUvvtc=; b=K5AmgGGHtteLAxnorIS9uiQgH
	esHRsEeUFldy2HXyPbO+2ZZsvdtZJk13qF/ET4QyJJXZfe9hMTOZ4bhNW7VEJDzQ
	U6/KkevozbWRpiqF9KRgDm5Z1eej2StkytSAMNeSTRVsNQWjQ+6h7SK24qeh5jS9
	N+cPLnMIsMuz/+YRXketZPrC09Hu8cv2y+UT/9p/QmUOTRf9iIEdMlFA88rjTAWJ
	bIAEZq77+nGfsvHoghqeoKlaWOkWwiBOPBEChyRluPCqhOegxfwMhxxUWIvzNy4I
	IeSa7HdAMYaE4slKlgYIpa9TVfO6gPaWdcDIi3CWDWZ+/k4xoTSEAnjSbcAbQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022079.outbound.protection.outlook.com [52.101.43.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gbmn0ndde-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 00:15:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GITjAXqXDdS/4yWtQiJlu4khgtWBQwZU6E/fN4hvri4PN6+XjAzVeKMw65eNi8cjAxlujF8g/7Ji+Eea19CSpKoem1JiDUxJkqU38Lxq70EhInngTDQM4vfTk1vrAmb9Y9I+U6lNvEVMrBtV1/spSQ+kzEdCP8gYpRoJ5eB/lwkyU88RQIEkRPoBRigcPRM4KdkIGjSSXQVmdZIFFbruuFzM0WBWiI6xjEXefUiOgFI+/NIqGJ14SCBkU22MNOPvS5GjsnAjgbV1n4WNl21HOjuvH9F8QvwNarn94RKIKx76YpvuRaHkPBH+RnqwrUuyCpa3AHgk6pBaa2OIBD3CIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Efl4uSysAFvtg9Twg+Ehk49Q8cSY+2PozFM1YFUvvtc=;
 b=x9UQGWx+X+tTjKkuuldGk4INw1oCWkJJAczNwGcYjDHBh5Y+mXsyaFHBfopQK8g/1pu3Qk6X1UranOjn4o/hUEw68bDHaMYxVz0S5+82vWEbCm5LgJ7A5HcRjPxh02vaOkscwa/Rfhk7qGMPFnuvwVBObuPKSj2rIaZ7BYboxY5cEJ4x6XPgU/erGJh8XS4thU0kgtTHZYEQ/EsKlhmhhCDiWbZ9LbS4JdNlS7gM04bYsXk3jNmSPOv0ahdifKIl4EZrDGufs6xPG86wRC9ZuI89zX/jgSy88dBRE6kFmnuXoUTOZ+u4HWHdUwiNQC+54+ED2BIu18JR868Bh6xMGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 MW3PR11MB4617.namprd11.prod.outlook.com (2603:10b6:303:59::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Wed, 2 Sep 2026 00:15:36 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 00:15:36 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [PATCH] maintainers.inc: Update owner for strace pigz libcap-ng popt
Date: Tue,  1 Sep 2026 19:13:29 -0500
Message-ID: <20260902001329.31484-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0034.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::9) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|MW3PR11MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a9f1a5-b066-460d-2f90-08df08874f66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|56012099006|10067099003|11063799006|6133799003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zLFWVrGokLkQ3Up3vqG1C6T7QF2Xm7WahBpBq3HmXl6Lz+pySESDAcjMzHVzXXkoS6ohwCv0cMYWawP5V3z8IKnxqYH63hXSYNEvuSJdzIPIbG9zhXcHjPXl+FfmcqEuomXrkZwQPjDzMII9hatopGmKrQkDsrS9c4Vp4IdmnFlNgRu7svp/m+pVs9HIHD7eXAEBaiGK6pBgu7qUwVcRp8Giy25asfafScuAPyEuCvxHhQtdxGWBEz+LJWzPW0IU9Q5HX6g0T5Wx7ZeOzRg2pi5+k/pcMO5pwsB1Mzjs5ooWbf5qqYZf1ygJ8GalmjOrSo2HQUqQdMiRk5QH1Q/WZYv7FBIURRZU4A9I4sxIWbKdwqTXkITevqReOpqQexaLUqC4ff/LjKqrTfjYCRRMCGqb0k8qrQjEt1cFj8FTRZ+E5b5YhrTXCnny5tr+H8f8GUyoEyP4RmPKyCQlQrv6WY7SWTs4p2plgUGP9J6LPob96NijZGyO//2v2OZGDoSbEyr0fQM0Dik2hOmpK7P34QhOngxeUadh257CNo/cAmWJG3amXbDGf6xBa8zuHYMB+FKE5L8WEZA8uiV/L5wM7md1Wq/SUmmGtvUjw79hawJ4QTPQGzC8jTBo/2fMQHhJNaxFpPIbu0CAtffmP9UYUGCErLeECT6Fqd5Up8nb8qjgnIzqzeQQDPELoo4D/WWlgIbXWPvFb+2uDgU/tT95dW96sJ7Geg/NeVhlVSFOAes=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(6133799003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rABe8LWOKahXIVLB4nIBeujy2qf1ClhD5t0cLNYmkoWPyWLeScxKQHAe782R?=
 =?us-ascii?Q?QR9Rq5kD6dwPD5iK1QG9frFG3oil+hCSpdWdNLILJRCfFL0Lj0CBbIGLXgEN?=
 =?us-ascii?Q?Q3SSZatCnoxDtuYHtiSZUy5rQsmFqEvTE6W82Iw7gZIQInOJzZSGTLHCRrvp?=
 =?us-ascii?Q?+ygPS1nubMQvyBO4Z/amxUQrdnqCxh3qayvSisx+ryg243tXbUeyOkUuIBSz?=
 =?us-ascii?Q?pqrR5NZq45lnHAlwb3XEt1+XQzc9GnI3h2jt3thSR9VJF8TMHarV80zEezef?=
 =?us-ascii?Q?ERxBQSQscQ/v4iw5gNQaq3vPuS5sbxt6dUctyZxckNW1v23tMmInlNhBB769?=
 =?us-ascii?Q?pnl1ratVCA1abM+/P+7Fa+wE0qg2HBDxx3i9Xva+Trwwigjw5USMnFRXKuhj?=
 =?us-ascii?Q?WGf3PpgCArK1m79ItToCPC8VB/wpH7dVmiJHnP6B6RbW/QUMXdc3HiAgqbZ7?=
 =?us-ascii?Q?gp9w0bJT3cagS4OnSh/ZJGQskyv2e9eANZzxbYTy1hQ1SJRqKskGmIxJA+HG?=
 =?us-ascii?Q?82N1oDAfPklMEj/VNxB3lWT51S5JpRh1p9qhSxRzxkrYhSRszyufoYj97C9d?=
 =?us-ascii?Q?z3F5T7NFt68nca2ksea4elmtBRyzLmGx2tNJwsaJPEZksIml9SyYyokqkx6p?=
 =?us-ascii?Q?rHSUHvCoDOuRxjV6z9zyIdDrhOVfQVlQzIro6RQzUw54UfkhfDBTjDN9lxbI?=
 =?us-ascii?Q?98xhdlxjaMPYrquS43jgqbeKlyY4IwoyZ1ULSikR1WbElI//EpIYk+TK0Is9?=
 =?us-ascii?Q?MNr0Pc89jwbGktqwYOtK7vsVNUfLye72ud6MFUuGZ6D8bSDieb3u4LPJ43/M?=
 =?us-ascii?Q?Tl8pWeDajO2qm1hLsoL7GhacRm9fxKlr2iX95RfXbD2AS9GqY0UPK58X2yt/?=
 =?us-ascii?Q?aHvllEGUCBcGUyDMjYcyvMPh3d0DnsCdizvLs4LbhbipbKyrm8szFHw2PAQd?=
 =?us-ascii?Q?cXzPJelUSViDqBSRUV/SNxKw81LgahyJ/Fw9HhPfQnoqXDahxaERbaQUl0nT?=
 =?us-ascii?Q?5775ii6Dp9Vlg3NmBe9sKGadm9pRtXdJ384RMFNGkvsZHQOz2jd2tArbBgTu?=
 =?us-ascii?Q?vMhjFGezqRmZlBseuELj4ov4PZ8YzwT53dMFNgoLp6j3vw/SqJGfNivvbg7V?=
 =?us-ascii?Q?wDksl1Ur5imkymJVIyYDJrRHLaJE3SEVxgNzNuPx75Fk6hvsL5lNn+jaTjm1?=
 =?us-ascii?Q?VcSS3ytqw1b3Oum7jXF19eBxjmPGwBPbU5+dNjCJ425InwT4RWgnQjfz3th1?=
 =?us-ascii?Q?XgsdVtEgu2Qm8p2NTm+KdaLb5tIgFQoWWPKg2odkyRYt4prQrKtPLeL2llvM?=
 =?us-ascii?Q?4aWXp27UDwKn32TVigVt5wYRIlcHyqjHBE8J/gf6ubgh9j8b6WALs8SMqnLr?=
 =?us-ascii?Q?4jx5rBf/g+kPTluh+bPHr/bVNMaWLQRHFsnwA4hO5kiJyM9e6bAn8ValRl2+?=
 =?us-ascii?Q?4UZ76W/PecH5BqHgheJUEDHS7OIrZN7ngh0WoclKrQQiWO1Xspf6cCeoxBMc?=
 =?us-ascii?Q?v9Yh2/A/DYCYanuG7kLLXSv8Mz31s7IwDhsz1HrmDo0GfYbyLbSMIOFebmiL?=
 =?us-ascii?Q?CkhFw/P46CzD6tBcW8ork86o+sbMRRDlt/3TABVjlgkok/y4Pd9icIIdx7Bu?=
 =?us-ascii?Q?zn90hq/+DVXM3eqPERbCZZ5vRnYPYSYhzzyMA+Zj0KthD7DlGvFHT9trnxiy?=
 =?us-ascii?Q?pEtPyoZtiyCP6pPzovQ/HWOAGe6LgM4NksHRQHKMXGjHHFvtOMzV2xZGZG4F?=
 =?us-ascii?Q?A1schiyC2Klq8OelfgNufXOe3mTnPr8=3D?=
X-Exchange-RoutingPolicyChecked: 
	0eyr78/BvBdsnc9jzfiQ0HvQAw+PYUtXQYmj9ESV8UNI+h/gej73jYCw+uCQu/wHU/I0re3519xUogDyLuHHijDUlf/liJxSlWL8qwTjToJG/JfPJNtvZBIInz+aeYfBZRBT076Z9eKcCTIYBQaVZ30aLW7+GeftnL3Nz9FhZaKnaRwNCj74107jm8WuF+kwa7WZFCK/H/lJZwvvhGsvBh6VOu/auor8khtm/VBQcmTbf131wrDXpbk+slXjRJisM0QKokNApVKDHr7A4+PUD8e0QUt6Ao7rdSrHTHCS5AstwlmeosmZuf0oMltAwa9h85e4Wh1YPKw1U6n9eMfSSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a9f1a5-b066-460d-2f90-08df08874f66
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 00:15:35.8272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOCRnhkRWJczr7KmAQtSbz8bmWePbo5XUufJGo1ovtraiDuT2edxiYwpzRSsb1k0SGICHpC9NlspXuzBSa+qd1H9aSRBHcINMzBM4IPfVho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4617
X-Proofpoint-GUID: SmDXdt1hLIvp2mu20sLofSvdNKLZibjW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDAwMCBTYWx0ZWRfX2+s5/5crJPur
 REUDyUM5nLldmN41dtaJJg64ihshfNBlTwI77g6kgh50VLJR8zaeNpqBLqIRTG+dUC2k0+tspns
 JPADxteTBubRgKtF6m5d95emo+0zRb1uR9d/HasFwNpoV2A9BILcBSs7KrNwTsZxwQ9tSb4dw1u
 DS9FpR9MfRo36YrkySD4Da++1P31iq1SjjiHP6zZibadCLdYlF3qUWdZVOdUZ9sK7iBwJONvb+5
 5YyjnMspVXwi7iyHyGz73S5sP7qDSbjG9rNNML0+aSluR7lAkVJW5BaMdErDWcJB/92czEBqhTM
 fbyfINl0kDSRvFqudi96Rkp/YoA97iM20XIm5ZlKTg4HV7ls5p7ylR92POJ2waetAy7Q/PQR1Hx
 1u+LIvJG2xj5rb0rOkFx1k3dhEVFHRle2SU6oHWqYdkLROMRFc8rVLtcecwhGjyG0RpatgfI6un
 6sICJWZAxbE8YCLwCqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDAwMCBTYWx0ZWRfX/jt+XMPLj5K1
 GsWr5mGfXwQsG85/KElEXaqtJl+P7aC2Jxny5lACrxOsVZhRE40o1gTY1Y9VzB3ZzqhRKwGQPh0
 mCXSR1IMsWS4KuNbvA9RtTvZk227SXQZN31z9RrfkbfJXBPMVu/I
X-Proofpoint-ORIG-GUID: SmDXdt1hLIvp2mu20sLofSvdNKLZibjW
X-Authority-Analysis: v=2.4 cv=aM/Ab79m c=1 sm=1 tr=0 ts=6a976aaa cx=c_pps
 a=floMify7oDVZ59GUGiBMBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=zjtiufAZAAAA:8 a=7CQSdrXTAAAA:8 a=ag1SF4gXAAAA:8
 a=7FN7HTqknrOuAnlKgNMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=2tRhtM0yMehlNRDZlsEQ:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1011
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 00:15:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244850

I offer to take ownership for the following recipes:

- strace
- pigz
- libcap-ng
- popt

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2966cddc05..7532f6173a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -323,7 +323,7 @@ RECIPE_MAINTAINER:pn-libatomic-ops = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libbsd = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libc-test = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcap = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-libcap-ng = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-libcap-ng = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-libcap-ng-python = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-libcgroup = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libcheck = "Yi Zhao <yi.zhao@windriver.com>"
@@ -600,14 +600,14 @@ RECIPE_MAINTAINER:pn-perlcross = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-picolibc = "Alejandro Hernandez <alejandro@enedino.org>"
 RECIPE_MAINTAINER:pn-picolibc-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
 RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-pigz = "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-pigz = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pixman = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pointercal-xinput = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pong-clock = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-popt = "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-popt = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-powertop = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
@@ -818,7 +818,7 @@ RECIPE_MAINTAINER:pn-sqlite3 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-squashfs-tools = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-ssh-pregen-hostkeys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-startup-notification = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-strace = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-strace = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-stress-ng = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-subversion = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-sudo = "Chen Qi <Qi.Chen@windriver.com>"
-- 
2.43.0


