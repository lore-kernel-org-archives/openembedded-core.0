Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815B8C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 11:07:27 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4858.1787224037341154645
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 04:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=t/rCj7Xw;
 spf=pass (domain: est.tech, ip: 52.101.66.59, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CVuFl6RRT7YoM3r8hOu5wXGlTZMfI1tLn5OQd8yuiOcBwAkDrzOjXmb2wfQT0RuMVRnAlzEkt17w41VcvdNnonh3u33d6E7tr2zYeDKqEX6TJ6x7Jg9W9jtSoiuwkwa/gjF9nrnRHb3LpO1+bPJhGThkNTIlFiJYp3Libjy4F9kCxyqQKWuqTbH0d2QBaRQhKymm6mU3n8w2XjQdj3pGxRpcgv/VVgbLfqMeVxOm6P6kQ53XULl6rzOzQgX2vky9zEjWitjRAew8VRwULvEDJX+QJiPXarUrbdU7tdO/ez25HDwh9GbKNinpfVH/Cz2otYBf4S/e6DTMg6a+Pb9cEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9VoCMQW7tlDkODvasJLM/E4eHbzLtBFOGOX9i+SGjo=;
 b=auRNHjfY7L6Dk9oYw0yaYym9ArJ9mDf0EdvX9/MX9VqYvCt7RsFhi0kOa8gyXIKCn3byGlfp/1ZGEXP9WzrUZziXP92vqQIcOFtiyScAxr5knWriL96YvJGtJI4X51O+dNRK99K7CpqcwckC4VefPkHRn4pkwA7NLABbUpriOkoiSgCqKQdyQOiQ21Ilqk7WSMyU0NYHD7/ECJ0/yeAWivDibCcFJv80vJ+IBrcPFvoP7WmpBtFzbrv3/Wam9DMMpwkTLfHB8DjfPva0YRohomvcW+R4T9FOMSKhSlFKWGo/eSbA7MwsAD8BIzcxdEbyNeIfwp/ngi4+6bnwBDP5Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9VoCMQW7tlDkODvasJLM/E4eHbzLtBFOGOX9i+SGjo=;
 b=t/rCj7Xwkp5xs9hXXth4tiancFByPLIMAUBhyJGcctND+tcylzYiW3uaTZupLg2iRshStS3AnD8Btrbb+vR7JieY2ohSqwVKz6Sr2G6l8RbyfCB8K0GFlYtk60cPGNYL5k7cobFKbpeclBbzlN3gD58/zeir6aLJn5YTsRO9erBYCulMxaiYPvo9WXmXV10a7UENJ6Ti0w/F8VKVN32PFskLnm/M0b7C2eH2G2eDGi3zmJcC9iACj51fq5W9GI9a8NsTio+eqmOHs1ZHrnC1j2U7zNSLPdHZUOssG+A+24+r2fnWfDP62ICkzuwMZTmJ3FQd0s1B8uEHh5zGM1WszA==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by AS8P189MB2394.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:57d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 11:07:13 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 11:07:12 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] procps: ptest: skip flaky pgrep full process
 name match test
Thread-Topic: [OE-core][PATCH v1] procps: ptest: skip flaky pgrep full process
 name match test
Thread-Index: AQHdLuxUDliN0nxlq0aYkZyzHAKx9Lamv22AgAAKYYw=
Date: Thu, 20 Aug 2026 11:07:12 +0000
Message-ID: 
 <PA3P189MB323991E4762B92C6DBE616C9FEA42@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20260818083402.15727-1-pratik.farkase@est.tech>
 <CANNYZj-BTPuS5ygN6iyKAZzqjuQP7gb3CQBMP+6Z7VtMi2izdA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-BTPuS5ygN6iyKAZzqjuQP7gb3CQBMP+6Z7VtMi2izdA@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|AS8P189MB2394:EE_
