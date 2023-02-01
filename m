Return-Path: <ravineet.a.singh@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7E2C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:21:12 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.132])
 by mx.groups.io with SMTP id smtpd.web11.26257.1675264867735562487
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 07:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@estab.onmicrosoft.com header.s=selector2-estab-onmicrosoft-com header.b=lsLL+sej;
 spf=pass (domain: est.tech, ip: 40.107.104.132, mailfrom: ravineet.a.singh@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OqFnPnJHgLuPJV2vkh6nlyF2Vl90exr7Feulks8xS8NabrQFCm/FA71FfcJeWBo2jVKQwkRyVrOvFiR9u4P0G64tCNX9mwn88kS/dvkmQ3G8uIQOFf8/qWsiZeZuxeldZgvt1/NxsnhSnbFi2oyArqMK43+Kh9chL3g4+mjSml7u+c77inLxHIfRs9lU88SdmbQSMGZl4fAmeTG+v87bUQEWnEWEJBQ7UFHM/6nmiS4bMn54UQMi305pK/1e4KocwyiUDG9FSp4lu515G6qBBuPHnbpQw4t4ZyuDxdVYHMO8dI05biAJss1oWMlw+nnOoh/CZKtjeKxNTKcjolbgiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdluS+2CL3iKgZCXt9CpLR1a7PKknMaiXhE11k6oDCs=;
 b=JXpPU6+cpj+VcAOGVPBiNJJyu1coFsSNkvSIPzTmKybiem0nFOg+4+P3K/+H22663EFvsuLaLVZxfmk3zIR84cto4ImaJZjixhdpjxlZ17emiBx33k3sBF/tK3wy3n1CWEIyffTHYyUHQL9U25E8FFsqtkWfFYE0sOzRNFIVm9fsm2k+vXhpfAx3vn0ZM8j/uOefWFQJOeHMBYzVjolb4sD/+t7rxdppH7axN0tdQl/MLpeE2OgP2y+eHc0tzWrA8oZo7vEhT4+jbpvTf39UYdykP01HDMbZBZtSGiczOvnLG6gPrlwUKyopZbSXH1rfEwyEH3UlZpX2P/fN/KZD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdluS+2CL3iKgZCXt9CpLR1a7PKknMaiXhE11k6oDCs=;
 b=lsLL+sejzcIivD/z1gZ0wk4r2ED7BAWU7uhSwA6Yl54RlTvTacgZ2SrXqhNk5OpcSCnWDwd51N5+O5J/YzIDe5LnaTIWIwpTkYp3ex73EdbJ7Xxv7KwhmLpWa2PbtWJIO1K60mDje8EbtWHVtUNOldbdMlIMGLY6QWjAMWEhQz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6c::22)
 by VI1P18901MB0639.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:126::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.23; Wed, 1 Feb
 2023 15:21:04 +0000
