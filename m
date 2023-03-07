Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A553FC678D4
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 09:06:03 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.67])
 by mx.groups.io with SMTP id smtpd.web11.10339.1678179961406945656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 01:06:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Q51fpRLg;
 spf=pass (domain: siemens.com, ip: 40.107.241.67, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPjP+I8FlRvxD7n9mSHz86CZTAxt/zcHkv7pv7VGG9q794+5jn/u3ycV3tMxdypxPDVRXiGzNUv6XZ+IZ+MHliiLwvqQRwki+NqRD/5xaZIhkdBvfo4yvrpxqPnQWTlDMBQ9E9uRtdilFvvdRfQ5Kt8AD27wnaEXgll7X2KunRWvh2XfTZz5PL4xeEsjk0R4KJDyiBHkg5bGh8QwNz67jGXWBdl329glngRfd9pyXREOQsUKBcDfrDUANvg/KITtFiRIpQAep55Qyyxl9PG1xmqKgtLUB5Srnlh0zRWN2dPjCC1XHJfsEYVA5R0y5oyFvHhHGiRjgCUHy6ls9QntVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvyLGocWte/9Vq32ZDPqlH+cQFhTNohLUIEjvx80qVw=;
 b=FkseFG/ZUGfH7gPw+VRBWTqRyTmjNAmooOHbREtSxKockYDQWqDHKyeqYMIUnTRLmm/6PMGLE21JIJZJ3FpdFKcdOhTFNhJidaCvjBm3l52vKfVoAZa+FqjtS1ifVEHy1YVgP3acZmS/+iNbXQZh8+17pcawhsc49dl6CJIdeK7iYmLoMgSvn1YeIzkGLI99CCbmBb1uyrNkRb5QhvW/GsiPmBJWEcIzTofE60PeI3gLJDI4rB4MYZwmihBrvDdmcc4neeZDvfTXRs1P+ANPrWhFLBorTMcU2wK/shMx5sjAlYiS19gJJVtPQZexWz7jVxi2dqDv1dP42eHBIFO5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvyLGocWte/9Vq32ZDPqlH+cQFhTNohLUIEjvx80qVw=;
 b=Q51fpRLgASIBbZh+8KKxHOfjp1raks/Ik8ua265H8nN8GqCc0px5+ZCUUNlIKw1GMOF9ngvrDi2de+TPyi7REhndufUznpyrqLoVJCh4pSIDyOb4aka/5h+88yzBLQF2PGnCM0uW6WVZ+X3ADiiT3Rh6J7X1A4pXYLQNEIKoP18YnJdNCWju04ZKD8ZD57nVZQe3TDPF0LmLVg78vePyGPdyyRfQIMHfhoqqfidbx9tiuJi87d2T6dwon+vadsI7x3VXBN0jwVPtEQD8lQ8+aL3FEzxUwlXJBQ1eW9oUVsWlIlaArMdPGEFyvp7QvpeOf5BIiPaJ85YZyCg1WORg1w==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3579.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16; Tue, 7 Mar
 2023 09:05:57 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8287:69fd:1c5d:c2fa%7]) with mapi id 15.20.6178.016; Tue, 7 Mar 2023
 09:05:57 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
Thread-Topic: [OE-core] [kirkstone] Google go CVEs
Thread-Index: AQHZUL6Jc9VVRVusOUuFBbQ2Uq517K7u3ROAgAApfoA=
Date: Tue, 7 Mar 2023 09:05:57 +0000
Message-ID: <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com>
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
	 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DB8PR10MB3579:EE_
