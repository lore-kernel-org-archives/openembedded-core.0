Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB03A103E189
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 14:04:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.55])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14820.1773842646649877930
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 07:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=XkB2P1ga;
 spf=pass (domain: est.tech, ip: 52.101.72.55, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vNskzMN4j73YTElMDe80iW+m7H/tsfkwXFmjtpu7Pa4Yy6AaUb7R4e/NF8DmwdqC66xrSa4BIpTVA7scjBz8Wyla2wiVTE5z6aF3reYCBRJWkg1li2BABf73+3iZgjszkLmRYZqUv8RMMP5LHB+hflTrfQsBTLybIri+anLbU7f911s2uWhJYbSVL7PNkOd97jMWw4ouNijsxWEuVhzHdcqBf8SWniWrn6WLQJ/rEi0oBgkUPjE5k7lcfI0CXr1L3ErNXfbMmQwP1/ruM7c1hvyv2T3gTKa6uxc9BOHyuQh2TWIs55sjdaWk/dCx1EzYiXb0Gqlt1s28f4Sgi/EDAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yynyjh5VrRMpYaVOQKy2tgYEhpI0xue83/oMi89xeI=;
 b=r2lzVJMx0bDeIqZj3o7WulmJW3O52vQTpinpuG6zk66OQFEqCmZYO0y2SIfIU5tsjx+FkdKxh7lhZCuIMkgY2vaDR4m4bPTIr5szkNK45+uVQg1dx051jtWPesPMvjkAMiauNVYO3haL6FERUKGLkV+6vyPhCqf6bWAwjB6WZA0mI96bO1XaD0q1ewxRQJOXSugayIb8F5ho3Uni9Y6tGPCw1Gzkd8inj9o9Q2mdTauHf1QU/fA7daZQIlKN/qjoSKGXMh+C/uNYzW3qXQnjb8gvddHO/cGXNOa6McKMclt0XmoJMLsScaMrmSOLv7FEpPN9dPWPGvU5HKPopKdSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yynyjh5VrRMpYaVOQKy2tgYEhpI0xue83/oMi89xeI=;
 b=XkB2P1gawsymcr9KiUhZWi4caGOJcVHNq91tS9QJNjuQ8kEsh7MXH54nFSQESWI1NsBOPDbKdJOZIr8bthI/qreDOnGGbhMiZQ7kTK3xBDa7M7en/HpwCjMZshoq24TMPL160o9o6cTWE3GtfseJmghDRU69nvzi74yFpdQu8vZsUk1G0mHFu3VR0pVIjbpUe6Ux+iKVNZXhfMNPstE7nnxYjeq3HIFA9TmDZX5fitkLx7oVotsQK0iAkjAEuZn2FsMcnZu/xsLkT234k1kUmzdQE3QLsl0SILB453qfX+206FwIPukhx+vtgY07H2J2614ZHT+iWkARAqNYu8+HkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by AS1P189MB1961.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Wed, 18 Mar
 2026 14:04:02 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9700.018; Wed, 18 Mar 2026
 14:04:02 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v3] go: add ptest support
