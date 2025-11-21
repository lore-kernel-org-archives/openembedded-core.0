Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205EBCFC269
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:57:46 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9935.1763726261234521815
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 03:57:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=IUBfJzFj;
 spf=pass (domain: est.tech, ip: 52.101.66.70, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFrFOvnclYFENS/Iz0QI+kAA09mUF9MHj6xir2Fbbys1e9hX2+JPwYGOQPptFLiiWenaXGj3C+B6lNxVQejQM12qsVoPbNIKjd1jpGQUqk1xR6VMS6zp69zSFenZgE6ZTFFCxGaRts92B6fXAcCdXP0vQOaVsqDX1KFYsMhWuxRxsSFoyTVYIbsvKLOt7Pwap4v1HJU1PHjeHOeQ6XcUo8AKOHAOfBo1DAn09Lz3fc/TevCrpdFuu+7gGSXU/OKdx7ZAy/yF0RIX+492LheStXfbVS9AUfaucciHwFmLQsq8lmhwb9Gbs4q1Co8besGtaJ9DkafuyA+a9K///Ix9eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Nz6j9wWykucTJEhsALJvQCqLunuecODhnchVShBODg=;
 b=CLd/PPNioB15CuYkXOWD4QgGTZlRTa2sVRnURBTr/FUIPxUkdRImwKKmGekTd3+36TgTQQr98n6YaY5Yq/5jDn4XFIPDY8u1IMiiTinwODweg4eBFUsQndHlaDiid6NYg4ccYwSGGodWWB8n2xOR5zHkcwanPKwUqyG0a1Av1nyvv4jJfhpN+kLLFT3gAazbK5bxYctPa/H/z58g+RjuJcvwTyuekbJCi7hCh8njS4L7y6OAqGpB4nYMeim/7sRDTauTIor0Ll6QB+MIosTkURWFIxq6PxXBawNr4dMBab76G6tODE31oaR88jhHKupphIQG/Cwe2djT6BHwDCHPSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Nz6j9wWykucTJEhsALJvQCqLunuecODhnchVShBODg=;
 b=IUBfJzFjirrc9wIbq1Wtpv5Emo9LgFc0YdouCTx15pbB4kS0ri74yh1UIQuNh0bKzVwJ7k+ycB3PUL7DOcu+EpRiAZifQqY1gDof4rrifyYxnh8cD9Doe1rL/BICv4/JC0LycfW0xUfNmMEj5We1Wg4XLlB6/lEfkQ0nisXiPRGpAfVLbchEebtB8wIok9up4sc5jz18QUIPG3B8an+02+nCLaiJV61TriHPhZbF4MfsKkJW6gFlWTHmEFnpglKuFMncTpLwN9wO3Vid8N2UCNjNWpAZj3SPAAZ1FMWJi7c4eiFUb4fF9jzCNbhWkNPEXLEHv2X2Kmm1GTPFDgixJw==
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DB8P189MB0999.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:160::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.12; Fri, 21 Nov
 2025 11:57:38 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::c13f:ef4:ecf2:85af%5]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 11:57:38 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH] libyaml: add ptest support
Thread-Topic: [OE-core][PATCH] libyaml: add ptest support
Thread-Index: AQHcWtV3TnKc+lU5CUKuXv4LbbdkxrT8/I8AgAAJXc0=
Date: Fri, 21 Nov 2025 11:57:37 +0000
Message-ID: 
 <GV2P189MB300522B5BDD27B7110653C81FED5A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
References: <20251121105612.12259-1-pratik.farkase@est.tech>
 <CAMSfU+6rTuAHSGci4LS8Kuu-XZqzZjzJXd8Vh2p_c2Bq=mag7w@mail.gmail.com>
In-Reply-To: 
 <CAMSfU+6rTuAHSGci4LS8Kuu-XZqzZjzJXd8Vh2p_c2Bq=mag7w@mail.gmail.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2P189MB3005:EE_|DB8P189MB0999:EE_
