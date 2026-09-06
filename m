Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE08C79F8C
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 17:18:04 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15765.1788709200104002823
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Sep 2026 08:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FrvJHFAI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.168.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 686EWHjf2096337
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Sep 2026 14:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=unrdTMh8DxYuMRAgXLnvX3oz
	gaPwjd7VIPppnhzke3w=; b=FrvJHFAIxO8fXK0itUoP6ImXnMzwHQXuRkcfZKgL
	HcrQw62eUmS1TUhIUbwV29ucYD2B892F8RvHYyvmDYL/UrtHDF83eW6mc00W8H3J
	sgq7aXx/qXhQTEyzF1S394GlZDNPNkSmF7FreFqZmE7HuSUTHidYdNywmiWZHh9q
	jMfU9ANaLoB0eEiigUCQWOn90uz3HLG85hrFaiPVJNvM0heuK6QFBJyRitrVCoIu
	FMbFg5byywlr+Mo1mSWeWOHqRevcLKzQkGFR9uKu7uOPMW0Wp2oGPy6/LzVt1kf9
	2NXwNMyL6jLl1Iec0K8aSNwge+05dw4UG4EtHyH/30Pb7A==
Received: from sj0pr08cu001.outbound.protection.outlook.com (mail-sj0pr08cu00100.outbound.protection.outlook.com [40.93.1.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gga1s3swh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 14:56:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=un8qNe6UXWzqdzH52kvJbyMSykcaPzHg9NEchv+cXLDDy5KJbYLhWTKoexYR947342KYW9pm7F1+/TGe/KrXoAvNltVpPoIFSYLITQ5S1TkFu2Rzpe0DDU+sTY7cbLY803DqG7xTJ8XYCPb2AFOip6NGH56VeqJO+kruLMgiTa0KQeqhhn7JyO1TnhZHe6IsdyPSR+pVWhHSwvXgaIMoNkbfBtDDfkj1Js7TaLEtz0uyuWTT75La3gLXtS8oLW4dVq+EjjADKGe6lDL7KIiKNmEu+cMcVh5+PFsmauDEHmtYismt/f47mIyIg7v1h/l3lp59UQax5DaJmq3gOJEdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=unrdTMh8DxYuMRAgXLnvX3ozgaPwjd7VIPppnhzke3w=;
 b=PHGG/SvNzk/bJmN3uny0rvV5cQ4WsS8vvJOklCX7cvSNRjJbd7dZiLXnFWsNVxQyDPt55oXlj0P73X5os5Z3SxMROgYJwXXcBQxqlTnySM3SRSISzZlcJDsm1GSstZU5m7SYofXx6deiDhcJk9MPdCuXe+54A39PeIytV571FLNaoJY6oax59vDr4fJWtd0fOQ15uSIiCU1u4gELD73cvG8rJaR56yWbSk9xkMLXU0gwHy+3eCk0YSXuIMXh7CDlryIWTIyoRlXNIbHQLBahczrBkl1RAhCt2TaxtYa75lLlPtwj2+gY57mn3hjoKzuUXiu8EACRGaXyObO40tHSmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 CH2PR02MB7078.namprd02.prod.outlook.com (2603:10b6:610:80::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.14; Sun, 6 Sep 2026 14:56:15 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0382.007; Sun, 6 Sep 2026
 14:56:09 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] initramfs-framework: support LABEL with root-only udev trigger
Thread-Topic: [PATCH v3] initramfs-framework: support LABEL with root-only
 udev trigger
Thread-Index: AQHdNvikgVzyYzTxtkKHUA/UUKqfCrbBsMyY
Date: Sun, 6 Sep 2026 14:56:08 +0000
Message-ID: 
 <DS0PR02MB9197379FF0B8661FC47959B3EAB32@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260828142121.84508-1-wenwfu@qti.qualcomm.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|CH2PR02MB7078:EE_
x-ms-office365-filtering-correlation-id: a6fa509e-74cb-44c7-4c13-08df0c26fc37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|5023799004|6133799003|18002099003|22082099003|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 tAo6fJQ24fwFnJL+jY1/jsnlJLOe4p2c/vN34xoxCHLXeBrj+XS/+HW5FwvCRupyrYTRjK3FkdDGpU2GoTIEoVczK5n0z8AlSx3euVOi3Gr6ro347WWkZ+IUOkZwTwXX+K0xOo243TcKLsUDTMAODggoWL2OabKL99R3UY9ZjkCamMNQlTlslDVuytubnGRTEW1RLJGWxDMgspA18AFx28878r9qDzqcQTxB8LtDNSEw3nWGHai042esC22GJ9g9ZFBMw/tEKLr+F/OGvRVNfmMJ0refftoj3uWT9gcyyFwlb1TYkhJRPDnGKvrlGBNWjXg9NTvYjxhg8rtEfxmq1bGU0aniBOChz052XFST91lhQZaGsyh3IlsZv+JNh3N6rGvpUwwjXnML6qPB2tfHxwJ3TdqOCWY+NdWb6YZ6uuwM3NzKeSQyEi8o0YputvAm/N7ckpjCDtorD+CGO9X135991g0vlepfxwcXgZJM01SW7xwfw5+RvVuUg8DQ+GQf0CuJPfmfsEvYG4ys2weIDPHRhnxe3Kk5pmmgHytDi6RkFm1L1cvkmPpCvAjuagQTU2V9TU66rNhca1WI0q25AGjhFSGRTLLoqx79U9GL6xiLwOeGc6BKLcdNnhZt9yw+xI5fA8Aoji+pOFKww1QhmlK/FNrG0m37oDGDu5dNiwCdvPLnUf4lsKefLzqL7tG6jdQVXUrXrxrmVxYthlT2P3Z107G3VGcPueTI9sK89kI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(5023799004)(6133799003)(18002099003)(22082099003)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?8Dn2+bEiJ05LcCRQaOmgE9nS0NxECqT8ABK0TrCBHtGT8hNYIJye6aSDxIjQ?=
 =?us-ascii?Q?VI1brgLdgN7RtdSF+y6hfjtPWHlobHmhVY6sdMowlhsGOR99N/DKm5TNWDSK?=
 =?us-ascii?Q?05KxkBcwFvv7fwB23uQ/YrdaYJS3ykdBqQCXxwnQtR0fozJLFa8UpuT8vpve?=
 =?us-ascii?Q?zCN0m/1jiTK7dFUtoFtV+X6JwbUcohRk0CIPSGnSyjYXMC1CG+9qo3B3wfUw?=
 =?us-ascii?Q?NSrsOBJOwp3cRWstfVc6PsH2DVl1uRdZiOIF3fPciKFgyAcP4UjBUbXxoqPZ?=
 =?us-ascii?Q?xR6TLL64vL3YYkXTMbShTn1PICEVgwDPfQsZjxuYlksMyMkTugYPskWrG8q6?=
 =?us-ascii?Q?dU2tY6iSpuo8KXHdSNW9H1VNKTA2WLduqNTq8QI/IKt6rKKBP9RqgCBH6IAY?=
 =?us-ascii?Q?oK/FOStpVRYrp+oXJSlKgEAXUTAfi7Uyzyj58W2ZN5JFSRdXrv5QioJ9MtLY?=
 =?us-ascii?Q?3hRZZbkEsrTHcgwRBk+oMoC/Ef0cRQAqfwVZlSOi9v6J0dgNYL59biJwzv2Q?=
 =?us-ascii?Q?n6VWfdrSOUwrvKH5LrJdKTGNEZ78mLELcJUz/t24lNjNhxPVhgG2SrVUE4U6?=
 =?us-ascii?Q?U5O9UrceQtuaZOz9qd7P1IxRqrCnXR9h27TEOTsURVpMkERm8LijayWDt+5O?=
 =?us-ascii?Q?C0N8mlfRJjC/R1c3BzxxExxEcA7gcZ5MxVd90GG11nf/mAPCTJwVir59gC/W?=
 =?us-ascii?Q?4EhhlmV5LRz1Jo1cz+ji46OWbtnnV6LG4ptkgvWWRHnKT6zVRz5VzM3csgIp?=
 =?us-ascii?Q?cyBWT2ECq78OSCCSOvNSkGSmN+PENc/JeQsu9ti+K8LXyhwamiO0EUq2s9Fy?=
 =?us-ascii?Q?EBh7nrF2rt7pGHgZxSu3qtJf6OvrGvpyVBeuRU+RiYEGmlv2RrzdwxqZoPOP?=
 =?us-ascii?Q?L+4Hb7ulgoymrB7BrG/xuUsXjTdcHoFa2OBNqXeIPo0dVJxFVw5RxKRw+SXa?=
 =?us-ascii?Q?Kh6vIAR3yHPou0dGdmwKATUbbfD801MjN0iG2gsenlu19TczPzHqPebfBbM5?=
 =?us-ascii?Q?zv2QzB9Iks47CWqJxaKm1KgwvmRHkMxWS4AxYx7g/cikZittquhGQFflk8Td?=
 =?us-ascii?Q?Ji/h0eWyZnWdZVaW5IzIATl9PeUsBr+PNRb+NWF0hp/GSWYVxhEbsdF8+u8H?=
 =?us-ascii?Q?yiJk0wP3SLVPoULxoNredEpDkhAQG3tGFwEiQeL/KriYe3CjZQV/4MJKLBUN?=
 =?us-ascii?Q?rohIWVitpcIrASWFT53/AmlAeH3q9q8up/lRKvSlbvwjsNsjjI3vDT93DZvj?=
 =?us-ascii?Q?rwQOm08yqdmcgOZTPiNkn+nxkI1i1TUWbPcRMKYfqObK/FOituZIkyJWhDs9?=
 =?us-ascii?Q?de5vTZS2unP8MdbjZZjpEuP4SyVKi7fjGaFunimQzwOtuMMRmZmEtP0PmzMs?=
 =?us-ascii?Q?LkayxrGBVOajz6VNSCoQx6PPkGfSudH9cGdHyfiR9AiCwSE5EFZ5thhqp8U/?=
 =?us-ascii?Q?yuV3GtCsRFKYSKaIxwZWnqp34vGnV7ygmSfFlWygrYjgFTJ08q+dtU5MzKzr?=
 =?us-ascii?Q?uqxty96bqLcjYnyF1omXlt0v8+o8+LbCbFBHtnn/6m+RcoF5gWvQDv9k/kgn?=
 =?us-ascii?Q?tqI6rneaCfWG1ISu5QGWuRZQ8Gr06nzKXPS+xDTAkwGFP98r+IiBwROWunz1?=
 =?us-ascii?Q?Tit+/uQj9R05l9k60eTAAdxeNDwxW2leahDNahWZAxATAKWZGdqM18vnTgBQ?=
 =?us-ascii?Q?RQEcFgx1ITDH1kXf+gi3J7fPak4uuLzKVYYziR4ZYnn7amrQ2yP8IYGQzGgI?=
 =?us-ascii?Q?L9XdQz5lJQ=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	OHaejFF3Y9MXJ57JlsHwI8r5Yx8LiDez4jAuBqHTn3C1SLM4IOPBkC3n+7Fw4U2A1kqJNTPftk2SDIRGeJnCpqjsO1Eq4wdXwjMNivWE9iD7z09wSMjdcYgRTDjC9kf2HYHqVtc/JM22oMyCTkxheqYwj8mYJ5laoiIPSLFrjnK9gyHNO84vo2JiZaSQKgy3qXQpER18+8dGORWiPXfBjCIeLJADiwKk4rgypap+TehyFdeom+r7w948mZXkS+9ynoMPsQpb2nCa8OlmD1OufOWjHXPw9uUB+MD/oVLmshs9+FbLRXvaYCl8HhkTv9hrmrvjTEcnLCDUWbLuAyUTUg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	DBl1bomSYhe9qKCqE3poMEfLKaH1XmfvDz0YkHTe+vzk7x4qfs7ifQGKJNVvocfiqe3pc1P9m7E9NKmMgPL+53LyYJmQWAzI4wSEyVqeD9uzHuTRJYBNfVMboTSIpKcBxTxwP5kxPT1sfCe0BD/YK+0KFZOta0RsEhvKVA4gMQ75Fkk0VpnYjdx5pKb4HuNyIff5NNzRkVQk8T3KnlAn+ZcBmTDfkR2pYl7GVUV1LtQNXAbyLxchqos1UtjbdmKyckF1YFPf6NlMIiHuQUWF3L85V5TdgcsLiZjyHn+OKT84ayWP2P4SMwUIxJFaq3/igBjIU7tVRcTbKe1V3sjxONEajN4GIvQEF7o9OCGcEY3MPyI04gfR9bnHdc8YMcnVb4J0nLd8x3aSijGu6jU/UFMM/UCi72n81T3QovW03rc05jA4w9jhlOARZ2qXHKLRAPNZUZdQUL55QfX6fDHGRdIUoWKweScJ9GNNBX7HJ2eCan6J9VHc5SZdkmRsODAWf/j5w3O+OiiaHiH78nFhQo0wL8iarBsySS2sfyeYBnDV8YvjWi1l8gAhSfX8AzPpYZBwPwIdIDsxbkLracNqDG2QkpinuzXyJ3nkneSfqNUUe/WfdWSvdR8FDlca6fTA
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fa509e-74cb-44c7-4c13-08df0c26fc37
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2026 14:56:08.9172
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hlb6sMQr26clUTENJkvKrYA386HZmYB+MUlcWcOPHLvBQdL5fINfqJjueyNDMunXaiX99NW7GvsXC10TpFTq4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB7078
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a9d7f27 cx=c_pps
 a=uKiHT0CEEWUIj7nPKFokmA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=mO9jZCgL3f2GSkjUF5QA:9 a=CjuIK1q_8ugA:10
 a=EAr0UddeSyx-IgwZIcMA:9 a=kZMW_dstW2Dak_tp:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE2NyBTYWx0ZWRfX+0U1W4E24eLl
 wFQA8Dsiia45Rc6F/+oQpccJrbXFjKVe5XVDurQ2EHmZS5FeqHVAyE2mLmqFSPDhiPrX07lW7JJ
 NtsqCWP8D+6zmJrEfgXdYEppsHVWsik=
X-Proofpoint-GUID: 7_2tj2sOtv6BudOR2qI03EEDpPwAs3wL
X-Proofpoint-ORIG-GUID: 7_2tj2sOtv6BudOR2qI03EEDpPwAs3wL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE2NyBTYWx0ZWRfXxKikOOOTlI63
 w6aVlrWPUYVWlf0yXErJdqL/efyPssRwnkgMhgmkFVQLYw9mvGr3Lg/NYDJ0FSlKZ18r79l8Kaf
 bryrQ7PiD7sXj34XgwPH1YlVkLsYUoD5TzozVYYnB26NN+wJGFE/BohQP3dC1z48cA/8SYZ24I8
 EXsBYbXzxvG8yMo4zdriqJdYH5CdWvDFfBd8ahyAz9wrSRgRFop8E4EVEhOMgKaD11IH9tkf6hp
 gbzs8qbM28AZ540CWBM194CGKydIFukv5PBl4L3wbnEEzt5vgN7cK8wEscR6mYtFmRBDAGEF6D/
 6r2bGupqv/vF4sOJpkwJ/sHxsoQK2TeVexaVrQhyw0XSejhmnGYBuFwawRL/S4QOhU5it1/af6l
 rtv3kVvPLzR9yEDJ9zgCJOQBkO3cLjFpPFWrWYLtP1Nclu7R3Unzbzgc2YSSCP/2WaFE+c2s6fz
 09VsO0lTUX/6OrDbFJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-06_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060167
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB9197379FF0B8661FC47959B3EAB32DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 17:18:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245209

--_000_DS0PR02MB9197379FF0B8661FC47959B3EAB32DS0PR02MB9197namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on v3 of this patch.

The patch adds LABEL support for the root-only udev trigger
and has been tested with bitbake -p, the initramfs dependency
graph, and the allarch sstate signature selftest.

Please let me know if any further changes are needed.

Thanks
Wenwen

________________________________
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
Sent: Friday, August 28, 2026 22:21
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v3] initramfs-framework: support LABEL with root-only udev =
trigger

Filesystem labels are not available in kernel uevents. Add
util-linux-findfs to initramfs-module-udev and use findfs to resolve
root=3DLABEL=3D to a device. Read the kernel-provided PARTUUID from sysfs
and trigger only that partition, falling back to a full trigger if the
label cannot be resolved safely. Keeping findfs out of the BusyBox
defconfig avoids increasing BusyBox for unrelated users.

Exclude the util-linux dependency from signature propagation because
this allarch recipe only invokes findfs at runtime.

Tested with bitbake -p, the core-image-minimal-initramfs dependency
graph, and the sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs
selftest.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
Changes in v3:
- Exclude the util-linux dependency from initramfs-framework signatures
  to preserve allarch sstate reuse across machines.
- Validate the fix with the allarch sstate signature selftest.

Changes in v2:
- Keep findfs out of the default BusyBox configuration.
- Add util-linux-findfs as an initramfs-module-udev runtime dependency.
---

 meta/conf/layer.conf                                 |  1 +
 .../initrdscripts/initramfs-framework/udev           | 12 ++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb         |  2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index b91ce3e437..1ad34b430d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -61,6 +61,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
   initramfs-framework->eudev \
   initramfs-framework->systemd \
+  initramfs-framework->util-linux \
   initramfs-module-install-efi->dosfstools \
   initramfs-module-install-efi->e2fsprogs \
   initramfs-module-install-efi->parted \
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/met=
a/recipes-core/initrdscripts/initramfs-framework/udev
index 8f67e78a7c..85c5ba1178 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev
@@ -43,6 +43,18 @@ udev_trigger_root_device() {
                 PARTUUID=3D?*)
                         root_match=3D"PARTUUID=3D${bootparam_root#PARTUUID=
=3D}"
                         ;;
