Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68447CC6B1A
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 12:09:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11920.1791979754285742793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 05:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=mGAy3d2T;
 spf=pass (domain: est.tech, ip: 52.101.70.69, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALSOdDZHM5bfoi9LFjYM7kvERdNzAYid8t1o/woOjhjluo9Q8Em+dcrR4oUmsah+9mrYz6gRVp/EJRn9K3r8iZvhaoKoAeOMetgxXqIGnNKNib9X9D/eNKfF+D0a7dX9MMzj/dQAT8mvqiTOKYV9mQPInl69Wd1N5uWx8+6U8SwvExnOqmfdhP4G2s+jE11UmLCCBgWtmInnoKY8mTLHNCH+8zzrU5CCRMag5za++t9IgRDQmRos5yowqLVcbVBMCg5IQqz5is6P1I3SlJv9nTsmfvVOBSya8LT7GZIXD0CiRgdDyQn5Dez56RmTp5DJpHEvImpVgn+Rbw7m31remw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LLSwv5H3mJc8aT5YnC4dgE7qHM8GOa3yFABjphFdjDM=;
 b=YAz9Kf4VYPQWT5fcTESDvd5qi/J1Dh7kcVzQtj2ddlGVTDmtU8azT07VpBxwnO1uyGjrAy9NBlsWy2kLbzgOagZIVvYxFwtzCYasYD1GXeibqrx/mAYq9ynVuEIAV2jgbMgqsqGzfXZ2AajtjeGU/DFJRlmU3X/88nUzisCRFdDueAvkFLXO/QPQM9RI0WyHC4PJW3Gq8mqVgKkHzne29mgxMNi6tug7KSvDz3GKF6uI1cBzMQji6evILM6CM/HFbxmC7unXQGCXT9F8xmIoDKbvEvVoHrAVNicb1ua6PxrCMgnrnjW6/C6h+LXx4S81fDrV3RfV9A+AHFEaU0vD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LLSwv5H3mJc8aT5YnC4dgE7qHM8GOa3yFABjphFdjDM=;
 b=mGAy3d2TNQABTwS4LDs8u6USIvhArcxy2GOFOncigHleQ1pXBxN5w09So1w01l34FrbOoNNinB1768+qvH2W1OHXnUkZ671Jz3mXzljDqZAPxBRDoQwHS2DUWDilsXSfCw/7tiETJugEszUkvofo8efr59Wh2D5bNUTMxn8BndILeG/pzNvFNVhyd4u2G+Ynm5jJphXokoDieuULAk0XMVdNJPoQ4BztMaf6F76EvRpP5YdPQXlAwFLnj6cYfmsyyRHxwNshTeoCQpNlpd6ryME6g6MuJ8f+FSLyaZ1L2DJHz/OOTc8EgrvHgGykJs2CcCERb5Qonszw16vqY2ipWg==
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by BESP189MB3284.EURP189.PROD.OUTLOOK.COM (2603:10a6:b10:e7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 12:09:08 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 12:09:08 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libsoup: add ptest support
Thread-Topic: [OE-core][PATCH v2] libsoup: add ptest support
Thread-Index: AQHdW7kc2OeXbg9Rsk2GOm7Gbd7rjrb87FuAgAAFuqw=
Date: Wed, 14 Oct 2026 12:09:08 +0000
Message-ID: 
 <PA3P189MB323969096255D6CA96BD43F5FE9D2@PA3P189MB3239.EURP189.PROD.OUTLOOK.COM>
References: <20261012095602.19261-1-pratik.farkase@est.tech>
 <20261014085044.14497-1-pratik.farkase@est.tech>
 <DM4JD0YNS0WB.3T9SS6VQUFL6Y@bootlin.com>
In-Reply-To: <DM4JD0YNS0WB.3T9SS6VQUFL6Y@bootlin.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3P189MB3239:EE_|BESP189MB3284:EE_
x-ms-office365-filtering-correlation-id: 235aa988-cac8-4c8b-1d41-08df29ebf375
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|10067099003|18002099003|22082099003|11063799006|4143699003|261009223327099003|261009221227099003|261009221727099003|261009220027099003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 
 UdbVCN8UJE87+ccRMsTmbsQZ6S+UVAa1OrvdRPnO7W6I4zqtgMonAMBsGk/oiW5AABNqhTlEOlcN27sXM6aJwLlpJAzgps+6mKorzdmw87f2NsJvxh9ddyjTt7UOliJccHDePdOEGvSWnItrMMlsyh8JO+UV9xqAKLYj/qKNyjnMcXuz7V5xLmgBjGCpCXfuQRtwrIhG260DwKCI+KAbkNpgOPoqOn3iLlPBS8ZLTuv/n3o6LTLwxJaZpj8jIDi9ynA3EVCrHEW50Nnh2EW1jKkXzxGV+ylgm7Ewyvv8DEQN+1jvcUSpo2RMr0JiSxC+Nphd6Iq41gahTjwXurC3l25ZZHGvTS3a2fFenbwDOGlegR8an0YP6a/34OIouik4tQ0mMTlrA2TSnPN0bObYeubh72S7hpcM5QV2IvUoOrRumnFwVacAz0/06XZWBA4PZo3Nnt5AVEqCAyxTu72kX9Ybu0uf6i60Ow1irA2+N54/LP2NR80NPspLdmQ/DJYn6WlQDtZyjwus9TlHjNuAErThE3Ymw92xSxzbNTcuG3taTcN/zZKpQd28lJAQkIBtoqOLiYkp9q4ABkosv2DiCYwxA8yLi8lioh/e7iOlsbDMBbQ2rgOLL04NxM1A16KpdIy7SbvzdtmGu6+znhAfPBiH1tyEeBq3rwSkgxot1w0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261009223327099003)(261009221227099003)(261009221727099003)(261009220027099003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZqS7IiJ4C14tFzurgld32q+qMeClm4Rm7eHhu+KoxxU1oHno8CpCPj1RVWRJ?=
 =?us-ascii?Q?Ol5L4fzE/1+RyboMMtnk9UpdELrGVDdLlHbXML5y6ka+B98TzRSVnyc6c8pH?=
 =?us-ascii?Q?FCU5gTi9WxtV9wn6w90VLTHgaocxZ5rjLpd+mCq/+jHEbLnWvmj1wrKaBKw6?=
 =?us-ascii?Q?Z+lvAiujGiOn3SyxUvQLYAp2VfEmNgXgeQHSF/gG1VQfDlw72VG7xinFi8Nm?=
 =?us-ascii?Q?ym+1DJXVLaQJUzCsozIrFFSGdmQY35ua1X50YbMHKTZe3uLOBWRusY9Te2NY?=
 =?us-ascii?Q?rfhCEU96bKPUeKLe5ewRAuUvY2QVIGdnnuwF5iwxU5qOE6GHBM8//os6MZsA?=
 =?us-ascii?Q?b2b08KBwx7uEpnnlc7e8zVnfxtjZZz/1OvIT9cuGPXSiJRfvnRUQQ7uCeT2B?=
 =?us-ascii?Q?0qtZyjybrIWi6S0w1hfHAyo1NlbBmAoNpQ2Pwr5B0LSDzlG08dp7kujQXYSe?=
 =?us-ascii?Q?pBeRuuY7igDo7sJ4ZQKYCA5xFWTCu6duPzmcAGFEhQfhm6qVDAdbvPJTznkd?=
 =?us-ascii?Q?GWNKqkI4pzmB/pWbSgEAb1W3M2LJM84GnsiOAdPhm3M0xkDh/4Uv5paMaFMn?=
 =?us-ascii?Q?/39Zj1dqI95KN3jyVRKha2ZxGQe9TtYhNCQIUy6KeJF0LgF+SPdEtflXV8Zt?=
 =?us-ascii?Q?SpTWrifMxQyuvd+f9xGVkzUDTIu6C+7tLZj89aiC1lohUT57P2IwhXDqy2+4?=
 =?us-ascii?Q?/ZDoZk/QXkRK82u8iiRxxN3uf/fjyh6zoaaeixOEr76rDwPovBXdLA9ZGd9S?=
 =?us-ascii?Q?ARCC2B4zLmdkQ3nkW5RA46DfHrWALy1H9Pd8LLSh+OC+0/Dncttj6vktOOVe?=
 =?us-ascii?Q?ApohemuU7nuIMsYJcZGdUZZGoTwMkJ/m73woN2rkbnFpw3OCZZsPqh10aI6O?=
 =?us-ascii?Q?8lt0yNCBmV2rPY5Jyu5oUKgAV1GjDN8PSP6xqrrBx07wKqQfOZauEPi+cILd?=
 =?us-ascii?Q?aaR2GxnOio1EaBpUnuaCnVAMZXfEpwFgTpJcRPtU13nB9F0WV7pBzMymag1i?=
 =?us-ascii?Q?EcfsJpnuXPJHK98Cyx+SQIj2as84B4hDkAlfQmUmse4QbNCz9Zf+Wna6XMZH?=
 =?us-ascii?Q?1LqDpatXv7mPsd3h9UCbUie4dhWtMP3PziHHY9RFXbRuEOUSaDNaMbdG/cnZ?=
 =?us-ascii?Q?MOe+mp5HmJjy1JpNr6bs2+ptYtOVlP4Mj+sks2sBrt9sRD7TtXNgrxtQt7d8?=
 =?us-ascii?Q?283kdI9W42A4E9DF34/gNik6gKMrl8kyWDznECuQITRMEVjXyP5vdgPzkwHB?=
 =?us-ascii?Q?SwRchCrDd5EWKiMWa2raXsDl/Dvo83OIzw4qQOKgSXrR52zHlF2AI/QpJbGo?=
 =?us-ascii?Q?4Hw/paw7DrLiubWmrzZG3ca4SXpOI0ryfL3iaGsmlI+vg3gADnuxj10kVSgI?=
 =?us-ascii?Q?ktcYoxPhPMVjarLC24EUqOKWwoGz0gKFo7tc+8G/JYQURvTVAE+1l18r37Ze?=
 =?us-ascii?Q?0Wg5rY9bUif5f5O8cpHsO2aEqX6KBI6Dlb2SMrSLbKqKge+5a+8BF1eGF8SN?=
 =?us-ascii?Q?vz/WDWoal/APtcq9YTwIHCRPw7pZ15/Slnz0XhsQu6vkiOb4HyrFerbp4ZLz?=
 =?us-ascii?Q?xrVFs4i7B9wn7x74CRapLdwQCC0Q6rzriNt7Sx5yhx7U5C46J+wAblusAAlB?=
 =?us-ascii?Q?0eL1kvoCOuvAgTB+Pz+TkkHC3R/F65taikszAlbhYQ4Q73Sa4D2G1K6k9K3i?=
 =?us-ascii?Q?i6dAp6XnoDFFdEwN/0/mEv0G/MIsLEzcvnFtsokd1l1fhBrbGiTK2ipjMATx?=
 =?us-ascii?Q?7gpGM8LBhA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 235aa988-cac8-4c8b-1d41-08df29ebf375
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2026 12:09:08.8473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TSxKKFkAVogdC9BiPZDW/OEsGODiV9/dJYkpwDlGob4baJ/OeT0/qWr8uYna7smfi097TfdWa2SlPawYGP8lYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESP189MB3284
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 12:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247759

Let's skip those if 4gigs don't suffice. sent a v3.

Best Regards,
Pratik

________________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Wednesday, October 14, 2026 1:48 PM
To: Pratik Farkase; openembedded-core@lists.openembedded.org
Cc: pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] libsoup: add ptest support

On Wed Oct 14, 2026 at 10:50 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> Tested on qemux86-64 with ptest-runner: 36 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the new version. It looks like we are still getting OOM
issues:

WARNING: core-image-ptest-libsoup-1.0-r0 do_testimage: There were failing p=
tests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrappe=
d_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptest=
runner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemux86-64-musl-ptest/build/layers/open=
embedded-core/meta/lib/oeqa/runtime/cases/ptest.py", line 121, in do_ptestr=
unner
    self.fail(failmsg)
AssertionError: ERROR: Processes were killed by the OOM Killer:
[   38.188495] Out of memory: Killed process 563 (logger-test) total-vm:420=
9544kB, anon-rss:3997540kB, file-rss:36kB, shmem-rss:0kB, UID:0 pgtables:79=
04kB oom_score_adj:0

Failed ptests:
{'libsoup': ['libsoup-3.0/logger-test.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4743
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1364
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1379

Can you have a look at the issue?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


