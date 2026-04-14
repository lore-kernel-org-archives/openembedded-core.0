Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B9DED7B9D
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 10:32:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15751.1776162765578328781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Apr 2026 03:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=W0Vua1Ff;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQLJ1vYtg80KyXiDxkdynGsbGpIV84mLejIDRWdRt4NrHxQx33DKAlP7uVJYKlCKKMskHzXTABlqnB5S4ewJJISw2GU+ormjPzrPV4Gun6cIggMbToxCl/kFDVVw3QU3WIaOTvs9Q0011sZk3Gk7EHlSHkpeZ3z4E6lKzCwxPN5Lwvl4lydevphxaXinBy0dI4TYMICw/WZ5te+ZJkJtVrQN/p0VZxvUIxUtehoMzwfdae9WPDG8xTd6tqtCATOnJQTE3p9j+z6foZDPCCpxaSUk8ziJ5gcB3DTsflT8znWw3nTgNq+qWiX+HAMtK6RR0DD6jMcWizQhDxrWbNQX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTvTc4l1Zspe43JmfldbXIeFh0f45Qgv3OecGwUac5U=;
 b=olQXnUlsV1SAvUGZ0QY8dcgZG+pPPuR2xp+MVmij8aAs8+cHOx/7B9Uqz9huQkhDdFLQiQd4Cjy9Zw3Gq73dSU/JBJOEaygfVQqe95B9kI7DzuSafKpZy/gyEhJNkWjfHVItdN+VeiOEJ781h/w8SswuW5R15Iff7OqH7CxTHZNbcz9qiakerVwiA5F1u6g2PBWY+4PocQvwWkAShKPTtZKWXhw5L4af5NO95PM+eZP3h3firpVrvcdCzv4kgZGRyt3wqhv16lTKAKF73IO1/6MbMOZZg1GQ7G8uYhotWlwyZLCzyl/Hp2mB74/LxdML/yHL7OAjEWjmRWAD2wuUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTvTc4l1Zspe43JmfldbXIeFh0f45Qgv3OecGwUac5U=;
 b=W0Vua1FfTwJg8jHVVKI6JWn6MOGYpiU7qfmhbciW2zIery9uC8oL7hPnLd8Chbq2vt7A+8a0oHPPTSPk33IXht9q7K0Q2+0rHEZI8Xoz8mtCFo2pgQRNl4Mg6W2eQM0hG02+7IDt1kk0AUUbWm7p9QALsIw76BwEDaBjoJRMs5VIVYFKJrJ34zcNUaFvBVclU4PE1BMJcspW9jARDW3Qas3GezwBOuOXgU8tEFiegWZkXWrRxSxjG9FP9ja5e16khlS9ZAzPK9EzdmKMjrQLKBMDgc2aKwLNwNirKbkIzn5e0JgeaD2SPmBdK8+hTNScqH3QuBBBp00sbjDkOIYkxA==
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a9e)
 by VI0P189MB3591.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 10:32:40 +0000
Received: from DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb]) by DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
 ([fe80::48a0:eb8a:db1e:38bb%7]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 10:32:40 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Jose Quaresma <quaresma.jose@gmail.com>
CC: "Marko, Peter" <Peter.Marko@siemens.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] go: add ptest support
Thread-Topic: [OE-core][PATCH v3] go: add ptest support
Thread-Index: 
 AQHctuAS1f4kqTMs1E2dSBBjEhx6D7W1bX0AgCef7zuAAAaLAIAAqLyogADDg4CAAAXccw==
Date: Tue, 14 Apr 2026 10:32:40 +0000
Message-ID: 
 <DU2PPFB77F8FB19EC0AAC9F42F88596220EFE252@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260318140356.7609-1-pratik.farkase@est.tech>
 <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
 <VI6PPF734FBAD1FE9D4D1744B8CD242E774FE242@VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM>
 <AS1PR10MB5697E557D5CACB6216753B35FD242@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DU2PPFB77F8FB199ADB8C70D1EF9FF0DF10FE242@DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM>
 <CANPvuRmVm1CihjHVEbKekoqmc-WYo69i=WT1xtGBXe+G=70RHA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRmVm1CihjHVEbKekoqmc-WYo69i=WT1xtGBXe+G=70RHA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU2PPFB77F8FB19:EE_|VI0P189MB3591:EE_
