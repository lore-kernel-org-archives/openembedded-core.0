Return-Path: <ranjitsinh.rathod@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A49C48BC4
	for <webhook@archiver.kernel.org>; Fri, 23 Feb 2024 08:59:05 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.94])
 by mx.groups.io with SMTP id smtpd.web11.6795.1708678734524299187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Feb 2024 00:58:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=UT8eKP9a;
 spf=pass (domain: kpit.com, ip: 40.107.239.94, mailfrom: ranjitsinh.rathod@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=niHOfyJ17EjPOEr4fuB/xjouXwZdsOzOtIh6aKBhyicrEepjRs8+cgg+PLZvQ/lmRil6BF48MzgUPZ35kcLq4VIec8TP6eH/vsq/KfhFKLxxjeeiUv3O57RY2ml6UW0XgZEP8jJ7PgfLX1wwIvtXFxeIQ3wmpLh5Ej64IT+kR6IMkmSNkMZBidSOzMHcqp51RwNjoBzPjz/CeAALxN7oeUWWauHrjia+4NJthiyIvXFQIjOjgnXejVW1YOwJ0wbUhfbOzJyntnyeWZxpb2rmQO5Lruv6Xux1ZzrL4d0+083FQ61dZu1/+RVWfPj6sGMubIN5mdPLoGj8k8aOYBvBiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AVc64wHkZzIvRWxnvX1Fe9S3ErpsJOmST935vEGtKU=;
 b=LrIJMWl2XTUW5/fBI50/DYrgXVPTwgY6ZtUH2MXvH6Rjhv3nJ/6zU+urzgCkgUXQwcQOhLTaXoadZqG8tHe/g+s5SkWy8eImUCwp9wetRKWmefyO4QPbXN83X4Q36OXnWFzheZIi2gHiV40PsfyyJbd/NRAc6N3mXLO1Lq4vwkb+A1KgMgfu/9h5BSc7rDGyeQ07dFjUN4uWTsL1dzCptl9w46mv+GymhFbN34U5CL71H5fJWhNXXlv4KbOZX/FiCE/ou35zIj+EwOzQsl6pvFmxqjATVla5X6kzR8AG50a3SwYpDa/Kz8yCJGY7kqSVuxWwxky3wJYL1z0KKM5ecA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AVc64wHkZzIvRWxnvX1Fe9S3ErpsJOmST935vEGtKU=;
 b=UT8eKP9aeN5WQCv58YZOylANJXo6PRPHihypOzuKl9Ur3RJ3kwv8KFjBHQhuHz2qNSqRc1suMuc2qngUvcAAJtvnwt3KVoqrpKFs5OdPDE9oO1RWE7CAhuENK+x7z+t0hTXDhrvO1FpIW2L+5kOqoztYqQ5pbKnLH6c8kdt2zwU=
Received: from MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:114::12)
 by MA0PR01MB8836.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Fri, 23 Feb
 2024 08:58:47 +0000
Received: from MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::66ec:6dcb:4ac7:6957]) by MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::66ec:6dcb:4ac7:6957%3]) with mapi id 15.20.7316.023; Fri, 23 Feb 2024
 08:58:47 +0000
From: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
To: "ranjitsinhrathod1991@gmail.com" <ranjitsinhrathod1991@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anuj.mittal@intel.com"
	<anuj.mittal@intel.com>
Subject: Re: [OE-Core][dunfell][PATCH] gnutls: Backport of CVE-2024-0567
Thread-Topic: [OE-Core][dunfell][PATCH] gnutls: Backport of CVE-2024-0567
Thread-Index: AQHaZjAQp2TvxL0aV0iB4BLMuZ7myrEXnpmAgAAAkTo=
Date: Fri, 23 Feb 2024 08:58:47 +0000
Message-ID: 
 <MA0PR01MB91741F78A54AF074F148CC638F552@MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM>
References: <20240223081206.40554-1-ranjitsinhrathod1991@gmail.com>
 <b530e4e49271b2e4a7e3ee3ed8c3dac1d9ffcb29.camel@intel.com>
