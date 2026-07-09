Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A6CC4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 12:21:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2858.1783576537722859206
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 22:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AE5MEu9a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=16502cbfe2=pritamsrichandan.sahoo@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6694jcIt1407202
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Jul 2026 05:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=LurRIpJ8XjRLskI7idGIw+
	S0kUXQIqD9oHrcmAV7cbk=; b=AE5MEu9aWpo9wPwRpWfQ12h+mGsguIyEWKWklF
	/yhJlwPPwxg+rzXy5PJJA58nLRbc1S7VI/k582HZU0siKtyUFKVtjtUWJzVZ0r0C
	QsTKGO/e4P5NdNpWT+I+gyKcqGNoEGXn98SlZcXQHAPA/ENVKKCXe2NvgdhzEPbI
	zo/2wLXN/0GAltA5Ypn+RN6keic0gYzdiyKZWh1ULddv7dvfMw6uh5ENv/h81TyP
	54No5n2LbFXvCoXnDFTA/UgoCE+msoCOePfBa1V/jCrlKP8cZJql3nI+4PLbq0ct
	2nPBvQaNDmjtjhLJ8BsE7+ZZUs5hAsyU3rebcDCoPbpdOJmg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fa1h209eh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 09 Jul 2026 05:37:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITAqRwhUqeU8M3C4c9q2b+GdGo157+rBz+RKAO6ubAr1ZHwzT9hjSO+tO20sHGcMORl1ekNYlBHv3i18HQFqYK29OsDbsJOZCJBr0NhhWZq1hK4/I5QBT/+voiTvsd4zguxQzdf1xrsJm3uE6Tm/erBs0rdkAowMCRx5xwQ0gM2Rr/U3tsR1JT0Ge5CvYIT49Vka0lfasNbjdqQ1/kYrTa1PikCSrO9U/hUUlMg9Mem6KQeF3nYMvO8Rlkh7NlObbE/zCHoIM4J+uleQ0fDoW55l/PdLMWPgrJzXHrlz8mQhTk7WYAmbZkXB3YuwN/S+Okz49uED6Cziy5O3V6vsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LurRIpJ8XjRLskI7idGIw+S0kUXQIqD9oHrcmAV7cbk=;
 b=NOVx/R7ZwC4mo/i1/b0RwmrIA68jH0fvLUyFey37ZqJZzSNwTEvjJYjClRF2jsas7WY+Lx2WXg5Kp/G4LvZmQn5Xf+Dt2g92/b2CK5REa+JLxhnOdJoxbfMjgg0dxDXL5PEPpw4dkp4VV3k96982LWJbFnGK+H+Qdadl3+ODm3qyVxW/4LHSZ001eZgy+po2qgeu9R3+NOYKKCEDQ9GtzG/syTvUSNRsvVoEU5r1xxuO1I5PIY/SCdJzKeLZVdBVQN0Hkx0qKVTVUbI872rWtIdGt7ERrfxDP4aO9Fy4k8P5+fqUyq4mQY6g9FHbMsSpAy+miujcC960lwVa7teVGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7372.namprd11.prod.outlook.com (2603:10b6:610:145::15)
 by LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 05:37:45 +0000
Received: from CH3PR11MB7372.namprd11.prod.outlook.com
 ([fe80::172e:2e0:9ec1:b61e]) by CH3PR11MB7372.namprd11.prod.outlook.com
 ([fe80::172e:2e0:9ec1:b61e%7]) with mapi id 15.21.0159.018; Thu, 9 Jul 2026
 05:37:45 +0000
From: "Sahoo, Pritam Srichandan" <PritamSrichandan.Sahoo@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Term Zhao, Yi"
	<Yi.Zhao@windriver.com>,
        "Komati, Shiva" <Shiva.Komati@windriver.com>,
        "Term
 Chen, Qi" <Qi.Chen@windriver.com>,
        "Chen, Libo (CN)"
	<Libo.Chen.CN@windriver.com>,
        "Term Wang, Jinfeng (CN)"
	<Jinfeng.Wang.CN@windriver.com>,
        "Masih, Shailesh"
	<Shailesh.Masih@windriver.com>,
        "Holmberg, Tomas"
	<Tomas.Holmberg@windriver.com>,
        "Term Yan, Haixiao (CN)"
	<Haixiao.Yan.CN@windriver.com>
Subject: Re: [OE-core] [PATCH] gnutls: fix CVE-2026-33846
Thread-Topic: [OE-core] [PATCH] gnutls: fix CVE-2026-33846
Thread-Index: AQHdB4SGWF496e3Jok+axoR+dwZKgLZXVQYAgA1lsKA=
Date: Thu, 9 Jul 2026 05:37:45 +0000
Message-ID: 
 <CH3PR11MB7372E7F07854835B172C1F0C9BFE2@CH3PR11MB7372.namprd11.prod.outlook.com>
References: <20260629050225.2061089-1-PritamSrichandan.Sahoo@windriver.com>
 <DJMJMQLPT6XT.3N7DDSPUVEBY0@smile.fr>
In-Reply-To: <DJMJMQLPT6XT.3N7DDSPUVEBY0@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-07-09T05:39:27.857Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7372:EE_|LV2PR11MB5999:EE_
x-ms-office365-filtering-correlation-id: 9430656b-b631-4144-5b4b-08dedd7c3417
x-ld-processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|10070799003|23010399003|1800799024|12006099003|25016099003|29003799003|16056099006|13003099007|38070700021|18002099003|22082099003|6133799003|56012099006|8096899003|5023799004|4143699003|11063799006;
x-microsoft-antispam-message-info: 
 eSfOxdCvgfAek9XgNsehkZTvbMNU63K01FpJCThU/GLrdR01KFH4gktoNpWH9DYl29oMnXkSChBoI6r4u69W5nFZP1/W6wbUNkWOQTiMyqvo78uQhGuNJD/mj0cr5yGxRVNZcikG+yKbksC4UPbV3q1f/3XtJjvQUzVE33qiJU5QgklxGnOFXHAcM99Acb1eo24N5gkKAQ6plFgmN4NFpXXHNBUwKAS4bKtKzEcBn5bw86WELPqV8E1NW0UfOQwnBQQyBgO4DgpA4vIt0UTg06ASL3USZWov7pf2YjpuiI71ak/xyXYS8EyNSFDQFd2TRc9mKiMWFsWyeu54bGa0QC46+17xpmkI/j04s6bbD8PPC5v2P+8wXlNwNak5/yyVpIOj5imwmoOouiznRFpwMibts8VT4E9hYvz6TYQm71kyaaL2wam+r25H7Gb19wKV54BzR9rrH1ie0plEFt2pC6mmhvTEmK2NzSZVZ0AUVYoYlIhbEUoFePKzTphf3btKkxKEbbWMRUsMVK/XqGSlT6HdgOp9RGf3tbNJ5tkYLKvkgbl3u0tobvKYc7zVWCzp/5YwccuJHyK405V6daBL7D1SVMI7rSu5wmRSsMh4XheEjEpgoJHil/+5eX/pTkIaWJSmNm+NjxGrlM23UyGplDbEBlj/PXpXBqvpm0d19PE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7372.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(10070799003)(23010399003)(1800799024)(12006099003)(25016099003)(29003799003)(16056099006)(13003099007)(38070700021)(18002099003)(22082099003)(6133799003)(56012099006)(8096899003)(5023799004)(4143699003)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?uSY6/6Q8rGcokN3XVKnQ5LNygpZgyFk2yyDUbNkU1E0Mn0y2zKiy8mCQ5QCL?=
 =?us-ascii?Q?xfk0CiX3yj6zWNzv+j8hrn+/EGejifH28TIQHDMNcax398PMmsobdSPSbxMT?=
 =?us-ascii?Q?q0XGNEkPquGW+9N0LG38i/35VayHaYxDjM0E1m+mk6ut9x9nOnf3eXIVb2AF?=
 =?us-ascii?Q?Dj1kqufJD3Nc+RMJbWG9DKuQrEj7QlA6w8cnBN2Q55tA6oIelpA8vvBOYEXA?=
 =?us-ascii?Q?W8b6RHsWOmGwkasVd3B0R47EgvSMfTl/ysx71+t5gYYW1FKXH92eK+JxExQL?=
 =?us-ascii?Q?xaYylnXo2MUuw6TGhl+2LXTL27BoiiZ+HcuEuxsLiOkToHmhS/flPFLTYVUE?=
 =?us-ascii?Q?/OdQ1jitf3ISDkLA3dO4NOSEg11WMhyeT8woNMnKEvZ5uqsureaXoDmN+ySZ?=
 =?us-ascii?Q?t/6Om64Z4zR8WKq8wVZnHG0twNncu/oZhcIx5wxGGKXFFpPw+JyGuuSBrisG?=
 =?us-ascii?Q?KC1HZP4BYoQbMVvSik6dpbZCq8P/0miFviJ9vKdN91qbqR0MYjjMSOT/Valf?=
 =?us-ascii?Q?NTZia+6EIM5sEmSAzwjjigb6AgRQ+JxZcgMkqyRMdZxhHnc6IS4hUzfUSw32?=
 =?us-ascii?Q?0XHFj8NW3ZoYhyCGnvNjq/BV21iUOoAkhoe1fOkISDNiRbKByriOg4Wilorg?=
 =?us-ascii?Q?N1Np2J3znFkj90TFcj1Z2ckKgCACfVB8WXAXF2EvUEqt75VC6FGbNKWpCBiY?=
 =?us-ascii?Q?VHF41DVuBHxnma/xZdw/RzFxLt/594joSKgTlk2flr4vf/FRt0vwaTI4YvJr?=
 =?us-ascii?Q?A7NT3DhDi8TM+ptzH/+NfymkNnLEfyMepQb2vjlkrlUe6wRYNaDnwzuUVFV/?=
 =?us-ascii?Q?rrm1UOQCflbUiERFyccoOS4OOJoVuWoBNnijed8Rf8NhMOjy0PpOOkj/eQkc?=
 =?us-ascii?Q?FPxXTdCEruwmynWF4COxE7roPzVzumaTYtW7sTO1vvbxmtmw0Mi2wtq+ESW1?=
 =?us-ascii?Q?S36omKBD/gqXsXJrjzk4aP7qhtUM7QDEubA/XR/MmiOSgZLUyEFS5TfXVZpY?=
 =?us-ascii?Q?kivqeZM1cReA6Dp7zev30ZyNIs/g/7USsbGq8+0kp6Qap0tgUyMF7LvdFJMQ?=
 =?us-ascii?Q?c1Ak1WvZyyDljlP9qa6hMvj0J+DG5g0P3WUPYeR4XmxkyT8qyQqtVEtFBs2F?=
 =?us-ascii?Q?6KWz5kYNXaycBTpCrIbTk5Kcwr+uKkhZXL2hiFmTxthV2ZmFFNvSwRZJ80mH?=
 =?us-ascii?Q?WtC/cVo2GTVTAGmMSlkiLCGNYQ/tY01+QKdQBOobGJHwSpJ6Cie3FRAba+hU?=
 =?us-ascii?Q?fZ3BauNqUOVGW2eW4xnEObZEko76Xt/5Jh4k3NTgnuefLETvKcDHNXEOoxS7?=
 =?us-ascii?Q?dDowpCrHUqA1MV47Q+WkRELVx+e/rw7kv7KcqGPCDlgw0gh9e8Yw9wnzotp8?=
 =?us-ascii?Q?A9yexiAkmcb5ZAIwmoH2LJqYevNidTuzpdB+2w9zxRnyMQMsem//SAISZhz1?=
 =?us-ascii?Q?tq6+jcFGe3MFH0ksXsS+eQ7KOuWotdn2t17n5d4zI0mxXz3yDKW4WvUEtV/Z?=
 =?us-ascii?Q?SA0x212UkGIZblNLVUmibR2xgUd5F2Sbl7I2EMk5uDDIzKeTJuBM7QKt/l4r?=
 =?us-ascii?Q?xxpF53DTthS7gC7FP2vC79DZDJG8zms+l79Q+J5FR78f1iVgaRzQgMM+Fany?=
 =?us-ascii?Q?qXmFPkbQHaouU2iwrF6mLtFv77i2dGSFeCy69B3dRdcB/m1YBHoRIVjxy6W1?=
 =?us-ascii?Q?qd5SqMkDa9zc5fOT38IZ99BoerL+/rlOVW6TZyt80A/yphBJhe9Ej3T5czb/?=
 =?us-ascii?Q?P8D68BahMUGriyhqLBxUoLDOirSlUIxGI/seqaXE9RfJlGhF+7xN6S+PGFSc?=
