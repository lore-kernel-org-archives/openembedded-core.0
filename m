Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F73F433DF
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 03:41:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5305.1776310905767820186
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 20:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=azpIH2Kx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8566fdd02c=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63G3TdNe477892
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 20:41:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8I8n74L8o70FB/+hi81XF5rO9K4tnMGs/z6yjG25SDQ=; b=
	azpIH2KxwNpTQbI//YnYJJ8tCbvRByvF0Tk6Wihj7MsuZsNIn3uvN5cx4gQFoJnc
	4Q8FSNrjV6xqI7aar5ET/LAnyYVModp/yv3x+9IC4g/eNJKmhkWEXZ3LLwGVjaDn
	iof3XDWcnkVaIbVx/KPcaeEAbbnRTJ4Gbd0lvtOWhfdyRPeLCoEKiJxvqb/HOn4o
	DEJqKyU4AKAdUhe21DAuxpH4+WgmhTb2n5tdE0B8sP7NUM5djX0kd9qcWl2mG597
	dbRUofCiWHHP0Oq7oX0pxObfP4wqLV/TWNk9yUC9M45ZXMZ/Z3iZ+jJO1nKt3APa
	GzeKCjn13kU1Pc90DmdI6Q==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dh86mb1ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Apr 2026 20:41:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NFGarUs5RRkgHYvtq8X9sSHQnXs+OiqML3T5pAv4Zbdc0rvtCQ1uaxJqB6MtVLtGGWhXdHQDpoWZLxtxtp2Vdq9fkLYY4z380rJxFTWzocH0FzzNlj904pZHuHkdgK+FTTT/KNhB9aUHVLomw4Y0TZB1lgDejR0htC8OpLCGkaTzRkphqI0bznwdyrARSmJE6ZlbGrzMyt5jwmBLQn0A7AVFQQwvNymmwyrtEutl3rWTZRJLNQZZX93O5joquQo7EAeHR/rodH4nOrdsFsIGS/MLaF8a5LIARwlRsmIFCnUCDn8c/DfvkOMcPImo0iZU2NdAvM/Ufmua3kRlZKs6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8I8n74L8o70FB/+hi81XF5rO9K4tnMGs/z6yjG25SDQ=;
 b=FX5Wo+sSxR2KIOSBT53SKemOpjqx/x0AFmqBo3qEvo4qb90chs48cQuqG9E53kqMxP3mPPrFZ+7zUzebiUVbvaMqxev2HJbDlkHvkp+DYuAz8hXaff8Xbx7ARlbD3FpjtX9Z1ieLz7qiLNmPmo/+4xADwKAn3SE3wcLcAEsOI0332/q4+M1USq5SDfbEvTxYDItiPUAmAMmQ+L0i6itb0eIlnukdyhJiY+dQkEvtCQpAv4YS1ppN+boXsUNelnyjrOGAdGJHOvnO/GqhDIj7OnMSgKXd/laOc/EM7YYACKod6LRDYYakXOKldZfwpOPRqI61BGvMrPo2eOYpca5FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 03:41:40 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::ecf9:dbb:16bf:5b2d%4]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 03:41:38 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Paul Barker <paul@pbarker.dev>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "mns@gomspace.com" <mns@gomspace.com>
Subject: RE: [OE-core][PATCH] systemd: add osc-context PACKAGECONFIG
Thread-Topic: [OE-core][PATCH] systemd: add osc-context PACKAGECONFIG
Thread-Index: AQHczLITgXzKczrMA06M98axBCikpbXf3QgAgAEryUA=
Date: Thu, 16 Apr 2026 03:41:38 +0000
Message-ID: 
 <PH0PR11MB5611699DC4504F7E5A489A71ED232@PH0PR11MB5611.namprd11.prod.outlook.com>
References: <20260415082949.3446677-1-Qi.Chen@windriver.com>
 <a47f8c392202243c914de017786490472464b556.camel@pbarker.dev>
