Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9757DF34C4B
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:05:00 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.270029.1776081893599316932
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 05:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=TDCaQGaE;
 spf=pass (domain: est.tech, ip: 40.107.162.62, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SxxvyKm2bl6GAV7dOiyZnTZ0ccr50D8CqgV1oxh8+StFZ4J9gMhJIbK07BxhdwY8eZxwKoOhTQyt8E01JrUPQJXmbDTCrOFSXksTaCzimKjMiVYtqZMHg8O+AelW21jG8mgSovDuQ7hJWxfAmnsSlnf4taygIuAVWSRn18RxG1oA+R4YciXy1Izh8bVQMqV1+3TGuYQLD2TJoYa4AG5lN+b/3adY/jsIW6fx532Z0Z3EclF8P9fGk+NcUXiZ2t4z07PCxtMLe+1NFRvAnRCKEnaJnHzH0pqZlZm6rKG2tIR8O2rymsR4Ww3NVpPT9LppB6f7u4GSR8NYTIjg9rBd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0xOu9t3UyzAC9B+z/f28Co50F23k7Eh2iZ8KK3okU0=;
 b=pXaoe5gaPskl+mGnZhnoVPkH/JEsXghOQCuheTHRJuPrgY9xCmZme4lGCR68HxjECWUXmN1rLzAr/Cq9sI9Wmdl7kCr3oi+PF4ht9JyTRXXmT7CQd3MMqp852TnZMdGwDasCqhEt9l6TfRm4SHbOAb/+mP1tnsviLpS4GrAeu43OYVI7U2tVvGwvnofJlo+Y3rr9kqeUtjgiWRHYlM+mzm5+9RUgztxBdjh7jVy/b04FBZUrIRoK0FFmip/eBzV6ySKovhZiIQdTY7k9io1JsKbLzMSc3Srp8mlL2/wuYlYgFBwRX0C+mPUXCb+iU3khUhaATbZGd6cAXRc4Sumclw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0xOu9t3UyzAC9B+z/f28Co50F23k7Eh2iZ8KK3okU0=;
 b=TDCaQGaEze6hnplwoEzDNCBInhKp+ruvyZtPOTiOBaY20maHJ2Y0yAtXgoN0rEkU43MZUNH2S4/Ixed3uYRd1gERSN24Dr2jLrhYbjxCJ2/KiP6XlkWXQtOikQKnEk8w26gcGFtQtH58A7fUIrtgBflhRNgy8Ad3PlvZtqf8SbcyGm10oHUEICXMt5vv6b4kLoK0QbhkIlfiZk6095J5LAYzQ916KAB8qnOVcF/ixTTw2rfPE2NGGs/xW0mlf8ruifnR9Y04XMYZPYK/9Bn3sgiLNZdsbhnI8IsRSaLMh5ced0qNxVqGghK7n99QYvYTQrWmhY9oJTyc/1sV7aP2Qg==
Received: from VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::19c)
 by PA1P189MB2693.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:452::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 12:04:47 +0000
Received: from VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
 ([fe80::2f95:4230:768f:ed9a]) by VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
 ([fe80::2f95:4230:768f:ed9a%8]) with mapi id 15.20.9769.016; Mon, 13 Apr 2026
 12:04:47 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] go: add ptest support
Thread-Topic: [OE-core][PATCH v3] go: add ptest support
Thread-Index: AQHctuAS1f4kqTMs1E2dSBBjEhx6D7W1bX0AgCef7zs=
Date: Mon, 13 Apr 2026 12:04:47 +0000
Message-ID: 
 <VI6PPF734FBAD1FE9D4D1744B8CD242E774FE242@VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260318140356.7609-1-pratik.farkase@est.tech>
 <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