x-ms-office365-filtering-correlation-id: 661b101b-f1ee-4286-e162-08defeab2fe8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 yBmA4aOaBCJB3HsWZFzua+/9Fhq+uJ6xJjLWbPGcG6hUz5YRMTpPfmrxGyZh9hmFxwfXNLjjdRYN75zO06VBYDRMeXVSgx/upqclVOsJ9yw5RH97slrwA/RkhKOtqJkZ/L1YNQJZFuu1+mGWn8V6fy4hAKO5LrMW3LzlBD2NMq/Kf5pJllfDHaq+oBwlsfsREd2lFzzJIb/p8U7/okwa2eRyhpQ0jRCXRUHVBTYfVMtul/Rnge1jxlQHJu5+OmXSUTs7bi1qtmYiBgrXtjWPFwAMILSAMJrYjroFMYyMgyvSL/0NoLiecyMJuwTShvk802GBPv3bmbmr+rRD/tBhjIad4AcnxL+TzHeoU/gCx915AO6AuTPWJUoBuxP1vG8FOC4Yh4I7ern13BPFappLBCXcL7RoJcvGwcQlXgGdHpvn1s17h9RzY8O1B4MUm3D3T5QlByK5kYeShlHQK89/nuEWNH7RbdNrm7usChWN8Re9anQ0iZ6B2Lm/oXA4UeEA1p/mtUKrvtzcV9sEwMuAG1BHTbldDkeKJZDNuicyOGpyOHRfObuU5HPPGUcSqyVKMetZYY37KJ6Y9lGU+hnZ9Mlvb5Kqx9HqMzxN1Dn70xvTqGNyXQQVuqFinKmf0XXiPZJweyuGdLi2IyxeW1FfVlv8/jSrxU49g8s5UL3CxlU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?BO4r805s/M7bW/wx5lPjzZNYPzRam6FairzxqC9itsOaPzJiuS5bGMmJjR3y?=
 =?us-ascii?Q?ng+vsbYDctEsXsXiw+KFXoODLWP74WY/IL2NVhy6KpsDvkeiNDKnW6FQoDgi?=
 =?us-ascii?Q?8c66Y5r1Za9IOsyXELLFewAFmOPMggcvjD/6UvqaimZKPmyCjuO9rYzxkGwG?=
 =?us-ascii?Q?uiXqh6kKbDlmfq4ZxJRnsIf84/js8RBKZ5AYxT6JtPjgQoGs2SbFBS7xNgiF?=
 =?us-ascii?Q?xEQUFf8CgaX3edHbK0wl/jMKutSJlMMcWhsOudQEGliZeylf+oflz+CI7VaN?=
 =?us-ascii?Q?Va1W4Xt7NNKW0ETPsJ670aXNFzNH3YB5asne8UitJRUfgnvq4EpG2E31u6iP?=
 =?us-ascii?Q?9fvbrAje4JLANL/8Mr0+488CBuGWKR5HauG8YBBSQ/YB/H8Tt4u5SXuUQ6BF?=
 =?us-ascii?Q?/dVSTyoX/gn3MrTMFimfFuKUwo8T6IupY90JY/KEh6jHN7IPcO8mukwMGQnh?=
 =?us-ascii?Q?VZx2ly1cYbLlKHGI5QPWHRs1zGcgtlgQGxDn3bwHhZBFc3ueiGAbn1DtRQ7s?=
 =?us-ascii?Q?R9I9725G9NC0VzstxdPAt2zVxkdFiVzIcE3s7J5RJH99Nr42x0iZ7JepiQ4C?=
 =?us-ascii?Q?ejH7b7kuspN6XJiS1XIxCB27oqXRUro3hgff60xP1Py0VUO5Ds5Kl/SmZR6E?=
 =?us-ascii?Q?aZzfUONEjd6Nu2KEu2FA56y9u1f+51BpqHIuqFh8mAjyR+6IPNnyC4QKorBF?=
 =?us-ascii?Q?epLvFkeuSfCFO/aiJJ/1wYm2QF6131sGXVPRCihC9UXZKV9U9xY4RL2LxzXi?=
 =?us-ascii?Q?NYhl8nIEMi47r+oGgSGeA8zKuce212vaDSnSGM8H+r8ilrLGNLW/JUb/8aZv?=
 =?us-ascii?Q?bjaeAxKGntPlUPJ9MspfhOSN9wfKgyeTjtA76Y2hfmvhlgHM5O6eWIG263sw?=
 =?us-ascii?Q?DWw4WuvgnLtMYRS+sMveL82J29gZGHYP2axaiSm1umg6Am2BdArnhN+YX7E3?=
 =?us-ascii?Q?eDt8EQtgtwQtBp0Er0W8pp+ldRk9HhILxVtS9VFXhJiXQxEUdAymaq6qBxHe?=
 =?us-ascii?Q?XdXnqj8x9T0Kzs/ugcGI6DCsr89opeJoSb5Bw1G/gPBLyAme3DWRFC8emjY7?=
 =?us-ascii?Q?t2WXV8AnPgYCWfeJ+sIE1kWzh9T1HcqxxdLwgestx2jp4YdvW2kdYU7Lr8jN?=
 =?us-ascii?Q?8wPFCGuENUHyJngxHt//Onwxd9XYvtgnart1ZK72W5OoMIwniwxZhUWk3dro?=
 =?us-ascii?Q?mvdV2aRmQ72+cSCcKrTWHPgr8/4nfG1uey4Hq0pcP0kPoirCndxnG6bSVTOv?=
 =?us-ascii?Q?+m96vyoWfr20swcQDjrfHL6VeOrG8e5EayhkxaALoxt+sT778PxMpbNcr7Zk?=
 =?us-ascii?Q?xQ/InJfQehh9T7hP4p/5tDsvS++Mh6WklcvuVwzYmkpnshh3DEGqiCyC4pse?=
 =?us-ascii?Q?5fINFoxutGKhxiwxmtg5rRf+spfRWaG33ikv/5JG9Wl27xiAPe8L3K6tY8c/?=
 =?us-ascii?Q?dlijSSQxmH1FA2uFnI10PxThlXCkZsOyzgcCIck8M8iFso6reDmw6NKS9MRP?=
 =?us-ascii?Q?D+mT07RzCg73e7M4bZTOA6VLc11mR3F2XH2J5vSK5bIWtN/09QTuO93wHure?=
 =?us-ascii?Q?lkYBo+rrCl+/wJ2ZnAfjIjAW98UZUTZqhEKrUO4P13MpQ33DTg4XZpzaMHCh?=
 =?us-ascii?Q?yjw+UImdf9yCqbODkEuyOhZZEc7MNQiPCKpRR3tdo4DDNPpQqzYgRat9AvOh?=
 =?us-ascii?Q?rlTLgoOXSniUyUmdHPaX0OQCNfpI71fLcDX8+lAptuBuU/rGSDPPrpoS73AT?=
 =?us-ascii?Q?Ff6qO5Ymdg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 661b101b-f1ee-4286-e162-08defeab2fe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 11:07:12.7784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /crn1tcfKyteFS+EuMdz46GwNMnMOlVlroVXu+qrR0o9UNr0NZJLVg3Ro40iXB3Olprxf55ElQVBwtYioIteSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2394
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 11:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243854