x-ms-office365-filtering-correlation-id: 50431729-bec1-49b3-5ad7-08de9a1127e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|18002099003|22082099003|38070700021|56012099003;
x-microsoft-antispam-message-info: 
 UWGqr1N8gnLbYmOiZDjTeejJB7ObLet2+liKR8Ir0YtJ0Q0Cg8tzmC/EyjHpbePbsAGf86Fcex+Y+M+sTey1k8PWGBx0cA8nknHiY7Zv0pnW8/tOeIbdjGPxdtdp1eQbsMS8X/Spt+A4whQ85fNFTdWxDxOrn+l2y2oGz/vDGVMJBh7dMBHQ1z5Hz9YOAv/SYVQ2wYgeUEDFz8a6h8aq2gWe5/LEOse1xilePvqj/Mercf1EJ20sxzV15s7EHwEs4pX1/ifiwcRWBq5kBUODuD+k3fzBx+NBi11/Hv9mvtS0q63Z+RR5+E66hI/n7pkt0Zc3oRY6z/rzEGypRMbZCHlnVq6wt4Mt8STgsXZtHk0fdJONytnlFKps6mf1k0ykXKpKhMHg0wypWBSMJVxrKbcf6iKFyLkpXmBQmTnJOiEJYEcS2+oJMvMVjxEBpiiu6F/Qd2aU6ixKSCSlb4aZnLgkJNjTon0aK6bsWumQsx/Bq3xlK2WNtKe3q9TxVGE+OLEPbueb33Pw0E7+24igZg6Itt8zhA24t4J+zrU6d38FgIIa3Y4Fhcd/3Ex+/kwzXDhbCTg2CJ8QfxKFChQ9J2521LzaPsiCwu7vRr7kAyEVnazMtJPNFvQURmj9G19JXSkySoqUaVJlxYM2eIEMePJkOhdyJze+RHb/YVVvXND1VWw41aV5UGZv5g+GzXEYG79ioVq+2Hb7AlBg9k5k5R8MnN5ReZSMGcWgt193Eb4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(18002099003)(22082099003)(38070700021)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Q4gLlT+Wd6wPxR2V2N6XbovbX7voFNTcriHbbUB7IZyUO70odVwCF8mltC?=
 =?iso-8859-1?Q?77n/F8EjfNWe1VMnPhPuq2X2TI6eyikFAHKl8hLhuJPEpbCj0QnNK+SByW?=
 =?iso-8859-1?Q?tmK2TyamAL3Sefh4cmu1iuc2c0czSeGsGiZfjJ0N3ZyNVQyC7i3iTXUmQ6?=
 =?iso-8859-1?Q?GhMm16HX9RasiO5axbKxJUi2aJI/XHY0s/MsKfaGBuawhkBPMiM/9c7iKM?=
 =?iso-8859-1?Q?nlkDOThaR6YDakbeED1sPq9BV5LwoSL7lwgK0/llylK9gVAvNE0nhRygVF?=
 =?iso-8859-1?Q?NHL1kc/3L5ZMztnDKJ9pXl/2sJYEPDf/at9tgPHJVdnMCjkOGhwrONXYjM?=
 =?iso-8859-1?Q?vVzl9XkgXsJA11YJAS9FNZ9Vb9WTsFZK2hlbM/gvtyHjtK6wlV+tvDo9w3?=
 =?iso-8859-1?Q?wRYlJlvdhRcCBwv+FVjbm2q7eDczIZGm+hiIxwgcDWRnMTqSL8m3jrxYyt?=
 =?iso-8859-1?Q?+s/MyojHq52nf4yhnXRxFRAtD5T8NNt7IERqadQSUvRCTPZRyLFkNE1qMX?=
 =?iso-8859-1?Q?R5FT0JbvahcgoBeoveEc+m+xkKlS+s+y96iddoh277qbhCqd4j6u4mY9bl?=
 =?iso-8859-1?Q?fXCcgRXI/f792PM9PmyPiVzxmCHpDkdYwmSGacWxF4ESLBXMZ2vn1G7b6X?=
 =?iso-8859-1?Q?ra++w2q+QAgX7fkIf8DGAO7OPbb5/CN9rgm8jprnzDlam4QqQ7UhpZ5RaJ?=
 =?iso-8859-1?Q?Bd8xi9zqb4tjnaFu3ZjJXxwaq5IRz8D6veCbQsJ0P2YsbVk2roJ9LX+yze?=
 =?iso-8859-1?Q?thwNOeZ+PDjxAqrqy2bcQ3Xi5YQr6XLGq22RGLPiduqfjOoZ3XCtPdMXzf?=
 =?iso-8859-1?Q?E8s14CBPYXgA0STKKZfHhHeteAwX0Ht0JfVVlzlhw2LWCh43JYaTPjDvjY?=
 =?iso-8859-1?Q?ViCqYxvjnPdEW+et+XlYMOkhPRf1+luzChaLuA+Wnb+nHFk3DMbcYs4hku?=
 =?iso-8859-1?Q?2B1vluPT7LojHxN+Ic3OXfeK/QqHTPTaHPvx/g10Bo72qyGyVCJo2Kk7Fn?=
 =?iso-8859-1?Q?yjEVm2i3WJ1dXTKueeuTUay8l04lw+9sxsbI5OW+X7ZAPDNWZHXjd+dQCS?=
 =?iso-8859-1?Q?GCWhMhvembL5sDeP6g2y7kN+SB9ZFwTXWQS5vVMcPaYuO+0eW2ihfBtoNV?=
 =?iso-8859-1?Q?mnaeGQgg6Tze4cdazxqhA0kch/8103Vjx7QVb5yS+8pNxMGh9Tu1VcQacY?=
 =?iso-8859-1?Q?KzMm63jS2Dhw/sA3cvQ7al3zeEDNdFnPC08g4BllFlS5Ltyytn8GkInvzd?=
 =?iso-8859-1?Q?gcXJ7JXXCnC1hPs4iSuWb3ApqF4gnaCpvXF8l6EA8KaNIlDnr5o4siB0nU?=
 =?iso-8859-1?Q?328XeWjM7lFzZNfqBh30/zm3f7NuoljBTOVmVtmlnpz46i1HXsjXCOklIM?=
 =?iso-8859-1?Q?1N10jR6sGVzdd45wplKrZEJebBlSFsGq7QR9CrOeGt+r9qwvJfYL+teCob?=
 =?iso-8859-1?Q?GMp5UXsuX62ZkzS7HM2sSO+MSKk43n+amRF8sgahKuWv9x7oNb1FibVpek?=
 =?iso-8859-1?Q?qvQ5cBJIRZgww5Tvq/xfDCgyRVqNeq42W0y16/QmKsdWbwsEA7lh5LjHxN?=
 =?iso-8859-1?Q?LkrIqVscSVwJsFvxZixvJCNC/deDFqU3rQLRwiwk4hG04zEtSXMW73OfMD?=
 =?iso-8859-1?Q?aZX2DlB2EhHXvNjUetpfBiEnxZxIloEiwvNnSI+nKmHSIhiXsUpmp1vLSw?=
 =?iso-8859-1?Q?5NO/qOWfZl2v6u/2enmUbjcVCzP6XysYMhZio5j9aU3n4bEqvmzUFKziH5?=
 =?iso-8859-1?Q?RoqRcVIG/BVcLmWcimy2A6BuRonvVL07HIUkhwv8O6GUq0chBLjOM4j42K?=
 =?iso-8859-1?Q?vn/9ek/5UA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU2PPFB77F8FB19.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 50431729-bec1-49b3-5ad7-08de9a1127e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2026 10:32:40.6840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fX4HQHcRGUTk345YkcUnpfkyf9ZqLxlwbQYwa+hP7juVxNxDff60BWxeAGg2IpXh/uprFH1vcz8B5TB6i6jKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3591
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 10:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235152