In-Reply-To: <a47f8c392202243c914de017786490472464b556.camel@pbarker.dev>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=af696f4d-4092-4c48-a784-09ac6eb18f5a;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-04-16T03:28:34Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5611:EE_|CO1PR11MB4945:EE_
x-ms-office365-filtering-correlation-id: 4014036e-e6a7-4751-2ff9-08de9b6a1119
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 FtWsAT9WGplIiv2KryP3huYpdq2VtfOOMfJvaSSNaVPpXfuTU/27dn+KBfA7R/v3rMIRYnnHGtXVecF3oGGTttgWJDo5a67/W1ACpDcIhohm0jNCwx+ZaoF6ZmexTBqKEdk7TdJHW79CL2C8ZanX5YqVmf3KluG4SicunhFlxnHm3Z/3PvPmrgUgKSfuHQuAoBrFk5FIM8NNOkZHTwyj72XCOmCtutisA6V12V10dCPSmdzrnlKvfDDB7uUsB0+wngcwOIFJJNaOoGWEd2Uiq20uETIXNgbxuc52Mf/0iWjLe02y7D32iCIYAkLIyo70p3LXaWlzQ8mOQ5o11y8dii24fmgaJH+Zh2PUU5kDPc89QxjAFEoiS3/WEWgytkHu/it4lnCj0ZkAxqkJp5FIiwMnhLJz/iw4VbinYAK0dM7jZq5WeLj0wZERb5toUQgNffNwjSS/J7PgHpAD1vP8ltg/ERw0wHUyupQ6ytEpyY5bxK9sCkukeKkRJ0e5CLrNaoS7GGn8iF5S6ooMmPg/vgIivpW9J8MhiPeukIEUrS3q73P69EBO2lRssW7lSXmdk4v5odYCLx8GT5uZ4Gb2f1lycg3f+QNC3ytokCFfhravL4QR/5CMhGKndsgY6vlNAZnGjXgjHVKjNHlZ0v9CRbAQgGsGH7+swOAmA9VeJ//qZSYU11mbnps5/9D4j6LkEhe1XUd1NtYueDVAxT581rowoY2qn9a9Q+1Bbs2dM0r6DvxPeYqxFMoG+8QuX+yr
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ekNqU2F0SHdHOXhDV1ZMMXVMSGFsVUZRTmNiV2VRbnB6L1dFSzJEeCswWUlP?=
 =?utf-8?B?R3FsRGg4TDJHUEs1QWlONFI3MEhFWU9qWkRyNVZOUVl1cXJ6dzR0YlplZnhv?=
 =?utf-8?B?ZTB2YWVOalQ3VGtnczhMWnBCSEM1ZU9Kc2dHNFd2YmY0emRMTmV6NjVvUHlx?=
 =?utf-8?B?Njh0RklKYWprN1VXYWhXYzJybTZkYVRVRFNqL1QyK254THpIeDI5UkY3Wm9E?=
 =?utf-8?B?YWhlZENWZjBJbGx3dW9NK2NaN3FNekVKNlFmSy9RVWRtY1Rhd2pLYk83ZjhL?=
 =?utf-8?B?UkQrbE9VTFdhalU2QjdJamRpTVY4VTBJdm45Zmd5STA3S015NFFXb1E1Sks3?=
 =?utf-8?B?YVVOQjFrN3BXV0VOK3hYMTcxVVBML1JRZ0FUb2pheldqcFZrOE95N09QbmZB?=
 =?utf-8?B?bFM0K3pjeWcvRFVYWnFpS2FTMEYyM2lHbGJ5Tlc2azhXVENxdTdBUXNEajI1?=
 =?utf-8?B?M0JzWW55clRFeUhONVF1TWF5ZHZ1emFkMGhZMmVjaVlWOWNkK1k3MkVRVTRv?=
 =?utf-8?B?MXN5SnN3SnBTdElqUXlMTzNCQkpqOHR3MFRxRTdDaFNscEdpdDIwNXVwNEhO?=
 =?utf-8?B?K3lGYVJQQVlqdmlSVGR2K2xRS0FUV0hiaDdFWVhKVjBhOVo5ME5lNXNxcVBD?=
 =?utf-8?B?VlQzMlVHNWNBZUpIcXViN1A0eXIxTVRFZzVGSFZIQWxJcW9DRERKOVVRTUtS?=
 =?utf-8?B?aEdQQTZZMW0zaEF6dHR2ZGFOMTlsQzVGN1NiTmNrbXRWSk1uVERrYWZlZWdX?=
 =?utf-8?B?Q0kyUmMxZDRQS2hXaVlmYWUyckl5TnlCNk8vQzNaOEZhWDd4VnNGZWxGUWFt?=
 =?utf-8?B?cHZRbC9acWd1eG9DNDBXNHlBMVZWUDZIL0cwS2FqbFF4Z0JIVkVPYUVpQVp4?=
 =?utf-8?B?YTJJMzFNck5OQXNlMVpMeWhyUC9aRlhKdDAxdXVEVUtzdmtjbklVdHJRRUMy?=
 =?utf-8?B?NDdIbzJkNEcyL2wwVXlmckc1NmhjSWZVcWxwUi95RHZaUjZjTmMvekZiNXQ5?=
 =?utf-8?B?NVVGcEFJVnVJR21WTDQ2NmNnZjh6STY3VlEwZXRQRVNGQmVIOVFqM1dhejds?=
 =?utf-8?B?SFF4UUladFoxZDJpNjRDT1VRdXIySXBpWkFSaVNJQWgxTi9YL21UL1lrd2JE?=
 =?utf-8?B?c3lmVHRqMkZRTEtLa3JQaGNqZmdERVdaY3hRRXBWRkZJTTd5TlYyek1hU1RH?=
 =?utf-8?B?Y0VUZE1vTU02eS9RMGZIRkhUNzFkTTJoa2JxK1p4bUk4QTh0cDlhTnUvRk9X?=
 =?utf-8?B?b2RPUWV6dXlVK08zQVkrdWo1ajY5K3lQVE1FUnh1UWErVGR0djRlUTZnYjNp?=
 =?utf-8?B?eXZPSlMrOWw4ZWRwMlV1NHQwTlJncmJJQ3k5a1NsbThBbnVEVXRUTEJsaEtt?=
 =?utf-8?B?SVVhQVM1eUFtOE85c1dRODhLRXE4Sk54VDMxM1FpNmdyK3p1TlNqMXJZckE3?=
 =?utf-8?B?em5ZMUFSK2QwMUYvalgvQ0R6RVBOREpzVm5XcFhsamd2THNJS0JHOS81SUht?=
 =?utf-8?B?b3p5c3ZnVUxWZllTZ1FpZmVuazF2Ly9pRFhrODhqWTBuSGdyWXdpQzI1S3dM?=
 =?utf-8?B?WmlwcDVKMnlUd24zYmNEd3krUUc1WW00ZG9BYlk0RUUycWZ0d0ZRaDdhL3Ev?=
 =?utf-8?B?aFhMaWRlQWFqdXZEODVCMDZuZFVRZTMwTmhPU2xFaXlHWEk0YTgrTktMNW5p?=
 =?utf-8?B?Y0pjZURnU3JscmNHK1FHN0piVlBmcFYydEQxNTdKeXlLcFdWZTBGRTlIczdI?=
 =?utf-8?B?YnYzbFFUNGd0Qkk2dFFqY1YvdDBEKzE5NWFQUHJsNDdpakptZ2EvRmIxVHhn?=
 =?utf-8?B?WkpCN0Zra3NTcFpJOG9pUmZTMnlQMC9WSUVKU3lwaFdpRVA3ZDJHYy9JRUti?=
 =?utf-8?B?ZXVFWWhnNzlzdXl2UTJVRldvakRFK0tOZnVjNS81T0s2M0Z2UktpS2NUK0Vo?=
 =?utf-8?B?NGdJZVVmMHVVSFB5WmZNL2pPK2pIUUVFVnJlR05VU3JCZW05VHR4eXYwaTJR?=
 =?utf-8?B?VHdCUlFGZXlVVEdPYjFLdTlWOWR5d3R3MU84VWxzd3RGakkxVkIxcnBEdlpi?=
 =?utf-8?B?MmdUOXpyYlVRNmR3NER6cisvWFJlRFlScjdSK3VMYWF4OWx6V2lha0J3MDBm?=
 =?utf-8?B?TnNhQnpDSWJnZG1peFdMZEhQRmtFT0t2REJZcUtuQTkyV3NCSEdyU3JCNURB?=
 =?utf-8?B?MUNsT0wvN2JNNHpOMXZJSk00bU9GMlFDV2tucmIrVkVnMFZQNmc4UlhOeURK?=
 =?utf-8?B?TXJpbWtwWmRxRytvTXcxVmJDUEo3aC9vYmpGeVFOZVk5a3ROVXdrWFJvSnRD?=
 =?utf-8?B?RllRMXFRdG1wT3h1c3FmQjNQbEhYUEJYZE13NTlpeGFCdzdZdnMxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	hy+wgZR/4lofXuUlTr0cv+TwvR2qkxbGQTT3OkI8cTkqfFjYz8t9nP/dZLq8ufUHI5GRVbApVM5ZVnT0a3fiRmV+dltPmyivxUoGahWBGEju/eTeIEOIKlS85IOjr7Xmjc3Vyx6RiI2plNd/DwRuWtG7ZXIH8mT81z7V5FZQQ7Ch3CYOddEsmOpU78jRtCqbmTPvPf1ApFKheTC73VdVQxsn6bAj8RFsRWTPqaKBsTyzRosO9d+yeLVcbXWDWaZC0C9qb/iquC9QWRxWZ5f3Ga7/u2sIkbVsaVFmQx70sbww3QtPjcg7sEuiat+Zfx8zbKymMPdlDkeLE2QhUSg+sw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4014036e-e6a7-4751-2ff9-08de9b6a1119
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2026 03:41:38.8298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xHSO3UrpIsWiY7GvWHqDhyikjvYMyf7/KrKpR9l9lgzKTHg3yFxW57jIa0tscRa9QElG00lpNZi+UiA2yRbFdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Q5riJY2a c=1 sm=1 tr=0 ts=69e05a79 cx=c_pps
 a=PAMLMQMbhvWzs0jC4PJDBg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8 a=nv23E9fyAAAA:8 a=t7CeM3EgAAAA:8
 a=Q4-j1AaZAAAA:8 a=0to7PtNFAAAA:8 a=JS37omkYBbBVrOHDdmkA:9 a=QEXdDO2ut3YA:10
 a=ehkDpipTsgk7cDPTKqUC:22 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=nXJBQ-xHYf36w3f-TS8M:22