x-ms-exchange-antispam-messagedata-1: kbaXJ91mXl0fR21q9ARVRj/npsy+69MaS2U=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	p9Ld4JsTj4rM437PCyaF62N77pBi3zvfmrRcC5zTroGOPgcvACWNMxwgznL+PS+e8kXsAmA2VkTUPOs3yu1hbX/vzu5oMD/5ySRV6EOI+RC9TrTBxhgIiSZTbCvcjJxbvrZmb7DRnD5lvJvUs1dHe2X3Yo+kQWUryk6RJ53E9xKpmb1ahp1w4sEkwvXgNM2zyRbBqKZBwycuZc515aPghC06WHmJ9umG/Zhu+6w+ijHyWDDGMNBeX09zaHFracJIcHJN0U/bTYLeKIHL2AR35Msl2ftIg9+kHScQK5iGvwowSxBq0M2ejCv1JFX61Wv/ctYpVEAW9qVYXELHfwP1fA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9430656b-b631-4144-5b4b-08dedd7c3417
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2026 05:37:45.2389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MeT6mzArf+8hYODKETc68JJD1Uq/jfuxwLrjyasovqpW3Ps9cOW+YaPh17u0qCxT5qiW142Ii8WswbYnPma4rju+cK53vVcADwaxWrff7xEX9/DJP7tInzusZcqG7u+q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a4f33ae cx=c_pps
 a=bt8r0o3PvT4lvF5YbTRm1A==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=iGHA9ds3AAAA:8 a=p0WdMEafAAAA:8 a=mDV3o1hIAAAA:8 a=GwUem0DFAAAA:8
 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=20KFwNOVAAAA:8 a=sT11ySLOCnt6LxsL9qQA:9
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=LWG5Gb75cuk545-xUIoA:9
 a=GSWj1PXMCcJdrITP:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfX3qVMZLH24mx2
 WbgjzVjYHxFPa2pXCYE2yD8ecCsmpQ3UCCEZ275YHYWn4yrEL0EwZnqGFqVZYdiR6WIT2lusBJd
 kLmhf3eIPa2ezG8Pjtva42KmExnZanRFEQJ8TNA8zhwY08DX70SQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA1MCBTYWx0ZWRfX1+zUul/Udn94
 pYc8rZTU6G4vuP5nVYgx9YrIvDC8+hIEG7zbRNgOi13fcMAqb8fjbptXd7dUe1xBRM+kCZZD9/o
 DoVFJhhyXyrsvscGzIabntY4I97a9RdFE7QwYDlS4fLeHqCjxv7hXCk2MSJGCU/ZGwns/p1LMKl
 dKDiG77Y8/ZmhQ13ZAzk3CCfwBZFsBjWbEtHVe8lzIEaPd+fIQ+kZpecA9zdugGvqdnNnsTVFAS
 feMHHuN9jyy0VP+vQ1PoDoKOO/GET0ve60yTLo2p+9nXko+O3B1lf3OqZ4iyqiM2ryqJGPI7ccD
 QIBNdqOC+dyyUvcWZFsuF0+1TIQXvcyUAvtjGkpApHTAqa+zc+5B1rh7iIuNyhiCMsXq5wiSrt6
 F/HAjeXplDePh5JiPkcDkZM+iLt/EHNkleoaLSponCLbCKtPrh8TVsk+1QbvqJEA9guaQLdfoFM
 5+gjzr0zWFQUV6R7Ijg==
X-Proofpoint-ORIG-GUID: PtTMpMO_HGZzfPFxYYVIFau-Q4iV0ILg
X-Proofpoint-GUID: Mu4HCGmq3AaVqae6JHXeqacEF57-cuHK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_05,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090050
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH3PR11MB7372E7F07854835B172C1F0C9BFE2CH3PR11MB7372namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:21:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240876

--_000_CH3PR11MB7372E7F07854835B172C1F0C9BFE2CH3PR11MB7372namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for reporting this. Yes, the musl build failure was due to a missing=
 LDADD for gnulib in the mini-dtls-fragments test.

I've addressed this by adding a separate patch (0001-tests-mini-dtls-framen=
ts-link-to-gnulib.patch) which adds the mini_dtls_fragments_LDADD =3D $(LDA=
DD) ../gl/libgnu.la line to tests/Makefile.am. This fix is already present =
on oe-core master (backported from upstream gnutls commit 68b2fb63c8df).

I've tested the build locally with MACHINE=3Dqemuarm64 TCLIBC=3Dmusl and it=
 succeeds.

The v2 patch series has been sent to the list - please refer to:

[wrynose][PATCH v2 1/2] gnutls: fix CVE-2026-33846
[wrynose][PATCH v2 2/2] gnutls: link mini-dtls-fragments test to gnulib

Thanks,
Pritam Srichandan Sahoo


________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Tuesday, June 30, 2026 22:31
To: Sahoo, Pritam Srichandan <PritamSrichandan.Sahoo@windriver.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
Cc: MacLeod, Randy <Randy.MacLeod@windriver.com>; Zhao, Yi <Yi.Zhao@windriv=
er.com>; Komati, Shiva <Shiva.Komati@windriver.com>; Chen, Qi <Qi.Chen@wind=
river.com>; Chen, Libo (CN) <Libo.Chen.CN@windriver.com>; Wang, Jinfeng (CN=
) <Jinfeng.Wang.CN@windriver.com>; Masih, Shailesh <Shailesh.Masih@windrive=
r.com>; Holmberg, Tomas <Tomas.Holmberg@windriver.com>; Yan, Haixiao (CN) <=
Haixiao.Yan.CN@windriver.com>
Subject: Re: [OE-core] [PATCH] gnutls: fix CVE-2026-33846

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Mon Jun 29, 2026 at 7:02 AM CEST, Pritam Srichandan Sahoo via lists.open=
embedded.org wrote:
> Backport upstream fixes for DTLS handshake fragment reassembly
> vulnerability (CVE-2026-33846).
>
> Includes:
> - 4f94e5cfe1f2: add basic DTLS fragment reassembly test
> - 9deffca528c2: shorten merge_handshake_packet using recv_buf
> - 65ab33fa54e3: add validation checks for DTLS fragment length and bounds
> - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816)
> - bb427ff74dba: add fragmented ClientHello test coverage
> - 092c65d004e2: match DTLS datagrams by handshake sequence number
> - a2b41be83a1a: add test for mismatched message_seq handling (#1839)
>
> These commits are included in gnutls 3.8.13 and are backported by
> both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream
> (gnutls-3.8.10-4.el10) using identical commit selection.
>
> Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver.=
com>"
> ---

Hello,

looks like it breaks musl build:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/builds/643/st=
eps/12/logs/stdio (line 18053)

Can you check please?

Thanks!

>  .../gnutls/gnutls/CVE-2026-33846.patch        | 862 ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.8.12.bb  |   1 +
>  2 files changed, 863 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-33846.pat=
ch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b/me=
ta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> new file mode 100644
> index 0000000000..5c85a531b3
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch
> @@ -0,0 +1,862 @@
> +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 20 Mar 2026 16:09:40 +0100
> +Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTLS t=
est
> +
> +Upstream-Status: Backport
> +[1] https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0=
752e7e0daf43b9
> +[2] https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd=
4bb1bf4cbd1fc0
> +[3] https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b=
7df3d383d1ff78
> +[4] https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb=
101fb058565d87
> +[5] https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8=
511e873f762743
> +[6] https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84=
d801ac49a09f78
> +[7] https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf549=
58da91a656550e
> +
> +CVE: CVE-2026-33846
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +Signed-off-by: Pritam Srichandan Sahoo <PritamSrichandan.Sahoo@windriver=
.com>
> +---
> + tests/Makefile.am           |   7 +-
> + tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++++
> + 2 files changed, 214 insertions(+), 1 deletion(-)
> + create mode 100644 tests/mini-dtls-fragments.c
> +
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index aeeaaf79d..586f1952d 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -241,7 +241,8 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast se=
t_pkcs12_cred cert certuniquei
> +      x509cert-dntypes id-on-xmppAddr tls13-compat-mode ciphersuite-name=
 \
> +      x509-upnconstraint xts-key-check cipher-padding pkcs7-verify-doubl=
e-free \
> +      fips-rsa-sizes tls12-rehandshake-ticket pathbuf tls-force-ems \
> +-     psk-importer privkey-derive dh-compute2 ecdh-compute2
> ++     psk-importer privkey-derive dh-compute2 ecdh-compute2 \
> ++     mini-dtls-fragments
> +
> + ctests +=3D tls-channel-binding
> +
> +@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \
> +     -I$(top_srcdir)/gl      \
> +     -I$(top_builddir)/gl
> +
> ++mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \
> ++    -I$(top_srcdir)/gl      \
> ++    -I$(top_builddir)/gl
> ++
> + if ENABLE_PKCS11
> + if !WINDOWS
> + ctests +=3D tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkcs11=
-no-key \
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +new file mode 100644
> +index 000000000..ee75feeb6
> +--- /dev/null
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -0,0 +1,208 @@
> ++/*
> ++ * Copyright (C) 2026 Red Hat, Inc.
> ++ *
> ++ * Author: Alexander Sosedkin
> ++ *
> ++ * This file is part of GnuTLS.
> ++ *
> ++ * GnuTLS is free software; you can redistribute it and/or modify it
> ++ * under the terms of the GNU General Public License as published by
> ++ * the Free Software Foundation; either version 3 of the License, or
> ++ * (at your option) any later version.
> ++ *
> ++ * GnuTLS is distributed in the hope that it will be useful, but
> ++ * WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++ * General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU Lesser General Public Lic=
ense
> ++ * along with this program.  If not, see <https://www.gnu.org/licenses/=
>
> ++ */
> ++
> ++#ifdef HAVE_CONFIG_H
> ++#include "config.h"
> ++#endif
> ++
> ++#include <stdio.h>
> ++#include <stdlib.h>
> ++
> ++#if defined(_WIN32)
> ++
> ++int main(void)
> ++{
> ++    exit(77);
> ++}
> ++
> ++#else
> ++
> ++#include <assert.h>
> ++#include <errno.h>
> ++#include <stdbool.h>
> ++#include <stdint.h>
> ++#include <string.h>
> ++#include <gnutls/gnutls.h>
> ++#include <gnutls/dtls.h>
> ++#include "cert-common.h"
> ++#include "utils.h"
> ++
> ++#include "attribute.h"
> ++
> ++static void server_log_func(int level, const char *str)
> ++{
> ++    fprintf(stderr, "server|<%d>| %s", level, str);
> ++}
> ++
> ++static void client_log_func(int level, const char *str)
> ++{
> ++    fprintf(stderr, "client|<%d>| %s", level, str);
> ++}
> ++
> ++#define QUEUE_SIZE 1024
> ++#define PACKET_SIZE 2048
> ++
> ++typedef struct {
> ++    uint8_t buf[PACKET_SIZE];
> ++    size_t len;
> ++} packet_t;
> ++typedef struct {
> ++    packet_t packets[QUEUE_SIZE];
> ++    size_t head;
> ++    size_t tail;
> ++} queue_t;
> ++
> ++static queue_t c2s, s2c;
> ++
> ++static int queue_put(queue_t *q, const void *buf, size_t len)
> ++{
> ++    assert(len <=3D PACKET_SIZE);
> ++    memcpy(q->packets[q->tail].buf, buf, len);
> ++    q->packets[q->tail].len =3D len;
> ++    q->tail++;
> ++    q->tail %=3D QUEUE_SIZE;
> ++    assert(q->tail !=3D q->head);
> ++    return len;
> ++}
> ++
> ++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, siz=
e_t len)
> ++{
> ++    if (q->head =3D=3D q->tail) {
> ++            gnutls_transport_set_errno(s, EAGAIN);
> ++            return -1;
> ++    }
> ++    size_t n =3D q->packets[q->head].len;
> ++    memcpy(buf, q->packets[q->head].buf, n);
> ++    q->head++;
> ++    q->head %=3D QUEUE_SIZE;
> ++    return n;
> ++}
> ++
> ++static void queue_reset(queue_t *q)
> ++{
> ++    q->head =3D q->tail =3D 0;
> ++}
> ++
> ++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)
> ++{
> ++    return 1;
> ++}
> ++
> ++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> ++{
> ++    return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> ++{
> ++    return queue_get(&s2c, (gnutls_session_t)tr, b, l);
> ++}
> ++
> ++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b, si=
ze_t l)
> ++{
> ++    return queue_put(&s2c, b, l);
> ++}
> ++
> ++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const void=
 *b,