In-Reply-To: <b530e4e49271b2e4a7e3ee3ed8c3dac1d9ffcb29.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0PR01MB9174:EE_|MA0PR01MB8836:EE_
x-ms-office365-filtering-correlation-id: 1044f632-4d4b-4221-c01c-08dc344da5ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lkSHKI6xuh3wIGFizEm0x0rIJ4ImT8EEl/N/s6Mm7Qgtbstgy/EK+zLDFySEkkRuYnZ24TUb1Dg1yxdybOBC//XtxtWRCXaJlR6prUd7P3UiZKhbhu+WoXtSLRoWZQC2PqqjO3lfTh6TcUYFiJTaWwkukfh3PC8RKd6QH2utmsm3cc1nAsz3VkuPveO+OnP2tysS/vT6uJDE8kMaWwBim6lYxrJnIhWxXcGVVgum/QYdSeBw3hsYgLp895xbXfirRDgxNzuSYcEgoP9DBcfodBgCiVpUspJNRiczP6CugusVw/osrKmwutaPUkXzUI6vsqlAZbZ6g5zhZGqjvWb7KV/60eAXVoBHaJT3O1gfg7hOlSw3TWaPBYLeAlcglvOoN5t6KlV2VntpknzJFc2z1vGz7xtwRhX37YK8K63rYtJr9ZSZ3z+OOzMMSR/xp6lELLMtxyirW+0zbvHRoxB6gIWFznFD8M/FMk0Q09mIXBPgh/jATIHBp000LMsEDT0P3dh+VKLHxw3qX+EUcU3XWrV7LiXBpeFW8ttNiOPtIr5K3u9yg1B9ZkVsngPulpI9166pAQpCeqxDuQyVck6YsMZtEQTTE3JwCQ2Wi0vAXRo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?KzcxOUZBbE15VkxPUkM4TVV1MHJPcGxodmkvZHBna2NtOGtNakY0WExF?=
 =?iso-2022-jp?B?TVVJd1JzTW5YazRyTkI1MXVkS0hmR3cvT2YvNkg1VWJ2MlRyZ1JXRm51?=
 =?iso-2022-jp?B?WjdlY2dPanQrSTBYWENaU0ZJamtHcXpDRWI0SlNza3BJUGtyVjFxdzVm?=
 =?iso-2022-jp?B?SnZoNnIxWWE2cXpycWkwcXZqZE5Zcy9wWVVKeHB0OEZhZkJ5QjhhUWdC?=
 =?iso-2022-jp?B?L1Nzc0taYTJ4VTdmcUF4dk1jQkxNY3ZGZVBCY2hJbGZvM05LcVlSVHBM?=
 =?iso-2022-jp?B?WVI3VFdyQUVUVk1MN2x2eTd6enhOTmMyTG1vTlhBVXVXQU5leU1CM01D?=
 =?iso-2022-jp?B?azZPNkwvcGJST3RtRlFsTkNvaFBVSnlhTUd2YXhHY1p6dys1KzBzMGpk?=
 =?iso-2022-jp?B?WUtiMzRZSkc2clQxUGFmZWYwY0VDUktnWDdCM1I1aDFUODZQYVBlN1hm?=
 =?iso-2022-jp?B?aUswbjN2d2NFNGdkYWd2L1ZMdWpGMmNJVVBkMVhRS3Q2ZjFYYWlzbk5Z?=
 =?iso-2022-jp?B?RFdlVUJYVTFQaDZ3emJBUVQyQzlGU2k4RXo1YUtlS2pQY3d3TzhOVExL?=
 =?iso-2022-jp?B?VzBHSjNNK2g5cUtnaEdFZjdDVWtxNEtiZHZNWXYyRytJSzZRUXNGMlRl?=
 =?iso-2022-jp?B?Q1BkbnpEdnk3ZVB1L1l5YWt6cC9RRnRlWDE1NzZHZERoNjJSNDVZY1Br?=
 =?iso-2022-jp?B?cEtxMGorbnlxZk52WFZpckwxK3MvZUcxNENFTDZTb1kvVVBKZnByRzFI?=
 =?iso-2022-jp?B?SGpPd0NMVnNJUFhlOEVrYloyUUVQYjhmZTRiZzIwVjdmN3VuMTBaSWRq?=
 =?iso-2022-jp?B?MVQrZW42Mit2bmQyRVhES3JPK1BqWXc2SnVIcHh2MnFVWDBXbExkY0Ri?=
 =?iso-2022-jp?B?YW0wTUxQaVJTUEpGUDlCUmpxUWtHVEF0aks1NFAvc2lZSU5DNlVyTVlJ?=
 =?iso-2022-jp?B?Mkgra2lWVjRMQ3ZkeE15cWlldHlFVWtJeDh6YjkyS3hqaDBhMjJxL3ZN?=
 =?iso-2022-jp?B?V3BGMWRKVnNqaDd2V2hxMDJaU2VjWVV2azlIMXQwOW5rSVc2enMxWVdv?=
 =?iso-2022-jp?B?L2tsSEkwSUljZExsaDZjWWc3Y3YwWitHVVlEYllTTUttM3VXV0l6Kzdz?=
 =?iso-2022-jp?B?R1RMMVhtaEtQaWtxWGhmd3RsSGUzcWdpTTVhY1FOdGhCUlpFNzJhVkll?=
 =?iso-2022-jp?B?RC9sL3hSMDVNOHk4cUN0czcva2IxU0N5Z1JlWG82VENkVkhYWGRJWHRo?=
 =?iso-2022-jp?B?SURuNXNiYmRXN2gwSXdMZG1uY2V3ZlFUd3dTL2xFN0dnVVRUcnk4SG82?=
 =?iso-2022-jp?B?MlNSTzlsZE5HQkRBT0tqN0RkRHBydHd6Q3E0V216WU9lb0VxVlhQYVVm?=
 =?iso-2022-jp?B?U2VUR1FUL1JkOXhUcExWWSs0TUhVMnpsV0Ftd0dicnFFKzRTdGpkT1NO?=
 =?iso-2022-jp?B?bmxwOU4zRitWeTNlV21lQjRudHJHZFg0RzhJY1lERFVTRkR0RGRDQVdl?=
 =?iso-2022-jp?B?U1ZyMCtFaFBOUlNsSGtEYUx6UXhOVXFvSkRqOXE5K3NFcWlHZC9KbEs3?=
 =?iso-2022-jp?B?TFphdEN0aTk2L2ZqcmpmTDVhWDlmS2w4RXBCYzR2d1ZydFlXVTFONFN1?=
 =?iso-2022-jp?B?NU1sZm02Mk80UjlOV2s0UzhVM0ZwUGpUYS82Z1pucStlTlRuTmdGWlIx?=
 =?iso-2022-jp?B?V29jK2ZVMmdsdHVvVEdaNHZxcnQySFBwSk9GVzR6YnJFZE5YZWdmRXlN?=
 =?iso-2022-jp?B?N1pIak0xNHZHc1ZRZW8vUzZkY3ZjdExNOVhzREdPOWVNaWcrWCtWNEVv?=
 =?iso-2022-jp?B?M3UzYlEyQitrUkNIaFVzdUJlcmZQZy9QVys1M2FCdCszY0tMWFFFZlcv?=
 =?iso-2022-jp?B?UTBpeVFyUE91VXRkRmxhZ0ZKMldLYkhMc1NHeXlyOElKOE9DZmVDRlpz?=
 =?iso-2022-jp?B?ckpkNHdVRmxoS0VoRDZBelg0eHYvbzR6SVJDN3M0cStvTkpTMDZ4clAv?=
 =?iso-2022-jp?B?aUN0ODlTeGt1QTJ3UlNtTDFCSnlhanVPUm9ybnlFQWh5d09lbFBwalFL?=
 =?iso-2022-jp?B?L1RxQXloeStrOXlYa05uaE4rV21tTjMzQUxaVm5wNVFkdTFyc3RuZkgv?=
 =?iso-2022-jp?B?eWlETGZSdUlQaC9HUFY2Q0VXUGt3UXdFTUx3SGt5Zkx2dGp1Ym9pbG5U?=
 =?iso-2022-jp?B?TXNkai83RndSaUxuZFNPb3R1c201T2N0NkxaY2FZWERWeGZGNHMwRUJs?=
 =?iso-2022-jp?B?Z2k3SDFRWk1WQS9rbkJLNkwvSTE0c1F0Uit3c2MvSFlPZkFEb0JZcGN0?=
 =?iso-2022-jp?B?SWNNTQ==?=
Content-Type: multipart/related;
	boundary="_004_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0PR01MB9174.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1044f632-4d4b-4221-c01c-08dc344da5ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2024 08:58:47.6242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gEEZBJjm/6Bt7MuYFM/EhHpzr0sdZD0jQ6qPXCciRyz8O7SBOIKY1vQVntTiC56ZVB1/UuwPb+Cpy0EuN5L7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Feb 2024 08:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196052

--_004_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_
Content-Type: multipart/alternative;
	boundary="_000_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_"

--_000_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

I didn't checked after applying patch if the crash went away or not.


Thanks,

Best Regards,

Ranjitsinh Rathod
Technical Leader |  | KPIT Technologies Ltd.
Cellphone: +91-84606 92403
__________________________________________
KPIT<http://www.kpit.com/> | Follow us on LinkedIn<http://www.kpit.com/link=
edin>