Date: Wed, 18 Mar 2026 15:03:56 +0100
Message-ID: <20260318140356.7609-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260305110200.17834-1-pratik.farkase@est.tech>
References: <20260305110200.17834-1-pratik.farkase@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0339.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::17) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|AS1P189MB1961:EE_
X-MS-Office365-Filtering-Correlation-Id: 020f4696-ca22-4c69-d81d-08de84f734d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	Uosv8X00D+rmTE+A3q8hih4rhYLDR4Pj6EmQ1v4g9Db2PwaAGu4NPSfPAihCb+ZRUpSS+ayxK3hkeuIVdGxG0qMT1AKt3/zXLL679GzpO/EHDYb4ErMGFvVyNuqIsBe5Oqi750p2+T7wT3zOOD24UU4FxUUQWXb4wjGxm6gLq+pQBrX/F24A5acpvQlpZizBmVDWSv1ZBRxR8s/fCNHNHw4wxkKCkmjsvp1DEBcpFoNsPd5CNLQYYNFChdW0wLlPWJq/LosaEKk2ZXDDhcyymPrl0rsvb0OL96XPCDaKsxDe7X5ATA1wr0z5W3aTROIUFaejYzwwnuexBmO7y4iH6/+GHWFI3A2HV1BSqzNtkbfluATPDLBIGIxCqUA038gsXZ9xQytcuPwuK2EA7Tih38wvd8vD7mEuB2OAgOYX605fE5APwpnvKDit/JpTvkvJ93jI6yGEOwNu0f3C/+rRWuD2+qb38G3nrHTCKbBEmdjVmyoiblZ76Blsv6cGK+61vY/nR1V1a3lMpYQqRSk7zrvlj7ncAtEGLCxslLTIJGRAZSX9b6/hNhv7nZN4EbBV5RrD90rS6o8vXdqqDw4QbOOI0FGNu5MpteK6JQ65bWHpdtcLcyFG5LNmech244i/e7UFiisiTOjscneVIxhzuvmo3eECIqVHPv574NaYVEjdsFAyrIY8SGBOs3jUcFXoW771cQBb9kTms9Tu1c7DbXpxNY2HlBICzUWAX/MSPwA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ouO6qBe5P1sJU0W+MRf20HBOoKB0mw0hSRsXIZRVktLa97K8LqR1kVSGfmeV?=
 =?us-ascii?Q?m4Gb7VfDm2qfoEDL1GMkHY1jTVxdTAlWv3VjSTQlpJFTTu1Zgy+2Grhcs8qc?=
 =?us-ascii?Q?TohBwj4hwofwCtr5qKLlU85G+sRTWrNRzllAdy2NdD/NCasuxQPg+VmttTAs?=
 =?us-ascii?Q?XEK988cyK/MMF06R83afX+yPGGOr5aS9cdcQHV3y/Qw/cAsRf7LiUCzQ6mah?=
 =?us-ascii?Q?fzmoEZcPieHSDMZ6yFbsf2gbWZTRF+UvQ753VK1MMK7ihGWOOH914gd1z488?=
 =?us-ascii?Q?FWS3tl0q38/MJ0ZkLuVaadTF4MypgkY6GhMYI94KyLRFtvHhQ4clXaVjKFL+?=
 =?us-ascii?Q?TORyWbglPmfKvtecL34mmIyAGD1IV8ovNDdicdouzxgRF1iZ7QG4Tdt6W6FK?=
 =?us-ascii?Q?t/tocyIO3ecyJPQJjrlio6qZD/yRZskUdA7GTKCCMAGrzZRykK1ONtPDy2oG?=
 =?us-ascii?Q?paGH96rGaB1GJfiPe6DpBkUyl4tChOElO5H+orXTFjREDU8cXnrDG6RQPUMh?=
 =?us-ascii?Q?WK+1dB6e+dLpFoHqOZNZ/qEFDvufEh2Vgbak285cLcWSWLnMOeLLAYpBTZVD?=
 =?us-ascii?Q?BPdRIO2aKi6tMK7VA/D0RpjCc7VWuEOh3ozDE8lV1XBgjtcRnG0nwX0HlvI3?=
 =?us-ascii?Q?jJ69gXKgqt1GpLq4un2ajX8CJDXXO5yuF9Bd9JYIq1ZrJuE9nFnWHLwzvl60?=
 =?us-ascii?Q?rJ+cXsFhz5Im/UUmIbRdwm/anWFB40wTLWeU+Sjmi9H3HNAPMt/e5iiUnWXR?=
 =?us-ascii?Q?+A2lETxFBFw5unjlprem8U2WuCXEbOgal1E7ern1pGZUU63G3KmYhPtza2l1?=
 =?us-ascii?Q?lH+6fQZjyiyN3p13ff7GbdJgyoyx4XUV1xElCnIDNynsPtkwSvnIMaKvp6Of?=
 =?us-ascii?Q?YtPqPPR6wEJObcVpFvqtPBoQUdR/keah5kf9JMFuZAN5CP7X3BT3UbLDdLNi?=
 =?us-ascii?Q?yZVAiSPwvxpL8kddjKRDNSHlyrROcbW3B/5OwjShhgUKslkYv/YShb1rqLGL?=
 =?us-ascii?Q?ti/yVJVRt3tNJ/K1GKrA58qjFEJP1u1QmWR+QjwYTkXs4kRL1UcNemBUuAtu?=
 =?us-ascii?Q?t8V6Ewa3qnCsAF3Q99k/KKD9Gw3uL6zSnI+8EdJ7T0+MMwZpyNXoNxsK0mmx?=
 =?us-ascii?Q?wVi+2ne3sR3g34jSXvravFyjXL8DFoAx9wfXW+FRWsS94a+nI+mTDLYf9fey?=
 =?us-ascii?Q?HA8x+2cRMNqE7xoYomfvbNDlen+YeWNS6BoIV30qabg4G2GoxgRW7FtBUjKd?=
 =?us-ascii?Q?GKSJeaZcwc+r2bDgT1uQ75enOiRUQa1dWANs0pjdTsq+h5gOyUiyHz4HEkPQ?=
 =?us-ascii?Q?xUbOuODDZ/QE55PPvWb7CrtjP8tgNuzehFWP8/LSZTvmKvVTpWHh9tHOGOII?=
 =?us-ascii?Q?L1BLid5NrdoNv/Z8o0MJMdCHidtgHCg1dnMXIOC9M51+vChh8+glzmLCGaaq?=
 =?us-ascii?Q?Z/3nesdBTZW0GnUztL5jgC0zjHaalwcsTemKnkbNrZzy3Y1V0rwPxGvgOxgl?=
 =?us-ascii?Q?2ehaV7gqbm5kuCvPpOMdPkXWMQWax9H0BIE6t7PHiwhUUEMZd6QbQ646FU6y?=
 =?us-ascii?Q?gZDVwUINJfedjYdJFG57sHhIpEzUTZVW1pszfruQAre+ndfGDBKthMeghn+c?=
 =?us-ascii?Q?0ds7oYamzZ/yPfVlzeQHg4zgs/qx2p7JhU8v06pbbSm+xSI+Hk2rtD5lq6Wi?=
 =?us-ascii?Q?Eh69/lmMc5Lhar5z3tDwon3FA555QPVczrvYe5EOxpA9652ETDYFMMhWnzVt?=
 =?us-ascii?Q?Nit32bLrFQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 020f4696-ca22-4c69-d81d-08de84f734d7
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:04:01.4423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yh4pF0Oaq7KBFkMgDtB8S/vx953FxnAXtf3WkZZtY0eCnLsSw1niEE3JciwK3j7fu/2rnW8Kqzig/lyxRPagxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1961
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 14:04:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233405