X-Proofpoint-GUID: pmVddYZfajW2MXJKSp0A8FtCuSfWFaIJ
X-Proofpoint-ORIG-GUID: uC_KvfztvaCHzcdx12jWwtu-2hVPxeZp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE2MDAzMiBTYWx0ZWRfX3ocu3Cu6ttT9
 UT4r0XadqBADoJRdjLFmwZT767boR0yygj6qhr70a+6YqMWfLp94LpynAqzXc2b+kpgwZ0jyc1J
 Ic39e1qznQ90DK4bbZSZ282x6RkW6e9eZThflcNnJZ96/M1kxtJa/KiZeO2im1LvToNdmJyol+1
 4uv9/iOLoNXPhrhNbTJSu+X8Azg1IASGh6GEYLKDCYMSAzbjukUeXbTNZOIPUyiC7NaZmG9+eMz
 JQVAQh6RsmPLxpqicmKyvqXuWwQSrwDJBmEKHHXv2Y2KIIRxI05GLwImHtnhZTYRHFm3v5FKXOJ
 vn0ZIozd78+2imCLNy/+GCkrrmXwS97mbBfEhcaFqnxgvbDbRLGo+VMnC7ZgQHAD2IcbPb4kwxw
 XqomF25J0uanQoKsdVs8kKDqDldRuMQb2TZ84CGqRx7fBetF/7fidpUgpKPc6kEdZO9XzGKSUHQ
 eBevYwKOzXVXJtVzEWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_01,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604160032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 03:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235331

