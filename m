Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FADBCFC273
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 13:17:36 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11142.1763731052601883035
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 05:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=o0lvycBE;
 spf=pass (domain: est.tech, ip: 52.101.70.71, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jy4f7gI5D/nKqiuX8jikTfcL6vBEScljUFsLDfILhDXGf+wy3G/OgHwirBKSpwt5PrhObiK+J/uBWGPaoLNnHv9t88Wmq+0o8ONYL4Y6n/wKCJCHs6kr2Hc4tqO6NA9VWsERMmNp4CUmrl2ozIVSDVcKAEJYcecfWiPpZSFGs8XZKuTiDa/sN225YxceZU7s7efEuhUUpORjly8lCZ2LEAE4CjPR+nbOJG78ma805EnMgmcl5x7EZxq5GvnZIicrE5V0V7ILxFwR//s+wNY1UW0qahJrQhkaF6xHfBNthS9lIFyjZssopJEic12CO21PLnQk+trJGlu7IJCpY7UUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpKgPM+vr0ud+JLiYYZk/H1N49pLvVo4v4h4xuqwIU0=;
 b=gIrtR6ufr0ov8ZewteUbidgt1GSczos9xS26ThX5oQFxmQVrGimWR2TSFlUhdIbRJWhc+3HtnZDp9Bwk+fODZ+Nv/DjRWU9Y7UXDDcHZ/EWijs9lwJVPqiu04beFAgfbN809BR557ARvYQTEsKH5bT/evlJPoarBheznXN4q2yJFaD110pS+JS9406GNLkxZCekB1aicD8/pPfWZU0cM7Qfh/rscZZ69oYo7tGtEPSq84iMyNUWSR4Kue2E44DI87a+nYxlNJehxdlehDoJxCCOQQD4Yt1AFRP6kQiKc9FPvvBX0C37NG9BaAZzEQjS80JSNjEdTANY+FvPmfERKuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpKgPM+vr0ud+JLiYYZk/H1N49pLvVo4v4h4xuqwIU0=;
 b=o0lvycBEIS9/4tyOE7yNUKqSF/OPvFbi7L+uxXEjy1U5p5J2yObiemmd7yZfdTvhNEYKs3Nct2JPm4MdolOZBmd1SW3HIZAHc8MsK8X+tTtmkNLDADPhHhGr6zCVySPDU/T3Ugzpy50p0fqR78w0Ls+1/pDI4u6fil9a2v8z3s42XVnTqU+qan53CORrGKjeE8LXlGv5OYJWjEysuVkH1DMKGrx3sUcrHJ2tulKjx8e80dzeuy3JkiyPu28dsOKGTPNaAyM1ixOqIvVja8fLf1g8zF6S7qg5NV+kiSd4KI4Z3GMdM7S/YbYil45sV/r7IcgkTcEPoTg0pMDUFMmBrA==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU4P189MB3749.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:619::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 13:17:28 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 13:17:28 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v2] libyaml: add ptest support
Thread-Topic: [OE-core][PATCH v2] libyaml: add ptest support
Thread-Index: AQHcWt2XVBb27aLEI0+VZ6izFVQSdbT9ECmAgAALfo4=
Date: Fri, 21 Nov 2025 13:17:28 +0000
Message-ID: 
 <GV2P189MB30058F3FE5025407F05EB25BFED5A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251121105612.12259-1-pratik.farkase@est.tech>
 <20251121115420.15308-1-pratik.farkase@est.tech>
 <CAMSfU+4hh2rXJWHT5qLd=RMZvC2qs++7CS71j11Y6N9vV7W12w@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+4hh2rXJWHT5qLd=RMZvC2qs++7CS71j11Y6N9vV7W12w@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DU4P189MB3749:EE_