+               LABEL=3D?*)
+                       # The kernel does not export the filesystem LABEL i=
n the
+                       # uevent, so resolve it to a device node with findf=
s and
+                       # match on that device's kernel-provided PARTUUID.
+                       root_label=3D"${bootparam_root#LABEL=3D}"
+                       root_dev=3D$(findfs "LABEL=3D$root_label" 2>/dev/nu=
ll) || return 1
+                       [ -n "$root_dev" ] || return 1
+                       root_partuuid=3D$(sed -n 's/^PARTUUID=3D//p' \
+                               "/sys/class/block/${root_dev#/dev/}/uevent"=
 2>/dev/null)
+                       [ -n "$root_partuuid" ] || return 1
+                       root_match=3D"PARTUUID=3D$root_partuuid"
+                       ;;
                 *)
                         return 1
                         ;;
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/m=
eta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 2ec03bc34c..936cd0c995 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -88,7 +88,7 @@ RDEPENDS:initramfs-module-mdev =3D "${PN}-base busybox-md=
ev"
 FILES:initramfs-module-mdev =3D "/init.d/01-mdev"

 SUMMARY:initramfs-module-udev =3D "initramfs support for udev"
-RDEPENDS:initramfs-module-udev =3D "${PN}-base udev"
+RDEPENDS:initramfs-module-udev =3D "${PN}-base udev util-linux-findfs"
 FILES:initramfs-module-udev =3D "/init.d/01-udev"

 SUMMARY:initramfs-module-e2fs =3D "initramfs support for ext4/ext3/ext2 fi=