SGkgUGF1bCwNCg0KVGhlIHB1cnBvc2Ugb2YgdGhpcyBwYXRjaCBpcyB0byBnaXZlIHZlbmRvcnMv
ZGlzdHJpYnV0aW9ucyBhbiBlYXN5IHdheSB0byBkaXNhYmxlIGluc3RhbGxpbmcgdGhlIGZpbGUu
DQpEaXN0cmlidXRpb25zIGNhbiBwdXQgc29tZXRoaW5nIGxpa2UgUEFDS0FHRUNPTkZJRzpyZW1v
dmU6cG4tc3lzdGVtZCA9ICJvc2MtY29udGV4dCIgaW4gdGhlaXIgZGlzdHJvIGNvbmYgZmlsZS4N
Cg0KV2UgaGF2ZSBsb29rZWQgaW50byB0aGlzIHByb2JsZW0gc28gd2Uga25vdyB3aGF0J3MgZ29p
bmcgb24gYW5kIGhvdyB0byBoYW5kbGUgaXQuIEJ1dCBob3cgZG8gd2UgY29udmV5IHRoaXMgaW5m
b3JtYXRpb24gcHJvcGVybHkgdG8gdXNlcnMuDQpVc2VycyBnZXQgdGhpcyBtZXNzeSBvdXRwdXQg
ZnJvbSBjb25zb2xlIGFuZCB0aGV5IGhhdmUgbmVnYXRpdmUgaW1wcmVzc2lvbiBhYm91dCB5b3Vy
IHByb2R1Y3QgYmVmb3JlIHRoZXkgZ28gdG8gYW55IGRvYy4NCg0KSSBsaWtlIHN5c3RlbWQgcGlv
bmVlcmluZyB0aGluZ3MsIGJ1dCBmb3IgdGhlIGN1cnJlbnQgc3RhdHVzLCBJIGd1ZXNzIG1vc3Qg
ZW1iZWRkZWQgc3lzdGVtcyB3aWxsIG5vdCBiZW5lZml0IGZyb20gdGhpcyBQUzAgc2V0dGluZy4N
ClRoZSBuZXQgZWZmZWN0IHdpbGwgYmUgcmVsYXRpdmVseSBuZWdhdGl2ZS4gVXNlcnMgZ2V0IG1l
c3N5IG91dHB1dCBmcm9tIGNvbnNvbGUgaW4gc29tZSBjYXNlLiBUaGV5IGdldCBpdCBldmVyeSB0
aW1lIHRoZXkgdHlwZSBhIGNvbW1hbmQgb3IganVzdCB0aGUgIkVudGVyIiBrZXkuIEFuZCB0aGV5
IGdldCBhbm5veWVkLg0KSSBnb3QgdGhpcyBmZWVkYmFjayBmcm9tIHR3byB2ZXJ5IGV4cGVyaWVu
Y2VkIEJTUCBkZXZlbG9wZXJzLCBzZXBhcmF0ZWx5Lg0KDQpTbyBjb3VsZCB5b3UgcGxlYXNlIGdp
dmUgdGhpcyBwYXRjaCBhIHNlY29uZCB0aG91Z2h0PyBJIGFsc28gdGhpbmsgZGlzYWJsaW5nIHRo
aXMgUEFDS0FHRUNPTkZJRyBmb3Igb2UtY29yZSBpcyBhIG1vcmUgcmVhc29uYWJsZSBkZWZhdWx0
LiBXaGF0IGRvIHlvdSB0aGluaz8NCg0KUmVnYXJkcywNClFpDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj4gDQpTZW50OiBX
ZWRuZXNkYXksIEFwcmlsIDE1LCAyMDI2IDU6MzYgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3
aW5kcml2ZXIuY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
Q2M6IG1uc0Bnb21zcGFjZS5jb20NClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHN5c3Rl
bWQ6IGFkZCBvc2MtY29udGV4dCBQQUNLQUdFQ09ORklHDQoNCk9uIFdlZCwgMjAyNi0wNC0xNSBh
dCAxNjoyOSArMDgwMCwgUWkuQ2hlbkB3aW5kcml2ZXIuY29tIHdyb3RlOg0KPiBGcm9tOiBDaGVu
IFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0KPiBBZGQgYSBuZXcgUEFDS0FHRUNPTkZJ
RyB0byBnaXZlIHVzZXJzIHRoZSBjaG9pY2Ugb2Ygd2hldGhlciB0byBoYXZlIA0KPiAvZXRjL3By
b2ZpbGUuZC84MC1zeXN0ZW1kLW9zYy1jb250ZXh0LnNoIGZpbGUgb3Igbm90Lg0KPiANCj4gVGhp
cyBpcyBiZWNhdXNlIHRoZSAvZXRjL3Byb2ZpbGUuZC84MC1zeXN0ZW1kLW9zYy1jb250ZXh0LnNo
WzFdIGlzIA0KPiBzZXR0aW5nDQo+IFBTMCB3aXRoIE9TQyAzMDA4IHN0YW5kYXJkWzJdLiBJZiBh
IHRlcm1pbmFsIChlLmcuLCBtaW5pY29tKSBjYW5ub3QgDQo+IGRlYWwgd2l0aCB0aGlzIE9TQyAz
MDA4IHN0YW5kYXJkLCBpdCB3aWxsIGp1c3Qgb3V0cHV0IHRoZSB3aG9sZSBjb250ZW50cy4NCj4g
VGhpcyBpcyBxdWl0ZSBhbm5veWluZy4gU2VlIGV4YW1wbGUgb3V0cHV0IGJlbG93Og0KPiANCj4g
ICAzMDA4O3N0YXJ0PTljNTc4ZTQxLTFhMGYtNGI0Ny05YTg3LWFiMjJhZGViZTM3NjttYWNoaW5l
aWQ9Y2M0NjdhZjliZWRjNGQ5OGE0MzdlNWQ3NDQ5MjgzMDE7Li4uDQo+IA0KPiBCZWxvdyBhcmUg
c3RlcHMgb2YgaG93IHRvIHJlcHJvZHVjZSB0aGUgaXNzdWUgd2l0aCBxZW11Og0KPiAxLiBJTUFH
RV9JTlNUQUxMOmFwcGVuZCA9ICIgYmFzaCINCj4gMi4gYml0YmFrZSBjb3JlLWltYWdlLW1pbmlt
YWwNCj4gMy4gcnVucWVtdSBzbmFwc2hvdCBrdm0gbm9ncmFwaGljIHFlbXVwYXJhbXM9Ii1zZXJp
YWwgcHR5Ig0KPiA0LiBtaW5pY29tIC1EIC9kZXYvcHRzL1ggLWIgMTE1MjAwICgvZGV2L3B0cy9Y
IGlzIHRoZSBvbmUgcHJpbnRlZCBpbiANCj4gdGhlIHN0ZXAgMykgNS4gW0luIG1pbmljb21dIHR5
cGUgYW55IGNvbW1hbmQgb3IganVzdCB0eXBlICJFbnRlciIga2V5DQo+IA0KPiBBIG5ldyBQUiBp
cyBhbHNvIGNyZWF0ZWQgZm9yIHN5c3RlbWQgdXBzdHJlYW06DQo+ICAgaHR0cHM6Ly9naXRodWIu
Y29tL3N5c3RlbWQvc3lzdGVtZC9wdWxsLzQxNjQ3DQo+IElmIHN5c3RlbWQgYWNjZXB0cyB0aGUg
UFIsIHdlIGNhbiB0aGVuIHVzZSB0aGUgbmV3IG9wdGlvbi4gT3RoZXJ3aXNlLCANCj4gd2UnbGwg
bmVlZCB0byBrZWVwIHRoZSB3YXkgaXQgaXMgbm93Lg0KPiANCj4gWzFdIA0KPiBodHRwczovL2dp
dGh1Yi5jb20vc3lzdGVtZC9zeXN0ZW1kL2NvbW1pdC9kYWRiYjM0OTE5YWJkM2ZlZmViNWI4Y2Nj
OTc5DQo+IDRkYTkzOThhMjUwMyBbMl0gDQo+IGh0dHBzOi8vdWFwaS1ncm91cC5vcmcvc3BlY2lm
aWNhdGlvbnMvc3BlY3Mvb3NjX2NvbnRleHQvDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFFp
IDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQoNCkkgdGhpbmsgdGhlIGJlc3Qgd2F5IHRvIHNvbHZl
IHRoaXMgcHJvYmxlbSBpcyB0byBzZXQgVEVSTSBmb3IgdGhlIHNlcmlhbCBwb3J0IGluIHF1ZXN0
aW9uLCBwZXJoYXBzIHRvIHNvbWV0aGluZyBsaWtlIGB2dDEwMGAgaWYgeW91IGV4cGVjdCB0byBi
ZSBjb25uZWN0aW5nIHdpdGggbWluaWNvbS4gVGhhdCB3b3VsZCBoYXZlIHRvIGJlIGhhcmRjb2Rl
ZCBpbiB0aGUgaW5pdHRhYiBvciByZWxldmFudCBzeXN0ZW1kIHVuaXQgZmlsZSBhcyB0aGVyZSdz
IG5vIG5lZ290aWF0aW9uIG9mIHRlcm1pbmFsIHR5cGUgd2hlbiBjb25uZWN0aW5nIG92ZXIgc2Vy
aWFsLg0KDQpUaGUgYDgwLXN5c3RlbWQtb3NjLWNvbnRleHQuc2hgIHNjcmlwdCBpbiBzeXN0ZW1k
IGFsc28gbmVlZHMgbW9kaWZpY2F0aW9uLCBpdCBhc3N1bWVzIHRoYXQgYW55dGhpbmcgb3RoZXIg
dGhhbiBURVJNPWR1bWIgY2FuIHN1cHBvcnQgT1NDIDMwMDggbWVzc2FnZXMuIFdlIGFsbCBrbm93
IFRFUk0gYW5kIHRlcm1pbmZvIGlzIGEgbWVzcywgYnV0IGl0J3MgZXF1YWxseSBtZXNzeSB0byBq
dXN0IGFzc3VtZSBzdXBwb3J0IGZvciBmZWF0dXJlcyBsaWtlIHRoaXMuDQoNCkFkZGluZyBhIFBB
Q0tBR0VDT05GSUcgYW5kL29yIGFuIG9wdGlvbiB0byB0aGUgc3lzdGVtZCBidWlsZCBzeXN0ZW0g
dG8gY29udHJvbCB3aGV0aGVyIHRoaXMgaXMgaW5zdGFsbGVkIGlzIG5vdCBhIGdvb2Qgc29sdXRp
b24gLSBhIHRhcmdldCBzeXN0ZW0gbWF5IGhhdmUgbXVsdGlwbGUgdHlwZXMgb2YgdGVybWluYWwg
aW4gdXNlLCBzb21lIG9mIHdoaWNoIGRvIHN1cHBvcnQgT1NDIDMwMDguDQoNCkJlc3QgcmVnYXJk
cywNCg0KLS0NClBhdWwgQmFya2VyDQoNCg==