x-ms-office365-filtering-correlation-id: 507500a8-904c-4854-9b48-08db1eeb2a40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GFoNcG1FVxbPCNkz7ifCa+wf+r12kbsbtQFOxLGBeUYzRUszJqDcbNxcLFJUAsfL96VXLLK3eXToI+dN14/sUV4shPUxdaopqbrejPpdkTQYvg5Nn4DfmgwsQuN3UE9vUCmO9N6FqFWH8uO1zv4Snc4hS+sXGuB1u+VnHWVoARDXR+DfTe+CAkSIctm+Pqxvlj+KRzxD0HNga/2ZwPblZDLOKxhhn/GrXqaNRsFZNBrRxQrSpmLgt3WLD3lo7FhFM+ViMb2TmknH3dIIDIIkZwn9GWifcvx3vCuJlI1BMc1beWIO2m9/g6uTSDxmamjvnWTBe/CjsfYhEfzBdaokmgpVR6E/P98ywnyE4cfnq3JhGm5o/w0ox20CNhnZUNlSjAU6iTuxtMHx84IFZt4K3VfKlfDAE4thaJvxSLtNMxWqmOAah3L5jYa1Wrsof+DLxkJmDUX5E1OKv8R8DsUObFA3pl96yExz+qnln2iMlOTL/vlNJ8MpKNAXOTCZSsO40s0hiO2QcnbWLBkZkDi9GbQpiwh2OE5y8S5gRKFFIvkC2jvD2kN0VhwSQ3J7LnN0lb21febqDzSNoNgNvQsO8DMUIa17peX2F5ZWNxZ1zLPsVdLGcimXcbzshlOFS/mq7v+K7DX1GxvL6OSPZfMUx7JdQSUWS2eYI0qBCKpWYPJiiljLopOpu6JmtGgjC0YX0cq6dWQB6MpcYj/U7isfMhGNUzqPkIstxNXR/5+9VH4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(122000001)(82960400001)(38070700005)(86362001)(38100700002)(66476007)(36756003)(5660300002)(6506007)(2906002)(4326008)(76116006)(8676002)(6916009)(8936002)(66946007)(66446008)(64756008)(41300700001)(66556008)(2616005)(186003)(83380400001)(6512007)(91956017)(54906003)(478600001)(316002)(966005)(107886003)(26005)(71200400001)(6486002)(66899018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SFhZUUluRmtUUVNLUTduU3dOano0V24wSExCL0k2WVNwb2xiejBiUXJRbEow?=
 =?utf-8?B?ZGpLZ3g5bTl4WUtadVRqV1BEdmt4WXVyZVpuTHJyMjFKRzFQci9BWVEzb01v?=
 =?utf-8?B?aGhvWS9hUyswL1Y0MHZvNU5lSVdwcmdBZG5ETVJDNEE0enJYbWVXSDgvVFNH?=
 =?utf-8?B?TEFwS2dhMnpZWGpNVEVyODlVQVlKWksya1NYdDgxVGxQcmR1T0c5VENZU3Av?=
 =?utf-8?B?S3dTaTY5ZGJKYlhaWWovWGR6aUpOR3RyRzRDd01QT0RIZHMwYlk2REVuTnMw?=
 =?utf-8?B?YW8wSi9wa3p4SGlld282dnAxY3VMK2lKS3RPRmJOcGlpWXMwNTZodlBzaEJJ?=
 =?utf-8?B?enNLQ2FNK0ZiblFXcyt0S3VlSzlWVmM0NnZMMUsvelNRSHdzYWdoQWdWTCtY?=
 =?utf-8?B?eVpIdHorN3A3NEZlRVZwMTFOWmFkamhLWlVXalN4a0svTFF2enI4VUpLRFZJ?=
 =?utf-8?B?cmdQdjRwRE9VdXVMdFJpR3NyQ1FCWmhaa1BuRm5YOEk1TU00YjBEbGVudk56?=
 =?utf-8?B?MVJ0UEkrK1B0Mjh0c2sxSGk5aTdxNWpxajhoOElKRzV3eURuUnRPTUp3UFgv?=
 =?utf-8?B?YnNzdEZSNzdXMnhFMG5NQ1ZUN2hWcGdseWFHdmtnMHRscXVjamFMQzRvbTJv?=
 =?utf-8?B?bEFlSkQ4MkJ4NHhWcFp0RnV2U0J3bTg3aktNdkdSM1FWWjZEb0s4L244Q3VV?=
 =?utf-8?B?OWNlbjBoYzhELzIxc1VlRWdOZ0l6TzMyR2E1cHZvZ0dKclo3YWZab0p1ZXFN?=
 =?utf-8?B?Z3BoVVpFUkQ4ZjFrQjdrMXZlS2w0emdlZDRxSnFNRkM4ZUZ1WHJOYWNrQVh2?=
 =?utf-8?B?WTkxV0VjekFVS2tlQWlTd3psYU5ZZXhPbWNxZUFJS2Q3UXZmaUVjditOVVcw?=
 =?utf-8?B?UHNpSFlqdmlWeTZ1ajh0YVJZSkpNLzdGeSt1VGlKcDdzb0c0RmNYbHBuWDlP?=
 =?utf-8?B?empUbzRXY2wwZ3JIbTdWQlc4Nko0bGtrTktYcEZ3Qlg4VDQza1hzcFFrV3hj?=
 =?utf-8?B?RE56LzErSUk4ak5zK1VIZEttcHdpUW1QUUl5R0hxRnhBYWYwV0RUTlB3eWZW?=
 =?utf-8?B?ZytoRzI4RVpEVXdHczFibFEvZFQyS0RtdEhQWXNtV3pTb0pQbUMxQ2xueGRh?=
 =?utf-8?B?dCt5Z01Wa0NqMVF5ZGtUMGJ0R0lqR24rSUVaWWpESFFrSGV3V0EybWtxeFdD?=
 =?utf-8?B?T1JnUHFpaFFXU2FtazVmdWpETDBaZmtkaXRCNXFaalgwQjBZZ0dWNFBSREJH?=
 =?utf-8?B?SmNpNkZYK0EzaWtPbjdrcDBRaTk1bVNrZWwxMS9aUFJIeVUzYkdlV3hlZjFz?=
 =?utf-8?B?cUJsSHhNWmdFUGpYenVBM28xOXdGN3o5Qm1xSUxDbVloMDRkWlRQSUhFUC9l?=
 =?utf-8?B?WXpBclpBUmkzSndpbk90NERwSWpxSWpJTjRhY2ZLTWwwUnRMdHlmdURlWmJp?=
 =?utf-8?B?MVFZT1cvTzQ3YVB0ejk2L0ZFMlZ3ME0xZ0tlT2I5aGNrcmU2L0Z4QmUvUlhn?=
 =?utf-8?B?SFlDRnI5aUljdXN4eUVVSVo2b1U4S0hrem9pU3ZoL1phbE5na0xJM3BuMUdN?=
 =?utf-8?B?UkF0OHhHblhGNnlzemgxUU84YU8zbVRlNEw3Z3B0ZENaOXVQTExVbTg4N1lH?=
 =?utf-8?B?ZjZOaDlIOXEyYjBXc1VFUThuUUpRNE92UzBDRUJPbWgvV2dweFoybUJ5MEkv?=
 =?utf-8?B?V2djOXNNUzJZUFB5YmFSbE83SjhwaldkMGFPMmVyQmNyaW9XV1FvNUQ0bFlN?=
 =?utf-8?B?ajk4TWNrbnpMM1lBR2FZOElvSFJjeDNIbS80b1RRTXo1VWFUTWdjUXIrK0wy?=
 =?utf-8?B?NTF6K2NWcTUwSTFVSWVLcFhkNjhXMDREUENROWN6Qm9RZ0FjSXdxSXYvN1JH?=
 =?utf-8?B?WG1pYko3c1dwbHZ6QW5KK29NQWpQUk51Qm1qL01VRU0vOThnazVaMUZSU3FD?=
 =?utf-8?B?bGl6S2dQb2VPNEZ4YzZFVXdKSS9aWGxzVmtJV0pNa2liUWI0TEIyNjduVmNG?=
 =?utf-8?B?RVBPODB6T1dLcXN5SUZyQmxGUERNc1RyYnl4dFdmSUtZYjhqNjdRb1owQUNn?=
 =?utf-8?B?M25oWEUrenZGZzJ5cFYrTFNFSmFqUXJKU0JMRWlUZFEwTWgwWFpjOXkzd1l5?=
 =?utf-8?B?UU9EcitEK1ZvWHY2aElGaUtwRVBVdENUNnFGQmVqbEJRKzZOVUFkWlRMSDdi?=
 =?utf-8?B?Vnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57C05B5BEC2A3E4FA74563025CCC308D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 507500a8-904c-4854-9b48-08db1eeb2a40
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2023 09:05:57.7457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dJKbcV1bQUYgGqvHP5ziUXrYLtSWu35lFfPsr4OcU8QMAFExc19qK/hWjgfnXKzwIImobWukxQMfPNnbW5OVb4Zf1oT5IyC8djPvQcS3nnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3579
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 09:06:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178094

SGVsbG8gQWxleCwNCg0KWWVzLCB0aGF0IHdvdWxkIGFuIG9wdGlvbiwgYnV0IGFmYWlrIGl0IHdh
c24ndCB3b3JraW5nIHF1aXRlIHdlbGwuIFNvIEkNCndvdWxkIHN0aWxsIHByZWZlciBhIHN0cmFp
Z2h0IGZvcndhcmQgc29sdXRpb24uDQoNClNob3VsZCBJIHNwZW5kIHNvbWUgdGltZSBmb3IgY3Jl
YXRpbmcgc3VjaCBwYXRjaGVzPyBNZWFucyBpZiB0aGVyZSB3aWxsDQpiZSBhIHBvdGVudGlhbCBv
cHRpb24gZm9yIGJlaW5nIGFjY2VwdGVkPw0KDQpBbmRyZWoNCg0KT24gVHVlLCAyMDIzLTAzLTA3
IGF0IDA3OjM3ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gWW91IHByb2JhYmx5
IHNob3VsZCBtYWtlIGEga2lya3N0b25lIG1peGluIGxheWVyIGxpa2Ugd2UgZGlkIGZvcg0KPiBk
dW5mZWxsLg0KPiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21ldGEtbHRzLW1peGlucy8N
Cj4gDQo+IEFsZXgNCj4gDQo+IE9uIFR1ZSwgNyBNYXIgMjAyMyBhdCAwNzozMiwgQW5kcmVqIFZh
bGVrIDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+DQo+IHdyb3RlOg0KPiA+IA0KPiA+IEhlbGxv
IGV2ZXJ5b25lLA0KPiA+IA0KPiA+IEkgd291bGQgbGlrZSB0byBhc2sgeW91IGhvdyB0byBwcm9j
ZWVkIHdpdGggbXVsdGlwbGUgQ1ZFcyBmb3INCj4gPiBHb29nbGUgR28NCj4gPiBjb21wb25lbnQg
aW4ga2lya3N0b25lIGJyYW5jaC4NCj4gPiANCj4gPiBDVkVzIGluIGN1cnJlbnQgdmVyc2lvbiAx
LjE3LjEzOg0KPiA+IC0gQ1ZFLTIwMjItNDE3MjINCj4gPiAtIENWRS0yMDIyLTQxNzI1DQo+ID4g
LSBDVkUtMjAyMi00MTcyNA0KPiA+IC0gQ1ZFLTIwMjItNDE3MjMNCj4gPiANCj4gPiBUaGV5IGFy
ZSBmaXhlZCBpbiAxLjE5LjYvMS4yMC4xIGJyYW5jaGVzLCBidXQgYSBmaXhpbmcgcGF0Y2hlcyBh
cmUNCj4gPiBhdmFpbGFibGUgZm9yIGFsbCBvZiB0aGVtIHRvby4gVW5mb3J0dW5hdGVseSB0aGVy
ZSBpcyBtb3JlIHRoZW4NCj4gPiB+MTAwMA0KPiA+IGNoYW5nZWQgTE9DLiBTbyBub3Qgc3VyZSBp
ZiB0aGlzIGlzIHRoZSByaWdodCBhcHByb2FjaCB0byBhcHBseQ0KPiA+IHRoZW0uDQo+ID4gTm90
IHN1cmUgaWYgdGhlIHVwZ3JhZGUgaXMgYWNjZXB0YWJsZS4NCj4gPiANCj4gPiBTbyBob3cgdG8g
cHJvY2VlZCB3aXRoIHRoaXM/DQo+ID4gDQo+ID4gSSBrbm93LCB0aGF0IHRoZXkgYXJlbid0IGEg
Y3JpdGljYWwgb25lLCBidXQgd291bGQgYmUgbmljZSB0byBoYXZlDQo+ID4gdGhlbQ0KPiA+IGZp
eGVkLg0KPiA+IA0KPiA+IFJlZ2FyZHMsDQo+ID4gQW5kcmVqDQo+ID4gDQo+ID4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE3ODA4OSk6DQo+ID4gaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8x
NzgwODkNCj4gPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC85NzQ0NDU0Ny8xNjg2NDg5DQo+ID4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3Jl
K293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPiBVbnN1YnNjcmliZToNCj4gPiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWw0K
PiA+IGFsZXgua2FuYXZpbkBnbWFpbC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gPiANCg0K

