Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A11C982E1
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 05:06:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41215.1789957532782560009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 19:25:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FUdlGDQl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: wenwfu@qti.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L0kjsU3846721
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=flhucQ5dizfjHJBMWOKJbjE9
	WKlS93vxPH0ShUDlbMM=; b=FUdlGDQljajcxa47YRNHAzGZpjh55JrqkhtRteDq
	1ElHhkAmTOIPyblu3ziAtaBIk0TRZOSIz5/ADBM5HzauHkvPu1rZlC/HHITVrRN2
	jm5uQBXVczu4fVP6VZ5t2iA0vRQPjAQYNQaLFSNIG8k1mNeEmVMYh5wNULTKzlv6
	wa4yNraPe0PuF1iDCSo9laTA+r+HTOSXu5Crj5itr1kR/Da9TkO8EnWVTH4gYKr4
	sYDD8ASWdNTTG5KIMXCqIqDNufOzlrQvyXG+c1/bm64MUwNmfH/7B0NRtFdMqOC7
	jM+QKczhmSKZJMkj3KEvpwgstURKpNh7JISP5t+WPiGHgA==
Received: from dm5pr08cu004.outbound.protection.outlook.com (mail-dm5pr08cu00404.outbound.protection.outlook.com [40.93.13.100])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8b8fdw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 02:08:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jz4mmlvy3GqW0U3190x5tZgsIUL6vqrsLSLuJtx4ayQF4+0q0JeeaApOGLCNVcvpP0eywp90wO/e6WemThqDMT7KuN7VaiVVXWCP+V0r+nxBeBvyZWeHcIbhXwEcfIiYoxV4JLatmSJEfw6n82aHwMKVObVByYUtjkOZ49Q0C+rn61Mk+65XmSwuLXwdDOJlSfI17CZ5wy4EN8F9CIKG9lfZC2+KxPTKTGaczeF4Y7d+AHBFbAg1Xx53ZNnai1CpSLtOi9tjsPSX3XqbllcmfBWCGUOnVjnulpKbYTQCZexIS1qPy22l8/ErK0IfIiyV4LhM++sPbvqlqYs1KKL5iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flhucQ5dizfjHJBMWOKJbjE9WKlS93vxPH0ShUDlbMM=;
 b=nAuRDNElQYO9V6X+O7Te97OXu8c/HkygB2j0YzuW7OaMMLZ6vUuyNrHqvKM/AnhdlLIMeAoub3rEH57F+axHw7Sq/ueof3pq3Ixg8VpvqTRNwBfzn9kCRQvk16yVNF9+Ls8II3i0L/SDFM6aLfCgZAw+9Y8Q40tBYxe5dou0vJ0A/0c1p22nWq6+WK4s2Y0qRg5Vprk6h1WdCi0c0ntEKzaarxAcDfntl01HT+Cgs7ntNxvHkYn+l8qssgyZAWBg6uDJ88SNGarcTkZK6/gvi4XyHiKbEVUzKYjx778DaA79H/gFq467E8WgeDEiJp5Kkc4gJFQcIvrUoREPEUGjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from DS0PR02MB9197.namprd02.prod.outlook.com (2603:10b6:8:13e::9) by
 IA3PPF63EE3DF3E.namprd02.prod.outlook.com (2603:10b6:20f:fc02::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 02:08:36 +0000
Received: from DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8]) by DS0PR02MB9197.namprd02.prod.outlook.com
 ([fe80::d5b6:c39c:5293:54f8%4]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 02:08:36 +0000
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] initramfs-framework: avoid external commands in module loop
Thread-Topic: [PATCH v2 2/2] initramfs-framework: avoid external commands in
 module loop
Thread-Index: AQHdQsRL5JqWamtZB0SYko3M1crdg7bYVmUN
Date: Mon, 21 Sep 2026 02:08:36 +0000
Message-ID: 
 <DS0PR02MB91975499F2D08A8FED84C410EA842@DS0PR02MB9197.namprd02.prod.outlook.com>