In-Reply-To: <DH6KACIJTUKF.2I7WOQSMNY39E@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI6PPF734FBAD1F:EE_|PA1P189MB2693:EE_
x-ms-office365-filtering-correlation-id: a129b7b1-d6a4-47f9-6713-08de9954dbc2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 
 g+ldEl/0POqGbcIELsnEsRhtLv0+LFXt7ANk44eESIz01Nltgpapar/cR9e5MmZjnCZ55Ver66YeKYwjij7smKKqJf/87Gto2kNaOIhOMeriO6P/yst0jcEzMsUmseFFImQME5fPEZLb7oTikONATx8ICKrO7M6OnOSlc+EtsVzWMZbljljUBttz2irHxcGe/FrmgswnAQWn0nzKuRxCItR9+a9JROXYFpTQZkDdob3ul5dnYMS/3onXlkCTnlT1vzN0AbAPiHWas5LMuRJikNIuixHZykLx3wAuLqPWK/UCB+OhougUfV67it1DkM3e889CYFwCmmnjdvfgKdMyAYw815yZlLAoJnjCofkhE7MliLoCfjjXXIksmIWiq5pfa+D/dT3AkuCgANpm2IYyEuM/sU5V2AHYCVbNMYsaPW9+UtKBNf0yUn3if+cGjVZChJtja4g7WjJnovQzFrKnaGf8GX29cYSX4lwZ92PUOou95Zqs/yuouOwrXNE8gKD3WfkwVjff4pJ91PisnNKloy7vP47CM8GKjztw6oMEnVAxrmria00jSXUopKBtfCiI4xI2zsm8hfczQAHusZ3+VCgKWWJ+yeiURIk2/OxaHIemSnePdRCyCrdGCJStopqCCIeVRaO3RpGZ5mjtgFdkTzqireuZ9mJ+UvyMHnQygtv0Kj6V67DERsvymm4/5UlbRBsjD4u/3F5/gEViA+IMAqiDSTLjvoPHuyFga9tJqtw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wZjs71U/EmbsqUfpYjPf89hThIEhYETy3MjRMGQmJCB7VK4iwHiyj843ELNY?=
 =?us-ascii?Q?I269joDs4bZujgnIVbx5wHtA0iVFM8UVptB/FsffdH933HBqXcgLYAQ5luCs?=
 =?us-ascii?Q?lkYGtP8J8rdy6uHi12LC8RmvVX6gNkLJicom6wyi62s2YTdCxRxYlLgFuIkQ?=
 =?us-ascii?Q?VdRYm8eEeH/z9bqG59j0nCtc/AoNBOCpqvbA0+l/+7dU7KdjuefbZ4NGXGcF?=
 =?us-ascii?Q?shD88BjyZSZ1fWiqT6Z3W6rv0BdiMVh6lEPSSq664CAPj1QVrRKLgtVxuhyz?=
 =?us-ascii?Q?V31ErlJ+9XBLoW8jZb1oMju2JFkRtsGn6/GyWzPTmRKLbHajqI/goMM7dXPv?=
 =?us-ascii?Q?SHbF85d00ONT8N2+PAcFAQfshf4pUH36TJgKhZ82IVJaPbn7DNxa1wVRS2qu?=
 =?us-ascii?Q?2X49y45Oy5TVyfjJfOQ1e56VaURDK+ET5tBdfpsr2+wvzsVTQmI1+vOl5+lf?=
 =?us-ascii?Q?LltGlUSg6jbvDu8JqB5tcZm5TDINHd647BsZM9KwKRdXc+kM2TMY/j3HJclA?=
 =?us-ascii?Q?HQRap6UUXYuFvYVTOsH+AXQMTbhvUsSRInsLLU4wfbTtyI5No078sWV/nqhS?=
 =?us-ascii?Q?RaC7h2th/IX2e2wQqD56UngYlGIOsw7ZuGc+Ptj6M1QjcZ/xg5IJS8hHEN0M?=
 =?us-ascii?Q?nt4dRA/5GRM92WajT/+PSLA4vnleloYFN6bmrGTaApgIQY//JIpBLKvOqLLk?=
 =?us-ascii?Q?VOVR8wnUZGdmcQL1v6/q3Lwr9fnryNG8JkZWbGgpTDBpsAixIKhZ/Rg3MiHy?=
 =?us-ascii?Q?XPufz5K/mRdq0BqU0M8GGTJWjH6cEhp2Vh/V1ruRJEMMc+dDd0NSE0pS6T9W?=
 =?us-ascii?Q?WKUxRtsR2uEmetgKiSb3yWuE2zYJmos2PSivZz4bAbAmxhv/Tw0ZrexMAs/+?=
 =?us-ascii?Q?K4IgkWV8fCNGv2yrKW1TwJqwdj/cZDt9ugDfmIoAN8gJilIT/41ijwVICnVE?=
 =?us-ascii?Q?OH+Sspvxy1MZYqk5uVQ1I8aQLGRY6oPCgdgEews3vAhs+zjHzUCyFI7dBLX1?=
 =?us-ascii?Q?Npgb9BRkYlgWIxlkndJYQNJ27R3Czj0hLvHPkt+cU9QAOLMuBrglDb6DDzzL?=
 =?us-ascii?Q?pp4JW6EswMW5NbQhBus1IiuEqwyvI38rEpfr9eUgP29zSuATXSR9z3eOoaLS?=
 =?us-ascii?Q?si3DPHm6TOuHtFiXecbswDhVOpk/1XT7+i/O/mUaVGmuCWshibLYadcOmw1P?=
 =?us-ascii?Q?be9Zyuj17vvakDKQIEdRnQzoQO6aCEqkHxX/AtWF+NnD5GBNMn4dtB3wkwuj?=
 =?us-ascii?Q?D4FUTY4zgGIR4OaUWsWS66FgmLqT3V9yRtalEDW23f0Ai5noLg7I2jS2Lblo?=
 =?us-ascii?Q?n/8k5MTC8xkZol1C9yRA0YwLSUNwNfZ3ZrYtKLtfx2ITZxZ/UHCtKx7yQYMp?=
 =?us-ascii?Q?YfZWTvPH76K/VFTg6vF6c9pD4iDsGa/uHDMuVyZwkn1cK4Ic1imUEGl5vkj/?=
 =?us-ascii?Q?x+ClDfCmYlIQLZTzGuzO/3h0CpWFhHXp65jVNU0K0JYn2jG5aC3u5H/xkoMk?=
 =?us-ascii?Q?942NI4omMxdOHY+jN9Otw9V8YJgHEdG4p418ebE7jJWZHv8n/zkUmyhAu6Es?=
 =?us-ascii?Q?JWbq390hJrstRb4Zd8mRs2z9at8R/hdWDtEMKq9AcAYHmr6ZbOR8vMi21prP?=
 =?us-ascii?Q?mbTjT8razBzOhRuna9/CKcX6XN/Z73CiG6bsMeYfVawV5hft03YYyOABGDvI?=
 =?us-ascii?Q?r7QDheZ8Qf0nJy08M++3noG81pA/rTG6ARWRKayF6m7vPWcRtz2G/y6HIUOk?=
 =?us-ascii?Q?DV/woG3rtA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI6PPF734FBAD1F.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a129b7b1-d6a4-47f9-6713-08de9954dbc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2026 12:04:47.6296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D/rSQTKsP1MazHGG/M3uhB8gj7dsTkWiFG+wbXE5ll0dm6Dr4r1FCn/1nY4yjyUXgQEjjk6uEJOKskgdWk9Mdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB2693
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 12:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235109

