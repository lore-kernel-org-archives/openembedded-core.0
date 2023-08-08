Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E22C001DB
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 15:35:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.64878.1691508902066680380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 08:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bCaDQ8fw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7584e0cf5b=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3789UThc015641
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Aug 2023 15:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=io3nyvwfWwLnp/pfezHGPcQO5645AcIueNnYcjAgi+0=; b=
	bCaDQ8fwe+gY0CIsRC+5ugrVAtBLRdhLT08/x04xtBbNdBVowc09IHh6D3ZgkRC+
	BNkXbosohKNDcoQVLzRgRLkfeJUc5oUAMbeYlCck2Td776X/4SIwbEiLI1Oav2i0
	8agB56M21CegefwkqBjNZ5vn95hnY3MtJI9dYBC73AnnieYg7sOh2XgCJXk5DEIG
	twphko/9VXlKE5Mx3pLPxTdbplyJBpAfcpsJV2RSyIkY3JV4xHOFyPTKpXKv7WYV
	t5wODa+Y+odWU/ufFBlk78dx7HRciXRr29Xz79FNdjZrxXTREE2yZ+aQMngC76io
	CF69pGe32VlF75ICvvyxEQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd62q8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 15:35:00 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 378FV9US019726
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Aug 2023 15:35:00 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s9dd62q8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Aug 2023 15:35:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BLveRwiLf9gj64/yFUSJF47K2s/q2K6JtIBNr9z6LtJrqsGN39F+wGRvUmHNXEzMf8DGs76CXEoRMdb/oQm7yVBJMtFFbOSXUFxfioIWyMEzzAEMdck5Kg9w9KMHtPjBvHsr6eZJt1V9hTdKytfqZikn11PYNUK4nDZXIux96YGnM0m/rJJ2bo1z7d5M1+JWEBlKpsk5sJrwPNBoEguzM7Ndh08ww10qyci+MmX0FiAsRiFUEFTMbq+Ww04bctpxZyh9XRj8Mr3uLW/5908GRZyW6iwId32URkJVEy76neunu8SHamT3hollo47AsG6jbHjGRHTq5Rek3HwDlArW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io3nyvwfWwLnp/pfezHGPcQO5645AcIueNnYcjAgi+0=;
 b=EFb1mQD2UhjVNfFejjFvjp4AAs4Fyl8goCSNieKnN3yBbQJIM2B9Eh8+htOoEqCecLPA3YwW0jYXZnxu7X3cswDlBTodVERQqH8y4qFqbCvgzNtRJY2wwGiC/cSwE7KhjY9UU/577uJGLRHJ3kzQ1M2wNNB2lg9aSrVA9TyDc5PeAk5A+BKqUZOt8oBkfRPQXB/E29j5mOivyAW/fk9b0gqW9mABTrnY7SkoaxRalN8AJKrf+VeXZaim1/ZpNmpgCqn8nfGja1pxwibQZLVuwdNiksJY/w5r/3B8shMV9z7RXh2R+nsgTNUEi9fv/+Sp1HxX+B+04bigdow8vJwPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 15:34:57 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::86dd:2ee6:ac66:812d%4]) with mapi id 15.20.6652.026; Tue, 8 Aug 2023
 15:34:57 +0000
From: "Chen, Qi" <Qi.Chen@windriver.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: Luca Boccassi <bluca@debian.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: RE: [OE-core] systemd issue with network commandline config and 6.4
 kernel
Thread-Topic: [OE-core] systemd issue with network commandline config and 6.4
 kernel
Thread-Index: AQHZye6YZXegq1Z2DkmHmxUK931qb6/ghLJQ
Date: Tue, 8 Aug 2023 15:34:57 +0000
Message-ID: 
 <CO6PR11MB56028B6144B7556C8610CED3ED0DA@CO6PR11MB5602.namprd11.prod.outlook.com>
References: 
 <000572c1ba81252efa552b812b0dc0838772c2f1.camel@linuxfoundation.org>
In-Reply-To: 
 <000572c1ba81252efa552b812b0dc0838772c2f1.camel@linuxfoundation.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5602:EE_|SA2PR11MB5082:EE_
