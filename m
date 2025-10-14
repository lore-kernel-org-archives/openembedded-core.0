Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CEFCCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 10:07:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11772.1760436452976440581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 03:07:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mtlLnkHz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23821c83a4=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59E6O5ag3798393
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:07:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=iWlrBJuVF
	1BshP/ZBUpEffXoWu+EqwNac8AmzZtpF08=; b=mtlLnkHzAFweQDx+4Hr0koAJl
	/wbgFKvPA7PvsNXvvlV5mdPZ1r/xKXhEyKTDJfKXOfAcwlhZoxX0WOF3oClsTNjG
	wz/l4mSS7+126WZpCaZKaCPueyS6kC3h9bcbBJ+IptUIML0rPcjseYbWQLBcnNBx
	QjeLsZl++jxYjpcZMsG7VOKJAwdXtolPOlnrNIONTM86LpVz80PT0xzlyZ0s4mTE
	haRdZWOz2Z/QFSNUlSRTvpgvIoJF3FQmBVHKjXxpn+oWlxqdSpqvqkCtjU89sM0R
	wUbikKH0ogVROMKrEZmTLH9bvmtM9AraN0qlb4o3Yg6helAjRwP8+ZCihS/ig==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010045.outbound.protection.outlook.com [52.101.61.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewk1jd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:07:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9cmtfjIuR0waQzZguNc9r+9GK595X+P0ZXaTLT6XVJL28wg5rZj2LZaIyoS1RTtVOOyTsQbXDGzc6w1Ivjod3IbVLkeOwr5lUSilYyq+EtN1JI8y96RJa9QphvQVXOUIIsBSnoOCGZ9Jg2wRjM6C8FmEWfqCrhH63Dgo392zTpxAapH1lmhYP8rmgR33DNls6lDCE8i6SKpvhsCPTEgN6o6JZAmYXqDObhwd/Fgb6xKNsahqBAbRx1x/DJF9Rq53c8IgqfCdGH7shb/Yet6trFTJrpgvPaOidFS4YyudpLY7I3zxN8C5qtdKBKrx77BLcssDKLHSzpF9cDc3o5N+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWlrBJuVF1BshP/ZBUpEffXoWu+EqwNac8AmzZtpF08=;
 b=sOYeNtLkjgO27h0oPxMApeOce561hy6p5zeHns6Myewi6XCPHggQyjl2jD+3zggkQFLW4gZLXEqvElR6hHZ1h3OoOvmOV2wbFBX0ajAbbiU9ShcQmT7sAU+L+vkCPg+62MEZZoUmJJjdxSALyGuIwNoCWWr8+U0et4gHLvlO+E4uGczrufDKEGSyYNHhUuYxeVwaLT9TXkC/igprpT0qecCxW4llpEJxtpDAIiWkaQ4m9xTxrTh8PiZ3eOZ3Y1o8yn7pFit6xT8VhPIfaX5CeOvU7mcm6sMxt6dyw68b+3CYKsB9BhLPhMI6+XM7C7SUp3Qy6I5j2Y5YlWG2MHInqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Tue, 14 Oct
 2025 10:07:29 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 10:07:29 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust-target-config: PPC64 targets require explicit ABI selection to avoid build failures with rustc.
Date: Tue, 14 Oct 2025 03:07:12 -0700
Message-ID: <20251014100712.159692-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB8393:EE_
X-MS-Office365-Filtering-Correlation-Id: 99da5e0c-1ca1-45a5-8f2a-08de0b097bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mm4KUyfHpcTrP84oQVx4O0Pmr+g3n2sJWXAj3XTE8CWxU0DJSlUTEz/vTzk5?=
 =?us-ascii?Q?2kjWrYIXsqZ/uprjIzToTgVk1GzQD5OAraJbrtWGcefCXtDt0cvEsGW6Lr8q?=
 =?us-ascii?Q?YHTg5OG8a7blWR0PvNKldf7r1KYFhwyX2CDUe9W/p1K+fz/2t3mrzDsJlbV+?=
 =?us-ascii?Q?1RfQ/Jz1/q+MSVOe08ZwbxdETTRS7GPT5zFmyzGVZha0CwyWhUxvsRUUqjHx?=
 =?us-ascii?Q?OSyXiUPTa9e+5vBMpt0Yk2jPRDA29eLBN+LMEIafyfqDpmScyxwWM9aQ/JI/?=
 =?us-ascii?Q?EYOmC5g/XgAUzFRLgk/U39bpd1gt/z5Ak8J5ab7+vSLrMReo0Ff2qmjj9cfA?=
 =?us-ascii?Q?njunEjV0M2eXsAWQYAYPxAj47N7iyLjA52c+fT5IhD6+TbvRzEfaN3X8eloK?=
 =?us-ascii?Q?jEvF+wm6PVwsi0TxRradohnYdokHjx9Fya8K4JTYw7Y7YR16MILfjYytFEEz?=
 =?us-ascii?Q?UHY6qIQHoi0qVmMDrsTeW5u1vebcgPTX7AEHtWoyNHjeJIwglWK63vcRqhAS?=
 =?us-ascii?Q?atsWnAdRWeyVb3UCd3r92InZUSNp9fTxO8shw+gbWPUJxzDUdgSGxBBlgKYD?=
 =?us-ascii?Q?wLF1SggN7oEWb9VCKKXcUaTYclmvDiLZhhIeQ7GoSsIhgrOo2oVZUdF742WO?=
 =?us-ascii?Q?DyyuF8F8RJvkvD7ul1xZk/+i4uG6jYAON34lFi4cOXRDNcW4Wtq98ZuQt3f9?=
 =?us-ascii?Q?OpTOZ/ji613fhIF0GEB+nu3FKB/ERzxaed6VOYwuqNrkK0NPzj/hfWjIlbA/?=
 =?us-ascii?Q?PVv0AieUZjf7qHrDrvx3cwV2lDtBU2FIg5h84Bd1+XDa9U8Bzm0jZOCMTeE9?=
 =?us-ascii?Q?uM9lPlOwt2nOP343643CEjsFALygL+mLlpf5dI2IAOy8XrTCHxihhcb711cT?=
 =?us-ascii?Q?D1WNe1QzpnSPBdX+WhS/9yIc3Wabq8ymdZa50RyTwuhwCQF5ZgqTwfjPCd9Q?=
 =?us-ascii?Q?LAfZzEja+aEhFUBswDSm/upBGMCd7CH+CwIjBRSNoQ92hsCLqFMzfKGt1MRq?=
 =?us-ascii?Q?SGfc5h0tmrdBTT09Kppo+zVXnGP/+aJPKnXijPw0JADCJHKde26np2BrqeIj?=
 =?us-ascii?Q?+6BgUv9vSrdcUyGwZxYrnb9FflEqcUjT5kgjQ54f5WHGC4a6EO6bhTSDJW3T?=
 =?us-ascii?Q?1aeTNFPzyjr0kEIBs/IiAp4ffQqMS7sg1nJ04mx1UTe9p8IxZh1x8aBiqAF4?=
 =?us-ascii?Q?TQGDx5UDpusSV+dJwpvoTd2p973OCa7WG1ZTeuMK85/FhSnxX4CxbAPfd6Es?=
 =?us-ascii?Q?iGestxnwe5CdDlIEp7IPQzlz7zb6daWlxDBoX2E3gOCbKXIFo+THPjCDnerL?=
 =?us-ascii?Q?J9XTuBdOYZGOy3hAlszP6sySf+0U1GkchYvUGdVN59C/JPES3d2FQokwOHGS?=
 =?us-ascii?Q?OWK3czu/Qa1CfClo8YGej/fD2RztVZTlxT287ME19e2wCpOvLlAjkd+tYHaH?=
 =?us-ascii?Q?FA4PoRFqq81oWl8XnZrOX6qjfoO8GscECk3d5RSM1JDZtftU6UH9snjTNq17?=
 =?us-ascii?Q?YExLEzj2gEQT16RM3R9lLbkzZ3ZQw9hsZ4By?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rzSf35ahvQL8QYbQoiw+/epV07MOZqBN4ni4D6QzoL9JJ5/hXggUwUkHLsT2?=
 =?us-ascii?Q?soJqcOfLYsrpkcOCTzzGULh6qmzRkQtIbaXBsiZJMS8DNgOwC1tUEg2XIkHh?=
 =?us-ascii?Q?VbDVskFtgDksOHWR+rYfrq+SPbtUR2rJAUmXW2o8Ja2GXFnnLX6EaGHEXWAp?=
 =?us-ascii?Q?wZ2LaQOPnUbVWlS/JA5Vi71OCZTu2XaFZegLMUu5uyreS82bxww3rifEdc9F?=
 =?us-ascii?Q?aTdz9NdZueQ4g1dLXoCMSWw4b/zT9CEElHEM7wb1eD8D+65P9Tsafi0z5zfU?=
 =?us-ascii?Q?nIkWtj17oWefNCRyPCGESmUmCvVC0CxW9Je4WUJYOfqt6dSwDVmS9jQPoTzU?=
 =?us-ascii?Q?EkK64lqUWdB+WWh/nBAbWd7k6oHVj1dfiyHFs0z7I69g8lHXxbohkiXqOvVt?=
 =?us-ascii?Q?+cRAZW2C8R4QP9JvhGJV4NOr2ZurrG/sNpNMVrCdCVj6/ABgZK9450Kg+GXs?=
 =?us-ascii?Q?hQVpFIS+1kLGeRhuMXQvnatMKmG0aSZfapkiL0bI0sGRoUnZMGNid3MiQwDO?=
 =?us-ascii?Q?HX7KG3pjYSZK/L/8iktlCb25rjYDfXCqSRaaexacjIuqCFxGs6DLrhEN0ogW?=
 =?us-ascii?Q?13zrMPJTCA/sCbFiVJOSDjJhdXluTbhzFfD2LfJMguKrA5hSaogfWo08ireX?=
 =?us-ascii?Q?Ms2tzP6F5xNuZai+58iLpJcjkGg/dJikUqKf71AF46PE0mvyuaquJ9otHdqW?=
 =?us-ascii?Q?PmNym4uXoXTlT19bsS0HEo97kR54DRX2gpB/L9SRSKBXNvzAxvYxCyYalGpt?=
 =?us-ascii?Q?rQPAdc4oeSHlHnWblSpcBYKruYSOk/qt0OggOaAseqLoNykljQp9gr2WhUiM?=
 =?us-ascii?Q?m+ekK5QQnWST3oxWOeRspXTk9wWWmHYezApwqRgKIk5WSJbnT1hoBJOAyGd1?=
 =?us-ascii?Q?6mz6mSaPReLLioYRxfSLsoec8ngKLUdyGpoK12FAfnJk5DFLhWx8TA+C8dMe?=
 =?us-ascii?Q?Zv0/c8Mvy8UCp2rRKUmr3QY0e+VCjRMlCslmawpQT3QH7QsjySymZCs4bflA?=
 =?us-ascii?Q?ze/8zGhOIlsI0z1txUbsZr/MDTrcpASXPZiWxEMORqbM1bW9BzVqS2DhEIcy?=
 =?us-ascii?Q?uE+GWx4GcqrQYSX6U1/iMf4YE1panoyJUbPVrGj3/iuPDe/UPWQQ1/sYm3FA?=
 =?us-ascii?Q?gOAkcrh071RnPDbWxbc8W/TKRbwtc5SRhpW60UfngirJIcnrySEyHSqHL1RV?=
 =?us-ascii?Q?4rPwdOHTRjw/MF/xa71Zo4A688w1PXGBSy0xx1FvEs2+8n3HqHT2a4eOSFJ8?=
 =?us-ascii?Q?e0qO4wWXpp35tN7H2YndeKy1Kc72RNZRFpiLYh/QtXlf/O2Udk38NhUvJR1/?=
 =?us-ascii?Q?kBqJ25eQYKJp5P3DW+Vn0JPdnsIUm2cN6/dOByD5FKgu3nOqgHuTgGi6F0lZ?=
 =?us-ascii?Q?uxv5ew+JnYCX5gLGR8ZBR6HG8VhmgTKJ4zccZKUVj3ZZHqoABte7CBxKoaGS?=
 =?us-ascii?Q?JrIwB4ZkNjccNBG16aJwMrWdajYs5mrCorFXpUZqP7j6PkmhZHSGL2H3penp?=
 =?us-ascii?Q?tAOrqnJfdeGedeFTaFEZ3xtM9as2xWMHlmHXE0tUBDXOo38/bTSwJZ8bg1xt?=
 =?us-ascii?Q?vKmfuxVXYvokH5fz938P/0fNcCY6STxuhNmKKSiYJh6Zaxcvo+auTwVN096G?=
 =?us-ascii?Q?MrQG3aoVfcYbAioS3cWzA6k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99da5e0c-1ca1-45a5-8f2a-08de0b097bcf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 10:07:29.4484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1cfotEVBKEIdi6fFIlb1mA9K6cFABKmRgEaZwQtAe7LU8b17nv42DUbpykhk+OHJxYYZI9u/Of8EE8fmpLYrCXM8jTJM88qOeu2P20GUpyWqltfTDGKxTw2iNTk4HMf3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8393
X-Proofpoint-GUID: qApETR-FLyhv0fNeCBKohDrK0QFYfGnf
X-Proofpoint-ORIG-GUID: qApETR-FLyhv0fNeCBKohDrK0QFYfGnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDA3OSBTYWx0ZWRfX7ZTo3m87uyNZ
 0+AAnvTL92DQ8X85jJAGDHg4tc04gxTkaKzBkEUIY+bwP5KO616ewbkPaGWs8giSH6ykR93ORE3
 NSA8mWy+k4kYNx4HjCNVLCgCUWMe/FmlV/Tck50XXZVzeh9Rj1Pmd2w36y+qnKm6qYQHnbnW/Xl
 Dsu5wWdZV7elF+nAURrVuYgC8rFsYkBt67ryanEOAsepZhEi6BIPBdEZ/ItaoQxdILeYuJhQKik
 m9sN4rNCxXM4myS34/KlzIHkPfI5O2bepJ6SrCbYHnoDWO7U4fL5JxRtx2vb7qiqYigd/Cl6DTg
 VPNQ71PZtJMtAsIVDBnDkxJW5uFvSZB6kkqVO6hvmwDd6VIr4+tvchm7VEpo+8VdSTlE6X96wnR
 1vk2f3Z0EY58nT6tNsxF3UGT+jWJYQ==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ee20e3 cx=c_pps
 a=0llFe6yxug+qBfU07gGDXw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=_bdpGUadP6oYtCda4rUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510140079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:07:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224815

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Without a specified ABI, rustc panics with the following error:
|   thread 'rustc' panicked at compiler/rustc_codegen_ssa/src/back/metadata.rs:394:21:
|   No ABI specified for this PPC64 ELF target.

This issue was occuring because of the following Rust commit:
https://github.com/rust-lang/rust/commit/9c1180b6238d163fc384d60d85647385d9210343

As noted in the upstream changes:
If the flags do not correctly indicate the ABI,
linkers such as ld.lld assume that the ppc64 object files are always ELFv2,
which leads to broken binaries if ELFv1 is used for the object files.

Because of this, it is now required to explicitly specify the ABI for PPC64 targets
using one of the following:
"elfv1" => EF_PPC64_ABI_ELF_V1,
"elfv2" => EF_PPC64_ABI_ELF_V2,

If no ABI is specified, the Rust compiler will panic with the error:
No ABI specified for this PPC64 ELF target

To address this:
- Set 'elfv2' for powerpc64le (little-endian), which mandates ELFv2 ABI.
- Set 'elfv1' for powerpc64 (big-endian), which defaults to ELFv1 ABI.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 6e6b500f5d..0c7e3c0090 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -403,6 +403,10 @@ def rust_gen_target(d, thing, wd, arch):
         tspec['llvm-abiname'] = d.getVar('TUNE_RISCV_ABI')
     if "loongarch64" in tspec['llvm-target']:
         tspec['llvm-abiname'] = "lp64d"
+    if "powerpc64le" in tspec['llvm-target']:
+        tspec['llvm-abiname'] = "elfv2"
+    if "powerpc64" in tspec['llvm-target']:
+        tspec['llvm-abiname'] = "elfv1"
     tspec['vendor'] = "unknown"
     tspec['target-family'] = "unix"
     tspec['linker'] = "{}{}gcc".format(d.getVar('CCACHE'), prefix)
-- 
2.49.0


