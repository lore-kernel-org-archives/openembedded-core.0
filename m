Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9D0CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17824.1761218828262557101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mQly65LC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59NAl6UA993654
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=902VTn/F9219xf81J23ABFnA+0Wr4mKO0kVfWwY9z18=; b=
	mQly65LCtf8uP96lyt7qglOhJeqIxITdeHp2UVcu0SKvL3Cs8lSfihgvd5T7F2U4
	0bq7Li787rUdIgJ4ype2UUskLj6hU6IDY1hj5H6q1u6+Xm02TeUCcgKHpfYo6oJQ
	MRrdR/Aqumq1WgsaU/U1ub5I+8wqj7u60jU68d3wxFSzClGz7oIsHOaXT2LZzMgY
	qB6okVPviWbfmDU813eZwXxrbqTiUpFCxGEpMxvWS3n4uJgF7JsqTuHwILpXLEn/
	+BYxc8Hv2rU5YH7+QgQBv6ZA1FSJKZJe0JOQgHMtdF7j/Sadyp1vR5w87Ig2kx0P
	g8PfylRhO7eXGPz3uu1N2w==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgj6f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz+JbV6gO9oQyixo/sod+qe7IS7nq/uPHEPzqrjRut7jgaRS8G73ZN4fDWmxCk1ZWUprc2iSYmyjnHbQCnvHiFrWdohcv0U2YndAoEU8sX3+RNQnRjw9EWlgSdX43sxV/MMwFgpdRHbwU/g9qQ1gAmUNgnjvM/nW+Nzz1zchgbeDMuCgVZJEyUnd2uPG4BouQRor09rBRBTTd6QipAVPc6Gcdqyxyv/YfdC3q+Ttoe+22pSWVTAbT1Qn8VqyT73zorl3AGbnFGOcT+J4/ncbrmEsHZn9pG/XtJwmyjAb0DvVyRFXjuNR4HYPpng5JCdikRL+SnF4WX2kUNCe61OlKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=902VTn/F9219xf81J23ABFnA+0Wr4mKO0kVfWwY9z18=;
 b=jXdgTiW9O+ZcCBRXZxajIJ+jGU0aEeerHDx1j1JCYe15MMq3XM14Kh5nMpCOhbjgjRuIO3C/RILDoHbwkG6+Fy2aFzIDm35RnNQ4bQYazbF3BRS9y8Kz7BWvpYP9AL8DAJ7AbTdFXO+dRozFKEk/J6eVI/drpI8WIRN9Ll57fTVsR2sF+6BPdew1yxqSFHvoDGmKYlLCxN2W/ZfJmcyA333kTS+J5RJmvsVN+viD9e0p/ReIUlmezGFfXW3v81aIonKtGl8xOJ0D6yskSRPf0LAg6V/gSrcgZESymfoZMRcRSpIPn/WpqYEbuSDokqNvZPDlEzmxAB85QsRK8P1ztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 4/7] rust: stage rustlib sources for linux-yocto make rustavailable support