[cid:b5864a47-0d77-4ed4-88b7-4211465b5226]<https://www.kpit.com/TheNewBrand=
>

________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Anuj Mittal via lists.openembedded.org <anuj.mi=
ttal=3Dintel.com@lists.openembedded.org>
Sent: Friday, February 23, 2024 2:21 PM
To: ranjitsinhrathod1991@gmail.com <ranjitsinhrathod1991@gmail.com>; openem=
bedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.or=
g>
Cc: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Subject: Re: [OE-Core][dunfell][PATCH] gnutls: Backport of CVE-2024-0567

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

Hi

On Fri, 2024-02-23 at 13:42 +0530, Ranjitsinh Rathod wrote:
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> A vulnerability was found in GnuTLS, where a cockpit (which uses
> gnuTLS)
> rejects a certificate chain with distributed trust. This issue occurs
> when validating a certificate chain with cockpit-certificate-ensure.
> This flaw allows an unauthenticated, remote client or attacker to
> initiate a denial of service attack.
>
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2024-0567&data=3D05%7C02%7Cranjitsinh.r=
athod%40kpit.com%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C638442751081633877%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3DjoGRSbtXT4Vqw3ElPAMUGhl0Cib%2FJaFZmyjBOunskuY%3D&reserved=3D0<https://nv=
d.nist.gov/vuln/detail/CVE-2024-0567>
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fissues%2F1521&data=3D05%7C02%7Cranjitsi=
nh.rathod%40kpit.com%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C638442751081640347%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&s=
data=3Dcdib7a%2F6vvTJrC9Yf190DawOxodPO%2FysRQ%2FaRJI9b90%3D&reserved=3D0<ht=
tps://gitlab.com/gnutls/gnutls/-/issues/1521>

Did you check whether the reproducer in this issue crashes for this
version of GnuTLS as well and gets fixed after applying this modified
patch? The code looks different so it'd be good to check if you haven't
already.

It doesn't seem to be reproducible in 3.6.13 for Ubuntu:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2024-0567&data=3D05%7C02%7Cranjitsinh.rathod%40kpit.co=
m%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C638442751081643577%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DOpxR0vIp%2B6=
sSpGm76IluOr%2FMELATaaM391d8cN1tukc%3D&reserved=3D0<https://ubuntu.com/secu=
rity/CVE-2024-0567>

Thanks,

Anuj

> Link:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitla=
b.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F9edbdaa84e38b1bfb53a7d72c1de44f8de37=
3405&data=3D05%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73444e4b431508=
dc344ca848%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638442751081646751%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D7YDtrJZ2GMG7YwOZ78BPAYJiEn5QfVhjQIPo2l=
sR5PI%3D&reserved=3D0<https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e3=
8b1bfb53a7d72c1de44f8de373405>
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  .../gnutls/gnutls/CVE-2024-0567.patch         | 190
> ++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
>  2 files changed, 191 insertions(+)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-
> 0567.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
> b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
> new file mode 100644
> index 0000000000..1580cab277
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch
> @@ -0,0 +1,190 @@
> +From 9edbdaa84e38b1bfb53a7d72c1de44f8de373405 Mon Sep 17 00:00:00
> 2001
> +From: Daiki Ueno <ueno@gnu.org>
> +Date: Thu, 11 Jan 2024 15:45:11 +0900
> +Subject: [PATCH] x509: detect loop in certificate chain
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +There can be a loop in a certificate chain, when multiple CA
> +certificates are cross-signed with each other, such as A =1B$B"*=1B(B B,=
 B =1B$B"*=1B(B C,
