Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46492C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 19:22:46 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.15738.1656530557766871821
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 12:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=li9tBwWT;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=4179595858=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0239463.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25TFLOmQ016481;
	Wed, 29 Jun 2022 14:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS11062020;
 bh=vN0+qgOPsAss0Br+TkDMLo96Rtr6g0LA4W48dSP6Hog=;
 b=li9tBwWTqK7Wm/Uq3oVESGta+V3viXgEBGhn9GOVOINvHpevokSdB8ugWc1n5aj0tAYG
 LatFkBlYqyg+GGKzzKab4LtMI0XQPA2K74ZGuLDq08f5fnFvvfYVhj3zpI+Zig97nK00
 uMVIDE7Tp2So1sduqm1N5aqSNtBGFZQt0dIDDYPJ6fMtO/lkJX8agZvsFqE/17P50O7o
 MaIH+gdFseiqeUJst9s4MBFbGaiHWW1ziDD70SnkMCcM2tZ9bG+1jOqPxDEbbfC46N9T
 WAX63skFq8+TsGwIYsJXsypNYiVa1XRZ+2Dq1b0pakaJ08ccz+lAR06cMdXE0eAxPtck Gg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3gwwrf95c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jun 2022 14:22:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A0Z3OJfIl20qhWJDi1EBTHzvSuK/QNdxSRHo58Xz/tVvtPAema69YUZrXbPe/97kmhKaXDNs102aIULfvAntOLLVC7EKizWxr7Z5vn8McNn5Liao+I0BUNEHC0HxRzFL3Wsb6X6dQLWEKlxRfvsGCVsXwuueUkTS4ijT0gTopaoeK0DHZXQJheIHEwSLhLqF38nf3iZWQy03ZwTBA4WTyjCSR7IivhgcDUrgpj/qBvgzf4yQzfED7jGjOBOXQ96OQkSaVbb4Mt0nuVuWj5Z6UDM5vN6uiqzeFhGkxkjXgaTt328f4j51a91mnZ0Szfy9tE81wbY3nUqQQvrTdJj5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vN0+qgOPsAss0Br+TkDMLo96Rtr6g0LA4W48dSP6Hog=;
 b=ZaG0X8y/OcSnW/Wwp9yWfqIjngIBV09RevvZP/O+gTMSGZjO/mjyBiqh+ozloCNywv1KATC6m5nI0yZKjKwpOvCgI7DAjjbcyYShV9B3mgyq5nSruazVhoAuwTNIqPGg1dC597aiav4RbiMermg0IIW3EKBYyVrjPBJxrG8wHj4nq+QQki81XwaNDl5dtg29aBT8SqGIWLFI14yapr+yNoNJ6mxSJ3IfXVPm3aA4xW+yaJdkajszTJjUUzLxpCOt4g/8AYuXpeJIYIRGnzS4Mr4xEVyuNc2uQrl09gh0jIRlTQvx+1EJqEw7+CGOw8j0SVuiSPvg/R+lPlUu8Q6gCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN0+qgOPsAss0Br+TkDMLo96Rtr6g0LA4W48dSP6Hog=;
 b=arymnhfTBCn0g32j8kuwiWTMwVtwaT5RNIvkpIMNItaQPMPI0NPwjTbwlHmMm+XqVxoWgjmyqLBPV2iboc2o6Skaqp19nZWnuQtQLZgxavl2LEl2e/lzdJSDiBBljs/dzZ3mrl0vLoLCLv0geZImLTnX8ew2VSSaO7SocLYXoBQ=