> ++                              size_t l)
> ++{
> ++    return queue_put(&c2s, b, l);
> ++}
> ++
> ++static void test(gnutls_push_func client_push)
> ++{
> ++    gnutls_session_t client, server;
> ++    gnutls_certificate_credentials_t ccred, scred;
> ++    int cr =3D 0, sr =3D 0;
> ++    bool cdone =3D false, sdone =3D false;
> ++
> ++    if (debug)
> ++            gnutls_global_set_log_level(4711);
> ++
> ++    gnutls_certificate_allocate_credentials(&scred);
> ++    gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_ke=
y,
> ++                                        GNUTLS_X509_FMT_PEM);
> ++    gnutls_certificate_allocate_credentials(&ccred);
> ++
> ++    gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++    gnutls_init(&client, GNUTLS_CLIENT | GNUTLS_DATAGRAM);
> ++
> ++    gnutls_priority_set_direct(server, "NORMAL:-VERS-ALL:+VERS-DTLS1.2"=
,
> ++                               NULL);
> ++    gnutls_priority_set_direct(client, "NORMAL:-VERS-ALL:+VERS-DTLS1.2"=
,
> ++                               NULL);
> ++
> ++    gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++    gnutls_credentials_set(client, GNUTLS_CRD_CERTIFICATE, ccred);
> ++
> ++    gnutls_dtls_set_timeouts(client, get_dtls_retransmit_timeout(),
> ++                             get_timeout());
> ++    gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++                             get_timeout());
> ++
> ++    gnutls_transport_set_ptr(client, client);
> ++    gnutls_transport_set_push_function(client, client_push);
> ++    gnutls_transport_set_pull_function(client, client_pull);
> ++    gnutls_transport_set_pull_timeout_function(client, pull_timeout);
> ++
> ++    gnutls_transport_set_ptr(server, server);
> ++    gnutls_transport_set_push_function(server, server_push);
> ++    gnutls_transport_set_pull_function(server, server_pull);
> ++    gnutls_transport_set_pull_timeout_function(server, pull_timeout);
> ++
> ++    while (!cdone || !sdone) {
> ++            gnutls_global_set_log_function(client_log_func);
> ++            if (!cdone)
> ++                    cr =3D gnutls_handshake(client);
> ++            if (!cr || gnutls_error_is_fatal(cr))
> ++                    cdone =3D true;
> ++
> ++            gnutls_global_set_log_function(server_log_func);
> ++            if (!sdone)
> ++                    sr =3D gnutls_handshake(server);
> ++            if (!sr || gnutls_error_is_fatal(sr))
> ++                    sdone =3D true;
> ++    }
> ++
> ++    if (cr)
> ++            fail("client: %s\n", gnutls_strerror(cr));
> ++    if (sr)
> ++            fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++    success("OK\n");
> ++
> ++    queue_reset(&c2s);
> ++    queue_reset(&s2c);
> ++
> ++    gnutls_deinit(client);
> ++    gnutls_deinit(server);
> ++    gnutls_certificate_free_credentials(ccred);
> ++    gnutls_certificate_free_credentials(scred);
> ++}
> ++
> ++void doit(void)
> ++{
> ++    global_init();
> ++    test(client_push_normal);
> ++    gnutls_global_deinit();
> ++}
> ++
> ++#endif /* _WIN32 */
> +--
> +2.54.0
> +
> +
> +From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 17:49:31 +0200
> +Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using recv_=
buf
> +
> +I had vague concerns about thread-safety of this,
> +but then this pattern already exists within the file.
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 52 +++++++++++++++++----------------------------------
> + 1 file changed, 17 insertions(+), 35 deletions(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 672380b05..d54c77022 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session_t =
session,
> +     int exists =3D 0, i, pos =3D 0;
> +     int ret;
> +
> ++    handshake_buffer_st *recv_buf =3D
> ++            session->internals.handshake_recv_buffer;
> ++
> +     for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i+=
+) {
> +-            if (session->internals.handshake_recv_buffer[i].htype =3D=
=3D
> +-                hsk->htype) {
> ++            if (recv_buf[i].htype =3D=3D hsk->htype) {
> +                     exists =3D 1;
> +                     pos =3D i;
> +                     break;
> +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_session=
_t session,
> +             _gnutls_write_uint24(0, &hsk->header[6]);
> +             _gnutls_write_uint24(hsk->length, &hsk->header[9]);
> +
> +-            _gnutls_handshake_buffer_move(
> +-                    &session->internals.handshake_recv_buffer[pos], hsk=
);
> ++            _gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +
> +     } else {
> +-            if (hsk->start_offset <
> +-                        session->internals.handshake_recv_buffer[pos]
> +-                                .start_offset &&
> +-                hsk->end_offset + 1 >=3D
> +-                        session->internals.handshake_recv_buffer[pos]
> +-                                .start_offset) {
> +-                    memcpy(&session->internals.handshake_recv_buffer[po=
s]
> +-                                    .data.data[hsk->start_offset],
> ++            if (hsk->start_offset < recv_buf[pos].start_offset &&
> ++                hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> ++                    memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +                            hsk->data.data, hsk->data.length);
> +-                    session->internals.handshake_recv_buffer[pos]
> +-                            .start_offset =3D hsk->start_offset;
> +-                    session->internals.handshake_recv_buffer[pos]
> +-                            .end_offset =3D MIN(
> +-                            hsk->end_offset,
> +-                            session->internals.handshake_recv_buffer[po=
s]
> +-                                    .end_offset);
> +-            } else if (hsk->end_offset >
> +-                               session->internals.handshake_recv_buffer=
[pos]
> +-                                       .end_offset &&
> +-                       hsk->start_offset <=3D
> +-                               session->internals.handshake_recv_buffer=
[pos]
> +-                                               .end_offset +
> +-                                       1) {
> +-                    memcpy(&session->internals.handshake_recv_buffer[po=
s]
> +-                                    .data.data[hsk->start_offset],
> ++                    recv_buf[pos].start_offset =3D hsk->start_offset;
> ++                    recv_buf[pos].end_offset =3D
> ++                            MIN(hsk->end_offset, recv_buf[pos].end_offs=
et);
> ++            } else if (hsk->end_offset > recv_buf[pos].end_offset &&
> ++                       hsk->start_offset <=3D recv_buf[pos].end_offset =
+ 1) {
> ++                    memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +                            hsk->data.data, hsk->data.length);
> +
> +-                    session->internals.handshake_recv_buffer[pos]
> +-                            .end_offset =3D hsk->end_offset;
> +-                    session->internals.handshake_recv_buffer[pos]
> +-                            .start_offset =3D MIN(
> +-                            hsk->start_offset,
> +-                            session->internals.handshake_recv_buffer[po=
s]
> +-                                    .start_offset);
> ++                    recv_buf[pos].end_offset =3D hsk->end_offset;
> ++                    recv_buf[pos].start_offset =3D MIN(
> ++                            hsk->start_offset, recv_buf[pos].start_offs=
et);
> +             }
> +             _gnutls_handshake_buffer_clear(hsk);
> +     }
> +--
> +2.54.0
> +
> +
> +From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Fri, 17 Apr 2026 18:21:36 +0200
> +Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly
> +
> +Previously, gnutls didn't check that DTLS fragments claimed
> +a consistent message_length value.
> +Additionally, a crucial array size check was missing,
> +enabling an attacker to cause a heap overwrite.
> +The updated version rejects fragments with mismatching length
> +and adds a missing boundary check.
> +
> +Reported-by: Haruto Kimura (Stella)
> +Reported-by: Oscar Reparaz
> +Reported-by: Zou Dikai
> +Fixes: #1816
> +Fixes: #1838
> +Fixes: #1839
> +Fixes: CVE-2026-33846
> +Fixes: GNUTLS-SA-2026-04-29-1
> +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H
> +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index d54c77022..5d4d16276 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_session_=
t session,
> +             _gnutls_handshake_buffer_move(&recv_buf[pos], hsk);
> +
> +     } else {
> ++            if (hsk->length !=3D recv_buf[pos].length) {
> ++                    /* inconsistent across fragments */
> ++                    _gnutls_handshake_buffer_clear(hsk);
> ++                    return gnutls_assert_val(
> ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++            }
> ++            /* start_offset + data.length <=3D hsk->length <=3D max_len=
gth */
> ++            if (hsk->length < hsk->start_offset + hsk->data.length) {
> ++                    /* impossible claims, overflow requested */
> ++                    _gnutls_handshake_buffer_clear(hsk);
> ++                    return gnutls_assert_val(
> ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++            }
> ++            if (hsk->length > recv_buf[pos].data.max_length) {
> ++                    /* we don't have this much allocated, overflow guar=
d */
> ++                    _gnutls_handshake_buffer_clear(hsk);
> ++                    return gnutls_assert_val(
> ++                            GNUTLS_E_UNEXPECTED_PACKET_LENGTH);
> ++            }
> ++
> +             if (hsk->start_offset < recv_buf[pos].start_offset &&
> +                 hsk->end_offset + 1 >=3D recv_buf[pos].start_offset) {
> +                     memcpy(&recv_buf[pos].data.data[hsk->start_offset],
> +--
> +2.54.0
> +
> +
> +From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Wed, 1 Apr 2026 19:51:45 +0200
> +Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 repr=
oducer
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 120 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index ee75feeb6..8d5a18acd 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t tr, =
unsigned ms)
> +     return 1;
> + }
> +
> ++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned ms=
)
> ++{
> ++    return c2s.head !=3D c2s.tail ? 1 : 0;
> ++}
> ++
> + static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_t l=
)
> + {
> +     return queue_get(&c2s, (gnutls_session_t)tr, b, l);
> +@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)
> +     gnutls_certificate_free_credentials(scred);
> + }
> +
> ++static void test_malicious1816(void)
> ++{
> ++    /* dgram1: msg_len=3D50, frag_offset=3D25, frag_len=3D25 */
> ++    static const uint8_t dgram1_hdr[] =3D {
> ++            0x16, /* type: handshake */
> ++            0xfe, 0xfd, /* version: DTLS 1.2 */
> ++            0x00, 0x00, /* epoch: 0 */
> ++            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */
> ++            0x00, 0x25, /* record_length: 37 */
> ++            0x01, /* msg_type: ClientHello */
> ++            0x00, 0x00, 0x32, /* msg_length: 50 */
> ++            0x00, 0x00, /* msg_seq: 0 */
> ++            0x00, 0x00, 0x19, /* frag_offset: 25 */
> ++            0x00, 0x00, 0x19, /* frag_length: 25 */
> ++    };
> ++    /* dgram2: msg_len=3D3000, frag_offset=3D0, frag_len=3D48 */
> ++    static const uint8_t dgram2_hdr[] =3D {
> ++            0x16, /* type: handshake */
> ++            0xfe, 0xfd, /* version: DTLS 1.2 */
> ++            0x00, 0x00, /* epoch: 0 */
> ++            0x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */
> ++            0x00, 0x3c, /* record_length: 60 */
> ++            0x01, /* msg_type: ClientHello */
> ++            0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++            0x00, 0x00, /* msg_seq: 0 */
> ++            0x00, 0x00, 0x00, /* frag_offset: 0 */
> ++            0x00, 0x00, 0x30, /* frag_length: 48 */
> ++    };
> ++    /* dgram3: msg_len=3D3000, frag_offset=3D40, frag_len=3D1475 */
> ++    static const uint8_t dgram3_hdr[] =3D {
> ++            0x16, /* type: handshake */
> ++            0xfe, 0xfd, /* version: DTLS 1.2 */
> ++            0x00, 0x00, /* epoch: 0 */
> ++            0x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */
> ++            0x05, 0xcf, /* record_length: 1487 */
> ++            0x01, /* msg_type: ClientHello */
> ++            0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++            0x00, 0x00, /* msg_seq: 0 */
> ++            0x00, 0x00, 0x28, /* frag_offset: 40 */
> ++            0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++    };
> ++    /* dgram4: msg_len=3D3000, frag_offset=3D1500, frag_len=3D1475 */
> ++    static const uint8_t dgram4_hdr[] =3D {
> ++            0x16, /* type: handshake */
> ++            0xfe, 0xfd, /* version: DTLS 1.2 */
> ++            0x00, 0x00, /* epoch: 0 */
> ++            0x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */
> ++            0x05, 0xcf, /* record_length: 1487 */
> ++            0x01, /* msg_type: ClientHello */
> ++            0x00, 0x0b, 0xb8, /* msg_length: 3000 */
> ++            0x00, 0x00, /* msg_seq: 0 */
> ++            0x00, 0x05, 0xdc, /* frag_offset: 1500 */
> ++            0x00, 0x05, 0xc3, /* frag_length: 1475 */
> ++    };
> ++    gnutls_session_t server;
> ++    gnutls_certificate_credentials_t scred;
> ++    uint8_t dgram[1500];
> ++    int sr;
> ++
> ++    if (debug)
> ++            gnutls_global_set_log_level(4711);
> ++
> ++    gnutls_certificate_allocate_credentials(&scred);
> ++    gnutls_certificate_set_x509_key_mem(scred, &server_cert, &server_ke=
y,
> ++                                        GNUTLS_X509_FMT_PEM);
> ++
> ++    gnutls_init(&server, GNUTLS_SERVER | GNUTLS_DATAGRAM);
> ++    gnutls_priority_set_direct(server, "NORMAL:+VERS-DTLS1.2", NULL);
> ++    gnutls_credentials_set(server, GNUTLS_CRD_CERTIFICATE, scred);
> ++
> ++    gnutls_dtls_set_timeouts(server, get_dtls_retransmit_timeout(),
> ++                             get_timeout());
> ++
> ++    gnutls_transport_set_ptr(server, server);
> ++    gnutls_transport_set_push_function(server, server_push);
> ++    gnutls_transport_set_pull_function(server, server_pull);
> ++    gnutls_transport_set_pull_timeout_function(server,
> ++                                               c2s_pull_timeout_once);
> ++
> ++    memset(dgram, 0, sizeof(dgram));
> ++    memcpy(dgram, dgram1_hdr, 25);
> ++    queue_put(&c2s, dgram, 25 + 25);
> ++
> ++    memset(dgram, 0, sizeof(dgram));
> ++    memcpy(dgram, dgram2_hdr, 25);
> ++    queue_put(&c2s, dgram, 25 + 48);
> ++
> ++    memset(dgram, 0, sizeof(dgram));
> ++    memcpy(dgram, dgram3_hdr, 25);
> ++    queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++    memset(dgram, 0, sizeof(dgram));
> ++    memcpy(dgram, dgram4_hdr, 25);
> ++    queue_put(&c2s, dgram, 25 + 1475);
> ++
> ++    gnutls_global_set_log_function(server_log_func);
> ++    do {
> ++            sr =3D gnutls_handshake(server); /* invalid write if vulner=
able */
> ++    } while (c2s.head !=3D c2s.tail && !gnutls_error_is_fatal(sr));
> ++    if (sr !=3D GNUTLS_E_UNEXPECTED_PACKET_LENGTH)
> ++            fail("server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, "
> ++                 "got: %s\n",
> ++                 gnutls_strerror(sr));
> ++
> ++    success("OK\n");
> ++
> ++    queue_reset(&c2s);
> ++    queue_reset(&s2c);
> ++
> ++    gnutls_deinit(server);
> ++    gnutls_certificate_free_credentials(scred);
> ++}
> ++
> + void doit(void)
> + {
> +     global_init();
> +     test(client_push_normal);
> ++    success("malicious reassembly bug exploitation (#1816):\n");
> ++    test_malicious1816();
> +     gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> +
> +From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:08:11 +0200
> +Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenting
> + ClientHello
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++++
> + 1 file changed, 107 insertions(+)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 8d5a18acd..93490bac2 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transport_=
ptr_t tr, const void *b,
> +     return queue_put(&c2s, b, l);
> + }
> +
> ++static void write_u16(uint8_t *p, uint16_t val)
> ++{
> ++    p[0] =3D val >> 8;
> ++    p[1] =3D val & 0xff;
> ++}
> ++
> ++static void write_u24(uint8_t *p, uint32_t val)
> ++{
> ++    p[0] =3D (val >> 16) & 0xff;
> ++    p[1] =3D (val >> 8) & 0xff;
> ++    p[2] =3D val & 0xff;
> ++}
> ++
> ++static void write_u48(uint8_t *p, uint64_t seq)
> ++{
> ++    int i;
> ++    for (i =3D 5; i >=3D 0; i--) {
> ++            p[i] =3D seq & 0xff;
> ++            seq >>=3D 8;
> ++    }
> ++}
> ++
> ++static uint64_t read_u48(const uint8_t *p)
> ++{
> ++    uint64_t seq =3D 0;
> ++    int i;
> ++    for (i =3D 5; i >=3D 0; i--) {
> ++            seq <<=3D 8;
> ++            seq |=3D p[i];
> ++    }
> ++    return seq;
> ++}
> ++
> + static void test(gnutls_push_func client_push)
> + {
> +     gnutls_session_t client, server;
> +@@ -316,12 +349,86 @@ static void test_malicious1816(void)
> +     gnutls_certificate_free_credentials(scred);
> + }
> +
> ++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data, si=
ze_t l,
> ++                                int delta_n)
> ++{
> ++    if (delta_n =3D=3D 0 || l < 13 || data[3] !=3D 0 || data[4] !=3D 0)
> ++            return queue_put(&c2s, data, l);
> ++
> ++    uint8_t *p =3D malloc(l);
> ++    assert(p);
> ++    memcpy(p, data, l);
> ++    write_u48(p + 5, read_u48(p + 5) + delta_n);
> ++    ssize_t ret =3D queue_put(q, p, l);
> ++    free(p);
> ++    return ret;
> ++}
> ++
> ++static void split_client_hello(const uint8_t *data, size_t len, uint8_t=
 **frag1,
> ++                           size_t *frag1_len, uint8_t **frag2,
> ++                           size_t *frag2_len)
> ++{
> ++    size_t body_size =3D len - 25;
> ++    *frag1_len =3D 13 + 12 + 1;
> ++    *frag2_len =3D 13 + 12 + (body_size - 1);
> ++
> ++    *frag1 =3D malloc(13 + 12 + 1);
> ++    assert(*frag1);
> ++    *frag2 =3D malloc(13 + 12 + body_size - 1);
> ++    assert(*frag2);
> ++
> ++    /* first fragment: record header + handshake header + first body by=
te */
> ++    memcpy(*frag1, data, 13); /* record header */
> ++    write_u16(*frag1 + 11, 12 + 1); /* record length */
> ++    memcpy(*frag1 + 13, data + 13, 12); /* handshake header */
> ++    write_u24(*frag1 + 19, 0); /* fragment_offset =3D 0 */
> ++    write_u24(*frag1 + 22, 1); /* fragment_length =3D 1 */
> ++    (*frag1)[25] =3D data[25]; /* first body byte */
> ++
> ++    /* second fragment: record header + handshake header + remaining bo=
dy */
> ++    memcpy(*frag2, data, 13); /* record header */
> ++    write_u16(*frag2 + 11, *frag2_len - 13); /* record length */
> ++    write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); /* sequence number=
 */
> ++    memcpy(*frag2 + 13, data + 13, 12); /* handshake header */
> ++    write_u24(*frag2 + 19, 1); /* fragment_offset =3D 1 */
> ++    write_u24(*frag2 + 22, body_size - 1); /* shortened fragment_length=
 */
> ++    memcpy(*frag2 + 25, data + 26, body_size - 1); /* remaining body */
> ++}
> ++
> ++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, const=
 void *b,
