Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59506C54E94
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 13:05:56 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.118])
 by mx.groups.io with SMTP id smtpd.web10.44371.1674651951718582300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 05:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=GxbSAfCK;
 spf=pass (domain: est.tech, ip: 40.107.104.118, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SowjWE+/PXjCaeKxmx+O/S2Qi/z7Wt6HVq7dvBgnMOqbYeOoLhaHYh/Be1ZUNtVMKk9TRAwKQA4mCcbSo9YHblAzczo5uH2XS3fQ0T5fsfHQpDdrbDsuJQ0NYV8lOthDt5SwNgWsiW7v6wl9LeKxwBPmVYhoU1PyrOjgo5o72ygknAbW0DXwBxC+er2J6Ai6npxdALBQ552lIq6XUb633gdNHp/N8vi7bcEO2YeIUpd8EEjHVRqWrZgFHooV/9vbtfiDjZ5o6XVIezpIMO6UsbjuH4W8u2oMvKpwXuN5rVU5BYtdSDnP4/ksATnJ64yDevhAlBN44o+hZHE+5MbOWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqrpC1Eaqyl9++ZonUom0RclieI+QidE+BrUG8vS4M8=;
 b=aOMb3TMa8MzJgfHBqGiPHCCvalCLBGypj1NbjtFNJhj5FJ4wISd68pMUbNTZRwj+GZ2fwqyfhBOFviPrQD414nMnKnTvvqfQA3O2u2aTF/jqbhxG/798miIPncdbPjXStqc1jh0YL8NV49+vrCYTr62SAoXCd3lMJtFxMKryppyZ7vuxAPsLRnS1mPUstm/tNnMPZi2vFMQmUgRI28K8QMw++p6iAKJQEk6II6FSbgVLOTouN8eygRaPF4t+XH3Y7LkjuxkuglaPYiR3tGBssGfZQuJcgeV2suzsxPEj91tvOdyZAhP05RK1OP5u3K7bn6IIc7U2Wtk/sMB2F/gKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqrpC1Eaqyl9++ZonUom0RclieI+QidE+BrUG8vS4M8=;
 b=GxbSAfCKp/mmDIuJvCrwwYbfAKd5cqr2cB7SJCkdpKnZh8i0oR2FYSXus3p7/s5vhxpxH1oou+zz+WlGp83JA9Ot755bK70FlDH5tUdhzdXR4R4TVUT6CpGDy3OnblF53IX8ZU1EBT1Jrvc92nLjLvx7Es5NETv724rr4/Fg/Sk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by PR3P189MB0874.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:29::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.17; Wed, 25 Jan
 2023 13:05:48 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6002.028; Wed, 25 Jan 2023
 13:05:48 +0000
Resent-From: Ravineet Singh <ravineet.a.singh@est.tech>
Resent-Date: Wed, 25 Jan 2023 14:05:45 +0100
Resent-Message-ID: <20230125130545.4fukel6wflcffxop@serber-ng.hemma>
Resent-To: openembedded-core@lists.openembedded.org
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Ravineet Singh <ravineet.a.singh@est.tech>
Subject: [PATCH] gnutls: add initial ptest support
Date: Mon, 23 Jan 2023 09:16:21 +0100
Message-ID: <20230123081621.7517-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0474.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::30) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
X-TUID: vOJHZ2PFo0mN
Tags: OE archive gnutls sent star
X-ClientProxiedBy: GV3P280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::18) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|PR3P189MB0874:EE_
X-MS-Office365-Filtering-Correlation-Id: fb14978d-45ff-4dd2-9e7e-08dafed4e098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	diDqhQ9a86Siwcl7MfiWtooliXojJUgxpbfintOCUnK1Qu8ZBndgYNyt250acmPKel/teKtjsIITzKHMo/PawMxx6xCVvTzKFQWdEWhfSOC4FOMJwFKxIVQRGWtaE/JFbb65YBxiYBICEFKaICXN27wkD6TwADjUq2szchriPBHhZI+ZaOT9YRN5iQs+qwMn32hgHq3dem9/rwG5z5NgvqDGybrrZIoXVPtX+CThMVKSmd8ejz5OfPUndPl1xmBihm1tVqIuhgPY1GPgkUhjiJ5dhZlG0hxiXT5xBkVVAKVmdXKdaJxsEtSI3P9DKY0JZQfTbVHtguAiZ5AZpTQpsv0n7LtkwW5HmAvp5R5GY8SgLA/9yQx92yUFkS0xlSJXXaFlWwSzy267AdTUI2AIXf544/x7zDZXmsnwpkQog7BwDov8PHXjyNvU0i8ivgKAX0Va2XSTOLiiVLFdvq78k4A2PMeVj1JtaSPSjbLQg2t9FERhP3JXxc4CnQNhM29n8UeO05rpzwPeZgsCIIbUxnTn2b/nLGQ2g9Bovr7qB4+3wFJvlVxRrq9YXy+vw8+o8PwlMHXOCYdz0Te27HDKsBkbo1Z0VVGP1OKQEHwsAEeM+bfp7GbxCSmZPLwz27pH+6KkBIWuePQ4XU6Xt7bknNM8D+wzaYNQcPtDrJiQdos=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(346002)(396003)(39840400004)(136003)(376002)(366004)(451199018)(86362001)(36756003)(103116003)(2906002)(38100700002)(5660300002)(41300700001)(6916009)(8676002)(83380400001)(8936002)(4326008)(66556008)(66476007)(66946007)(478600001)(2616005)(6666004)(186003)(6512007)(6506007)(6486002)(316002)(1076003)(26005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WRQzb4q+F7UMMuhJJscwRKT9R/ZMvNnxj5lBDmDujD9AuJpyZxOZr7WSXcnl?=
 =?us-ascii?Q?XkQHCZxZvYMzM6XpKVXRmSGKNj7VMSyy7o4qGJ1F8dMEpTk7QUwhxmjrgxAw?=
 =?us-ascii?Q?iWRoGgo+pbIDItxWPRBkagdOHxpnCphe4XDKsZaGF2uYty+B8qyPKNXW8CA0?=
 =?us-ascii?Q?vPWUqH4oTt1jWdHsxlPH9jH2lQQAh7+jWGHndJ8G2ksWk6MskyOKBTEw52z6?=
 =?us-ascii?Q?TVvawUBGboIfGInjWdif0hQfs6syIaICzd326pS1SeKrDc21tsIqrH9wflpH?=
 =?us-ascii?Q?i2awkss8g4XREn1fYgcmaOF7ux4PtJH0fajQybXGXRIRuD7ZDD9NLz0BGfK9?=
 =?us-ascii?Q?7H2aJ1FgBwAPGkiDEmBFJmOKJVer/j4UnwhNYM9CTTzXxhjpdZFKvf1nGJDr?=
 =?us-ascii?Q?G9b4j6JTACjyXsPM/1DqcTEv7pC4BkHm6Wue2+RxP2PDSPzK0GSlmKHIJ+vv?=
 =?us-ascii?Q?z2CfoueuQinsVAPMCyUXFwEVujHQFj6QqvIqHFFadJcWdBli8liKv+JZYtue?=
 =?us-ascii?Q?O8kByzC1cO55drcdJ1NYypuAHy1uYvaumCQjlXhCBQJwVC5iN69jeeIw+vjT?=
 =?us-ascii?Q?Xdjaqq7dWroNEVcYrEzch8BQsbmj9mNLg29fGCUCJWsM0psaD0R7IsOwq4ss?=
 =?us-ascii?Q?RG0u5lAbZOS2BiYPApkFfxrpIymVxB8+yIhXap1Ib8vViYFadO4br3WTAgc5?=
 =?us-ascii?Q?41wfsXrSybrdc2ufWySG2lFj57V54d5ZxeDIx5fZe6nZW6fp00xc4RHC+s1i?=
 =?us-ascii?Q?3WYFnjfd7JXDqLz6M47WlgtFzH+qNCxAPj54H5I3Lo1yX1hN3RGV+yvIxqKc?=
 =?us-ascii?Q?nJo0ssqyrcX2aUZ/JfEo8U+ZYi5/FGxn8k1t0c/klNTVIL/TgI2Yz9v7qEOK?=
 =?us-ascii?Q?dfZnTKXlQVfa5WW+K+69qt5Ca3xfIY8ZAFY4M5JyqhiQ5obUWS32ddK6PRNs?=
 =?us-ascii?Q?cCfsofaar60+fctKlTnBu66YSFy/0K8jK6H3WCLEZPZ+3Wb0p6w3JyyIfhSP?=
 =?us-ascii?Q?5ieAMQipah5Atk64KRR5/3kKcUswclG1qTUeRmfpWw3tD5O3nUg5YvTvb5sH?=
 =?us-ascii?Q?mrt8VHGICbLfCCzgnFw+YUTVDus0scydlNsEe2L/8FbD407K/i6RWX62b5Ot?=
 =?us-ascii?Q?s3AAZvA5sKHxz9wjvcBzJTh4DCiVT1B8if4A0gUQ87Xvz+/V+sJ5u748u1Eh?=
 =?us-ascii?Q?g6hTlj0FKQD4DfPKprLT6aL7Y6/h2F1IzAxCO6bsYIp4r9XHObxQ79UEvRYD?=
 =?us-ascii?Q?CNoP80+rjVEF7QbZYhC2t/n8Z3PyrwT5GnQGREfhtd6bCbDoEnIp/pwUY3Bd?=
 =?us-ascii?Q?V/BKyUpbmIwCwLZsoe0Ffi+qykKX0KkGnPApkPa+T3FSt48+V8cDZthZvmby?=
 =?us-ascii?Q?0/mhjXrTPfUBvh3hV3T2lYX0xMCJdUJKIJNbpq3BlRtD+lT8tA6eVdRU3U+D?=
 =?us-ascii?Q?++FCJ+M+8df0slYxGkx3Rq/+7nGpWj/4ONfBeW3rBB3kCzw0o+vKbEmP0FtX?=
 =?us-ascii?Q?xVf6xhW1a2JS7tP7mP63CfjuwuKp4MzIEtH9lmHwGCP7lP74Fo7m3YhvTDST?=
 =?us-ascii?Q?bBm2dwasYJiU+p/2lMdUZpWS1LdK7nt+3LPg8a7ulHGKviNSf3LsiacwUtXh?=
 =?us-ascii?Q?wQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: fb14978d-45ff-4dd2-9e7e-08dafed4e098
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 13:05:48.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwkJZ2xkd6H71nNhJjag0cDoG1xxEVEGw65DElD7XC6YBYHrje3ycUNp4QkugYi/kA26XUaqF0/pOTFPZFtchxL4xCK8oYGYUs+D0EZoNSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0874
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 13:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176347

Step 1 of adding gnutls unit-tests into ptest. Only self-contained
test (no external file system dependencies) are included in this step.

Sample output:
root@qemux86-64:~# ptest-runner gnutls
START: ptest-runner
BEGIN: /usr/lib64/gnutls/ptest
PASS: aead-cipher-vec
PASS: alerts
PASS: anti_replay
...
gnutls test summary:
--------------------
total: 375
pass : 364
fail : 0
skip : 11

DURATION: 184
END: /usr/lib64/gnutls/ptest
2023-01-13T11:32
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 .../gnutls/gnutls/Add-ptest-support.patch     | 59 ++++++++++++
 meta/recipes-support/gnutls/gnutls/run-ptest  | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.8.bb   |  8 +-
 3 files changed, 156 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/Add-ptest-support.pa=
tch
 create mode 100644 meta/recipes-support/gnutls/gnutls/run-ptest

diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/m=
eta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
new file mode 100644
index 0000000000..965568cfd6
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -0,0 +1,59 @@
+From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
+From: Ravineet Singh <ravineet.a.singh@est.tech>
+Date: Tue, 10 Jan 2023 16:11:10 +0100
+Subject: [PATCH] gnutls: add ptest support
+
+Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
+---
+ Makefile.am       | 3 +++
+ configure.ac      | 2 ++
+ tests/Makefile.am | 6 ++++++
+ 3 files changed, 11 insertions(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 843193f9f..816b09fec 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -191,6 +191,9 @@ dist-hook:
+ 	mv ChangeLog $(distdir)
+ 	touch -c $(distdir)/doc/*.html $(distdir)/doc/*.pdf $(distdir)/doc/*.inf=
o
+=20
++install-ptest:
++	 $(MAKE) -C tests DESTDIR=3D$(DESTDIR)/tests $@
++
+ .PHONY: abi-check abi-dump-versioned abi-dump-latest pic-check symbol-che=
ck local-code-coverage-output files-update AUTHORS
+=20
+ include $(top_srcdir)/cligen/cligen.mk
+diff --git a/configure.ac b/configure.ac
+index baff1c007..f9f596abf 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1150,6 +1150,8 @@ AC_SUBST(LIBGNUTLS_CFLAGS)
+=20
+ AM_CONDITIONAL(NEEDS_LIBRT, test "$gnutls_needs_librt" =3D "yes")
+=20
++AM_EXTRA_RECURSIVE_TARGETS([buildtest-TESTS])
++
+ AC_DEFINE([GNUTLS_INTERNAL_BUILD], 1, [We allow temporarily usage of depr=
ecated functions - until they are removed.])
+=20
+ hw_features=3D
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 573e911a0..e8a26f8b9 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -644,6 +644,12 @@ SH_LOG_COMPILER =3D $(SHELL)
+ AM_VALGRINDFLAGS =3D --suppressions=3D$(srcdir)/suppressions.valgrind
+ LOG_COMPILER =3D $(LOG_VALGRIND)
+=20
++install-ptest: $(check_PROGRAMS)
++	@$(INSTALL) -d $(DESTDIR)
++	@for file in $^; do \
++		$(INSTALL_PROGRAM) $$file $(DESTDIR) ; \
++	done
++
+ distclean-local:
+ 	rm -rf softhsm-*.db softhsm-*.config *.tmp tmp-* x509-crt-list-import-ur=
l.config.db port.lock.d
+=20
+--=20
+2.31.1
+
diff --git a/meta/recipes-support/gnutls/gnutls/run-ptest b/meta/recipes-su=
pport/gnutls/gnutls/run-ptest
new file mode 100644
index 0000000000..84948f487d
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/run-ptest
@@ -0,0 +1,90 @@
+#!/bin/sh
+
+rjob() {
+    local job=3D$1
+    local log=3D$2
+
+    # TODO: Output will be garbled
+    ./${job} >> ${log} 2>&1
+
+    ret=3D$?
+    case $ret in
+    0)
+        echo "PASS: $t" >> ${log}
+        echo "PASS: $t"
+        ;;
+    77)
+        echo "SKIP: $t" >> ${log}
+        echo "SKIP: $t"
+        ;;
+    *)
+        echo "FAIL: $t" >> ${log}
+        echo "FAIL: $t"
+        ;;
+    esac
+}
+
+is_disallowed() {
+    local key=3D$1
+    $(echo ${test_disallowlist} | grep -w -q ${key})
+    return $?
+}
+
+# TODO
+# This list should probably be in a external file
+# Testcases defined here either take very long time (dtls-stress)
+# or are dependent on local files (certs, etc) in local file system
+# currently not exported to target.
+
+test_disallowlist=3D""
+test_disallowlist=3D"${test_disallowlist} dtls-stress"
+test_disallowlist=3D"${test_disallowlist} handshake-large-cert"
+test_disallowlist=3D"${test_disallowlist} id-on-xmppAddr"
+test_disallowlist=3D"${test_disallowlist} mini-x509-cas"
+test_disallowlist=3D"${test_disallowlist} pkcs12_simple"
+test_disallowlist=3D"${test_disallowlist} protocol-set-allowlist"
+test_disallowlist=3D"${test_disallowlist} psk-file"
+test_disallowlist=3D"${test_disallowlist} rawpk-api"
+test_disallowlist=3D"${test_disallowlist} set_pkcs12_cred"
+test_disallowlist=3D"${test_disallowlist} system-override-curves-allowlist=
"
+test_disallowlist=3D"${test_disallowlist} system-override-hash"
+test_disallowlist=3D"${test_disallowlist} system-override-sig"
+test_disallowlist=3D"${test_disallowlist} system-override-sig-tls"
+test_disallowlist=3D"${test_disallowlist} system-prio-file"
+test_disallowlist=3D"${test_disallowlist} x509cert-tl"
+
+LOG=3D${PWD}/tests.log
+cd tests
+max_njobs=3D$(grep -c ^processor /proc/cpuinfo)
+njobs=3D0
+
+for t in *; do
+    [ -x $t ] || continue
+    [ -f $t ] || continue
+
+    is_disallowed ${t}
+    [ $? -eq 0 ] && continue
+
+    rjob ${t} ${LOG} &
+    one=3D1
+    njobs=3D$(expr ${njobs} + ${one})
+    if [ ${njobs} -eq ${max_njobs} ]; then
+        wait
+        njobs=3D0
+    fi
+done
+wait
+
+skipped=3D$(grep -c SKIP ${LOG})
+passed=3D$(grep -c PASS ${LOG})
+failed=3D$(grep -c FAIL ${LOG})
+total=3D$(expr ${passed} + ${failed} + ${skipped})
+
+echo
+echo "gnutls test summary:"
+echo "--------------------"
+echo "total: ${total}"
+echo "pass : ${passed}"
+echo "fail : ${failed}"
+echo "skip : ${skipped}"
+echo
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.8.bb b/meta/recipes-sup=
port/gnutls/gnutls_3.7.8.bb
index 8f979a5b99..fee06393bd 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.8.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.8.bb
@@ -22,11 +22,13 @@ SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.get=
Var('PV').split('.')[1]}"
 SRC_URI =3D "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-$=
{PV}.tar.xz \
            file://arm_eabi.patch \
            file://0001-Creating-.hmac-file-should-be-excuted-in-target-env=
i.patch \
+           file://run-ptest \
+           file://Add-ptest-support.patch \
            "
=20
 SRC_URI[sha256sum] =3D "c58ad39af0670efe6a8aee5e3a8b2331a1200418b64b7c5197=
7fb396d4617114"
=20
-inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
+inherit autotools texinfo pkgconfig gettext lib_package gtk-doc ptest
=20
 PACKAGECONFIG ??=3D "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccom=
p', d)}"
=20
@@ -68,6 +70,10 @@ do_install:append:class-target() {
         fi
 }
=20
+do_compile:append() {
+        oe_runmake ${PARALLEL_MAKE} -C tests buildtest-TESTS
+}
+
 PACKAGES =3D+ "${PN}-openssl ${PN}-xx ${PN}-fips"
=20
 FILES:${PN}-dev +=3D "${bindir}/gnutls-cli-debug"
--=20
2.34.1


