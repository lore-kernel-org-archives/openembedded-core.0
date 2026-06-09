Return-Path: <Shilong.Jiao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25DE6CD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:04:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75125.1780995892953441771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sDpqtKIH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0620ffd7d6=shilong.jiao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6598tSkS2035530
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 09:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=BHgRSL6GvbLmL1oLKGvW74
	RY3wWe3pNs2MoxADOiy6w=; b=sDpqtKIHuVMF+P/lR77XWvX5TDBRG/+pvi9dsg
	GBqi+4o5IMUTjZOZ0Olvx74YAH6MULbXg5Dw0QaCPSIUvo+xd0nWyu6R3L7alqW9
	NVBvzjhNEL1tYpUbG95unV9XUXf2nMuBAJ9eBNdE5NZjYh3DLAguWAhZVYwWBHPm
	l6h6JUZUkMDulcvpnXbcWiwqq3LeNW+o9K4hpkdcUohrbG4ClWfmVO0cEPPbiyFk
	UNjEesW5obQvSbccnMC3gq71xlP9VsaniGZ5pV8alBsgnyAVOoPzFnfYwHKYQzRA
	evRJywM78L9OltBLgLVhb2434p/g9IGuk9B/o1t1wC7my56A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013033.outbound.protection.outlook.com [40.93.196.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emah7c6n1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 09:04:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRiHWRF5oEPxRV/MX96PVRyYdLp/kFVrkS5+bJh9OJCLY39HjvhzlQ0t5r2A+fkxRcxHFI/KcvwbIqeQBhR4IzK7+0pF6ZjovJY41Z9S2y893k6eXgU2ZgalhQ+s1atlPTYYRir1QZr1MlB8PTdQmlVfq7TAA0ZLLK4WWVxY6MnY6d05hKe2yut0UXTwsMUK1+YfW5+xuUHxs8qXaJARU0RFZPIVg1B5JfyoBZCwQXLXurIRmmYiDqXSRGkkuLQy2lVnP4dCLAFyLmIbq5IVsdiH1vZc5gPSGoTysdtIzmePiVhXpaFdrQAJ5YxNtHmnOgA+w0xkzSMkAFw3CAuSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHgRSL6GvbLmL1oLKGvW74RY3wWe3pNs2MoxADOiy6w=;
 b=Wvv0y2GmZHHNFu5jiNxKkpc60dW+7AI9IKw5nUVWSzov+y9MoM7NO19XbyGk87OTITr/DF/XRnCvQgeA2vWF8p0Bz8V/051mk3i0uhfr/vDtmeXRCzEigcEt8G5oSprRvbQduNOWnSSg07yxLeNS7OwAVjgkUVJvCT3TUQALDHne7OHDLV2YWs+yOE2TjR9InST8PGbUzkubSZ8h+FgVqN/AcRq2rRxdgJEW+4HMyv7pVv3LipEQapWLY0TXzjleC5SD1HHX+DoLN1z1SjI8+DPRMR+E1LY0lfXUc0PjmguiZ3HaTGOoYGfiG/AO0viZbzYdVBuAugkHDLqc3uzZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6678.namprd11.prod.outlook.com (2603:10b6:806:26a::20)
 by DSSPR11MB9617.namprd11.prod.outlook.com (2603:10b6:8:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 09:04:49 +0000
Received: from SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99]) by SN7PR11MB6678.namprd11.prod.outlook.com
 ([fe80::30df:f39d:e75c:da99%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 09:04:47 +0000
From: "Jiao, Shilong" <Shilong.Jiao@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Topic: [OE-core] [PATCH] python3-six: Add ptest support
Thread-Index: AQHc9+3IBgFEIc6TJ0KxxAVJ13Jl4bY17hCk
Date: Tue, 9 Jun 2026 09:04:47 +0000
Message-ID: 
 <SN7PR11MB6678B1731B2A36814F01A686801D2@SN7PR11MB6678.namprd11.prod.outlook.com>
References: <20260609014110.3859502-1-Shilong.Jiao@windriver.com>
 <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
In-Reply-To: <DJ4E5OTQSRTG.JX0ANFWCLECZ@bootlin.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-09T09:04:46.495Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6678:EE_|DSSPR11MB9617:EE_
x-ms-office365-filtering-correlation-id: 88f87341-9ad4-4c5b-7261-08dec60627e6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 ehEWgq7pqCsamJlGUCW1EKYKvYhc+CWCh7DgRAHO3SDoi3x5QGIkin+5ZWDJ3QMMMpMRq3LCnMNZAAmwhiOubI2usiMGvCL+HCtDZqO+nFHbLHGiPgsoPVwulPskQOGjc+VdXMCQp+ftIVoehtp+Q/NTnWItLfm1+ftZ6SfkQekRqlHzCgZTzsqP+F47MLM7G4j2Jr4qJV3Yd9woKoJQ30ZkQG321qMvgYeFk3Dqa3iyiQcp1/XyIBTlmRX3jfMLQYVM0G90Iv1mFBZXzzG8N4A+XVrK9/cbPjg/RpdUGtqI1TjbUxrTSmSQtylLSW8BJH/eTzMjL0BjV2P0tsqfekMF+IRerl40JXghD9qyOiAFlzEz8FKV8E2ESUxEFZ226o5+D0P9ajB/Ic1RoMB2ceeIOyxR+433sXkyUylzWd9jH/WwHZtVHB6o4JEvVGsETmIp1gtdT/9psGWiH++creIussxr64AzT4xlvSb7HOl0zpZaQGM+BMkm8CRlR3abXFnkTQM9JlvTxSv2jFYPGlLBP9Mz+ViEL8hoAx9R1IFBsFnbyAkvIfLWYCNJ95SUJiduueqtbTH/aUnnykK3OD6nLJVP7dyASdCqQLBFmmwMYw4+0tLqGNx8JwYwcYK5UZD+ccrJLbE2bYYz0axQqeK76Gal/rdiNALOJJyFN2W/OtD49+HxpKSgi4Vs1jfh
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6678.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AOq8j8ZSNY3Zv1eXlsIckdK+pVCdOs9Ch1iWlnA8YIbNPWF1jKeIP5xIW7cJ?=
 =?us-ascii?Q?PcLWVD6qKSZQL76Tfu5MhIkCRRiEjr28ATqMb3qek4D2ARS9U69GrMH+EY4Q?=
 =?us-ascii?Q?zyp9c7m99q4wl7YF1O9XZAZlNxnYGRsrLmqViSyulmYs2ZnWGWwVs3OALTMI?=
 =?us-ascii?Q?TFWn3sfODuAISpPEXsYzoSgDbkhIsPdvgWKPDjFKtBReQKmNfO1eOYM/l9FT?=
 =?us-ascii?Q?etag8QnIbkYljYPCQMx9yn276e08Vxo4SOVeF8bj3suPyKcQGEtVTSt8CTBZ?=
 =?us-ascii?Q?P9fr4sY0lgz4xiT0wiDVkULA0D3pwdmVqwq4tRH+GH9MOsBl+ERfcJCsBUfk?=
 =?us-ascii?Q?/rTg5Y3/yPps1gBy3PiftBWy+fZezCkQY/SDi6vb4kr5oWzrI2sdr47E4Qew?=
 =?us-ascii?Q?UTqggSSPQy6YUgt8p4cdXVkUY08GnIvV1BFU7Rbrupul9LMgL7326r6mC+uk?=
 =?us-ascii?Q?VXW3+AdRYTphbaDCW9N0TkZ0v0z5RYN0GO//L0jFRMUp46t6eBxNQd94pbu9?=
 =?us-ascii?Q?eVjSPpUAt6xJ8PSzQwP2fWo9Lm8ndYjOVNJkuVMG8N5xAHQ98wpkVfxH5o5Z?=
 =?us-ascii?Q?v5qnLt24xBziWrFWLYhm3nujv9RG4/vQqZq9Bi/mNmhKT9d5NJ3RgY/1XbBl?=
 =?us-ascii?Q?Wcqrkdt3VJzHiZCj2LFz3UbPQvHplRsDi4tR9k30BG51NVsClc7AJJjMU4kb?=
 =?us-ascii?Q?UMxGCgWVQJO0cv4gOy9Gz6znu71jN/owgbbqdLcLYIZaTu0aJXYwRR+4cMxe?=
 =?us-ascii?Q?NzASkcIQvATxaZkj2/1Y5FP18gxv/KoXupmb3EhQjww8aQpYS7GQk5cu/dfY?=
 =?us-ascii?Q?DLaX1mlLisITgsWh7C9mzUlNJfaiim1/AzVl5Pk9OIu8gGpVeqeNDQE9+Un1?=
 =?us-ascii?Q?7Z9MTSYGBfmVgRICmKyLmUqnbhfibUrlP1uoHlsC3O0ZGnXjjT0WaFlWnXcb?=
 =?us-ascii?Q?gFTJVHxo49qgeUtVombPfB7sT3lWN1kWqLsKQFdLjEZgwPky0wfr93RovSjd?=
 =?us-ascii?Q?2sJo0R4pN+We/Cf7aQVadQ/Cvt78xNrJUarBmcDPK5qagnOwgr0t9MpW0rWf?=
 =?us-ascii?Q?lS0O4fg9EuRhf9bpOHwuGJX7mnuxpys8qurO16JaWSFsU3gyHzxnd8qnvK6a?=
 =?us-ascii?Q?zyfUhv2BsgeB/1sTDW7tezAUg3qiub1j8ZhsjqvggoVTlAVKDCatsfpmbAnQ?=
 =?us-ascii?Q?NLwD5R7AYtE9+tvkXHGKjtun3velUw6QcYR9WHX7ooT9NO9yp+RKJq9Q3dDH?=
 =?us-ascii?Q?xrwTb4KGehwljp7out3Ix+79Y5UpjeYzgQjb385CJgFtsNxYQfFNxedaFMg2?=
 =?us-ascii?Q?tN7gZwIpW5VC5Ke5OV6XoVhaFchbuglCrNpGQtsSTwqXSfEUvuBcbpRslirh?=
 =?us-ascii?Q?UqvQE6w/+KcV++jp3nMk5NY3pKdVBuARa0xbu8ZthCHmE5ixpXAx4Z3vVI4h?=
 =?us-ascii?Q?zU7xeq8oTDpk7nWQ3h7UCWd1HFRRvgOJ78uyR2CsTi9KqW7J7C8B9EzEqn13?=
 =?us-ascii?Q?jvjxwItmLDBsj3uqDQXqaUutU9QKlHWq7QMOu3HIvxmuXCEGsgXkedOcecwl?=
 =?us-ascii?Q?K0Ls7ckq6VEGJ4WxDyxyniNlSj1elHQvlpO0SxhJxoM8QxMLNjjhc7h/rF+X?=
 =?us-ascii?Q?9WkHUv17TXDPPLs0NWQ1JS2x+AphlsCBo0720UTTgo2DnYBvT478vv1yqYGb?=
 =?us-ascii?Q?xvhIyP1XGt+c1CZz7K1gDYCC5DxB4nQ5YdZRTp2c5/QtYBRWtjLlOap3H8bM?=
 =?us-ascii?Q?PXhbCFEenw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SN7PR11MB6678B1731B2A36814F01A686801D2SN7PR11MB6678namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	beFi4u0Q7lX7wsLZk6yIt8HCVGt+weF6+Vh+7GhxEcrknRsrz+AoWe2YJX6iPicCeDrxiGBihJjKwr7ys5Eu82PsJtHBtl05+Pyt1d3neSJTs5GobC11qkN5VRfIVvMycb4OjdAb/6doexMyaIXGMKX9nrNJX3gbHoxRr6dQnxKLOYz8+PrTrZTewpg41X1atbIwEVMX7SYmK5IXfiiAdocdd/f7FTo97d7DsL4kUElmRKk4ZapMbFpe9fQC2fpWcfZHndT24b4J1Gs3kDqLMETpXdwHIq46Mn4oePeVXioerzmGsJbG1wVXQ0fi75EDsbcF9iDw9Bj8rYLqaNjZnQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6678.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f87341-9ad4-4c5b-7261-08dec60627e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 09:04:47.4154
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LFnB+kKTOto2LfTLsXDZQQnyy3cG+dwT+fVlE10QbVJvfmW6AYbEdXEX23dsS82PvWFGTiImcXCc9N8eCPsPjsIeTQD5xn8htC/SYIy+GNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9617
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX2/sNzT8vHiXs
 ZzyM9TKfBmJh6HgVgOD5Vkv2+mUUDAUEDcG0ZtprkLE4X8AvGSYQSJBrSvXGQ8/Q/YSBPUAgz41
 z38jVZFFcrG3R6jlkvLx34/sNd5r/BQO4WIOPyTM/eW56aq+Tbp7HGtk36RrO3djsSq1UzdjiXl
 anwUUNtDiuXpqJ8nkrHVcqSSYEr1JiwGuTjLZXqPKF9lc5oRzNzx9lse42GLfbbyR0Q5kWbSdFs
 KpMktdEGzTVhZa/8Jv4G+hiAzQSsYCT/rdGvuQABwI5TITnSaOrzmEzQ3MrT+oDycZMfhDgBGSS
 Vs1SgucE/ZSwdkr+PvjKrCVSkzOhF5EwzZlnnoGeN1MN3QlRK5SxrTnmSXDgBoPJ9LaecYcnxwi
 RZwPV9dQyWsPKg5AY292ROZaLfnAMH7P/koGa6sVZESe6AAlr1tON+6kMQo6CbuuiL/SvTzKux3
 nRfBNBmryKsNLNY8KKQ==
X-Proofpoint-GUID: ZCi6qGncC5gLZVkQUfmmLxe7Yfvz-09B
X-Authority-Analysis: v=2.4 cv=NbDWEWD4 c=1 sm=1 tr=0 ts=6a27d733 cx=c_pps
 a=uZgmHucj+isDzLb5E5/Wlw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=na3StFIxsWS5d3jq:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: pkGnwTA2wKwgAV1KS90ugt33cUGhspeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 09:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238279

--_000_SN7PR11MB6678B1731B2A36814F01A686801D2SN7PR11MB6678namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for the feedback. I'll investigate the failing tests and work on fix=
ing them.

Looking at the failed tests, they seem to be related to:
- test_lazy: Module lazy loading functionality
- test_move_items: Python 2 to 3 module renaming/moving tests (html_entitie=
s, html_parser, HTTP servers, xmlrpc modules)

I'll analyze the test failures from the autobuilder logs and send an update=
d patch soon.

Best regards,
Shilong Jiao

Best regards,
shilong
Tel:84778559
cellphone:15910943969
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, June 9, 2026 16:55
To: Jiao, Shilong <Shilong.Jiao@windriver.com>; openembedded-core@lists.ope=
nembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3-six: Add ptest support

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Tue Jun 9, 2026 at 3:41 AM CEST, Shilong via lists.openembedded.org Jiao=
 wrote:
> From: Shilong Jiao <Shilong.Jiao@windriver.com>
>
> Add ptest for python3-six using pytest to run the test_six.py
> test suite included in the source package.
>

Hi,

Thanks for your patch.

It looks like some tests are failing on the autobuilder:

Failed ptests:
{'python3-six': ['test_six.py::test_lazy',
                 'test_six.py::test_move_items[html_entities]',
                 'test_six.py::test_move_items[html_parser]',
                 'test_six.py::test_move_items[BaseHTTPServer]',
                 'test_six.py::test_move_items[CGIHTTPServer]',
                 'test_six.py::test_move_items[SimpleHTTPServer]',
                 'test_six.py::test_move_items[xmlrpc_client]',
                 'test_six.py::test_move_items[xmlrpc_server]']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3794
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/522
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/505

Can you have a look at the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_SN7PR11MB6678B1731B2A36814F01A686801D2SN7PR11MB6678namp_
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
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Thanks for the feedback. I'll investigate the failing tests and work on fix=
ing them.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Looking at the failed tests, they seem to be related to:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- test_lazy: Module lazy loading functionality</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
- test_move_items: Python 2 to 3 module renaming/moving tests (html_entitie=
s, html_parser, HTTP servers, xmlrpc modules)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
I'll analyze the test failures from the autobuilder logs and send an update=
d patch soon.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
Shilong Jiao</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Tahoma; font-size: 13px=
;">Best regards,<br>
shilong<br>
Tel:84778559<br>
cellphone:15910943969</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, June 9, 2026 16:55<br>
<b>To:</b> Jiao, Shilong &lt;Shilong.Jiao@windriver.com&gt;; openembedded-c=
ore@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;=
<br>
<b>Subject:</b> Re: [OE-core] [PATCH] python3-six: Add ptest support</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Tue Jun 9, 2026 at 3:41 AM CEST, Shilong via lists.openembedded.org Jiao=
 wrote:<br>
&gt; From: Shilong Jiao &lt;Shilong.Jiao@windriver.com&gt;<br>
&gt;<br>
&gt; Add ptest for python3-six using pytest to run the test_six.py<br>
&gt; test suite included in the source package.<br>
&gt;<br>
<br>
Hi,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like some tests are failing on the autobuilder:<br>
<br>
Failed ptests:<br>
{'python3-six': ['test_six.py::test_lazy',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[html_entities]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[html_parser]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[BaseHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[CGIHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[SimpleHTTPServer]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[xmlrpc_client]',<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; 'test_six.py::test_move_items[xmlrpc_server]']}<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/buil=
ds/3794">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds=
/3794</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/bui=
lds/522">https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/build=
s/522</a><br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/bui=
lds/505">https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/build=
s/505</a><br>
<br>
Can you have a look at the issue?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
--<br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN7PR11MB6678B1731B2A36814F01A686801D2SN7PR11MB6678namp_--