> ++                                   size_t l)
> ++{
> ++    static int seq_offset =3D 0; /* for renumbering follow-up epoch0 on=
es */
> ++
> ++    const uint8_t *data =3D (const uint8_t *)b;
> ++    uint8_t *frag1, *frag2;
> ++    size_t frag1_len, frag2_len;
> ++
> ++    /* Pass through anything that isn't an epoch0 ClientHello with body=
 */
> ++    if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++        data[0] !=3D 22 || /* not a handshake record */
> ++        data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
> ++        data[13] !=3D 1) /* not ClientHello */
> ++            return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++    /* epoch0 Client Hello: special treatment of splitting into fragmen=
ts */
> ++    split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len)=
;
> ++    queue_put(&c2s, frag1, frag1_len);
> ++    queue_put(&c2s, frag2, frag2_len);
> ++    free(frag1);
> ++    free(frag2);
> ++    seq_offset++;
> ++    return l;
> ++}
> ++
> + void doit(void)
> + {
> +     global_init();
> +     test(client_push_normal);
> +     success("malicious reassembly bug exploitation (#1816):\n");
> +     test_malicious1816();
> ++    success("split client hello smoke-test\n");
> ++    test(client_push_split_hello);
> +     gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> +
> +From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:32:02 +0200
> +Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number
> +
> +DTLS handshake fragment reassembly previously matched incoming fragments
> +by handshake type only, without checking the sequence number.
> +This allowed fragments from different handshake messages
> +to be merged into the same reassembly buffer.
> +
> +Now sequence number is accounted for during reassembly,
> +ensuring fragments are only merged when they belong
> +to the same handshake message.
> +
> +Reported-by: Zou Dikai
> +Fixes: #1839
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + lib/buffers.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/buffers.c b/lib/buffers.c
> +index 5d4d16276..62f140ed3 100644
> +--- a/lib/buffers.c
> ++++ b/lib/buffers.c
> +@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_t s=
ession,
> +             session->internals.handshake_recv_buffer;
> +
> +     for (i =3D 0; i < session->internals.handshake_recv_buffer_size; i+=
+) {
> +-            if (recv_buf[i].htype =3D=3D hsk->htype) {
> ++            if (recv_buf[i].htype =3D=3D hsk->htype &&
> ++                recv_buf[i].sequence =3D=3D hsk->sequence) {
> +                     exists =3D 1;
> +                     pos =3D i;
> +                     break;
> +--
> +2.54.0
> +
> +
> +From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 2001
> +From: Alexander Sosedkin <asosedkin@redhat.com>
> +Date: Mon, 20 Apr 2026 16:36:08 +0200
> +Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching messag=
e_seq
> +
> +Signed-off-by: Alexander Sosedkin <asosedkin@redhat.com>
> +---
> + tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++-----
> + 1 file changed, 47 insertions(+), 7 deletions(-)
> +
> +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.c
> +index 93490bac2..499a92a92 100644
> +--- a/tests/mini-dtls-fragments.c
> ++++ b/tests/mini-dtls-fragments.c
> +@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)
> +     return seq;
> + }
> +
> +-static void test(gnutls_push_func client_push)
> ++static void test(gnutls_push_func client_push, bool expect_success)
> + {
> +     gnutls_session_t client, server;
> +     gnutls_certificate_credentials_t ccred, scred;
> +@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)
> +                     sr =3D gnutls_handshake(server);
> +             if (!sr || gnutls_error_is_fatal(sr))
> +                     sdone =3D true;
> ++
> ++            if (c2s.head =3D=3D c2s.tail && s2c.head =3D=3D s2c.tail)
> ++                    break; /* speed the test up */
> +     }
> +
> +-    if (cr)
> +-            fail("client: %s\n", gnutls_strerror(cr));
> +-    if (sr)
> +-            fail("server: %s\n", gnutls_strerror(sr));
> ++    if (expect_success) {
> ++            if (cr)
> ++                    fail("client: %s\n", gnutls_strerror(cr));
> ++            if (sr)
> ++                    fail("server: %s\n", gnutls_strerror(sr));
> ++
> ++    } else {
> ++            if (cr =3D=3D 0 && sr =3D=3D 0)
> ++                    fail("handshake unexpectedly succeeded: %s / %s\n",
> ++                         gnutls_strerror(cr), gnutls_strerror(sr));
> ++    }
> +
> +     success("OK\n");
> +
> +@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_tran=
sport_ptr_t tr, const void *b,
> +     return l;
> + }
> +
> ++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_t t=
r,
> ++                                           const void *b, size_t l)
> ++{
> ++    /* gnutls wasn't matching on message_seq on merging, see #1839 */
> ++    static int seq_offset =3D 0; /* for renumbering follow-up epoch0 on=
es */
> ++
> ++    const uint8_t *data =3D (const uint8_t *)b;
> ++    uint8_t *frag1, *frag2;
> ++    size_t frag1_len, frag2_len;
> ++
> ++    /* Pass through anything that isn't an epoch0 ClientHello with body=
 */
> ++    if (l < 13 + 12 + 1 || /* too short for DTLS record header */
> ++        data[0] !=3D 22 || /* not a handshake record */
> ++        data[3] !=3D 0 || data[4] !=3D 0 || /* not epoch 0 */
> ++        data[13] !=3D 1) /* not ClientHello */
> ++            return queue_put_renumbered(&c2s, b, l, seq_offset);
> ++
> ++    /* epoch0 Client Hello: special treatment of splitting into fragmen=
ts */
> ++    split_client_hello(data, l, &frag1, &frag1_len, &frag2, &frag2_len)=
;
> ++    queue_put(&c2s, frag1, frag1_len);
> ++    frag2[18]++; /* WRONG, message_seq mismatch must be rejected, #1839=
 */
> ++    queue_put(&c2s, frag2, frag2_len);
> ++    free(frag1);
> ++    free(frag2);
> ++    seq_offset++;
> ++    return l;
> ++}
> ++
> + void doit(void)
> + {
> +     global_init();
> +-    test(client_push_normal);
> ++    test(client_push_normal, true);
> +     success("malicious reassembly bug exploitation (#1816):\n");
> +     test_malicious1816();
> +     success("split client hello smoke-test\n");
> +-    test(client_push_split_hello);
> ++    test(client_push_split_hello, true);
> ++    success("split client hello smoke-test and mangle sequence number\n=
");
> ++    test(client_push_split_hello_bad_seq, false);
> +     gnutls_global_deinit();
> + }
> +
> +--
> +2.54.0
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recipes-=
support/gnutls/gnutls_3.8.12.bb
> index 8554ab943d..3ae7a2eb78 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v$=
{SHRT_VER}/gnutls-${PV}.tar
>             file://run-ptest \
>             file://Add-ptest-support.patch \
>             file://c99.patch \
> +           file://CVE-2026-33846.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "a7b341421bfd459acf7a374ca4af3b9e06608dcd7bd792b2=
bf470bea012b8e51"


--
Yoann Congal
Smile ECS


--_000_CH3PR11MB7372E7F07854835B172C1F0C9BFE2CH3PR11MB7372namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for reporting this. Yes, the musl build failure was due to a missing=
 LDADD for gnulib in the mini-dtls-fragments test.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've addressed this by adding a separate patch (0001-tests-mini-dtls-framen=
ts-link-to-gnulib.patch) which adds the mini_dtls_fragments_LDADD =3D $(LDA=
DD) ../gl/libgnu.la line to tests/Makefile.am. This fix is already present =
on oe-core master (backported from
 upstream gnutls commit 68b2fb63c8df).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've tested the build locally with MACHINE=3Dqemuarm64 TCLIBC=3Dmusl and it=
 succeeds.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The v2 patch series has been sent to the list &#8212; please refer to:</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[wrynose][PATCH v2 1/2] gnutls: fix CVE-2026-33846</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