lesystems"
--
2.43.0

--_000_DS0PR02MB9197379FF0B8661FC47959B3EAB32DS0PR02MB9197namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gentle ping on v3 of this patch.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The patch adds LABEL support for the root-only udev trigger</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
and has been tested with bitbake -p, the initramfs dependency</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
graph, and the allarch sstate signature selftest.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please let me know if any further changes are needed.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Wenwen</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wenwen Fu &lt;wenwfu@=
qti.qualcomm.com&gt;<br>
<b>Sent:</b> Friday, August 28, 2026 22:21<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [PATCH v3] initramfs-framework: support LABEL with root-onl=
y udev trigger</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Filesystem labels are not available in kernel ueve=
nts. Add<br>
util-linux-findfs to initramfs-module-udev and use findfs to resolve<br>
root=3DLABEL=3D to a device. Read the kernel-provided PARTUUID from sysfs<b=
r>
and trigger only that partition, falling back to a full trigger if the<br>
label cannot be resolved safely. Keeping findfs out of the BusyBox<br>
defconfig avoids increasing BusyBox for unrelated users.<br>
<br>
Exclude the util-linux dependency from signature propagation because<br>
this allarch recipe only invokes findfs at runtime.<br>
<br>
Tested with bitbake -p, the core-image-minimal-initramfs dependency<br>
graph, and the sstatetests.SStateHashSameSigs2.test_sstate_allarch_samesigs=
<br>
selftest.<br>
<br>
AI-Generated: OpenAI Codex<br>
Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
---<br>
Changes in v3:<br>
- Exclude the util-linux dependency from initramfs-framework signatures<br>
&nbsp; to preserve allarch sstate reuse across machines.<br>
- Validate the fix with the allarch sstate signature selftest.<br>
<br>
Changes in v2:<br>
- Keep findfs out of the default BusyBox configuration.<br>
- Add util-linux-findfs as an initramfs-module-udev runtime dependency.<br>
---<br>
<br>
&nbsp;meta/conf/layer.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp=
; 1 +<br>
&nbsp;.../initrdscripts/initramfs-framework/udev&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ++++++++++++<br>
&nbsp;.../initrdscripts/initramfs-framework_1.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
&nbsp;3 files changed, 14 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf<br>
index b91ce3e437..1ad34b430d 100644<br>
--- a/meta/conf/layer.conf<br>
+++ b/meta/conf/layer.conf<br>
@@ -61,6 +61,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D &quot; \<br>
&nbsp;&nbsp; initramfs-framework-&gt;${VIRTUAL-RUNTIME_base-utils} \<br>
&nbsp;&nbsp; initramfs-framework-&gt;eudev \<br>
&nbsp;&nbsp; initramfs-framework-&gt;systemd \<br>
+&nbsp; initramfs-framework-&gt;util-linux \<br>
&nbsp;&nbsp; initramfs-module-install-efi-&gt;dosfstools \<br>
&nbsp;&nbsp; initramfs-module-install-efi-&gt;e2fsprogs \<br>
&nbsp;&nbsp; initramfs-module-install-efi-&gt;parted \<br>
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/udev b/met=
a/recipes-core/initrdscripts/initramfs-framework/udev<br>
index 8f67e78a7c..85c5ba1178 100644<br>
--- a/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/udev<br>
@@ -43,6 +43,18 @@ udev_trigger_root_device() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; PARTUUID=3D?*)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_=
match=3D&quot;PARTUUID=3D${bootparam_root#PARTUUID=3D}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LABEL=3D?*)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # The kernel doe=
s not export the filesystem LABEL in the<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # uevent, so res=
olve it to a device node with findfs and<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # match on that =
device's kernel-provided PARTUUID.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_label=3D&qu=
ot;${bootparam_root#LABEL=3D}&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_dev=3D$(fin=
dfs &quot;LABEL=3D$root_label&quot; 2&gt;/dev/null) || return 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -n &quot;$root=
_dev&quot; ] || return 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_partuuid=3D=
$(sed -n 's/^PARTUUID=3D//p' \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/block/${root_dev#/dev/}/ue=
vent&quot; 2&gt;/dev/null)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [ -n &quot;$root=
_partuuid&quot; ] || return 1<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; root_match=3D&qu=
ot;PARTUUID=3D$root_partuuid&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; *)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; retur=
n 1<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br=
>
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/m=
eta/recipes-core/initrdscripts/initramfs-framework_1.0.bb<br>
index 2ec03bc34c..936cd0c995 100644<br>
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb<br>
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb<br>
@@ -88,7 +88,7 @@ RDEPENDS:initramfs-module-mdev =3D &quot;${PN}-base busyb=
ox-mdev&quot;<br>
&nbsp;FILES:initramfs-module-mdev =3D &quot;/init.d/01-mdev&quot;<br>
&nbsp;<br>
&nbsp;SUMMARY:initramfs-module-udev =3D &quot;initramfs support for udev&qu=
ot;<br>
-RDEPENDS:initramfs-module-udev =3D &quot;${PN}-base udev&quot;<br>
+RDEPENDS:initramfs-module-udev =3D &quot;${PN}-base udev util-linux-findfs=
&quot;<br>
&nbsp;FILES:initramfs-module-udev =3D &quot;/init.d/01-udev&quot;<br>
&nbsp;<br>
&nbsp;SUMMARY:initramfs-module-e2fs =3D &quot;initramfs support for ext4/ex=
t3/ext2 filesystems&quot;<br>
-- <br>
2.43.0<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB9197379FF0B8661FC47959B3EAB32DS0PR02MB9197namp_--