x-ms-office365-filtering-correlation-id: ff746d14-6e7f-4fc9-b1c1-08db98250552
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P9DO52U38AMuhQF/4fgSX+0RR0HnQXNPrdrQm0iAa07H465lIuwNm8/Uc07XwvLx6YptCzpxuo5TBwYQh37mvLM9Fd1J6yR2b6FCHKTEQcqSHjIAtNSbg219+uS77w0SU/uLRYKoHAVOrajtwZIJI6iRy/EZm0acOTK6FP8AUl6BcxQmLFDUTa140dcc13kNQkKPM2lc9OyoYENqfvzLo5B1w2vjDa2dldf69DKfq86+L6hWGxL9xg3PVg//ERl5vJrT9TzYQxKf6gJ7MvvNkD5UPvreEFt/QMQFrs+Qt5KeADiQi2jfy9KeNrr/iqeQw3pjEARW0fu8jzuyA2NWCZC5letCgC5E7GbHpxf4uJEx3pOnGtWUGU7EoHd5d/MQZyfR8l/h91X0nqaZ+MtD6dJyuKjlwVI46k6bmo3wTtgM8ixSU+CSLxXkvXc8acXe6UeLVen/APfG12WfISkxJPOSdbbIgNAjbJYaMHhl/lDPBGls5+XLNs6BqOUfoiPm3p2iHnlQmY2B9DVS10Di9qERsMAEEtAG44BrKrXwmaieCUF1IX5XqqBaxJcjDBbGL1nrj+c24r06Q1kBlOtWbsrfcT/SXU7ewsHna+/ivNY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(39850400004)(136003)(376002)(346002)(451199021)(186006)(1800799003)(8936002)(38070700005)(8676002)(52536014)(5660300002)(64756008)(66446008)(4326008)(41300700001)(316002)(86362001)(83380400001)(55016003)(2906002)(9686003)(966005)(7696005)(71200400001)(53546011)(26005)(6506007)(76116006)(66476007)(66556008)(66946007)(478600001)(122000001)(110136005)(54906003)(38100700002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?K0R0aStudmlnUFZzWWdYNmFYODlIRVlvcFVEaDNyWjRta3JkSDZtM0hXU09o?=
 =?utf-8?B?VkZOS1REVE1qaHo3ZGJqWm5LQ2c0ZnFPNnJydzJvUW8vdXJleEE3QnpGRC9h?=
 =?utf-8?B?Q2FuRktzcldUMytpRmdTcG04RndjajFzdUVXQndMOHBvVUNITzMyakpHWDRn?=
 =?utf-8?B?U1I2Qmx5aTg4NC9oVkpkdFF4ZStjMlRoMkM5TldtWkg2SHBHU3UyVGt2YTF1?=
 =?utf-8?B?aTZtcVM1b29PeGVEVVl5ZTF4Y1VyVzVYdjlkcVJBYnhjU1p3YUt0cnBiWDhi?=
 =?utf-8?B?b3ZZMWNsYVNTRlphRkU4OG9sVXl2MWRRVkpBUWxwWDIwQmt4NFloNDZPcmJV?=
 =?utf-8?B?K0xLclprT2lVYU56aUljZ1Y1WHF6ZHJDZFRzQW1wSjlCVExJK3dsOXBYUkM1?=
 =?utf-8?B?S2JsRG1LamlxOG5kNVhDbTdVN3N3MUJyWWJPNi9SSXMxOXBxNDR6T2dLRDI1?=
 =?utf-8?B?VDNkYVFHMGtXK0xUMXZiZzFpSVE2ZTRhWHdpbEttK0NpVWhGZWpyQm84L3M3?=
 =?utf-8?B?OURnU1puSFZSc2dUQzJWRWttNG84LzAzY01YSDlaQzB2YTVmSzUwWnV5TUNz?=
 =?utf-8?B?SXBhU0phQXp1cGFwWDVPTzkwVXQ5NUNaVVdtT1hSZEM2SGRIaUFJakIxdmdH?=
 =?utf-8?B?UW9uREZOand5MHdoeHVRTVVNRmg3enVBZXB3ZGlpWlBYaEVsYW84alYwMzJ0?=
 =?utf-8?B?VENVMllXVzFFcmtlZmJmVDZrL2pZdTRYTzFSU2NIWVc2a0U2aWtnVlJsVXJP?=
 =?utf-8?B?M1k3dUpGSkZsa2tNdys3Y01LWVdsZTNYeEs5QlFocndkNGhLSWxESWdyWFpK?=
 =?utf-8?B?WHdFM2pnYnVFTHVlK0JlZUxkdG03Y2Y5WW5wRlFCV1AwU2NqeXR4MEpSemhV?=
 =?utf-8?B?UFlIM2NJS3pGU0dsRG5kRXgrNFNuYTBYVVZEZ3hrQUp4MVNadUpTd093c1pG?=
 =?utf-8?B?SVJGd05XcnZ1Q25PWG4vNUJ2cFZpQ1I5NERRaHlkYzJwTjVNT1ZCR05VYzVz?=
 =?utf-8?B?OVcwelVJYy9Sd2FjZDZWa2VFNElJVjZaaGk3U2JOZWlEc0tqdmtTVkF2dG1k?=
 =?utf-8?B?QlZqelVpWnJGb0prZy9VUTdWSFdubmJrMms0MzZCak1aN1dJM0hnT0NhYUF6?=
 =?utf-8?B?eURzOU9Sa3c4SGk5bytEWXRRbVdJKytmclhZckRlNVRQNklQWThOVHF2ZzJo?=
 =?utf-8?B?ZndDcVVwVWI0WHZHaHpwRWdKeS9zZy9mK2xIME9WdUorOTA3M05EeWdJT2No?=
 =?utf-8?B?ci9kTkFRQm1XbEoyVWdCRHdyVmdUbGdJb2JrQlVVTElFUVA0d2hqek5rV2da?=
 =?utf-8?B?eEp3aWpFSTlSVjh2ZGdwaTlFR2lmQVFkRy9kbDBLVm1WYXBnY1EzdUFOZGVw?=
 =?utf-8?B?bzVwSXBvWFc5aDB6MGhMd1ZlNzV6ZFozWlJaaW1mV0xyWHpZVksrTHFKeEJ6?=
 =?utf-8?B?M3JQSDg3NFBiOFVLSkFwU3RhRmZSVkp5Q1U1d3cvbU1ZWi92MWRaZG1JNmRW?=
 =?utf-8?B?OU5IcEZVU1FycDI4ZHk1OHZ1NUVZNmkzY1dwRXZYUXBOQ2pJeWwrclZFOU9G?=
 =?utf-8?B?czRoWFFRWVJLSm5GVXZSaUZmOUdqRTBkSXhmMkkvT050dndIVkNyYnNVelpX?=
 =?utf-8?B?K0kwdFZQOWg5MXc2RUZTbmpPd2RXZ1pNbXc2SHkyV0x0Sk1vL3JGTVlJekhU?=
 =?utf-8?B?aU4zSDArQlY2Zmo3bFk0NHVCUWxHZ1k5WjdZanpnOXlYV2FMUHVRWmVLdmtZ?=
 =?utf-8?B?NDNnQXNVZjZvTGd3Mk5YVHlzYytlTTdzQkNtN1A1L2I0TXNiVnc3ZTBCVmVl?=
 =?utf-8?B?d0JhR0h6RmV3bUdPNS9OK0FRVHFyeE5PVDREeUdCQnhSYUwyNHlWcFpvdytm?=
 =?utf-8?B?dWE4ZzJYQ0MxSU1IRzdzditiWHVFYnpqN0M0S0hNOTdlZUlxZTlzazVTT1kr?=
 =?utf-8?B?RDVEU0VnSFIrSG4rZjJFOGdRZ09Uc0FMVjRMZDJzOEhFV3lNVEhGVWM3cmpX?=
 =?utf-8?B?VmM2TCtOcWhRWFJZeU9rUmVCdE5BRnhWTVJWa0lJM0dhVFdMZFpuQjJ6Z3lN?=
 =?utf-8?B?ZFQrRnBoNjUzeU5iVDFXSTkya1NiR3RkSm41L0hCbkM4MkNteVRBK0E4QWgz?=
 =?utf-8?Q?OkN6U4pZv0bxr61zEoixHBRao?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff746d14-6e7f-4fc9-b1c1-08db98250552
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2023 15:34:57.3514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fPYOhFv5TcRKYSStRwiXMJafiaRZKZpqTySdLtAVZayKy3AMrC2cm1KCyADMTsGzAaIpEOcqQ0UMMLfL7xvg0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-Proofpoint-GUID: 9hrUllAGmo3oEUrwzkVyQbqKeXILLjFa
X-Proofpoint-ORIG-GUID: jkZ9i4bLYtbU2cX5GvGROVAz3KReKSwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_13,2023-08-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308080139
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 15:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185664

