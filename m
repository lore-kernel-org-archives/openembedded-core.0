Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D032BC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:53:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37532.1789127585444291673
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bXDpcahw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3714c97fd3=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAnr1X1348326
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 04:53:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=mbNT6ZJao
	UQZV/XqoGKdyvaicapTKLizfKNjNsl3Q/s=; b=bXDpcahwBp8B49ZkgSWWQan+F
	sl2a4qvyPWk3a1BDvJwvYxc++8vN4A1PZesqrcOusJg0/xcCsuDGas7Nlo09ttGG
	WJ+NkoqF5lFEumWMogQ2gw43TcfoxD88aAv697RAt6fkUVnC6RvIB7nWcSG8flek
	NjeDwDh6LU5cGTL9VeCUgcKEoFe9UHQ7vtf42uTw9ZHws6rqUwBnlE0J8hQ/wi3Z
	UNKlPeToKFgci+zJlWYc2n2RrSU4ytIaCLn5PaTwS0uTyOxcljWH3GidXpa/zY1R
	9fu3vXD1T3HT2J6k+aLaAawsihg+Vj/m10TkspRig7B3vyBDkumZf74Li1Iug==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021141.outbound.protection.outlook.com [40.93.194.141])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypk80m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 04:53:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grvv0DM0QBmkzlrP7bPL4+HdGuwqdvWQRWHcLcNpPKR4LcNaktsdhi/klTi3BBduOyr/aKrqDDr4aDRDOab8UZ9dkIG+DkEFdLR3az8usyUeDQ3ZYbzrjEO9XnIOURacltVguvOVZ5b/0xLwvyKik1LLbKLLdiLPk+/WNWVmltIBlzuNXsE894yROONjoFIl0yDLniFAWwTJLFrLldA2NLF04Cg5jTLM5lcrHYBBJ5SqBz0hnmTvNGR/Cfz3r+CiVYnIFDW9/CeTislyGBFEJdiEwuca2Zh5ltZWCBAqiJ/vjg/owmGcmjZVxbuusNO086Ib7/peL5y2ktniy20gQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mbNT6ZJaoUQZV/XqoGKdyvaicapTKLizfKNjNsl3Q/s=;
 b=AHeJqmGIJo8iOEUuL7rPcYV340fREu2Y2Q9qpoDTt4QJn2rqQ5uGUkghyZ86+8FxWqcz1+pHln94kFFBjLOzPqG9xvcmGzVkXmxo3KSX6III8usQtZvBUTnogLaGqQBjUhosYw/oUvCVd/UOXRvDEri2eyBTJte6mXiYrpBXYTXqLrsfz+euO6fcswjq2W1OB8Mm0TUxWZUGkN2QkMK2SeW6q0WdFtFUTTVYucuJT8+SEVe/MoPXiuKWeOsRB3HbjyjXm/y8Pjcjkme08UXl3gSob3XVGJoJxKaaIKtIWWZcx2zbNgeJp+ymK6j7L8/NaEagH7I+Xsws0+tbLAYziw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 11:53:00 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 11:53:00 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, sundeep.kokkonda@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 23.1.1 release
