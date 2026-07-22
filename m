Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C094C4451C
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 07:00:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42408.1784702994582618878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:49:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gIaGHs8V;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16634ecc35=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M51ij5038485
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 06:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=Z8SI6V2Rui+7smgZL5CMlB
	lxMF7Vbk1dYfkkwX4psgU=; b=gIaGHs8VMdaXh7AcUhxcc2oLdac+26oMg6B9PV
	pmilvFgahSUm18OG+5bx7Cpna99KKpKje5OE0QtkdmIStqNacuHtBqyqiwBy5dcb
	ydmZHu+O/oxVl0f/vk91+C71t51gqcIt1Jyt+I4G0EFU8OZNSkl3N0kVgNPq4iwj
	61L42jBTXiPSxdTUAr6cRbKzvfZnAycKuSiZsocsc0hKbBT+VMglOd39KioWpAG5
	9pasECTOnRi0JG7tjy7h3L8QXUqU6RvFwzPky6ZWROdoh0w6t6e84G/L85B0/fxC
	a/CKqJMmp9zlB7oeB7+UL4esRD3Qn43OEmkygQZ60HS60UMg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011011.outbound.protection.outlook.com [52.101.62.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fg0f5ffrx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2026 06:49:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsLdGPtcPuC6YkkZpFjwwXjlK3bpBa/oZrvVB73zTK6ZEZBo8CMARX2gziZSluJ4zrra0KHhnQld+QOXUuIX25kl/83hea0tcf4RJ32NVEC2H9Bzy3fSHxT8tEal/o5YIGcH+tAmBVOH8LyB426EaywgiALtVOaKSJ8ESkTfeiAaGwwbch3+w7fFYK/hFI7ylflpfBNgWGO2YL82yf2FN0r6i75d56wdT1pELPnRUtQVi16BSg64TPSZJ0Q1hp4zf14ohP/7hxCPE1w4vUEBiG1UzLxpwpjdBoDb37BaZ6IZ/ibFeGtwDJGqzTma6Lh6fMg6blhSRefEXvEBoG2BMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8SI6V2Rui+7smgZL5CMlBlxMF7Vbk1dYfkkwX4psgU=;
 b=pObK5TzFfn6uyrv56VhTxYPCGZ6aRIHXUf4NKqsBAg8o/IPKwsUpD/838d/Eu5zIaR4640YFHh/GvfwMMFTFxtfmG/ovPUxxiyfEMwi5mumaefIzq53P/WGXuLgE91sQv/mDavCC6O69ADMSTc/stp6FHYohWNjei1eG9gbAP2YLa6kPFzNSmD8xIrWom2yJ11sU9yqM3hcbH2Bsxr+LpOP/o2qGOU4oT56UzO7ouosrhhmOsgJFl2bwNdRqPCnrlQiLWf9SZ5O95LQMrcxbuVwoiqbv3+pDP2i7SPUalRwhf3EWE3UUJEDJzCV1Uc3CMYhJ1zR8KTwzfobQiSM2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15)
 by SJ2PR11MB7502.namprd11.prod.outlook.com (2603:10b6:a03:4d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 06:49:49 +0000
Received: from CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec]) by CH3PR11MB8774.namprd11.prod.outlook.com
 ([fe80::8925:311f:7018:b3ec%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 06:49:49 +0000
From: "Barde, Himani Ramesh" <HimaniRamesh.Barde@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Komati, Shiva"
	<Shiva.Komati@windriver.com>
Subject: Re: [PATCH v2] systemd.bbclass: fix service enablement for cross-install scenarios
Thread-Topic: [PATCH v2] systemd.bbclass: fix service enablement for
 cross-install scenarios
Thread-Index: AQHdGaX/gTGD084SG0ujiMAuKvObqbZ5GOd/
Date: Wed, 22 Jul 2026 06:49:49 +0000
Message-ID: 
 <CH3PR11MB877443DB617294498C03016F8FC12@CH3PR11MB8774.namprd11.prod.outlook.com>
References: <20260716061519.765593-1-HimaniRamesh.Barde@windriver.com>
 <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
In-Reply-To: <20260722064730.3212268-1-HimaniRamesh.Barde@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-22T06:49:48.228Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8774:EE_|SJ2PR11MB7502:EE_
x-ms-office365-filtering-correlation-id: 0af5f05d-0cd6-432f-8f46-08dee7bd6ca9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|56012099006|4143699003|10067099003|6133799003|8096899003|18002099003|22082099003|13003099007|38070700021;
x-microsoft-antispam-message-info: 
 1l95m7iQJU8X3UqbZH7F9DGRGa1PG8ubjFCfbop7JD6ufKvheaqe5O8qHpPXTAzVCVSGuH9ayHnsP6TLfzpCA5nuCXBE0DencjApDFRqH3Mw6KXj6av224XNfq7qGv4g0lHMzbjA53lDZvSe5YI36IbGLDQovj9ug4EyVHlAr98er87J7Ab5jCygABSC7nRUTFdWiX3UU32a+xOACsrFxD5nft7GpiJ+mSH6+mt+/5LRt+HDsbxPg0FSSq3/bhvpJ/8iJUBiV7kYVUZvI2M+GiZ2cDU0mtLiLTV2jpRSayTTPsEKcH/gSNC29G5cqeuDmk93CkrXJGyWXxE87CBEhT+OSI0ttqfqtZ53TQ7krszT26u6TaW5cilW9Gms8jncFw6BCNt5lDCczcn2kXm7VOjPJ08m3TxNPjnaYhy5mHLeRIyVBi7by4QsB3ZVRzOi0adTFNp7oh4Wczb6uDjh1+p9Rq6suo006iwBx92VV6no7RPCUtFWSbLghjEIfXmr7P+ocwFpbSIY/sb4u2GmKzGCQd3VFV/NG0lQ4bles0F8WwoU7JbpFgNWBfLKh+oSgg+2GjCHpXnrKdyqpl/aTxRr39T773uXYyLjqtLUOKvLR883B/tQARwjwBjLIIrcYxkrR+HqNfLE0rDNNLFg75q6BxktBU7RG6h7/4qvsXHl731XZdCaolrRazDQYEZB2B9w4bh/Zp8NIxhzqbGIccJxEMM1bSRNHlyKb+ufoaU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8774.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(8096899003)(18002099003)(22082099003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?skWqSIPGVSmZSrejFLARrjOKigF1x8uJ1/1nWIiBp1tohYGZa/YUuFUUINXk?=
 =?us-ascii?Q?uD96beQoG8iz6KLmyfrm+LsgPZWi+WcjMyxGivzn6LqYyKsdS9juoWXCkjwn?=
 =?us-ascii?Q?Cbs0VySGzlqtiQ74nR3hN8VsIFy0tKmP97gVAkdLUKTerRLYwRcpk4Zos10V?=
 =?us-ascii?Q?jYz/x7l2nbOI3mhY1IpGd0azfIb3ewE1+AE+peS8YZWrckViPTylNwLyDQmi?=
 =?us-ascii?Q?s+aAkYdriBVaFLZn/os4Tw34SM/SmQS845z+kxo+7Ade6Ow6CpGNV99cXJE7?=
 =?us-ascii?Q?r1NMgRc6nlveS5JKBLxC4ueLXm8cP5m1iupfT0Pvq1Pmxk7tgEVYNpbKesWT?=
 =?us-ascii?Q?y/bCBjtAXvqwEioJBslyKO9zNjQQ4xmJmDPhMetG9pXgQG0oH3khvAq3EEde?=
 =?us-ascii?Q?toSs0lmHcgjkvNEauMRjCjkvpjqHzZZUuU/6cRDcUooyFPTtj5h15shdHDZa?=
 =?us-ascii?Q?NYJsd8AFl3dO7RFWoURtHWuz4l0vkhTfKzGxE1gdCvYSdyRBVS9KIjy+cPJP?=
 =?us-ascii?Q?FpSfThDOsHnj7iLW7rjB4vdA5YULOYyDyFOkbrAcmsJulaYCBrE01L1LeTJt?=
 =?us-ascii?Q?p1YBr7Pgcs5GmQQ44QGobT+7wcrC0ZVzeJGdkHZt8/d3zT7lDHoN//QpzhUg?=
 =?us-ascii?Q?rfeg7s8yAXn3/mCLIUScTdFiEx8+fJAJzwf9roGAd5o3OuW3TKshP+c96z3r?=
 =?us-ascii?Q?D7P96lxMcaVj9REQFT++Kbjf34ftRZ2uhwm31QC/7KSzYRJ8fFHDmSPY2Tbc?=
 =?us-ascii?Q?kG5jjweIUDevaftKptNbFANoFa/LhA0cd3Fwki8oZAjopK9E/uhb0mu1HtTt?=
 =?us-ascii?Q?5XoaGvd7npgGZnBTVg5nBLtyNYkDZgrayGCe25HXXQ4bYN5v5KTbwyyBDUvU?=
 =?us-ascii?Q?R6C4koI9E0H+BYCpCTtDT3i20NtmTRhEn+4wBoFZs0+iemYHk1iGokfrZwaM?=
 =?us-ascii?Q?uBic2uQiHtM4x5GxMq8EhuxLQ0BZX6goKsrROgzVoyi3vf+3cI+NfP26p2FT?=
 =?us-ascii?Q?7a9DzYKi4KwsU5S4epvUyy/CT++ejJUOGUR9P/vjkgwplf9jyIipCqN6gZP4?=
 =?us-ascii?Q?tq2kZQDQuTb5W4ZT9lCuB+bU0+u6DNvqNSzwDnNMRaxEUzZIC/52bRmKmUKF?=
 =?us-ascii?Q?SqAkytX4mj0urigmMjKPU6pk0rRdvKwDn/bo07+T1Wn/vyrf17sXEhQu7PXi?=
 =?us-ascii?Q?lW7ixEixXOtj9oesNUZioNIgXUPkOO3TEvxlcy3T7/kvaRcb0nPYAsdDhTbP?=
 =?us-ascii?Q?rPARukxLs6Y1tTm3P+w+nNAq1L6WQ7e4Xdx3k+rGZfLJKLLQGptk0si279/l?=
 =?us-ascii?Q?ZAL2qj3IznT5O+Hp82iOfkQCOmBryjGGtIQAiZv6N8LiJG3+K0UDOrp558b0?=
 =?us-ascii?Q?yHkP7tLvAiKI1PDNjQIO0Ya9BRUNJhEY2gSAkrLYcy9tssSjhLJzDNGwlS3U?=
 =?us-ascii?Q?3H/Ywl9vq+olZG49egVS50BlkP0MFW1VxJcTcmhbDD1AEDElmG4lK42AKWGW?=
 =?us-ascii?Q?XQe/9VLso5n5kQlarXLr1Ub7Bf4EefSX8l/kS42Su9BvwjRgTwtne1xMGavP?=
 =?us-ascii?Q?QA2ioiQDJbzryLFSIuwM8kh1B4e1UINaHq8FhY+niwQCWpXwfIkpjUfmXK9v?=
 =?us-ascii?Q?VrBYu4RftLroaQ0Qo/tNROuaahzwWtUaYKW66UjOnHBWMrv6XcTVIYToa4e2?=
 =?us-ascii?Q?OchDwrYWObKex5jRcK+YCZPiJeVdyZNb+nTM1EwLG2uLWBMUFFF+uO2W7E92?=
 =?us-ascii?Q?MpOVD/AZRFyLdlM5JcWH8ZAESMyKRvE=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	GWSbbamiaEmGen3rEBdQ/0f1i3AuPI3JvYC/kMpzC5OhXt5VTN+xnGaDNIrrNhIEnWKQt7nm7iFevHpq+eyT52Z1wwN+QkMXZ3cTtDeMmJHBTF7fz3mHcg3cA48r1QHmlaJwfoaa2OQJCkPCk6BpfH49dQSOe2hUgtELFu1145R7y2kmz6m1SLYqniOe8jS4pT6D35+YH47UijZjznGDKWeYk4CZSbJEyH76Zq67hHjX7eRlsoFslmiJB9clucJQUqOY4a4ech5lT1wo3PxFR0r1UJWOL9ypGVW5MRMn6mLopuVcQu8pNHwZa85/uTb2ALkrt2sNn6KtzINXQ0zK5A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af5f05d-0cd6-432f-8f46-08dee7bd6ca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 06:49:49.0580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 299Eza7YCY/oxgHNuMVRFt2YWDpXZ5AfBLO3+uLrIv5EGz62QGpv9ZiuPSujNDGJKsXJQV57y/+AwDCXCv4qCyRpBn6di5XP7yKS1WxduiIyM++vw0W8ef+8rcN4M1zS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7502
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MiBTYWx0ZWRfX27jI8sQTqtSC
 M0qjeh05iom2gyaVWEmWN6iM5Y2fINHx0zn0KSPZLqTdCcu3SsFK/SS2zgEqOtI3h0vyjL+whPn
 V25QpcG2pOYuV4L3Wy395B6Y/w8Dloo+D5jzNebV3iz53CvpbNzTj9qWkRZkX/52YoasH0k83sy
 bOOgqrMe7oPLxZT/JSEHUTgVYpeXtQNcDdxq3J8X2FsOodKHKCDhF3Qu9SlgmhbYDvf38DkeB37
 POisGJ5TvdqTX9lZDT4zPpK7IhB0D9J/Q4Dvsy9oR3zF9uUROLn5sBZvDR+UaEyy8K0g/zYhbOW
 29Io5avrtF+3qT4bomGcPkN5iy008v4TJvOxZeq5WVrO1Q0GneEOmsY3QAXmcCKreAMD5XigTzr
 xm4VtYw5q7ACCBvCn3+3SSt2D2GsqXJRlMSJlegq+cdnlMxAHhWE6Guas6NCqgAZ25o7bRwLxTH
 JTA8nEwIq8R++NGbZtQ==
X-Proofpoint-GUID: DQR67u22w48oNFQ5xy_SUoJqTNP-bhbv
X-Proofpoint-ORIG-GUID: 1wbQAa73lZjMFKLihZmBvIBRdT56F7Qo
X-Authority-Analysis: v=2.4 cv=IM0yzAvG c=1 sm=1 tr=0 ts=6a606810 cx=c_pps
 a=TuoCv7SfN2yFw/uhdbj5/Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=4HQrkQOBXHC2-Uq0uqwA:9
 a=CjuIK1q_8ugA:10 a=nDrm97bBnYPk_1acAXoA:9 a=OVGsEEbknWJLsS__:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MiBTYWx0ZWRfXzZfxN5zq1+K1
 mcyBqHfSBHtLlvJ6t00PJiAQthGXFvvL4kAbWguFhFeLXowToknCjRih2G7fGt8OFE32NpUGxsJ
 otCEwzaJCWfkLZoK9B2R/qes3dypUbMM4bK6m+1j+dEVcjrYuUji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220062
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB877443DB617294498C03016F8FC12CH3PR11MB8774namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 07:00:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241602

--_000_CH3PR11MB877443DB617294498C03016F8FC12CH3PR11MB8774namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Mathieu,

Thanks for pointing that out. The v1 was based on scarthgap. I've sent a v2=
 rebased on the latest master.

Regards,
Himani
________________________________
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
Sent: Wednesday, July 22, 2026 12:17 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Komati, Shiva <Shiva.Koma=
ti@windriver.com>; Barde, Himani Ramesh <HimaniRamesh.Barde@windriver.com>
Subject: [PATCH v2] systemd.bbclass: fix service enablement for cross-insta=
ll scenarios

When packages are installed outside of Yocto's normal image creation
(e.g., using multistrap, debootstrap, or dpkg directly on a host),
the postinst script fails to enable systemd services.

The issue is that the entire enable logic is gated behind
"if type systemctl >/dev/null 2>/dev/null". In cross-install scenarios:
- If systemctl is absent on the host: the check fails, script is skipped
- If host systemctl is present: it cannot find target unit files

Fix this by separating the offline ($D set) and online ($D unset)
code paths into distinct branches. The previous code used a single
OPTS variable to switch between "--root=3D$D" (offline) and "" (online)
within one unified block. This variable is removed because the two
scenarios now have dedicated branches with different logic:

- Offline ($D set): Uses "systemctl --root=3D$D preset" per service,
  which reads preset files from the target rootfs and creates symlinks
  without needing the host systemctl to understand the target's unit
  files. Falls back to "systemctl --root=3D$D enable" per service.

- Online ($D unset): Same as before - enable, daemon-reload, preset,
  restart. No behavioral change for on-target installs.

The OPTS variable is no longer needed because each branch now directly
uses the appropriate systemctl invocation for its context, making the
intent clearer and the offline path functional.

Fixes [YOCTO #14118]

Signed-off-by: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
---
 meta/classes-recipe/systemd.bbclass | 30 ++++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 26eaaf1..c209bb3 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -27,24 +27,36 @@ python __anonymous() {
 }

 systemd_postinst() {
-if type systemctl >/dev/null 2>/dev/null; then
-       OPTS=3D""
-
-       if [ -n "$D" ]; then
-               OPTS=3D"--root=3D$D"
+if [ -n "$D" ]; then
+       # Offline/cross-install: apply presets to the target rootfs.
+       # This handles multistrap, debootstrap, and similar tools that
+       # install packages outside of Yocto's normal image creation.
+       if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
+               if type systemctl >/dev/null 2>/dev/null; then
+                       for service in ${@systemd_filter_services("${SYSTEM=
D_SERVICE_ESCAPED}", False, d)}; do
+                               systemctl --root=3D$D preset "$service" 2>/=
dev/null || \
+                                       systemctl --root=3D$D enable "$serv=
ice" 2>/dev/null || true
+                       done
+
+                       for service in ${@systemd_filter_services("${SYSTEM=
D_SERVICE_ESCAPED}", True, d)}; do
+                               systemctl --global --root=3D$D preset "$ser=
vice" 2>/dev/null || \
+                                       systemctl --global --root=3D$D enab=
le "$service" 2>/dev/null || true
+                       done
+               fi
         fi
-
+elif type systemctl >/dev/null 2>/dev/null; then
+       # Online: running on the target system
         if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
                 for service in ${@systemd_filter_services("${SYSTEMD_SERVI=
CE_ESCAPED}", False, d)}; do
-                       systemctl ${OPTS} enable "$service"
+                       systemctl enable "$service"
                 done

                 for service in ${@systemd_filter_services("${SYSTEMD_SERVI=
CE_ESCAPED}", True, d)}; do
-                       systemctl --global ${OPTS} enable "$service"
+                       systemctl --global enable "$service"
                 done
         fi

-       if [ -z "$D" ] && systemctl >/dev/null 2>/dev/null; then
+       if systemctl >/dev/null 2>/dev/null; then
                 # Reload only system service manager
                 # --global for daemon-reload is not supported: https://git=
hub.com/systemd/systemd/issues/19284
                 systemctl daemon-reload
--
2.54.0


--_000_CH3PR11MB877443DB617294498C03016F8FC12CH3PR11MB8774namp_
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
Hi Mathieu,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for pointing that out. The v1 was based on scarthgap. I've sent a v2=
 rebased on the latest master.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Himani</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Himani Ramesh Barde &=
lt;HimaniRamesh.Barde@windriver.com&gt;<br>
<b>Sent:</b> Wednesday, July 22, 2026 12:17 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Komati, Shiv=
a &lt;Shiva.Komati@windriver.com&gt;; Barde, Himani Ramesh &lt;HimaniRamesh=
.Barde@windriver.com&gt;<br>
<b>Subject:</b> [PATCH v2] systemd.bbclass: fix service enablement for cros=
s-install scenarios</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">When packages are installed outside of Yocto's nor=
mal image creation<br>
(e.g., using multistrap, debootstrap, or dpkg directly on a host),<br>
the postinst script fails to enable systemd services.<br>
<br>
The issue is that the entire enable logic is gated behind<br>
&quot;if type systemctl &gt;/dev/null 2&gt;/dev/null&quot;. In cross-instal=
l scenarios:<br>
- If systemctl is absent on the host: the check fails, script is skipped<br=
>
- If host systemctl is present: it cannot find target unit files<br>
<br>
Fix this by separating the offline ($D set) and online ($D unset)<br>
code paths into distinct branches. The previous code used a single<br>
OPTS variable to switch between &quot;--root=3D$D&quot; (offline) and &quot=
;&quot; (online)<br>
within one unified block. This variable is removed because the two<br>
scenarios now have dedicated branches with different logic:<br>
<br>
- Offline ($D set): Uses &quot;systemctl --root=3D$D preset&quot; per servi=
ce,<br>
&nbsp; which reads preset files from the target rootfs and creates symlinks=
<br>
&nbsp; without needing the host systemctl to understand the target's unit<b=
r>
&nbsp; files. Falls back to &quot;systemctl --root=3D$D enable&quot; per se=
rvice.<br>
<br>
- Online ($D unset): Same as before - enable, daemon-reload, preset,<br>
&nbsp; restart. No behavioral change for on-target installs.<br>
<br>
The OPTS variable is no longer needed because each branch now directly<br>
uses the appropriate systemctl invocation for its context, making the<br>
intent clearer and the offline path functional.<br>
<br>
Fixes [YOCTO #14118]<br>
<br>
Signed-off-by: Himani Ramesh Barde &lt;HimaniRamesh.Barde@windriver.com&gt;=
<br>
---<br>
&nbsp;meta/classes-recipe/systemd.bbclass | 30 ++++++++++++++++++++--------=
-<br>
&nbsp;1 file changed, 21 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass<br>
index 26eaaf1..c209bb3 100644<br>
--- a/meta/classes-recipe/systemd.bbclass<br>
+++ b/meta/classes-recipe/systemd.bbclass<br>
@@ -27,24 +27,36 @@ python __anonymous() {<br>
&nbsp;}<br>
&nbsp;<br>
&nbsp;systemd_postinst() {<br>
-if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; OPTS=3D&quot;&quot;<br>
-<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -n &quot;$D&quot; ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; OPTS=3D&quot;--root=3D$D&quot;<br>
+if [ -n &quot;$D&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Offline/cross-install: apply preset=
s to the target rootfs.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # This handles multistrap, debootstra=
p, and similar tools that<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # install packages outside of Yocto's=
 normal image creation.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_ENABLE}&quo=
t; =3D &quot;enable&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for service in $=
{@systemd_filter_services(&quot;${SYSTEMD_SERVICE_ESCAPED}&quot;, False, d)=
}; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --root=3D$D preset &quot;$service=
&quot; 2&gt;/dev/null || \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; systemctl --root=3D$D enable &quot;$service&quot; 2&gt;/dev/null || tr=
ue<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for service in $=
{@systemd_filter_services(&quot;${SYSTEMD_SERVICE_ESCAPED}&quot;, True, d)}=
; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --global --root=3D$D preset &quot=
;$service&quot; 2&gt;/dev/null || \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; systemctl --global --root=3D$D enable &quot;$service&quot; 2&gt;/dev/n=
ull || true<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; fi<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
-<br>
+elif type systemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Online: running on the target syste=
m<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;${SYSTEMD_AUTO_=
ENABLE}&quot; =3D &quot;enable&quot; ]; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for service in ${@systemd_filter_services(&quot;${SYS=
TEMD_SERVICE_ESCAPED}&quot;, False, d)}; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl ${OPTS=
} enable &quot;$service&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl enable=
 &quot;$service&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; for service in ${@systemd_filter_services(&quot;${SYS=
TEMD_SERVICE_ESCAPED}&quot;, True, d)}; do<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --glob=
al ${OPTS} enable &quot;$service&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemctl --glob=
al enable &quot;$service&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -z &quot;$D&quot; ] &amp;&amp; s=
ystemctl &gt;/dev/null 2&gt;/dev/null; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if systemctl &gt;/dev/null 2&gt;/dev/=
null; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # Reload only system service manager<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; # --global for daemon-reload is not supported: <a hre=
f=3D"https://github.com/systemd/systemd/issues/19284">
https://github.com/systemd/systemd/issues/19284</a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; systemctl daemon-reload<br>
-- <br>
2.54.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB877443DB617294498C03016F8FC12CH3PR11MB8774namp_--