SSBmb3VuZCBzb21lIGNsdWUsIGJ1dCBub3QgdGhlIHJvb3QgY2F1c2UgeWV0Lg0KVGhlIGV0aDAg
aXMgcmVuYW1lZCB0byBlbnAwczIgYnkgODAtbmV0LXNldHVwLWxpbmsucnVsZXMgdWRldiBydWxl
IGluIHN5c3RlbWQuIEFuZCB0aGUgY29ubm1hbi5jb25mIG9ubHkgYmxhY2tsaXN0cyBldGgwLg0K
DQpUaGUgcmVsYXRlZCBsb2cgaXM6DQpBdWcgMDggMTU6MTg6MTYgcWVtdXg4Ni02NCBrZXJuZWxb
MjEzXTogWyAgICAxLjcyNzMzMl0gdmlydGlvX25ldCB2aXJ0aW8wIGVucDBzMjogcmVuYW1lZCBm
cm9tIGV0aDAgKHdoaWxlIFVQKQ0KDQpUaGUgc3lzdGVtZCB1ZGV2IGNvbmZpZ3VyYXRpb24gZmls
ZSBpczoNCnJvb3RAcWVtdXg4Ni02NDp+IyBjYXQgL2xpYi91ZGV2L3J1bGVzLmQvODAtbmV0LXNl
dHVwLWxpbmsucnVsZXMNCiMgZG8gbm90IGVkaXQgdGhpcyBmaWxlLCBpdCB3aWxsIGJlIG92ZXJ3
cml0dGVuIG9uIHVwZGF0ZQ0KU1VCU1lTVEVNIT0ibmV0IiwgR09UTz0ibmV0X3NldHVwX2xpbmtf
ZW5kIg0KSU1QT1JUe2J1aWx0aW59PSJwYXRoX2lkIg0KQUNUSU9OPT0icmVtb3ZlIiwgR09UTz0i
bmV0X3NldHVwX2xpbmtfZW5kIg0KSU1QT1JUe2J1aWx0aW59PSJuZXRfc2V0dXBfbGluayINCk5B
TUU9PSIiLCBFTlZ7SURfTkVUX05BTUV9IT0iIiwgTkFNRT0iJGVudntJRF9ORVRfTkFNRX0iDQpM
QUJFTD0ibmV0X3NldHVwX2xpbmtfZW5kIg0KDQpBbmQgdGhlIGNvbm5tYW4gY29uZmlndXJhdGlv
biBmaWxlIGlzOg0Kcm9vdEBxZW11eDg2LTY0On4jIGNhdCAvZXRjL2Nvbm5tYW4vbWFpbi5jb25m
DQpbR2VuZXJhbF0NCk5ldHdvcmtJbnRlcmZhY2VCbGFja2xpc3QgPSBldGgwDQoNCkluIGNvbnRy
YXJ5LCB3aXRoIDYuMSBrZXJuZWwsIHRoZSByZW5hbWluZyBmYWlsZWQgd2l0aCB0aGUgZm9sbG93
aW5nIG1lc3NhZ2U6DQpBdWcgMDggMTU6Mjk6NTggcWVtdXg4Ni02NCAodWRldi13b3JrZXIpWzIw
Nl06IGVucDBzMjogTmV0d29yayBpbnRlcmZhY2UgJ2V0aDAnIGlzIGFscmVhZHkgdXAsIGNhbm5v
dCByZW5hbWUgdG8gJ2VucDBzMicuDQoNCk1heWJlIHNvbWUgY2hhbmdlcyBpbiBuZXcga2VybmVs
IGFsbG93cyByZW5hbWluZyBuZXR3b3JrIGludGVyZmFjZSB3aGlsZSBpdCdzIHVwPw0KDQpSZWdh
cmRzLA0KUWkNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQpTZW50OiBUdWVz
ZGF5LCBBdWd1c3QgOCwgMjAyMyA3OjUxIFBNDQpUbzogb3BlbmVtYmVkZGVkLWNvcmUgPG9wZW5l
bWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpDYzogTHVjYSBCb2NjYXNzaSA8
Ymx1Y2FAZGViaWFuLm9yZz47IEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5kcmUuYmVsbG9uaUBi
b290bGluLmNvbT4NClN1YmplY3Q6IFtPRS1jb3JlXSBzeXN0ZW1kIGlzc3VlIHdpdGggbmV0d29y
ayBjb21tYW5kbGluZSBjb25maWcgYW5kIDYuNCBrZXJuZWwNCg0KSGksDQoNCldlJ2QgbGlrZSB0
byBzd2l0Y2ggdG8gdGhlIDYuNCBrZXJuZWwgYW5kIHRoZXJlIGFyZSB0d28gYmxvY2tlcnMuIE9u
ZSBvZiB0aGVtIGlzIHRoYXQgc3lzdGVtZCBhcHBlYXJzIHRvIGJlIGJyZWFraW5nIHRoZSBuZXR3
b3JrIGRldmljZSBjb25maWcgd2l0aCA2LjQga2VybmVscy4NCg0KVGhpcyBoYXBwZW5zIHdpdGgg
Y29yZS1pbWFnZS1zYXRvIGJ1dCBub3Qgd2l0aCBjb3JlLWltYWdlLW1pbmltYWwuDQoNCkluIHRo
ZSBzYXRvIGltYWdlLCBJIGNhbiBzZWUgdGhlIGtlcm5lbCBnZXRzIHRoZSBpcD0gY29tbWFuZGxp
bmUgcGFyYW1ldGVycyBhbmQgc2V0cyB1cCB0aGUgbmV0d29yayAoSVAtQ29uZmlnOiBDb21wbGV0
ZTogPGNvcnJlY3QNCmluZm8+KSBpbiB0aGUgZG1lc2cgbG9ncy4gV2hlbiBJIGxvb2sgYXQgdGhl
ICJpcCBhZGRyIiBjb25maWcsIHRoYXQNCnNldHVwIGlzIGdvbmUgdGhvdWdoLg0KDQpUaGUgYXV0
b2J1aWxkZXIgbWFuaWZlc3RhdGlvbiBvZiB0aGlzIGlzIGZvciBleGFtcGxlOg0KDQpodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzcyL2J1aWxk
cy83NTgwL3N0ZXBzLzIzL2xvZ3Mvc3RkaW8NCg0KaS5lLiBwaW5nIGZhaWxzLg0KDQpEb2VzIGFu
eW9uZSBrbm93IHdoeSB1cGRhdGluZyBmcm9tIHRoZSA2LjEga2VybmVsIHRvIHRoZSB0aGUgNi40
IGtlcm5lbCB3b3VsZCBjYXVzZSB0aGlzIG9ubHkgZm9yIHN5c3RlbWQgaW1hZ2VzPw0KDQpJIGNv
dWxkbid0IHNwb3QgYW55dGhpbmcgaW4gdGhlIGpvdXJuYWwgYnV0IEknbSBub3Qgc3VyZSBJJ2Qg
a25vdyB3aGF0IHRvIGxvb2sgZm9yLi4uDQoNClRoYW5rcywNCg0KUmljaGFyZA0K