Hello Alex,

Thanks for the review!

It abolutely makes sense i have filed the ticket here : https://gitlab.com/=
procps-ng/procps/-/work_items/435

Updated the patch with link too here : https://lists.openembedded.org/g/ope=
nembedded-core/message/243853

Best Regards,
Pratik

________________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, August 20, 2026 12:28 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v1] procps: ptest: skip flaky pgrep full proce=
ss name match test

On Tue, 18 Aug 2026 at 10:34, Pratik Farkase via
lists.openembedded.org
<pratik.farkase=3Dest.tech@lists.openembedded.org> wrote:
> +Subject: [PATCH] testsuite: skip pgrep full process name match test
> +
> +The "pgrep match against full process name" test uses pgrep -f with a
> +regex pattern close to ARG_MAX in size (~100KB). This intermittently
> +fails on qemuriscv64 where the process cmdline may not be fully visible
> +in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
> +match times out under TCG emulation.
> +
> +Skip this single test case while keeping all other pgrep tests which
> +are reliable.
> +
> +https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16290
> +
> +Upstream-Status: Inappropriate [OE-ptest specific: fails only under QEMU=
 TCG emulation]

Hello Pratik,

even though this shows up only under slow software emulation, it's
still a race condition in the test, and should be reported upstream,
so they can figure out how to sync the test properly. Can you please
open a ticket, and update the patch with the link?

Alex

