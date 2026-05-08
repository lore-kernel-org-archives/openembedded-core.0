Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B9ECD3427
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 02:36:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5012.1778207774701220464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 19:36:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=a13+9Q0B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95881349f0=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6481kogo1192610
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 19:36:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=m/sQ3o9ifYiVV5wfLHKtNXXF6bdYZayba3iSTEpCHe4=; b=
	a13+9Q0B33lhsiToDnwd4CanaBeA4pVcopZpSRV0sb+dR9reTUDIpQQMHJX7nVoI
	rwj7PbHFm1ozOYWr4nmZo13f3kHxTjp7WaHn6DYfiOwLVvM1ozLSHFoGLDc2ZTug
	i55eSr4Nr3xWYf6rBKvVmej6086VSjFnKyrpliHkfO3lCTTD3lsJLnLrN+coCDNF
	rIC/aGd3PnPvhyh6qh7HNDfUrTzvVu6/T9mFvJ8EvJCSqJEGqI9tkmy9QI7FUJ79
	bLvcowMTqcaFnj1AZLlZzq3KB90abcza1nDK3b/OQn/ciU0HXQ0XevjTRirsUZca
	iKUULxPGrAzFXJCsg0jjww==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyyb55-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 19:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNvBOUNVxZ/TctnhXrUmz7V74IDpuPfWdGD5yKf6j2QyFt/Zh3udC4D+EyF4pr8JZG3MhW/vHRNGCL5N5VN3qAkwUdr1OC8o6u/taZs4IW/vayAaMPl5DlJK5sfS/xz3Ab+ogm//NthyPozwtpkDD6HQcYHu8ydI3q1AHelQ0619jKpFwwoLa2oIg9cdC00+UcioLcuyZSdvhSm4hJhYFG13rdeiN+uBCLty2vrU92JnPOmaNhftW/HpT0ZW4F57rrNV7SW+Rl8e4WAVtRuN0LglIkkRkuMDqdFJACIsxLrGevc/y4JhApMeOYtvgOvbcOYGMSMmn1es0o2DSCoi5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/sQ3o9ifYiVV5wfLHKtNXXF6bdYZayba3iSTEpCHe4=;
 b=iAzH+jFUCMoQJFm1Gx0baFfJpKl09Jhieta61zY/4d4KR9oJXfwNCHc7ToAq2IHI9AmmFXpgscVX+1PltIjUfS7khvFB0JZMzJJxaI93v8xh1mDadaZfZglX4aUU20BxZvzhRwpgLBsbAckxswKC9xatKX5xDAmbi/7UZcWa9w6a9o8ZlsfW1TsPqw8cAfszoty7H+hXlvLq6GYg1ia9SLc/dipRjerOs6L5UeV+T08bdCiO8NT4/8hwR82CeR946qKES7rgKEWt2X/zDJF45Hgx9DqQuA8vWAvF1BDatTDVfU2cK7MCPA3Uu7Rvg9d3Qa2WDZAHMv5ELbFdm82n/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6934.namprd11.prod.outlook.com (2603:10b6:303:229::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Fri, 8 May
 2026 02:36:10 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.016; Fri, 8 May 2026
 02:36:09 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: RE: [OE-core][PATCH V2 1/4] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
Thread-Topic: [OE-core][PATCH V2 1/4] recipeutils: add optional stable_upgrade
 parameter to get_recipe_upgrade_status
Thread-Index: AQHc3emYWBkXgftBPkSo7EXyzrIDqrYCbrEAgAD6JKA=
Date: Fri, 8 May 2026 02:36:09 +0000
Message-ID: 
 <CO6PR11MB560260D1FDE2B57E4D0FB36DED3D2@CO6PR11MB5602.namprd11.prod.outlook.com>
References: <20260507062010.1461027-1-Qi.Chen@windriver.com>
 <CANNYZj_8xSNRRQSzWmUvxDb_r5dh46Ht1h5Ot9NBGu_MOpbvYw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_8xSNRRQSzWmUvxDb_r5dh46Ht1h5Ot9NBGu_MOpbvYw@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ActionId=5987fa48-1cd2-43c3-814a-016eb2544acb;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=true;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-05-08T02:28:17Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Tag=10,
 3, 0, 1;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|MW4PR11MB6934:EE_
x-ms-office365-filtering-correlation-id: dafc2e17-5d3b-4825-58da-08deacaa904c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 /GCRP0eOyAhNKWamqFE5jxdXZq1pgG/mWnfIn8OBKJWxjTTlmh2yVgTek1JNas6uwK1Kr/y8Ie2Q4zkB45+9PR76tvorHO0/MFfLFWcwSCdYH9N3VAv9kb2CA9fnUFf0YLjvlmfpPwAMVCCzTsbhJyKWTT9BukObltO9Q9ALpaZRs5WO4yfvNF/+Msjp+g4EX3w9Kyh9nmOXEImEfKEN47qXK74I67mM7p59HDZizroHrVBEhinaS2OTdp4k9ZxxwS3A9GTlcd3xsiEAqlNEmvxS2nfkk95kJB8nOUDxZcHrmJxQo4bc1IsgHBtF7epuMp+zBdIPe6OPMkstNR203rIBBBA04FThfCtctINIqdIu9kjQm4pbbkxVzhDc9LDXXAOkI7MISGss3upKZqUQzgk5aY37+3woe0mVCj949ai8Zf8XyWsuv9+xp+RDEkeZHmf5b49X4PD2Sw7VNlsoJj7EM4mKNFiXIqMHk7EjAM873lpoGbKUYGvI4EQBcxe33lOCRYQ/JR9TTVVq63hYGI0YSQ1joV9qTxHq5VDg+BnKWsbS0+erZh09u7NHCpXeGzeQUzYPOfGo/hH5oo6JuPXeKqKXwcqV8Ut1frYlptU8OJodoMBOFUkeED+mHXJcVqspyW5c6OQP6Nz+u73H3Xni+YmgYjHG1tY6MNRhrRuOlfN/kLnQ0l4Yo4FN0pzZ73tX0lzpAtb2GtAmoyUBj6poIWCRzx1qzkWQYLGLGZ1b4pg2rwk8qicSle0LYQpi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFJ2S1cwUHh5dVJRalJaRSsvcitWSXNkQWlPbFBwRm1Wbkc2UkNwL3J3ZzBo?=
 =?utf-8?B?aGk4L0s1NUxnQVFwQVpqdEhFTE4xWVVkbjRnSVpQb1FHLzFqQll5cmVoMVI1?=
 =?utf-8?B?LzVLd1VLbmV3SEFIYW5KelpSWUhVaFhGY3RUUnpMMCtVZ2RsdlROemtQRit6?=
 =?utf-8?B?dno5dHJhQnQ5alhqK2FpdURmMVJNSjFZQTJNYkFjZ2pqMXB3SVp1TWZrdGxK?=
 =?utf-8?B?MlIrbURoczBxTGcyY3F2QWpQM000bnAwcGhZQU5NdVprRGVYamFKdkg5c2c0?=
 =?utf-8?B?UjM5STRhc1NMYjF1MUJUdDlQaUp6SG1NaVErYVpoZ05jQWhaQktQTmFIS1BB?=
 =?utf-8?B?TjUwWGxtczNUcllTVllhN3B6RXdXcTZRZVlJcEM5M2RSOXFVblYzL05IOXdw?=
 =?utf-8?B?YU5hb3I2UWh4YkgyQTRSdWVVU3dKQzRPWmI0Mng0WGxNY3lKVWEyRk1mL1hE?=
 =?utf-8?B?eTdkWGo0d1RNVjdLUDVlVncxQ09SU1huQ2Z6K3c1SHVXRHJ5R3RJa09iclR6?=
 =?utf-8?B?UFo3VFRYZUpsSFkvV2ovTFVoQ1I0ZC9wWmVkbnpVaWxWUUsrTEszY0g2QVRo?=
 =?utf-8?B?QVNRTWpVNlZrNTlZNWIwaUswc2JtbnhqN3hVSUpZMTIwSUYvNkZWcllqZjlC?=
 =?utf-8?B?MG01eTFkRlZ2RW1kT0ZidVo3a1FYR3JXM2VXdER1clQ5MXQ0QTA4ZkNRb3Iw?=
 =?utf-8?B?NERVaGNEOFN3eFVJVG9mZUdrVjJjV2twcmtUVXFyb0FCaTA3ZjBrd1lLNmFP?=
 =?utf-8?B?VjNINWtOZUF5MFJFRFN4dXFwWnI5Mi9Pa0dRWXBMMDV4WGYyL0xFNGF3dStP?=
 =?utf-8?B?ckJzcWIzQkMvUG5rb1ZvajRHSEhjUFRFSGxzdk5jS1R3cUpyRm4xQ1lCbkF5?=
 =?utf-8?B?OTgvU3ZQeGFEeFFIWmYyelF5dWhBS01ZallaWEF5WlZ1V09JdDFnY215S2RE?=
 =?utf-8?B?TTZBbktOWlozbFExU2tkZWh5YjkxRDdtOEhJb2ZWcHJPbjhicHk1RzdycG0v?=
 =?utf-8?B?d1ZNK1ZSTjVYdFlId3pWaVhyRUlxTlZzUmk4KzBkcWxsMXlYOU85aVMvamlG?=
 =?utf-8?B?ZXNIbDlOdEVTeXJKUy85UHQ4ZjFPbmdwSDdxTE4ydVREOGkxYmpIekJwNDcw?=
 =?utf-8?B?MEpiSjJUakFSZ3NHUzVKY1JxejFnRURzM2JJdGlSMitzdzYzOGtOMVdkWUd6?=
 =?utf-8?B?Wm9PSlA5eUZNSFZLNWt2d0hWK29SUWpiemwydGxENExBZVFJL2dwMXQ3d0hF?=
 =?utf-8?B?ZWo3cUg3TW01VWtYVjRNbmxkMFBWVWtHTExxWm1BWnBGVTY1blA3R2NMSzFs?=
 =?utf-8?B?NnV1TGJ1TTNNeGRGT1hGdDB1UEQ3cG5UZ2s5TlZiV1phcEdRcUxLVURiOXo4?=
 =?utf-8?B?QkdlRVdmSFpDdU9uNHVwYnQ2Q3BTdHhDSGpOMTdOUUpXckRKTFgvU0VTaStx?=
 =?utf-8?B?SnUrYm1zRThBakxnWGZWWkZzNDdHL2VCVlFSVEJGR3NXUnpEUy9wYUhna212?=
 =?utf-8?B?U3BUZUVNMkNkeEVKY29WTjdGR1ZQazNKUlhrRS9nNmxTNXJWWnVkZGF1Nm1h?=
 =?utf-8?B?NFJqSGlGOEhZQXRnMTVvaWFLdzFQTUZ3U1NpaW9LdEtzSTRZNzh2THI2c0M5?=
 =?utf-8?B?eEJtRGlYSUNZT1NhM0VsTFRzanA1UXE2bFloVFdzS1NXZEZWQUFCb0xJdk1I?=
 =?utf-8?B?VnYvMTVWTmF1K2FSdHFtd3J6a0l3ekZPeWlqYzJBQzR5V09Hcjd0NG84d05w?=
 =?utf-8?B?a0ZTaVJZY0ZpcU5SSXYyQ0pqODZMOXdvaCtyTzlzcTA0QVFJZzZWM2lmMU55?=
 =?utf-8?B?MU5vTjJDaUx5T3VnWG56eFAvbWFpN3MySW9nN0ZBdUxFZmFXa0NNQkluSDg0?=
 =?utf-8?B?d201YnVUN1BoQWMvTWh6bTFpc2VzQkdCU1NtNlk0Y05hcWpaTHNqOWlyMnRH?=
 =?utf-8?B?MDBPQlhUNS91dUUvMUtPK0p6M1hSUXExczhpaGVZSXNGMlFycnpxZHpSaGU2?=
 =?utf-8?B?RVRPTDROeWZsRVVFQTE1TWp6UE9IWVVMN0RDU0VOYnhrRjNDeThOTndPQmVD?=
 =?utf-8?B?aTVNT1NIL3JrVmtIdTFwdTNKR3hQQjBobjZzT2Rtb0QrRjBobE9STi9LTElx?=
 =?utf-8?B?OEkxbnRkVU5JOUdENDcwYURKdSsrZnp5L0lmS2dhVlNpd3p6aWcxT1Z3WVJ3?=
 =?utf-8?B?anhma2dFbFpZek5lRk1FZXZWU2VmbTgxZ29NcVQ3OHhjbTVBb3pyOU1vK1ZM?=
 =?utf-8?B?NVFjSVc0K1lWalV1WFpxc3RubmZrU0MzN0hFRFJMR1B3bUh0WkFKeDZST3Vs?=
 =?utf-8?B?QTJIL1R3b2lxb2xtRitqRHNxNGNTdUE5aDV5ZDdwKzJHVXJ6Z2JMZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	Uqx2ZHTM9XWQrADmV8YLfodSufGYbLSLBR6QEHFKO71eVY1TZvXl+y3SePRM9QMSDDtuvrfyzTIIv2INdLP3wJjRh+Nyjq/5Wn6C4cOEmXY/EAd2acfqPRzGusHFpJ3MClKcQHI/ZQEqi3kUs9dzs6GjH4qMAjb3ye2VN0qZ7rebiX3p17KKjj9gajXuipmkAGt53VwoetgcFccj+jCtpM0kZU/YhASPXkFnJ8natHY+gk59Hc2zRhigbXYk3fPPzdB8h5DAICAzGEU3JwEwOLauUiAoRVtFBJwx1IvgN2payiFmRD5duLfpIsJ2oWxADJp1qcZhmzxJLCwVj0QzSQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafc2e17-5d3b-4825-58da-08deacaa904c
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2026 02:36:09.8327
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ykz7yBvTPys2RP0PI7RvFn0BVqIeR/OQxXkCvxXdc+RUEM8Nm6mtrgr3CLbYPYNqgA3bEHEvfK7XrsX9AoZldA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6934
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDAyMyBTYWx0ZWRfX+T4IcgEtzPDu
 9H29esvAGpBoH91f9LyBP90mFMgOXBaBv/pUI/ve7IQ1ikEWrsTrki5HxbiASNqiGCWOW2s5WD7
 dK+oZHDf8RHArRHA+3e0EwuJUd2qKNO4HRVpSXYzgu6U/odO7bsSECEMUtRovdY/k8JXidBjmKz
 vDFFoPcXmzqhsi+DIcz5Y2eZU6KMefhTH8isI9Rkz7L+Ng38JKsBp0aAhE56mgQyM401ZB9hP8Q
 zOib/PGaVBYvehLy/pF/hhzXtNSU8lGJmT5iQtqr2kJxCrAc47FT0cHF4eu8s1ONNxc0NWXma07
 xY6FyxtVpRNgjeSD9bpgqOPmT+2I6g/KaUaIY3YLl1f0b/yNMBpQlKCGqW1O4BBeamodKKTGbOh
 xMXrb3eL026f1VWY0tjk32ckn6pJcn+i/JMDjRqj8cbubXLOJ335tTmHBnItSmXuPgkhu500zVL
 222z2BWVHWAa+L2k+bQ==
X-Proofpoint-ORIG-GUID: 28hWAkMyirm55Fj6rbjSifXO8sg4vEnr
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fd4c1e cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8
 a=AKz6BRe08DkDxe02nVgA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: EqX4Eguy5W2eaH7rpz6cKo4xxfvv9CgB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 02:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236631

R290IGl0LiBJIHNlZSB5b3VyIHJhdGlvbmFsIGFuZCBJIG5vdyB1bmRlcnN0YW5kIHdoeSB5b3Ug
cHJvcG9zZWQgYSBiYmNsYXNzLg0KSSdsbCB1c2UgdGhpcyBiYmNsYXNzIG1ldGhvZCBhbmQgc2Vu
ZCBvdXQgVjMuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+IA0KU2VudDog
VGh1cnNkYXksIE1heSA3LCAyMDI2IDc6MzMgUE0NClRvOiBDaGVuLCBRaSA8UWkuQ2hlbkB3aW5k
cml2ZXIuY29tPg0KQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7
IE1hY0xlb2QsIFJhbmR5IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdW1BBVENIIFYyIDEvNF0gcmVjaXBldXRpbHM6IGFkZCBvcHRpb25hbCBzdGFi
bGVfdXBncmFkZSBwYXJhbWV0ZXIgdG8gZ2V0X3JlY2lwZV91cGdyYWRlX3N0YXR1cw0KDQpPbiBU
aHUsIDcgTWF5IDIwMjYgYXQgMDg6MjAsIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+IHdyb3RlOg0K
PiBJZiBpdCdzIG5vdCBzZXQsIHdlIGdpdmUNCj4gaXQgYSByZWFzb25hYmxlIGRlZmF1bHQgdmFs
dWUsIHdoaWNoIG1lYW5zIGlmIGEgdmVyc2lvbiBjb25zaXN0cyBvZiBhdCANCj4gbGVhc3QgdGhy
ZWUgcGFydHMsIHRoZSBidW1wIGluIGxhc3Qgb25lIGlzIGNvbnNpZGVyZWQgYXMgYSBzdGFibGUg
DQo+IHVwZ3JhZGUuDQoNCkkgc3Ryb25nbHkgZGlzYWdyZWUgYW5kIHRoaW5rIHdlIHNob3VsZCBi
ZSBhIGxvdCBtb3JlIGNhcmVmdWwuIFRoaXMgZGVmYXVsdCB3aWxsIHJlc3VsdCBpbiBhIGxvdCBv
ZiBwb2ludCB2ZXJzaW9uIHVwZGF0ZXMgd2hlcmUgdGhlIExUUyBtYWludGFpbmVyIHdvdWxkIGhh
dmUgdG8gZ28gYW5kIGNoZWNrIHdoZXRoZXIgdGhlIHVwZGF0ZXMgaW5jbHVkZSBuZXcgZmVhdHVy
ZXMgb3Igbm90LiBZb2FubiBhbHJlYWR5IGhhZCB0byByZWplY3QgYSBidW5jaCBvZiBzdWNoIHVw
ZGF0ZXMsIHByb2R1Y2VkIGluIGEgc2ltaWxhciB3YXkgd2l0aCBjdXN0b20gQVVIIHR3ZWFrcy4N
Cg0KUmF0aGVyIHRoaXMgc2hvdWxkIGJlIGVuYWJsZWQgb24gYSBjYXNlIGJ5IGNhc2UgYmFzaXMg
Zm9yIGNvbXBvbmVudHMgdGhhdCBhcmUga25vd24gdG8gZG8gc3RhYmxlIG1haW50ZW5hbmNlIChh
IGdvb2QgaW5kaWNhdG9yIGlzIHByZXNlbmNlIG9mIHN0YWJsZSBicmFuY2hlcyB3aXRoIGEgbWFq
b3IubWlub3IgdmVyc2lvbiBpbiBicmFuY2ggbmFtZSBzb21ld2hlcmUpLCBieSBzZXR0aW5nIFVQ
U1RSRUFNX1NUQUJMRV9SRUxFQVNFX1JFR0VYIGZvciB0aGVtIChwZXJoYXBzIHZpYSBjbGFzcyBp
bmhlcml0IHRvIGF2b2lkIHJlcGV0aXRpb24pLg0KDQpObyBleHBsaWNpdGx5IHNldCBVUFNUUkVB
TV9TVEFCTEVfUkVMRUFTRV9SRUdFWCBtZWFucyBubyBzdGFibGUgdXBkYXRlcyBleGlzdCwgb3Ig
dGhlIHNpdHVhdGlvbiBoYXNuJ3QgeWV0IGJlZW4gY2hlY2tlZC4NCg0KQWxleA0K

