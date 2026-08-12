Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF096C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 23:58:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8486.1786579104858434550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 16:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TGNhHTQX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684dbd6f8=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CNk6qA3549363
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:58:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-id:content-transfer-encoding:content-type:date
	:from:in-reply-to:message-id:mime-version:references:subject:to;
	 s=PPS06212021; bh=vWWhCoBO+dvMDDmBykcpsopSO29MapfPujJj+EHAlhI=; b=
	TGNhHTQXtHfsr3+hgZ96KceiWnXutoSh99QnEpteIgSkQ92/lQotsXZNIhusU4ZH
	G5uJiLtBaGv8SX5Fow+BC1/1SkD+yIuSyrx3uyatDyZXq9wRKL7prOF5xGtFaErg
	9vzbVN5K7AngmJFR9PaU0rTeylMCeQSIKcAi+3+6vNS0O9ApBpmYnks7XXTmSQBC
	oZ3Ko3KbMjfxSLkx/oCsbiIX0YoIf5kwEW1fCw/nSaN9ImZfXe+3T/81FNYyI8kG
	CULE6sC0DnnuAWcl0nFF6lspVm1CXLLtLHgSHgwWoCERB/78bgPd1YvQvm/AshpC
	pzNhMYI8jEr4paNgLFlvZQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022086.outbound.protection.outlook.com [52.101.48.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysguv6cp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 23:58:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y1Y7VIT4WKa/8qQcN076J7LAZM7h2Uy+1GeyrlCmzjxPjVuAm8caFfJxCMKxQYaK1DVOx7O/RSEFvppq3MjNbEmycnRpaGd9rGYBFxnw0YF8ZmwtA997KX818j147UL+urgyT5Eu5155PGdwy5CVGd0vQZZSwxRUeOB8iiShItBCWBeK85PZaDBAqVb/r23IA/r0xhW+cwr8YMQPjTN3XAF/imM06kOJShc4NyzJwMsVQs/02KXPDFdWCb1GH7UTka1oulBBmW52GoUtS4BVkAkt46JOEviQCLDys8MsFwBoCxR9YrClH6WQ/rI2EHGkrUXU+nBTGZpPfoXyKsscSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWWhCoBO+dvMDDmBykcpsopSO29MapfPujJj+EHAlhI=;
 b=ZRd7sx3fDMMOpfgXDbv8Hpa6ZUkUhk6+VnslZJGSrAEKJY/GSFoQpSdPkm1d/vEW239okgIAxCLLatTCa+oUm0vj0tM63rbHohKC2QVAWyop5ZZfH67oZZxOzUYBHOBXYAuflag/95FD9X7pJ7ekQ8/k3q/Dp2VAidBlYC2cJvdt+tPS9R/MEoAfh145eF3vbMjD8Hpg1f4SuiLnjv7ak626p8VmVeuhOCoS097VSAXQvlRQRcDK078o/eZXRML5Cs9Ff2zkkvSCKpr503vzQrbAEl1YzX1EWUIl9JXWynY3B68AGGVYsEgP6cAGGOxUz7MD5NgBJAALXa0gqhBhgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by DM4PR11MB8089.namprd11.prod.outlook.com (2603:10b6:8:17f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Wed, 12 Aug
 2026 23:58:19 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Wed, 12 Aug 2026
 23:58:19 +0000
From: "Gavini, Sumanth" <sumanth.gavini@windriver.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
        "mattware@cisco.com"
	<mattware@cisco.com>,
        "esparlin@cisco.com" <esparlin@cisco.com>,
        "peter.marko@siemens.com" <peter.marko@siemens.com>,
        "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [PATCH v13 09/10] rpm: Fix pkgconfig() Provides missing in
 cross-built RPMs
Thread-Topic: [PATCH v13 09/10] rpm: Fix pkgconfig() Provides missing in
 cross-built RPMs
Thread-Index: AQHdKIQkT1fyCE64VUeWGL3/BL7Ti7aY5/EAgAFl5YCAAM4HgA==
Date: Wed, 12 Aug 2026 23:58:19 +0000
Message-ID: <7838c428-b165-4df5-9a88-0ea7338c987c@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
 <20260810045250.3903576-10-sumanth.gavini@windriver.com>
 <DKM6IAUNZOOF.11QH0FJ6NRSQ2@bootlin.com>
 <DKMXR2LKXWBZ.3C4RKC617CK0H@bootlin.com>
In-Reply-To: <DKMXR2LKXWBZ.3C4RKC617CK0H@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9256:EE_|DM4PR11MB8089:EE_
x-ms-office365-filtering-correlation-id: 7a2c3055-7d66-46a5-eca3-08def8cd9587
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|6133799003|56012099006|10067099003|5023799004|11063799006|4143699003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info: 
 KiQthssMYUvDACb9be0p3FwPgh7+RtyoLJ/AtzR5EwnLkIJaDGrw0zJ80+Gvl3+LGkDbfNay6X/UqwD7/iLJ6CUW5TZG8lxco91kVQX8Hbv8RSmsb7bVYQCGgY+N61RAblHaWGinD8S/RHZCyr+eCGUIYayp9yxymsZjE+srvfv01ntJKfZXv2rmxu9K+0A8nmgDGoV6kkePBHJlS1+hhr5PSyP1nF4sBRz8C4O6K5SQ9gejPJMmn413L+59rocfDoMHtwHXMiLexF7p4OlyizkAbR/S5n1iwLiqlEL+TM4Hpg8JwOKXdQYoHkbFyWBAvRcLFUP+ECdQAzsUYt+g+Ko8bTxnPR33vKwkQUCUpJ6U0ZC4GQbCCkQzjRab5OGY0EJEgMExw5t49+lQlBhoqn2M5yDLmG/45bE6jNtG6Qrl6GYCjRzxKwPQSKIk4zofkqcl3KIPxvA23pllUENf7EjqvJKmYnxipgOXhgzesxXlosTHm883z7/ZVBxjpuzx1Dxcjx76w0rz+QRUBWa2facjyJpCw2IftGB+LaqSa69rCBmI2Gou6H5CMDAYzyjPFnfxA9ops4+dEAvHB3PxGDdqNOH7y8zUavEu3DFthihXJY3dYcd2Uv9q+6qM4czy1i5YK8nXKZyPAPhJHVdMHVaw6ftpc6sa9tnCp4NgG5s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SGlid05XNmE5M0ZaOU50V21TOFRBTmtiNWNDNGJPbWwyd1VLMjFJc0JLMmNM?=
 =?utf-8?B?MDJjbVNxZlc0V3YxVzMwdkFvY0lRSHpzd0xiYTdmRUhmQVBFdWtkbmJHMFZp?=
 =?utf-8?B?WllKeXpZVjRWckJ1OWxKdjdwSFk4ODhhRTVrd3NNcXQ0ZjlTVCsxRjhMQThW?=
 =?utf-8?B?N1BSWWtyRDBXbS9QU0FhWFl1VTRDY1YrRUJaUUZlZGlxRWZXb0ljSDVsL2s4?=
 =?utf-8?B?Q3hlUmlJY3hKeWdoUXBBOEVrTVJYWTRYSWxZRkRRUGxWd3JVY0NtZVlCanV1?=
 =?utf-8?B?ZXNiTWdvdDUra0NrM2IvTjJnQkJ2U3VwVkV3NTAveUhTZVRac2JLZjRuMEp1?=
 =?utf-8?B?Qk5xWis0ZTJSeDB5SWJBTGo2QTJGYkRWbWwrMVk4VkMrNGtKUTdoSTdIOU05?=
 =?utf-8?B?aCt1bjNrQktzY3YyQVRxbm1OaC9lMUhoampuVWVyVDVhQndBZDFiejFYTEFV?=
 =?utf-8?B?U3JrMDZwZUZSNXdpREtrWG1TVnNPbUdqa25naXB1RWRiODBUUVF1cHE3bUUy?=
 =?utf-8?B?UGxCdXcxK3QwZ0MwRit2YmJ6cCtkeGhLMnhZM2Y5ekZrTTZQcDNqY1lkTjNN?=
 =?utf-8?B?T2xYZXd0QXdGMmFkUjdUQW5RWStMWGVpcmpTVTlSR25jdHZjUTUvTDQxakxM?=
 =?utf-8?B?aDlzZGVxaFdBbDM1Q0NmMm5UQldYTGJoU0ttY09RUVA3UjNFakJhQzhLMHpy?=
 =?utf-8?B?MzhlK2NtQ2Z3VXI2MW54WHZnYTFsb3pxRHZCTW5penBkRmVPODFIWXNCc2NN?=
 =?utf-8?B?dXhjWjhxQjRvUlVmNDVCbVdkb3ZFK0Q1Y3cwVE1tTEhlcEN3SUJYbzBWZ2ly?=
 =?utf-8?B?c0tlY1RibjQ3aDNwTm5PZHJyaElCWVNvNkxFRmVxU3dYV2Nac1dRbmVONGVQ?=
 =?utf-8?B?NTM1OFRNZXdOaDFyNDNEN01OMnhXY2tmMG1GL1cxMWdFSWlBNDB3d1g4Y3hM?=
 =?utf-8?B?MzJGbWpBRVVXVXJkQW5EWXZDbGlHdnlxbDc1STJ0Mk1aRU9hbkFIbDVmb2Rx?=
 =?utf-8?B?NjJtdmJpME96YkxHU3o1NlVuMVR5TnpQMWtBK1NPN1FtUXlSRzBrY1lXU3Ba?=
 =?utf-8?B?K1FtRURxSzV6RVREOFBxWGczc05BQ1d3dkw0WlNtVmFuRVpodUliL09NNWVJ?=
 =?utf-8?B?V1l0aWtxOUNxY3h5cWFNR1Yxc29zT2E4NDI4ZThwY3Jjem0wTmZzQWE2Ymh1?=
 =?utf-8?B?UU5TMHJtQzI1TERXT3YzWStGQTN5YkgreUNUZXgyZm5Qai9BVUhsWGEzSmds?=
 =?utf-8?B?YWlWNVBmdkU0RlJLZ0ZaanpCU2lMOHdzc01RVjNveEtFV3JkNUMwYmUxc2dz?=
 =?utf-8?B?L2I0TlEvMDk5dS9lNy9yN3hhek1mRFVndGVqbzNkY2ZuUTZUUzNpajFST0Qv?=
 =?utf-8?B?MXpPL0dnd3EzdkhnaWhmZE52Tkg2QkRwbDZSY0FWT0lXcGNJNVRKWVA0MFZK?=
 =?utf-8?B?WGRxbXhXRk9uRjhQWDI0ZU9aOW1vYVlLQVBZamx3VHRRMDJiVVlrN1hITXYz?=
 =?utf-8?B?VjQvL3VDb0VNUWQrWXlid1h2KzJ0cktOYWZUTGtJVGw4RC9GT3JUL0srZmlt?=
 =?utf-8?B?NzJhQUxuYitHMGl3aHR0WE14bXBaenVDdFZ6MTY1d3dUenVIYjc1UW1JLzVG?=
 =?utf-8?B?eUhndmVMd3h5UlU1UU5LUVdCV2R6Z25MYy9oWHl2SmQxeWg1QjhnM0RZZjFJ?=
 =?utf-8?B?R1NYY1E5VFA2QmpsOFRwWHQ4MzNYd3dYM0x0QTRRK3dKMFAzUXFoSlZXQStp?=
 =?utf-8?B?VVNzTVpjdTY5YXgySDdKcExtbFVqSkxFKzJlVm90d3k4eTBoSlJGRjZuY1hQ?=
 =?utf-8?B?VERqYkRpaTRMeHVranVCdUUvNkpHa3lmUTVLaGNIVGtIdHkrc2pRVnRiekZt?=
 =?utf-8?B?TzlNTVJPS2pQK3J0U0QzWGlBVjNJSzRBNDRtc3FuN2dqNTY3a0d4SUFsYkdT?=
 =?utf-8?B?RjhmVUhCMUVoQ1ljeTg3L01nY2ZHL3VqVFBERHhJazNzZ0lUQ3VEMlpTMWJR?=
 =?utf-8?B?OVN1eVNXcHYwOWFiSk9NalJYdEh5SXpYS2Y2K0VzUnA2eDFQaDVSd3hPTzdE?=
 =?utf-8?B?ODc0VWhWczVqVjlMUXVxTjRjSUZhUGNzUkhVeHdLUjVlYmZxYkd6VGNaSGZ4?=
 =?utf-8?B?U3ExMTFLMk9NTk5TTmtTUU4yRzZKWHdHZzBqZEhabHk1SnkwQ1AwYXFCNEJL?=
 =?utf-8?B?MWd1VWZxNjVidGI4WDFtNjZHVDVwUTVjVUxqWmRQeXNaQTBrdkoyS2pyc0o0?=
 =?utf-8?B?emhFUmhtKzhvTHZlWHhua0phdXJrL0kyOHV2bVM4RFpjQlVDVFgvTVpzc1BB?=
 =?utf-8?B?Z0hUZkZ0UGZWWGhXOTVOajN2N2ZsbEYrbVlLSSt6UWhkNFk1L1RNZE9va0Q1?=
 =?utf-8?Q?Xj/vyWXLm/xrNE8iVP6cPje4R2aP0zA6aCMea?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F509CEDF3B9267479E4259AC630F730E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	jxL/4QCzBrgmc/RToMnuqqGpBSvKM8o/Zhk5vADMKGGrEBDy8MJ+bHxViNf5KgJ47nnc16ZPFYMI1ADa60AUJcStMp7LdUXZD0VLrf14/cCwtFLNhjzf3aL+RtNPwY01B4zXIDYK0xJ2SAjIGiAmdSnhaIEhp4CCrlKj0NSJZOpxWHO5cZ5IyNtIV2Uhdu93ojZM8VYdNH3OJZEUEOIbre1HP7HTC9j9pnFulDMaKTz9N2qxpa6dUV5kzxoDBpSQ0sdOWzD4OEnJuGKIvjdl5djJbTd3SvanmcvPbbiRIn/l4JuIP6G1JoVNMdltTqgaR6con6HieUjCyROi3kvrPw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2c3055-7d66-46a5-eca3-08def8cd9587
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2026 23:58:19.3231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1SBI5MRDyj/dzHCum6IoOJhuAZB1eXxhYPQtPJTkNhmqaQ9DqDOz6kdSnrQ0+W1kf0raXlJd8teSB6iw239Euto21uqg4vouhHnti3W+siU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8089
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: DgRl50JG8-eaIrIjWM2uhK7v7VovkM6P
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfXxn0Isc2KTWqp
 dDb6l5O7bU16hjBdkROu9ii+cdGjgGETay5F25QmhxniuclM9mO0cl/bBNf4UmGkox3vcrodrW3
 F3yjGoO+TpDYVQc7FHXAyne4HZlxwnWEd/JYgsmpcj1SVNtTEe9A
X-Authority-Analysis: v=2.4 cv=BYroFLt2 c=1 sm=1 tr=0 ts=6a7d089f cx=c_pps
 a=fkVT6ClcRaXWu6jQ4rTLEQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8
 a=RK6QGBSbijysJbJEKkcA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE5MiBTYWx0ZWRfX07fbaVFS1qIn
 j9t9J38WAJB2XPTEXoJOC2aaUsTl9wNNMh7OhUCo4HRJe0Lw/GdcToB6wBv+4CLywLRop7FwTx8
 mH6c1klbi+lGxqb8lmGnuXHQItGk+06Ui45mWXcHRR3b1j9vY3ANfgmSZuXt9VagQt58LgleMFf
 EhSdOJDjB4MbUT9HWxRD82jypLewgEmW3WT66jGKyw6xQI5VNAkOqDWEEoLTKV8RMZTBy7rflyg
 q6T9V+CFRM+y3HtMjh3kjT7mHllHPYkitcRnxfmYLvFhUP5HSaPeuagd81X09BQ56B6qhTwll5D
 JbYNeWaA06BpHK22qRJYYdFZSYiiwSGNMrJLG3D90b0DSPm4VTAyT/QHDw0UK6Ashf0nIUQ89Je
 c3Xlw5xg2F4V6GGW05O9RRu4WLW/O++l14OSh+4PqLpSKF6uO+ZRANA7kGvr44Yl4fOXpaTwHXy
 sd9aF3Z7OX5j+9Xz/IQ==
X-Proofpoint-ORIG-GUID: LRi0nLHPZHqNGdGYJtOvRep563RiirkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_07,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 23:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243320

T24gOC8xMi8yMDI2IDY6NDAgQU0sIE1hdGhpZXUgRHVib2lzLUJyaWFuZCB3cm90ZToNCj4gQ0FV
VElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1haWwgYWNjb3Vu
dCENCj4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBy
ZWNvZ25pemUgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
T24gVHVlIEF1ZyAxMSwgMjAyNiBhdCA0OjE5IFBNIENFU1QsIE1hdGhpZXUgRHVib2lzLUJyaWFu
ZCB3cm90ZToNCj4+IE9uIE1vbiBBdWcgMTAsIDIwMjYgYXQgNjo1MiBBTSBDRVNULCBTdW1hbnRo
IEdhdmluaSB3cm90ZToNCj4+PiAqIEFkZGVkIDAwMDItcGtnY29uZmlnZGVwcy5zaC1VbnNldC1j
cm9zcy1jb21waWxhdGlvbi1QS0dfQ09ORklHLXYucGF0Y2gNCj4+PiAgICAtIHJwbSA2J3MgaW50
ZXJuYWwgZGVwZW5kZW5jeSBnZW5lcmF0b3IgcnVucyBwa2djb25maWdkZXBzLnNoIGR1cmluZw0K
Pj4+ICAgICAgcnBtYnVpbGQsIGJ1dCBPRSdzIGNyb3NzLWJ1aWxkIGVudmlyb25tZW50IGV4cG9y
dHMgUEtHX0NPTkZJR19TWVNST09UX0RJUg0KPj4+ICAgICAgd2hpY2ggY2F1c2VzIHBrZy1jb25m
aWcgLS1wcmludC1wcm92aWRlcyB0byBzaWxlbnRseSBmYWlsIG9uIC5wYyBmaWxlcw0KPj4+ICAg
ICAgaW4gdGhlIHBhY2thZ2UgYnVpbGRyb290Lg0KPj4+DQo+Pj4gICAgICBVbnNldCBjcm9zcy1j
b21waWxhdGlvbiBQS0dfQ09ORklHXyogdmFyaWFibGVzIGluIHBrZ2NvbmZpZ2RlcHMuc2ggc28N
Cj4+PiAgICAgIHRoYXQgcGtnY29uZmlnKCkgUHJvdmlkZXMvUmVxdWlyZXMgYXJlIGNvcnJlY3Rs
eSBnZW5lcmF0ZWQuDQo+Pj4NCj4+PiAgICAgIFdpdGhvdXQgdGhpcyBmaXgsIGRvX3Jvb3RmcyBm
YWlscyB3aXRoIGVycm9ycyBsaWtlOg0KPj4+ICAgICAgbm90aGluZyBwcm92aWRlcyBwa2djb25m
aWcob2dnKSBuZWVkZWQgYnkgZmxhYy1kZXYNCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFN1bWFu
dGggR2F2aW5pIDxzdW1hbnRoLmdhdmluaUB3aW5kcml2ZXIuY29tPg0KPj4+IC0tLQ0KPj4NCj4+
IEhpIFN1bWFudGgsDQo+Pg0KPj4gVGhhbmtzIGZvciB0aGUgbmV3IHZlcnNpb24uDQo+Pg0KPj4g
VGhpcyBsb29rcyBiZXR0ZXIsIGF0IGxlYXN0IGZvciB0aGUgZG5mIGluc3RhbGwgZXJyb3JzLiBZ
ZXQgd2Ugc3RpbGwNCj4+IGhhdmUgZXJyb3JzIHdoZW4gcmV1c2luZyBzc3RhdGUtY2FjaGUsIGFz
IHJlY2lwZXMgZ2VuZXJhdGluZyBwa2djb25maWcNCj4+IHNob3VsZCBiZSByZWJ1aWx0LCBidXQg
dGhlaXIgc2lnbmF0dXJlcyBkaWQgbm90IGNoYW5nZToNCj4+DQo+PiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy80L2J1aWxkcy80Mzc3DQo+
Pg0KPj4gSSBtYWRlIHNvbWUgaG9ycmlibGUgaGFjayBpbiBteSBicmFuY2ggdG8gY2hhbmdlIHRo
ZSBQUiBvZiBtYW55DQo+PiByZWNpcGVzLCBhbmQgdGhlIGJ1aWxkIG5vdyBzdWNjZWVkcy4gSSBv
bmx5IHRlc3RlZCBvbmUgY29uZmlndXJhdGlvbiwNCj4+IGJ1dCB3ZSBjYW4gZXhwZWN0IHNpbWls
YXIgcmVzdWx0cyBvbiB0aGUgb3RoZXIgb25lcy4NCj4+DQo+PiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy80L2J1aWxkcy80Mzg2DQo+Pg0K
Pj4gU28sIGRlcGVuZGluZyBvbiBob3cgeW91IGFkZHJlc3MgUm9zcyBjb21tZW50LCB5b3UgbWln
aHQgbmVlZCB0byBtYWtlDQo+PiBzdXJlIHJlY2lwZXMgc2lnbmF0dXJlIGlzIGdvaW5nIHRvIGNo
YW5nZS4NCj4+DQo+PiBXZSBhbHNvIGhhZCBzb21lIHNlbGZ0ZXN0IGVycm9yczogSSB3aWxsIGlu
dmVzdGlnYXRlIGEgYml0IGZ1cnRoZXIgYW5kDQo+PiBjb21lIGJhY2sgdG8geW91Lg0KPj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUv
YnVpbGRzLzQ1MjUNCj4+DQo+PiBUaGFua3MsDQo+PiBNYXRoaWV1DQo+IA0KPiBTbywgdGFsa2lu
ZyBhYm91dCBmYWlsZWQgc2VsZnRlc3RzLiBXZSBjYW4gc2VlIHRocmVlIGZhaWxpbmcgdGVzdHMg
b24NCj4gdGhlIGF1dG9idWlsZGVyOg0KPiANCj4gMjAyNi0wOC0xMSAxNToxOToyMSw2NTEgLSBv
ZS1zZWxmdGVzdCAtIElORk8gLSBkZWJ1Z2luZm9kLkRlYnVnaW5mb2QudGVzdF9kZWJ1Z2luZm9k
X3FlbXUgKHN1YnVuaXQuUmVtb3RlZFRlc3RDYXNlKQ0KPiAyMDI2LTA4LTExIDE1OjE5OjIxLDY1
MiAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtICAuLi4gRkFJTA0KPiAuLi4NCj4gMjAyNi0wOC0xMSAx
Njo1MzowMSwzOTcgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBzZGsuU0RLVGVzdHMudGVzdF9zZGtf
bWFuaWZlc3RzIChzdWJ1bml0LlJlbW90ZWRUZXN0Q2FzZSkNCj4gMjAyNi0wOC0xMSAxNjo1Mzow
MSw0MDEgLSBvZS1zZWxmdGVzdCAtIElORk8gLSAgLi4uIEZBSUwNCj4gLi4uDQo+IDIwMjYtMDgt
MTEgMTY6NTU6NDQsMTkxIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gc2RrLlNES1Rlc3RzLnRlc3Rf
c2RrX3J1bnFlbXUgKHN1YnVuaXQuUmVtb3RlZFRlc3RDYXNlKQ0KPiAyMDI2LTA4LTExIDE2OjU1
OjQ0LDE5MSAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtICAuLi4gRkFJTA0KPiANCj4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMzUvYnVpbGRz
LzQ1MzcNCj4gDQo+IFRoZSBmaXJzdCBvbmUgaXMgZWFzeSB0byByZXByb2R1Y2UgbG9jYWxseS4g
QmFzaWNhbGx5LCBJIGhhdmUgdGhpcyBpbiBteQ0KPiBsb2NhbC5jb25mOg0KPiBTREtNQUNISU5F
ID0gIng4Nl82NCINCj4gUEFDS0FHRV9DTEFTU0VTID0gInBhY2thZ2VfcnBtIHBhY2thZ2VfZGVi
IHBhY2thZ2VfaXBrIg0KPiBJTkhFUklUICs9ICdpbWFnZS1idWlsZGluZm8nDQo+IElNQUdFX0JV
SUxESU5GT19WQVJTOmFwcGVuZCA9ICcgSU1BR0VfQkFTRU5BTUUgSU1BR0VfTkFNRScNCj4gU0FO
SVRZX1RFU1RFRF9ESVNUUk9TID0gJycNCj4gT0VRQV9URVNURElTUExBWSA9ICc6MScNCj4gRVhU
UkFfSU1BR0VfRkVBVFVSRVMgPz0gJ2FsbG93LWVtcHR5LXBhc3N3b3JkIGVtcHR5LXJvb3QtcGFz
c3dvcmQgYWxsb3ctcm9vdC1sb2dpbicNCj4gT0VfRlJBR01FTlRTICs9ICdkaXN0cm8vcG9reScN
Cj4gDQo+IFRoZW4geW91IGNhbiBydW46DQo+IG9lLXNlbGZ0ZXN0IC12IC1yIGRlYnVnaW5mb2Qu
RGVidWdpbmZvZC50ZXN0X2RlYnVnaW5mb2RfcWVtdQ0KPiANCj4gSSB3YXMgbm90IGFibGUgdG8g
cmVwcm9kdWNlIHRoZSB0d28gb3RoZXIgb25lcyBsb2NhbGx5IHNvIGZhci4gSXQgbG9va3MNCj4g
bGlrZSBhbm90aGVyIHBrZ2NvbmZpZyBpc3N1ZS4gSSBzdWdnZXN0IHdlIGZvY3VzIG9uIG90aGVy
IGlzc3VlcyByaWdodA0KPiBub3csIGhvcGVmdWxseSB0aGUgU0RLVGVzdHMgZmFpbHVyZXMgd2ls
bCBiZSBnb25lIHdpdGggeW91ciBuZXh0DQo+IGNoYW5nZXMuDQo+IA0KPiBUaGFua3MsDQo+IE1h
dGhpZXUNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20N
Cj4gDQpIaSBNYXRoaWV1LA0KDQpJIGhhdmUgcmVzb2x2ZWQgdGhlIHJlcG9ydGVkIGlzc3VlcyBh
bmQgc2VudCB2MTQuIFRoZSBmb2xsb3dpbmcgdGVzdCANCmNhc2VzIHdlcmUgc3VjY2Vzc2Z1bGx5
IHZhbGlkYXRlZDoNCg0KYml0YmFrZSBycG07bGliYXJjaGl2ZQ0KYml0YmFrZSBjb3JlLWltYWdl
LXNhdG8tc2RrOmRvX3Jvb3Rmcw0KYml0YmFrZSBjb3JlLWltYWdlLXNhdG8gLWMgZG9fcG9wdWxh
dGVfc2RrDQpvZS1zZWxmdGVzdCAtciBkZWJ1Z2luZm9kLkRlYnVnaW5mb2QudGVzdF9kZWJ1Z2lu
Zm9kX3FlbXUNCm9lLXNlbGZ0ZXN0IC1yIGRlYnVnaW5mb2QuRGVidWdpbmZvZC50ZXN0X2RlYnVn
aW5mb2RfbmF0aXZlDQpvZS1zZWxmdGVzdCAgLXIgIHNkay5TREtUZXN0cy50ZXN0X3Nka19tYW5p
ZmVzdHMNCm9lLXNlbGZ0ZXN0IC1yIHNkay5TREtUZXN0cy50ZXN0X3Nka19ydW5xZW11DQoNClRo
YW5rcyBhZ2FpbiBmb3IgdGVzdGluZyBsb2NhbGx5IGFuZCBmb3IgcHJvdmlkaW5nIHRoZSBpbnN0
cnVjdGlvbnMuDQoNCklmIHlvdSBlbmNvdW50ZXIgYW55IGZhaWx1cmVzIHdpdGggdjE0LCBwbGVh
c2UgdmVyaWZ5IHRoZW0gbG9jYWxseSBhbmQgDQpwcm92aWRlIGRldGFpbGVkIHJlcHJvZHVjdGlv
biBzdGVwcy4NCg0KLS0gDQojIFN1bWFudGggR2F2aW5pDQojIFdpbmQgUml2ZXIgTGludXgNCg==