x-ms-office365-filtering-correlation-id: de7f42d7-74b2-4499-23c6-08de28f52a8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|38070700021|7053199007|13003099007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?2qS9J67KvfXkfT2V42UgRfu8SiBek3O4c+pF7pqFGzfndgxYlm+XfWnQtp?=
 =?iso-8859-1?Q?D4TeO7xt7ECx2liCKT6Hv2koru9y+LXzB7NmtcR3Sybo96Y6dCQ626tiu7?=
 =?iso-8859-1?Q?7DGZ0tOFyu1hzqMTh9cChpwKxLIEq+QaFOezuLE4OrZUSLvgr24V6wcoXP?=
 =?iso-8859-1?Q?TDLF6kHYDyEzA9XlmU3kGXdbVusSffYQQxixJFUv2S/THBGNvc9CIA7HDq?=
 =?iso-8859-1?Q?TM8rOb2gvxSgXg3q9lq4gvZeB64DcBdB7PJ5ebgpUrMQunDZsj4rPCbpcH?=
 =?iso-8859-1?Q?vudU7uxP0OSGc1ya3ZXcPWg6M5Cyf44+P7e0cwPxG5cZKOIHoMI1KWh7DQ?=
 =?iso-8859-1?Q?JRI1P8TelZJx29ypUenTjqEBKZwvs/H0np1MmH4j+XQvzGsx/Uo6S6ibd3?=
 =?iso-8859-1?Q?2uqWEMkkPJUft3/oYP0VcABs5gzZ6SRy/uSebtz7FbRiDZtoVgA/1JVLRz?=
 =?iso-8859-1?Q?cdfH4KivERyLG8ahhC18W3iWXWSZgQKw4ziIWLP+gq+puoL61qrkk/uuEq?=
 =?iso-8859-1?Q?Z+1doUciLEFUKGiPegJUEUYv0NoGuRnlMQ1qkjoZYzAoQk9g1Davylkfw8?=
 =?iso-8859-1?Q?xnVwWi3fNp+8hEbo2GQx0WmKnB1MPr9JDZXkC3OT/iw5jjTvy/DMqBdVbm?=
 =?iso-8859-1?Q?ZBcRWF93DO/pqODrsUfVJU1qn7Rr/QYUPsD5P/E4xJ+w5GQPeerdRIu22a?=
 =?iso-8859-1?Q?PrtKzRxZ3xevNZbj9PnlTE3IuSamsdMXYPJkbtmWFw0+v5o/8QU1xWQvnW?=
 =?iso-8859-1?Q?PLsoLMz89eEKRgQHdrNKXEtu16jfnlnp1+2QnVLvkkJoo/4bMwryWQ0yoI?=
 =?iso-8859-1?Q?kXr5/5DRd1B8KjJRUXP6xk4p1zCcMoDsNfSNjPLFTSdAVD3UqP1NGli4er?=
 =?iso-8859-1?Q?9q7nypGHw3liwqtIWlVB8NCXmqg8NjYNmAYbSbz2rAGxRb/0UgxYWHora7?=
 =?iso-8859-1?Q?ikymW2xP8FWP+ayxd1DWrQbrMpmpKZJpH41/mGMx8+TuT7jqYn7tpLiPzA?=
 =?iso-8859-1?Q?1s1Uk9S3ZPCMO9DxJx7rUD/A5iTtQWfPf0WhkCglJxBVZ/lk8NhKv0JZvH?=
 =?iso-8859-1?Q?EEw2Owib7jQkcATRhdKxokXpdzWqlChJ/pVhf6T1DeXN1gwZuFY10mXWHt?=
 =?iso-8859-1?Q?q4XVkPZ7/Am9+Jsp4YU7hwyxRiKVPsAHEz+1lmjrePZk5LZebCIwkaIrsC?=
 =?iso-8859-1?Q?8+SOOU9+St38rOiUYWcAoZGE4eDG0NfSpSTqe78WYU01LILrkV9wUut4/s?=
 =?iso-8859-1?Q?ve713AD8jS0HGfqIQr5LrWvEbcCP3i9mhom8n0GuFKcPbRpqprP1QmimyM?=
 =?iso-8859-1?Q?IznAxPEmlT4JS73xOOK2ywswqcXt7qmjnaXM2qbG13u6tEvwFC01vhrN/d?=
 =?iso-8859-1?Q?ImZPRJD/WeMleMCrGD/Ic37mI6ZQyT94w2JFUIejhEWObOK2tqqiObUy8k?=
 =?iso-8859-1?Q?qskFD15y5jaHnaUh0pRak8QYM0NveGGxj5nQY7halSLma8r4EXJnGn3iaE?=
 =?iso-8859-1?Q?bFES8Fx+cgpLBjTWVw0F98?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(38070700021)(7053199007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?NZTUdVR1K3Il7ih6G4992nyFeKdUR/fRCXjlvQWj5YE55iM3+AsZ4hAGfn?=
 =?iso-8859-1?Q?T4vi5ff4jREy9UfqbH7XXX04G1BNYnuR6Kpht/Ne5SpGG6m2HVJOCxuUbs?=
 =?iso-8859-1?Q?cxC0pd0rsdBLoBDpLkMYmYc/kUWpiEei+TBe0Guu4CRI7P7BR77BiVFBbt?=
 =?iso-8859-1?Q?G+hnwUkmqKzoYMJYhMxQ9rgXTirwxJFLI6WAzmNl6+GvCSvt9sMy9U0WNn?=
 =?iso-8859-1?Q?TdcIJ2gVooUZv9qaPBkj0so0gTpRwonsIwcABcAXeXhVPQofYNWMusyR0w?=
 =?iso-8859-1?Q?P6lFq8xULqUocg+xjkGe6rr7NdD8jiDgSVq6B0MaTkSH3ZCpYJLSMrmVMG?=
 =?iso-8859-1?Q?W0gK3f9nZ+2eXqD9EYmzPQU924Yl6/swr8NpQ9i5qGsCyghN8sXApbB5t5?=
 =?iso-8859-1?Q?W7KVlNg0ydUDmTRrk2vfwl27mcSCsdjSc1O3dOinx99yZXBZN10aVf08Fu?=
 =?iso-8859-1?Q?vK95VBwHuBtAq3rRMffSemcz3uegeWuLdYWFFnuj7bElrZv8ln0mPGxl2v?=
 =?iso-8859-1?Q?woFxT3xe+b3TEV70uojn5RXRN7UJbfmUxpvtK1C54qyB2mQrAeexF3oXNS?=
 =?iso-8859-1?Q?qP3sEFAn83l+k3gyOwZT9jzSNOIw3lf/1xjenrX9tBZfaLFl7HweLefijp?=
 =?iso-8859-1?Q?RSFLWoTnH6jVKzOPOGiDT0hKfePaNBsZzlQnMSq/lxG0Vgc/0a/R10hPHh?=
 =?iso-8859-1?Q?NQBIK54IhIh98XwyB48rWqwikywk4XyHNL2ExfqSA/CG76uPrY8vSOzKAv?=
 =?iso-8859-1?Q?kcgBkBPi6EtF9SouANab7ZeNEcIDM8jzP1MVDkQnESKKfw/sHjmuiCP202?=
 =?iso-8859-1?Q?b83Z/d8BhZlVmpMO8qZvJSXDBdtdesiXEj7IrAwju8LOYUllzMIvquIo9F?=
 =?iso-8859-1?Q?R95czBmpQZ5W6u2m61+bpwwo4TQJL7AHSrJrE6G8KU3RrV6DwQwSwcdHK5?=
 =?iso-8859-1?Q?0N/JiHNZ+uu7580QoNW/eJnwcYW4RwpM9xb83mx+AO2Pz/aeo1svuQ18oJ?=
 =?iso-8859-1?Q?Wv6n1Wl0V5ltZDHmwoNL78K6pYV/dCId5R5ge87PHPnV+H1udxEywN3aqy?=
 =?iso-8859-1?Q?WHcaqgAQx5jqQIbY+lpeglnzBDa31xdcm6xk2aWz9iPar4FrXIDLAlCmbl?=
 =?iso-8859-1?Q?R1umShXi0egHV26ypEwY8rsjLAa4xgst3mZetAJqwfkP/Aa5/gdSxcD7DW?=
 =?iso-8859-1?Q?hEZPVD2LcXGvBVxKDIjzSIOeW0liJ7NnPzpKbD1vJKplhLpKUBaV0DFfSV?=
 =?iso-8859-1?Q?vXW5hfrEPqQNRnlc0vw2+u2wjWWv9i30ERbelSSwO+bkTmGew1+uJvQxrF?=
 =?iso-8859-1?Q?ZnznY1gP56WlFijjsy+zLihEHZsCTfeBckoA748qPltZxOm18P5E97mA9Q?=
 =?iso-8859-1?Q?0q/GMa9nlgM10i7nOE3swVz2sq8j0y5sB1kxnLnd8H3sDBk7wZmDAz0VIm?=
 =?iso-8859-1?Q?hR1zA/i+p+1VE6vaqxMKB+5SZFFG+UFESroNsWhZuqg0PHurVO2y+a9p5W?=
 =?iso-8859-1?Q?N5DyTr1kUIVdr9Ry1UO1BqVcO3cN+NXnBIMv/bOM/32dF81HG17jjAz0+3?=
 =?iso-8859-1?Q?yRedYDdzQJQJYGzohk+jFqr0BIzJ60iCYW8DUHZSNTsIB4A3iqqoNIgmLD?=
 =?iso-8859-1?Q?anXlF5ibXIevHIaGtSmB9wGW/MgpvLFrcr?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f42d7-74b2-4499-23c6-08de28f52a8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 11:57:37.8811
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IQLwQcssr/UoTPkzHjJWwsb/16bgBpJGxm54bfUsXtfuwCUF+PT8saG3wNDcP4rL1srTCJilDSmBu4wmCcjXHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0999
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 11:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226674


Hi Yoann,

Thank you for the quick review and helpful feedback!

I've addressed all your comments in v2:
- Removed hardcoded "0.2.5" version from test summary
- Removed static XFAIL/XPASS/ERROR lines (always 0)
- Moved PTEST_TESTS definition above the functions for better readability
- Changed run-ptest to auto-discover test binaries instead of hardcoding na=
mes

v2 patch is sent separately.

Thanks again for the review!

Best Regards,
Pratik

________________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Friday, November 21, 2025 12:22 PM
To: Pratik Farkase
Cc: openembedded-core@lists.openembedded.org; pratik.farkase@ericsson.com
Subject: Re: [OE-core][PATCH] libyaml: add ptest support

Hello,

Le ven. 21 nov. 2025 =E0 11:56, Pratik Farkase via lists.openembedded.org<h=
ttp://lists.openembedded.org> <pratik.farkase=3Dest.tech@lists.openembedded=
.org<mailto:est.tech@lists.openembedded.org>> a =E9crit :
Add ptest support for libyaml to enable running the test suite
on target devices. This includes:

- test-version: Verifies library version information
- test-reader: Tests YAML reading functionality

The tests are built from the upstream test suite using the
autotools check_PROGRAMS infrastructure.

All 2 upstream tests pass successfully:
START: ptest-runner
BEGIN: /usr/lib/libyaml/ptest
PASS: test-version
PASS: test-reader
DURATION: 0
END: /usr/lib/libyaml/ptest
STOP: ptest-runner

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../recipes-support/libyaml/libyaml/run-ptest | 49 +++++++++++++++++++
 meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2.5.bb> | 2=
1 +++++++-
 2 files changed, 68 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-support/libyaml/libyaml/run-ptest

diff --git a/meta/recipes-support/libyaml/libyaml/run-ptest b/meta/recipes-=
support/libyaml/libyaml/run-ptest
new file mode 100755
index 0000000000..885e4b68d5
--- /dev/null
+++ b/meta/recipes-support/libyaml/libyaml/run-ptest
@@ -0,0 +1,49 @@
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
+run_test "test-version"
+run_test "test-reader"

This is the duplication of PTEST_TESTS. Is there any way to avoid the repet=
ition?
Run every binary in tests/ maybe?

+
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
+echo "Testsuite summary for yaml 0.2.5"

This hard-coded "0.2.5" version will most likely *not* be updated on future=
 upgrades.
Either remove it (my recommendation) or generate it from $PV.

+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
+echo "# TOTAL: ${TOTAL}"
+echo "# PASS:  ${PASS}"
+echo "# SKIP:  ${SKIP}"
+echo "# XFAIL: 0"
+echo "# FAIL:  ${FAIL}"
+echo "# XPASS: 0"
+echo "# ERROR: 0"
+echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"

The lines forced to "0" are not used by any tools (that I know of) and prov=
ide little info (being static). How about removing them?

+
+test ${FAIL} -eq 0
diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0=
.2.5.bb> b/meta/recipes-support/libyaml/libyaml_0.2.5.bb<http://libyaml_0.2=
.5.bb>
index 0d8e8762d5..1d950572ab 100644
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
+
+PTEST_TESTS =3D "test-version test-reader"
Can you put this definition above the tasks where it is used? That would ma=
ke the code easier to read.

Thanks!

--
2.43.0


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#226667): https://lists.openembedded.org/g/openembedded-=
core/message/226667
Mute This Topic: https://lists.openembedded.org/mt/116405792/4316185
Group Owner: openembedded-core+owner@lists.openembedded.org<mailto:openembe=
dded-core%2Bowner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yoan=
n.congal@smile.fr<mailto:yoann.congal@smile.fr>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
Yoann Congal
Smile ECS