Rebased on master tip golang 1.26.2 in in v6.

Best Regards,
Pratik

________________________________________
From: Jose Quaresma <quaresma.jose@gmail.com>
Sent: Tuesday, April 14, 2026 12:10 PM
To: Pratik Farkase
Cc: Marko, Peter; Mathieu Dubois-Briand; openembedded-core@lists.openembedd=
ed.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] go: add ptest support

Hi Pratik,

Can you please rebase on the master tip that has the golang 1.26.2.

Jose

Pratik Farkase via lists.openembedded.org<http://lists.openembedded.org> <p=
ratik.farkase=3Dest.tech@lists.openembedded.org<mailto:est.tech@lists.opene=
mbedded.org>> escreveu (segunda, 13/04/2026 =E0(s) 23:37):
Hi Peter,

Thanks for the suggestion to use QB_MEM override in core-image-ptest.bb<htt=
p://core-image-ptest.bb>! Great to have these multiconfig settings already =
which i was not aware of. I have sent a v5 patch after testing it locally. =
It will run full go testsuite and the total run time is around ~66 minutes.

Attached the test results here along with qemu boot log.

Best Regards,
Pratik

________________________________________
From: Marko, Peter <Peter.Marko@siemens.com<mailto:Peter.Marko@siemens.com>=
>
Sent: Monday, April 13, 2026 2:27 PM
To: Pratik Farkase; Mathieu Dubois-Briand; openembedded-core@lists.openembe=
dded.org<mailto:openembedded-core@lists.openembedded.org>
Cc: pratik.farkase@ericsson.com<mailto:pratik.farkase@ericsson.com>
Subject: RE: [OE-core][PATCH v3] go: add ptest support