> +and C =1B$B"*=1B(B A.  Previously, the verification logic was not capabl=
e of
> +handling this scenario while sorting the certificates in the chain
> in
> +_gnutls_sort_clist, resulting in an assertion failure.  This patch
> +properly detects such loop and aborts further processing in a
> graceful
> +manner.
> +
> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
> +
> +CVE: CVE-2024-0567
> +Upstream-Status: Backport
> [https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F9edbdaa84e38b1bfb53a7d72c1&data=3D0=
5%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73444e4b431508dc344ca848%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638442751081650067%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C0%7C%7C%7C&sdata=3Du6syQB%2FfLBsYLfq8M3UZjx0sQOK7YSYYhob%2FjtY7WFA%3D&=
reserved=3D0
> de44f8de373405]
> +Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> +Comment: Hunks refreshed to fix error during backporting this patch
> +
> +---
> + lib/x509/common.c   |   4 ++
> + tests/test-chains.h | 125
> ++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 129 insertions(+)
> +
> +diff --git a/lib/x509/common.c b/lib/x509/common.c
> +index 861cace4c8..d749a062cd 100644
> +--- a/lib/x509/common.c
> ++++ b/lib/x509/common.c
> +@@ -1761,6 +1761,11 @@ gnutls_x509_crt_t *_gnutls_sort_clist(gn
> +                     *clist_size =3D i;
> +                     break;
> +             }
> ++
> ++            if (insorted[prev]) { /* loop detected */
> ++                    break;
> ++            }
> ++
> +             sorted[i] =3D clist[prev];
> +             insorted[prev] =3D 1;
> +     }
> +diff --git a/tests/test-chains.h b/tests/test-chains.h
> +index 9ce23764da..3e559fecd5 100644
> +--- a/tests/test-chains.h
> ++++ b/tests/test-chains.h
> +@@ -4106,6 +4106,129 @@ static const char *superseding_ca[] =3D {
> +     NULL
> + };
> +
> ++static const char *cross_signed[] =3D {
> ++    /* server (signed by A1) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBqDCCAVqgAwIBAgIUejlil+8DBffazcnMNwyOOP6yCCowBQYDK2VwMBo
> xGDAW\n"
> ++    "BgNVBAMTD0ludGVybWVkaWF0ZSBBMTAgFw0yNDAxMTEwNjI3MjJaGA85OTk
> 5MTIz\n"
> ++    "MTIzNTk1OVowNzEbMBkGA1UEChMSR251VExTIHRlc3Qgc2VydmVyMRgwFgY
> DVQQD\n"
> ++    "Ew90ZXN0LmdudXRscy5vcmcwKjAFBgMrZXADIQA1ZVS0PcNeTPQMZ+FuVz8
> 2AHrj\n"
> ++    "qL5hWEpCDgpG4M4fxaOBkjCBjzAMBgNVHRMBAf8EAjAAMBoGA1UdEQQTMBG
> CD3Rl\n"
> ++    "c3QuZ251dGxzLm9yZzATBgNVHSUEDDAKBggrBgEFBQcDATAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "B4AwHQYDVR0OBBYEFGtEUv+JSt+zPoO3lu0IiObZVoiNMB8GA1UdIwQYMBa
> AFPnY\n"
> ++    "v6Pw0IvKSqIlb6ewHyEAmTA3MAUGAytlcANBAAS2lyc87kH/aOvNKzPjqDw
> UYxPA\n"
> ++    "CfYjyaKea2d0DZLBM5+Bjnj/4aWwTKgVTJzWhLJcLtaSdVHrXqjr9NhEhQ0
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* A1 (signed by A) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBUjCCAQSgAwIBAgIUe/R+NVp04e74ySw2qgI6KZgFR20wBQYDK2VwMBE
> xDzAN\n"
> ++    "BgNVBAMTBlJvb3QgQTAgFw0yNDAxMTEwNjI1MDFaGA85OTk5MTIzMTIzNTk
> 1OVow\n"
> ++    "GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEExMCowBQYDK2VwAyEAlkTNqwz
> 973sy\n"
> ++    "u3whMjSiUMs77CZu5YA7Gi5KcakExrKjYzBhMA8GA1UdEwEB/wQFMAMBAf8
> wDgYD\n"
> ++    "VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT52L+j8NCLykqiJW+nsB8hAJkwNzA
> fBgNV\n"
> ++    "HSMEGDAWgBRbYgOkRGsd3Z74+CauX4htzLg0lzAFBgMrZXADQQBM0NBaFVP
> d3cTJ\n"
> ++    "DSaZNT34fsHuJk4eagpn8mBxKQpghq4s8Ap+nYtp2KiXjcizss53PeLXVnk
> fyLi0\n"
> ++    "TLVBHvUJ\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* A (signed by B) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhQtdJpg+qlPcLoRW8iiztJUD4xNvDAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MTk1OVoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2h
> Bs32p\n"
> ++    "WbnINkmOSNmOiZlGHKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMB8GA1UdIwQYMBa
> AFJFA\n"
> ++    "s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBAPv674p9ek5GjRcRfVQhgN+
> kQlHU\n"
> ++    "u774wL3Vx3fWA1E7+WchdMzcHrPoa5OKtKmxjIKUTO4SeDZL/AVpvulrWwk
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* A (signed by C) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7Re
> VifwM\n"
> ++    "3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBa
> AFEh/\n"
> ++    "XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb
> 0+EBv\n"
> ++    "BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* B1 (signed by B) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBUjCCAQSgAwIBAgIUfpmrVDc1XBA5/7QYMyGBuB9mTtUwBQYDK2VwMBE
> xDzAN\n"
> ++    "BgNVBAMTBlJvb3QgQjAgFw0yNDAxMTEwNjI1MjdaGA85OTk5MTIzMTIzNTk
> 1OVow\n"
> ++    "GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEIxMCowBQYDK2VwAyEAh6ZTuJW
> sweVB\n"
> ++    "a5fsye5iq89kWDC2Y/Hlc0htLmjzMP+jYzBhMA8GA1UdEwEB/wQFMAMBAf8
> wDgYD\n"
> ++    "VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBTMQu37PKyLjKfPODZgxYCaayff+jA
> fBgNV\n"
> ++    "HSMEGDAWgBSRQLNq4Oo/MPQCiLUZzjjoxthRujAFBgMrZXADQQBblmguY+l
> nYvOK\n"
> ++    "rAZJnqpEUGfm1tIFyu3rnlE7WOVcXRXMIoNApLH2iHIipQjlvNWuSBFBTC1
> qdewh\n"
> ++    "/e+0cgQB\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* B (signed by A) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhRpEm+dWNX6DMZh/nottkFfFFrXXDAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTcyNloYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7Re
> VifwM\n"
> ++    "3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBa
> AFFti\n"
> ++    "A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAFvmcK3Ida5ViVYDzxKVLPc
> PsCHe\n"
> ++    "3hxz99lBrerJC9iJSvRYTJoPBvjTxDYnBn5EFrQYMrUED+6i71lmGXNU9gs
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* B (signed by C) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942AVzAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92hS97OGKbMzwrD7Re
> VifwM\n"
> ++    "3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG6MB8GA1UdIwQYMBa
> AFEh/\n"
> ++    "XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3gelXty8qtoTGIEJb
> 0+EBv\n"
> ++    "BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBcTATUSOvxakYRP9Q8
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* C1 (signed by C) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBUjCCAQSgAwIBAgIUSKsfY1wD3eD2VmaaK1wt5naPckMwBQYDK2VwMBE
> xDzAN\n"
> ++    "BgNVBAMTBlJvb3QgQzAgFw0yNDAxMTEwNjI1NDdaGA85OTk5MTIzMTIzNTk
> 1OVow\n"
> ++    "GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEMxMCowBQYDK2VwAyEA/t7i1ch
> ZlKkV\n"
> ++    "qxJOrmmyATn8XnpK+nV/iT4OMHSHfAyjYzBhMA8GA1UdEwEB/wQFMAMBAf8
> wDgYD\n"
> ++    "VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRmpF3JjoP3NiBzE5J5ANT0bvfRmjA
> fBgNV\n"
> ++    "HSMEGDAWgBRIf1yoyLjHhGr1+UFaMt/UPhoZ8DAFBgMrZXADQQAeRBXv6WC
> TOp0G\n"
> ++    "3wgd8bbEGrrILfpi+qH7aj/MywgkPIlppDYRQ3jL6ASd+So/408dlE0DV9D
> XKBi0\n"
> ++    "725XUUYO\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* C (signed by A) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhRvbZv3SRTjDOiAbyFWHH4y0yMZkjAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTg1MVoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e
> +qZEH\n"
> ++    "8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBa
> AFFti\n"
> ++    "A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAPl+SyiOfXJnjSWx8hFMhJ7
> w92mn\n"
> ++    "tkGifCFHBpUhYcBIMeMtLw0RBLXqaaN0EKlTFimiEkLClsU7DKYrpEEJegs
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    /* C (signed by B) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBSDCB+6ADAgECAhQU1OJWRVOLrGrgJiLwexd1/MwKkTAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MjAzMFoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6Ubhsa0gSa1vBCIO5e
> +qZEH\n"
> ++    "8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+GhnwMB8GA1UdIwQYMBa
> AFJFA\n"
> ++    "s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBALXeyuj8vj6Q8j4l17VzZwm
> Jl0gN\n"
> ++    "bCGoKMl0J/0NiN/fQRIsdbwQDh0RUN/RN3I6DTtB20ER6f3VdnzAh8nXkQ4
> =3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    NULL
> ++};
> ++
> ++static const char *cross_signed_ca[] =3D {
> ++    /* A (self-signed) */
> ++    "-----BEGIN CERTIFICATE-----\n"
> ++    "MIIBJzCB2qADAgECAhQs1Ur+gzPs1ISxs3Tbs700q0CZcjAFBgMrZXAwETE
> PMA0G\n"
> ++    "A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTYwMFoYDzk5OTkxMjMxMjM1OTU
> 5WjAR\n"
> ++    "MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDYyg3tgotSETL1Wq2h
> Bs32p\n"
> ++    "WbnINkmOSNmOiZlGHKNCMEAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8
> EBAMC\n"
> ++    "AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAHr
> Vv7E9\n"
> ++    "5scuOVCH9gNRRm8Z9SUoLakRHAPnySdg6z/kI3vOgA/OM7reArpnW8l1H2F
> apgpL\n"
> ++    "bDeZ2XJH+BdVFwg=3D\n"
> ++    "-----END CERTIFICATE-----\n",
> ++    NULL
> ++};
> ++
> + #if defined __clang__ || __GNUC__ > 4 || (__GNUC__ =3D=3D 4 &&
> __GNUC_MINOR__ >=3D 5)
> + #  pragma GCC diagnostic push
> + #  pragma GCC diagnostic ignored "-Wunused-variable"
> +@@ -4275,6 +4398,8 @@ static struct
> +   { "ed448 - ok", ed448, &ed448[0],
> GNUTLS_PROFILE_TO_VFLAGS(GNUTLS_PROFILE_ULTRA),
> +     0, NULL, 1584352960, 1},
> +   { "superseding - ok", superseding, superseding_ca, 0, 0, 0,
> 1590928011 },
> ++  { "cross signed - ok", cross_signed, cross_signed_ca, 0, 0, 0,
> ++    1704955300 },
> +   { NULL, NULL, NULL, 0, 0}
> + };
> +
> +--
> +GitLab
> +
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> index a1451daf2c..66700ac1b4 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> @@ -30,6 +30,7 @@ SRC_URI =3D
> "https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
gnupg.org%2Fftp%2Fgcrypt%2Fgnutls%2Fv%24&data=3D05%7C02%7Cranjitsinh.rathod=
%40kpit.com%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C638442751081653296%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DGe=
q4fyg7vtGrR9z497BrJ26xMNU7jJMLSucMGmdBLPc%3D&reserved=3D0{SHRT_VER}/gnutls-=
${PV}.ta
> r
>             file://CVE-2023-0361.patch \
>             file://CVE-2023-5981.patch \
>             file://CVE-2024-0553.patch \
> +           file://CVE-2024-0567.patch \
>  "
>
>  SRC_URI[sha256sum] =3D
> "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
>
>
>

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Anuj,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I didn't checked after applying patch if the crash went away or not.</div>
<div id=3D"Signature">
<p style=3D"text-align: left; background-color: rgb(255, 255, 255); margin:=
 0in; font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(32, 31,=
 30);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 16px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);"><br>