Received: from SN4PR04MB8365.namprd04.prod.outlook.com (2603:10b6:806:200::20)
 by BL0PR04MB4513.namprd04.prod.outlook.com (2603:10b6:208:44::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 29 Jun
 2022 19:22:33 +0000
Received: from SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::c160:6c81:9bdf:314b]) by SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::c160:6c81:9bdf:314b%9]) with mapi id 15.20.5395.014; Wed, 29 Jun 2022
 19:22:32 +0000
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
Thread-Topic: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
Thread-Index: AdiL7Vw1kLoyzhQBTxG/AXV/Z9qbcA==
Date: Wed, 29 Jun 2022 19:22:32 +0000
Message-ID: 
 <SN4PR04MB8365732A4EAC162B5ACB5B22E4BB9@SN4PR04MB8365.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ActionId=40a763e4-5049-4665-8c2b-ebb36c4c7d40;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=true;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-06-29T19:20:46Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ce231064-fcde-431a-e167-08da5a04b762
x-ms-traffictypediagnostic: BL0PR04MB4513:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +YeO/3/MnBxGLT7v3fimM25lRQIwKlT4QUIuVAKqdL2G928m33Iv6+ZXGPN9FnTl9f1dFvXrBCaEp4ogS7geoimx9Ykw0i3KXL/c2bLP3CmmsMcppbLuMT9wpF+EEfJTLYMDRR+On76sJtw0wSyGTHcMbXWeMdtSeSA/OvvWZLWxY1vW/dsDbILDEfFZOAt5bLgx/bM+Zjn/13EGanjOP1uNdk68gLnIFN8RxxkD/oyNsFRqhrKlhziIibtBswdiPZo20BlCoBHCT/ZAUl1dHnYsjhawsqOYuA/YJW0o/BkphoX3+4/+W9jklcKW4RdJsGhXHcbz/DXunzqdnV9Uz2wlA52K1kSm6+rmpw7qkqmUGAho0o92wo8mocX0sB4jkDY7tYYgReRnKpxwT5X23BOBviYiO2rH2cShMX6jcJbAzIFeY6FIdtvX5F1c49s/9mZ/CDqxEsR32kLTxK1Us9U9bgNoTK86gsZyP5oiQAtYPcPNxjte981FWCl7sJRiPIyaAJPkKxlAcEVTyx3dizptUBE7fX/WKAOeFJ1FZhfNi1p3qYipJW9HhVXCgdSyGyOKjAIEi4JGtRdrO3a8kNgRXPgeMlriVE/gryocCuFoF7gyKOqPuRQ/ykkP49pdKElW/+q4kHoHnfBodbr17+8LfDGjg8dhnMvsuj4z884HYMc4EJO3ogEsiXFpDS7matrPuAWcCuarpHBDcM5y6mZKVgW5teZTEuY+ER4LMwcVSYW3AsXiJBkJZqIPJK7VfWylETXY8pY6Sj+GhsICOfF5QsPhDThRyJAwOhSaAeKEkoSa57y0CvyA7hDAPFOdXEjDODwk1TTU1eXzhoLB5Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8365.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(136003)(39860400002)(346002)(376002)(366004)(83380400001)(55016003)(44832011)(6506007)(6916009)(316002)(38100700002)(66556008)(966005)(76116006)(66446008)(7696005)(71200400001)(41300700001)(478600001)(38070700005)(4326008)(64756008)(33656002)(8676002)(186003)(66946007)(66476007)(8936002)(53546011)(9686003)(26005)(122000001)(52536014)(5660300002)(2906002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b3N6Sk1UVkVzUzN1ZUVoNUVMSTRBZC80QmQrbXhiUEE0S2g0OFVvMlEwMTlM?=
 =?utf-8?B?YVdPWE9VYTNpT1diRndjUW9FVWUrVzE2TklJTnZIMm43eGE3WHo5SGNwb1Jt?=
 =?utf-8?B?NHhzOEtxYUFqaVQ5b0tLcjF5YnJMWTFNL2p3R3NlampBSUlFNjJmVFNqTS9V?=
 =?utf-8?B?RXNIQWNJL2hQdmNyNGVvVlVaWlNKWWJPTWhHUUhtWU1XcTUwUnRPYWx2MEMy?=
 =?utf-8?B?MUlkdS9leUJoTUJCNHBUK3BJbTF5RFNJZjR2VUR1VUpuVzdmWnBRLzVqbHdH?=
 =?utf-8?B?KzFzekRHQzBySXFwVTdzOFhPQzBrVU1WMDAvTmRwRFU0YkFoNEFORDVlRmR4?=
 =?utf-8?B?VXhwRUhKRjM4OVdVQnA3ZVZ5dnd5c0JXdm5pbDVnSFpJWlhBWjlUaUIrNHdn?=
 =?utf-8?B?eHUzZTRxS1BSVzhNZGpncS9mU2xhVjFqOTArMGRONXB5YkxLc1lKdGEvMlVh?=
 =?utf-8?B?ZE1hNUFEZkFEMVphNTJHNTFiR2cxOVVNd2tleE4yWDNVODAwdHB0aFBIL1pv?=
 =?utf-8?B?YkhJa2FZd0JucUtMdHFqbmFNajladXNUUHpaMXlQZG44MUV1d0tZcWlzdzB6?=
 =?utf-8?B?ZHExRXUyN0NVdWh4Zm5uRy9jbW10eFMvYXVQaDlnUnNxMTltVGwxaWJHS0gr?=
 =?utf-8?B?LzhFelJFQUIxSkthR05JSDlNNU1DT0xuZmRIdDR1S2czUDNhc2FtQit1d0hX?=
 =?utf-8?B?N2RUSXYrTzhoMGxMNW9aU2J0NUEvWnVFaUp4VEQvQnZWVnZ5TWpPWVg0OVVY?=
 =?utf-8?B?eFFPT0hRdU9iSkViY2NJcEl3amlHaEQwY1JVUlpKMFk4QTBZWWpvSmczVE5u?=
 =?utf-8?B?OWdaVUZ5SFFSYll1c1BhNmhJdkFYVVdOR202UUxjbmI0dzJBYVg5djJRb2Y2?=
 =?utf-8?B?N09FTndnWCtWYW1pR0hlcUE2UnhmQ0FLUWZQdkdhVTEzVjl6VElGRTZWRVkv?=
 =?utf-8?B?RjNGVE52MCthYjJkQ2p0YVdQLzNlWXZha0xYbGl1emFldXJueGtxQkZpc2wx?=
 =?utf-8?B?bm5mTDBtdWh2NGl0c3Awb1JqY1U4UzR5OEx5WFpSaWpjUExNS0tTQUVtTWdP?=
 =?utf-8?B?MVJyRlg0a2VzUWJJY05QQVBpeVU2TkcyemwraVhob2hQUDBFZHBsZmFzZHdk?=
 =?utf-8?B?QnRVQ0dqQkU1TUJLMmFqcXNXTjQyVmRiOEVBWmFHaEU5UUY0Y0ZPcWJmZzll?=
 =?utf-8?B?ZEl6ZzVqQUh4dkpzYnVaaTh0V0JXVjNHWVFmY2ZnMURPdktRcWFYWjU1dDZS?=
 =?utf-8?B?TUt6TTQwdHd4YVE0MUhTL1dHNm1DMWR5NEh1K0VVUG1HRlk3QUpIenNpZUdi?=
 =?utf-8?B?eE5vWFUxdFdjdVpRTHF3Z3pFVE9FcGxQMTViK3A0anh4ZFNvYUorNEZtOXNY?=
 =?utf-8?B?blFjMW52SkVQL3pXRmlvTUJnZ2ozVnJacjBUVU42V1dtT1JCRG81V3ZZRHJo?=
 =?utf-8?B?cUdZWjRHVUlzZlBNK3JiaG1MdkVSR1J5R042RkR2ZUtwU3Vua3QzWjA2MW1B?=
 =?utf-8?B?WHdMRVFqUXNwdS8yamFyNGhXV2g0UkV1dnBwMUJlUUdERS9HaGNNbHZYNk5n?=
 =?utf-8?B?T0NJYTZGZERqYmpDcll6NFdMMkFYcnJHZDNBK0lvQzdKd0IraFQxREo3Mzgz?=
 =?utf-8?B?REVtcERPMDNPRWU3OThUZmwreDlzRXRmd3JmankzWko2S0tVMEpHZXh1MWtz?=
 =?utf-8?B?by8zK25PdTI0Vk5ZSnJMZjhVQklyMHphcStnQ2xHQjFuOTdjdzdqN0dYNytw?=
 =?utf-8?B?cklEK3dMdE9IWTZvTDQ0Rm9sWndneFRuMjUzdEhEbGx0WXRpenI0U1UvbjRF?=
 =?utf-8?B?MzJYWmFwQldEdkgvUWYrZmcxa0JZaHByTE9QOXBKWjc2aEpqQlFZdXBtRnZ5?=
 =?utf-8?B?c1R6Y1JEdmJva1lhdlgvbWo4eEx4YlZuZEduMENPUGxYOWRETVE2UkM0TUpi?=
 =?utf-8?B?bEZHN0VhcHkyWElaaW1hRnZiOVNmWUpIbnNjTVN1N2ZQeURVa3JHVEVscmt3?=
 =?utf-8?B?cUZadHN3ek5yZThtRlhuUm9NOWlYSEo3NDFvS3RsNkhHQzRjbWJzNTkrbHJn?=
 =?utf-8?B?cEhaSnFpVFduV0c0NjJ2cEU2Mlo1N1VydFhVUTJ6Yk4ySnBXSGJ2cXpud082?=
 =?utf-8?B?RysxdkZXcHpoZVEzYXhGaG8zYllwcndMc2huUzl6dHlXUnE1QnNxNEZLd0tE?=
 =?utf-8?B?dHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8365.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce231064-fcde-431a-e167-08da5a04b762
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2022 19:22:32.9113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Xi25YwUtWreav0R/Th6SUXzwlfoQxYONNmaxHp40opKatIfDtvub4i+5aHhNfVD7dfjZsYiLNzZiyR+8jVLCNCTmnM2oHemDHp2wZ4H0UKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR04MB4513
X-Proofpoint-GUID: uhlbaH7VUKm5OXSWYEotj3hLydiGmx2B
X-Proofpoint-ORIG-GUID: uhlbaH7VUKm5OXSWYEotj3hLydiGmx2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-29_20,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 bulkscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 19:22:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167388

SGkgQWxleCwNCg0KSSd2ZSBmb3VuZCB0aGF0IHNvbWUgT0UgY29tbWFuZHMgcHJpbnQgYW4gZXJy
b3IgZHVyaW5nIGNsZWFudXAgd2hlbg0KdGhlIHRtcF9kaXIgZG9lcyBub3QgZXhpc3QgYW5kIGFu
IGF0dGVtcHQgaXMgbWFkZSB0byBkZWxldGUgaXQuIEkndmUNCnN1Ym1pdHRlZCBhIHBhdGNoIHRv
IG9wa2cgdG8gZml4IHRoYXQuDQpMaW5rOiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL29w
a2cvY29tbWl0Lz9pZD04ZGZkZGE4NmFmZDQwN2E2NmUzZGMwMGEwNzdiZGNjOGI1M2Q1NGVhLg0K
VGhhdCB3YXMgdGhlIG9uZSBpbnN0YW5jZSB0aGF0IHdhcyBjYXVzaW5nIGFuIGlzc3VlIGluIG91
ciBidWlsZHMuDQpUaGVyZSBtYXkgYmUgb3RoZXIgaW5zdGFuY2VzIHRoYXQgSSBkb24ndCBrbm93
IG9mLiBHaXZlbiB0aGF0LCBJIHRoaW5rDQp0aGUgcGFja2FnZV9tYW5hZ2VyIGNvZGUgc2hvdWxk
IGJlIHJlc2lsaWVudCBhZ2FpbnN0IGFueSBzdWNoDQptaXNjZWxsYW5lb3VzIHN0ZGVyciBtZXNz
YWdlcywgd2hpY2ggZG8gbm90IHJlc3VsdCBpbiB0aGUgY29tbWFuZA0KaXRzZWxmIGZhaWxpbmcu
DQoNCkhvcGUgdGhhdCBoZWxwcywNClNocnV0aGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4N
Cj4gU2VudDogVHVlc2RheSwgSnVuZSAyOCwgMjAyMiAxOjMzIFBNDQo+IFRvOiBTaHJ1dGhpIFJh
dmljaGFuZHJhbiA8c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tPg0KPiBDYzogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
W1BBVENIXSBwYWNrYWdlX21hbmFnZXIvaXBrOiBkbyBub3QgcGlwZSBzdGRlcnIgdG8gc3Rkb3V0
DQo+DQo+IFRoaXMgbmVlZHMgYWRkaXRpb25hbCBqdXN0aWZpY2F0aW9uLiBXaGF0IGFyZSB0aGUg
ZXJyb3IgbWVzc2FnZXMsIHdoeSBhcmUgdGhleSBoYXJtbGVzcyBhbmQgd2h5IHRoZSBzb2x1dGlv
biBpcyB0byBzdXBwcmVzcyB0aGVtIGluc3RlYWQgb2YNCj4gYWRkcmVzc2luZyB0aGUgcmVhc29u
cyB0aGV5IGFwcGVhcj8NCj4NCj4gQWxleA0KPg0KPiBPbiBUdWUgMjguIEp1biAyMDIyIGF0IDIz
LjEzLCBTaHJ1dGhpIFJhdmljaGFuZHJhbiA8c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tIDxt
YWlsdG86c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tPiA+IHdyb3RlOg0KPg0KPg0KPiAgICAg
ICBXaGVuIHBhcnNpbmcgdGhlIG91dHB1dCBvZiBhIGNvbW1hbmQsIGRvIG5vdCBwaXBlIHN0ZGVy
ciB0byBzdGRvdXQuDQo+ICAgICAgIE9wa2cgc29tZXRpbWVzIHByaW50cyBoYXJtbGVzcyBlcnJv
ciBtZXNzYWdlcyBldmVuIHdoZW4gdGhlIG9wa2cNCj4gICAgICAgY29tbWFuZCBzdWNjZWVkcy4g
V2hlbiBzdGRlcnIgaXMgcGlwZWQgdG8gc3Rkb3V0LCB0aGVzZSBlcnJvcg0KPiAgICAgICBtZXNz
YWdlcyBtYXkgY2xvYmJlciB0aGUgc3Rkb3V0IGFuZCBjYXVzZSB1bmV4cGVjdGVkIHJlc3VsdHMg
d2hpbGUNCj4gICAgICAgcGFyc2luZyB0aGUgb3V0cHV0Lg0KPg0KPiAgICAgICBTaWduZWQtb2Zm
LWJ5OiBTaHJ1dGhpIFJhdmljaGFuZHJhbiA8c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tIDxt
YWlsdG86c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tPiA+DQo+ICAgICAgIC0tLQ0KPiAgICAg
ICAgbWV0YS9saWIvb2UvcGFja2FnZV9tYW5hZ2VyL2lway9fX2luaXRfXy5weSB8IDIgKy0NCj4g
ICAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0K
PiAgICAgICBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2UvcGFja2FnZV9tYW5hZ2VyL2lway9fX2lu
aXRfXy5weSBiL21ldGEvbGliL29lL3BhY2thZ2VfbWFuYWdlci9pcGsvX19pbml0X18ucHkNCj4g
ICAgICAgaW5kZXggNGNkMzk2MzExMS4uZDdmM2YzMTg1MyAxMDA2NDQNCj4gICAgICAgLS0tIGEv
bWV0YS9saWIvb2UvcGFja2FnZV9tYW5hZ2VyL2lway9fX2luaXRfXy5weQ0KPiAgICAgICArKysg
Yi9tZXRhL2xpYi9vZS9wYWNrYWdlX21hbmFnZXIvaXBrL19faW5pdF9fLnB5DQo+ICAgICAgIEBA
IC0xMDMsNyArMTAzLDcgQEAgY2xhc3MgT3BrZ0Rwa2dQTShQYWNrYWdlTWFuYWdlcik6DQo+ICAg
ICAgICAgICAgICAgICIiIg0KPg0KPiAgICAgICAgICAgICAgICB0cnk6DQo+ICAgICAgIC0gICAg
ICAgICAgICBvdXRwdXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChjbWQsIHN0ZGVycj1zdWJw
cm9jZXNzLlNURE9VVCwgc2hlbGw9VHJ1ZSkuZGVjb2RlKCJ1dGYtOCIpDQo+ICAgICAgICsgICAg
ICAgICAgICBvdXRwdXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChjbWQsIHNoZWxsPVRydWUp
LmRlY29kZSgidXRmLTgiKQ0KPiAgICAgICAgICAgICAgICBleGNlcHQgc3VicHJvY2Vzcy5DYWxs
ZWRQcm9jZXNzRXJyb3IgYXMgZToNCj4gICAgICAgICAgICAgICAgICAgIGJiLmZhdGFsKCJVbmFi
bGUgdG8gbGlzdCBhdmFpbGFibGUgcGFja2FnZXMuIENvbW1hbmQgJyVzJyAiDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicmV0dXJuZWQgJWQ6XG4lcyIgJSAoY21kLCBlLnJldHVybmNv
ZGUsIGUub3V0cHV0LmRlY29kZSgidXRmLTgiKSkpDQo+ICAgICAgIC0tDQo+ICAgICAgIDIuMjAu
MQ0KPg0KPg0KPiAgICAgICAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiAgICAgICBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gICAgICAgVmll
dy9SZXBseSBPbmxpbmUgKCMxNjczNTQpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2NzM1NA0KPiA8aHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0N
Cj4gY29yZS9tZXNzYWdlLzE2NzM1NF9fOyEhRmJaMFp3STNRZyFxYzB4YkwzUUJ6X2lsbG5QSUpv
ZUhiNm1HQTFrQkxuZExqckdEamxmRHdSN3JrUWNNOGk3WlR0ZTV5X0dMNFhOUXJ1LQ0KPiBxU3ZJ
VjNwX0R4cFM2dENJWDNqSE1kZyQ+DQo+ICAgICAgIE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkyMDUxOTg5LzE2ODY0ODkNCj4gPGh0dHBzOi8vdXJs
ZGVmZW5zZS5jb20vdjMvX19odHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTIwNTE5
ODkvMTY4NjQ4OV9fOyEhRmJaMFp3STNRZyFxYzB4YkwzUUJ6X2lsbG5QSUpvZUhiNm1HQTFrQg0K
PiBMbmRManJHRGpsZkR3Ujdya1FjTThpN1pUdGU1eV9HTDRYTlFydS1xU3ZJVjNwX0R4cFM2dENJ
czgxakFTdyQ+DQo+ICAgICAgIEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxtYWlsdG86b3BlbmVtYmVkZGVkLQ0KPiBjb3JlJTJCb3du
ZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gICAgICAgVW5zdWJzY3JpYmU6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViDQo+IDxodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cv
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlL3Vuc3ViX187ISFGYlowWndJM1FnIXFjMHhiTDNRQnpfaWxs
blBJSm9lSGI2bUdBMWtCTG5kTGpyR0RqbGZEd1I3cmtRY004aTdaVHRlNXlfR0w0WE5RcnUtcVN2
SVYzcF9EeHBTNnRDSUFESlJqSmMkPg0KPiBbYWxleC5rYW5hdmluQGdtYWlsLmNvbSA8bWFpbHRv
OmFsZXgua2FuYXZpbkBnbWFpbC5jb20+IF0NCj4gICAgICAgLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4NCj4NCg0KDQpJTlRFUk5BTCAtIE5JIENPTkZJREVOVElBTA0K