References: <20260912143745.3722559-1-wenwfu@qti.qualcomm.com>
In-Reply-To: <20260912143745.3722559-1-wenwfu@qti.qualcomm.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR02MB9197:EE_|IA3PPF63EE3DF3E:EE_
x-ms-office365-filtering-correlation-id: d89e4f9d-b875-4427-89ee-08df17853ec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|3023799007|22082099003|18002099003|11063799006|8096899003|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 1E44BNimd26T5ZwA/ul5yhAACa1LV/GSInIEoX6Mvghp+CAZYz8byMQtPNub5hw5Zvz2fI8XArpcHFAJP//dByPX4E1o/+/znDywkbrEsvxPACwroYdtKg/+0T7NXawkDKrpTnPHTJhDU3yrCwcBVtmvsSKO/w+FXCQ2OOM+ONBidRedoRuZfwIyjdchBYPMb8DLetsvitZbkUVHGNFHLeIqSzZ1I4MtquVXfGMvdv10PhBrAZma80DtXjy77h8ne/8u9A2THxwYYsyEjtn0QXrFzNP0BOcUifSLG84uXb8XF5Utx29EnE7S7RH93N0hmk4opr0EMTQLGWXPrBy4QlMhMslT7rFyqO7P/TeTIvSyaZr0VN2sbZELXg0FPBv1UNitbYwT1AX5WNuO3AM2CJ2+PuwajVS/MIEJFK5uDfA4cDVBxht+IYHN2XQBf/H9n8xD4C7kOEaq+EusQ7cEobujJFDRro8wyfix5fflg+jDt0QoHNDBbTFNvBHoAOnFZQt6wGs3/0ilv46MSCuyhXxwQISA0RbZdtsG9Y1Mezxn81jvwhCcIDXhoAhdYW0XhKRM2xisLdGAkKRu+ACTUFJjpxzbMT3qTNBQ1FvkOP+T6nxqaPDfaQWR3gt7pgV4vJIHhLA4olTvi25ihTif2lUvwVNQzs3orvVjp4n/yUmi3j8q1Q4iSmi+/+hCObeDllvXWU6TVxwkl7XVuN/LLYNjoHWHlEngZCIQ2qPD0og=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR02MB9197.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(8096899003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZGNtUAI+ECmKNbrSJGkBYtGQr+EHmZyHGhmAcwy0H6dTPClHgpC0m140TAoQ?=
 =?us-ascii?Q?D8kkF7jLFmGa1uV2sIrc8XeJ4lpleRMnYrx6xFG9rJCfN1fDI+6OQdloElUO?=
 =?us-ascii?Q?pUVO2jJ333kD0+IrS7ThzXhTNcHjjbDburF6OSnQb37NKu5Hex64miBFYLkv?=
 =?us-ascii?Q?fQzERUiWn2if3wa4OMQUodq6DcBAI+zhyDyhNFDKM5db5yViS7oudqbwcGL4?=
 =?us-ascii?Q?xbiDWbpOhzpVxYyadT95asifRh7bDsENRUqkpY/ZdFmG8wtSxD4EGcYR7XBs?=
 =?us-ascii?Q?6si63Ys6cUAuU1kCQgPMFjQXgMUH4Btw18N2v2kYZ7qS9pl028C2zl1x1asc?=
 =?us-ascii?Q?MOpb6QI0F9DKEsRYH1lR79DIRyhUjNXXg6Ayyehwx5rowZ96H9GIb1z1WOmf?=
 =?us-ascii?Q?aGl6qNwbLkl69Tf/8ss7QUeEYqo+ZvJm1PpB1FpZ1bjJVv+HNA7Sxjz+qzy1?=
 =?us-ascii?Q?2IAFVVM+u6tdbtIUorhva1nS6sBbDsGfXrvnrh+o9z8IVV7ol/dJOWvFDz1o?=
 =?us-ascii?Q?KN9ssy7pCYX+zAFaOsQbQbdxVHnQE0RfcP/p2tRhivjWxbY2UT/ezt6OqCoj?=
 =?us-ascii?Q?y4YM+FLV1knT6qOpH8DZbeWAoP6mrRL6GGWRWpM+gnZsHUuJTP/YKYgCiyu6?=
 =?us-ascii?Q?fm6jdhQL0eMpvBR+eH4igp7N3cIYSD54Ri/m1Ufm6SES7tlaW49GsjC0AeOv?=
 =?us-ascii?Q?OikNfM0XzSRwpqWYrHkCs0qAmSH0gQWfceeR8IyaNbaTM1SBs4PFHIbPNlWj?=
 =?us-ascii?Q?9h2AAFp2HXLWnAQwhrkJec1OBnyucA+wQa2uPZYylF95lUq8fgGo+Ivlfmoi?=
 =?us-ascii?Q?aOCRxiwfdw/G3Zjd4Tb102FYKpk1c/yCEjuW7oQ4Kr96APatYM1/h4tJSZnk?=
 =?us-ascii?Q?hOz1/suMCStALmahLyG80SpyRkCuTAzNxh6g6c1Ia74BT7F6LLhGqDri3/f4?=
 =?us-ascii?Q?Wn/xAfciIIC7dQrrAQ8P/jXk5fnKAGPuT6n3/ALDwI1bTfOAdjUbIdky742E?=
 =?us-ascii?Q?zKIcek3RGHJgIcYWmxAar+SrXyUWPh259KnZDA+epl3uKcIPKOMa9+nIT9Bp?=
 =?us-ascii?Q?jA4A4Nup4XtMa5mg8f3fj+9dhzKxlzMhmXXU2fHNIvLUTpf9RK3Kx/vujrub?=
 =?us-ascii?Q?4qKvX+1fzZSAE8Bc5/DgOAuYqaxOjc3nf9hLlhq6TXijZBgt+LVK/H2sDzQF?=
 =?us-ascii?Q?/IpNXMwkAXcyU6+jKVn6f9O3II+8V5uF9mlBfneekvkDi7t4EVFzbtycR1M8?=
 =?us-ascii?Q?R4BSbHTboPc4clJezjoAkH8o3vAKPSgxExFh5CsKSMTRnrSPX1GRrK1No4C0?=
 =?us-ascii?Q?EfwRGLvOICbOu6srOqFIUQDQm1uRNexN6fKy3tfdWWldqQIOJWyTxETpEJ+a?=
 =?us-ascii?Q?HR6z1N+MW90mkSxpPGqdjf3RoPiSaLnkkc26nUD9Vp7WR0vQDhOxtrvdYyJT?=
 =?us-ascii?Q?/IpTbSHrXAwzUqrpkkGA/qRf1j6uI46iRijaf3e4SUgT9izOWUbnatHJ9xw1?=
 =?us-ascii?Q?bYOjr1scnYfm7mpFIEVH+UGzmF85DZzDsMS6Yd7Gs75w6XjEhXj7zlxf1Onx?=
 =?us-ascii?Q?EvKN6aKa9D6M2PKDcl8A+Mo88NnEC5yESzNx6GpmSvbNkCX5qRb7Ch3bW0dv?=
 =?us-ascii?Q?hn9V1yOlS50jkMxFTU2jq1VWfOQigFlXFL3O7Ns5czgCJF1kNS3w2D5ZgZht?=
 =?us-ascii?Q?mnY2JopDjFB7OpE5HHLnPTZ9uM7u6bXFht41Q8FA2vJG0PghaTOOuVKWFE2Z?=
 =?us-ascii?Q?L26OoNV9Xg=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	lvetAqgliX5eZZG7nT4GLVgwt254oyXwIHTVak+fET//fTv4mB7sAQIiG7gdILdsJvkSy0dCYueWLe8xfXTUKgXCPUwlhxYv7ZTiDwYa8qJnWmhG8co5cIVPhB/Q28ihPGCz7Qh0HLomVIMs6C9xXfDLIiHvH1U1qJyH80rs5h0eVi+aToxdf/byiYh3LA7fK+ahBxxkYuAjyAOPRCXccMSWJ3R3guiIX0/319U68Q10lNCUrsk9tDkP98teTFljMds7uLa/nmun3lzLACBK3nSZ9hPTGaAY7NNyEyss3RTbGw4NvMZJ2WbjdZQRzNmhoxdMgxHmsVRXqXQCR7iz6Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	GlaVOs+huDz4Vfc5X0g9x6Bqyr6HMqXkkO8k01QO+NkiLvB7UlnXLNQmEDrFReKWY8WNgTpSk3XT9VbntyOaSw1y0NQ/1Lu2HDxnDj/XZnW3RxGT41lG3EPHozJ2+4F/5D/ydLaOQ2+7FDvVAuhfi6cPi/MuhkJeVwki3h90FXTjWHvaPEjnBlCMPdNBvbHLD/+5MdqW5gxx6yNXp/VuOKyoelMVCpecfCRy87Jn6J8g7yEbYcre3GnAixW6/XvbU9mVaa53LvDY4mUrRbfeCxbO2y4M3o3Rvb/2BO5uigdis/+zUPVRQSPNViYeXhLbJoP7iQNUBAxfKBvLKEk7SJE7lQ4EPZKVd4W5F2Luomo2Dj0zOdcDOd5K3o35+wgZV5DqFbGWHmb1AI8HTs8+zIo7yH3gWms07gG4ljNbksN1PMktqQxva3iu/pNDvHcV6Vg9BqK1q6WEewVdtjthbWhS1ES2FJClTkxsxnHU9pyYj+2VYrYQ732E3iFw/Co6Lgfp2lUhKpTpEnjh+bOP7LK+6aUidUV/uC6syS2zkV2bfPBDlDbq4cH4G0fSLmlfqkL2AToxJzTLYciLYWsQqQyINUO0D9XbcyQMDtJsAtFmabZvb4N7gFGTy52+RJ5+
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR02MB9197.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d89e4f9d-b875-4427-89ee-08df17853ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 02:08:36.0589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9NOwseXk3ZFsNPNy9/E0i1SfyB8qCZzsBOIuTZAw2O6zq4T4YKQY3rosYoP23B9W1V8mjK9iE/im6CeVw539ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPF63EE3DF3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDAyNyBTYWx0ZWRfX7CRa2WmSUGEr
 +5axYcGD26tFUC36KU+0yIgwnN1u3k2ZDaj/IkjHido73X7r6HRj+tLBivBuyRx1jCba1FpsU5b
 8kCsCqYZPFiC5P7cYcfxe8DvtsZQWYo/UBDGKH9fi2vjwIM5E/Wa2rWRTwuhyEP0XJoHZozIpad
 MuLTWuUXxzeWryiEEwNpXqBRVe3v/syjEnJeoz1iKP0be/vRm5rDx1KqZRSNBfHqwqjPEctpktc
 pTlA+Y9atpwi1xJRPfpoCIOJQPROUK8zthFt/TTHNqO8GcBHEeOMtg3YLTHJemP8oT0oCvtTRaE
 YypmFde5QLpP20hyMFN2uk9U7C4DMW3XWfjlsqScBLtWlgIRiUqcPutOX+UkrvQmpxXAVfv6JCx
 34+TVx6SUQgEXDP6L0cqfIkKpm9COkJvIK8GRif5MV+H8i7d4fx8oLDIX0rEl0l/8jOlJF1CJWt
 wNqImOZ6nC9tCJvAnJw==