Date: Thu, 23 Oct 2025 04:25:44 -0700
Message-ID: <20251023112547.4044904-5-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: d90f0883-6af6-40a9-fb8b-08de12271841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/oMmTMLQjT1khfERWjqInXioGd7ncOk0FlaD56hyzNhkTqIqYm4GEuVVpbuO?=
 =?us-ascii?Q?T41KoLpEghRqjZrUEgdEoxUavHNCOU+VvKCZRDFBpqITBE/8VbeGm5WYlZtH?=
 =?us-ascii?Q?EWmrzsIpbZvXVoJ6+reatZtWtA4QxQTFbJ3gMzvUNgqw6QK4/dqoTshKSiiM?=
 =?us-ascii?Q?zwDGrdRtnBMRvRIHgMfTnyyIpLc94CJMRhfJcpAqwbjZnlHSSq+ko/s+dFZz?=
 =?us-ascii?Q?U2LhcgGfqM/oLICUivYrSjoRUNtCzzMGp27Lasl9U7zkYktkN9x2bQhxZim1?=
 =?us-ascii?Q?Jr7TVPivNEX+KgYOXxpHIJb+++An4zB9Ppicz7Vz3D3EqXCrb+Pao5jkUWGu?=
 =?us-ascii?Q?mdfD/aKrzASAFhPnRpYYa8J0BTWcLFheaPLcE0yCJCp2QvXeYvbIrgK8tmHG?=
 =?us-ascii?Q?spYdMuXS2PygNl62YI0d6FWoXZTQbo9ZeODid4B3g+e59gdqRe6rJ+QypVjB?=
 =?us-ascii?Q?x/4D4cpR2WNwR2gjguxbXVWcicgaBngjLGYgr08KztKp6TVt6Hr2+KTM+Cnl?=
 =?us-ascii?Q?W/jIlRw0vy3DwytLtYEYuIVkEkfjiLWWPyPap5LyAM8Nd9hH6GTCglfctGCh?=
 =?us-ascii?Q?sTmTubGCPKEbZPK48vD9uXT449/+h+Cp9N+06+I0RkRo0akvGxGcfbkkYqgD?=
 =?us-ascii?Q?v4NiZT6ajbJV2Lc6FlMl7367PFt7L+Cgu6wX/WC1j33JceuJgNl3iS1CaBB/?=
 =?us-ascii?Q?Fwpjkn7PMFmLBuIS6AmPLQJqumjiLjIOmntiF+75V0k9z/IkwuoXQTgLyhaz?=
 =?us-ascii?Q?6lPaank3MHhL/biV9oYIsQT84ck1uc3so3nB0hKvARsqptwwGdjgu2I1D4t3?=
 =?us-ascii?Q?m1qdlBfYUIoNEDCXHmWTxHIVdHJjbmc/4xnzNZTNCf6FTv4H/cvnW4QijKUq?=
 =?us-ascii?Q?k9xpJgINn89dW9MC3c1OLcCSYco1ZCOi1e38/TZCmXN3dHusGyHUB+1dbN2J?=
 =?us-ascii?Q?184z1ukhtii0fJjZgk4vO7EfaeCNbSOOLFfu5TcnMqCtu84DYdrG/+amJN9G?=
 =?us-ascii?Q?1slRN7fKz/szvbfQ+o7X1cbxj9BtsGaqnIoAmlP9HUzm2jOIORpEUxo7iB3g?=
 =?us-ascii?Q?dyE9jDuFrWZOc6hJNRRsGBmsnCBk7YCkRGlX4UPSmHNvBquBXhn0rZcO1lrB?=
 =?us-ascii?Q?v8fF1I1lC1zWNko37y7Kd0LXF8530N4L2Na/DUlpXsXAD0IiKIRwN3RdXhPc?=
 =?us-ascii?Q?WmxWDwVyb35LxDYcZQqpd82m1eYTBnVfM+81NI7hLxBIFq5JvKJ2CxjlvF4f?=
 =?us-ascii?Q?4GP3PTDomccrJxcOTiXKwp8NwKGVdgm2x2nVAEZBhzpHwG/FRlykW9BI3AOm?=
 =?us-ascii?Q?AJABf/XgFaPI9XrKNIOy9DxVLy7QSRMolSJ/DKLHaLMhLGztPizoy1tvGxJx?=
 =?us-ascii?Q?/MlkwWjV94wnNdg1U3C491WxYtFc8a8wm15CQjq2+2Cq433WSNdihvrpVKQk?=
 =?us-ascii?Q?6ynw/7J8iE043pVLjf+Nnj8ppd0WIGMtCfXAnxqXGoeZnfpG45eI55EJBNAL?=
 =?us-ascii?Q?fPhs5HcvW7uhKFs8DEteeNOYQfCGaK8UkRX+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xJ4kXBdrctFZ845GL/kOEFzplp9Xs4DLa+z9Llv9BbtMpZ+x+q0++wLYq4o9?=
 =?us-ascii?Q?BF+bp5S+HhaJ77bEN/3bJQej1Yo8mZLrWm9aSaY0LIihan4G0RwbWlxoU1sR?=
 =?us-ascii?Q?Rh5AuwI0bi1VmaPXTCnwhXT+/B3F8r3Te9bHtgBEzw36n8z5O5bM/DNjjdS8?=
 =?us-ascii?Q?oG41Javxzlv7hCXHpjatjYi6I6U034xiP8hDxcHnThxEGhbKdLyMxtlKXdm+?=
 =?us-ascii?Q?Sa+dD8ufNsoacI7vREA8z/t2iEBeaDpgjji/orivXJaRyEZNFnCzsv+1zxMV?=
 =?us-ascii?Q?CkrrnpCKZlYhhx0iCE/XbZok6+A2sYyHTEQRDMfRjiSqh4UqfjeWyMBbFZ1+?=
 =?us-ascii?Q?hDibXNjLIg5FEuwdyc4t+M2KWE8Kk//nXvSfDM0OGUcY9AF7/ZvG1BiIyzLL?=
 =?us-ascii?Q?4eB4gj21v0X6r7hdjP5k3Ek/Qva9956/fDbTEoKMWl6NYYiAbkeY1WR3ijfG?=
 =?us-ascii?Q?shPO88Vs0uewjqO53pQyHt4zMs5Sd/ddggdqCV1EfdpYoHDjwrm2eROzqDun?=
 =?us-ascii?Q?4ZQWxws53B5n/HCahJSFjKGTPKbdDYUIb0vRnCZQMAJLVhZ/Xc/Qv2APb6j8?=
 =?us-ascii?Q?gkXZ+CdE6k1iLM4b0vYPDgVogvSScrKonA5jcOQgxQJ55OmUbThvNZpzMr8d?=
 =?us-ascii?Q?Ztm5K1na2TpK4Sh6KROB9SxfuDyWwj0O/SVdvDxn45JngpO7aZ7qvtL0vK3Z?=
 =?us-ascii?Q?mH+9moUzOFw0yY98Pun5goIRTyHl2Th6A6Wvj2WGNADLIBHxbEyHXlUpe+5t?=
 =?us-ascii?Q?wIa/inuLkE5m7CP8qIXb8XN2ZjopngYYhHDbcK6jgL1ZafBI6jKdUstLRTwp?=
 =?us-ascii?Q?aFlTwVcpDgKfzf6W4UqwnXao89tpJjT0KWfFBpUUUWQC4g8UqV7JG9/oJUgr?=
 =?us-ascii?Q?Slf599bEtTDUJGc5Xujq+J4zI2aBhC3m/kua6AzP63nO2tIOFjA1JQH/1ehm?=
 =?us-ascii?Q?kvOcPH5Ht9fi6D1htp5K3LZH+R/qAniY1AGAPEF61XopzniTGDWOfvG7VuBr?=
 =?us-ascii?Q?4X7tAQqsKpMZDhyHVpFKuPNtPqQSa5/aAjIRBi1kAWSrAe4URysIlED9vPHW?=
 =?us-ascii?Q?a8pblkSc3ImA1urn2Tx3bavZa3Sq8ALlG2c7Yz8DMap8IH7X9lmnwmLjnhS5?=
 =?us-ascii?Q?ddiX4biZ0aFX5WI8BmPaWf9FAGvDfB4LqIvvQTyk3c9/eIo0QwKxhTz8+Bw6?=
 =?us-ascii?Q?WVWHUSCkALygTfcxYtFlHZhWzsY/Fp5bdkf41dJEyKmJV8T0XWmGv6fGui9F?=
 =?us-ascii?Q?fEOf78JLs3l7NEZVep5mGEpDm9M75TqkNBtuvoTJXm1fYAjrJkWceN5kBn0I?=
 =?us-ascii?Q?c9exohLNnhhUaPlx7fcoxS8U0YRwOmMT4bgBRylqlL6y0Ys5pqcK6R3i4iiG?=
 =?us-ascii?Q?HElYh7eihsD3vvUA52LlJVbpDhRPoKyf0xmT74jE0uWZVOz07O8OON2NLMUw?=
 =?us-ascii?Q?EIGlcvAfcQ+r/IqUstZ0BXwmOE4Go8ZZL54isqkaTyd1sHNSgOJJvEPaGKdV?=
 =?us-ascii?Q?2VdsMeQlQKSu2RXNCA3nMEGIG8vGBfR2+ZvdURXuiuD5ScPqbWMHfWv9+ihP?=
 =?us-ascii?Q?nZz11rYoxJxyHaqKqwTtG4rJoR34Dxg57G4sveIVrBbpBYWCfPjBgGUhaW6c?=
 =?us-ascii?Q?dw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d90f0883-6af6-40a9-fb8b-08de12271841
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:05.4413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LcYYUMRU7J0FazEPqLq5rsEEF0RPjBJvdxSDWmEXm5xZd1QYryc7eXE2GRLNwp6xU/FsH7bkVtJApqKaMZbr0GOVKOmOj4FcJba0C0DQww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa110b cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1bkw1ni4ycSCwBwwb2cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfX/4zNyVjALtje
 ZhcQLHIsQ+egGMDhJ/PzWFv4fo/wqKF+5INPrW1aZvgdAtceQAK4edMSFMZCWIiAzumgrE06cKe
 qoLUJXkArjw873xLrbM1JvzR0dvdydkK/on1Y+I2SRGLB3AdCwK4XhKHJ8pSkbZTsT1f5YS0bQY
 cwfrf95Zw1ipd1Q2qQ2PnjvjgewMFSCuN+d0txrcBebZpddRUDe0DuAQZeQ5skF2l++BB5nNYv2
 BsRkKSWDgWYp4cWyjLnfCY8d7WV5m2/ALD2Gfg/T83mh1Crfxh9zxasoBpTuCI7oZ8P8zNMBvCD
 0KA/Innqos1C9lm+G32xJTv2RfazcY9FwLd7z4XLfO2T8FxIAYHIPcJZAoHFKuVhNU/33LjLHhC
 UOZJ6qVe26mH20aUXT0CBWtN6T3M9w==
X-Proofpoint-ORIG-GUID: j8V5BHHLIFYBtZJ6O6S5pH456WBUALhK
X-Proofpoint-GUID: j8V5BHHLIFYBtZJ6O6S5pH456WBUALhK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225240

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When building the Linux kernel with Rust support enabled (e.g., via `make rustavailable`),
 the build system expects the Rust standard library sources to be available under:

  ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 31adb1d9ff..0c94255f63 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -66,6 +66,12 @@ inherit kernel-yocto
 
 B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"
 
+do_patch:append(){
+	if [ ! -d ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/
+                cp -r ${TMPDIR}/work-shared/rust ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/.
+        fi
+}
 do_install:append(){
 	if [ -n "${KMETA}" ]; then
 		rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
-- 
2.49.0


