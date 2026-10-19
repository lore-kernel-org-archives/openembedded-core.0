Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EACCCF2D3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:22:34 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29998.1792398147354943013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=OkBzz8wI;
 spf=pass (domain: est.tech, ip: 40.107.130.33, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1xhq1QACLYStK+vqboROKdGoMTCc29cDKFAAHFrctkSi9UBCM2x57/fI+dFgKUt8R0ahqNgvKq4pcbD6aNKRE8ghq8e9P57oHvqsUZZ06NUYufF4L5c9L08+tI6Rj1e8EhWiG2eypsHQ8clkHQzqaEyopXuwThH/8nALe7t3bQyPDgmIV2qauZbWxAKnUIYXgY/zm4GxFcU8ddZ1nwqHNLZn73ZBLK7aWQczRcIsgdZWm5ry1lswg8mtr/z4cI2dHx4I7i+heqQ9NUfI3wH0xO/T2ODucxM2hR8gu8h9/mCLHgytcyDPR1/lf1EBOyC6y0FurximvXgWjgHHDDwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47at9tG28tQk6I4gF/lerSKy4bONAzMcyLmtjNsrYSw=;
 b=FtHJvercwNTtQX7HH+9yjsyHMD+uhZ8sTan2VJft0VjakmvyrbR8ttx0WbYqJgL2iTFfGIso21At5zr9Fwds97/M1wtuJvR1ioCnhWX1tcPVVEWojN/T4CRWRZpdLb4Ivt+2GADcjggPvCwihQzLQNUf22pqTLY/PRWaBiMIwmoL35zudJkj0319Dx/0KzvQIiUReScSWeXwqTrjMS/9IJDyrigHHVMgat+WK8xDonCMdiJkt6cJ7iG14X2MxWOREwg8rll8Phi19J6h+Yg9xGMEAwjjxzWIiAY6Ce0HJIB39hCEoqvhYOX9E7gka5+N2W5fwfWgf3jftTZMUm+utg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47at9tG28tQk6I4gF/lerSKy4bONAzMcyLmtjNsrYSw=;
 b=OkBzz8wIP38d45RVqoEIQiBz3TOeH8n6pa65tazDVicoXHvNbjORTd4Pm+EC5FGQYpqGK4a7BihwVNZcBCW4nqCJhsauqOEePFP7ps4gcGI0hwaWzsYrOEXNwptqJ3NsAeefKiN2gkgfq4/rKdO4QjwFgFFwftAnaL7yzB2fIr/mYhoVORx0znzPyrYR6hx1/mL+BwTKrjZmIAnG/MYbnLOELicuWC8pQMuO7olTM6324ChHTJIpzfWYbQJkb+slJ5ISJIi/fMWHSWjZscrOvrn7E1UnBHTDxXDHWMdH/sinl8dScnnB8uxZpLZHx8aFufPddwGAyq9MJYZWa066jA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by GVXP189MB2659.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 08:22:20 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 08:22:20 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v2] patch: add ptest support
