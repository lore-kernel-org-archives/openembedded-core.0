Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8583E67495
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 04:21:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74215.1766377306772218198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 20:21:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nDI7WD6w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4451f72a3f=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM3Ka5G1885237
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 04:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=bAnd0J+7s
	pvxmF7UDaj5OwDfSmQThImdhvQAa0t0MQI=; b=nDI7WD6wx63begdrPIxy+Mf9U
	AD0s4830O5rmteuKzuLyFy7BNfHeJFtlY4vnpel+gdvguVQrIZK2H/onu53WNCYi
	/If6Sc/KpHjo831dYGVOu2DPQ/EVmFP+WZ0VR+/cMPphllRrbNhXJIvoG9O4m5TL
	S2R3dtKTIIDE3k4HLkNrZwQ+ZmCD2zIMBVPDbSRv6f/i8mhnmKR41j+ehLIUGu85
	adJ1gDfV3W8BmaALRPouJ5+X2ZwkKd9EwTNTaxHiNvem5eNeJCwj/2prpVXS8JI9
	HgAzHsE6DF/jDJHurMzXU//TVIuCG0vOleLMBzi2WuQC1xjL+4+33mtMZsy4w==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5js71cxd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 04:21:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iKFq26yr2YBDWLPE3AZpgR03mBjdEbOAVHHNf3jKLTqkQmKRdU8YVcuSeCdSWFu2jhGnSYSjczGn6mZuJjmIaoWhYTHAauyUVJqrg63k53/niAS35QJKdz1Fw6jwxPdVjl34LlOUE1E6hQAFr09VhGA/cFZw5GXH2kEz3smE2yEbYOgRmlJV2TE0Ekkq1P1bhdIMdG9bKDWuJ3snbh5YXuOxcGXXz5dNSQTVXSBnYGqp746FzUmYs2puUNlh8c6qAyrmgK2D5nTycZD131OnZSQRS+r4SBN8Acf3xEyBGvxiTf091exfoQh5/DQD7tZ9v261Bj/cp8zOqfsDs1q7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAnd0J+7spvxmF7UDaj5OwDfSmQThImdhvQAa0t0MQI=;
 b=wN6CIEc1EZqtalqliCmQCeogevY9y8LBbpjL+OfSv/0ruD+c/Hx+gabBJu1+pav2Gh+CvI39gqIl0M6dgG4kVgF2PdBLLd+Jr4QNTCI8PKA4kGL/18oag9OWLmyk6+bwU+GHTu07oEmtp2Hzpdnj2XxnF1jt21+DQLS8AfHYarVn38AMLh8zBodOSb8SZk2gpmSA18apxYnEERXMmTRVmniVJNXBVsLQrgbgIwe0p8H46g0rQLcB10Ut6xEKoicLE0ZsnxQ0sjacmOCY8mEkfY8d+63uW7/a2qHyIDoEOUi55rtWhC+nU0vS7PI7nnqStsK9vBeK5DJOlxe6Mmngyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by LV1PR11MB8841.namprd11.prod.outlook.com (2603:10b6:408:2b2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 04:21:42 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 04:21:42 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, raj.khem@gmail.com
Subject: gdb: Upgrade 17.1
Date: Sun, 21 Dec 2025 20:21:23 -0800
Message-ID: <20251222042123.315327-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|LV1PR11MB8841:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b2360c-2914-49a2-b0f6-08de41119c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3vgzbD9vSjzcGY8yXklESxHq2h6igDn/DJui8wl293V8of4G2wFbp0IpRjk6?=
 =?us-ascii?Q?6zYgRktqmvampTbxsicXOfP8gqQJR/I/eRp7u88sjOkQZEuRByRxlh1bJTb/?=
 =?us-ascii?Q?lGUph2pGghv4ygoJaeycwnvxG+825knzw7S/vpWvBzJDl7y9L6Yj5hDIMh3r?=
 =?us-ascii?Q?oaMwBxVkCBj3O7ql+GCJiEc8juX+L/wxsZTx8f/5YtqV5xqXUKi5deQucXv7?=
 =?us-ascii?Q?Q3lTnqIS2ICXr5mdaKfU9vgDxsKFsSGG1XxXnDYcHNIyjQGELKPd1utUCr4K?=
 =?us-ascii?Q?otF41D6hGfS8iXsJD8hNLAF64VPbhpYH/ljpwnnjOSyUylWhsCigdBkYYLAb?=
 =?us-ascii?Q?LoBr9A5mCAArCk4dbzc4c2eeV/o/VDQ8+4tz2Kwz39NGfRW960b3Dhpg4VSG?=
 =?us-ascii?Q?WqZPaEHyrEt7Zt3Zf2ec+qPIZuj+PmnshHZLlnPdPCDQieCDsXYok1WZAYnK?=
 =?us-ascii?Q?M9xRsMXQYXCbKFoIMCNiWRFlHDQrExsxfgBeEkQbHoxlkStEofbWvfitWoei?=
 =?us-ascii?Q?cjtBDWvxRKMSFCcylsruuOfIlZMO9YmNrOwX3CSK4i0t4ZHY6H3hh9JMMrZg?=
 =?us-ascii?Q?rbB78KA9zZksJFeZM/UwC0qNjWZ00WRTVpAQK7LuYei44HZAMsZIJbgD5IGu?=
 =?us-ascii?Q?LADiSS6S57bCnSTtK4ASzeEEQ2kSak7bfRrr3vD7GYU5uGhHra+8yby8+80b?=
 =?us-ascii?Q?IUx8JXGrS497aDxywo9z5kqwlLAYBwUyUCmtXjN1BkScyUu/qtfN8tRRfb/f?=
 =?us-ascii?Q?aF8WFoM6PLyjIkMZHOwMEwi9wvHDrrEs21FkdQnhrvUejEQflbyf1AZBuQCX?=
 =?us-ascii?Q?J9xyOrBgoCevNItvoKyDYers8/GpgrKzMbJTxjjRepQeWtTbvAN6jQIdUuDl?=
 =?us-ascii?Q?1kQ9uKUPbX4GBWevS7SqRXyYT6p/q6V/1KFB+lKQLLF1wt2NBhiLNgNVGK8R?=
 =?us-ascii?Q?qjKw9B2m89ZL+e4xbWMI/aI6zp1OEra7NmvnKB3QmgagoFbq6+zoGgjA2aTY?=
 =?us-ascii?Q?lZFT7Pr5NSVo2TxTaxojlCQr4CLjgzZPuyKA83Lf488OxqZi5ad+LHkyj9cV?=
 =?us-ascii?Q?kh+IdqVoTqQ0bGVpGVcSliv4HgM4gigq0C8jv3KsCXAlumXMehq0QJPI3ia/?=
 =?us-ascii?Q?NiPlnZpkDDvc5jIOgGOapDXIkIdawQfr4DOP3al3vvPhgNJKHJ7iPiyTsWKW?=
 =?us-ascii?Q?tUElweaEPumjTwll6scXYws7sO5PGkNQCsxL6zjQsB8WLqMwB6qh1708bAb7?=
 =?us-ascii?Q?HeGW8pjDb+mW8VIhOds5Ryj4rj4/j9Y1ik1oJHFExE6vXIGehimjHnzfJ75P?=
 =?us-ascii?Q?3wRv/qrVqiuz6MkYMSec6I2e+bH4mrQ8dCqwrcnr3V6/l8soP6jPM+TXMXhr?=
 =?us-ascii?Q?SiWfg1frfLVCX3eQ3+6ZM0V2Unc7mQVDiaqnJZvtyajlPYdukv0ucWruhmkX?=
 =?us-ascii?Q?0BD2vEavc6SZuM+IIG1pR2YoIipD8MTjHQW/gLIvlxRW/pWxrYnRZQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Lw5iED7vSYm0a0c+BCnjyXf/qtHD1LAIsbthCcg38qpl33OjTGAmMrYbDNhn?=
 =?us-ascii?Q?ErokXjUIZnqYh1UTWw6xqWb18FnXbfJK/9fT+J+7IRcjRpedX4knDyc9FRAJ?=
 =?us-ascii?Q?u54j3Ufzww5/p+2aWFi9Nj7c2CpSm1+JNdhriIhl8QMRnmdFuHrm8XK8tVzz?=
 =?us-ascii?Q?J0Y1ndtrVZ5JgTTrI09qwYxbymAtNkAiyN++4/rjlUKedJB75mQIZJwaVIoX?=
 =?us-ascii?Q?GvrQWZWYBOA/ZNHlzY1hZ/oDeEG+2jEeXPoO91LrtsYbehkNTnQeHyu86cjQ?=
 =?us-ascii?Q?KLw2YTEr3LUpzLdR10RsOGpcZWgSZK38ZiXguOYZaKpNaXjjH1XkCmSgObCA?=
 =?us-ascii?Q?bjRPTjqqPnkjCev4wgj/tmHHu+SrRgQkFVVBUsN/jSRxf8rMGVWhOIlbX87D?=
 =?us-ascii?Q?c5OTTD6+8UxEYI69xIUU0GP46rtyWTDeZIQmt4VstrQkl3IbmskzX1IiNvk6?=
 =?us-ascii?Q?8ZPKC6nzIjW6E7XQq+SiT2vsxgUDiP7ulIMwn1GlM5UU61Efa3kg8t6CSsfK?=
 =?us-ascii?Q?66d2XHj2XpRrfN9kg4xwRNwP9EEH7tu4ICb98byh/OyiEvxJoMvYXh3KThE2?=
 =?us-ascii?Q?0GK4q9GURc5VDAlsYtnqqJ4jldugL1LOZokED+RLJRseX2+wKmP8Y33j2bUK?=
 =?us-ascii?Q?lPxNmFo8BmwX7Q5mLJ7rCyPU17VOGDDfTF3/EVorTP9mW66qrfZeQ8PsilUV?=
 =?us-ascii?Q?vp1pnzHEzBRiWIIA5TxBRrR7ULgxc5gg7Detn37kTfSeRvzMspDO2Ma2Dg88?=
 =?us-ascii?Q?5rQw8gPLjfizuv0z/5KfC0mpc70UbaJHj9BXPjv9xGE8ayHaWgPiPrF21unW?=
 =?us-ascii?Q?6vtrpsDx1EZ/VLwXdTUJrLFEzeKlXbXQ3C40x9vrBADYucsvCNEJOIUlnN+r?=
 =?us-ascii?Q?jpYRTThUbsJRwsdiYD29x9Rhdd87KI4nuY0DcIiwaRQm13Y0rE6gVSdFNm5z?=
 =?us-ascii?Q?iPPBFvdEmjKSqAWwkdWWmgIDi64RJrz8AG7Hpg8F34LymJ1yDQ5PCg915kWK?=
 =?us-ascii?Q?HpoLRGNz3zeJUtq4a15SQjvzgQVv1T7cC2/paEhXx5sBDuUoBQk2eST5gZr7?=
 =?us-ascii?Q?MFF7inNAcr+Xb5z48ILa2vKX61quPMAZd7zzSxvDB/LqkmmMgZFcaYpO6gKj?=
 =?us-ascii?Q?EFphs1nvqAf5h9sr12jhjrDvN8xEHtqc6RPqzPeVx/6nq4P7KR16mNVS+1Nv?=
 =?us-ascii?Q?wjLed6eXBV0Ep9YU5SsyGTpjJR+qVyPw09SoIJcQFAvYlizz9wbAHr93gY+M?=
 =?us-ascii?Q?sErxCcSAwjcIMeg5UlGnRP54MbWkDNp/QZj1+kepPrNzNg8qcBIUkiGgvxJr?=
 =?us-ascii?Q?0BU0HGMtL4ChkpqeMoprpMOc+qPwAFAuBcdZQJ7lV2umoz3bKvV3HRxO7now?=
 =?us-ascii?Q?8nlGIb6t5mY8ymTuklstncMhdQJlHdYf2QKDgKgDJK7H7ulB34kWY7a7HUFQ?=
 =?us-ascii?Q?v1cCaSOHakfc/+7u+ZnbqTdRN8a8tJLN8rWqXoYZQy3eqSkNLsfv9ddQmQsb?=
 =?us-ascii?Q?FKvzwfpy19uUfX1r5pCvzKgHcz47RlR2LdeaLY8LBoOJ1q86b+g/8fT3jYjd?=
 =?us-ascii?Q?c0RCNWlplD2Vc3Mr/yBOgbteirJQQeUrsPkJLxNb2YVT4ecBAf/kxSwpzfrx?=
 =?us-ascii?Q?rhlKBWHc8UPzwefkWnuJak+qf7yddwxgklN0FRAJFQ/RfwdiHR/rGr0Q2e7r?=
 =?us-ascii?Q?/nVE7r2nhxTP7aQQyWw+i853JG64lyF1icfCSkE7rNv8I/3SFP0ympqHg/FC?=
 =?us-ascii?Q?+yh33DpCjvUO+42vPbSMQSSQv77O4Mg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b2360c-2914-49a2-b0f6-08de41119c20
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 04:21:42.3962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7kAE0oUWv2d5FT4sl0cGAlHP7+LTCUp7t68gJbiqQT49VV5zfN/Qe1V22kzJE8EF6I4TPPBdIsTMCb0PCEuXLCRIgJlrkxI7K8VK4neTXoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8841
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: pCnD5qJ1gPhOmJ-n9Eb4dxT_NRwhPopm
X-Authority-Analysis: v=2.4 cv=To7rRTXh c=1 sm=1 tr=0 ts=6948c759 cx=c_pps
 a=KTjCFeyF3Vp3atYHcTGfzw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=_Av4LFCC2tL_8mt7_qAA:9 a=iPGtbt74fZXhYC1z:21 a=ul9cdbp4aOFLsgKbc677:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 9X0tsjGaP8rlTyRJUW1kOp6gwm9k-uYW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAzNSBTYWx0ZWRfX6BxNA5Aa2K2y
 v+IivgpVDStQn79REmiXW/+MjPyzlDNLTUCUrnjDCW0f93cJ6TPH6rSVIQlqD3Q8BIZp3KLrbwq
 7SPHkWU8pqe1zEQTqhJ8SfUE1HwbUefoTjaESawZvvARbkwoCCF2uQbjUOAtex0e0JyFV/3y8vI
 Y5RYSMgzFsrsFVPb3/WFmGn3bxZIDyltufNFryHiDlUHVm5cbvWOkovkx7EcWoXdhAfjzSGHzvx
 Cdqd3A7YiMi/XOKun0L/mk1K2wbuKI7NbOr+weCkWTYSa/pwoh8ttFH5zzl9+2NYqFK8v8mlLEF
 /smgiGBdxMU4g1OGgyIp2+lU9ySZ+DBm1YerQm3OqEktWYbAwSuC3AypMkkYJArmNFBg8oTu7Jy
 Y8a4RKWH0Wj74slEMHoYdaDhwUPNFvPasvHJDA+XD16pcnwf2wgokgmXMqg229Jnqt2Rz79fpLq
 NTAnxf4x1jKoa/YYhEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 04:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228280

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

GDB 17.1 includes the following changes and enhancements:
https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=blob_plain;f=gdb/NEWS;hb=gdb-17.1-release

 * x86-64 CET shadow stack support
 * Debugging Linux programs that use AArch64 Guarded Control Stacks
 * GDB record feature now supports rv64gc architectures
 * 'info threads' command support for two new options '-stopped' and '-running'
    to limit the list of displayed threads.
 * On Linux and FreeBSD, the addresses shown by the 'info sharedlibrary' command
   are now for the full memory range allocated to the shared library.
 * Linux checkpoints now work with multiple inferiors
 * Improved linker namespace support
 * Warnings and error messages now start with an emoji (warning sign,
   or cross mark) if supported by the host charset. Configurable.
 * Built-in support for TLS on Linux as backup when libthread_db is not
   available. Supported on the x86_64, aarch64, ppc64, s390x, and riscv
   architectures, when compiled with GLIBC or MUSL.
 * New command "set riscv numeric-register-names" to display risc-v
   registers using their numeric names instead of their ABI names.
 * The Alpha target now supports target descriptions.
 * Python API enhancements
 * Support for Python versions older than 3.4 has been removed.

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 ...ian_16.3.bb => gdb-cross-canadian_17.1.bb} |   0
 .../{gdb-cross_16.3.bb => gdb-cross_17.1.bb}  |   0
 meta/recipes-devtools/gdb/gdb.inc             |   3 +-
 .../gdb/0009-Readline-8.3-alpha-release.patch | 164 ------------------
 .../gdb/{gdb_16.3.bb => gdb_17.1.bb}          |   0
 5 files changed, 1 insertion(+), 166 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_16.3.bb => gdb-cross-canadian_17.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_16.3.bb => gdb-cross_17.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
 rename meta/recipes-devtools/gdb/{gdb_16.3.bb => gdb_17.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_16.3.bb b/meta/recipes-devtools/gdb/gdb-cross_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_16.3.bb
rename to meta/recipes-devtools/gdb/gdb-cross_17.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index a36f78fe67..97d50123a4 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -13,6 +13,5 @@ SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0006-Fix-invalid-sigprocmask-call.patch \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
-           file://0009-Readline-8.3-alpha-release.patch \
            "
-SRC_URI[sha256sum] = "bcfcd095528a987917acf9fff3f1672181694926cc18d609c99d0042c00224c5"
+SRC_URI[sha256sum] = "14996f5f74c9f68f5a543fdc45bca7800207f91f92aeea6c2e791822c7c6d876"
diff --git a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch b/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
deleted file mode 100644
index 206b4baaf0..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0009-Readline-8.3-alpha-release.patch
+++ /dev/null
@@ -1,164 +0,0 @@
-From 8807681557d9f30aac819186369ee62f4f8d1d96 Mon Sep 17 00:00:00 2001
-From: Chet Ramey <chet.ramey@case.edu>
-Date: Mon, 22 Apr 2024 10:41:37 -0400
-Subject: [PATCH] Readline-8.3-alpha release
-
-Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/readline.git/commit/tcap.h?h=readline-8.3-testing&id=69e5c5e4c9778bf86c3d1c6b058ddece70854de8]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ...ap-Add-function-parameter-prototypes.patch | 37 ++++++++++
- ...d=cef614441f99b7b6e444ba601d8465a6e88f5a98 | 67 +++++++++++++++++++
- readline/readline/tcap.h                      | 14 ++--
- 3 files changed, 111 insertions(+), 7 deletions(-)
- create mode 100644 readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
- create mode 100644 readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-
-diff --git a/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-new file mode 100644
-index 00000000000..f28e31fd0e0
---- /dev/null
-+++ b/readline/readline/0001-tcap-Add-function-parameter-prototypes.patch
-@@ -0,0 +1,37 @@
-+From 0c16af6ebf0bf81138c973e5e6a7c4ebf71f2489 Mon Sep 17 00:00:00 2001
-+From: Khem Raj <raj.khem@gmail.com>
-+Date: Wed, 30 Apr 2025 10:41:12 -0700
-+Subject: [PATCH] tcap: Add function parameter prototypes
-+
-+GCC-15 with C23 dilect defaults expects full function signature
-+
-+Signed-off-by: Khem Raj <raj.khem@gmail.com>
-+---
-+ readline/readline/tcap.h | 14 ++++++--------
-+ 1 file changed, 6 insertions(+), 8 deletions(-)
-+
-+diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-+index 859e6ee..2b22ff7 100644
-+--- a/readline/readline/tcap.h
-++++ b/readline/readline/tcap.h
-+@@ -46,14 +46,12 @@ extern char *UP, *BC;
-+ 
-+ extern short ospeed;
-+ 
-+-extern int tgetent ();
-+-extern int tgetflag ();
-+-extern int tgetnum ();
-+-extern char *tgetstr ();
-+-
-+-extern int tputs ();
-+-
-+-extern char *tgoto ();
-++extern int tgetent(char*, const char*);
-++extern int tgetflag(const char*);
-++extern int tgetnum(const char*);
-++extern char *tgetstr(const char*, char**);
-++extern char *tgoto(const char*, int, int);
-++extern int tputs(const char*, int, int (*)(int));
-+ 
-+ #endif /* HAVE_TERMCAP_H */
-+ 
-diff --git a/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98 b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-new file mode 100644
-index 00000000000..02e665b143b
---- /dev/null
-+++ b/readline/readline/index.html?id=cef614441f99b7b6e444ba601d8465a6e88f5a98
-@@ -0,0 +1,67 @@
-+From cef614441f99b7b6e444ba601d8465a6e88f5a98 Mon Sep 17 00:00:00 2001
-+From: Chet Ramey <chet.ramey@case.edu>
-+Date: Sun, 14 Jan 2024 15:19:37 -0500
-+Subject: Readline-8.2 patch 8: add missing function prototypes
-+
-+---
-+ bind.c     | 4 +---
-+ patchlevel | 2 +-
-+ rltty.c    | 3 +--
-+ text.c     | 3 +--
-+ 4 files changed, 4 insertions(+), 8 deletions(-)
-+
-+diff --git a/bind.c b/bind.c
-+index 971116a..2596006 100644
-+--- a/bind.c
-++++ b/bind.c
-+@@ -1167,9 +1167,7 @@ _rl_init_file_error (va_alist)
-+ /* **************************************************************** */
-+ 
-+ static int
-+-parse_comparison_op (s, indp)
-+-     const char *s;
-+-     int *indp;
-++parse_comparison_op (const char *s, int *indp)
-+ {
-+   int i, peekc, op;
-+ 
-+diff --git a/patchlevel b/patchlevel
-+index e340b58..6c10f12 100644
-+--- a/patchlevel
-++++ b/patchlevel
-+@@ -1,3 +1,3 @@
-+ # Do not edit -- exists only for use by patch
-+ 
-+-7
-++8
-+diff --git a/rltty.c b/rltty.c
-+index 882a3d4..a4863ac 100644
-+--- a/rltty.c
-++++ b/rltty.c
-+@@ -80,8 +80,7 @@ static int ksrflow;
-+ /* Dummy call to force a backgrounded readline to stop before it tries
-+    to get the tty settings. */
-+ static void
-+-set_winsize (tty)
-+-     int tty;
-++set_winsize (int tty)
-+ {
-+ #if defined (TIOCGWINSZ)
-+   struct winsize w;
-+diff --git a/text.c b/text.c
-+index 91c3f33..30fdaa1 100644
-+--- a/text.c
-++++ b/text.c
-+@@ -1764,8 +1764,7 @@ _rl_char_search (int count, int fdir, int bdir)
-+ 
-+ #if defined (READLINE_CALLBACKS)
-+ static int
-+-_rl_char_search_callback (data)
-+-     _rl_callback_generic_arg *data;
-++_rl_char_search_callback (_rl_callback_generic_arg *data)
-+ {
-+   _rl_callback_func = 0;
-+   _rl_want_redisplay = 1;
-+-- 
-+cgit v1.1
-+
-diff --git a/readline/readline/tcap.h b/readline/readline/tcap.h
-index 859e6eed5aa..467ea60e903 100644
---- a/readline/readline/tcap.h
-+++ b/readline/readline/tcap.h
-@@ -1,6 +1,6 @@
- /* tcap.h -- termcap library functions and variables. */
- 
--/* Copyright (C) 1996-2015 Free Software Foundation, Inc.
-+/* Copyright (C) 1996-2015,2023 Free Software Foundation, Inc.
- 
-    This file is part of the GNU Readline Library (Readline), a library
-    for reading lines of text with interactive input and history editing.      
-@@ -46,14 +46,14 @@ extern char *UP, *BC;
- 
- extern short ospeed;
- 
--extern int tgetent ();
--extern int tgetflag ();
--extern int tgetnum ();
--extern char *tgetstr ();
-+extern int tgetent (char *, const char *);
-+extern int tgetflag (const char *);
-+extern int tgetnum (const char *);
-+extern char *tgetstr (const char *, char **);
- 
--extern int tputs ();
-+extern int tputs (const char *, int, int (*)(int));
- 
--extern char *tgoto ();
-+extern char *tgoto (const char *, int, int);
- 
- #endif /* HAVE_TERMCAP_H */
- 
diff --git a/meta/recipes-devtools/gdb/gdb_16.3.bb b/meta/recipes-devtools/gdb/gdb_17.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_16.3.bb
rename to meta/recipes-devtools/gdb/gdb_17.1.bb
-- 
2.49.0