[wrynose][PATCH v2 2/2] gnutls: link mini-dtls-fragments test to gnulib</di=
v>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Pritam Srichandan Sahoo</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Tuesday, June 30, 2026 22:31<br>
<b>To:</b> Sahoo, Pritam Srichandan &lt;PritamSrichandan.Sahoo@windriver.co=
m&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists=
.openembedded.org&gt;<br>
<b>Cc:</b> MacLeod, Randy &lt;Randy.MacLeod@windriver.com&gt;; Zhao, Yi &lt=
;Yi.Zhao@windriver.com&gt;; Komati, Shiva &lt;Shiva.Komati@windriver.com&gt=
;; Chen, Qi &lt;Qi.Chen@windriver.com&gt;; Chen, Libo (CN) &lt;Libo.Chen.CN=
@windriver.com&gt;; Wang, Jinfeng (CN) &lt;Jinfeng.Wang.CN@windriver.com&gt=
;;
 Masih, Shailesh &lt;Shailesh.Masih@windriver.com&gt;; Holmberg, Tomas &lt;=
Tomas.Holmberg@windriver.com&gt;; Yan, Haixiao (CN) &lt;Haixiao.Yan.CN@wind=
river.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [PATCH] gnutls: fix CVE-2026-33846</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Mon Jun 29, 2026 at 7:02 AM CEST, Pritam Srichandan Sahoo via lists.open=
embedded.org wrote:<br>
&gt; Backport upstream fixes for DTLS handshake fragment reassembly<br>
&gt; vulnerability (CVE-2026-33846).<br>
&gt;<br>
&gt; Includes:<br>
&gt; - 4f94e5cfe1f2: add basic DTLS fragment reassembly test<br>
&gt; - 9deffca528c2: shorten merge_handshake_packet using recv_buf<br>
&gt; - 65ab33fa54e3: add validation checks for DTLS fragment length and bou=
nds<br>
&gt; - cf3f1955e58c: add reproducer for DTLS fragment reassembly bug (#1816=
)<br>
&gt; - bb427ff74dba: add fragmented ClientHello test coverage<br>
&gt; - 092c65d004e2: match DTLS datagrams by handshake sequence number<br>
&gt; - a2b41be83a1a: add test for mismatched message_seq handling (#1839)<b=
r>
&gt;<br>
&gt; These commits are included in gnutls 3.8.13 and are backported by<br>
&gt; both Debian (gnutls28_3.8.9-3+deb13u4) and CentOS 10-stream<br>
&gt; (gnutls-3.8.10-4.el10) using identical commit selection.<br>
&gt;<br>
&gt; Signed-off-by: Pritam Srichandan Sahoo &lt;PritamSrichandan.Sahoo@wind=
river.com&gt;&quot;<br>
&gt; ---<br>
<br>
Hello,<br>
<br>
looks like it breaks musl build:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/109/bu=
ilds/643/steps/12/logs/stdio">https://autobuilder.yoctoproject.org/valkyrie=
/?#/builders/109/builds/643/steps/12/logs/stdio</a> (line 18053)<br>
<br>
Can you check please?<br>
<br>
Thanks!<br>
<br>
&gt;&nbsp; .../gnutls/gnutls/CVE-2026-33846.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 862 ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/gnutls/gnutls_3.8.12.bb&nbsp; |&nbsp;&nbsp;=
 1 +<br>
&gt;&nbsp; 2 files changed, 863 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2026-3=
3846.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch b=
/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5c85a531b3<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2026-33846.patch<br>
&gt; @@ -0,0 +1,862 @@<br>
&gt; +From 4f94e5cfe1f252a431e41642b0752e7e0daf43b9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Fri, 20 Mar 2026 16:09:40 +0100<br>
&gt; +Subject: [PATCH 1/7] tests/mini-dtls-fragments: implement a basic DTL=
S test<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; +[1] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f2=
52a431e41642b0752e7e0daf43b9">
https://gitlab.com/gnutls/gnutls/-/commit/4f94e5cfe1f252a431e41642b0752e7e0=
daf43b9</a><br>
&gt; +[2] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c2=
3bbb218f5ec3bd4bb1bf4cbd1fc0">
https://gitlab.com/gnutls/gnutls/-/commit/9deffca528c23bbb218f5ec3bd4bb1bf4=
cbd1fc0</a><br>
&gt; +[3] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e3=
4fba69d793735b7df3d383d1ff78">
https://gitlab.com/gnutls/gnutls/-/commit/65ab33fa54e34fba69d793735b7df3d38=
3d1ff78</a><br>
&gt; +[4] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58c=
bcc10373b841bb101fb058565d87">
https://gitlab.com/gnutls/gnutls/-/commit/cf3f1955e58cbcc10373b841bb101fb05=
8565d87</a><br>
&gt; +[5] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba=
849d40753ed9c8511e873f762743">
https://gitlab.com/gnutls/gnutls/-/commit/bb427ff74dba849d40753ed9c8511e873=
f762743</a><br>
&gt; +[6] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2=
f125f2fea3db84d801ac49a09f78">
https://gitlab.com/gnutls/gnutls/-/commit/092c65d004e2f125f2fea3db84d801ac4=
9a09f78</a><br>
&gt; +[7] <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a=
3529c551ccf54958da91a656550e">
https://gitlab.com/gnutls/gnutls/-/commit/a2b41be83a1a3529c551ccf54958da91a=
656550e</a><br>
&gt; +<br>
&gt; +CVE: CVE-2026-33846<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Signed-off-by: Pritam Srichandan Sahoo &lt;PritamSrichandan.Sahoo@win=
driver.com&gt;<br>
&gt; +---<br>
&gt; + tests/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp;&nbsp; 7 +-<br>
&gt; + tests/mini-dtls-fragments.c | 208 ++++++++++++++++++++++++++++++++++=
++<br>
&gt; + 2 files changed, 214 insertions(+), 1 deletion(-)<br>
&gt; + create mode 100644 tests/mini-dtls-fragments.c<br>
&gt; +<br>
&gt; +diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
&gt; +index aeeaaf79d..586f1952d 100644<br>
&gt; +--- a/tests/Makefile.am<br>
&gt; ++++ b/tests/Makefile.am<br>
&gt; +@@ -241,7 +241,8 @@ ctests +=3D mini-record-2 simple gnutls_hmac_fast=
 set_pkcs12_cred cert certuniquei<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x509cert-dntypes id-on-xmppAddr tls13-=
compat-mode ciphersuite-name \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x509-upnconstraint xts-key-check ciphe=
r-padding pkcs7-verify-double-free \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fips-rsa-sizes tls12-rehandshake-ticke=
t pathbuf tls-force-ems \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp; psk-importer privkey-derive dh-compute2 ecd=
h-compute2<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; psk-importer privkey-derive dh-compute2 ecd=
h-compute2 \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; mini-dtls-fragments<br>
&gt; +<br>
&gt; + ctests +=3D tls-channel-binding<br>
&gt; +<br>
&gt; +@@ -513,6 +514,10 @@ pathbuf_CPPFLAGS =3D $(AM_CPPFLAGS) \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; -I$(top_srcdir)/gl&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; -I$(top_builddir)/gl<br>
&gt; +<br>
&gt; ++mini_dtls_fragments_CPPFLAGS =3D $(AM_CPPFLAGS) \<br>
&gt; ++&nbsp;&nbsp;&nbsp; -I$(top_srcdir)/gl&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&gt; ++&nbsp;&nbsp;&nbsp; -I$(top_builddir)/gl<br>
&gt; ++<br>
&gt; + if ENABLE_PKCS11<br>
&gt; + if !WINDOWS<br>
&gt; + ctests +=3D tls13/post-handshake-with-cert-pkcs11 pkcs11/tls-neg-pkc=
s11-no-key \<br>
&gt; +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.=
c<br>
&gt; +new file mode 100644<br>
&gt; +index 000000000..ee75feeb6<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/tests/mini-dtls-fragments.c<br>
&gt; +@@ -0,0 +1,208 @@<br>
&gt; ++/*<br>
&gt; ++ * Copyright (C) 2026 Red Hat, Inc.<br>
&gt; ++ *<br>
&gt; ++ * Author: Alexander Sosedkin<br>
&gt; ++ *<br>
&gt; ++ * This file is part of GnuTLS.<br>
&gt; ++ *<br>
&gt; ++ * GnuTLS is free software; you can redistribute it and/or modify it=
<br>
&gt; ++ * under the terms of the GNU General Public License as published by=
<br>
&gt; ++ * the Free Software Foundation; either version 3 of the License, or=
<br>
&gt; ++ * (at your option) any later version.<br>
&gt; ++ *<br>
&gt; ++ * GnuTLS is distributed in the hope that it will be useful, but<br>
&gt; ++ * WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See th=
e GNU<br>
&gt; ++ * General Public License for more details.<br>
&gt; ++ *<br>
&gt; ++ * You should have received a copy of the GNU Lesser General Public =
License<br>
&gt; ++ * along with this program.&nbsp; If not, see &lt;<a href=3D"https:/=
/www.gnu.org/licenses/">https://www.gnu.org/licenses/</a>&gt;<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++#ifdef HAVE_CONFIG_H<br>
&gt; ++#include &quot;config.h&quot;<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++#include &lt;stdio.h&gt;<br>
&gt; ++#include &lt;stdlib.h&gt;<br>
&gt; ++<br>
&gt; ++#if defined(_WIN32)<br>
&gt; ++<br>
&gt; ++int main(void)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; exit(77);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#else<br>
&gt; ++<br>
&gt; ++#include &lt;assert.h&gt;<br>
&gt; ++#include &lt;errno.h&gt;<br>
&gt; ++#include &lt;stdbool.h&gt;<br>
&gt; ++#include &lt;stdint.h&gt;<br>
&gt; ++#include &lt;string.h&gt;<br>
&gt; ++#include &lt;gnutls/gnutls.h&gt;<br>
&gt; ++#include &lt;gnutls/dtls.h&gt;<br>
&gt; ++#include &quot;cert-common.h&quot;<br>
&gt; ++#include &quot;utils.h&quot;<br>
&gt; ++<br>
&gt; ++#include &quot;attribute.h&quot;<br>
&gt; ++<br>
&gt; ++static void server_log_func(int level, const char *str)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;server|&lt;%d&gt;| %s&quot;=
, level, str);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void client_log_func(int level, const char *str)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; fprintf(stderr, &quot;client|&lt;%d&gt;| %s&quot;=
, level, str);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#define QUEUE_SIZE 1024<br>
&gt; ++#define PACKET_SIZE 2048<br>
&gt; ++<br>
&gt; ++typedef struct {<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint8_t buf[PACKET_SIZE];<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t len;<br>
&gt; ++} packet_t;<br>
&gt; ++typedef struct {<br>
&gt; ++&nbsp;&nbsp;&nbsp; packet_t packets[QUEUE_SIZE];<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t head;<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t tail;<br>
&gt; ++} queue_t;<br>
&gt; ++<br>
&gt; ++static queue_t c2s, s2c;<br>
&gt; ++<br>
&gt; ++static int queue_put(queue_t *q, const void *buf, size_t len)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(len &lt;=3D PACKET_SIZE);<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(q-&gt;packets[q-&gt;tail].buf, buf, len);<=
br>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;packets[q-&gt;tail].len =3D len;<br>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;tail++;<br>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;tail %=3D QUEUE_SIZE;<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(q-&gt;tail !=3D q-&gt;head);<br>
&gt; ++&nbsp;&nbsp;&nbsp; return len;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t queue_get(queue_t *q, gnutls_session_t s, void *buf, =
size_t len)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (q-&gt;head =3D=3D q-&gt;tail) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
nutls_transport_set_errno(s, EAGAIN);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn -1;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t n =3D q-&gt;packets[q-&gt;head].len;<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(buf, q-&gt;packets[q-&gt;head].buf, n);<br=
>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;head++;<br>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;head %=3D QUEUE_SIZE;<br>
&gt; ++&nbsp;&nbsp;&nbsp; return n;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void queue_reset(queue_t *q)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; q-&gt;head =3D q-&gt;tail =3D 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int pull_timeout(gnutls_transport_ptr_t tr, unsigned ms)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return 1;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_=
t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return queue_get(&amp;c2s, (gnutls_session_t)tr, =
b, l);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t client_pull(gnutls_transport_ptr_t tr, void *b, size_=
t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return queue_get(&amp;s2c, (gnutls_session_t)tr, =
b, l);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t server_push(gnutls_transport_ptr_t tr, const void *b,=
 size_t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return queue_put(&amp;s2c, b, l);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t client_push_normal(gnutls_transport_ptr_t tr, const v=
oid *b,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return queue_put(&amp;c2s, b, l);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void test(gnutls_push_func client_push)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_session_t client, server;<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_credentials_t ccred, scred;<br=
>
&gt; ++&nbsp;&nbsp;&nbsp; int cr =3D 0, sr =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp; bool cdone =3D false, sdone =3D false;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (debug)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
nutls_global_set_log_level(4711);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_allocate_credentials(&amp;scre=
d);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_set_x509_key_mem(scred, &amp;s=
erver_cert, &amp;server_key,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; GNUTLS_X509_FMT_PEM);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_allocate_credentials(&amp;ccre=
d);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_init(&amp;server, GNUTLS_SERVER | GNUTLS_D=
ATAGRAM);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_init(&amp;client, GNUTLS_CLIENT | GNUTLS_D=
ATAGRAM);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_priority_set_direct(server, &quot;NORMAL:-=
VERS-ALL:+VERS-DTLS1.2&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_priority_set_direct(client, &quot;NORMAL:-=
VERS-ALL:+VERS-DTLS1.2&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_credentials_set(server, GNUTLS_CRD_CERTIFI=
CATE, scred);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_credentials_set(client, GNUTLS_CRD_CERTIFI=
CATE, ccred);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_dtls_set_timeouts(client, get_dtls_retrans=
mit_timeout(),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; get_timeout());<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_dtls_set_timeouts(server, get_dtls_retrans=
mit_timeout(),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; get_timeout());<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_ptr(client, client);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_push_function(client, client=
_push);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_function(client, client=
_pull);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_timeout_function(client=
, pull_timeout);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_ptr(server, server);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_push_function(server, server=
_push);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_function(server, server=
_pull);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_timeout_function(server=
, pull_timeout);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; while (!cdone || !sdone) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
nutls_global_set_log_function(client_log_func);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!cdone)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cr =3D gnutls_handshake(clie=
nt);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!cr || gnutls_error_is_fatal(cr))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cdone =3D true;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
nutls_global_set_log_function(server_log_func);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!sdone)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sr =3D gnutls_handshake(serv=
er);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (!sr || gnutls_error_is_fatal(sr))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdone =3D true;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (cr)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ail(&quot;client: %s\n&quot;, gnutls_strerror(cr));<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (sr)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ail(&quot;server: %s\n&quot;, gnutls_strerror(sr));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; success(&quot;OK\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_reset(&amp;c2s);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_reset(&amp;s2c);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_deinit(client);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_deinit(server);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_free_credentials(ccred);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_free_credentials(scred);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++void doit(void)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; global_init();<br>
&gt; ++&nbsp;&nbsp;&nbsp; test(client_push_normal);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_global_deinit();<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#endif /* _WIN32 */<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From 9deffca528c23bbb218f5ec3bd4bb1bf4cbd1fc0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Fri, 17 Apr 2026 17:49:31 +0200<br>
&gt; +Subject: [PATCH 2/7] buffers: shorten merge_handshake_packet using re=
cv_buf<br>
&gt; +<br>
&gt; +I had vague concerns about thread-safety of this,<br>
&gt; +but then this pattern already exists within the file.<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + lib/buffers.c | 52 +++++++++++++++++--------------------------------=
--<br>
&gt; + 1 file changed, 17 insertions(+), 35 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/buffers.c b/lib/buffers.c<br>
&gt; +index 672380b05..d54c77022 100644<br>
&gt; +--- a/lib/buffers.c<br>
&gt; ++++ b/lib/buffers.c<br>
&gt; +@@ -967,9 +967,11 @@ static int merge_handshake_packet(gnutls_session=
_t session,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int exists =3D 0, i, pos =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp; handshake_buffer_st *recv_buf =3D<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
ession-&gt;internals.handshake_recv_buffer;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; session-&gt;internals.h=
andshake_recv_buffer_size; i++) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (session-&gt;internals.handshake_recv_buffer[i].htype =3D=3D<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; hsk-&gt;htype) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (recv_buf[i].htype =3D=3D hsk-&gt;htype) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exists =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos =3D i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +@@ -1005,44 +1007,24 @@ static int merge_handshake_packet(gnutls_sess=
ion_t session,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; _gnutls_write_uint24(0, &amp;hsk-&gt;header[6]);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; _gnutls_write_uint24(hsk-&gt;length, &amp;hsk-&gt;header[9]);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _=
gnutls_handshake_buffer_move(<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;session-&gt;internals.h=
andshake_recv_buffer[pos], hsk);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _=
gnutls_handshake_buffer_move(&amp;recv_buf[pos], hsk);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (hsk-&gt;start_offset &lt;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sess=
ion-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_offset &amp;&amp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; hsk-&gt;end_offset + 1 &gt;=3D<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sess=
ion-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_offset) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;session-&gt;inte=
rnals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data.d=
ata[hsk-&gt;start_offset],<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (hsk-&gt;start_offset &lt; recv_buf[pos].start_offset &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; hsk-&gt;end_offset + 1 &gt;=3D recv_buf[pos].start_o=
ffset) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;recv_buf[pos].da=
ta.data[hsk-&gt;start_offset],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; hsk-&gt;data.data, hsk-&gt;data.length);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handsh=
ake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; .start_offset =3D hsk-&gt;start_offset;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handsh=
ake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; .end_offset =3D MIN(<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; hsk-&gt;end_offset,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .end_of=
fset);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
 else if (hsk-&gt;end_offset &gt;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handshake_recv_=
buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .end_offset &amp;&amp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hsk-&gt;st=
art_offset &lt;=3D<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handshake_recv_=
buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .end_offset +<br=
>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; 1) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;session-&gt;inte=
rnals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .data.d=
ata[hsk-&gt;start_offset],<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_buf[pos].start_offset =
=3D hsk-&gt;start_offset;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_buf[pos].end_offset =3D=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; MIN(hsk-&gt;end_offset, recv_buf[pos].end_offset);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
 else if (hsk-&gt;end_offset &gt; recv_buf[pos].end_offset &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hsk-&gt;st=
art_offset &lt;=3D recv_buf[pos].end_offset + 1) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;recv_buf[pos].da=
ta.data[hsk-&gt;start_offset],<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; hsk-&gt;data.data, hsk-&gt;data.length);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handsh=
ake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; .end_offset =3D hsk-&gt;end_offset;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; session-&gt;internals.handsh=
ake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; .start_offset =3D MIN(<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; hsk-&gt;start_offset,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; session-&gt;internals.handshake_recv_buffer[pos]<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .start_=
offset);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_buf[pos].end_offset =3D=
 hsk-&gt;end_offset;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; recv_buf[pos].start_offset =
