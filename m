Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672B9C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 01:29:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.682.1657157389136285642
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 18:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aSHf+7zb;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=41872ca0c7=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2670wrw4007551
	for <openembedded-core@lists.openembedded.org>;
 Wed, 6 Jul 2022 18:29:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=rdXipCjWDpf6JPNAfeh6LeQ3sD+ilGVlsvC9BwJg7uE=;
 b=aSHf+7zbvKXBjsc7YLnOukJJTDCv+PwZfOnGC12NvBO8147B+2Wo9Zs6PdiE1AGlGrKr
 E5ySeINg4SJ+h8a2rnvdyt9+b6vgPmVRugWdErHugJAC9F9IzmX9pJb9Gm3OhXTz4qWQ
 irsBKkl9gerV+0DH52yljy7pKKY2y769QPGV87frrZ5zvHvLsWkMw3KjkGPUZ3KiPly0
 suYfqJDfXKc3jsVdzUQk3E7+6wJTMFv/Gh7dJKDlba5duWSqWt4vYup0yFb8c1JKTES9
 Qwk+VYbt0v1ViyyTmc3WcROdQoUFujgHGvnNvw8b3hp8RDNiWP7sHF3MPP0njCh98rTH Mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uy0s1mf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 18:29:48 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2671TlPa008132
	for <openembedded-core@lists.openembedded.org>;
 Wed, 6 Jul 2022 18:29:47 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3h4uy0s1md-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 18:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F12W1uhSGgLiY0JzbMiz3+jqPRCXbRcHhZVZ0MsbKs9sixwuiLDFYfk4s6BmU0SFA0VWy50C7HBCept50H7RfoqC8YFRaufLX04DqGzk1oqhMZnI8//z2nB/TUCn0Ylu2sHGc9RF2qzL7gvpNuouUC+P9aTCXgvEa6IqqRCmO6wf1oU6j5sUjpN6P96XbG56ifEtnfWacg4I38SJZFkuLOQTrXkRYUDzBFcT2XrjAf0U1LMYWlG/uYufNkuKFXKLzkwpwvxqkBYd5IXodau7yvsr+OOTmIkta0hIe9EKkldjnm/ifwVRd5ZW031OpjYuUmouMx6EKtt/JjQP4ZEctQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdXipCjWDpf6JPNAfeh6LeQ3sD+ilGVlsvC9BwJg7uE=;
 b=XYVqH+e0vUXQ4w0b/fGuT2WnNdb6G/uloVtFBdHTpZXA89nf4XljvfS3Xc5TGjx/0Gh5aUulCVv8SSSGQY1cAuz3+IxhvLSHllxXqubF7Z2pjtPdPt90+4p9BnlY/uzSBF+pWD4exdCegxmP14JVwvH2SLYrksMWENsqblg3/REkSIm8Lw+vrSvliqj0ltD+Da2u/LGvzfk0dFqj78GVr4R+dV9HtooHg7jgsCehhgGSdzQiYQTcwO5liXSVtgjpgcxYAgzvQ8succCo+CKPlWinOcqL2oRLms9qOwMEPTfqhNPaj3Pu9JhAk3lzACC5miqFyZ3QHQZTnRoM11hUzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SJ1PR11MB6084.namprd11.prod.outlook.com (2603:10b6:a03:489::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Thu, 7 Jul
 2022 01:29:44 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::5cff:5bdf:9dcc:e393%8]) with mapi id 15.20.5417.016; Thu, 7 Jul 2022
 01:29:44 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: leimaohui <leimaohui@fujitsu.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Question about nativesdk-qemuwrapper-cross
Thread-Topic: [OE-core] Question about nativesdk-qemuwrapper-cross
Thread-Index: AdiQ6Emp1+TO49DUQvOutr2UU6Cf8wAMDqCAAB9Ii2AAAs6JoA==
Date: Thu, 7 Jul 2022 01:29:44 +0000
Message-ID: 
 <PH0PR11MB5611356C578CCD2075DA618EED839@PH0PR11MB5611.namprd11.prod.outlook.com>