Add ptest infrastructure to test the Go standard library.

- Run 'go test -short std' via run-ptest script
- Install source tree and pkg/include headers
- Create VERSION file for architecture detection
- Exclude multi-arch binary testdata to avoid QA errors

Test results: 237/253 pass (93.7%) on qemux86-64.

Known issues:
- debug/elf, debug/pe, debug/plan9obj, internal/xcoff: missing binary testd=
ata
- time: requires embedded timezone data
- net/http: requires unstripped go binary
- testing, go/types: minor edge cases

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
Changes in v3:
- Move go from PTESTS_FAST to PTESTS_SLOW (~45min runtime)
  inside ptest-packagelists.inc

Changes in v2:
- Exclude .elf* files to fix QA arch errors on all architectures
- Exclude *-x86-64* files to fix additional arch-specific test binaries
- Tested on x86-64, x86, aarch64, and arm builds
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/go/go-1.26.0.inc        |  1 +
 meta/recipes-devtools/go/go/run-ptest         | 23 ++++++++++++++++
 meta/recipes-devtools/go/go_1.26.0.bb         | 27 ++++++++++++++++++-
 4 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-devtools/go/go/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index 1bb7458fc9..c7f79e96b5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -118,6 +118,7 @@ PTESTS_SLOW =3D "\
     gettext \
     glib-2.0 \
     gnutls \
+    go \
     gstreamer1.0 \
     less \
     libevent \
diff --git a/meta/recipes-devtools/go/go-1.26.0.inc b/meta/recipes-devtools=
/go/go-1.26.0.inc
index 7d8a68e3b2..611f00aaab 100644
--- a/meta/recipes-devtools/go/go-1.26.0.inc
+++ b/meta/recipes-devtools/go/go-1.26.0.inc
@@ -16,5 +16,6 @@ SRC_URI +=3D "\
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch=
 \
     file://0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch=
 \