Date: Mon, 19 Oct 2026 10:22:16 +0200
Message-ID: <20261019082216.45173-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012104207.22429-1-pratik.farkase@est.tech>
References: <20261012104207.22429-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0260.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:375::15) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|GVXP189MB2659:EE_
X-MS-Office365-Filtering-Correlation-Id: b7442f85-4f0d-41c9-d53b-08df2dba1812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|260925022911599003|260925021311599003|260925021911599003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	fEjwz5gNAuKwFia0mTT+G8rN2x4VHOSmXdF/k8F04kRaYz4EIjzuHlI+Y1863keESZPUnYs3hHGaA5cBWXX1TjBjyjdMlweMqWTwGKGo5QqGKYteVkBj8KWOBkM+qJndOCjSBnC3c816pKbBM7y6eZM1AuBKcRuozmIw4YiFrD6XotGePsxyrgaKhPoURtHA3j7gq8gGTZ6By/ZO23dmNQaNiYojekJK2G2CYjKp1rFHA1D8/hvWBIJM4CRHYnr1+Pqm7Xnktatk6F/ozmO8r7swjnTQSXEU0AUGgkQ2yjfJVloIXNiK3/nhukgU4CKV5cCxBruE8Vm5Ss7lqX/lCTjMkG2cG7Vao+PCc5F8WqDr0klSJySVvWg7/6gFed4z0u/TU2vcBHN/wndkSP7t3ZS+60MTqq0qczNXgdyDOSIYIu0bqVFIB2SWG3UsiGnXzvkB8jeSEma6FjVudNgPwi2jjmOw/RZgsxnXAY5dkNVCAO3yFjoG97FlbqUuITLZraToB22W6FgYvhUUCfPbGY41gRhOkkwEI0p6Peufwwohy+/+p2wNDl6j6vLmYynxF56NLRPpJJ1Dp2CwF4S7mHAABxkqnwGvylZK7qC8Fa6xtstvAeFK34KDBHhim2ZDoCghW+moOUskTtS6dyLh6b+CJcGWHVb9N/fYrtjWqZ0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i3RdE2wml9kr2UGjhqDE5zpOhZAhpOSHBLhE0yi0O+fRJpCSUY+LJ+A0Mdoi?=
 =?us-ascii?Q?KUAO9EKrlcvzw8+ukW+zMyNnFr5hWLbuahOfZmFnF1TFG8eggAZ1JYV1Mmmd?=
 =?us-ascii?Q?rUnVZs8WzG8zAPPR0qkFfwg9dinmv/CyLEm7OaG9EXPjqBuxoNydc+Sym4ke?=
 =?us-ascii?Q?ay37wVu/WsyDrzaFry98w7B3u0ajE537RT5+nnmim87ODcwCClvRP14vLuH7?=
 =?us-ascii?Q?kY4GfKoOhZPzf5eCEuLSOJyHk288gA+ohLhEJeaC+hUcI7Clo2vt+g6RNYi/?=
 =?us-ascii?Q?vynheqUjhmXxNZSHPR0gj6xquuWq6dZqbG5tpZS65EnJASvzix8aLOnI3F/u?=
 =?us-ascii?Q?CsbnFdl+D5ohSLgWG6kT88FQ2rddXv0u5irPE5ZkkU+XxxXGT75GLXJLA2+g?=
 =?us-ascii?Q?cFk5Jgp+NCjEeM8vWFh/c4CTbvEzLalzY/4Q5V+T5nL5Vsp88M/6s2bFlWc7?=
 =?us-ascii?Q?2rW9TdqXzWplwgRHlLRI/KvQnupA/eVqFzNnEbBAu+x1OJY6JL3nf4eTtG4Y?=
 =?us-ascii?Q?8A0C3rb0OxOYwH3xy8o3R7+uXQBJqhxuTtf4nz/To9FPbBtRIJ7J0jnffjoA?=
 =?us-ascii?Q?KPjJcASu6UOFwJe41erMWS7UhggGtFTWA+QOts065RCvgO55nkR59xibYhlI?=
 =?us-ascii?Q?ObafwWG2XVN9EtQA/rqjVXUkiLPmf3qJeIPVqZo84irigm9WrLCnIUiq9ib+?=
 =?us-ascii?Q?58RKQsxo9cxBNSZ5x4QubpOqHRZJ9NvvPaeZoZSVctwWBUD5StwS4rLdprxd?=
 =?us-ascii?Q?6/8SiaEAuCvDmjZXnC8iRU98vKjSeKImALtqVOWy0i6OybYbpN8hhiTPg03j?=
 =?us-ascii?Q?jqsR8BN8ZyZQ8j5FBBDoHLBDAB/4rsNFVUhY/VdlDJpm4w9NXzpKmVpE/fXj?=
 =?us-ascii?Q?DEfFM0OLLBiKKJrYtaoIldTu9+Bcn6talkGT9u8hUMofhf9ZfZVbTtdRKOaX?=
 =?us-ascii?Q?TBZRZwTUALcCMmT7N4JqtbMbH8gMQdjQNpKArkt60WzgmZO4RgqCL51lKb6l?=
 =?us-ascii?Q?VhD2f85qJ4TABwmGq7AfQzZLPm4sXtIhrMvcbOPA4QtLP/yzS3dvw2JctSnq?=
 =?us-ascii?Q?Yo2dv84wh1ghHCEMUOg3ANiAXFkxcXQBs8lZtl/sn8w91j0vGmffyh0IIlAn?=
 =?us-ascii?Q?wJwBcMy6sAzlceEgoU7kvWbrHT9HXlHNHab/O2ex8wjfNVzmMQ8JlijzVqfS?=
 =?us-ascii?Q?5FrcUiHwwPCLO5m/CGdModwi7s9t8kOr2dLFYwPiaEOypTDUU7nIRS31rxix?=
 =?us-ascii?Q?3RGVkvs8ubUGsdCE/pWXoBE87J+Ya3bCAvz4C4lSkCRipBAx15njfpn2/e/f?=
 =?us-ascii?Q?xt7+On5f4Q06AFyQHWERzYbH8OlxX9Rk/Y4RK/NXLnGYERILsU40vTx55qPm?=
 =?us-ascii?Q?qGmNrQznDlE/GsqEbrxEYlTFJcYc6VCXghVMP1yKmDw0oGVz13/uAblAnMD9?=
 =?us-ascii?Q?+bzngRBtGVQfoAkHy9ihLPX0Hhkqo7ejIQzMrPvqWPRvQpXgWo+gqHYy9pYw?=
 =?us-ascii?Q?5NbczI5kRcfxwTq22ST+3pkKDGENIUn517R2tynD7sDdZfpmbdGsf0NsSHQ7?=
 =?us-ascii?Q?0/xNtjJ7RZvEVqwb8BSjnxGemKsOdNIdXXZBsFSuOSa8uILFWZjoZo4wbYHy?=
 =?us-ascii?Q?jGnF/67i7iB930CmDa2fUTpvW0DLPDez0m0CIpvoIoRslN3CVo6QMtb+TMSZ?=
 =?us-ascii?Q?6vUIvS6BDghXG8VEN1RVF/i22pM+ZJBcf356LaXO2QSZPvnYywNin7vFUc7i?=
 =?us-ascii?Q?ZgAI8w3pVg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b7442f85-4f0d-41c9-d53b-08df2dba1812
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 08:22:20.2020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZQK9kgeaOXjXyWfREl6Z0Xb2ebDgbmn+6uyM3kbXBCXEdf/H0QYYiQPdzoO2fRr+/Kz1fN3zM4dSNAzM83u9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:22:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248141