Hi Mathieu,

Apologies for getting back bit late and thanks for testing v3 and identifyi=
ng the OOM issue.

The root cause is that Go's test suite performs on-the-fly compilation duri=
ng
test execution. Even with the autobuilder's 1GB RAM (QB_MEM =3D '-m 1024'),
attempting all 253 stdlib packages causes OOM kills as compilation processe=
s
consume ~1.5GB.

For v4, I've switched to a curated subset of 17 core packages that complete
successfully within the 1GB constraint:

Test results on qemux86-64 with 1GB RAM: 17/17 pass (100%) in ~6-7 minutes.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Thursday, March 19, 2026 7:57 AM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v3] go: add ptest support

On Wed Mar 18, 2026 at 3:03 PM CET, Pratik Farkase wrote:
> Add ptest infrastructure to test the Go standard library.
>
> - Run 'go test -short std' via run-ptest script
> - Install source tree and pkg/include headers
> - Create VERSION file for architecture detection
> - Exclude multi-arch binary testdata to avoid QA errors
>
> Test results: 237/253 pass (93.7%) on qemux86-64.
>
> Known issues:
> - debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary tes=
tdata
> - time: requires embedded timezone data
> - net/http: requires unstripped go binary
> - testing, go/types: minor edge cases
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---
> Changes in v3:
> - Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
>   inside ptest-packagelists.inc
>
> Changes in v2:
> - Exclude .elf* files to fix QA arch errors on all architectures
> - Exclude *-x86-64* files to fix additional arch-specific test binaries
> - Tested on x86-64, x86, aarch64, and arm builds
> ---

Hi Pratik,

Thanks for the new version, but we still have some failures:

WARNING: core-image-ptest-go-1.0-r0 do_testimage: There were failing ptests=
.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunne=
r_expectfail
    self.do_ptestrunner()
    ~~~~~~~~~~~~~~~~~~~^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-ptest/build/layers/openembed=
ded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestrunner
    self.fail(failmsg)
    ~~~~~~~~~^^^^^^^^^
AssertionError: ERROR: Processes were killed by the OOM Killer:
[  132.843492] Out of memory: Killed process 769 (compile) total-vm:1553664=
kB, anon-rss:256564kB, file-rss:0kB, shmem-rss:128kB, UID:0 pgtables:644kB =
oom_score_adj:0


Failed ptests:
{'go': ['archive/tar',
        'archive/zip',
        'bufio',
        'bytes',
        'cmp',
        'compress/bzip2',
        'compress
        ...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3319
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3294
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1277

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


