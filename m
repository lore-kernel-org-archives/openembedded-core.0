Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 789FCC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 16:46:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43997.1789145206939132255
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 09:46:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qpm7P53F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3714c97fd3=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmOvq1765708
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 09:46:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=1NBcpBqw0kSt9Zk36sPJhI
	x6QPqlz7r6+/ydJS27Cmg=; b=qpm7P53FVh64csed4OPrRSpeMgxnQXjNCgqbQw
	lXggzqXEsS4wbtFjaoIfjhyaRz1FqPAOIZCepat/lJIYr5SNGbLNa9UpDMz/7bqt
	Bl8vr8orRcNtzpzeD1Jo7ovkq73rKIsXUuqL2CLjGb7DaKSzsHdM1ZM0t2YXE+Qp
	fHKEGdNRRUwnIBOKS5FwsuAV/Uyuk0Dt/2qLp1vRcfpgmJBj2W+TgIBw4i1DSmd1
	g5kf9NPCHTyin3TNqKByVJvdefEuXthsr2L2KHXITO6qVeMD0xLfgrj6Ko3TyS0L
	0VFA38M7eCOPpwKZf4ASm6Ezk0V6S+/zOb2qmnlx/7E09YzQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022077.outbound.protection.outlook.com [40.93.195.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gkcypkqdd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 09:46:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Et+U51UpEcUcOiHa1pRuekT9mkOQDEF/xKx5w1DvTRqKP8qzrrjv3D4EIJG/R84XgVMZCosCIq2PHeyhu6sHoIlJSKc+66jRXJIv1Z6Tk575cVEXKXWEQsITNfPq25z38PVOAZrPrRQnQA8EpY7AM4LWpJCoQhAuqp8/X37Gc/EwdZHZuWG6ErGdbxcfVC0XXBjH7wX/ZSNnQJJdjZWjlaexPF0OCGv9cRaiYY8thrKBey8qhIXQgHSefq+vK4wF7zBZHhNDKomhy7aYlvTQa7By7kffEe4fPBrel3iwf52uyZX3pqBwQEyzX1FPRQDmSNUQevuFqxLMSMWBNgNJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NBcpBqw0kSt9Zk36sPJhIx6QPqlz7r6+/ydJS27Cmg=;
 b=y4GoGVudpKKUuH0oiUKaBpxeV/H3tQJEUIFlvi0EVM6JV+pE81UMeD9H0U2/GQov0RAnzYeCe+6kIihyC0nc7/H02t7jQJVSkw9edvX1c1DyOBEpPhmW6DJJMTKEEb0WZYW7KaMXBjt65Yx537y+NFAl3HQl7eGsUXKiNd1KIzRTScO3lPKyK1EEe07iCflWYFFIPx+RgX++TV0lQQa7p0EkY1q4Y2YwuMD42JEck7Re5kYWqHrpJBp5UBYREyuVNAd/GcZ3cXqhIUsSIG+tveePl66uT73XTN/gKEtY4k+68w6XiTYp6JYCiUAOQ7+qZvgm8Bvtm0xJvjL+cgT9GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6)
 by SAWPR11MB9733.namprd11.prod.outlook.com (2603:10b6:806:4ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 16:46:43 +0000
Received: from IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53]) by IA0PR11MB7910.namprd11.prod.outlook.com
 ([fe80::b63b:e9f8:611f:ea53%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 16:46:43 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Khem Raj <raj.khem@gmail.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>
Subject: Re: [OE-core] [PATCH] clang/llvm: Upgrade to 23.1.1 release
Thread-Topic: [OE-core] [PATCH] clang/llvm: Upgrade to 23.1.1 release
Thread-Index: AQHdQeQXVJrrVf+PZkytvYqAwAL2OrbJc2gAgAACnYCAACBygA==
Date: Fri, 11 Sep 2026 16:46:43 +0000
Message-ID: <aaf49485-bab4-4dab-85fd-d333a8fe2f3d@windriver.com>
References: <20260911115237.1538030-1-sunilkumar.dora@windriver.com>
 <57b22a197440f052d86c5199f694d008e811db2c.camel@linuxfoundation.org>
 <CAMKF1soqVQ7y8nOcJydco1YohTK+gv-4pFe1_Dand0cx-2E3Jg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soqVQ7y8nOcJydco1YohTK+gv-4pFe1_Dand0cx-2E3Jg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7910:EE_|SAWPR11MB9733:EE_
x-ms-office365-filtering-correlation-id: db70f2eb-439c-4c7f-d491-08df102442d9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|13003099007|38070700021|10067099003|4143699003|56012099006|11063799006|8096899003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 TK13pfTy2wM/RxAfH/ayY6fWGbqOozH+t8py4SjOqAPn1Lf4AYjMNjmGMHb9ix2PHzUkIo35jXrU9ApDVMDjTGnvB0XfHu6wavNDKFLj2sl7RSNJaeYa08hmprB67siRn05iRpyMvYzuVMPBF8Vq97SVXpyTGsY4r2hxOHuGFlywbISS1bAHfkNLnUn3jFjm+NpUXB48iuOfRxqns3IWFxp2niLsMmBNdjRbs8q1VKfEx098GfBtAzOfFq/79z8N0fCn0QoQHLq1Jfxuydc48bCqZ9rpMTGxf9GcLRV/CnV18yk7092YClxo/IrwpzdZ/P0WyPONCp+xekefufhXtAITDaTqLjcf/dUR7h6Nnl5SyyFZEjBWf44k4mSMoC5hvgioumYLFBHq2MbPK96A1XFwusliaB3Ff+0LwzGVe0FKhfcv8+CQTXXhdnaJZgsvP8iyWgKHO0zsfVWDj9roeMviHtfk4uR2zCEC6//+lRU0UxlWCaL+oUz4Q0rfDKluEGUKw+bzRCYLAPA9eRAFe60gbPumw3SJUVcNJMEGfl5BCA3+Hl8WMSzllO4sLoyu8Bwl9pzALLIfmjPKBdLWn1tVe7uTQtn6md2ulvwkwig+YUadQNe8svH5K5VLU4n8VBjkEyC0YCDHN/D1NoEXrtQm15Mz3gGDpfu8OfTYrrk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7910.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(13003099007)(38070700021)(10067099003)(4143699003)(56012099006)(11063799006)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Nkd6c2wvNEdiSzY1MXpYZzNlM1FmOTBQa21pSzc4a1BKZ2pvZXNIRUJ1bWl1?=
 =?utf-8?B?L213U1hJa0V3Vm9HQmVGanlsTkNFenZ3clJIakgreFVXTGR1bXpuM3g5cC8w?=
 =?utf-8?B?MHVERlp6TDFEeXI0NWNMNllSeENTbFJ3ZHJtbmdlZm85TDM4aUlJVUYvbkZD?=
 =?utf-8?B?ajhCUXRCUnZ4ZmIxRG1KV3VnM2R2bktVMVFZbEhSeG1kYW1mTHVrTHU0UjIx?=
 =?utf-8?B?QzM1VkFqVm9XQnF2Rk83T2hJYVgxS2c2OW9XeElOWWN2S1J4eDJzNHBpWjJt?=
 =?utf-8?B?M2hpUXhSNWtNWXh5UGRMTlVybktMYks1VjYwWm03dDZkalRtbk1HbUhvQjZ6?=
 =?utf-8?B?a2F1ODRCMkNRL2dTcU4wc29UNWdzdDZGd1IxYXFiQk9KSVNJdXE4R094S3NV?=
 =?utf-8?B?dXV6aWV1UzJHS3BkTVNKMERQZURNTTFiTFlxdGVnSWNseDg1TUtxRFlGMzJL?=
 =?utf-8?B?MmsrNDBPRmh6QngzZzJpbnZGeU1KZHRMMGJPUmd4dDdLanlPOUJqRWhYdHFv?=
 =?utf-8?B?eXZ0aW5GVzMzSzVSNFYxVWJOZ0tCSFRyemtoYmJPUTVrNkhlNm1TMmdJTWEz?=
 =?utf-8?B?ZDVLQURFSTlWVmVBMklSVzVTK0gramlPMytRMm90QjN1azJpaUhTaVNGVmZ6?=
 =?utf-8?B?aGpRVExWMU5BRGRJNGdIa1AwNVBRSEZlMFRkL1lBSyt4a2o0bWpJa2dDK1la?=
 =?utf-8?B?MDRzTFpQNVNKNTBHZXlHakNqQzN1Zm85OGNuSWR6dzQzdDM3ODlKTGlaOWFE?=
 =?utf-8?B?S1AzTmRqOUptZE5kSWFVQXN0R1Y0eEJrcEVCVnh2aFVDS1UxTXR1eHhPTGdz?=
 =?utf-8?B?dm9FdkhROExvSDJnZjI5bjE4QlU3Sk5LQVdDU2lsZ3UrbjhnMmlDMDlqcXdr?=
 =?utf-8?B?UTBENmVzUkFFa3NsemtxcHdvU2NsMmFuc1FmWlYxUXhLY0IwNjRZcSswSG9n?=
 =?utf-8?B?MkhWUnhoaWZFdVhKM1YyYW82cHJSWnNsUzUyWXcyRDVVenFDakJRdGJ2ZkxF?=
 =?utf-8?B?SnpCbkRkYUl6Sm40RmxVRWxsQ1h2dWVXUmd3R3ZyTzhnUWROZlc1aGNVdXpT?=
 =?utf-8?B?YkNYbzh1K1o2WlFqZWJzSGc3SXFlS0ZEb2Nqekd6VUlhNEcrczZjMHpacmI3?=
 =?utf-8?B?bjE4TnZvcTBGSWs0OG9XbEYvZzh5a1V6dWlGcmhnSnZoVkpERlcwOXlOQmFJ?=
 =?utf-8?B?MUtIVGYwc2dlTW56ZXFTUmtuTWlkc2ZaSm9ET055WTVCdkJoTUpKMUtPRER0?=
 =?utf-8?B?b05QMVBpQTRMMEJyMnpHVlhBQWptckRvcmRTeGNNR243SDFkKzRMUE0wRkxV?=
 =?utf-8?B?Zno3VHZadFMwLzdVUVJKYjBaRXdnM1A4NGE3aU1IQzFNOThCcjVYcnJITjJB?=
 =?utf-8?B?MVptMFYvdjY3UUVSckhaUHFmbXBSeTd4VmcrbXFEeGZLeG90US9LcEpnQ3FE?=
 =?utf-8?B?TmxxdFJhaEIrcWUyQ1JIc05xbUE2SkkrM0FMQWZBZWgzeEJVcEM2MXpqdHZG?=
 =?utf-8?B?dmlYYWtwWld6amlTejFkckhRSnNUUTRiaWtDOGs2WVlRcU9WWUNySklVVytl?=
 =?utf-8?B?NUdqVXplM2JCRTQxcnlwUnQwOTZCWTJIZmIxbE55TjgrNVp0dnVVZnZlSjlP?=
 =?utf-8?B?eEdjU2pDNEU4dVhkQjJBUGU3ZG5WZEtjbWFGVm9hV25qZlZJemg1UkdBY2dZ?=
 =?utf-8?B?NEozN0NzN3FOM095bkhvV3RqanpmZ0NNaDg3eXZ4OW00SS9Yb281MlNGUFhX?=
 =?utf-8?B?UFoxcnJUckkxck9sK3FmaDdEV0ZaOTRORkN6WExyV0loWnhOZnFpYnNraFc2?=
 =?utf-8?B?RmZPUUdibFhMdVZ4TTZhNlc4b2Z3RmxXekR2WVdsLzA1TngxT2JkV29tbGR0?=
 =?utf-8?B?amRkNWx2TW5LQ2tNSDZFdVFXZXpTcHRzd0ZmY0k1dEhQcXVtZm5nUVB1MWJs?=
 =?utf-8?B?TmtKTmNoUG5IbVExc3ROMHBhWUoxUkU3M2pMVmh6MklkR3hFVDkwNWJkekRK?=
 =?utf-8?B?QW8xK2VlbEgvVE02TDNQYlZWT09ObUF0OG1ORXRuT2wvcEdqWklTM0FBbUpE?=
 =?utf-8?B?RjJWalNyb0xRWGZiMXNuWUxyVmJjTVRlRDNrdk8vdjZpYVhBVk5EYTl1Ukho?=
 =?utf-8?B?aCtCZEhPcXkvd0pGZUV4bDNpd3pFU2ZtV0FPTnB3VUxjQnMxTFRFdC9VM3dU?=
 =?utf-8?B?MVgxR2h5M0tyZi9xVEErTEZrUjlzYWdXTmJtUHRFNXk0SE9JZUltK2piaEJx?=
 =?utf-8?B?YVdnODNwS05tWDFldDNWWW5EdDNiNU1qa0FGMXd1ZmpqTjZOOE9Rbm9IUXcw?=
 =?utf-8?B?Z1ZjVFQwLzVDam5vbkNFYzgvNzJ3VzB0RzA1aUF0dEhYY3JsMEwvTWdZS3hV?=
 =?utf-8?Q?c254GOQAqosuAPqs=3D?=
Content-Type: multipart/alternative;
	boundary="_000_aaf49485bab44dab85fdd333a8fe2f3dwindrivercom_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	lip/avcYLHjVg+ZdHWvFReuQd4fKD15t7p6zSfdYi/tnbZxIWxf/t8niE2j7nIuhqK7ohB1V+aPC/XIYJicUXq9k4NL/hK4g6jbtLs4761CP8waBc/fcoV0dC/wmkrhdhExn4Fnu/J+BvPRil2lt5G+rq+dfHvXECXQ5YIdmwpbv4YkQe1zx9PT9OKl4+SGGuVB8Nb4zWg+aVkPk0BM+2RhhorV7MvA7aecaZJ/JWDbS1o762bS/CRIzNkLHRRKAc6kWFFqniLwqUL3N9/PwrMY3pFu0rY0E8WAKbQxruoRu5RxcCZGR+a42aGC/a86Bdu8izkcWMTv9gify25Vx9Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7910.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db70f2eb-439c-4c7f-d491-08df102442d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 16:46:43.6012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0lw44isnBW5iNx2NyltD0YO6Q56aQqK2CMTU55z7SH4d+qRjCqdB0P7XjwW/3FdMuQBH0EmZCV/eQX5rcXeEYEAcyVsFYIqHnkw0Eannd24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9733
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX8Q9uq2Py0A6N
 3nLEqk8YqQD/BQCfvvT59Sv/q4quaWg6Vv8Byg4RwxnGTZmd6zWMIcoGfPtv7CiT7BgKoNMg9Gs
 6mi2co2PBNuc3s0ZUiVibas3s4g0EmyUpNcbnqN0gJ9p/ZIQ7nNzKgGl1Mh6rL2aLhbPskjcK3c
 K2uk2ETEpUtzFdushrepkVumMEKEbjKdiZwouMA5zNOFWcXzq9J0Om2w85g+mZSa7RdRPI0VevP
 WX1PZ45UUlPosMbbAFXdFnf7MTuTczBfpmZeHuH5pn03SZkOj5s01h5DNdAKG92t8sYouw6QDTW
 PgE0r7UllENMG1FMZQ30Huu/7J7KIA3GwB3WElF29NCsvSY1CGzxCtQ+t3IHHDiiHRPND6GcQB2
 1x/fdWTGYd6mR7qE3Zuq0HhV4D5B3H+erpdkaJqg9YvIG8kE2SjRZ+te51PgQ87e+Uu+2WMub/l
 NfbJWLRSq2PBG2jj+hQ==
X-Proofpoint-ORIG-GUID: hX8uM9uncByRgM1Fg4pU_voG8ka68IVc
X-Proofpoint-GUID: ehkR_T_71YSDfImSsfift0u25ws_nzzt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX53qQSYpUM30K
 fqi0Q5XjtXayPjZ8YNDdcAt1YOkIE6vQg19UtZ3/7yrTP5AnCOOQHADD1NioYX+nmEY/QaoA6Wn
 cye5oCfMI+nDCvyR5maiKmrIIE37J27RihYzx7X1blp8DHPwZvWm
X-Authority-Analysis: v=2.4 cv=II+XmQvG c=1 sm=1 tr=0 ts=6aa43076 cx=c_pps
 a=OiwLqmPPcnjRNzFLBENeNQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=ag1SF4gXAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Twlkf-z8AAAA:8
 a=wvPkM9v7g1_ikmSEda4A:9 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=CZMavFSlSX1dM8Lt:21 a=_W_S_7VecoQA:10 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=-74SuR6ZdpOK_LpdRCUo:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 16:46:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245662

--_000_aaf49485bab44dab85fdd333a8fe2f3dwindrivercom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gOS8xMS8yMDI2IDg6MjAgUE0sIEtoZW0gUmFqIHdyb3RlOg0KQ0FVVElPTjogVGhpcyBlbWFp
bCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCENCkRvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5k
ZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCg0KDQpPbiBGcmksIFNlcCAxMSwgMjAy
NiBhdCA3OjQx4oCvQU0gUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc8bWFpbHRvOnJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+PiB3cm90
ZToNCk9uIEZyaSwgMjAyNi0wOS0xMSBhdCAxNzoyMiArMDUzMCwgRG9yYSwgU3VuaWwgS3VtYXIg
dmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnX187ISFBanZlWWR3OEV2USFhUUNpajNWMkJMbFB2
TkNkdmNvcHFRSUw0REp5OFhEWXFBVkpVbDZ3QjlKQnJ5MTUtVjJ2TXdOcDVUelFfQnp4QmxuNkFl
SkNJVXg1UDZfcU9pbU1TM28kPiB3cm90ZToNCj4gRnJvbTogU3VuaWwgRG9yYSA8c3VuaWxrdW1h
ci5kb3JhQHdpbmRyaXZlci5jb208bWFpbHRvOnN1bmlsa3VtYXIuZG9yYUB3aW5kcml2ZXIuY29t
Pj4NCj4NCj4gaHR0cHM6Ly9kaXNjb3Vyc2UubGx2bS5vcmcvdC9sbHZtLTIzLTEtMS1yZWxlYXNl
ZC85MTc2MDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9kaXNjb3Vyc2UubGx2
bS5vcmcvdC9sbHZtLTIzLTEtMS1yZWxlYXNlZC85MTc2MF9fOyEhQWp2ZVlkdzhFdlEhYVFDaWoz
VjJCTGxQdk5DZHZjb3BxUUlMNERKeThYRFlxQVZKVWw2d0I5SkJyeTE1LVYydk13TnA1VHpRX0J6
eEJsbjZBZUpDSVV4NVA2X3FEVFcyMnZrJD4NCj4NCj4gRHJvcCAwMDM1LWxpYmMtRGlzYWJsZS1m
bG9hdDE2LW9uLTMyLWJpdC14ODYtd2l0aG91dC1TU0UyLnBhdGNoIGFuZA0KPiBtYXJrIHRoZSBt
dXNsIHNzcF9ub25zaGFyZWQgZHJpdmVyIHBhdGNoIGFzIGEgYmFja3BvcnQ6IGJvdGggZml4ZXMN
Cj4gYXJlIGluY2x1ZGVkIGluIHRoaXMgcmVsZWFzZS4NCg0KU29ycnksIEkgZG9uJ3QgcXVpdGUg
Zm9sbG93LiBXaHkgYXJlIHdlIG1hcmtpbmcgaXQgYXMgYSBiYWNrcG9ydCBpZiBpdA0KaXMgaW5j
bHVkZWQgaW4gdGhlIHJlbGVhc2U/DQoNCkdvb2QgcG9pbnQsIEkgdGhvdWdodCBiYWNrcG9ydCB0
byAyMyByZWxlYXNlIGJyYW5jaCB3YXMgYWZ0ZXIgdGhlIDIzLjEuMSByZWxlYXNlIHRhZyB3YXMg
bWFkZSBidXQgaXQNCmlzIGluY2x1ZGVkIGluIHRhZyBzbyBJIHdvbmRlciBpZiByZWxlYXNlIHRh
cmJhbGxzIGRvIG5vdCBoYXZlIGl0ID8NCk15IG1pc3Rha2UsIHRoaXMgb25lIHNob3VsZCBoYXZl
IGJlZW4gZHJvcHBlZCBhcyB3ZWxsLiBUaGUgZml4IGlzIGFscmVhZHkgaW4gdGhlIDIzLjEuMSB0
YXJiYWxsLA0KR251LmNwcCBoYXMgaXQgYW5kIHRoZSBuZXcgdGVzdCBjbGFuZy90ZXN0L0RyaXZl
ci9saW51eC1tdXNsLXNzcC5jIGlzIGFsc28gdGhlcmUuDQpPdXIgcGF0Y2ggd2FzIHN0aWxsIGFw
cGx5aW5nIGJlY2F1c2UgaXQgYWRkcyAtbHNzcF9ub25zaGFyZWQgYXQgYSBkaWZmZXJlbnQgcGxh
Y2UgaW4gdGhlIGxpbmsgbGluZSwNCnNvIHdlIHdlcmUgbGlua2luZyBpdCB0d2ljZS4NCg0KSSB0
ZXN0ZWQgd2l0aCB0aGUgbXVzbCBjcm9zcyBjbGFuZyB3aXRob3V0IDAwMDQsIC1mc3RhY2stcHJv
dGVjdG9yLXN0cm9uZyBzdGlsbCBhZGRzIC1sc3NwX25vbnNoYXJlZCBhbmQNCi1mbm8tc3RhY2st
cHJvdGVjdG9yIGRvZXMgbm90LiBXaWxsIHNlbmQgdjIgd2l0aCAwMDA0IGRyb3BwZWQgdG9vLg0K
DQpUaGFua3MsDQpTdW5pbA0KDQoNCg0KQ2hlZXJzLA0KDQpSaWNoYXJkDQoNCg==

--_000_aaf49485bab44dab85fdd333a8fe2f3dwindrivercom_
Content-Type: text/html; charset="utf-8"
Content-ID: <8C3BC8BF80A4FF4D86F46BE2DB5BAB3E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbD4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVpdj0iQ29udGVu
dC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPC9oZWFkPg0KPGJv
ZHk+DQo8ZGl2IGNsYXNzPSJtb3otY2l0ZS1wcmVmaXgiPk9uIDkvMTEvMjAyNiA4OjIwIFBNLCBL
aGVtIFJhaiB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiIGNpdGU9
Im1pZDpDQU1LRjFzb3FWUTd5OG5PY0p5ZGNvMVlvaFRLK2d2LTRwRmUxX0RhbmQwY3gtMkUzSmdA
bWFpbC5nbWFpbC5jb20iPg0KPHN0cm9uZz48L3N0cm9uZz4NCjxkaXYgc3R5bGU9ImJvcmRlcjpz
b2xpZCAjOWM2NTAwIDFwdDtwYWRkaW5nOjJwdDtiYWNrZ3JvdW5kOiNmY2ZjMDMiPjxzdHJvbmc+
PGNsYXNzPSJtc29ub3JtYWwiIHN0eWxlPSJsaW5lLWhlaWdodDoxMXB0Ij48c3BhbiBzdHlsZT0i
Zm9udC1zaXplOjExcHQ7Y29sb3I6IzAwMCI+Q0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9t
IGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3VudCE8L3NwYW4+PC9jbGFzcz0ibXNvbm9ybWFs
Ij48L3N0cm9uZz48YnI+DQo8Y2xhc3M9Im1zb25vcm1hbCIgc3R5bGU9ImxpbmUtaGVpZ2h0OjEw
cHQzIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjEwcHQ7Y29sb3I6IzAwMCI+RG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSByZWNvZ25pemUgdGhlIHNlbmRl
ciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLjwvc3Bhbj48YnI+DQo8L2NsYXNzPSJtc29u
b3JtYWwiPjwvZGl2Pg0KPGRpdj4NCjxkaXYgZGlyPSJsdHIiPg0KPGRpdiBkaXI9Imx0ciI+PGJy
Pg0KPC9kaXY+DQo8YnI+DQo8ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBnbWFpbF9xdW90ZV9jb250
YWluZXIiPg0KPGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwgU2VwIDEx
LCAyMDI2IGF0IDc6NDHigK9BTSBSaWNoYXJkIFB1cmRpZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOnJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmciIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSIg
Y2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCI+cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0
aW9uLm9yZzwvYT4mZ3Q7IHdyb3RlOjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KT24gRnJpLCAyMDI2
LTA5LTExIGF0IDE3OjIyICswNTMwLCBEb3JhLCBTdW5pbCBLdW1hciB2aWEgPGEgaHJlZj0iaHR0
cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnX187
ISFBanZlWWR3OEV2USFhUUNpajNWMkJMbFB2TkNkdmNvcHFRSUw0REp5OFhEWXFBVkpVbDZ3QjlK
QnJ5MTUtVjJ2TXdOcDVUelFfQnp4QmxuNkFlSkNJVXg1UDZfcU9pbU1TM28kIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIiBtb3otZG8tbm90LXNlbmQ9InRydWUiPg0KbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZzwvYT4gd3JvdGU6PGJyPg0KJmd0OyBGcm9tOiBTdW5pbCBEb3JhICZsdDs8
YSBocmVmPSJtYWlsdG86c3VuaWxrdW1hci5kb3JhQHdpbmRyaXZlci5jb20iIHRhcmdldD0iX2Js
YW5rIiBtb3otZG8tbm90LXNlbmQ9InRydWUiIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQi
PnN1bmlsa3VtYXIuZG9yYUB3aW5kcml2ZXIuY29tPC9hPiZndDs8YnI+DQomZ3Q7IDxicj4NCiZn
dDsgPGEgaHJlZj0iaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZGlzY291cnNl
Lmxsdm0ub3JnL3QvbGx2bS0yMy0xLTEtcmVsZWFzZWQvOTE3NjBfXzshIUFqdmVZZHc4RXZRIWFR
Q2lqM1YyQkxsUHZOQ2R2Y29wcVFJTDRESnk4WERZcUFWSlVsNndCOUpCcnkxNS1WMnZNd05wNVR6
UV9CenhCbG42QWVKQ0lVeDVQNl9xRFRXMjJ2ayQiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiIG1vei1kby1ub3Qtc2VuZD0idHJ1ZSI+DQpodHRwczovL2Rpc2NvdXJzZS5sbHZtLm9y
Zy90L2xsdm0tMjMtMS0xLXJlbGVhc2VkLzkxNzYwPC9hPjxicj4NCiZndDsgPGJyPg0KJmd0OyBE
cm9wIDAwMzUtbGliYy1EaXNhYmxlLWZsb2F0MTYtb24tMzItYml0LXg4Ni13aXRob3V0LVNTRTIu
cGF0Y2ggYW5kPGJyPg0KJmd0OyBtYXJrIHRoZSBtdXNsIHNzcF9ub25zaGFyZWQgZHJpdmVyIHBh
dGNoIGFzIGEgYmFja3BvcnQ6IGJvdGggZml4ZXM8YnI+DQomZ3Q7IGFyZSBpbmNsdWRlZCBpbiB0
aGlzIHJlbGVhc2UuPGJyPg0KPGJyPg0KU29ycnksIEkgZG9uJ3QgcXVpdGUgZm9sbG93LiBXaHkg
YXJlIHdlIG1hcmtpbmcgaXQgYXMgYSBiYWNrcG9ydCBpZiBpdDxicj4NCmlzIGluY2x1ZGVkIGlu
IHRoZSByZWxlYXNlPzxicj4NCjwvYmxvY2txdW90ZT4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2
Pkdvb2QgcG9pbnQsIEkgdGhvdWdodCBiYWNrcG9ydCB0byAyMyByZWxlYXNlIGJyYW5jaCB3YXMg
YWZ0ZXIgdGhlIDIzLjEuMSByZWxlYXNlIHRhZyB3YXMgbWFkZSBidXQgaXQ8L2Rpdj4NCjxkaXY+
aXMgaW5jbHVkZWQgaW4gdGFnIHNvIEkgd29uZGVyIGlmIHJlbGVhc2UgdGFyYmFsbHMgZG8gbm90
Jm5ic3A7aGF2ZSBpdCA/PC9kaXY+DQo8L2Rpdj4NCjwvZGl2Pg0KPC9kaXY+DQo8L2Jsb2NrcXVv
dGU+DQpNeSBtaXN0YWtlLCB0aGlzIG9uZSBzaG91bGQgaGF2ZSBiZWVuIGRyb3BwZWQgYXMgd2Vs
bC4gVGhlIGZpeCBpcyBhbHJlYWR5IGluIHRoZSAyMy4xLjEgdGFyYmFsbCwmbmJzcDs8YnI+DQpH
bnUuY3BwIGhhcyBpdCBhbmQgdGhlIG5ldyB0ZXN0IGNsYW5nL3Rlc3QvRHJpdmVyL2xpbnV4LW11
c2wtc3NwLmMgaXMgYWxzbyB0aGVyZS4mbmJzcDs8YnI+DQpPdXIgcGF0Y2ggd2FzIHN0aWxsIGFw
cGx5aW5nIGJlY2F1c2UgaXQgYWRkcyAtbHNzcF9ub25zaGFyZWQgYXQgYSBkaWZmZXJlbnQgcGxh
Y2UgaW4gdGhlIGxpbmsgbGluZSwmbmJzcDs8YnI+DQpzbyB3ZSB3ZXJlIGxpbmtpbmcgaXQgdHdp
Y2UuPGJyPg0KPGJyPg0KSSB0ZXN0ZWQgd2l0aCB0aGUgbXVzbCBjcm9zcyBjbGFuZyB3aXRob3V0
IDAwMDQsIC1mc3RhY2stcHJvdGVjdG9yLXN0cm9uZyBzdGlsbCBhZGRzIC1sc3NwX25vbnNoYXJl
ZCBhbmQmbmJzcDs8YnI+DQotZm5vLXN0YWNrLXByb3RlY3RvciBkb2VzIG5vdC4gV2lsbCBzZW5k
IHYyIHdpdGggMDAwNCBkcm9wcGVkIHRvby48YnI+DQo8YnI+DQpUaGFua3MsPGJyPg0KU3VuaWw8
YnI+DQo8YnI+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBjaXRlPSJtaWQ6Q0FNS0Yxc29xVlE3
eThuT2NKeWRjbzFZb2hUSytndi00cEZlMV9EYW5kMGN4LTJFM0pnQG1haWwuZ21haWwuY29tIj4N
CjxkaXY+DQo8ZGl2IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIGdtYWlsX3F1
b3RlX2NvbnRhaW5lciI+DQo8ZGl2PiZuYnNwOzwvZGl2Pg0KPGJsb2NrcXVvdGUgY2xhc3M9Imdt
YWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFw
eCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KQ2hlZXJz
LDxicj4NCjxicj4NClJpY2hhcmQ8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Rpdj4NCjwvZGl2Pg0K
PC9kaXY+DQo8L2Jsb2NrcXVvdGU+DQo8cD48YnI+DQo8L3A+DQo8L2JvZHk+DQo8L2h0bWw+DQo=

--_000_aaf49485bab44dab85fdd333a8fe2f3dwindrivercom_--