=3D MIN(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; hsk-&gt;start_offset, recv_buf[pos].start_offset);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; _gnutls_handshake_buffer_clear(hsk);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From 65ab33fa54e34fba69d793735b7df3d383d1ff78 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Fri, 17 Apr 2026 18:21:36 +0200<br>
&gt; +Subject: [PATCH 3/7] buffers: add more checks to DTLS reassembly<br>
&gt; +<br>
&gt; +Previously, gnutls didn't check that DTLS fragments claimed<br>
&gt; +a consistent message_length value.<br>
&gt; +Additionally, a crucial array size check was missing,<br>
&gt; +enabling an attacker to cause a heap overwrite.<br>
&gt; +The updated version rejects fragments with mismatching length<br>
&gt; +and adds a missing boundary check.<br>
&gt; +<br>
&gt; +Reported-by: Haruto Kimura (Stella)<br>
&gt; +Reported-by: Oscar Reparaz<br>
&gt; +Reported-by: Zou Dikai<br>
&gt; +Fixes: #1816<br>
&gt; +Fixes: #1838<br>
&gt; +Fixes: #1839<br>
&gt; +Fixes: CVE-2026-33846<br>
&gt; +Fixes: GNUTLS-SA-2026-04-29-1<br>
&gt; +CVSS: 7.4 High CVSS:3.1/AV:N/AC:H/PR:N/UI:N/S:U/C:N/I:H/A:H<br>
&gt; +CVSS: 7.5 High CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:N/I:N/A:H<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + lib/buffers.c | 20 ++++++++++++++++++++<br>
&gt; + 1 file changed, 20 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/buffers.c b/lib/buffers.c<br>
&gt; +index d54c77022..5d4d16276 100644<br>
&gt; +--- a/lib/buffers.c<br>
&gt; ++++ b/lib/buffers.c<br>
&gt; +@@ -1010,6 +1010,26 @@ static int merge_handshake_packet(gnutls_sessi=
on_t session,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; _gnutls_handshake_buffer_move(&amp;recv_buf[pos], hsk);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (hsk-&gt;length !=3D recv_buf[pos].length) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* inconsistent across fragm=
ents */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _gnutls_handshake_buffer_cle=
ar(hsk);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gnutls_assert_val(<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* start_offset + data.length &lt;=3D hsk-&gt;length &lt;=3D max_length */<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (hsk-&gt;length &lt; hsk-&gt;start_offset + hsk-&gt;data.length) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* impossible claims, overfl=
ow requested */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _gnutls_handshake_buffer_cle=
ar(hsk);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gnutls_assert_val(<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (hsk-&gt;length &gt; recv_buf[pos].data.max_length) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* we don't have this much a=
llocated, overflow guard */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _gnutls_handshake_buffer_cle=
ar(hsk);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return gnutls_assert_val(<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GNUTLS_E_UNEXPECTED_PACKET_LENGTH);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (hsk-&gt;start_offset &lt; recv_buf[pos].start_offset &amp;&amp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; hsk-&gt;end_offset + 1 &gt;=3D recv_buf[pos].st=
art_offset) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(&amp;recv_buf[po=
s].data.data[hsk-&gt;start_offset],<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From cf3f1955e58cbcc10373b841bb101fb058565d87 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Wed, 1 Apr 2026 19:51:45 +0200<br>
&gt; +Subject: [PATCH 4/7] tests/mini-dtls-fragments: extend with a #1816 r=
eproducer<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + tests/mini-dtls-fragments.c | 120 ++++++++++++++++++++++++++++++++++=
++<br>
&gt; + 1 file changed, 120 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.=
c<br>
&gt; +index ee75feeb6..8d5a18acd 100644<br>
&gt; +--- a/tests/mini-dtls-fragments.c<br>
&gt; ++++ b/tests/mini-dtls-fragments.c<br>
&gt; +@@ -106,6 +106,11 @@ static int pull_timeout(gnutls_transport_ptr_t t=
r, unsigned ms)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static int c2s_pull_timeout_once(gnutls_transport_ptr_t tr, unsigned=
 ms)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; return c2s.head !=3D c2s.tail ? 1 : 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static ssize_t server_pull(gnutls_transport_ptr_t tr, void *b, size_=
t l)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return queue_get(&amp;c2s, (gnutls_session_t=
)tr, b, l);<br>
&gt; +@@ -198,10 +203,125 @@ static void test(gnutls_push_func client_push)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_certificate_free_credentials(scred);<=
br>
&gt; + }<br>
&gt; +<br>
&gt; ++static void test_malicious1816(void)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* dgram1: msg_len=3D50, frag_offset=3D25, frag_l=
en=3D25 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; static const uint8_t dgram1_hdr[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x16, /* type: handshake */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
xfe, 0xfd, /* version: DTLS 1.2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* epoch: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* seq: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x25, /* record_length: 37 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x01, /* msg_type: ClientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x32, /* msg_length: 50 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* msg_seq: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x19, /* frag_offset: 25 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x19, /* frag_length: 25 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; };<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* dgram2: msg_len=3D3000, frag_offset=3D0, frag_=
len=3D48 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; static const uint8_t dgram2_hdr[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x16, /* type: handshake */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
xfe, 0xfd, /* version: DTLS 1.2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* epoch: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x00, 0x00, 0x00, 0x01, /* seq: 1 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x3c, /* record_length: 60 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x01, /* msg_type: ClientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x0b, 0xb8, /* msg_length: 3000 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* msg_seq: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x00, /* frag_offset: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x30, /* frag_length: 48 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; };<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* dgram3: msg_len=3D3000, frag_offset=3D40, frag=
_len=3D1475 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; static const uint8_t dgram3_hdr[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x16, /* type: handshake */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
xfe, 0xfd, /* version: DTLS 1.2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* epoch: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x00, 0x00, 0x00, 0x02, /* seq: 2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x05, 0xcf, /* record_length: 1487 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x01, /* msg_type: ClientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x0b, 0xb8, /* msg_length: 3000 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* msg_seq: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x28, /* frag_offset: 40 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x05, 0xc3, /* frag_length: 1475 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; };<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* dgram4: msg_len=3D3000, frag_offset=3D1500, fr=
ag_len=3D1475 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; static const uint8_t dgram4_hdr[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x16, /* type: handshake */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
xfe, 0xfd, /* version: DTLS 1.2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* epoch: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, 0x00, 0x00, 0x00, 0x03, /* seq: 3 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x05, 0xcf, /* record_length: 1487 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x01, /* msg_type: ClientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x0b, 0xb8, /* msg_length: 3000 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x00, /* msg_seq: 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x05, 0xdc, /* frag_offset: 1500 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00, 0x05, 0xc3, /* frag_length: 1475 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; };<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_session_t server;<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_credentials_t scred;<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint8_t dgram[1500];<br>
&gt; ++&nbsp;&nbsp;&nbsp; int sr;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (debug)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
nutls_global_set_log_level(4711);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_allocate_credentials(&amp;scre=
d);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_set_x509_key_mem(scred, &amp;s=
erver_cert, &amp;server_key,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; GNUTLS_X509_FMT_PEM);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_init(&amp;server, GNUTLS_SERVER | GNUTLS_D=
ATAGRAM);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_priority_set_direct(server, &quot;NORMAL:+=
VERS-DTLS1.2&quot;, NULL);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_credentials_set(server, GNUTLS_CRD_CERTIFI=
CATE, scred);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_dtls_set_timeouts(server, get_dtls_retrans=
mit_timeout(),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; get_timeout());<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_ptr(server, server);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_push_function(server, server=
_push);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_function(server, server=
_pull);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_transport_set_pull_timeout_function(server=
,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c2s_pull_timeout=
_once);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; memset(dgram, 0, sizeof(dgram));<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(dgram, dgram1_hdr, 25);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, dgram, 25 + 25);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; memset(dgram, 0, sizeof(dgram));<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(dgram, dgram2_hdr, 25);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, dgram, 25 + 48);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; memset(dgram, 0, sizeof(dgram));<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(dgram, dgram3_hdr, 25);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, dgram, 25 + 1475);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; memset(dgram, 0, sizeof(dgram));<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(dgram, dgram4_hdr, 25);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, dgram, 25 + 1475);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_global_set_log_function(server_log_func);<=
br>
&gt; ++&nbsp;&nbsp;&nbsp; do {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
r =3D gnutls_handshake(server); /* invalid write if vulnerable */<br>
&gt; ++&nbsp;&nbsp;&nbsp; } while (c2s.head !=3D c2s.tail &amp;&amp; !gnutl=
s_error_is_fatal(sr));<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (sr !=3D GNUTLS_E_UNEXPECTED_PACKET_LENGTH)<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ail(&quot;server: expected GNUTLS_E_UNEXPECTED_PACKET_LENGTH, &quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;got: %s\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; gnutls_strerror(sr));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; success(&quot;OK\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_reset(&amp;c2s);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_reset(&amp;s2c);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_deinit(server);<br>
&gt; ++&nbsp;&nbsp;&nbsp; gnutls_certificate_free_credentials(scred);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + void doit(void)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; global_init();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test(client_push_normal);<br>
&gt; ++&nbsp;&nbsp;&nbsp; success(&quot;malicious reassembly bug exploitati=
on (#1816):\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test_malicious1816();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_global_deinit();<br>
&gt; + }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From bb427ff74dba849d40753ed9c8511e873f762743 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Mon, 20 Apr 2026 16:08:11 +0200<br>
&gt; +Subject: [PATCH 5/7] tests/mini-dtls-fragments: extend with fragmenti=
ng<br>
&gt; + ClientHello<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + tests/mini-dtls-fragments.c | 107 ++++++++++++++++++++++++++++++++++=
++<br>
&gt; + 1 file changed, 107 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.=
c<br>
&gt; +index 8d5a18acd..93490bac2 100644<br>
&gt; +--- a/tests/mini-dtls-fragments.c<br>
&gt; ++++ b/tests/mini-dtls-fragments.c<br>
&gt; +@@ -132,6 +132,39 @@ static ssize_t client_push_normal(gnutls_transpo=
rt_ptr_t tr, const void *b,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return queue_put(&amp;c2s, b, l);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static void write_u16(uint8_t *p, uint16_t val)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; p[0] =3D val &gt;&gt; 8;<br>
&gt; ++&nbsp;&nbsp;&nbsp; p[1] =3D val &amp; 0xff;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void write_u24(uint8_t *p, uint32_t val)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; p[0] =3D (val &gt;&gt; 16) &amp; 0xff;<br>
&gt; ++&nbsp;&nbsp;&nbsp; p[1] =3D (val &gt;&gt; 8) &amp; 0xff;<br>
&gt; ++&nbsp;&nbsp;&nbsp; p[2] =3D val &amp; 0xff;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void write_u48(uint8_t *p, uint64_t seq)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; int i;<br>
&gt; ++&nbsp;&nbsp;&nbsp; for (i =3D 5; i &gt;=3D 0; i--) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
[i] =3D seq &amp; 0xff;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
eq &gt;&gt;=3D 8;<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static uint64_t read_u48(const uint8_t *p)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint64_t seq =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp; int i;<br>
&gt; ++&nbsp;&nbsp;&nbsp; for (i =3D 5; i &gt;=3D 0; i--) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
eq &lt;&lt;=3D 8;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
eq |=3D p[i];<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp; return seq;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + static void test(gnutls_push_func client_push)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_session_t client, server;<br>
&gt; +@@ -316,12 +349,86 @@ static void test_malicious1816(void)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_certificate_free_credentials(scred);<=
br>
&gt; + }<br>
&gt; +<br>
&gt; ++static ssize_t queue_put_renumbered(queue_t *q, const uint8_t *data,=
 size_t l,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int delta_n)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (delta_n =3D=3D 0 || l &lt; 13 || data[3] !=3D=
 0 || data[4] !=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn queue_put(&amp;c2s, data, l);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint8_t *p =3D malloc(l);<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(p);<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(p, data, l);<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u48(p + 5, read_u48(p + 5) + delta_n);<br>
&gt; ++&nbsp;&nbsp;&nbsp; ssize_t ret =3D queue_put(q, p, l);<br>
&gt; ++&nbsp;&nbsp;&nbsp; free(p);<br>
&gt; ++&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static void split_client_hello(const uint8_t *data, size_t len, uint=
8_t **frag1,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; size_t *frag1_len, uint8_t **frag2,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; size_t *frag2_len)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t body_size =3D len - 25;<br>
&gt; ++&nbsp;&nbsp;&nbsp; *frag1_len =3D 13 + 12 + 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp; *frag2_len =3D 13 + 12 + (body_size - 1);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; *frag1 =3D malloc(13 + 12 + 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(*frag1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; *frag2 =3D malloc(13 + 12 + body_size - 1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; assert(*frag2);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* first fragment: record header + handshake head=
er + first body byte */<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(*frag1, data, 13); /* record header */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u16(*frag1 + 11, 12 + 1); /* record length =
*/<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(*frag1 + 13, data + 13, 12); /* handshake =
header */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u24(*frag1 + 19, 0); /* fragment_offset =3D=
 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u24(*frag1 + 22, 1); /* fragment_length =3D=
 1 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; (*frag1)[25] =3D data[25]; /* first body byte */<=
br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* second fragment: record header + handshake hea=
der + remaining body */<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(*frag2, data, 13); /* record header */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u16(*frag2 + 11, *frag2_len - 13); /* recor=
d length */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u48(*frag2 + 5, read_u48(*frag2 + 5) + 1); =
/* sequence number */<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(*frag2 + 13, data + 13, 12); /* handshake =
header */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u24(*frag2 + 19, 1); /* fragment_offset =3D=
 1 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; write_u24(*frag2 + 22, body_size - 1); /* shorten=
ed fragment_length */<br>
&gt; ++&nbsp;&nbsp;&nbsp; memcpy(*frag2 + 25, data + 26, body_size - 1); /*=
 remaining body */<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static ssize_t client_push_split_hello(gnutls_transport_ptr_t tr, co=
nst void *b,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; static int seq_offset =3D 0; /* for renumbering f=
ollow-up epoch0 ones */<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; const uint8_t *data =3D (const uint8_t *)b;<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint8_t *frag1, *frag2;<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t frag1_len, frag2_len;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Pass through anything that isn't an epoch0 Cli=
entHello with body */<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (l &lt; 13 + 12 + 1 || /* too short for DTLS r=
ecord header */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[0] !=3D 22 || /* not=
 a handshake record */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[3] !=3D 0 || data[4]=
 !=3D 0 || /* not epoch 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[13] !=3D 1) /* not C=
lientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn queue_put_renumbered(&amp;c2s, b, l, seq_offset);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* epoch0 Client Hello: special treatment of spli=
tting into fragments */<br>
&gt; ++&nbsp;&nbsp;&nbsp; split_client_hello(data, l, &amp;frag1, &amp;frag=
1_len, &amp;frag2, &amp;frag2_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, frag1, frag1_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, frag2, frag2_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; free(frag1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; free(frag2);<br>
&gt; ++&nbsp;&nbsp;&nbsp; seq_offset++;<br>
&gt; ++&nbsp;&nbsp;&nbsp; return l;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + void doit(void)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; global_init();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test(client_push_normal);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success(&quot;malicious reassembly bug explo=
itation (#1816):\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test_malicious1816();<br>
&gt; ++&nbsp;&nbsp;&nbsp; success(&quot;split client hello smoke-test\n&quo=
t;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test(client_push_split_hello);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_global_deinit();<br>
&gt; + }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From 092c65d004e2f125f2fea3db84d801ac49a09f78 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Mon, 20 Apr 2026 16:32:02 +0200<br>
&gt; +Subject: [PATCH 6/7] buffers: match DTLS datagrams by sequence number=
<br>
&gt; +<br>
&gt; +DTLS handshake fragment reassembly previously matched incoming fragme=
nts<br>
&gt; +by handshake type only, without checking the sequence number.<br>
&gt; +This allowed fragments from different handshake messages<br>
&gt; +to be merged into the same reassembly buffer.<br>
&gt; +<br>
&gt; +Now sequence number is accounted for during reassembly,<br>
&gt; +ensuring fragments are only merged when they belong<br>
&gt; +to the same handshake message.<br>
&gt; +<br>
&gt; +Reported-by: Zou Dikai<br>
&gt; +Fixes: #1839<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + lib/buffers.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/buffers.c b/lib/buffers.c<br>
&gt; +index 5d4d16276..62f140ed3 100644<br>
&gt; +--- a/lib/buffers.c<br>
&gt; ++++ b/lib/buffers.c<br>
&gt; +@@ -971,7 +971,8 @@ static int merge_handshake_packet(gnutls_session_=
t session,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; session-&gt;internals.handshake_recv_buffer;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; session-&gt;internals.h=
andshake_recv_buffer_size; i++) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (recv_buf[i].htype =3D=3D hsk-&gt;htype) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (recv_buf[i].htype =3D=3D hsk-&gt;htype &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; recv_buf[i].sequence =3D=3D hsk-&gt;sequence) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exists =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos =3D i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; +<br>
&gt; +From a2b41be83a1a3529c551ccf54958da91a656550e Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +Date: Mon, 20 Apr 2026 16:36:08 +0200<br>
&gt; +Subject: [PATCH 7/7] tests/mini-dtls-fragments: #1839 mismatching mes=
sage_seq<br>
&gt; +<br>
&gt; +Signed-off-by: Alexander Sosedkin &lt;asosedkin@redhat.com&gt;<br>
&gt; +---<br>
&gt; + tests/mini-dtls-fragments.c | 54 ++++++++++++++++++++++++++++++++---=
--<br>
&gt; + 1 file changed, 47 insertions(+), 7 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/tests/mini-dtls-fragments.c b/tests/mini-dtls-fragments.=
c<br>
&gt; +index 93490bac2..499a92a92 100644<br>
&gt; +--- a/tests/mini-dtls-fragments.c<br>
&gt; ++++ b/tests/mini-dtls-fragments.c<br>
&gt; +@@ -165,7 +165,7 @@ static uint64_t read_u48(const uint8_t *p)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return seq;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-static void test(gnutls_push_func client_push)<br>
&gt; ++static void test(gnutls_push_func client_push, bool expect_success)<=
br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_session_t client, server;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_certificate_credentials_t ccred, scre=
d;<br>
&gt; +@@ -218,12 +218,22 @@ static void test(gnutls_push_func client_push)<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sr =3D gnutls_handshake=
(server);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!sr || gnutls_error_is_fatal(sr))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdone =3D true;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (c2s.head =3D=3D c2s.tail &amp;&amp; s2c.head =3D=3D s2c.tail)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* speed the test up =
*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp; if (cr)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ail(&quot;client: %s\n&quot;, gnutls_strerror(cr));<br>
&gt; +-&nbsp;&nbsp;&nbsp; if (sr)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
ail(&quot;server: %s\n&quot;, gnutls_strerror(sr));<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (expect_success) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (cr)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail(&quot;client: %s\n&quot=
;, gnutls_strerror(cr));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (sr)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail(&quot;server: %s\n&quot=
;, gnutls_strerror(sr));<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; } else {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (cr =3D=3D 0 &amp;&amp; sr =3D=3D 0)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fail(&quot;handshake unexpec=
tedly succeeded: %s / %s\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; gnutls_strerror(cr), gnutls_strerror(sr));<br>
&gt; ++&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success(&quot;OK\n&quot;);<br>
&gt; +<br>
&gt; +@@ -421,14 +431,44 @@ static ssize_t client_push_split_hello(gnutls_t=
ransport_ptr_t tr, const void *b,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return l;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static ssize_t client_push_split_hello_bad_seq(gnutls_transport_ptr_=
t tr,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const void *b, size_t l)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* gnutls wasn't matching on message_seq on mergi=
ng, see #1839 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; static int seq_offset =3D 0; /* for renumbering f=
ollow-up epoch0 ones */<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; const uint8_t *data =3D (const uint8_t *)b;<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint8_t *frag1, *frag2;<br>
&gt; ++&nbsp;&nbsp;&nbsp; size_t frag1_len, frag2_len;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Pass through anything that isn't an epoch0 Cli=
entHello with body */<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (l &lt; 13 + 12 + 1 || /* too short for DTLS r=
ecord header */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[0] !=3D 22 || /* not=
 a handshake record */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[3] !=3D 0 || data[4]=
 !=3D 0 || /* not epoch 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data[13] !=3D 1) /* not C=
lientHello */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn queue_put_renumbered(&amp;c2s, b, l, seq_offset);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* epoch0 Client Hello: special treatment of spli=
tting into fragments */<br>
&gt; ++&nbsp;&nbsp;&nbsp; split_client_hello(data, l, &amp;frag1, &amp;frag=
1_len, &amp;frag2, &amp;frag2_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, frag1, frag1_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; frag2[18]++; /* WRONG, message_seq mismatch must =
be rejected, #1839 */<br>
&gt; ++&nbsp;&nbsp;&nbsp; queue_put(&amp;c2s, frag2, frag2_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp; free(frag1);<br>
&gt; ++&nbsp;&nbsp;&nbsp; free(frag2);<br>
&gt; ++&nbsp;&nbsp;&nbsp; seq_offset++;<br>
&gt; ++&nbsp;&nbsp;&nbsp; return l;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + void doit(void)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; global_init();<br>
&gt; +-&nbsp;&nbsp;&nbsp; test(client_push_normal);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test(client_push_normal, true);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success(&quot;malicious reassembly bug explo=
itation (#1816):\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; test_malicious1816();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; success(&quot;split client hello smoke-test\=
n&quot;);<br>
&gt; +-&nbsp;&nbsp;&nbsp; test(client_push_split_hello);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test(client_push_split_hello, true);<br>
&gt; ++&nbsp;&nbsp;&nbsp; success(&quot;split client hello smoke-test and m=
angle sequence number\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp; test(client_push_split_hello_bad_seq, false);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; gnutls_global_deinit();<br>
&gt; + }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.54.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls_3.8.12.bb b/meta/recip=
es-support/gnutls/gnutls_3.8.12.bb<br>
&gt; index 8554ab943d..3ae7a2eb78 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls_3.8.12.bb<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls_3.8.12.bb<br>
&gt; @@ -24,6 +24,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://www.gnupg=
.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://run-ptest">file://run-ptest</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://Add-ptest-support.patch">file://Add-ptest-support.patch=
</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://c99.patch">file://c99.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-33846.patch">file://CVE-2026-33846.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D &quot;a7b341421bfd459acf7a374ca4af3b9e066=
08dcd7bd792b2bf470bea012b8e51&quot;<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH3PR11MB7372E7F07854835B172C1F0C9BFE2CH3PR11MB7372namp_--