</span></p>
<p style=3D"text-align: left; background-color: rgb(255, 255, 255); margin:=
 0in; font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(32, 31,=
 30);">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 16px; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">Thanks=
,</span><span style=3D"font-family: &quot;Work Sans&quot;; font-size: 10pt;=
 color: rgb(89, 89, 89);"><br>
</span></p>
<p style=3D"text-align: left; background-color: rgb(255, 255, 255); margin:=
 0in; font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(32, 31,=
 30);">
<span style=3D"font-family: &quot;Work Sans&quot;; font-size: 10pt; color: =
rgb(89, 89, 89);">Best Regards,</span><br>
</p>
<p style=3D"text-align: left; background-color: rgb(255, 255, 255); margin:=
 0in 0in 12pt; font-family: Calibri, sans-serif; font-size: 11pt; color: rg=
b(32, 31, 30);">
<span style=3D"font-family: &quot;Work Sans Medium&quot;; color: rgb(89, 89=
, 89);"><b>Ranjitsinh Rathod</b></span><span style=3D"font-family: &quot;Wo=
rk Sans&quot;; font-size: 14pt; color: rgb(0, 137, 207);"><br>
</span><span style=3D"font-family: &quot;Work Sans&quot;; font-size: 9pt; c=
olor: rgb(127, 127, 127);">Technical Leader |&nbsp;&nbsp;| KPIT Technologie=
s Ltd.<br>
Cellphone: +91-84606 92403<br>
</span><span style=3D"font-family: &quot;Work Sans&quot;; font-size: 14pt; =
color: rgb(176, 255, 69);"><b><sup>________________________________________=
__<br>
</sup></b></span><span style=3D"font-family: &quot;Work Sans Medium&quot;; =
font-size: 12pt; color: gray;"><a href=3D"http://www.kpit.com/" target=3D"_=
blank" rel=3D"noopener noreferrer" style=3D"color: gray; margin: 0px;">KPIT=
</a></span><span style=3D"font-family: &quot;Work Sans&quot;; color: gray;"=
>&nbsp;</span><span style=3D"font-family: &quot;Work Sans&quot;; font-size:=
 12pt; color: gray;">|</span><span style=3D"font-family: &quot;Work Sans&qu=
ot;; font-size: 9pt; color: gray;">&nbsp;<a href=3D"http://www.kpit.com/lin=
kedin" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"color: gray; =
margin: 0px;">Follow
 us on LinkedIn</a></span></p>
<p style=3D"text-align: left; background-color: rgb(255, 255, 255); margin:=
 0in; font-family: Calibri, sans-serif; font-size: 11pt; color: rgb(32, 31,=
 30);">
<span style=3D"color: rgb(31, 73, 125);"><a href=3D"https://www.kpit.com/Th=
eNewBrand" target=3D"_blank" rel=3D"noopener noreferrer" style=3D"color: rg=
b(31, 73, 125); margin: 0px;"><img width=3D"620" height=3D"120" style=3D"wi=
dth: 6.4687in; height: 1.25in; margin: 0px;" data-outlook-trace=3D"F:1|T:1"=
 src=3D"cid:b5864a47-0d77-4ed4-88b7-4211465b5226"></a></span></p>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Anuj Mittal via lists.openembedded.org &lt;anuj.mittal=3Dintel.com@l=