Date: Fri, 11 Sep 2026 17:22:37 +0530
Message-ID: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0089.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::6) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: 5875f91a-7526-4811-5e5e-08df0ffb3a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|52116014|3023799007|10067099003|6133799003|18002099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	c2h3If04gAl1aoqr1Eeppw8nkLWodCJYyFhVXoq/xbKeONOYe9o6tQxhsNI5aTixfTwmH3O7f1qLXmMlQnpAwI6KnEbjYs18+blCYuGliMRXc2m522KICTsrvSgziuIcD90ZTj1+bUoBEgdLXPeiY0C10DtLq+/r2LO2uG3kGn5rOq8wMpuqIfApoIctpdTdexk4l+iooioOBD0SOp9lYl76SWMgCqL/z1+xngrdENISOSKaaJGhSoWOTC7WII64fa77CdAeNJskUKM4h42fMVfn3z+kteMPEv7t+1sPRdfJ2ayl6daewH6Rh8EaRe0ltLZWQM3IYhDGxSlZE3qzmKs2nOhDRrRSFOkSF2pVd3tz7erPk63nHuXU2oCwsx9pWqs9Sghwm7CSl5y/gCd2BeM8r6qE7rjcu9Op64h947hw53+1uumjHN6Uwdb50vvLIhC4immdF7hFPhzaSZs6ovJsDekIHYXSl/belKwXEKPa4gyD/YnsIgMivxS79jjvGdmuR5S1r+vUZM1NWoGH3/GYvtY4tsFX+7BqDijx0cPfYJ/n8m1Oa/jKYafmn3a/zJSdivPBkmVrAVVe9FTRDwOUMFUetqd4Q7SvVPtZ+xjjUdKjpqGcxeiU/BcJSBYS6yM2TKepX7hvYD1ZPxyWSMu4hzuNEj7u3QBQsSEqpSY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(52116014)(3023799007)(10067099003)(6133799003)(18002099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0XwN5QhRUuRMSTr8yRdurDW08IMzMJY8dZzr3NODg/Q35wQILy3SSCq5zQoQ?=
 =?us-ascii?Q?wj4fVEaX29B7PJpMMSHjVZYvLEOGcQnDBv5yR+WhTFaASDV1p6k6mt6Jb8WZ?=
 =?us-ascii?Q?ZV6lB41yaldyKp6Z+Jkkeeqv+lMemDh28nBmA4mGLhnMVPA5BqRXV6/kK4WV?=
 =?us-ascii?Q?6P/KFuUeqDFZEz999ANYrg5dgqfhWMopIe+PvIuZnGcEIgdUg+Car02DRoRz?=
 =?us-ascii?Q?dSffevoz7SA4zqSuSfNxfbL2tp/oFj6C9zsmioGj5zHAWH+pIc3Npupfbx/F?=
 =?us-ascii?Q?KnGsjfLizEa3/oajQUMdtBht1rvvOo5/8eY7qye7q0knXsXaiO0EEWt0mIur?=
 =?us-ascii?Q?ZqbiZT8h0VT2PStjtpvndgDhiCpFflNbcE4ka3MPmYALLBSGfUi8LIdWB7Yi?=
 =?us-ascii?Q?D1cHV4M2oHfa7OA/LzQ+jJPcK1HvrHzTq5GXsa0Db0yClBi01br6+klBRVsJ?=
 =?us-ascii?Q?o11ZS2sEToN5pIl++myANwQIlEjmvl0+sGz59rR8w0WpaReD2TnSt6KySiUH?=
 =?us-ascii?Q?te3Cds8pZGdCtjER5tLbJDgEZ3ObXysTAwLrj2YDVgb1kMAJF1NFf6dLv1OX?=
 =?us-ascii?Q?bhGqJoTZEVF+w7F6asTlq1cAiPEevoyk6+WBa38d8I0ckZ915HVCRvhASQTX?=
 =?us-ascii?Q?UETZRzHoRl1k5+VHmXHXencFBCZeOUpJhwa4K9jmgJVufEMProwLS7d2p5cl?=
 =?us-ascii?Q?KcqchWI5Qq6yDQGH3qnA52IZKeHIVPcU2iF7qrnQYtgj59cNaNQzN0gVf0hy?=
 =?us-ascii?Q?E50D0KHyTZakCDWyn8zdkIzoi3kAIGwCbaCDBCnHLAX7fVl6Np09sQn/DLsK?=
 =?us-ascii?Q?V2wMj1Vw87wJTak3ePWR+H6TubBsMsddkhBiEpuf2CdIuNz1kEu2CWPxOR4Z?=
 =?us-ascii?Q?F1pMUC/4W+LFkDF7cbyeGOCbZrOb0C26xT2dhRVbBr6B6KoB2HM2m91ocYQh?=
 =?us-ascii?Q?lykI6jBH4OPgrNPw+gsiNby5zK9oXZMoUBMJsUc2kuE+rjZjg+iPMPAN6uFI?=
 =?us-ascii?Q?K2O5XjAt4jw+tLMFCzOhMXg0JhpM/661jIs3rH5CEzCJXEWNuhhBPvz64uib?=
 =?us-ascii?Q?jSQfFNQdkmbHaTPfiaQ7N0ZJP6sALfQXLNXDKaT11szQRF0LOr/IV3MgSC/u?=
 =?us-ascii?Q?2wV+HUPmCCYoJEH1VsMSuaJ0oUPWOyp/mjAKMBuT3J1+txrKlGYR2tIN+iKr?=
 =?us-ascii?Q?ew/oER6hNyWmlQtZ3ykYtqGC7+gWXPA/UOtNJV9dz2GzFyqjXqr7PNa9VN4J?=
 =?us-ascii?Q?MlRAX7v+Te+6X5JRY8qSQIL34CtW+eCBt3csvvaU6+fOEjbTtifsmFnpyvS7?=
 =?us-ascii?Q?+vEh2I1x9YyOIiVjHS+zCahwxa3RTVDu2U9RSAK4j1VJqCqoWf0AfLW2GiCv?=
 =?us-ascii?Q?uUfxPOG3zX8Y1FlXfFND/C4rpqf8KfMURkZq+jsH/uw+N3+cMKT4/w4SE1TO?=
 =?us-ascii?Q?QnzXYB2IcL33XfM6NeguU16LBrEXDJ2mxmzrq7N/kqELikEM97opQNnIOBiB?=
 =?us-ascii?Q?KXhaUluBn6OUDYGbv67L6tyYMPbnIM1zsh+2fqC3LWRpqyXHK3a+U3Jknkgy?=
 =?us-ascii?Q?Q9arzKQPgWJfcT/CpUBJVC12gcjVo9dBDOei3umUiTFX8aDD9NiINUnsEpwB?=
 =?us-ascii?Q?ljl+8jDddGN6lvh0uDs4DimLj9cb4KP9gcEBA5TQZYNtOhvnz3sidzNeT4kI?=
 =?us-ascii?Q?HUMngSRJObfoQj+sRfiEvLxj6aN6tjo6SmrP+o9ZDWUyRZAPAwUsBEFPl8js?=
 =?us-ascii?Q?2QQ2BRCl3PHcVJFCOS156aMg+mdT+qg=3D?=
X-Exchange-RoutingPolicyChecked: 
	tSjW5ZirrE3QqerucuSTOD0kDqazFtsDSXaFIOXv8p9F9ExeZr0jy7BUAeWDkfXtvD8UwJht3yoppo3cxqt1d4OF+YcKttYVl1h3KskmTUO4eL1y22Nz5Z5H3aig4jyMAHWB/fgLFU1ze6lH7k2BmG63aNBoao1+ERIXJ/y6PudiR7BYEGOQYdbm25K77RLb5RvkzzLJ9m2l/NP47eMOZrMUjMMF6muDG0z+hopWx8fXCE5HYoEUqhP8KbkmiQaWQI6HXVXMJHQUIE/ZBol7m8ZWAz7v2u3J/3T4BmhT/7aMuKsXRbSPEXWkjbPx0bGFtcfUgQW53sJHSS2SWhp1mg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5875f91a-7526-4811-5e5e-08df0ffb3a28
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 11:52:59.8674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZLdGFAPXxqiB82qGjqjGazzSOUeKBdjVvQjzVYTc4j56mDH4b0t/LlEH1yuNLbgsbi+ERld3WzpxnNGuHnr3BpaMFG2+HKxDgsmtrP+XlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2NyBTYWx0ZWRfX7OiTnGZ/ARLw
 ZDRxxIdpCiJrF7ma5TtMnznNEvPhuT6ktdSm3enj58Ii37eG1k6wcLbqeLHeemP6KmKRRS2/T1I
 84ZSpTDKCXuzlr9bMjR+LRmIAMUPoVLdkJ0mzrWYBXMtrBPcNB9mxE+wqCRc4N7/TzIDyWrHRi6
 Lh2R0nN3u3nBtqzlPyrkYyOo3X/ngqop41T0ktNmM5R1dMT7l6z5q+B9//3OJ1ByCCkdoYEz0Rd
 lGvAeYzamoBKQLaorTib+bOYOprnV/+fn6cnI8IpMQDBe0VbEri2SsIXwQDE4d0d3bPEAXKGVsj
 rfRBFarCZXI9qjXz5ID2BAoVNfnRFfYAvq7nytnLjJ7j9u/KL9IamYDz/nmNwRDIy1PlsMMvmUR
 00NmfBiSU6dTXo2jyiUEncweeAl2/3QJ7/0pw66zAHlskHnLsEJBo06mzttfqKF6CV2TZKv9W8+
 sKylPWDk2Usb4bIaI9A==
X-Proofpoint-ORIG-GUID: C0Pf_88mVFsv0QQLWB1P_0YXAYvFP6kT
X-Proofpoint-GUID: IHnJksiZT-xzMkIDTNGlIMuCUuSPTxe7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2NyBTYWx0ZWRfX3p6LxG5v0rYq
 5v4bvC+9gDiaPtWB3hRtCxyY4y1eEeC4007avFR9Cp3B59chuvlYfq28g4ZaXFB1/X/QwOp/Scc
 wJK4hGcZgJyCbQDaxAFfmspvJmRO+nSAO8eRlqrzK+9s0CGGFm1h
X-Authority-Analysis: v=2.4 cv=II+XmQvG c=1 sm=1 tr=0 ts=6aa3eba0 cx=c_pps
 a=OpSXQbuC3dJaDDyxjzMkQg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=3cXmZo5BRv6LZsSQ6goA:9 a=qS89K1LUDJCxP0DO:21 a=-74SuR6ZdpOK_LpdRCUo:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110167
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 11:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245638

From: Sunil Dora <sunilkumar.dora@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-1-released/91760

Drop 0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch and
mark the musl ssp_nonshared driver patch as a backport: both fixes
are included in this release.

Brings following fixes:
81e03602463b [lldb] Fix SBStructuredData::GetStringValue method (#216875)
f1cdfbeb84e9 [X86] Fix NaN handling in minimumnum/maximumnum zero fixup (#217420)
b8028f7bf85d Revert "Reland "[Clang] Enable -Wunused-template under -Wall" (#208001)" (#218638)
2c7b58a3bbb1 Use static_pointer_cast to do SyntheticChildrenSP -> ScriptedSyntheticChildrenSP (#216181)
024b86e93451 If the address of the isa_pointer is returned as an error don't ask if it is a tagged pointer (#213163)
2bda8f5daeab [AArch64] Use SDValue to pass to vectorToScalarBitmask. (#218717)
ad389cbb46c8 workflows/release-binaries.yml: Only dump the wix logs on failure (#218810)
8956179fa43c [WebAssembly] Avoid same-block dominance walks in RegStackify (NFCI) (#218369)
21cd7726af6f Bump version to 23.1.1
910bfcd7324d [VectorCombine] Fix foldBitcastOfVPLoad reordering loads (#218336)
f54a7b77711f [LoongArch] Fix selection of BRCOND with constant conditions (#216027)
490d4ed19d16 [GlobalISel] Fix inverted libcall status check in createFCMPLibcall (#219242)
d81f5d210b38 [SLP]Fix narrow-tree gate width and extract miscount
4dea21e892d7 [SLP]Extend GEP pointer-chain cost to casts and non-root external uses
aedf7d6749aa [X86] LowerAVXCONCAT_VECTORS - fix some clang-format messiness. NFC. (#218504)
55a6a0bcd3d3 [X86] LowerAVXCONCAT_VECTORS - collect all subvector operands before ReplaceAllUsesWith call (#218381)
b085518fcd06 Revert "Revert "workflows/release-binaries: Disable flang on Darwin (#164667)"" (#218978)
e86c19d77c9d [Clang] Fix -Wunused-parameter for implicit coroutine uses (#217518)
fce01560cee8 [SelectionDAG] Preserve CTTZ_ELTS lane count during expansion (#217982)
b201342bdc31 [clang-format] Harden star and amp annotation (#212856)
5f58ba54af5e [lldb][API] Fix SBEnvironment crash when Set is called with a nullptr. (#218906)
cefac32eb6ab [DWARFLinker] Walk each shared subtree's dependencies once (#218072)
fdf0409c656c [WebAssembly] Avoid scanning unrelated debug values (NFCI) (#218378)
01efbea98550 [sanitizer] Skip hanging tests on FreeBSD (#216703)
03cbe93e71fc [fuzzer] Restrict merge-sigusr.test to Linux (#216702)
f39930bce62d [libc] Fix sockatmark test (#210655)
99cfc877e40b [C++20] [Modules] Handling merging predefined decls from std (#219151)
ab544f643b09 workflows/release-binaries: Smaller WiX installer on Windows (#219858)
687ecdc1254c Add option to format a whole file using git-clang-format (#204336)
5340f7cc8814 [git-clang-format] Don't format the line preceding a deletion (#215946)
8e1810950d0a [LoongArch] Add omitted LASX patterns for vector extend (#219351)
91d740bac953 release/23.x: Backport '[Clang] Fix C++26 fold expression normalization of PackIndexingExpr'
47bafb752202 [SPARC] Preserve inline asm relocation modifiers (#219971)
2244faf2c16c [WebAssembly] Add funclet bundle to thread local wrapper calls (#213826)
4a09f2722a56 [SCCP] Fix missing worklist push for recursive calls that update lattice values (#219826)
6b358fb914ee [win/asan] GetInstructionSize: Add some more instructions. (#214707)
1943eaf4faa3 [clang][Sema] Check exported default constructors in nested classes (#214275)
bf9e7e8d773b [clang][Driver] Link libssp_nonshared.a on musl with stack protector (#219828)
5089f145193d [SPARC] Parse unary complement immediates (#219970)
ce68f2870320 [OpenMP][libomp] Fix dist barrier arrival synchronization (#213845)
7d23f0d618e1 [ORC] Fix malformed Mach-O `__unwind_info` tables (#217781)
8820e75cdd42 [clang-repl] Stop interpreter init on action failure (#217147)
99b7b38c1b98 [clang-tidy] Fix false positives in readability-trailing-comma for designated initializers (#215934)
9beff35f67c1 [AArch64] Use NoSchedPred for SME instructions in C1 scheduling models.
f603629d9ec7 [lldb] Fix SBAPI breakage in SBFrame::GetValueForVariablePath (#218565)
5f27b704b2fc [SelectionDAG] Avoid irregular INSERT_SUBVECTOR when widening CTTZ_ELTS (#218019)
9f658ca5d2ff [libc] Disable float16 on 32-bit x86 without SSE2 (#219675)
13259bad3b48   [clang-format] Keep empty Java interface/record body on one line (#219910)
4f7718b2d0f8 [flang-rt][test] Fix Exceptions.cpp compilation on FreeBSD (#219709)
d1e3b265a499 [Mips] Select GPR register class based on requested type size (#220012)
a53c3e52ed56 [MIPS] Fix GP-relative selection after select/add combine (#215414)
d27393c2493c [flang-rt] Fix runtime/environment.cpp compilation on FreeBSD (#219705)
80062a22dc03 [Mips] Use ELF binding when expanding PIC la (#217566)
6dfe1677ab8d [SLP]Fix crash in canBuildSplitNode on struct-typed scalars

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 ...tools.cpp-Add-lssp_nonshared-on-musl.patch |  2 +-
 ...e-float16-on-32-bit-x86-without-SSE2.patch | 36 -------------------
 meta/recipes-devtools/clang/common-clang.inc  |  2 +-
 meta/recipes-devtools/clang/common.inc        |  3 +-
 5 files changed, 4 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 40d62042bd..9b24d79a31 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -482,7 +482,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.0 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.1 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
index 1ba19bb4cd..efb90dc3fa 100644
--- a/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
+++ b/meta/recipes-devtools/clang/clang/0004-clang-Driver-tools.cpp-Add-lssp_nonshared-on-musl.patch
@@ -7,7 +7,7 @@ musl driver will need to add ssp_nonshared for stack_check_local
 on the linker cmdline when using stack protector commands on
 compiler cmdline
 
-Upstream-Status: Pending
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/bf9e7e8d773b]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  clang/lib/Driver/ToolChains/Gnu.cpp | 6 ++++++
diff --git a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch b/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
deleted file mode 100644
index df35636055..0000000000
--- a/meta/recipes-devtools/clang/clang/0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Fri, 29 Aug 2026 13:55:00 +0530
-Subject: [PATCH] libc: Disable float16 on 32-bit x86 without SSE2
-
-GCC 16 defines __FLT16_MANT_DIG__ when targeting i686 even though
-_Float16 is only usable on x86-32 with SSE2 enabled. The float16
-detection in float16-macros.h keys on that macro, so the shared f16
-math headers are compiled on plain i686 and every use of _Float16
-fails:
-
-  libc/src/__support/FPUtil/BasicOperations.h:63:67:
-      error: SSE register return with SSE2 disabled
-  libc/src/__support/math/acosf16.h:73:14:
-      error: invalid conversion from type '_Float16' without option '-msse2'
-
-Since llvm/lib/Support/APFloat.cpp started including shared/math.h,
-this breaks the LLVM build itself for 32-bit x86 baselines older than
-SSE2 (e.g. -march=pentiumpro), as used by Yocto/OpenEmbedded multilib.
-
-Require SSE2 on 32-bit x86 in the guard, matching the existing
-exclusions for 32-bit Arm and RISC-V. Targets with SSE2 are unaffected.
-
-Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/05da143c63d333420b99eab198e1a89c97480929]
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
---- a/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04.771442947 +0530
-+++ b/libc/include/llvm-libc-macros/float16-macros.h	2026-08-29 13:55:04.773991812 +0530
-@@ -15,7 +15,7 @@
-     (!defined(__GNUC__) || __GNUC__ >= 13 ||                                   \
-      (defined(__clang__) && __clang_major__ >= 12)) &&                         \
-     !defined(__arm__) && !defined(_M_ARM) && !defined(__riscv) &&              \
--    !defined(_WIN32)
-+    !defined(_WIN32) && (!defined(__i386__) || defined(__SSE2__))
- #define LIBC_TYPES_HAS_FLOAT16
- 
- // TODO: This would no longer be required if HdrGen let us guard function
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 5d571e5fce..912fb80277 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "23"
 MINOR_VER = "1"
-PATCH_VER = "0"
+PATCH_VER = "1"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 0ca6951ff4..87e7d90a45 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "ab1f0e3ec52448c33e8782eaf0422504b87c7b016b22514653ee0d8fcee479ff"
+SRC_URI[sha256sum] = "ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6"
 
 SRC_URI = "\
     ${BASEURI} \
@@ -55,7 +55,6 @@ SRC_URI = "\
     file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
     file://0034-guard-clang-tools-extra-test.patch \
-    file://0035-libc-Disable-float16-on-32-bit-x86-without-SSE2.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.43.0