References: 
 <OS0PR01MB6178C500A5157ED31549D49DA0809@OS0PR01MB6178.jpnprd01.prod.outlook.com>
 <8b13b18a7aa7568fc234d58e5871cf9adb3debd5.camel@linuxfoundation.org>
 <OS0PR01MB61787554070A3029E0F3C518A0839@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OS0PR01MB61787554070A3029E0F3C518A0839@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9NzBhNGVjNzMtYjQyNS00MGIyLTlhNGEtYmNkM2E0OGU1?=
 =?utf-8?B?NDljO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRO+/ou++gA==?=
 =?utf-8?B?776LO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX1NldERhdGU9MjAyMi0wNy0wN1QwMDowODoxM1o7TVNJUF9MYWJl?=
 =?utf-8?B?bF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfU2l0ZUlk?=
 =?utf-8?Q?=3Da19f121d-81e1-4858-a9d8-736e267fd4c7;?=
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89305cf2-1384-4ed0-837f-08da5fb82c05
x-ms-traffictypediagnostic: SJ1PR11MB6084:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 LBRlko0R6TzFnsLlgeLSnTBurRyXSWog7XnGYJwXiFNGWY40lACq6ZK6/3PFWkveoAmh3c9OombW1QQsiCAmHCk+jERY1xay+fZRCTpqnc7rF0uowgiqwyUnCw/419d+98ClKLnSaSQVTxWDucUqulZ9k5vn4BZmvilUy6etnbvxpUwKE2tuHvwNxhTIhlUcDlqX1snnFK0C79VduUL0XQrvapbpePWHbPaPoRbYnw6cJ4zv77nYMI33o8kSFLms2pOKfpOv1eZemoyGAnNOJ7n1hnNTjlwKeTBnLLr6IEjCP6AnoXvVgBC+qRcWT3Luq4Gv1d2ASMI1alJbru0OwcKe7Tkg1JDHGnvaBkyJMigjnrM07EVzu/5cJDeObdxpbNOSCxFFyLMAB/ctdTaWUrdFTcqSuL9A/reRdqP3paSua08aMY+uNiY1kuHC9cOH8syF2UHo4iJlHwzfFDdh9C96ej44bOqPALVbUA2AgCgt5DdyUJ5iomJzRed77psgijOj3q4bUl7SuuTVUwxS5gU9vP8bmZP2ADfbzBjWjNlSF7xHLm18IuCcDtoDm/ectkR71XxR1yFwh+dg+YXv5octtXdfsnK+hIBWcQWCguNSAXYPx0MYkXt18OFVBPgHFAzXU73YdB4jrKk5578Kg3nFLTwGTXKMFkMMRXhL/jaOF7vdpLQi8zfgNyRHY2ex7hENQnP4Nm6NSjqSBSE1uv0PuLmtXb6A7ixvoyr3t7EWHyksQf+XUfcWp6+PtR/aieqEt/xckJPZmPjjYXztbtEhB+LFVLDlNsVoqvd1ngD8sks3F8vuMVFoFz+o5CY8VhQwW4Q1Ixjg4gItUncgLQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(366004)(39850400004)(64756008)(38100700002)(316002)(76116006)(66476007)(86362001)(66446008)(110136005)(71200400001)(66946007)(66556008)(53546011)(6506007)(7696005)(41300700001)(8676002)(122000001)(186003)(26005)(478600001)(2906002)(38070700005)(8936002)(5660300002)(52536014)(55016003)(83380400001)(33656002)(9686003)(9126006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHdFejhkelJSRjMxMjRhOVdrUDVLM0RZL3lOZkZCUEhKcHJBZFF0dGh6emR1?=
 =?utf-8?B?aDRWakRGOHlKdVRPZFY5QjUxYTI1VzVJSEtIbVNpN3o5Q0VKYnh6SnNGWENG?=
 =?utf-8?B?ajVsZUFPaWZ3QUROTE1XYmxXT3pmSVNVQWxKMm9LWFhLVFJmL1VnUUdrUHNu?=
 =?utf-8?B?Q2VoNCszbUJzRkJROXN1Y0lQZVQ3Nm9JT3hncmkwS3E1VjlQZ2RTaXQrQ1Nu?=
 =?utf-8?B?OS92cndZdThHdFdUdnNYVjV3ZXBLdy9MendQOCtERW5FTmxjZzdEU0hYNGM3?=
 =?utf-8?B?dFNHL05vaEo4WXpteCtwbHpneFUyQVk2RVNBZkorSFhqWEh3UExjMFU0Wmtz?=
 =?utf-8?B?Rkx4WUR3SjRxRFc4MGlHWUJZSkRqWXp3YnpEVU9wY2pmRGNzRUhkaVQzZ3N6?=
 =?utf-8?B?YTVWYXJRZUF3WHN4aUlacHEzMW9MbnZPcDlCbFBBUUFwWXBxZ2VQMU5UOGdv?=
 =?utf-8?B?MUVEdDE0b3l0SjNDTVB2V3dySzArdGUycG5lK3lYVWJ5UkozYXJTaDQ3ekww?=
 =?utf-8?B?b3h5N2pxVEV0QVE2WlFqSGpDM1diWThNclJ4bk14NVcvNy9oK2pQMDM5UE9H?=
 =?utf-8?B?ekFZVnA2L2N1ZmdlYUtNdFZudmhsM0g1QTNxNGlXN0ltTUFtMCtWcHNZMi9S?=
 =?utf-8?B?YXZHNGlRTmJmM0NkL3Nxa3FzdkVSa2xPLzhkblVIcVZsL05pT1hwaTlyaGpG?=
 =?utf-8?B?K0ErcFpRME5kQWFUam5GQWRwbHlPK1VzSXlLN0w3cDVvQlhlek1od3RQNUJh?=
 =?utf-8?B?eVQvUndHT0VRQTd6amJrVVFFMkxRYnZlNmJHREJZeS9BUWgrMHAxMzV0dWVY?=
 =?utf-8?B?Sm16Z21DVGpFM0tMZ1VvS3pzcFJxQ3NibFREcTZLbFJoTmtsSkFSMFpqT29C?=
 =?utf-8?B?cDkwYUUyTHJjcEFydUdxcG1oN3JEY3BvWXZFZ3FWWGtTc2VxcDlvaDAwWFEw?=
 =?utf-8?B?TDU0R0NhWU9GOVFza3BjQnVtbEljdHgzMXI3bnhOcFVUT0N1am9ORnNzcHFJ?=
 =?utf-8?B?TlZXZXRjKzMzZkZ2TmNtZFZBRVRXZnhGbitaV0xhUHBSMjBuVmdzcFhXYjN2?=
 =?utf-8?B?aURmejlNYzgvR3hSa1UrbDZkRlJvY3NUQUR3b0gzbjU0SDJiRUZIbWR2OGdq?=
 =?utf-8?B?U1MvZkpvblYrWkJva0swZGhCYXF2YVJBRWlxVEhUUllrUHRnVkg1Y1MzZ09n?=
 =?utf-8?B?K2Y2cC9PTFFUYjhYcEUyRXVpbVcvbk1ETWN1UU9YVjNHVTdBcHVHYTFhTTFK?=
 =?utf-8?B?ZWRCTmRRUzBhZjFhbWYyMytaQTNyalVCeXBoYTQ4VU1taWxKZXF6N3dsK2tP?=
 =?utf-8?B?QjhtUlYrcjlWMjlualJid2hWU1VIZkUrY2RrVENlcjFiZ0JVaDlVK2tKYUtp?=
 =?utf-8?B?bUd0Vm95UTFhL3FJQVM1aVArOVh0WG5raVFrRTNhUVJybVQ0bG12Rll1RnRx?=
 =?utf-8?B?d0xqRHFVZUdobWszRXBCUHdCYStxQkpFbzJEbVVJbUZMU3k2MFdXNzJBMnk0?=
 =?utf-8?B?UnY3Y0lmRWNpU3Faa3JrVzA5YlFIMEZLRHh4QU1mWVo5Q3FOci9oMzA5QnBw?=
 =?utf-8?B?NVRmajM5NFEvOU1OZG1XWTIxN2h5RVVIZ2owazBEdzY5NllEbTl6eWtXanF6?=
 =?utf-8?B?N2U5QlZSL3VBampVQkpSS3lQaVhXZDBUeks1VTBkU1RtcmZ2aHhwR2xpWXNr?=
 =?utf-8?B?eW0zSTMvd2ZwOWhqN1kzdnRHRFNxM3o1RnNDeTNEZEV0V1o5VzBIRHdES2V0?=
 =?utf-8?B?aXU2cTd1eHkrL2NiQ3lPMENpMHQ2ZTF5WTIwdnV0V3c3UTNBTDY1WXJxcHVC?=
 =?utf-8?B?MXZheWYxeUlFeTdkd3FEU0cyZ3FoNk0xNVp6THQwRVNJNmd5cU4wdkEzdHdB?=
 =?utf-8?B?RllibXp3cS9wMWNmZkFSQWtLZytpNXk2L2lSU1lMR3U0T0hzWTRra2Q3SVpp?=
 =?utf-8?B?ZjJUQjFVS0dPNnIyQm5IQjJiN3A5RlpCUkVKRWltZ0FUSTh2cWRiV3dwbmJq?=
 =?utf-8?B?aW5JUnlENDFZUjRvVi9Lb3VHeTZjVW9scnZlOUUrNWU3cE1oZGdxS1pLOTJB?=
 =?utf-8?B?ZlJqQjh4cGIwL0JiWXFFUnhIVFc1WHJ0MmxpN2F3ZGcxcG8xd2MyYXVvUkRE?=
 =?utf-8?Q?Ry+K84AOyn4NQur4e3jCoEPU2?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 89305cf2-1384-4ed0-837f-08da5fb82c05
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2022 01:29:44.3370
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 jrMpMYGfpDEgMFB44m3dWVdrTw5Cx+QVvpJ920zN3I5/6/MCc9tZPn6HivjHuNeuMRpjXim5o5TOUXLfwTXYqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6084
X-Proofpoint-GUID: TpFiU1KiIkqBBYjhv7l4OFYKd-Py47hC
X-Proofpoint-ORIG-GUID: L51u5t8d5nGziPX38nKt5xYnBe5MaYfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 mlxlogscore=903
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 01:29:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167755

QXMgZmFyIGFzIEkga25vdywgcWVtdXdyYXBwZXItY3Jvc3Mgc2hvdWxkIHdvcmsgaW4gc3VjaCBj
YXNlLiBZb3UgbmVlZCB0byB1c2UgcWVtdXdyYXBwZXItY3Jvc3MgaW5zdGVhZCBvZiBuYXRpdmVz
ZGstcWVtdXdyYXBwZXItY3Jvc3MuDQoNClJlZ2FyZHMsDQpRaQ0KDQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
ZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9m
IGxlaW1hb2h1aQ0KU2VudDogVGh1cnNkYXksIEp1bHkgNywgMjAyMiA5OjA0IEFNDQpUbzogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBvcGVuZW1i
ZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFF1ZXN0aW9uIGFib3V0IG5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcw0KDQpIaSwgUmljaGFy
ZA0KDQpUaGFua3MgZm9yIHlvdXIgcmVwbHkuDQoNCj4gQSBuYXRpdmVzZGstcWVtdXdyYXBwZXIt
Y3Jvc3Mgd291bGQgcnVuIGJpbmFyaWVzIGZyb20gdGhlIFNESyB1bmRlciANCj4gcWVtdSwgc28g
aWYgU0RLTUFDSElORSB3YXMgeDg2LTY0LCB0aGF0IHdvdWxkIGJlIGNvcnJlY3QuDQoNCk9LLCBp
dCBzZWVtcyB0aGF0IEkgZGlkbid0IGdldCB0aGUgdXNhZ2Ugb2YgbmF0aXZlc2RrLXFlbXV3cmFw
cGVyLWNyb3NzIGV2ZXJ5IHdlbGwuDQoNCj4gSXQgc291bmRzIGxpa2UgeW91IHdhbnQgYSBxZW11
d3JhcHBlci1jcm9zcy1jYW5hZGlhbi0ke01BQ0hJTkV9IHdoaWNoIA0KPiBpcyBzb21ldGhpbmcg
ZGlmZmVyZW50Lg0KDQpUaGUgcHJvYmxlbSBJIGhhdmUgaXMgdGhhdCB3aGVuIEkgY3JlYXRlZCBh
IHJvb3RmcyhhYXJjaDY0KSB1bmRlciBTREsgZW52aXJvbm1lbnQgYnkgbmF0aXZlc2RrLWRuZiwg
dGhlcmUgd2VyZSBwb3N0aW5zdGFsbCBlcnJvcnMgb2NjdXJyZWQgd2l0aCBzb21lIHBhY2thZ2Vz
KHN1Y2ggYXMgZ2xpYi1uZXR3b3JraW5nKSB3aGljaCBpbmNsdWRlZCBwb3N0aW5zdGFsbCBzY3Jp
cHQgdXNpbmcgcWVtdXdyYXBwZXIuDQpTbywgSSBhZGRlZCBuYXRpdmVzZGstcWVtdXdyYXBwZXIt
Y3Jvc3MgaW50byBtZXRhLXRvb2xjaGFpbiwgYW5kIGhvcGUgaXQgY2FuIHdvcmsgYXMgcWVtdXdy
YXBwZXItY3Jvc3MgdW5kZXIgYnVpbGQgc3lzdGVtLiBCdXQgaXQgc2VlbXMgdGhhdCBxZW11LSR7
U0RLX01BQ0hJTkV9IHdoaWNoIG5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcyBwcm92aWRlZCBj
YW4ndCB3b3JrIGZvciBhYXJjaDY0IHJvb3Rmcy4NCkkgaGF2ZSBubyBnb29kIGlkZWEgaG93IHRv
IGRvLiBTaG91bGQgSSBhZGRlZCBhbm90aGVyIHFlbXV3cmFwcGVyLWNyb3NzIHN1Y2ggYXMgcWVt
dXdyYXBwZXItY3Jvc3MtY2FuYWRpYW4tJHtNQUNISU5FfT8gDQpJIHdvbmRlciBpZiB5b3UgY2Fu
IGdpdmUgbWUgc29tZSBhZHZpc2VzPw0KDQpCZXN0IHJlZ2FyZHMNCkxlaQ0KDQoNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVy
ZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSA2LCAyMDIy
IDU6MTIgUE0NCj4gVG86IExlaSwgTWFvaHVpIDxsZWltYW9odWlAZnVqaXRzdS5jb20+OyANCj4g
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
UXVlc3Rpb24gYWJvdXQgbmF0aXZlc2RrLXFlbXV3cmFwcGVyLWNyb3NzDQo+IA0KPiBPbiBXZWQs
IDIwMjItMDctMDYgYXQgMDM6MzEgKzAwMDAsIGxlaW1hb2h1aUBmdWppdHN1LmNvbSB3cm90ZToN
Cj4gPiBIaSwgUmljaGFyZA0KPiA+DQo+ID4gSSBhZGRlZCBuYXRpdmVzZGstIHFlbXV3cmFwcGVy
LWNyb3NzIGludG8gbXkgbWV0YS10b29sY2hhaW4sIGFuZCANCj4gPiBmb3VuZCB0aGUNCj4gY29u
dGVudCBvZiBuYXRpdmVzZGstcWVtdXdyYXBwZXIgc2NyaXB0IGlzIGxpa2UgdGhlIGZvbGxvd2lu
ZzoNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAjIGNhdA0KPiA+IC9vcHQvcG9reS80LjErc25hcHNob3Qv
c3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvdXNyL2Jpbi9jcm9zc3NjDQo+ID4gcmkNCj4g
PiBwdHMvbmF0aXZlc2RrLXFlbXV3cmFwcGVyDQo+ID4gIyEvYmluL3NoDQo+ID4gIyBXcmFwcGVy
IHNjcmlwdCB0byBydW4gYmluYXJpZXMgdW5kZXIgcWVtdSB1c2VyLW1vZGUgZW11bGF0aW9uIHNl
dCANCj4gPiAteA0KPiA+DQo+ID4gaWYgWyBUcnVlID0gRmFsc2UgLWEgIm5hdGl2ZXNkay1xZW11
d3JhcHBlci1jcm9zcyIgIT0NCj4gIm5hdGl2ZXNkay1xZW11d3JhcHBlci1jcm9zcyIgXTsgdGhl
bg0KPiA+ICAgICAgICAgZWNobyAicWVtdXdyYXBwZXI6IHFlbXUgdXNlcm1vZGUgaXMgbm90IHN1
cHBvcnRlZCINCj4gPiAgICAgICAgIGV4aXQgMQ0KPiA+IGZpDQo+ID4NCj4gPg0KPiA+IHFlbXUt
eDg2XzY0IC1yIDMuMi4wICAtRQ0KPiBMRF9MSUJSQVJZX1BBVEg9JEQvb3B0L3Bva3kvNC4xK3Nu
YXBzaG90L3N5c3Jvb3RzL3g4Nl82NC1wb2t5c2RrLWxpbnV4DQo+IC8gdXNyL2xpYjokRC9vcHQv
cG9reS80LjErc25hcHNob3Qvc3lzcm9vdHMveDg2XzY0LXBva3lzZGstbGludXgvbGliIA0KPiAi
JEAiDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiBSZWZlcmVuY2UgdG8gcWVtdXdyYXBwZXItY3Jv
c3MsIGl0IHNlZW1zIHRoYXQgbmF0aXZlc2RrIA0KPiA+IHFlbXV3cmFwcGVyLWNyb3NzIGlzDQo+
IG5vdCBjb3JyZWN0Lg0KPiA+IFdoeSB0aGUgInFlbXVfYmluYXJ5ICIgaXMgIiBxZW11LXg4Nl82
NCI/IFNob3VsZG4ndCBpdCBiZSAicWVtdS1hYXJjaDY0ICI/DQo+ID4gSXMgaXQgYmV0dGVyIHRv
IGNoYW5nZSBuYXRpdmVzZGsgcWVtdXdyYXBwZXItY3Jvc3MgdG8NCj4gcWVtdXdyYXBwZXItY3Jv
c3MtY2FuYWRpYW4tJHtNQUNISU5FfT8NCj4gDQo+IA0KPiBBIG5hdGl2ZXNkay1xZW11d3JhcHBl
ci1jcm9zcyB3b3VsZCBydW4gYmluYXJpZXMgZnJvbSB0aGUgU0RLIHVuZGVyIA0KPiBxZW11LCBz
byBpZiBTREtNQUNISU5FIHdhcyB4ODYtNjQsIHRoYXQgd291bGQgYmUgY29ycmVjdC4NCj4gDQo+
IEl0IHNvdW5kcyBsaWtlIHlvdSB3YW50IGEgcWVtdXdyYXBwZXItY3Jvc3MtY2FuYWRpYW4tJHtN
QUNISU5FfSB3aGljaCANCj4gaXMgc29tZXRoaW5nIGRpZmZlcmVudC4NCj4gDQo+IENoZWVycywN
Cj4gDQo+IFJpY2hhcmQNCg0K