Hello Pratik,

I think that better is to run the full testsuite and increase QB_MEM for vi=
rtclass-mcextend-go under
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/image=
s/core-image-ptest.bb#n36

Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org<mailto:openembedded-core@l=
ists.openembedded.org> <openembedded-
> core@lists.openembedded.org<mailto:core@lists.openembedded.org>> On Behal=
f Of Pratik Farkase
> Sent: Monday, April 13, 2026 2:05 PM
> To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com<mailto:mathi=
eu.dubois-briand@bootlin.com>>; openembedded-
> core@lists.openembedded.org<mailto:core@lists.openembedded.org>
> Cc: pratik.farkase@ericsson.com<mailto:pratik.farkase@ericsson.com>
> Subject: Re: [OE-core][PATCH v3] go: add ptest support
>
> Hi Mathieu,
>
> Apologies for getting back bit late and thanks for testing v3 and identif=
ying the OOM
> issue.
>
> The root cause is that Go's test suite performs on-the-fly compilation du=
ring
> test execution. Even with the autobuilder's 1GB RAM (QB_MEM =3D '-m 1024'=
),
> attempting all 253 stdlib packages causes OOM kills as compilation proces=
ses
> consume ~1.5GB.
>
> For v4, I've switched to a curated subset of 17 core packages that comple=
te
> successfully within the 1GB constraint:
>
> Test results on qemux86-64 with 1GB RAM: 17/17 pass (100%) in ~6-7 minute=
s.
>
> Best Regards,
> Pratik
>
> ________________________________________
> From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com<mailto:mat=
hieu.dubois-briand@bootlin.com>>
> Sent: Thursday, March 19, 2026 7:57 AM
> To: Pratik Farkase; openembedded-core@lists.openembedded.org<mailto:opene=
mbedded-core@lists.openembedded.org>
> Cc: pratik.farkase@ericsson.com<mailto:pratik.farkase@ericsson.com>
> Subject: Re: [OE-core][PATCH v3] go: add ptest support
>
> On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:
> > Add ptest infrastructure to test the Go standard library.
> >
> > - Run 'go test -short std' via run-ptest script
> > - Install source tree and pkg/include headers
> > - Create VERSION file for architecture detection
> > - Exclude multi-arch binary testdata to avoid QA errors
> >
> > Test results: 237/253 pass (93.7%) on qemux86-64.
> >
> > Known issues:
> > - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary t=
estdata
> > - time: requires embedded timezone data
> > - net/http: requires unstripped go binary
> > - testing, go/types: minor edge cases
> >
> > Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> > ---
> > Changes in v3:
> > - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
> >   inside ptest-packagelists.inc
> >
> > Changes in v2:
> > - Exclude .elf* files to fix QA arch errors on all architectures
> > - Exclude *-x86-64* files to fix additional arch-specific test binaries
> > - Tested on x86-64, x86, aarch64, and arm builds
> > ---
>
> Hi Pratik,
>
> Thanks for the new version, but we still have some failures:
>
> WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing ptes=
ts.
> Traceback (most recent call last):
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>     return func(*args, **kwargs)
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_=
expectfail
>     self.do_ptestrunner()
>     ~~~~~~~~~~~~~~~~~~~^^
>   File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openemb=
edded-
> core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunner
>     self.fail(failmsg)
>     ~~~~~~~~~^^^^^^^^^
> AssertionError: ERROR: Processes were killed by the OOM Killer:
> [  132.843492] Out of memory: Killed process 769 (compile) total-vm:15536=
64kB,
> anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB
> oom_score_adj:0
>
>
> Failed ptests:
> {'go': ['archive/tar',
>         'archive/zip',
>         'bufio',
>         'bytes',
>         'cmp',
>         'compress/bzip2',
>         'compress
>         ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3319
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3294
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1277
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#235132): https://lists.openembedded.org/g/openembedded-=
core/message/235132
Mute This Topic: https://lists.openembedded.org/mt/118383123/5052612
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quar=
esma.jose@gmail.com<mailto:quaresma.jose@gmail.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
Best regards,

Jos=E9 Quaresma

