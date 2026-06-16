Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 750F4CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 13:12:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154101.1781615532209940119
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 06:12:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pOA6bxs6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=062783b9fa=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9VD33279923
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 06:12:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:message-id:mime-version:subject:to;
	 s=PPS06212021; bh=Of9YLN4gKifAFqcRIXdYKo/refRQAIpV/MiyPSzusUk=; b=
	pOA6bxs6iPPO9pveYZwUBxec55uogfrm0ZN5gJZICGBo3/46oV/dsHUrIdogLpbs
	wOIwEglM0ITycnnVMWRYYNUT1CsLqzCJE1nUyOnXPo6bo/b/dmkaCTXJt6WDMUPO
	wSLpAQhqC20gtEgqqi/fx03zRt8Nv1h71KnlnSHjQzSEoZ7W++/N+iuqICAgYHVe
	S+08G7+AYxFmMJFqPM4UsU6pskc+exOg0vnCAyb0E3gXBJp5AToJIbd3FK+fVosG
	aKv8DJEKKkbLVWGQJQLHQjuXdkEAovgO2x7WG6193uKeKTEQuH7MqVaN3ypGVXiq
	YHIQo25JNULgVg/Vlw0XDw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012037.outbound.protection.outlook.com [40.107.200.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0cg36-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 06:12:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e+RHnSSPW9YIGaotmrkQSs0tJ93UmNRmbGWP10yXY9H/jjRoHWe9LRVJXSVtLoUWM7px3iPhcZoq7TU9/ACjS2w7OFls9gIt/owx6pdwXdkoDPXSq8njdJqk1smstPmq8+PNCUIhFHeEd+p3sgt6WEEROAXLOo9rvjHbvmUZOMx3rtm/VeIAnLumEGRO0++nTMP9G9pA8G9BTuwIH0/iywjE69pyT/OyBL2JGs2xYk58OenMNEsFlvbN5RBeHYJja7nt5Y4nB+6uQna6Zmn59sjhj9im+owCpx8j03RZjhvjP11V+kfQW1D/qKpmyYOjaTV4/X2QBl1vGZyEYDTREg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Of9YLN4gKifAFqcRIXdYKo/refRQAIpV/MiyPSzusUk=;
 b=Mm+YMV/i0IDiItyneEyxRBJNIZ+wb3tNwpESSdxSMFqeOM5rG7GghOSPrDopxItxUHPckMyTMSSr8jd7G5qwsE0JwkuqtgXW8L38orcZigszsfCdzGWJ+kdXY1GHYDPK8u3Xm18KM/Pzl6v43EflEjWQ1tnguhK79KVOzkYrKAV4B13o3vTUlMamSo04so+OhiujYwhA6SNrTeaTdEx+gYIb4i61lWYL9dsQPybayrQm6353Tp27dPo9MM63rWrKU0jMRGbEXEUNuUuM7CxmO+8dcSmBAlTP8PBPLPBZoSAvseh/nQ7+zOCkFwpp3sYOpT2EYMw4KBxB+OHeldjPVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 CY5PR11MB6416.namprd11.prod.outlook.com (2603:10b6:930:34::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 13:12:05 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0113.013; Tue, 16 Jun 2026
 13:12:05 +0000
From: "Dora, Sunil Kumar" <SunilKumar.Dora@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
CC: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Sadineni, Harish"
	<Harish.Sadineni@windriver.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "peter.marko@siemens.com"
	<peter.marko@siemens.com>
Subject: binutils: disposition for XCOFF CVEs 2026-3441/3442/6846
Thread-Topic: binutils: disposition for XCOFF CVEs 2026-3441/3442/6846
Thread-Index: AQHc/Y21YRPWZ5RQekCpwTxeQoJsvA==
Date: Tue, 16 Jun 2026 13:12:05 +0000
Message-ID: 
 <DS0PR11MB7901A65C83AEBB08626B2B23E0E52@DS0PR11MB7901.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-06-16T13:12:02.865Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7901:EE_|CY5PR11MB6416:EE_
x-ms-office365-filtering-correlation-id: 0f79c8ec-aeeb-48ca-a405-08decba8dd00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|8096899003|13003099007|38070700021|18002099003|11063799006|56012099006|6133799003;
x-microsoft-antispam-message-info: 
 S4O35HDiBtY7IOv16QDnQgYUyW9iZPDVjqkiB3PPzCF2yOAQoxb/rRrrOTOYjUnn77ejkkP3xHERZj78cNPX8LZCdqtgHdVwhKa4bSrRHl/7oVdEwgTnKsGALkcI9Sld48GlbOYxng0DTREPXO++E31fO3tg1RUYk1AGbodSGtjZYQdNlz1UHyRs/p4YD2EqV89vTUQaQZoSNVWdy4sW4f0jKdHl//bnc+ZL8JG8L6xCCH2JkiSua/jscnP7TjAdA5iflm117VanSpx/w00giKZdVrgbneG8CLaRsD8MdLNq7wNwxoaJGk0NvCfx4XB/7L/yBKMXLC0AXjlLKh0+Qkt1S+Op3JcHfnZgAXujRVOw0MUJZttBtFLJ6RvXWHRF/QUBYvMWzmfke4CbqVGt5JnjMY/Hg4v8ArRhH3TKnxUeed+Kvygz68EWi+2k5mu78U6yzyMgAYJ/eVNFSUoTIDKfSlZ7DjAQ0ko/Cq54n24I0zB6drzZtzh0hkwaOu0dB6OkeLJlKt8X8iH9TsPmBzDFBpJyCHEm5jPNI2ltYs7YMvwvdwSAEs/qFVdDATT3yxEmufDppzU2X9a2pVrwG+kYNtrWuCedr7t6KxBQQDWJwkUPvE32NGfiHI6WvKIZeB8K5gIcrUxoBU5MgiWAg9qMBcmIc59mzFi1CYZ6+3ZL7GgNZyqftxwtPFZqE0hvUyEyS8aAjP+Ht/QtpABCZx8As56Gz4+96DTKMJPQsv2vWU+ADq6CS4W5DbdNBn5N
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(8096899003)(13003099007)(38070700021)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?NblF3C5JCzr9S3RV5KarVjSBcUTVqVCCgNqMVFxn9MMu7c3crqgzoCe1?=
 =?Windows-1252?Q?Wmp6+81b5/PPedNGKZ8+TrmioiOu4eKAkNBTq3o/92OmwMcXd1bCqBEC?=
 =?Windows-1252?Q?ryAZfeWU5Z1vrSzSDLTurkE0K9YQaGPWUj3tjHjmaJ9Ed8rM90btAoRt?=
 =?Windows-1252?Q?bW7La9CCN4tXagPru6yYdWkNlDoeAe9+y6eDNmvsTRsu0YUYOKPGTCXs?=
 =?Windows-1252?Q?g5Du2p584GzGEXYXeU2WAejGLr5h0gGqNrpO0TEejhx2lE7744HnVB3Q?=
 =?Windows-1252?Q?byy0GMzEF22RjR2RHNLln8v8HM9AnZyoPdLHfv/9xl26+ct2fTuk1j3V?=
 =?Windows-1252?Q?phQO78Xjm25kdc+m5LEGSgmoOhqpMfYjMNXZB07mn6yjG0ZhD+xrqOGE?=
 =?Windows-1252?Q?VdfQ+VAAtKna+k5ex/YnLB/YG1oP3HP8I+jUpKmOEJaGHQCKAdWNMYl1?=
 =?Windows-1252?Q?fCII7yw6IY+FcktRQf9FNVLLFTaCf+TpNCUbZ7aYCBPpxNA7lbCvp163?=
 =?Windows-1252?Q?ky9BmgwFhInxrliDjwcwma22lh1/AsetHMWSHY1WutL7MiypUljpL5SR?=
 =?Windows-1252?Q?iSvzXsD8Ghw8+p+D/BfLCIRoDAuoXpLgLvwBJysb92nuLrxhIX8FtpRn?=
 =?Windows-1252?Q?1/Ll22Ggdx+ZEUPFmi50QS2K26KH8Z76H0bThWsoPZISDCyGZg5E8Y7u?=
 =?Windows-1252?Q?5yjha4H04CFoXiSARnnGK3Ua0TaHRom1oCF/TY12LbQ8Dkg93mH/9Jf+?=
 =?Windows-1252?Q?7IjzWW9h0bS7jEtqGDcoKFGEd7mNWA81xJMv5LAA9MEneCobxeNLpG1p?=
 =?Windows-1252?Q?VozWH/0kpEY41VtR51LKLsYEZuJvqn/uR8m9UKWqMfcrwzgiEu9QXN/a?=
 =?Windows-1252?Q?REutGXfQ7z6oLCk3QdK3iUuzGnT33U2Y6w/aE6Ri5xPBpw6Qjna4bZ6G?=
 =?Windows-1252?Q?qQQQc5V8giChEyIjNNq5QwleQhNtBCZb50GXMG31UwBKRNTtuZCcRvoj?=
 =?Windows-1252?Q?/nX1dMcONxpWnE1TCWu/BaSUafFfa1t1dNpxKvBBTExGpDyNN5feB3HJ?=
 =?Windows-1252?Q?sqNXefJ7qt3uAHt4c/aPINX9dRQOwIj3rLdp1ePmTICIsuicsIu4xflY?=
 =?Windows-1252?Q?53Q7JThND0w66DtLYvLz66M7rGFKRrF23Ikj+pGhSsB7yfZ+1sYfmR16?=
 =?Windows-1252?Q?RY2BmL3ii6i8nn4cEOisdm2B55ojiKAensVg00owEzP/bafddcqxmfRi?=
 =?Windows-1252?Q?sPxbpgv+skzONUZSyS6fzI8knU726A+Jj2GBad7LXn6TVpaAAS02qraG?=
 =?Windows-1252?Q?HA2hQgwTRdF9tA43+enYsLWUCU3FYKXNUx+X5dnfuRGPx2ToXhqb0rfs?=
 =?Windows-1252?Q?NtzUQeVUiIbdlFjG3T0eTKlep3PR5XOqHMcPnSE95FoJSUj9QcGq6v7g?=
 =?Windows-1252?Q?gqQwjg6roSEkcRO3yqbX1tzkwcBTNbnazwp1+P/DI2bU3+ZvG+6V/3uc?=
 =?Windows-1252?Q?wpcjjPPGNQjAsCMoVpgUu4xEp+OUJ3D1f3G3hxr9+qCEWwBEAfV+bxQ1?=
 =?Windows-1252?Q?U4MABDPDkXaLh9nb9IY+u6a2kBOSKys6Xy1bE9SLjU+GoVNOFI/G+vkw?=
 =?Windows-1252?Q?2Ykwx4n4Jlbitx2p+S7W8z6Zn3oNEzlgpAN94+InaUMKY/NWxTVvRHf2?=
 =?Windows-1252?Q?AslpqFwGzLhlG2I8MEiB9hFpQdUXe64cQII0FSJUqEbv2VJrSKQx/20W?=
 =?Windows-1252?Q?fP1c5XAeaJE1Zp9JPNcVw/6ExeNWnxFETLw5/rvHDcdgMmdMszWh4cy8?=
 =?Windows-1252?Q?95XAwRcfbgjYozT8VNrczgrYyFfTljJYy4sKrJ5ijt3cemGXORX+rYDu?=
 =?Windows-1252?Q?fMK7T0CMdNoRZQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DS0PR11MB7901A65C83AEBB08626B2B23E0E52DS0PR11MB7901namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	FVv7bduIuAj5QfOeHVdDZ8Oeh2tX3nwt6MndQ/DSaj/IucWVLBH6KfOLPBn7zFy6aH9j8BadM/iOHSr7OgMQCttwtkroDrHeDGvZ/nNmOnhVcwHtFHZdk5aVtZq43JozfsE4MKCf783TjoC2PqPuropqOGCso/LXrKUPx3pofph6uUfpu25yj4VIgNGDbFW02pdcu+h6IwrdXsnrSC7LwFyFOEOdKl55rBokJHEKsNZWHZtk52RpFPbHO6aZN8mhFUklNSWZp/LUeAAy3tLelH/sm8FPdUP1C3lf61cGU9PSNS7kcYROVlXd+2eOfhbW+TuNgvwgsl63aqIlVbP9Qg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f79c8ec-aeeb-48ca-a405-08decba8dd00
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 13:12:05.4786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1xHkZspEPM/XVhVqQ1Zq4vzkc4bV7B2iFVXyFxrkIoGAmxeQ6kVbzbKnfc3Dhc4oaPyjhGaxai0DPz68eMARkjOAI1m1CX1hSx2Ra21PH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6416
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a314bab cx=c_pps
 a=TuEuCTxUJaX1tclN0RLokw==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=PYnjg3YJAAAA:8 a=CCpqsmhAAAAA:8 a=Q4-j1AaZAAAA:8 a=Aj0RiFApBhOJYGg8Ly0A:9
 a=pILNOxqGKmIA:10 a=5b77YkuX34dNxrwkQwwA:9 a=G_4YzU0foCVyXYt6:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=ul9cdbp4aOFLsgKbc677:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEzNCBTYWx0ZWRfX+laI7g75EATw
 erW/damjhMhFmHQ9fHTT2f8aNbCjyfJFnWdU/gB4T9WLlFFu8d7swMLaEeWAgVamaHu5lKpvFaw
 DLIOmrOddcFw0H6SMT1zr2UPCLhcp/0NHbyYp1EvhVgwn6ssff0ZGZkxwzHn+8JcclaeUuNOhcc
 tdF+NZxkgZQhF6Atzh3YEAQdDCQOFWENQj1bRy/iSlW/OZl79CoO5/3WH4CzfDbBWn/BgFrg4Qk
 JCFOPdxLh9nUGQvommIFB1EOSFuUquIM2BWNnznlBR3nn8yTcgjaP1KRMX2SOnpj9xmgjHbvyRf
 CxXPBL7BjoJwqNqIab2f7g+KJ7BREo9C1cGDVL8eKYF4PDxCWOXhb2ESDJ6mL/4o6+q5ms8sz8w
 gTFlovRltmAbl9wXgw9rflatdWIM+uWLL7rCL8oOnv7LjPw0LDlM/iBVPFqvLMLJQ/J8IMBiOJu
 LgqOqDjDqe8EwY4MMNA==
X-Proofpoint-ORIG-GUID: XVt6BRr3HBFFIYBdFP5l9JF259snp1Pi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEzNCBTYWx0ZWRfX5jtZxd1p8oCc
 mqzNMogy+t4mumFdmX48SJWVNA9DCJHx/GKHr4g09Jtc6eeWt27FW5B1LjMvLVeENih8TcXWHjN
 HOlHECwEse4zr1qDxOqxbHdG5IemKYqi2cQFPd8WeVYM7sb4fHDe
X-Proofpoint-GUID: uYYSsIa2JyK--pVhqJ7LXvps2rUQ7JHg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160134
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238898

--_000_DS0PR11MB7901A65C83AEBB08626B2B23E0E52DS0PR11MB7901namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm looking at three XCOFF CVEs against binutils 2.46 and want to check the=
 preferred disposition before sending anything.
All three are in the XCOFF code (xcofflink.c / coff-rs6000.c):

CVE-2026-3441<https://nvd.nist.gov/vuln/detail/CVE-2026-3441>, 3442<https:/=
/nvd.nist.gov/vuln/detail/CVE-2026-3442> <https://nvd.nist.gov/vuln/detail/=
CVE-2026-3442> =97 both fixed by commit c2bf7de1eb7<https://sourceware.org/=
git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de5=
40faf> <https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf=
7de1eb77a91d7a3c86d56408bf57de540faf> ("xcofflink buffer overflows"). One c=
ommit covers both: the x_scnlen bounds check is 3441, the r_symndx check is=
 3442. No CVE in the commit message (Modra doesn't add them), but the diff =
matches the Red Hat bug descriptions exactly (bugs 2443826 and 2443828).

CVE-2026-6846<https://nvd.nist.gov/vuln/detail/CVE-2026-6846>  - fixed by 7=
a089e03<https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a08=
9e0302382f4d4e077941156e1eaa68d01393> <https://sourceware.org/git/gitweb.cg=
i?p=3Dbinutils-gdb.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01393>   (PR3=
4049<https://sourceware.org/bugzilla/show_bug.cgi?id=3D34049>).

None of these are in the 2.46 release (checked against binutils-2_46), so i=
t'd be a backport, same as how CVE-2026-4647 was handled in 42115ea9<https:=
//git.openembedded.org/openembedded-core/commit/meta/recipes-devtools/binut=
ils?id=3D42115ea98a6aed68120ec1df703f07905f7dddd9>.

One thing I checked while looking at this: only binutils-native actually bu=
ilds the XCOFF backend (it gets --enable-targets=3Dall). The target, cross,=
 crosssdk and cross-canadian variants are ELF+PE only - confirmed with objd=
ump -i on native and bfd_backends on the others. So, the vulnerable code is=
 present only in native, a build-host tool. That made me unsure whether not=
-applicable-config fits, since the code isn't entirely absent from the reci=
pe.

There's also the upstream side: binutils SECURITY.txt was updated last mont=
h (commit e1428067748<https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3D=
patch;h=3De1428067748d6b713637241855d1c315fb657c8b>) to say a bug from craf=
ted input has to cross a trust boundary to count as a security bug (Discuss=
ion: RFC Thread<https://sourceware.org/pipermail/binutils/2026-May/149207.h=
tml>). These three are all crafted-XCOFF OOB issues in tools that assume tr=
usted input, so by that policy they arguably aren't security bugs at all.

So, I'm not sure which way to go:


  *
backport the fixes (like 4647), or
  *
mark CVE_STATUS as disputed, given the updated upstream policy.

Happy to send the backport patches if that's preferred - c2bf7de1 applies c=
leanly on the 2.46 branch. Just wanted to check the direction first.

Thanks,
Sunil Dora

--_000_DS0PR11MB7901A65C83AEBB08626B2B23E0E52DS0PR11MB7901namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I'm looking at three XCOFF CVEs against binutils 2.46 and want to check the=
 preferred disposition before sending anything.<br>
All three are in the XCOFF code (xcofflink.c / coff-rs6000.c):</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3441" title=3D"https:/=
/nvd.nist.gov/vuln/detail/CVE-2026-3441">CVE-2026-3441</a>,
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" title=3D"https:/=
/nvd.nist.gov/vuln/detail/CVE-2026-3442">
3442</a><a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" title=3D=
"https://nvd.nist.gov/vuln/detail/CVE-2026-3442" style=3D"text-decoration: =
none;">
</a>=97 both fixed by commit <a href=3D"https://sourceware.org/git/?p=3Dbin=
utils-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf" title=
=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7de1=
eb77a91d7a3c86d56408bf57de540faf">
c2bf7de1eb7</a><a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;=
a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86d56408bf57de540faf" title=3D"https://so=
urceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Dc2bf7de1eb77a91d7a3c86=
d56408bf57de540faf" style=3D"text-decoration: none;">
</a>(&quot;xcofflink buffer overflows&quot;). One commit covers both: the x=
_scnlen bounds check is 3441, the r_symndx check is 3442. No CVE in the com=
mit message (Modra doesn't add them), but the diff matches the Red Hat bug =
descriptions exactly (bugs 2443826 and 2443828).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2026-6846" title=3D"https:/=
/nvd.nist.gov/vuln/detail/CVE-2026-6846">CVE-2026-6846</a>&nbsp; - fixed by
<a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7=
a089e0302382f4d4e077941156e1eaa68d01393" title=3D"https://sourceware.org/gi=
t/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01=
393">
7a089e03</a><a href=3D"https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-g=
db.git;h=3D7a089e0302382f4d4e077941156e1eaa68d01393" title=3D"https://sourc=
eware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D7a089e0302382f4d4e0779411=
56e1eaa68d01393" style=3D"text-decoration: none;">
</a>&nbsp; (<a href=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D34=
049" title=3D"https://sourceware.org/bugzilla/show_bug.cgi?id=3D34049">PR34=
049</a>).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
None of these are in the 2.46 release (checked against binutils-2_46), so i=
t'd be a backport, same as how CVE-2026-4647 was handled in
<a href=3D"https://git.openembedded.org/openembedded-core/commit/meta/recip=
es-devtools/binutils?id=3D42115ea98a6aed68120ec1df703f07905f7dddd9" title=
=3D"https://git.openembedded.org/openembedded-core/commit/meta/recipes-devt=
ools/binutils?id=3D42115ea98a6aed68120ec1df703f07905f7dddd9">
42115ea9</a>.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
One thing I checked while looking at this: only binutils-native actually bu=
ilds the XCOFF backend (it gets --enable-targets=3Dall). The target, cross,=
 crosssdk and cross-canadian variants are ELF+PE only - confirmed with objd=
ump -i on native and bfd_backends
 on the others. So, the vulnerable code is present only in native, a build-=
host tool. That made me unsure whether not-applicable-config fits, since th=
e code isn't entirely absent from the recipe.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
There's also the upstream side: binutils SECURITY.txt was updated last mont=
h (commit
<a href=3D"https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3De=
1428067748d6b713637241855d1c315fb657c8b" title=3D"https://sourceware.org/gi=
t/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3De1428067748d6b713637241855d1c315fb657=
c8b">
e1428067748</a>) to say a bug from crafted input has to cross a trust bound=
ary to count as a security bug (Discussion:<a href=3D"https://sourceware.or=
g/pipermail/binutils/2026-May/149207.html" title=3D"https://sourceware.org/=
pipermail/binutils/2026-May/149207.html">
 RFC Thread</a>). These three are all crafted-XCOFF OOB issues in tools tha=
t assume trusted input, so by that policy they arguably aren't security bug=
s at all.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
So, I'm not sure which way to go:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<ul data-editing-info=3D"{&quot;applyListStyleFromLevel&quot;:true}" style=
=3D"margin-top: 0px; margin-bottom: 0px; list-style-type: disc;">
<li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); margin=
-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">backport the fixes (lik=
e 4647), or</div>
</li><li style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontServi=
ce, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); m=
argin-top: 0px; margin-bottom: 0px;">
<div class=3D"elementToProof" role=3D"presentation">mark CVE_STATUS as disp=
uted, given the updated upstream policy.</div>
</li></ul>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Happy to send the backport patches if that's preferred - c2bf7de1 applies c=
leanly on the 2.46 branch. Just wanted to check the direction first.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sunil Dora</div>
</body>
</html>

--_000_DS0PR11MB7901A65C83AEBB08626B2B23E0E52DS0PR11MB7901namp_--