x-ms-office365-filtering-correlation-id: aae1271b-d01b-4299-37f1-08de29005204
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|38070700021|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?66iNps6YbqZjbx6HxtcC6prZ0Up7xZzcs6SyGgy0Kfjd8MIW9ILIy/oZSO?=
 =?iso-8859-1?Q?KvLdZNBidjF809a9EhhEbwB/Xn7L2wk1Qsuu8WfEPFWMQ6HTyzfv7RZUc5?=
 =?iso-8859-1?Q?8ZEJtdg+zsbU/xoumYdVoUkNj/qC+/pRAQGAfTZH3NLYMLsw+zVu0/Zx4P?=
 =?iso-8859-1?Q?srVRdwQf5D5ypInRMgvv3ff5CocRGzGIyHYV38+IRsv+Scya4rZd27seoT?=
 =?iso-8859-1?Q?9oK+od0t+zj9GhVCXqNzfrKmATO0Nx2R+7mtKgmmPB5ZrlanYnFsvCuALa?=
 =?iso-8859-1?Q?ZZP/1t4Oqq3fZEP+GgSO1+xTr/IDE1I9/zOy1eOESVw3uVvaEN89RMRHXr?=
 =?iso-8859-1?Q?Xz70gruQMyfTvYh/NK5sXh5zwlgPHyGUKf9RjYXEjTzU4m2cjAyEXYu3B5?=
 =?iso-8859-1?Q?/xDRtd5cWjOGuGsyfzdHBOB+Zv7TLT6P3GgjRJsbfw2luFTILScRNeUtdR?=
 =?iso-8859-1?Q?x/4aOySTbZmuSdoC/IQ7T9NYZoolhYywRG2gEeNixPylKS+avPV/+WU3Jr?=
 =?iso-8859-1?Q?oTtZiQmv2o+1r7vxW82i78rvSzUx9EQiy6/lRBvyoG96mue//dm8wDz/sa?=
 =?iso-8859-1?Q?BGiLIJWSCICoDrrXE5WuMj8TP4Np+LLNmstAnZ9fB/DfQFZ5HsiHikfQ3n?=
 =?iso-8859-1?Q?wcwp1NDhxY4ms8UIvYUzyjRHuiAMRElhVXuWrB9r8fAxi8EY9TlUUooXbe?=
 =?iso-8859-1?Q?o25PF7gqVPUn3XVt83C6zhHox1aRh5mwGrbUZhjxCLSM48D/AvH8HATTKz?=
 =?iso-8859-1?Q?TC4u9uda+sa3HoooFN9gax2tccrXZQaGQ8v4ihEj9z3Dyzv4gWzjZprhHE?=
 =?iso-8859-1?Q?WCwldULvtrC8zMgp4BhqpjaB3W+ashErTRxW9FYvlGyKioTQ7rWIbYtgZz?=
 =?iso-8859-1?Q?AOknetIGTYQ+GjMm6WFBLst1bQhZ7x+zq7CcJgqtM5kvtop+XXsC8rcniG?=
 =?iso-8859-1?Q?JuDdGpztz0wkmUGUWh7KLZk5JgCAmMcY4yQGNTZozDQ1PNxUuIvtGyGLEk?=
 =?iso-8859-1?Q?nn6dFtCD24nG+Wr7EaSBDcFx+KE9XF2WW8tO+fpbTbw8nbyrGl1V9Zr2dn?=
 =?iso-8859-1?Q?gCQGbxymOxX/0XyGnFtr6tWBgXMQy1w4NgKszSYF+XuIXscrAIYalXKJk1?=
 =?iso-8859-1?Q?VMGiwrmhVPUEF0bS1fKgLyWgYWhWOPbxd3DWNXRQ9A+dvVVYEOfBKMy9uj?=
 =?iso-8859-1?Q?kJF6Zp+qo441NzB6P/KbHB7IjMTeno083JkBWuKNa9rafg5lrWNeY84zTY?=
 =?iso-8859-1?Q?9bq4eyYdttK2ByUAiAhmBXmD28ywd9YRLYv1P+/ikbfE2SFRNjLnnxk3eL?=
 =?iso-8859-1?Q?xA5MoiJEaSsBwry8ac0Gq2692LbSLADJ2khvGyagO78adUJSCAMsgntOYt?=
 =?iso-8859-1?Q?zw5Qr7ssESEGoMz4Pze1l99bpobvS1BgH70+OHtpJ4CvgOk2H+6gFQludw?=
 =?iso-8859-1?Q?fpLDoIXnDMjrfTRbdpYCsTMwKBpdQKEPG8+N24REkbSPzrdl8oxelJNXEs?=
 =?iso-8859-1?Q?a/BBWJGUC3GYNUkulGVTXl?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(38070700021)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?6dDGKlfkaD4XrOYS6oC/malREWeW33IaJZyLkGtm7ApzAROtjNr/6wqfrx?=
 =?iso-8859-1?Q?IOCoQw31AFGbBUm9UHhsdlfRkgUhsIqIKlZjGhMWTVNeINpVX4REelJxZj?=
 =?iso-8859-1?Q?NDOU+aReetGab2Ls6zGxF2gGMn0hFRt0x/pIjiY3SI8bjD589ddVlAzBon?=
 =?iso-8859-1?Q?H21aW+LY9lIf28O/hryCXt+Dg8/ywbCMu/K2u/idAytvi62itV0vbsrCoZ?=
 =?iso-8859-1?Q?wERlzt85QLiAbURDvhxZDLKLtH/NAps+0fk5IA/8EBHaWDJISp2iORGmjS?=
 =?iso-8859-1?Q?w4wLNTKBux1xPIps22SMqLekaswG3MR2m+W0yoV2OEorR0X583nQJRIv8T?=
 =?iso-8859-1?Q?E0hkbOQbf3TiDzeQgXspt2qyTd2g2MojRos0PsE58iVpfHcvMA8eL92WxH?=
 =?iso-8859-1?Q?S6NungO6ZK90Eu6rBnDPaBv9ZklGqF352V43KuUYF46Up9lX2Y+3Fb07Nt?=
 =?iso-8859-1?Q?vh1cw/Hgd045BZ5CwRCaWYi/ga4JHhMNhZkoaQXFU1NHWCsbKMDUV31lmw?=
 =?iso-8859-1?Q?D1BL7Q+VgKJNxfpq6RUzmsiVNB15KwsawJVWPDYgrlL3hNS3io2FDvsNos?=
 =?iso-8859-1?Q?Ef2pssrnmouBWId7ZpZJ6uMNe4BTED1DVuVRCoTYqXl5Ch6ozag00azM9B?=
 =?iso-8859-1?Q?EWG4B/xPKfrqY31K0TAKENy6/VazYYWWcRb4U+ibnEzv9LXk6x9SUgDLxl?=
 =?iso-8859-1?Q?Ss2UdWhPNafehMr7MicpE3atW7yYTUSoa1xbdwFBhfrG/Wui14HyIATvMz?=
 =?iso-8859-1?Q?lD3uEG4Ljg1VsV5AfNgEimbVkCuOtnCnd7bgjj1zO+hB+Dn5Tx7ImJzj4l?=
 =?iso-8859-1?Q?TmFOWc6GilRksCDnC++PVZwcpjRmU2tKmw3zWp+vU0dOF3t2ddFnQ5GPvT?=
 =?iso-8859-1?Q?INojGxfSWOWxvN5sxXPLqyKRc6EtKqAU4yM+7Xq5YDTqq5mGKVXgmUD6iq?=
 =?iso-8859-1?Q?rfdL8GSAw7GpHDxdnaQqnuU5Ef/vmnaZ+Itwh9gfRiBJ5qSI0BQaMZ2xl/?=
 =?iso-8859-1?Q?1l6UVTYSZdXEMd0bV6WpIg8uK7TtpyhgcGFaKC2RMaAtFJIaz2Mzi45nbG?=
 =?iso-8859-1?Q?EooUl8NCby598ypobRDY5vDDLyaRwSXpNJXoa/AgSy03WQfqj5T2uAumxl?=
 =?iso-8859-1?Q?KV6f3AyDU/z0PAwoNVH6DAb00300WVNhINqL49I7lPXeN32USliiAJ1EZX?=
 =?iso-8859-1?Q?rF5K4ZePiS5PPmIeIM8opnK6Cef3aAK1ELkpUSA25dL/LqUo8HgP4oP3/F?=
 =?iso-8859-1?Q?IE57aojD7FNFW9dEQx0w7kE4UIbpHMr+w+Y6Dfd+rWOUKtm8fis2MGxUq3?=
 =?iso-8859-1?Q?QKa08NMu9Wh0TOiT+bcdDgHuRkIR2RV8gyus5M1kfW/u56flA3xLaRtTY3?=
 =?iso-8859-1?Q?H2mL7nkd6qxldOtX/EVCoUhYcZZb9yu648340ogJx5R6cEcn2ri5wzWCg8?=
 =?iso-8859-1?Q?Tq1Nyz7recSBz4Ayskw6f5hY7HcHUKZWQWbmI0Tvbcr1hnEVt68UK/q4yv?=
 =?iso-8859-1?Q?EQidDJlFxOtrYtukhH3hO6WPgBZ01XPaM3t5V7iKWOpJVLeAEkurZLYYIu?=
 =?iso-8859-1?Q?PQJt9fbHPCGxvWbLDC6SAgKf+vRancvDDheqkh1A/X75b3bGLt606+s1BC?=
 =?iso-8859-1?Q?JK4xOz+wTmQTb3+WQaEp7J2CezBV3sEHO6?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: aae1271b-d01b-4299-37f1-08de29005204
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 13:17:28.5545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sg+sQxP8IIJVye63oVvN8X9tc2vZ/6RtDHLUTSc0NwMnDqE5jmjmYI5jcCLqOEVSqziLpvDbMXLv2iL+vd8j8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3749
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 13:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226678