Install GNU patch's shell-based test suite and run it under ptest
against the installed binary. The run-ptest script maps the automake
test protocol (exit 0 =3D pass, 77 =3D skip) to ptest-runner results and
handles the dash-o-append and context-format expected failures.

Tested on qemux86-64 with ptest-runner: 47 pass, 2 skip, 0 fail.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---

Notes:
    Changes in v2:
    - run-ptest: don't redirect test output to a log file so failures are
      visible in automated environments (Ross Burton).

 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/patch/patch.inc         | 16 +++++++-
 meta/recipes-devtools/patch/patch/run-ptest   | 40 +++++++++++++++++++
 3 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/patch/patch/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 992d3666b9..518962cbaa 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -69,6 +69,7 @@ PTESTS_FAST =3D "\
     nettle \
     npth \
     opkg \
+    patch \
     popt \
     procps \
     psmisc \
diff --git a/meta/recipes-devtools/patch/patch.inc b/meta/recipes-devtools/=
patch/patch.inc
index ecbb070ec4..4b90ece07c 100644
--- a/meta/recipes-devtools/patch/patch.inc
+++ b/meta/recipes-devtools/patch/patch.inc
@@ -8,11 +8,25 @@ HOMEPAGE =3D "http://savannah.gnu.org/projects/patch/"
 SRC_URI =3D "${GNU_MIRROR}/patch/patch-${PV}.tar.gz \
  	   file://CVE-2026-56289.patch \
  	   file://CVE-2026-56288.patch \
+ 	   file://run-ptest \
    	   "
=20
 S =3D "${UNPACKDIR}/patch-${PV}"
=20
-inherit autotools update-alternatives
+inherit autotools update-alternatives ptest
=20
 ALTERNATIVE:${PN} =3D "patch"
 ALTERNATIVE_PRIORITY =3D "100"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0644 ${S}/tests/test-lib.sh ${D}${PTEST_PATH}/tests/
+    for t in $(cd ${S}/tests && ls); do
+        if [ -f ${S}/tests/$t ] && [ "$t" !=3D "test-lib.sh" ] && \
+           [ "$t" !=3D "Makefile.am" ] && [ "$t" !=3D "Makefile.in" ]; the=
n
+            install -m 0755 ${S}/tests/$t ${D}${PTEST_PATH}/tests/$t
+        fi
+    done
+}
+
+RDEPENDS:${PN}-ptest +=3D "diffutils sed coreutils"
diff --git a/meta/recipes-devtools/patch/patch/run-ptest b/meta/recipes-dev=
tools/patch/patch/run-ptest
new file mode 100755
index 0000000000..46cccd4f96
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/run-ptest
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+cd "$(dirname "$0")/tests" || exit 1
+
+PATCH=3D"$(command -v patch)"
+srcdir=3D"."
+abs_top_builddir=3D"$(cd .. && pwd)"
+export PATCH srcdir abs_top_builddir
+
+XFAIL_TESTS=3D"dash-o-append context-format"
+
+is_xfail() {
+    for x in $XFAIL_TESTS; do
+        [ "$1" =3D "$x" ] && return 0
+    done
+    return 1
+}
+
+for t in *; do
+    [ -f "$t" ] || continue
+    [ "$t" =3D "test-lib.sh" ] && continue
+
+    sh "$t"
+    rc=3D$?
+
+    if is_xfail "$t"; then
+        if [ "$rc" -eq 0 ]; then
+            echo "FAIL: $t (unexpected pass)"
+        else
+            echo "PASS: $t (expected failure)"
+        fi
+        continue
+    fi
+
+    case "$rc" in
+        0)  echo "PASS: $t" ;;
+        77) echo "SKIP: $t" ;;
+        *)  echo "FAIL: $t" ;;
+    esac
+done
--=20
2.43.0