ists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, February 23, 2024 2:21 PM<br>
<b>To:</b> ranjitsinhrathod1991@gmail.com &lt;ranjitsinhrathod1991@gmail.co=
m&gt;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists=
.openembedded.org&gt;<br>
<b>Cc:</b> Ranjitsinh Rathod &lt;Ranjitsinh.Rathod@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-Core][dunfell][PATCH] gnutls: Backport of CVE-2024-=
0567</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
Hi<br>
<br>
On Fri, 2024-02-23 at 13:42 +0530, Ranjitsinh Rathod wrote:<br>
&gt; From: Ranjitsinh Rathod &lt;ranjitsinh.rathod@kpit.com&gt;<br>
&gt;<br>
&gt; A vulnerability was found in GnuTLS, where a cockpit (which uses<br>
&gt; gnuTLS)<br>
&gt; rejects a certificate chain with distributed trust. This issue occurs<=
br>
&gt; when validating a certificate chain with cockpit-certificate-ensure.<b=
r>
&gt; This flaw allows an unauthenticated, remote client or attacker to<br>
&gt; initiate a denial of service attack.<br>
&gt;<br>
&gt; Link: <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2024-0567">https=
://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.nist.gov=
%2Fvuln%2Fdetail%2FCVE-2024-0567&amp;data=3D05%7C02%7Cranjitsinh.rathod%40k=
pit.com%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C638442751081633877%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Djo=
GRSbtXT4Vqw3ElPAMUGhl0Cib%2FJaFZmyjBOunskuY%3D&amp;reserved=3D0</a><br>
&gt; Link: <a href=3D"https://gitlab.com/gnutls/gnutls/-/issues/1521">https=
://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2=
Fgnutls%2Fgnutls%2F-%2Fissues%2F1521&amp;data=3D05%7C02%7Cranjitsinh.rathod=
%40kpit.com%7C3469f6cc73444e4b431508dc344ca848%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C638442751081640347%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=
=3Dcdib7a%2F6vvTJrC9Yf190DawOxodPO%2FysRQ%2FaRJI9b90%3D&amp;reserved=3D0</a=
><br>
<br>
Did you check whether the reproducer in this issue crashes for this<br>
version of GnuTLS as well and gets fixed after applying this modified<br>
patch? The code looks different so it'd be good to check if you haven't<br>
already.<br>
<br>
It doesn't seem to be reproducible in 3.6.13 for Ubuntu:<br>
<a href=3D"https://ubuntu.com/security/CVE-2024-0567">https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-=
2024-0567&amp;data=3D05%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73444=
e4b431508dc344ca848%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6384427510=
81643577%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DOpxR0vIp%2B6sSpGm76IluOr%=
2FMELATaaM391d8cN1tukc%3D&amp;reserved=3D0</a><br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; Link:<br>
&gt; <a href=3D"https://gitlab.com/gnutls/gnutls/-/commit/9edbdaa84e38b1bfb=
53a7d72c1de44f8de373405">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.=
com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F9edbdaa84e38b1bfb53a7d72c1de44f8de3734=
05&amp;data=3D05%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73444e4b4315=
08dc344ca848%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63844275108164675=
1%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D7YDtrJZ2GMG7YwOZ78BPAYJiEn5QfVhj=
QIPo2lsR5PI%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;ranjitsinh.rathod@kpit.com&gt;<br=
>
&gt; Signed-off-by: Ranjitsinh Rathod &lt;ranjitsinhrathod1991@gmail.com&gt=
;<br>
&gt; ---<br>
&gt;&nbsp; .../gnutls/gnutls/CVE-2024-0567.patch&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 190<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; meta/recipes-support/gnutls/gnutls_3.6.14.bb&nbsp; |&nbsp;&nbsp;=
 1 +<br>
&gt;&nbsp; 2 files changed, 191 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2024-<=
br>
&gt; 0567.patch<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch<br=
>
&gt; b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..1580cab277<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls/CVE-2024-0567.patch<br>
&gt; @@ -0,0 +1,190 @@<br>
&gt; +From 9edbdaa84e38b1bfb53a7d72c1de44f8de373405 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Daiki Ueno &lt;ueno@gnu.org&gt;<br>
&gt; +Date: Thu, 11 Jan 2024 15:45:11 +0900<br>
&gt; +Subject: [PATCH] x509: detect loop in certificate chain<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt; +There can be a loop in a certificate chain, when multiple CA<br>
&gt; +certificates are cross-signed with each other, such as A =1B$B"*=1B(B=
 B, B =1B$B"*=1B(B C,<br>