X-Proofpoint-GUID: E2SjdZtdaCv99-OhtR0_jHzSsAK9mcOl
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab091a6 cx=c_pps
 a=Gc3eVlh9LBNMAeWdk3HO5w==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Q4-j1AaZAAAA:8 a=VuaMhupxiODCAaIFQmkA:9 a=CjuIK1q_8ugA:10
 a=aduz-61a7DTRFhm27gsA:9 a=g-MyE3wd9NvrKRMs:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: E2SjdZtdaCv99-OhtR0_jHzSsAK9mcOl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDAyNyBTYWx0ZWRfX0QCy5As02Ypp
 5yviWWVr22GhzjUHAgbOUBoiu/Q+oevJXHEKOxG2V5d1Z8S84pwsPeXJc3Jpkae3Tt5auN4K6rf
 yoXhgybkijYm/o6RwiAe9ngeXYjRiKU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210027
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DS0PR02MB91975499F2D08A8FED84C410EA842DS0PR02MB9197namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 05:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246274

--_000_DS0PR02MB91975499F2D08A8FED84C410EA842DS0PR02MB9197namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Gentle ping on this v2 patch series.

 Could someone please take a look when you have a chance?
 Thanks,
 Wenwen


________________________________
From: Wenwen Fu <wenwfu@qti.qualcomm.com>
Sent: Saturday, September 12, 2026 22:37
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Wenwen Fu <wenwfu@qti.qualcomm.com>
Subject: [PATCH v2 2/2] initramfs-framework: avoid external commands in mod=
ule loop

