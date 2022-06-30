Return-Path: <shruthi.ravichandran@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A84C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 22:30:14 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
 [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web10.31503.1656628211863214415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 15:30:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=SBJ4DgsU;
 spf=pass (domain: ni.com, ip: 148.163.158.57,
 mailfrom: prvs=4180d956a9=shruthi.ravichandran@ni.com)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25UJ8GjA024835;
	Thu, 30 Jun 2022 17:30:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=PPS11062020;
 bh=uAasc7i+JKnPEyHtUiY5/+Ye5E1SbK4cBezB9VG5MR8=;
 b=SBJ4DgsU0rkYA+O71ftsLOyxFz2K0ka88UG8KBACfkNNLf+hQuu9Kwbpr1OddalOlINk
 Cy401gjwFa1zjHiDHOthKcSfP204gC/VA7iidv0b5Pp7+HnCyCi+xOlv0vhjK8CjrJ0X
 pSPvLFnsMzoKtbv/A9X7AliJVI7eyI8BiCIIQJBqpOzAUaHLDzJVasERVzIVAqJPJ8NG
 mJX3HCSvUGBDb/HyyJrX3uJkv+aqR7FaszAvBmcpwisPmQN4/Yr1+CrXs7xYQE6vcH9l
 B4pjMJMWW1vXwOQQCDS53Hq66Bd5aMv8+j94pDZF9fyEv1HDrjCfPx5McEn54fDNP4cj cA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
	by mx0b-00010702.pphosted.com (PPS) with ESMTPS id 3gx0673jrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 17:30:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H9jZhpCOWKGagxnK71V75fp7pbVVAa8UeVzq2FzmXo5M3dRVZ6peKAii8IbOA7I+x+L8u2Wr5o4xxTcj7D9Rc0FCDuDNWc6oEnazvDIK5lHHcM78aitp0s7l/uzgdcmqJ3O9LgqVpEBoAjkKbnNoKqT/6rr3QYmXi3ZbGJKpLmpQvPFaI3bxGCIr0eHPfaabZn7a2neeigIscLzHhzoXvKWRNb9IkFKfnr1EYKJ0+Ug7fjRiANciAaQa6vtN7HDLRdxHyJxxV69XKvk6N4EXgmTwT2/TNXOFiYaKpsC4TEoJo76D4DT1x8jkljHFFxS3Ng9DKywDCSJ5egWpxzlFgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAasc7i+JKnPEyHtUiY5/+Ye5E1SbK4cBezB9VG5MR8=;
 b=ngZvwhw3xZe8/EMx1Vgh5DYuLwPYVexiXb2IEE2+UmmltpOCa6dUmeUZraUspcqDxLGVquBhB5Bm11dXdlDweJsiJXpSbdmQPC4rnWIfk+EG1SLPgpbRhKgxbGpDJnoLofmVawoyS7udfC6gAspRwsokiVq4b3uofGN1ninwshG4YJ6A1HD8n8HNNZmAVaCQns9Q6NNeFi95dZWzE6IS8SmTf6JN1ztDq4AbIFKt6IxpUOd4FGDy6Khe7g3IMlq4P/8tyqM0bVVMgBCsdkMih2lw7YtcfMINmHxBoYvKhCw2YDgZBeG5cnkLm7/YxOS5yAKsvPp94sH+NNDHXrQhlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAasc7i+JKnPEyHtUiY5/+Ye5E1SbK4cBezB9VG5MR8=;
 b=FQ4YVTQmzrccdw+BBlX0FjGaQ02CWK+UZ5czWSwF+PrICvK/N+uCgknDmzQPl7I/7YIW98DWTf2esI2X0VeqGoU2K+WnWpZV+b3d1p8NWIcjAoJ7W+c+Jp3v74HLbpOgFvnTQtZmyb3b6Ei9Y5MZ4NQD6XhMK1LrK7biYMgwkg0=
Received: from SN4PR04MB8365.namprd04.prod.outlook.com (2603:10b6:806:200::20)
 by MWHPR04MB1054.namprd04.prod.outlook.com (2603:10b6:301:42::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Thu, 30 Jun
 2022 22:30:06 +0000
Received: from SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::c160:6c81:9bdf:314b]) by SN4PR04MB8365.namprd04.prod.outlook.com
 ([fe80::c160:6c81:9bdf:314b%9]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 22:30:06 +0000
From: Shruthi Ravichandran <shruthi.ravichandran@ni.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
Thread-Topic: [OE-core][PATCH] package_manager/ipk: do not pipe stderr to
 stdout
Thread-Index: AdiM0KecQZeLMSQtQ/uuNLh7+52N+g==
Date: Thu, 30 Jun 2022 22:30:06 +0000
Message-ID: 
 <SN4PR04MB836516C391002BA878B9E828E4BA9@SN4PR04MB8365.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ActionId=66bd6427-3ed3-4ff9-9213-bda5bf0edfce;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_ContentBits=0;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Enabled=true;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Method=Standard;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_Name=Internal;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SetDate=2022-06-30T22:27:38Z;MSIP_Label_76122db4-a595-414e-9ece-6adfb473e1a0_SiteId=87ba1f9a-44cd-43a6-b008-6fdb45a5204e;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: abfd95de-0c78-4508-f822-08da5ae8159a
x-ms-traffictypediagnostic: MWHPR04MB1054:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KFqWJMWbUYqwLQsaUUL1jg7lD2A+RDkvMSPwBpWaWc7qih+LfuuDVEduMo5oG9G30CfsuWbuoZzGznygR68QxHFW9sQVXm7LUp0hJBngWi8JFr3mpsfU5jLWFk+nZzipZsnUJf1wam5DzY9hckvhxl5zWAxtTDL8uOswyBvDK7MOV7kn2Jx0ckZd7iQa5UrbNSkDMueQtwTNgd/VbMDFK9X4c9f8Evfli/cK64XXXIEmaOT1jGn7IIgc4KbUxS9qXsWnxD9WW6LNrlE3hrlU1+fWQCCbbWR5OVAL+pB8OGhjohaQlO3+gFMw171xYz7rEHqCTK/T3c7QB40DLTeM1VIGwi8VP5xq1hVRDmNPkTUNVUmC4qU/D9OcVQS/321KpuBkiI/zfzez5uVhYak6Yw5R66S70MttniCG6gIRJcka9bCZhNGAb1SAvpd0R2EfzM+HcvtMRqyYLU280mBHcTzW0c1cZpOKMseBvyioO0OKk/Rec5iXPkHcfGraEMIDDB+q93JQ3gpuKGPOYSBXdkfqBoeo4HB4hYV8PnzJaCJb8x7yjUc6k7q/lIaEtRz9i3qIyYkSM5MS4C8DcxX0k0ohH3/6Jjnhik7lVnCC9Kd6EbkGYnChXstOtzOzQJpppR3AxfPKNyu8fiO/gJVGPo90VjCxBqoOIc/D6p1utfpmpwUFWfv3CrMhPII8orgte5DZKuzV13Lgg0RAG+68wtODg9glhpleb6fAKIedjbIRFHF7tZYVnK9CFm8M+nVgv9JnY3hijv0o6T4XioqqeNo1dyflGA0DC0//5ODByU/QA3HrXj+TkZo/mJ2MYMsvwTqS7sEdgeGIvkrdhm7Z1BaMy1zRF22r7060SlCmdq6ZM6tXzY+MiQZEsPqPH1WfxSuK0y7Nb9sZl27Pf8ZE6g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR04MB8365.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(366004)(39860400002)(376002)(136003)(6916009)(38070700005)(8676002)(66556008)(76116006)(316002)(86362001)(38100700002)(478600001)(33656002)(122000001)(41300700001)(44832011)(71200400001)(83380400001)(53546011)(55016003)(6506007)(7696005)(9686003)(2906002)(5660300002)(66946007)(966005)(186003)(52536014)(8936002)(66476007)(64756008)(66446008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q1hpWmlRRDgyUDAvMG12aW1oR1pUeVNTSkE2SmUzaUtNOXNDV1JWdnFPZTJj?=
 =?utf-8?B?V25MOEV5OWdWY3c0cTRNTHlsQ0NpZVRRajBCTktSdG5KcGF5ZlRjZ1NiT080?=
 =?utf-8?B?dWlXWGcyMDI5UGlSc3lDb2pvbWNTeUVmMW02UVlacERReGRBdC8zUXVRbjFu?=
 =?utf-8?B?dGowNk5oeC9zTDVCaUZuSzJYcjVlVEV5bVEwNVhuU2NPS2p1OUFjMXRzREdG?=
 =?utf-8?B?aFZXS1B5aE9vMnE3TDZvcUs5S0NTWTN2UUc1N3RIbXN6Y2VoYVREY0dMNkxQ?=
 =?utf-8?B?R2czL0FIYmxzTzA2R1M0cDNCUUhVVWEyb0Z5d2oxbm92MXVwYjA2d1Y0TWY4?=
 =?utf-8?B?MkovSkRvOHBqS3NJUHNzeGdxa3RGdzZJb3R2UzhTdWFPT2Z2SzBRajY4aFg0?=
 =?utf-8?B?ODNSNXlrYVlFMnVYQVlYSVZUODYrY1pJTmd0OWlUQ3FKbkpZRGNOL0E0RjQ3?=
 =?utf-8?B?cVE1ZGtuTFQ1ZkVSbnUrRG1TNUhzaUZJT1NYMkxRSGhkR29ucVZNN1FMOG5s?=
 =?utf-8?B?NFhFa3hKVElPYTlQelhVeVI3a2VkR0I2L29WRUlOR2VtQktKd0pZc3U5bVZl?=
 =?utf-8?B?TTQ2Vkg2RGZUdGtKYUZHenVBNVNiUGdyTFdBTHRTS0lWbjAxQ25sQXV4YmlT?=
 =?utf-8?B?NFA5ZU9DOHFTTGdDV2FZbmN4dW5rTmdHcko5cHphK21XWGZXRVNSYnR3RkRi?=
 =?utf-8?B?MHFIY09pVVhTQ1ViSlZ3c2g2THBVTmRxTnlTTE9vY3BEbjVoWno3OEROSnFD?=
 =?utf-8?B?bDhyL1h2Mm9mNXdNL2NUVUl2c3hGQ2U5b0t5bWNZSk5KV1lFY0JPUTd4N1NL?=
 =?utf-8?B?VzVmWXptWUdqbFBTS0JSSFdXOFNOZmU0dW9tK2t2djF4ampBUWtyWmRQWnVy?=
 =?utf-8?B?bTh0RUhSbldXa3lwM3hxdXdXOFRRWGIyQUxXTEhqejQ2ZUswWGxFWU5iTXFr?=
 =?utf-8?B?cU1UTW1sNE5BQWpOamVZanFpUVdrQTZRNnFDejY4Ry9zN3cxa1lFSGF6MURS?=
 =?utf-8?B?M1VKeWhQb2djdHUwWklJbSt0eHBJNE9OQ2Mvc2dWM00xc09BK2hKaFYzaHRI?=
 =?utf-8?B?dlFuNnphWlMxeDFndnJSbTdoUGJJT2I4MmxVQ09hNmhuYVJlWmd0V2E1UFJR?=
 =?utf-8?B?Rnk2UGFPVDhxRUpwZkovVjRlZk1yVzJYZXJMVEZLTnNSd0F4MVdma0ZWa2FI?=
 =?utf-8?B?RGpkQUFKMEVMQzdOUTJpV1ZMclUvYmNCRG5yWEtIZFRZTXpOSExWb0xzOW9M?=
 =?utf-8?B?cCtxOHFoV3luK0hlUmZiMFN5eXUyNm52cWxJZEk1dG5lU2xodmE4Zys5dkNj?=
 =?utf-8?B?Q3QxcGN6YU1zS2cyWE5XUmhIUklqV3FzRkpjNkFkcU1odjhPNVZjNGNJc0pS?=
 =?utf-8?B?UFpsa3QyVU01WnBDQkF1bEpXbHMxU1lvb1QwNlNwVFRjS2FjS1hyeHZrYjMy?=
 =?utf-8?B?d1pVMDJRU240VStHNXlDTGo4TW5RZnJTek1GRTFJU3BscWovTjkyUGpiUFND?=
 =?utf-8?B?QVc1ckxEbUw5NWEzNUFPZXh6U1hPSVpldHZTZVFhU01GNzRmVzVVZXZiV2pq?=
 =?utf-8?B?amM2em5sMHhiN1hxY0MzOGdqU01PbEpDRmRoU0tDK3IwaFFNSURaWGRqcUMw?=
 =?utf-8?B?RFUydk9yeDBuL3NUOWpKMkhlWWxpYk9tRnhJQVRHYVFyRjJwRnBkdkxaNkt5?=
 =?utf-8?B?dWdUbFc2TGdxRnVQZ1JEeHN2RE1uOEErTnhZQ0hqNE9zVU9tNUFVK013aGtI?=
 =?utf-8?B?MFliZDdMNWd2N3RTWEVuaXZYaE1ZTXlKWmFnRC9nYitaWDJ5SUg5OFQxQzd0?=
 =?utf-8?B?TjJ2M3IrbFZtakFpTk8zb1VuYWIrbkFUeEd5dU0rWTAzSHNsZG1JaGs2RW1z?=
 =?utf-8?B?SG1xckZKdytJd0lOTlZDaGFUWW1JT3kyMzhlazVIbjhJbVdNQUNEaU56Qy9S?=
 =?utf-8?B?T0lYUEtDOVNmWGx6WXBKakIzVXI4YjY5eVZxWnQ5bjY0VWpwT0ZoRFJRMmlS?=
 =?utf-8?B?M1p2c1hQUzBqMkxZOENGQ29uNXEyWnN1VDRkdzJ6RTNjUXBUeDdObWFidFUr?=
 =?utf-8?B?U3Y1UnBkTzdDZC8xeGVpRTBoZ1BuMERWZS9LYVl0NjFxSVZLM2JORlVlelpq?=
 =?utf-8?B?d3JDMXB4RDlHVXVVZ1JxcGlER0E3WlRGNDZPY0JmblJpNWcwWnlUaWNqaGdy?=
 =?utf-8?B?ODVFZWFWZWEvcnh2K0pKakV4bFJRcm1OaXZCbExPYTgrSUlCUHBVa01qblNJ?=
 =?utf-8?B?MjZVSjgwRk5FUElxRGFkQmNmY1pnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR04MB8365.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 abfd95de-0c78-4508-f822-08da5ae8159a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 22:30:06.7267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 zmq+83RSUAtW1Ez3SSCA+yEnBGjLcMaDp4haqU7hbJ3mCEe+HA6LUFJqd8l9kLVYEqu8wpqwjGriswEftrpHZLS/keu6Me/MTNY22ulIXjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1054
X-Proofpoint-GUID: 8Qu-_56thW9zKkdLfa09duX5b_fKCYYZ
X-Proofpoint-ORIG-GUID: 8Qu-_56thW9zKkdLfa09duX5b_fKCYYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
 score=30 spamscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 22:30:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167446

VGhlIGNoYW5nZSBjdXJyZW50bHkgZG9lcyBkaXNjYXJkIGV2ZXJ5dGhpbmcgaW4gc3RkZXJyLiBJ
IGNhbiB1cGRhdGUNCml0IHRvIGNhcHR1cmUgc3RkZXJyIGFuZCBwdXNoIGl0IHRvIGJiLm5vdGUg
b24gY29tbWFuZCBzdWNjZXNzIGFuZA0KYmIuZmF0YWwgb24gY29tbWFuZCBmYWlsdXJlLiBJbiBm
YWN0LCBJIGNhbiBtYWtlIHRob3NlIGNoYW5nZXMgdG8gdGhlDQpzZXZlcmFsIG90aGVyIGluc3Rh
bmNlcyBpbiB0aGlzIGZpbGUgd2hlcmUgc3RkZXJyIGlzIHBpcGVkIHRvIHN0ZG91dA0KdG9vLiBX
b3VsZCB0aGF0IGJlIGFjY2VwdGFibGU/DQoNClNocnV0aGkNCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWls
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bmUgMzAsIDIwMjIgMTo0NyBBTQ0KPiBUbzogU2hy
dXRoaSBSYXZpY2hhbmRyYW4gPHNocnV0aGkucmF2aWNoYW5kcmFuQG5pLmNvbT4NCj4gQ2M6IG9w
ZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtP
RS1jb3JlXVtQQVRDSF0gcGFja2FnZV9tYW5hZ2VyL2lwazogZG8gbm90IHBpcGUgc3RkZXJyIHRv
IHN0ZG91dA0KPg0KPiBUaGFua3MgZm9yIHRoZSBpbmZvcm1hdGlvbiAtIHBlcmhhcHMgdGhpcyBz
aG91bGQgYmUgYWRkZWQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlPw0KPg0KPiBEb2VzIHRoaXMgY2hh
bmdlIGRpc2NhcmQgdGhpbmdzIHRoYXQgYXBwZWFyIG9uIHN0ZGVyciBjb21wbGV0ZWx5LCBvcg0K
PiBkb2VzIGl0IHN0aWxsIGdvIHNvbWV3aGVyZSB3aGVyZSBpdCBjYW4gYmUgc2VlbiBsYXRlcj8N
Cj4NCj4gQWxleA0KPg0KPiBPbiBXZWQsIDI5IEp1biAyMDIyIGF0IDIxOjIyLCBTaHJ1dGhpIFJh
dmljaGFuZHJhbg0KPiA8c2hydXRoaS5yYXZpY2hhbmRyYW5AbmkuY29tPiB3cm90ZToNCj4gPg0K
PiA+IEhpIEFsZXgsDQo+ID4NCj4gPiBJJ3ZlIGZvdW5kIHRoYXQgc29tZSBPRSBjb21tYW5kcyBw
cmludCBhbiBlcnJvciBkdXJpbmcgY2xlYW51cCB3aGVuDQo+ID4gdGhlIHRtcF9kaXIgZG9lcyBu
b3QgZXhpc3QgYW5kIGFuIGF0dGVtcHQgaXMgbWFkZSB0byBkZWxldGUgaXQuIEkndmUNCj4gPiBz
dWJtaXR0ZWQgYSBwYXRjaCB0byBvcGtnIHRvIGZpeCB0aGF0Lg0KPiA+IExpbms6DQo+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL29wa2cv
Y29tbWl0Lz9pZD04ZGZkZGE4NmFmZDQwN2E2NmUzZGMwMGEwNzdiZGNjOGI1M2Q1NGVhX187ISFG
YlowWndJDQo+IDNRZyFvbURySmZicmpsTGJZMk9NZ3NBZ1FySWNuYXAyMjJqcmpaSkFoSlhfQldo
VkpmTWkwOTQxOVFBSEgxYlZmMVZhZndNUmNWdVdCYVE1azh5NmdrLVctaUxqaDQ4JCAuDQo+ID4g
VGhhdCB3YXMgdGhlIG9uZSBpbnN0YW5jZSB0aGF0IHdhcyBjYXVzaW5nIGFuIGlzc3VlIGluIG91
ciBidWlsZHMuDQo+ID4gVGhlcmUgbWF5IGJlIG90aGVyIGluc3RhbmNlcyB0aGF0IEkgZG9uJ3Qg
a25vdyBvZi4gR2l2ZW4gdGhhdCwgSSB0aGluaw0KPiA+IHRoZSBwYWNrYWdlX21hbmFnZXIgY29k
ZSBzaG91bGQgYmUgcmVzaWxpZW50IGFnYWluc3QgYW55IHN1Y2gNCj4gPiBtaXNjZWxsYW5lb3Vz
IHN0ZGVyciBtZXNzYWdlcywgd2hpY2ggZG8gbm90IHJlc3VsdCBpbiB0aGUgY29tbWFuZA0KPiA+
IGl0c2VsZiBmYWlsaW5nLg0KPiA+DQo+ID4gSG9wZSB0aGF0IGhlbHBzLA0KPiA+IFNocnV0aGkN
Cj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiA+ID4gU2VudDogVHVlc2Rh
eSwgSnVuZSAyOCwgMjAyMiAxOjMzIFBNDQo+ID4gPiBUbzogU2hydXRoaSBSYXZpY2hhbmRyYW4g
PHNocnV0aGkucmF2aWNoYW5kcmFuQG5pLmNvbT4NCj4gPiA+IENjOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BB
VENIXSBwYWNrYWdlX21hbmFnZXIvaXBrOiBkbyBub3QgcGlwZSBzdGRlcnIgdG8gc3Rkb3V0DQo+
ID4gPg0KPiA+ID4gVGhpcyBuZWVkcyBhZGRpdGlvbmFsIGp1c3RpZmljYXRpb24uIFdoYXQgYXJl
IHRoZSBlcnJvciBtZXNzYWdlcywgd2h5IGFyZSB0aGV5IGhhcm1sZXNzIGFuZCB3aHkgdGhlIHNv
bHV0aW9uIGlzIHRvIHN1cHByZXNzIHRoZW0gaW5zdGVhZA0KPiBvZg0KPiA+ID4gYWRkcmVzc2lu
ZyB0aGUgcmVhc29ucyB0aGV5IGFwcGVhcj8NCj4gPiA+DQo+ID4gPiBBbGV4DQo+ID4gPg0KPiA+
ID4gT24gVHVlIDI4LiBKdW4gMjAyMiBhdCAyMy4xMywgU2hydXRoaSBSYXZpY2hhbmRyYW4gPHNo
cnV0aGkucmF2aWNoYW5kcmFuQG5pLmNvbSA8bWFpbHRvOnNocnV0aGkucmF2aWNoYW5kcmFuQG5p
LmNvbT4gPiB3cm90ZToNCj4gPiA+DQo+ID4gPg0KPiA+ID4gICAgICAgV2hlbiBwYXJzaW5nIHRo
ZSBvdXRwdXQgb2YgYSBjb21tYW5kLCBkbyBub3QgcGlwZSBzdGRlcnIgdG8gc3Rkb3V0Lg0KPiA+
ID4gICAgICAgT3BrZyBzb21ldGltZXMgcHJpbnRzIGhhcm1sZXNzIGVycm9yIG1lc3NhZ2VzIGV2
ZW4gd2hlbiB0aGUgb3BrZw0KPiA+ID4gICAgICAgY29tbWFuZCBzdWNjZWVkcy4gV2hlbiBzdGRl
cnIgaXMgcGlwZWQgdG8gc3Rkb3V0LCB0aGVzZSBlcnJvcg0KPiA+ID4gICAgICAgbWVzc2FnZXMg
bWF5IGNsb2JiZXIgdGhlIHN0ZG91dCBhbmQgY2F1c2UgdW5leHBlY3RlZCByZXN1bHRzIHdoaWxl
DQo+ID4gPiAgICAgICBwYXJzaW5nIHRoZSBvdXRwdXQuDQo+ID4gPg0KPiA+ID4gICAgICAgU2ln
bmVkLW9mZi1ieTogU2hydXRoaSBSYXZpY2hhbmRyYW4gPHNocnV0aGkucmF2aWNoYW5kcmFuQG5p
LmNvbSA8bWFpbHRvOnNocnV0aGkucmF2aWNoYW5kcmFuQG5pLmNvbT4gPg0KPiA+ID4gICAgICAg
LS0tDQo+ID4gPiAgICAgICAgbWV0YS9saWIvb2UvcGFja2FnZV9tYW5hZ2VyL2lway9fX2luaXRf
Xy5weSB8IDIgKy0NCj4gPiA+ICAgICAgICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gPiA+DQo+ID4gPiAgICAgICBkaWZmIC0tZ2l0IGEvbWV0YS9saWIv
b2UvcGFja2FnZV9tYW5hZ2VyL2lway9fX2luaXRfXy5weSBiL21ldGEvbGliL29lL3BhY2thZ2Vf
bWFuYWdlci9pcGsvX19pbml0X18ucHkNCj4gPiA+ICAgICAgIGluZGV4IDRjZDM5NjMxMTEuLmQ3
ZjNmMzE4NTMgMTAwNjQ0DQo+ID4gPiAgICAgICAtLS0gYS9tZXRhL2xpYi9vZS9wYWNrYWdlX21h
bmFnZXIvaXBrL19faW5pdF9fLnB5DQo+ID4gPiAgICAgICArKysgYi9tZXRhL2xpYi9vZS9wYWNr
YWdlX21hbmFnZXIvaXBrL19faW5pdF9fLnB5DQo+ID4gPiAgICAgICBAQCAtMTAzLDcgKzEwMyw3
IEBAIGNsYXNzIE9wa2dEcGtnUE0oUGFja2FnZU1hbmFnZXIpOg0KPiA+ID4gICAgICAgICAgICAg
ICAgIiIiDQo+ID4gPg0KPiA+ID4gICAgICAgICAgICAgICAgdHJ5Og0KPiA+ID4gICAgICAgLSAg
ICAgICAgICAgIG91dHB1dCA9IHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KGNtZCwgc3RkZXJyPXN1
YnByb2Nlc3MuU1RET1VULCBzaGVsbD1UcnVlKS5kZWNvZGUoInV0Zi04IikNCj4gPiA+ICAgICAg
ICsgICAgICAgICAgICBvdXRwdXQgPSBzdWJwcm9jZXNzLmNoZWNrX291dHB1dChjbWQsIHNoZWxs
PVRydWUpLmRlY29kZSgidXRmLTgiKQ0KPiA+ID4gICAgICAgICAgICAgICAgZXhjZXB0IHN1YnBy
b2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vycm9yIGFzIGU6DQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
YmIuZmF0YWwoIlVuYWJsZSB0byBsaXN0IGF2YWlsYWJsZSBwYWNrYWdlcy4gQ29tbWFuZCAnJXMn
ICINCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAicmV0dXJuZWQgJWQ6XG4lcyIg
JSAoY21kLCBlLnJldHVybmNvZGUsIGUub3V0cHV0LmRlY29kZSgidXRmLTgiKSkpDQo+ID4gPiAg
ICAgICAtLQ0KPiA+ID4gICAgICAgMi4yMC4xDQo+ID4gPg0KPiA+ID4NCj4gPiA+ICAgICAgIC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gPiAgICAgICBMaW5rczogWW91IHJlY2VpdmUgYWxs
IG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gPiA+ICAgICAgIFZpZXcvUmVwbHkgT25s
aW5lICgjMTY3MzU0KTogaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gY29yZS9tZXNzYWdlLzE2NzM1NF9f
OyEhRmJaMFp3STNRZyFvbURySmZicmpsTGJZMk9NZ3NBZ1FySWNuYXAyMjJqcmpaSkFoSlhfQldo
VkpmTWkwOTQxOVFBSEgxYlZmMVZhZndNUmNWdVdCYVE1azh5Ng0KPiBnay1XLVA4ZVhlQSQNCj4g
PiA+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLQ0KPiA+ID4gY29yZS9tZXNzYWdlLzE2NzM1NF9fOyEhRmJa
MFp3STNRZyFxYzB4YkwzUUJ6X2lsbG5QSUpvZUhiNm1HQTFrQkxuZExqckdEamxmRHdSN3JrUWNN
OGk3WlR0ZTV5X0dMNFhOUXJ1LQ0KPiA+ID4gcVN2SVYzcF9EeHBTNnRDSVgzakhNZGckPg0KPiA+
ID4gICAgICAgTXV0ZSBUaGlzIFRvcGljOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzkyMDUxOTg5LzE2ODY0ODlfXzshIUZi
WjBad0kzUWchb21EckpmYnJqbExiWTJPTWdzQWdRckljbmFwMjIyDQo+IGpyalpKQWhKWF9CV2hW
SmZNaTA5NDE5UUFISDFiVmYxVmFmd01SY1Z1V0JhUTVrOHk2Z2stV3ZReUsxRXMkDQo+ID4gPg0K
PiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9tdC85MjA1MTk4OS8xNjg2NDg5X187ISFGYlowWndJM1FnIXFjMHhiTDNRQnpfaWxsblBJ
Sm9lSGI2bUdBMWtCDQo+ID4gPiBMbmRManJHRGpsZkR3Ujdya1FjTThpN1pUdGU1eV9HTDRYTlFy
dS1xU3ZJVjNwX0R4cFM2dENJczgxakFTdyQ+DQo+ID4gPiAgICAgICBHcm91cCBPd25lcjogb3Bl
bmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8bWFpbHRvOm9wZW5l
bWJlZGRlZC0NCj4gPiA+IGNvcmUlMkJvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiA+
ID4gICAgICAgVW5zdWJzY3JpYmU6IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtDQo+IGNvcmUvdW5zdWJfXzsh
IUZiWjBad0kzUWchb21EckpmYnJqbExiWTJPTWdzQWdRckljbmFwMjIyanJqWkpBaEpYX0JXaFZK
Zk1pMDk0MTlRQUhIMWJWZjFWYWZ3TVJjVnVXQmFRNWs4eTZnay0NCj4gV1dicmhVLWMkDQo+ID4g
PiA8aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC0NCj4gPiA+IGNvcmUvdW5zdWJfXzshIUZiWjBad0kzUWchcWMw
eGJMM1FCel9pbGxuUElKb2VIYjZtR0Exa0JMbmRManJHRGpsZkR3Ujdya1FjTThpN1pUdGU1eV9H
TDRYTlFydS0NCj4gcVN2SVYzcF9EeHBTNnRDSUFESlJqSmMkPg0KPiA+ID4gW2FsZXgua2FuYXZp
bkBnbWFpbC5jb20gPG1haWx0bzphbGV4LmthbmF2aW5AZ21haWwuY29tPiBdDQo+ID4gPiAgICAg
ICAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+ID4NCj4gPiA+DQo+ID4NCj4gPg0KPiA+IElO
VEVSTkFMIC0gTkkgQ09ORklERU5USUFMDQoNCklOVEVSTkFMIC0gTkkgQ09ORklERU5USUFMDQo=