&gt; +and C =1B$B"*=1B(B A.&nbsp; Previously, the verification logic was no=
t capable of<br>
&gt; +handling this scenario while sorting the certificates in the chain<br=
>
&gt; in<br>
&gt; +_gnutls_sort_clist, resulting in an assertion failure.&nbsp; This pat=
ch<br>
&gt; +properly detects such loop and aborts further processing in a<br>
&gt; graceful<br>
&gt; +manner.<br>
&gt; +<br>
&gt; +Signed-off-by: Daiki Ueno &lt;ueno@gnu.org&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2024-0567<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F9edbdaa84e38b1=
bfb53a7d72c1&amp;data=3D05%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73=
444e4b431508dc344ca848%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6384427=
51081650067%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Du6syQB%2FfLBsYLfq8M3UZ=
jx0sQOK7YSYYhob%2FjtY7WFA%3D&amp;reserved=3D0<br>
&gt; de44f8de373405]<br>
&gt; +Signed-off-by: Ranjitsinh Rathod &lt;ranjitsinh.rathod@kpit.com&gt;<b=
r>
&gt; +Comment: Hunks refreshed to fix error during backporting this patch<b=
r>
&gt; +<br>
&gt; +---<br>
&gt; + lib/x509/common.c&nbsp;&nbsp; |&nbsp;&nbsp; 4 ++<br>
&gt; + tests/test-chains.h | 125<br>
&gt; ++++++++++++++++++++++++++++++++++++++++++++<br>
&gt; + 2 files changed, 129 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lib/x509/common.c b/lib/x509/common.c<br>
&gt; +index 861cace4c8..d749a062cd 100644<br>
&gt; +--- a/lib/x509/common.c<br>
&gt; ++++ b/lib/x509/common.c<br>
&gt; +@@ -1761,6 +1761,11 @@ gnutls_x509_crt_t *_gnutls_sort_clist(gn<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *clist_size =3D i;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (insorted[prev]) { /* loop detected */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; sorted[i] =3D clist[prev];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; insorted[prev] =3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +diff --git a/tests/test-chains.h b/tests/test-chains.h<br>
&gt; +index 9ce23764da..3e559fecd5 100644<br>
&gt; +--- a/tests/test-chains.h<br>
&gt; ++++ b/tests/test-chains.h<br>
&gt; +@@ -4106,6 +4106,129 @@ static const char *superseding_ca[] =3D {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; NULL<br>
&gt; + };<br>
&gt; +<br>
&gt; ++static const char *cross_signed[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* server (signed by A1) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBqDCCAVqgAwIBAgIUejlil+8DBffazcnMNwyOOP6=
yCCowBQYDK2VwMBo<br>
&gt; xGDAW\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BgNVBAMTD0ludGVybWVkaWF0ZSBBMTAgFw0yNDAxMTE=
wNjI3MjJaGA85OTk<br>
&gt; 5MTIz\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MTIzNTk1OVowNzEbMBkGA1UEChMSR251VExTIHRlc3Q=
gc2VydmVyMRgwFgY<br>
&gt; DVQQD\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;Ew90ZXN0LmdudXRscy5vcmcwKjAFBgMrZXADIQA1ZVS=
0PcNeTPQMZ+FuVz8<br>
&gt; 2AHrj\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;qL5hWEpCDgpG4M4fxaOBkjCBjzAMBgNVHRMBAf8EAjA=
AMBoGA1UdEQQTMBG<br>
&gt; CD3Rl\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;c3QuZ251dGxzLm9yZzATBgNVHSUEDDAKBggrBgEFBQc=
DATAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;B4AwHQYDVR0OBBYEFGtEUv+JSt+zPoO3lu0IiObZVoi=
NMB8GA1UdIwQYMBa<br>
&gt; AFPnY\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;v6Pw0IvKSqIlb6ewHyEAmTA3MAUGAytlcANBAAS2lyc=
87kH/aOvNKzPjqDw<br>
&gt; UYxPA\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;CfYjyaKea2d0DZLBM5+Bjnj/4aWwTKgVTJzWhLJcLta=
SdVHrXqjr9NhEhQ0<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* A1 (signed by A) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBUjCCAQSgAwIBAgIUe/R+NVp04e74ySw2qgI6KZg=
FR20wBQYDK2VwMBE<br>
&gt; xDzAN\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BgNVBAMTBlJvb3QgQTAgFw0yNDAxMTEwNjI1MDFaGA8=
5OTk5MTIzMTIzNTk<br>
&gt; 1OVow\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEExMCowBQY=
DK2VwAyEAlkTNqwz<br>
&gt; 973sy\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;u3whMjSiUMs77CZu5YA7Gi5KcakExrKjYzBhMA8GA1U=
dEwEB/wQFMAMBAf8<br>
&gt; wDgYD\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBT52L+j8NCLykq=
iJW+nsB8hAJkwNzA<br>
&gt; fBgNV\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;HSMEGDAWgBRbYgOkRGsd3Z74+CauX4htzLg0lzAFBgM=
rZXADQQBM0NBaFVP<br>
&gt; d3cTJ\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;DSaZNT34fsHuJk4eagpn8mBxKQpghq4s8Ap+nYtp2Ki=
Xjcizss53PeLXVnk<br>
&gt; fyLi0\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;TLVBHvUJ\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* A (signed by B) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhQtdJpg+qlPcLoRW8iiztJUD4x=
NvDAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MTk1OVoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDY=
yg3tgotSETL1Wq2h<br>
&gt; Bs32p\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;WbnINkmOSNmOiZlGHKNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDS=
XMB8GA1UdIwQYMBa<br>
&gt; AFJFA\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBAPv674p=
9ek5GjRcRfVQhgN+<br>
&gt; kQlHU\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;u774wL3Vx3fWA1E7+WchdMzcHrPoa5OKtKmxjIKUTO4=
SeDZL/AVpvulrWwk<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* A (signed by C) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942=
AVzAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92=
hS97OGKbMzwrD7Re<br>
&gt; VifwM\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG=
6MB8GA1UdIwQYMBa<br>
&gt; AFEh/\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3=
gelXty8qtoTGIEJb<br>
&gt; 0+EBv\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBc=
TATUSOvxakYRP9Q8<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* B1 (signed by B) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBUjCCAQSgAwIBAgIUfpmrVDc1XBA5/7QYMyGBuB9=
mTtUwBQYDK2VwMBE<br>
&gt; xDzAN\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BgNVBAMTBlJvb3QgQjAgFw0yNDAxMTEwNjI1MjdaGA8=
5OTk5MTIzMTIzNTk<br>
&gt; 1OVow\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEIxMCowBQY=
DK2VwAyEAh6ZTuJW<br>
&gt; sweVB\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;a5fsye5iq89kWDC2Y/Hlc0htLmjzMP+jYzBhMA8GA1U=
dEwEB/wQFMAMBAf8<br>
&gt; wDgYD\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBTMQu37PKyLjKf=
PODZgxYCaayff+jA<br>
&gt; fBgNV\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;HSMEGDAWgBSRQLNq4Oo/MPQCiLUZzjjoxthRujAFBgM=
rZXADQQBblmguY+l<br>
&gt; nYvOK\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;rAZJnqpEUGfm1tIFyu3rnlE7WOVcXRXMIoNApLH2iHI=
ipQjlvNWuSBFBTC1<br>
&gt; qdewh\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;/e+0cgQB\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* B (signed by A) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhRpEm+dWNX6DMZh/nottkFfFFr=
XXDAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTcyNloYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92=
hS97OGKbMzwrD7Re<br>
&gt; VifwM\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG=
6MB8GA1UdIwQYMBa<br>
&gt; AFFti\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAFvmcK3=
Ida5ViVYDzxKVLPc<br>
&gt; PsCHe\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;3hxz99lBrerJC9iJSvRYTJoPBvjTxDYnBn5EFrQYMrU=
ED+6i71lmGXNU9gs<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* B (signed by C) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhReNpCiVn7eFDUox3mvM5qE942=
AVzAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBDMCAXDTI0MDExMTA2MjEyMVoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEIwKjAFBgMrZXADIQAYX92=
hS97OGKbMzwrD7Re<br>
&gt; VifwM\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;3iz5tnfQHWQSkvvYMKNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFJFAs2rg6j8w9AKItRnOOOjG2FG=
6MB8GA1UdIwQYMBa<br>
&gt; AFEh/\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;XKjIuMeEavX5QVoy39Q+GhnwMAUGAytlcANBAIwghH3=
gelXty8qtoTGIEJb<br>
&gt; 0+EBv\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BH4YOUh7TamxjxkjvvIhDA7ZdheofFb7NrklJco7KBc=
TATUSOvxakYRP9Q8<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* C1 (signed by C) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBUjCCAQSgAwIBAgIUSKsfY1wD3eD2VmaaK1wt5na=
PckMwBQYDK2VwMBE<br>
&gt; xDzAN\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;BgNVBAMTBlJvb3QgQzAgFw0yNDAxMTEwNjI1NDdaGA8=
5OTk5MTIzMTIzNTk<br>
&gt; 1OVow\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;GjEYMBYGA1UEAxMPSW50ZXJtZWRpYXRlIEMxMCowBQY=
DK2VwAyEA/t7i1ch<br>
&gt; ZlKkV\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;qxJOrmmyATn8XnpK+nV/iT4OMHSHfAyjYzBhMA8GA1U=
dEwEB/wQFMAMBAf8<br>
&gt; wDgYD\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;VR0PAQH/BAQDAgIEMB0GA1UdDgQWBBRmpF3JjoP3NiB=
zE5J5ANT0bvfRmjA<br>
&gt; fBgNV\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;HSMEGDAWgBRIf1yoyLjHhGr1+UFaMt/UPhoZ8DAFBgM=
rZXADQQAeRBXv6WC<br>
&gt; TOp0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;3wgd8bbEGrrILfpi+qH7aj/MywgkPIlppDYRQ3jL6AS=
d+So/408dlE0DV9D<br>
&gt; XKBi0\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;725XUUYO\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* C (signed by A) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhRvbZv3SRTjDOiAbyFWHH4y0yM=
ZkjAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTg1MVoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6U=
bhsa0gSa1vBCIO5e<br>
&gt; +qZEH\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+Ghn=
wMB8GA1UdIwQYMBa<br>
&gt; AFFti\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A6REax3dnvj4Jq5fiG3MuDSXMAUGAytlcANBAPl+Syi=
OfXJnjSWx8hFMhJ7<br>
&gt; w92mn\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;tkGifCFHBpUhYcBIMeMtLw0RBLXqaaN0EKlTFimiEkL=
ClsU7DKYrpEEJegs<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* C (signed by B) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBSDCB+6ADAgECAhQU1OJWRVOLrGrgJiLwexd1/Mw=
KkTAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBCMCAXDTI0MDExMTA2MjAzMFoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEMwKjAFBgMrZXADIQDxm6U=
bhsa0gSa1vBCIO5e<br>
&gt; +qZEH\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;8Oocz+buNHfIJbh5NaNjMGEwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFEh/XKjIuMeEavX5QVoy39Q+Ghn=
wMB8GA1UdIwQYMBa<br>
&gt; AFJFA\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;s2rg6j8w9AKItRnOOOjG2FG6MAUGAytlcANBALXeyuj=
8vj6Q8j4l17VzZwm<br>
&gt; Jl0gN\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;bCGoKMl0J/0NiN/fQRIsdbwQDh0RUN/RN3I6DTtB20E=
R6f3VdnzAh8nXkQ4<br>
&gt; =3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; NULL<br>
&gt; ++};<br>
&gt; ++<br>
&gt; ++static const char *cross_signed_ca[] =3D {<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* A (self-signed) */<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----BEGIN CERTIFICATE-----\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MIIBJzCB2qADAgECAhQs1Ur+gzPs1ISxs3Tbs700q0C=
ZcjAFBgMrZXAwETE<br>
&gt; PMA0G\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;A1UEAxMGUm9vdCBBMCAXDTI0MDExMTA2MTYwMFoYDzk=
5OTkxMjMxMjM1OTU<br>
&gt; 5WjAR\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;MQ8wDQYDVQQDEwZSb290IEEwKjAFBgMrZXADIQA0vDY=
yg3tgotSETL1Wq2h<br>
&gt; Bs32p\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;WbnINkmOSNmOiZlGHKNCMEAwDwYDVR0TAQH/BAUwAwE=
B/zAOBgNVHQ8BAf8<br>
&gt; EBAMC\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;AgQwHQYDVR0OBBYEFFtiA6REax3dnvj4Jq5fiG3MuDS=
XMAUGAytlcANBAHr<br>
&gt; Vv7E9\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;5scuOVCH9gNRRm8Z9SUoLakRHAPnySdg6z/kI3vOgA/=
OM7reArpnW8l1H2F<br>
&gt; apgpL\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;bDeZ2XJH+BdVFwg=3D\n&quot;<br>
&gt; ++&nbsp;&nbsp;&nbsp; &quot;-----END CERTIFICATE-----\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp; NULL<br>
&gt; ++};<br>
&gt; ++<br>
&gt; + #if defined __clang__ || __GNUC__ &gt; 4 || (__GNUC__ =3D=3D 4 &amp;=
&amp;<br>
&gt; __GNUC_MINOR__ &gt;=3D 5)<br>
&gt; + #&nbsp; pragma GCC diagnostic push<br>
&gt; + #&nbsp; pragma GCC diagnostic ignored &quot;-Wunused-variable&quot;<=
br>
&gt; +@@ -4275,6 +4398,8 @@ static struct<br>
&gt; +&nbsp;&nbsp; { &quot;ed448 - ok&quot;, ed448, &amp;ed448[0],<br>
&gt; GNUTLS_PROFILE_TO_VFLAGS(GNUTLS_PROFILE_ULTRA),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; 0, NULL, 1584352960, 1},<br>
&gt; +&nbsp;&nbsp; { &quot;superseding - ok&quot;, superseding, superseding=
_ca, 0, 0, 0,<br>
&gt; 1590928011 },<br>
&gt; ++&nbsp; { &quot;cross signed - ok&quot;, cross_signed, cross_signed_c=
a, 0, 0, 0,<br>
&gt; ++&nbsp;&nbsp;&nbsp; 1704955300 },<br>
&gt; +&nbsp;&nbsp; { NULL, NULL, NULL, 0, 0}<br>
&gt; + };<br>
&gt; +<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; b/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; index a1451daf2c..66700ac1b4 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; @@ -30,6 +30,7 @@ SRC_URI =3D<br>
&gt; &quot;<a href=3D""></a>https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fwww.gnupg.org%2Fftp%2Fgcrypt%2Fgnutls%2Fv%24&amp;data=
=3D05%7C02%7Cranjitsinh.rathod%40kpit.com%7C3469f6cc73444e4b431508dc344ca84=
8%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638442751081653296%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DGeq4fyg7vtGrR9z497BrJ26xMNU7jJMLSucMGmdBLPc=
%3D&amp;reserved=3D0{SHRT_VER}/gnutls-${PV}.ta<br>
&gt; r<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-0361.patch">file://CVE-2023-0361.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-5981.patch">file://CVE-2023-5981.patch</a> \<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2024-0553.patch">file://CVE-2024-0553.patch</a> \<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2024-0567.patch">file://CVE-2024-0567.patch</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt; &quot;5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63=
&quot;<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_--

--_004_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_
Content-Type: image/png; name="Outlook-bjnekkpf.png"
Content-Description: Outlook-bjnekkpf.png
Content-Disposition: inline; filename="Outlook-bjnekkpf.png"; size=22485;
	creation-date="Fri, 23 Feb 2024 08:58:47 GMT";
	modification-date="Fri, 23 Feb 2024 08:58:47 GMT"
Content-ID: <b5864a47-0d77-4ed4-88b7-4211465b5226>
Content-Transfer-Encoding: base64

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
t73vjsD/DzX/H827ae66AAAAAElFTkSuQmCC

--_004_MA0PR01MB91741F78A54AF074F148CC638F552MA0PR01MB9174INDP_--