Use shell pattern matching and parameter expansion to skip backup
modules and derive module names without invoking sed, basename, or cut
during initramfs module loading.

On QEMU, backup filtering decreased from 104.529 ms to 3.731 ms,
and module name parsing decreased from 115.657 ms to 4.071 ms.
Together, these stages decreased from 220.186 ms to 7.802 ms.

Tested with dash and BusyBox sh syntax checks and QEMU.

AI-Generated: OpenAI Codex
Signed-off-by: Wenwen Fu <wenwfu@qti.qualcomm.com>
---
 .../initrdscripts/initramfs-framework/init           | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/met=
a/recipes-core/initrdscripts/initramfs-framework/init
index e560d25d53..e2da3511b8 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init
@@ -152,11 +152,15 @@ mkdir $ROOTFS_DIR
 # Load and run modules
 for m in $MODULES_DIR/*; do
         # Skip backup files
-       if [ "`echo $m | sed -e 's/\~$//'`" !=3D "$m" ]; then
-               continue
-       fi
+       case "$m" in
+               *~)
+                       continue
+                       ;;
+       esac

-       module=3D`basename $m | cut -d'-' -f 2`
+       module=3D${m##*/}
+       module=3D${module#*-}
+       module=3D${module%%-*}
         debug "Loading module $module"

         # pre hooks
--
2.43.0


--_000_DS0PR02MB91975499F2D08A8FED84C410EA842DS0PR02MB9197namp_
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
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
Hi,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; background-color: rgb(255, 255, 255); margin: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: black;">
</div>
<pre class=3D"elementToProof"><div class=3D"elementToProof"><div class=3D"e=
lementToProof" style=3D"white-space: pre; font-family: Aptos, Aptos_Embedde=
dFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt=
; color: black;">Gentle ping on this v2 patch series.</div></div></pre>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
&nbsp;Could someone please take a look when you have a chance?&nbsp;</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
white-space: pre-wrap; background-color: rgb(255, 255, 255); margin: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: black;">
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
&nbsp;Thanks, &nbsp;</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
background-color: rgb(255, 255, 255); margin: 0px; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-s=
ize: 12pt; color: black;">
&nbsp;Wenwen&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
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
<b>Sent:</b> Saturday, September 12, 2026 22:37<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
<b>Subject:</b> [PATCH v2 2/2] initramfs-framework: avoid external commands=
 in module loop</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Use shell pattern matching and parameter expansion=
 to skip backup<br>
modules and derive module names without invoking sed, basename, or cut<br>
during initramfs module loading.<br>
<br>
On QEMU, backup filtering decreased from 104.529 ms to 3.731 ms,<br>
and module name parsing decreased from 115.657 ms to 4.071 ms.<br>
Together, these stages decreased from 220.186 ms to 7.802 ms.<br>
<br>
Tested with dash and BusyBox sh syntax checks and QEMU.<br>
<br>
AI-Generated: OpenAI Codex<br>
Signed-off-by: Wenwen Fu &lt;wenwfu@qti.qualcomm.com&gt;<br>
---<br>
&nbsp;.../initrdscripts/initramfs-framework/init&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 12 ++++++++----<br>
&nbsp;1 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/init b/met=
a/recipes-core/initrdscripts/initramfs-framework/init<br>
index e560d25d53..e2da3511b8 100755<br>
--- a/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/init<br>
@@ -152,11 +152,15 @@ mkdir $ROOTFS_DIR<br>
&nbsp;# Load and run modules<br>
&nbsp;for m in $MODULES_DIR/*; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Skip backup files<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ &quot;`echo $m | sed -e 's/\~$//=
'`&quot; !=3D &quot;$m&quot; ]; then<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; continue<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case &quot;$m&quot; in<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *~)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ;;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; esac<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module=3D`basename $m | cut -d'-' -f =
2`<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module=3D${m##*/}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module=3D${module#*-}<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; module=3D${module%%-*}<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; debug &quot;Loading module=
 $module&quot;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # pre hooks<br>
-- <br>
2.43.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_DS0PR02MB91975499F2D08A8FED84C410EA842DS0PR02MB9197namp_--