Hi Yoann,

Thanks again for feedback, sent a v3 addressing the comments.

Best Regards,
Pratik

________________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Friday, November 21, 2025 1:32 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH v2] libyaml: add ptest support



Le ven. 21 nov. 2025 =E0 12:54, Pratik Farkase via lists.openembedded.org<h=
ttp://lists.openembedded.org> <pratik.farkase=3Dest.tech@lists.openembedded=
.org<mailto:est.tech@lists.openembedded.org>> a =E9crit :
Add ptest support for libyaml to enable running the test suite
on target devices. This includes:

- test-version: Verifies library version information
- test-reader: Tests YAML reading functionality

All 2 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libyaml/ptest
PASS: test-version
PASS: test-reader
DURATION: 0
END: /usr/lib/libyaml/ptest
STOP: ptest-runner

Changes in v2:
- Remove hardcoded version from test summary
- Remove static XFAIL/XPASS/ERROR lines (always 0)
- Move PTEST_TESTS definition above functions for better readability
- Auto-discover test binaries in run-ptest

^ this changelog is nice but need to go after the "---" line (that way, it =
is in mails for review but not in final commit message)


Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../recipes-support/libyaml/libyaml/run-ptest | 46 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2.5.bb> | 2=
1 ++++++++-
 3 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 06d113e264..6a0c23586e 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -49,6 +49,7 @@ PTESTS_FAST =3D "\
     libxml-simple-perl \
     libxml2 \
     libxmlb \
+    libyaml \
     logrotate \
     lua \
     lzo \
diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest
new file mode 100755
index 0000000000..a9cbe9cf0d
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,46 @@
+#!/bin/sh
+
+# run-ptest - Execute libyaml test suite
+
+cd tests || exit 1
+
+TOTAL=3D0
+PASS=3D0
+FAIL=3D0
+SKIP=3D0
+
+run_test() {
+    test_name=3D"$1"
+    test_bin=3D"./${test_name}"
+
+    TOTAL=3D$((TOTAL + 1))
+
+    if [ ! -x "${test_bin}" ]; then
+        echo "SKIP: ${test_name}"
+        SKIP=3D$((SKIP + 1))
+        return
+    fi

This test is now redundant. You can remove it.

+
+    if ${test_bin} >/dev/null 2>&1; then
+        echo "PASS: ${test_name}"
+        PASS=3D$((PASS + 1))
+    else
+        echo "FAIL: ${test_name}"
+        FAIL=3D$((FAIL + 1))
+        return 1
+    fi
+}
+
+for test_bin in ./test-*; do
+    if [ -x "${test_bin}" ]; then
+        test_name=3D$(basename "${test_bin}")
+        run_test "${test_name}"
+    fi
+done
+
+echo "# TOTAL: ${TOTAL}"
+echo "# PASS:  ${PASS}"
+echo "# SKIP:  ${SKIP}"
+echo "# FAIL:  ${FAIL}"
+
+test ${FAIL} -eq 0
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0=
.2.5.bb> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2=
.5.bb>
index 0d8e8762d5..9a905215d3 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2.5.bb=
>
+++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2.5.bb=
>
@@ -7,14 +7,31 @@ SECTION =3D "libs/devel"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://License;md5=3D7bbd28caa69f81f5cd5f48647236663=
d"

-SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz<https:/=
/pyyaml.org/download/libyaml/yaml-$%7BPV%7D.tar.gz>"
+SRC_URI =3D "https://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz<https:/=
/pyyaml.org/download/libyaml/yaml-$%7BPV%7D.tar.gz> \
+           file://run-ptest \
+"
 SRC_URI[sha256sum] =3D "c642ae9b75fee120b2d96c712538bd2cf283228d2337df2cf2=
988e3c02678ef4"

 S =3D "${UNPACKDIR}/yaml-${PV}"

-inherit autotools
+inherit autotools ptest

 DISABLE_STATIC:class-nativesdk =3D ""
 DISABLE_STATIC:class-native =3D ""

 BBCLASSEXTEND =3D "native nativesdk"
+
+PTEST_TESTS =3D "test-version test-reader"
+
+do_compile_ptest() {
+    oe_runmake -C tests ${PTEST_TESTS}
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    for test in ${PTEST_TESTS}; do
+        if [ -f ${B}/tests/.libs/${test} ]; then
+            install -m 0755 ${B}/tests/.libs/${test} ${D}${PTEST_PATH}/tes=
ts/
+        fi
+    done
+}
--
2.43.0

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#226673): https://lists.openembedded.org/g/openembedded-=
core/message/226673
Mute This Topic: https://lists.openembedded.org/mt/116406209/4316185
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoan=
n.congal@smile.fr<mailto:yoann.congal@smile.fr>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
Yoann Congal
Smile ECS

