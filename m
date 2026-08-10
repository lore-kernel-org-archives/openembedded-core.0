Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB925C5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:07:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23436.1786338470229186502
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hFDPWbBh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A47dpX1046466
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 22:07:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=TY4sOlNqLfvM2DKnOM60e5/Y3347GUUU40jVzM18ctg=; b=
	hFDPWbBhG3nQZAyzWwwik3894Mo7E/dWOSQYgu71ND4b+aPchVofKT8iQbxJdKUM
	8V+pnzbrbs4780oclxIwrdxoKLjASAXIasVeH6xNdmOWN2GAdsumsk1vG2+uFIXO
	h1BY04kvQKdwaSNarR7J9Aae5uuAeX3hobPxdE/2qEetJaMLKxHB2GHSHgpcPcEQ
	tJRFmW9i7YqD3zAC2DxDd227i3nrXLrb0BE4ekW390MAAbZOWsZ8ghROZr/a46L5
	SA0r3SzIo+X3b5KMI3ZKrrHP9bMkWKLUyStk0W797FrdxE4z/ijFMtVvshuK4Wqo
	Bn56DSaQrr28KZz8JsS5oQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fx3yehg5a-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 22:07:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RrkXwA1B4A8Wp8rUhVm0FwmPA+rWsGZpGjBhsxEokFfsdl3eG2/i+ANz/rYx3cTPNt7nDatyFXyNOtwRA+WUKf2A6t2U49AJ6aATiTDWp7u+m1nEBXb6WhwlgZinmLMl+ZZxSmXGdFCv0QSSTtsbbDC0jPw2PUPROg+1W1j/LfmmODDdbDQ01JgRThpdvMWtUvxy5awHSKhkoY/k5lU5y18QzPfcAJnXuSDNBk/T8wqCyTlzZhrTifpF4ZwzsS0o57fUrXrEqH11ehpQUbcyuUw4+uhqvqRX8vOkxKOwNAAuX1Zku0MGLfsUFp/PLFct4cRBBmsfnk07NpXesWNbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY4sOlNqLfvM2DKnOM60e5/Y3347GUUU40jVzM18ctg=;
 b=cdLd4JKZx/CEvrTkSRbiCcf3bW2+7DIRHOyYY9IcZ2QWikC2EGpQgH+o/JiQ1/AuwlDTUdg3UyBpWi2XvVb9PugJvUvJlDr1MIwN+U90umaMPNquAMOqSAr24LpQFdysMKyM29iIglrX9CqeTbpwhEe2ZClOVSxe54D1ZR3KZNBX5prbh1ZG7VHeHD5zwQgjxELqSMZ03JKoOtqWdYUelS6xMNykSlPbhbrZcYfkfZqOEUsNfPZUw82IZgC2CqGYSrfo1SKhfm7ubzghYfYrdkHiGZ07+5KJ8TnIttutXx/FXfVHy5X8GHW2T6Vedfd09AqvF4fIkmKdgb2UBVkJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7355.namprd11.prod.outlook.com (2603:10b6:208:433::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 05:07:45 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 05:07:45 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v12 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Topic: [PATCH v12 0/8] rpm: 4.20.1 -> 6.0.2
Thread-Index: AQHdI8bn4qS9Yk2NLkelBUM6keUMq7aN8KUAgAAyWQCACKHOAA==
Date: Mon, 10 Aug 2026 05:07:45 +0000
Message-ID: <d93ffa23-f9f2-4711-aaab-863c1fd35b04@windriver.com>
References: <20260804040815.1499699-1-sumanth.gavini@windriver.com>
 <DKG838IZIDKF.1IBQ7TAPXMF9E@bootlin.com>
 <CANNYZj8x654JdZRXfoiceNMGaNM4=fjcf+9k44mLdvzW3nhNoQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8x654JdZRXfoiceNMGaNM4=fjcf+9k44mLdvzW3nhNoQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|IA0PR11MB7355:EE_
x-ms-office365-filtering-correlation-id: b5ca1815-c72d-4e90-7c75-08def69d505b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|5023799004|11063799006|38070700021|6133799003|10067099003|4143699003;
x-microsoft-antispam-message-info: 
 89E/aStToSXk6KFoKAjmSy8pdUeEw0xedAef3afN8glWU9oUrTdhJPinKQ1PgRXHByYEU9ZL3B8XEirNKE75aY8yzWfpt0NQ+Y4bVEr/NZ1eFL7j40XzDEVxc5BRun8xEJ8wzXipU7RohgFWws1E7XTzlMoHZWsuKrkOfGe1Ve8hAPm7ROFjTw/J7fSDHvDI5Ibchg3W98/ep6UIWKhAbTVTQHmJ9jBuzh7K7DtLLyYWQnHDZ9yPEY/tJ0yf0hSHs1lsLU3Vu87dct+vn+5XPKaK/wxB6SKzkpqRhejtBZxDe+IVwh6UfS0Zz9D/9dV7S09gy+MU8nt5KeTKARG/BIdt3+7HoUOST63ycQLOYryy1LYgYqUjJNe4eW5uPi5nLmTSuvWmRtMUIUyOBEQR7uKOCXtJTYUJqJwKcyGejVULB0sURcpLyK8czs2RxNtI8wC5gFnf3j5giUGDc6c1vzAXAq/NXZweOuaFXv5eP2bmROB2pWPoc7o8UyOFZBtYiSzJmuK4tZ6uJApfL400GW+WHzKQ/3l/NKtBT6g+k+CjeHAfL2HHj6rI0wds+i3Tf0w7mQKHmUgGgBOa2Xf+4IhYh5WIJf9s11B2UPeOiQsUAuaGu2y/mcL3AFXP4VBB0tDDBEDSmm8rVv6VGEWgpSF604fxMmiCo1Y1BFgxrwVYU002U03r9CSGNFnzTs9yyR2ts1/FOREECjoO02AjHqwq9Rq06ouKCFDsWsQTDik=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(5023799004)(11063799006)(38070700021)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aGgrdm1KcWZidnVmby92REtQS29XdWdjeUVBeWRhRlVuUFQyTElQajB2UE9I?=
 =?utf-8?B?UFdKZW9qWUE2Wm1iT2dGa0VlZEVSTlR3ZmUrbG5pdU85YUNHTEZKRm0rUXlF?=
 =?utf-8?B?WkNiUmRLRVJpTVFoMWdtT2hkdGZUZGNHc0U0dTlWMExKZVRlSTdVN0Rob2hr?=
 =?utf-8?B?ZElzRTc2T25PemRBdHdQYnpZeDU5WllUY09ock5sZVBtVWVNb0IreWt6YXVy?=
 =?utf-8?B?TE5KaWMrUUF0MHJ3bjE0aFFrcE1TaU9zWDJpRVpxVDVzckh1ZE5kS2lSV3gw?=
 =?utf-8?B?N2kzVzNWQkl5ZGE3bGZya2pSVEpycWE3N01IbGdUY09GR0JlMkNlTjA3aTho?=
 =?utf-8?B?Rmk4MnhrK3c3cC83eGVWeTFaRXpOUzRVTUZXckJaZE0zcS9Pc1g2aExGaTNy?=
 =?utf-8?B?NlZyWHAwRHpUNDZyREljRENiS0EvSGRZVzZScG85ZkFheWtMeUwvRjE4Qlpr?=
 =?utf-8?B?d2JXYm83eTRCVFVVRklyeW1CTU55U0F5WmYzc0V1cEZtUFpCalFPbTdpbmZu?=
 =?utf-8?B?aFFWaGxRYStBU2Vtd1BqcytVLysrZTVORGZrQzArMUtXeVp1WlBObWw1UHJX?=
 =?utf-8?B?clJocHJKT3lNcldTc3hmc24wZC9BdGxCb2duVXNidjZvWXYwQ2k1T09USnJS?=
 =?utf-8?B?eDUweUY0MG1sbGRFOFk5cHNVeHVkc2c5OEQrU3RWalpXaHd4WEpZbFFGdXps?=
 =?utf-8?B?V1BJV0JaQ3J6UHQzMytjSWs5NlhQR21BcndSZUFNS3ZqSHF5eWRWR2lqQlpH?=
 =?utf-8?B?NmpsaHRnUCtsREhxLzkySFV6ait1TXEvU2NMT1FiMU9PY0VNQkZQWXJtbWYz?=
 =?utf-8?B?M1NxcXFMMTEzbDlIOE9uKzVtN2ZDL2VodW5IN3AzajAySXhFYTFVeGlGWEYv?=
 =?utf-8?B?cDQwQ1p2WDB6cTJZZVhSMGdDM3lkQlE2RUhSK3pwRHRjQ3VSbEgvdHMxVzVw?=
 =?utf-8?B?UjlxTnpnVjNDcDd2QzhMVEZmSTVxSTF4U2tTUXRxUVkyNU9hODhmdjFOSFZh?=
 =?utf-8?B?VDJENGp1VFNySElMbUhadGl1ekwxT0w0UkZiWlQyZSt1QlFvMVZWOHJReFhR?=
 =?utf-8?B?WCtoUDBQdkVLcTVDclQvUS94V0dOM052YlpBbGcrNUdDcmF5YjJTL04yWDAr?=
 =?utf-8?B?WDBSeHBjU1o4S2J6b0FnSTRRZUJNRFdiemRQcG5QdEQrcHl6c1dwdDVFMTdL?=
 =?utf-8?B?OWNXZkFRVlh0WE9qUllaZ2Erb2puRlUzUnJFYnNwYmN6aUh6WWhkbXRFMzZL?=
 =?utf-8?B?VGo0OUhseEZIR2w1QXV6bURpOHc3N3E3N3NyT2lRQThKUUczNnRzTzFhQkcr?=
 =?utf-8?B?bnpzdUE3OU1RR05TTktYTWFBbzVwYjVRdFlPR3pmOGRFdmQxNTRsRms5TEpM?=
 =?utf-8?B?aDV2K0xVc0lEUGhMYkpVNDdyQ3VNamlaOU5rTFFveUJYNFhzZVFnalBtMzI1?=
 =?utf-8?B?bmgzMHVsZDh3TzN5TnFDUmJPQTlpV2NYdDRBajBnWERUakpLVTgrYXBQdzRJ?=
 =?utf-8?B?cnpwNlZRekhkSHo1ayt2QUxEek1GckQ0S1lqNUt6bHNhdlE3R1VnbUtlT2ZX?=
 =?utf-8?B?TjA2Qm40MWxqOGE4ZlprVEFDRitSKzhSZyszWVlwNW42c3ZHTFFtdU1mUTZk?=
 =?utf-8?B?SU5FMkRCU0RxZVc1cVNEbU1LWkJEMjJaSnpVMExjWHNtMzBBYkg4ZFIwd01o?=
 =?utf-8?B?UEZiaHg3U0VzVk1YYXFpR2pDSjU3MjZoSlJITk5sWHhYL29Jcy82citlbkwv?=
 =?utf-8?B?R2tlU3BkRmFNbnZicEdibGpUWnNCRzBZS2x6blhkL2I0b3EvSjdPS3ZZZGJZ?=
 =?utf-8?B?N2tya1R0SWdnZklvK1dpNWR4Vmo3MnNCcGxYMmVWb2hUcEEzNVdPVzc0UkNS?=
 =?utf-8?B?QThsTFM0UmIxczd2MG9vZXZlcGNKdnJaL0lra1gxbmI4NXNJT3FoN2ovM2Fo?=
 =?utf-8?B?enN2ZHVzSzRidjRjSGFqc0pCT0J1OHVSdE4zOGwzSmcyYTcvQ3ZDMTFXY2d2?=
 =?utf-8?B?RVcwUlBRYm56SGo3MEVrMDAwd1hCY3RJMU9WdEJUTDVCbFZhSmJCRFlBckhY?=
 =?utf-8?B?V3QvdWVqUG1qd1MxZFdWK0tPbkdjUTBwZ05ZZlJkakJLbDhweDdWOEFTejdU?=
 =?utf-8?B?aGc1TlBDRVlUS1RSODRBMTVJZWtTZTlwbFc1TllBY251bi9ZLzVxVDUrMTRx?=
 =?utf-8?B?SmJCRFdGUkJoS0VkcVhoMWR2ekdkRjRjUmpOT05xa3Nkb25XOVlrZHM4VEFQ?=
 =?utf-8?B?UGM5WEQ0RmxBM2oyZGlncTZRK3BJZ1N5dmY1Y2NRQWhRRzRIYkFOa2JEQVpY?=
 =?utf-8?B?SzFCWUYzR29pT0YvVVJ5NU10THkrVTdwNUpRM2dLajU3TXI3UkYwam4wRUU4?=
 =?utf-8?Q?DK+1tXAnkTsiisMA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <66CA00C867B99449AFAE284BB4DD8327@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	crttISe/8ZV9pRehEn/yxhqqfwabGCHuBM8OyCcD4GXCDxu//IWXrwE6KpsWTuWqkpuGta5mkDxBepaxg++IfFEMxwe4n8l0bfGCFvm3pfWgGUeM62XsLQdmbLqEJ/JAqdK8ZbzEEqrOFvJVi5QBRGCtDc9uvB4omkWldw1wM6rdvqFC2/0EdSdzr/2iHulyNXoWt24aVQ9HcLi+65t38QqSV0k7iuHorMcnzjQfNvGiaglYom17knHnybu9BHVirSPXgQaZD8TWW7sdaa7GxYYv8j52WW2ne4LdR1YGwdZfY3Z7x+f5+RJ+CnluFrOICpHj5UZ1UMD2TU1L8qxGyg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ca1815-c72d-4e90-7c75-08def69d505b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 05:07:45.1391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUKl0mVo7PdHU7QSPmfpwvVAbuGEgD4nB/Qo4FfCIbxGuxaE7FNZgQndeI9zwGxSf8KCI8e7X/8eAX0CLsf8IW1DSzyCAeh3ji+zbgo1U4w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7355
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA0MCBTYWx0ZWRfX5sXjdNSgnsrD
 SMB1T/89B5CylUMJKl5ymBg28b42BqiK/iBAnBu/IEPW7/BngylbOmjjevjKNU8KJYJ26T8AXtF
 YQ/DUQyAO0p/7B+3e0Fm10BYRvQ51YKrYujPd36un9184hlf39PhQP0z6yoXk/xm9987js5Aybo
 CPsAO5aUp+Hy+7zBp33SR0NpXoixwB/XbwS+pUEJKHzbqjx1ENiq3RvZOzstrJHpMAu8OqDeFFx
 eY822KMK4j59/149uYzcHWieXE2TAMEUf0P7+AZGEQi3z/U+j2JTeCK/KgAicIqhaTm0z7BN7Ja
 fjj51QJoiqirx91nK7FvUN5Be5exQOt4wAjz1nVf8dpjFGohs8yVzw1WhJzPzKDdfSUHzuOZXkc
 fxMEZ0bROVlBi3OSPQwUnolkFlnFMgCN47iLKdGJhwUt0d5UjY20+XsxvctJrPfqKND1HC33L9l
 orzdDbhfGcs8DYwndkA==
X-Authority-Analysis: v=2.4 cv=NbHWEWD4 c=1 sm=1 tr=0 ts=6a795ca5 cx=c_pps
 a=Z+ESqgFbrcYkgT1kPBc/rQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=iKiJcTA2PjBS6x5JeXcw:22 a=P-IC7800AAAA:8 a=TtmAUx_JMtsA3uStfZAA:9
 a=QEXdDO2ut3YA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: JQvRjd0N83dAaNWaX7Ei8QEotmhsG1ju
X-Proofpoint-ORIG-GUID: InJBPlYj8fQn5Ktdsr2gR13iKzJqbZlu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA0MCBTYWx0ZWRfXxxsKrFL9jLQu
 yKvaV0hKeXC6p6jyV6g7g2KK5UFecWmDzksKWHrie+8IQDbqqHeSYRvJsNdpmN3UdSFvMcUGdkT
 WTOZN4Z0BvCbkE6a4ZBC2t2MVaPAlfqPzrq0mWk4OJVRRttOd3BI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:07:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243104

T24gOC80LzIwMjYgMTI6MTggUE0sIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiBDQVVUSU9O
OiBUaGlzIGVtYWlsIGNvbWVzIGZyb20gYSBub24gV2luZCBSaXZlciBlbWFpbCBhY2NvdW50IQ0K
PiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IHJlY29n
bml6ZSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiBPbiBU
dWUsIDQgQXVnIDIwMjYgYXQgMTY6MTgsIE1hdGhpZXUgRHVib2lzLUJyaWFuZA0KPiA8bWF0aGll
dS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPiB3cm90ZToNCj4+ICAgUHJvYmxlbSAyOiBjb25m
bGljdGluZyByZXF1ZXN0cw0KPj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHBrZ2NvbmZpZyhsaWJ4
bWwtMi4wKSBuZWVkZWQgYnkgbGliY29tcHMtZGV2LTAuMS4yNC1yMC5jb3JlMl82NCBmcm9tIG9l
LXJlcG8NCj4gDQo+IEkgbG9va2VkIGludG8gdGhpcyBhIGJpdC4gRmlyc3Qgb2YgYWxsLCB0aGlz
IGlzIGVhc2lseSByZXByb2R1Y2libGUNCj4gbG9jYWxseS4gU2V0IHVwIHFlbXV4ODYtNjQgcG9r
eSwgcnVuICdiaXRiYWtlIGNvcmUtaW1hZ2Utc2F0by1zZGsnIGFuZA0KPiBpdCB3aWxsIHRyaWdn
ZXIuDQo+IA0KPiBTZWNvbmQsIHNvbWUgb2JzZXJ2YXRpb25zOg0KPiANCj4gMS4gTG9va2luZyBh
dCB0bXAvd29yay94ODYtNjQtdjMtcG9reS1saW51eC9saWJjb21wcy8wLjEuMjQvdGVtcC9sb2cu
ZG9fcGFja2FnZV93cml0ZV9ycG0NCj4gSSBzZWU6DQo+IA0KPiBQcm9jZXNzaW5nIGZpbGVzOiBs
aWJjb21wcy1kZXYtMC4xLjI0LXIwLng4Nl82NF92Mw0KPiAuLi4NCj4gUmVxdWlyZXM6IHBrZ2Nv
bmZpZyhleHBhdCkgcGtnY29uZmlnKGxpYnhtbC0yLjApDQo+IA0KPiBTbyB3aHkgZG9lcyBsaWJj
b21wcy1kZXYgcnBtIHJlcXVpcmUgYm90aCBvZiB0aGVzZSwgYnV0IG9ubHkNCj4gbGlieG1sLTIu
MCBpcyBtZW50aW9uZWQgaW4gdGhlIGVycm9yPw0KPiANCj4gMi4gTGV0J3MgZmlyc3QgbG9vayBh
dA0KPiB0bXAvd29yay94ODYtNjQtdjMtcG9reS1saW51eC9leHBhdC8yLjguMi90ZW1wL2xvZy5k
b19wYWNrYWdlX3dyaXRlX3JwbQ0KPiANCj4gUHJvY2Vzc2luZyBmaWxlczogbGliZXhwYXQtZGV2
LTIuOC4yLXIwLng4Nl82NF92Mw0KPiAuLi4NCj4gUHJvdmlkZXM6IGV4cGF0LWRldiA9IDIuOC4y
IGxpYmV4cGF0LWRldiA9IDIuOC4yLXIwDQo+IGxpYmV4cGF0LWRldih4ODYtNjQpID0gMi44LjIt
cjAgcGtnY29uZmlnKGV4cGF0KSA9IDIuOC4yDQo+IA0KPiAzLiBUaGVuIGxldCdzIGxvb2sgYXQN
Cj4gdG1wL3dvcmsveDg2LTY0LXYzLXBva3ktbGludXgvbGlieG1sMi8yLjE1LjMvdGVtcC9sb2cu
ZG9fcGFja2FnZV93cml0ZV9ycG0NCj4gDQo+IFByb2Nlc3NpbmcgZmlsZXM6IGxpYnhtbDItZGV2
LTIuMTUuMy1yMC54ODZfNjRfdjMNCj4gLi4uDQo+IFByb3ZpZGVzOiBsaWJ4bWwyLWRldiA9IDIu
MTUuMy1yMCBsaWJ4bWwyLWRldih4ODYtNjQpID0gMi4xNS4zLXIwDQo+IA0KPiA0LiBTbyBpdCBz
ZWVtcyB0aGF0IGZvciBleHBhdCBycG0gZG9lcyB3cml0ZSB0aGUgbmVlZGVkIHBrZ2NvbmZpZygp
DQo+IHByb3ZpZGVzIGVudHJ5LCBhbmQgZm9yIGxpYnhtbDIgaXQgZG9lcyBub3QuIEJvdGggcmVj
aXBlcyBob3dldmVyIGRvDQo+IGluc3RhbGwgYW5kIHBhY2thZ2UgdGhvc2UgZmlsZXMgaW50byB0
aGVpciByZXNwZWN0aXZlIC1kZXYgcGFja2FnZXM6DQo+IA0KPiAkIGZpbmQgdG1wL3dvcmsveDg2
LTY0LXYzLXBva3ktbGludXgvZXhwYXQvMi44LjIvcGFja2FnZXMtc3BsaXQvIHxncmVwIHBjDQo+
IHRtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L2V4cGF0LzIuOC4yL3BhY2thZ2VzLXNwbGl0
L2V4cGF0LWRldi91c3IvbGliL3BrZ2NvbmZpZy9leHBhdC5wYw0KPiAkIGZpbmQgdG1wL3dvcmsv
eDg2LTY0LXYzLXBva3ktbGludXgvbGlieG1sMi8yLjE1LjMvcGFja2FnZXMtc3BsaXQvIHxncmVw
IFxcLnBjDQo+IHRtcC93b3JrL3g4Ni02NC12My1wb2t5LWxpbnV4L2xpYnhtbDIvMi4xNS4zL3Bh
Y2thZ2VzLXNwbGl0L2xpYnhtbDItZGV2L3Vzci9saWIvcGtnY29uZmlnL2xpYnhtbC0yLjAucGMN
Cj4gDQo+IDUuIFNvIHRoZSBuZXh0IHF1ZXN0aW9uIGlzIHdoeSBpcyBycG0gcGlja2luZyB1cCBv
bmUgYXMgYSBwcm92aWRlcw0KPiBlbnRyeSwgYnV0IG5vdCB0aGUgb3RoZXIuIFRoaXMgaXMgd2hl
cmUgSSBzdG9wcGVkLCBidXQgSSBob3BlIHlvdQ0KPiBTdW1hbnRoIGNhbiB0YWtlIGl0IGZyb20g
aGVyZS4NCj4gDQo+IENoZWVycywNCj4gQWxleA0KDQpIaSBNYXRoaWV1LA0KDQpJIGhhdmUgcmVz
b2x2ZWQgdGhlIHJlcG9ydGVkIGlzc3VlcyBhbmQgc3VjY2Vzc2Z1bGx5IHRlc3RlZCB0aGUgDQpm
b2xsb3dpbmcgdGVzdCBjYXNlcy4NCg0KSWYgeW91IGVuY291bnRlciBhbnkgZmFpbHVyZXMsIHBs
ZWFzZSB2ZXJpZnkgdGhlbSBsb2NhbGx5IGFuZCBwcm92aWRlIA0KZGV0YWlsZWQgcmVwcm9kdWN0
aW9uIHN0ZXBzLg0KDQpGb3IgdmFsaWRhdGlvbiwgSSB1c2VkIHRoZSBmb2xsb3dpbmcgY29uZmln
dXJhdGlvbjoNCg0KYml0YmFrZS1zZXR1cCB3aXRoIHBva3ksIHdpdGhvdXQgc3N0YXRlLCBhbmQg
cWVtdXg4Ng0KYml0YmFrZSBjb3JlLWltYWdlLXNhdG8gLWMgcG9wdWxhdGVfc2RrDQpiaXRiYWtl
IGNvcmUtaW1hZ2Utc2F0by1zZGsgLWMgcm9vdGZzDQpvZS1zZWxmdGVzdCAtciBkZWJ1Z2luZm9k
LkRlYnVnaW5mb2QudGVzdF9kZWJ1Z2luZm9kX3FlbXUNCg0KQWxleCwgdGhhbmtzIGZvciB0aGUg
cXVpY2sgdmVyaWZpY2F0aW9uIGFuZCBmb3IgcHJvdmlkaW5nIHRoZSANCnJlcHJvZHVjdGlvbiBz
dGVwcy4gVGhleSB3ZXJlIGhlbHBmdWwgaW4gaWRlbnRpZnlpbmcgYW5kIHJlc29sdmluZyB0aGUg
DQppc3N1ZS4NCg0KLS0gDQojIFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGludXgNCg==