Received: from GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38]) by GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 ([fe80::2ba0:9122:ee6:9e38%4]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 15:21:04 +0000
From: Ravineet Singh <ravineet.a.singh@est.tech>
To: alex.kanavin@gmail.com
CC: openembedded-core@lists.openembedded.org,
	Ravineet Singh <ravineet.a.singh@est.tech>
Subject: [PATCH v2] gnutls: add ptest support
Date: Wed,  1 Feb 2023 16:20:49 +0100
Message-ID: <20230201152049.124426-1-ravineet.a.singh@est.tech>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0026.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::14) To GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXP189MB2053:EE_|VI1P18901MB0639:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a2fab4b-476b-4769-6bb0-08db0467ef18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kuXHBQ4vXrMaV+dE2zifBzJD9bizuJIwf/0IdoUCQly9wmzB6Z9xL8/8FKfr/Ubgjj7KPQi5JQ7BdYLId4vYHfnlT/ZYDuoF0T6yShE0CDNDbOjj9vFnAHnTY5eV4GprjTK8BJAbV6DLqIaw/igm2Xum21LeeVYcbEhsbHSeHUMQAvmRp9pRfBOgf/sOJEVbGlkbsira7qznp1JmphxLyBZ7KPXijNtQX69oBGAwqa+oyUNXXrWGJfFWhBgtyq7e2SOjMh+1dVbzpwL4PRHHZYY6jnmpqyWfKRrp4TldOOZ+QhDq4sWcxUnNgtd/C4ZhJwJrUI9Sor4Gn4deYumeswAXfkcALZXSg1AxSlzRik3PRGbJraExIuPFs4oNs02hdq+y+X0DcbM/m0XtuN7MLX3xbenj1l/VeDyglif293AP9SYTEX83sJW+oHR7H7GXvJUyqz85FpVa7HL3pjEXufA17mYtDGMDaCdY4MwAGVQP4uDFi6TyBCyU6bQJLpTQbK/eM6Lff6MSqJh8KFfNNes2vJ7XBqP1ugEpfyCxxjKIEl6yKdVMaBHeK6AVupmA1T4x1WVTgq7EaSuHZDMEtnMDNDPd6qBkyle8QPgM4wXIaYWWCghXzKnBDQGwEf3r9Madk5jn0wwwQCI+kRg4SQh/dV/elrvW6y8wLBti3V+q0dl6k+I9GACNePV4iZo8
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP189MB2053.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(39830400003)(366004)(396003)(451199018)(4326008)(66946007)(6916009)(66476007)(66556008)(8676002)(83380400001)(8936002)(41300700001)(26005)(186003)(5660300002)(6512007)(6506007)(2906002)(316002)(38100700002)(1076003)(86362001)(2616005)(6666004)(103116003)(478600001)(36756003)(6486002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1bdJV9oGItCW9nBDVF0xCNTCBRbuS54WC6/91m21FVZwpkOde2JGUCEIsUBf?=
 =?us-ascii?Q?DvTqP4ns0+Ih4oTRQVQH3En/mbb0J4iJkhCjOLp/E8f4eMSDcfEMRayzCBHM?=
 =?us-ascii?Q?HSm8sop8aO5FoUouWVyTmCA0/Vqylbv8lqvfq+mIcS1Raqhp0F2zMZOawC0E?=
 =?us-ascii?Q?62RzEdiMVqjef+Bf/3J88AlrKvdLSfqMxN9Ej7xOkzMZTaoVZg11b9//yQyU?=
 =?us-ascii?Q?hDXzfAkY4vBhp1p8YKmiEuiUSzcJWb/8Q7A6Qv2mnqc/W4mziEsMzhhuMQVV?=
 =?us-ascii?Q?VAinby+x9qaEJZ/40xoYuSyWZALE7QqAMVe1z+FnFAU/1ZYB1rBtHDWaS70l?=
 =?us-ascii?Q?klpEsJYiiTgB23zx0YVf+Gfo1XFlIZNhpNyWkyurKBkHbU+wIzja4kya0SZD?=
 =?us-ascii?Q?luBHuQ4WTJZOExfk2OSobIkmeJrJiPqTuHbeNCaE7O20T0d/3AdLbJi7PBjc?=
 =?us-ascii?Q?GtkWi79MGufhC71Kwgdh4TeOCasTOudqzHo+82HJQk3tZyONvvty/Mak48tu?=
 =?us-ascii?Q?2Yvm4fH9LJEe/U3BtRA5M0tagM4ejRn+muqOrua+wqnaA1pH8zNW5djJKD9g?=
 =?us-ascii?Q?MJWyEzflQ4UBK2TINAYVYpsedh53VVxOP6yq7PajNf6yDZTt8YesqF8YZPaa?=
 =?us-ascii?Q?gAxkBYmCVqRQyrfErD07q9Ddt7cLyIi/IjM92jY3x5OSSa3gsX+TFACVJhab?=
 =?us-ascii?Q?YlSVzexf0qJ4o7YOnE/+Ql6MpBYfKdGX1Swg5auDR+ZDPFE+54L4DV0O7uEo?=
 =?us-ascii?Q?jsKVoZmje7cu5Ogb1Bqvq0wZVFpwFDFfIEPETXmz9WSYGl5/0a10GXwnTXFZ?=
 =?us-ascii?Q?deRLKfd/OIXovmvaF7KKqzlD+53YX8o/+W8qR5qF/3tUwQJxOy+MzHRYzgUn?=
 =?us-ascii?Q?vLvrbyAqkIsPEjSQtim7FQwopMoRsgyTBbAN+e0Jan47Nc4hBomC6ueSZBZ0?=
 =?us-ascii?Q?/QBX7DSzhpy2SyoVNjeEr/zSEewzRIvQ3f4B7HzxeAWVEgq7Z9TktvuoEbUN?=
 =?us-ascii?Q?HSqkC6+mULSi7PhDQACnrs1Ki6jILo7YvJg4/pag46olkN9ryRsbEY8eGisx?=
 =?us-ascii?Q?I5Y7bP7dk+fLRFJehIeSuR9qo/krUCyTgMv7gHtXaARlEcPSMgxsHJk06Ruf?=
 =?us-ascii?Q?7FNqHNn1RJuMte9AgB9lPqM5ZCw4PhPLPSQzMdA89fBNwQLdbUYrTifkQDwH?=
 =?us-ascii?Q?BcstvcK4nQ5HMi6G1gogJKy2PSiAqEbBOUmSchv552kotExbXbZQeszUZsp1?=
 =?us-ascii?Q?SFln8qYX4b5nMMv2LOYJIUYDTAnxKY4NnhA2711tjvzteyoKehI/hvbppWrB?=
 =?us-ascii?Q?FmT0umcZMi72UuQiW4pqZPEEGpaBQu52HTNPuPvBA+0aMJ5K9/rkePtwPe3b?=
 =?us-ascii?Q?dUFkMSDsPTdNW2CJe0d5hQeuXBA8e74jzgvkl20gghagI9l9nFrSfX+BpeJv?=
 =?us-ascii?Q?abDxjI3iuF4i8zRq+KlMPuh/hzxSiX6OgYMZnE1lDfU6A9rboKeuNd5fWPrz?=
 =?us-ascii?Q?JayOKl5NhuNGw+fJQzgyS947BU1vY3n5xKtEJ/BQLMXdtkOMreLeOUzFHxyL?=
 =?us-ascii?Q?dr13qbwHVn2Sc6CAR7h/gJUpl7v/RiGbCrtV7We7UC0jtD7IyI/SGPgcJvXr?=
 =?us-ascii?Q?iQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a2fab4b-476b-4769-6bb0-08db0467ef18
X-MS-Exchange-CrossTenant-AuthSource: GVXP189MB2053.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 15:21:04.3335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgV07Kd3TBPxX9jV8dIfNJU+QgFcnOSruCghpWUHT/3RGfc8UPPaBAeY49IRVERyr+hFpd+SxbKg3x1l+G0j5eRCmwfVVxGdJTtzsmAWYP0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 15:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176556

Add gnutls unit-tests into ptest. Only self-contained
tests (no external file system dependencies) are included.

Some tests have been put in a disallow list in the run-ptest;
these tests either require additional files (certificates) or
environment setup prior to being run, via wrapper shell script.
As autotools packages are built out-of-tree, it is cumbersome
to add additional files. With regards to tests requiring wrapper
scripts, it is possible to add logic to run these tests under
run-ptests but that will require more effort to maintain, hence
skipped.

Verified via:
$ runqemu qemux86-64 kvm nographic serial qemuparams=3D'-m 4096 -smp 32'
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
2023-02-01T13:55
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ravineet Singh <ravineet.a.singh@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../gnutls/gnutls/Add-ptest-support.patch     | 60 +++++++++++++
 meta/recipes-support/gnutls/gnutls/run-ptest  | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.8.bb   |  8 +-
 4 files changed, 158 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/Add-ptest-support.pa=
tch
 create mode 100644 meta/recipes-support/gnutls/gnutls/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 72162f10ee..5422ecd378 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -88,6 +88,7 @@ PTESTS_SLOW =3D "\
     elfutils-ptest \
     gettext-ptest \
     glib-2.0-ptest \
+    gnutls-ptest \
     gstreamer1.0-ptest \
     libevent-ptest \
     libgcrypt-ptest \
diff --git a/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch b/m=
eta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
new file mode 100644
index 0000000000..8ad6ba5ad5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/Add-ptest-support.patch
@@ -0,0 +1,60 @@
+From 74080376904713a8e6cceefbc25c81512796bf0c Mon Sep 17 00:00:00 2001
+From: Ravineet Singh <ravineet.a.singh@est.tech>
+Date: Tue, 10 Jan 2023 16:11:10 +0100
+Subject: [PATCH] gnutls: add ptest support
+
+Upstream-Status: Inappropriate [embedded specific]
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
2.39.0