+    file://run-ptest \
 "
 SRC_URI[main.sha256sum] =3D "c9132a8a1f6bd2aa4aad1d74b8231d95274950483a495=
0657ee6c56e6e817790"
diff --git a/meta/recipes-devtools/go/go/run-ptest b/meta/recipes-devtools/=
go/go/run-ptest
new file mode 100755
index 0000000000..86ff1bd1ae
--- /dev/null
+++ b/meta/recipes-devtools/go/go/run-ptest
@@ -0,0 +1,23 @@
+#!/bin/sh
+PTEST_DIR=3D/usr/lib/go/ptest
+GOROOT=3D/usr/lib/go
+
+export GOROOT
+export PATH=3D$GOROOT/bin:$PATH
+export ZONEINFO=3D/usr/share/zoneinfo
+
+ln -sf $PTEST_DIR/src $GOROOT/src
+mkdir -p $GOROOT/pkg/include
+cp $PTEST_DIR/pkg/include/* $GOROOT/pkg/include/
+cp $PTEST_DIR/VERSION $GOROOT/VERSION
+
+cd $GOROOT
+
+go test -short std 2>&1 | while IFS=3D read -r line; do
+    case "$line" in
+        ok*) echo "PASS: $(echo "$line" | awk '{print $2}')" ;;
+        FAIL*) echo "FAIL: $(echo "$line" | awk '{print $2}')" ;;
+        \?*) ;;
+        *) echo "$line" ;;
+    esac
+done
diff --git a/meta/recipes-devtools/go/go_1.26.0.bb b/meta/recipes-devtools/=
go/go_1.26.0.bb
index 46f5fbc6be..35a14b8e8b 100644
--- a/meta/recipes-devtools/go/go_1.26.0.bb
+++ b/meta/recipes-devtools/go/go_1.26.0.bb
@@ -1,7 +1,7 @@
 require go-${PV}.inc
 require go-target.inc
=20
-inherit linuxloader
+inherit linuxloader ptest
=20
 CGO_LDFLAGS:append =3D " -no-pie"
=20
@@ -16,3 +16,28 @@ python() {
         d.appendVar('INSANE_SKIP:%s' % d.getVar('PN'), " textrel")
 }
=20
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/src
+    install -d ${D}${PTEST_PATH}/pkg/include
+
+    cp ${S}/pkg/include/* ${D}${PTEST_PATH}/pkg/include/
+    echo "go${PV}" > ${D}${PTEST_PATH}/VERSION
+
+    cd ${S}/src
+    find . -type d -exec install -d ${D}${PTEST_PATH}/src/{} \;
+    find . -type f \
+        ! -path "*/testdata/*.elf*" \
+        ! -path "*/testdata/*-x86-64*" \
+        ! -path "*/testdata/*.obj" \
+        ! -path "*/testdata/*.syso" \
+        ! -path "*/testdata/*.so" \
+        ! -path "*/testdata/*.so_" \
+        ! -path "*/testdata/*-exec" \
+        ! -path "*/testdata/test32*" \
+        ! -path "*/testdata/test64*" \
+        ! -path "*/race/*.syso" \
+        ! -path "*/boring/syso/*.syso" \
+        -exec install -m 0644 {} ${D}${PTEST_PATH}/src/{} \;
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash tzdata git packagegroup-core-buildessentia=
l"
--=20
2.43.0


