Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E2BDCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 10:05:23 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16953.1781085912997206227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 03:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F0voxoXa;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=28364; q=dns/txt;
  s=iport01; t=1781085913; x=1782295513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TIkBuauXpQhWsnFetwPdLD0KGq1imntQzXt/JxC9zqk=;
  b=F0voxoXac02nL01kZGieuPc3RgKHEof2RT4CU0jniUFhIChLsh+nIYlT
   kU1g+0HOFW6HMUFspa6stQ3/bjvDOeEBPDBazhxuenv/shmZnei1CPRtq
   Dy2ep8BJEYlrJYxTqhjyzcewEAwXqKkRChcTpYEj0m1qOATcwNnOhfo0S
   rW9ViZxXg9A82ubp8HuZIXA88+1vW2gH4sAmG3rTeFQlY7xoEka3YhSl/
   vCRAfRd7v3uVStXYLBZIWcvHD3WQZmOEry9XFHrYtnT04pLAxLmoTcSIb
   gd4+9ERziBBbbZ1OXYews5UFNal+dw5uHws3x5d69Tg7ElgmIdmUEbN8C
   w==;
X-CSE-ConnectionGUID: +MxE1uUhQp2E0pPfkqXUEw==
X-CSE-MsgGUID: ZnFC3VsiSeSpE+bKPVXNVA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDwNSlq/5T/Ja1aglmCGD90X0JJlkuBFpA3jFEUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhQYCjToCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGFQgyDYZaAQIBHQ0LARgBLSwDAQJaIxgJgipYAYJzAgERswaBe?=
 =?us-ascii?q?TOBAYMoATEFCQICQAFQ2ysBCxQBBYEzhT+IHlsYAYR8JxsbgXKBFYE7gTd2g?=
 =?us-ascii?q?QWBXAWBIAoLhm0EgiKBDIFdHlJcgRKMNEiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDBsHBYFKgTdogQKFECMfAzmBFYF6gShnaRUwNWwDCxgNSBEsN?=
 =?us-ascii?q?xQbBD5uB4w6Fw+BRQE9IwsHASwEMBMQCgEKIQQQAwljAhVSARYBIyEIAQ0IE?=
 =?us-ascii?q?ZJGHRGQFoIhgTWfWgoog3SMIZU6GjOEBJQWklGZB44KlWcLXYRogWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD4M3inUBCwuDYIUTwz0kNQIJMgEBBwIHDgMLgWiQAQEmB4FOAQE?=
IronPort-Data: A9a23:Q2V/9aA6jE7ktBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApD8k1TQCy
 TQaXzqDOfeLMGbyKYx1O4uypE9TuJCGm4RqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH8g2YtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEgNB+IRgrAI0h4rxaWXl2+
 /8BGA0gcUXW7w626OrTpuhEnM8vKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY/BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FAgiuSzYIaEJLRmQ+1nmGiz/
 Vzd/l/0OQk3d9a88QS11EyF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:nVgjZqhnpxl0XR2LzTjGXoKxeXBQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3Au93fQWgSRiaKNwUE0JC7SP8ncjJuMVjN4S7NHk+?=
 =?us-ascii?q?BETxEEKWtR1yJyJ5JjJ87?=
X-Talos-MUID: 9a23:ARwwawS/k+4zsiWDRXTegh9Jb/lz4p+jM1gg0p8lg/e0ExJZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,197,1774310400"; 
   d="scan'208";a="492468496"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jun 2026 10:05:11 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 62E0E18000257;
	Wed, 10 Jun 2026 10:05:11 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 09F46CC1611; Wed, 10 Jun 2026 03:05:11 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Ashishkumar Parmar <asparmar@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 1/5] bind: Fix CVE-2026-1519
Date: Wed, 10 Jun 2026 03:04:00 -0700
Message-Id: <20260610100404.2993940-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 10:05:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238342

From: Ashishkumar Parmar <asparmar@cisco.com>

Pick the upstream 9.18 backport [1] for CVE-2026-1519. The public ISC
advisory [2] describes the vulnerability and identifies the fixed BIND
release.

The upstream fix is split across the reproducer and validation commits.
Also include one prerequisite NSEC3 bounds-check commit that is required
before the validation changes can be applied cleanly and validated
safely on the downstream 9.18.44 source:

- CVE-2026-1519_p1.patch [3] adds the upstream system-test reproducer
  for excessive NSEC3 iterations at delegation.
- CVE-2026-1519-dependent.patch [4] adds the prerequisite NSEC3
  next_length bounds check in isdelegation(). This patch is not part of
  the CVE merge commit, but it touches the same NSEC3 delegation path
  and must be applied before the functional validation changes.
- CVE-2026-1519_p2.patch [5] adds the iteration-limit handling in
  isdelegation().
- CVE-2026-1519_p3.patch [6] avoids re-validating already trusted
  rdatasets.
- CVE-2026-1519_p4.patch [7] checks RRset trust in
  validate_neg_rrset().

Keep the patches split to preserve the upstream commit structure and to
make the SRC_URI ordering explicit.

[1] https://gitlab.com/isc-projects/bind9/-/commit/5ef459eeaa92222ad28d2186f5eae9a586dece70
[2] https://kb.isc.org/docs/cve-2026-1519
[3] https://gitlab.com/isc-projects/bind9/-/commit/2c82f99a3c95f356861d5977f12ef9bbe2063cb6
[4] https://gitlab.com/isc-projects/bind9/-/commit/368c75a9f567f8b36cf24fefe45023e0a050e47b
[5] https://gitlab.com/isc-projects/bind9/-/commit/85c21feff9acb0982fe60f2c88201bf55533bd0e
[6] https://gitlab.com/isc-projects/bind9/-/commit/8890a91c1c16129333139b9d8a4381e0f741f0d6
[7] https://gitlab.com/isc-projects/bind9/-/commit/85fcd704e2f7cc2a25d2195bc4bb28398c889ed3

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../bind/bind/CVE-2026-1519-dependent.patch   |  50 +++
 .../bind/bind/CVE-2026-1519_p1.patch          | 341 ++++++++++++++++++
 .../bind/bind/CVE-2026-1519_p2.patch          | 176 +++++++++
 .../bind/bind/CVE-2026-1519_p3.patch          |  52 +++
 .../bind/bind/CVE-2026-1519_p4.patch          |  59 +++
 .../recipes-connectivity/bind/bind_9.18.44.bb |   5 +
 6 files changed, 683 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch
new file mode 100644
index 0000000000..eff7a06d82
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519-dependent.patch
@@ -0,0 +1,50 @@
+From af8929ebe72ca8564882632e59999795c781ebd4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ond=C5=99ej=20Sur=C3=BD?= <ondrej@isc.org>
+Date: Sat, 14 Feb 2026 14:43:41 +0100
+Subject: [PATCH] Invalid NSEC3 can cause OOB read of the isdelegation() stack
+
+When .next_length is longer than NSEC3_MAX_HASH_LENGTH, it causes a
+harmless out-of-bound read of the isdelegation() stack. This patch
+fixes the issue by skipping NSEC3 records with an oversized hash length
+during validation.
+
+CVE: CVE-2026-1519
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/368c75a9f567f8b36cf24fefe45023e0a050e47b]
+
+(cherry picked from commit 67b4fb56e40bf856e1fccd41e752d5f486b5b569)
+(cherry picked from commit 368c75a9f567f8b36cf24fefe45023e0a050e47b)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/rdata/generic/nsec3_50.c | 1 +
+ lib/dns/validator.c              | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/lib/dns/rdata/generic/nsec3_50.c b/lib/dns/rdata/generic/nsec3_50.c
+index f45fe4dc33..e04587bd1b 100644
+--- a/lib/dns/rdata/generic/nsec3_50.c
++++ b/lib/dns/rdata/generic/nsec3_50.c
+@@ -324,6 +324,7 @@ tostruct_nsec3(ARGS_TOSTRUCT) {
+ 	}
+ 
+ 	nsec3->mctx = mctx;
++
+ 	return ISC_R_SUCCESS;
+ 
+ cleanup:
+diff --git a/lib/dns/validator.c b/lib/dns/validator.c
+index 809b7be911..9ec13581ab 100644
+--- a/lib/dns/validator.c
++++ b/lib/dns/validator.c
+@@ -339,6 +339,9 @@ trynsec3:
+ 			if (nsec3.hash != 1) {
+ 				continue;
+ 			}
++			if (nsec3.next_length > NSEC3_MAX_HASH_LENGTH) {
++				continue;
++			}
+ 			length = isc_iterated_hash(
+ 				hash, nsec3.hash, nsec3.iterations, nsec3.salt,
+ 				nsec3.salt_length, name->ndata, name->length);
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch
new file mode 100644
index 0000000000..f78af9da11
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p1.patch
@@ -0,0 +1,341 @@
+From 81f8acc4bdf84eec6f53a65709b61ad3d963b4f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Nicki=20K=C5=99=C3=AD=C5=BEek?= <nicki@isc.org>
+Date: Tue, 3 Feb 2026 18:25:04 +0100
+Subject: [PATCH] Reproducer for CVE-2026-1519
+
+When a validating resolver processes a delegation from a DNSSEC-signed
+zone which uses too many NSEC3 iterations, it should cease the attempt
+to validate due to an NSEC3 iteration limit being exceeded and fall back
+to insecure.
+
+CVE: CVE-2026-1519
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/2c82f99a3c95f356861d5977f12ef9bbe2063cb6]
+
+(cherry picked from commit 9bc14a89f1313aa38330e84674ac3b7691db3383)
+(cherry picked from commit 2c82f99a3c95f356861d5977f12ef9bbe2063cb6)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ .../system/nsec3-delegation/ns1/named.conf.j2 | 35 +++++++++++
+ bin/tests/system/nsec3-delegation/ns1/root.db | 25 ++++++++
+ .../ns2/iter-too-many.db.j2.manual            | 31 ++++++++++
+ .../system/nsec3-delegation/ns2/named.conf.j2 | 40 ++++++++++++
+ .../nsec3-delegation/ns2/sub.iter-too-many.db | 24 ++++++++
+ .../system/nsec3-delegation/ns3/named.conf.j2 | 37 +++++++++++
+ .../nsec3-delegation/ns3/trusted.conf.j2      |  1 +
+ .../tests_excessive_nsec3_iterations.py       | 61 +++++++++++++++++++
+ 8 files changed, 254 insertions(+)
+ create mode 100644 bin/tests/system/nsec3-delegation/ns1/named.conf.j2
+ create mode 100644 bin/tests/system/nsec3-delegation/ns1/root.db
+ create mode 100644 bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual
+ create mode 100644 bin/tests/system/nsec3-delegation/ns2/named.conf.j2
+ create mode 100644 bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db
+ create mode 100644 bin/tests/system/nsec3-delegation/ns3/named.conf.j2
+ create mode 120000 bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2
+ create mode 100644 bin/tests/system/nsec3-delegation/tests_excessive_nsec3_iterations.py
+
+diff --git a/bin/tests/system/nsec3-delegation/ns1/named.conf.j2 b/bin/tests/system/nsec3-delegation/ns1/named.conf.j2
+new file mode 100644
+index 0000000000..65016d1c67
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns1/named.conf.j2
+@@ -0,0 +1,35 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.1;
++	notify-source 10.53.0.1;
++	transfer-source 10.53.0.1;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.1; };
++	listen-on-v6 { none; };
++	recursion no;
++	dnssec-validation no;
++};
++
++controls {
++	inet 10.53.0.1 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++include "../../_common/rndc.key";
++
++zone "." {
++	type primary;
++	file "root.db";
++};
+diff --git a/bin/tests/system/nsec3-delegation/ns1/root.db b/bin/tests/system/nsec3-delegation/ns1/root.db
+new file mode 100644
+index 0000000000..c3f80d0d4b
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns1/root.db
+@@ -0,0 +1,25 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++.			IN SOA	. . (
++				2025063000	; serial
++				600		; refresh
++				600		; retry
++				1200		; expire
++				600		; minimum
++				)
++.			NS	a.root-servers.nil.
++
++a.root-servers.nil	A	10.53.0.1
++
++iter-too-many.		NS	ns2.iter-too-many.
++ns2.iter-too-many.	A	10.53.0.2
+diff --git a/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual b/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual
+new file mode 100644
+index 0000000000..fa5023d21b
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns2/iter-too-many.db.j2.manual
+@@ -0,0 +1,31 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++{% raw %}
++$TTL 300
++@			IN SOA	ns2.iter-too-many. hostmaster.iter-too-many. (
++				2026020300	; serial
++				20		; refresh (20 seconds)
++				20		; retry (20 seconds)
++				1814400		; expire (3 weeks)
++				3600		; minimum (1 hour)
++)
++
++@	IN	NS	ns2.iter-too-many.
++ns2	IN	A	10.53.0.2
++
++sub	IN	NS	ns2.sub.iter-too-many.
++ns2.sub	IN	A	10.53.0.2
++{% endraw %}
++
++{% for dnskey in dnskeys %}
++@dnskey@
++{% endfor %}
+diff --git a/bin/tests/system/nsec3-delegation/ns2/named.conf.j2 b/bin/tests/system/nsec3-delegation/ns2/named.conf.j2
+new file mode 100644
+index 0000000000..2f4823574f
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns2/named.conf.j2
+@@ -0,0 +1,40 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.2;
++	notify-source 10.53.0.2;
++	transfer-source 10.53.0.2;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.2; };
++	listen-on-v6 { none; };
++	recursion no;
++	dnssec-validation no;
++};
++
++controls {
++	inet 10.53.0.2 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++include "../../_common/rndc.key";
++
++zone "iter-too-many" {
++	type primary;
++	file "iter-too-many.signed.db";
++};
++
++zone "sub.iter-too-many" {
++	type primary;
++	file "sub.iter-too-many.db";
++};
+diff --git a/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db b/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db
+new file mode 100644
+index 0000000000..09b2bb6fb3
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns2/sub.iter-too-many.db
+@@ -0,0 +1,24 @@
++; Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++;
++; SPDX-License-Identifier: MPL-2.0
++;
++; This Source Code Form is subject to the terms of the Mozilla Public
++; License, v. 2.0.  If a copy of the MPL was not distributed with this
++; file, you can obtain one at https://mozilla.org/MPL/2.0/.
++;
++; See the COPYRIGHT file distributed with this work for additional
++; information regarding copyright ownership.
++
++$TTL 300
++@			IN SOA	ns2.sub.iter-too-many. hostmaster.sub.iter-too-many. (
++				2026020300	; serial
++				20		; refresh (20 seconds)
++				20		; retry (20 seconds)
++				1814400		; expire (3 weeks)
++				3600		; minimum (1 hour)
++)
++
++@	IN	NS	ns2.sub.iter-too-many.
++ns2	IN	A	10.53.0.2
++
++example	IN	A	127.0.0.1
+diff --git a/bin/tests/system/nsec3-delegation/ns3/named.conf.j2 b/bin/tests/system/nsec3-delegation/ns3/named.conf.j2
+new file mode 100644
+index 0000000000..e36b88c53e
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns3/named.conf.j2
+@@ -0,0 +1,37 @@
++/*
++ * Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++ *
++ * SPDX-License-Identifier: MPL-2.0
++ *
++ * This Source Code Form is subject to the terms of the Mozilla Public
++ * License, v. 2.0.  If a copy of the MPL was not distributed with this
++ * file, you can obtain one at https://mozilla.org/MPL/2.0/.
++ *
++ * See the COPYRIGHT file distributed with this work for additional
++ * information regarding copyright ownership.
++ */
++
++options {
++	query-source address 10.53.0.3;
++	notify-source 10.53.0.3;
++	transfer-source 10.53.0.3;
++	port @PORT@;
++	pid-file "named.pid";
++	listen-on { 10.53.0.3; };
++	listen-on-v6 { none; };
++	recursion yes;
++	dnssec-validation yes;
++};
++
++controls {
++	inet 10.53.0.3 port @CONTROLPORT@ allow { any; } keys { rndc_key; };
++};
++
++include "../../_common/rndc.key";
++
++zone "." {
++	type hint;
++	file "../../_common/root.hint";
++};
++
++include "trusted.conf";
+diff --git a/bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2 b/bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2
+new file mode 120000
+index 0000000000..cb0be77b22
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/ns3/trusted.conf.j2
+@@ -0,0 +1 @@
++../../_common/trusted.conf.j2
+\ No newline at end of file
+diff --git a/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_iterations.py b/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_iterations.py
+new file mode 100644
+index 0000000000..f85384bb1e
+--- /dev/null
++++ b/bin/tests/system/nsec3-delegation/tests_excessive_nsec3_iterations.py
+@@ -0,0 +1,61 @@
++# Copyright (C) Internet Systems Consortium, Inc. ("ISC")
++#
++# SPDX-License-Identifier: MPL-2.0
++#
++# This Source Code Form is subject to the terms of the Mozilla Public
++# License, v. 2.0.  If a copy of the MPL was not distributed with this
++# file, you can obtain one at https://mozilla.org/MPL/2.0/.
++#
++# See the COPYRIGHT file distributed with this work for additional
++# information regarding copyright ownership.
++
++from isctest.run import EnvCmd
++
++import isctest
++
++
++def bootstrap():
++    templates = isctest.template.TemplateEngine(".")
++    keygen = EnvCmd("KEYGEN", "-a ECDSA256")
++    signer = EnvCmd("SIGNER")
++
++    isctest.log.info("setup iter-too-many.")
++    zonename = "iter-too-many."
++    ksk_name = keygen(f"-f KSK {zonename}", cwd="ns2").out.strip()
++    zsk_name = keygen(f"{zonename}", cwd="ns2").out.strip()
++    ksk = isctest.kasp.Key(ksk_name, keydir="ns2")
++    zsk = isctest.kasp.Key(zsk_name, keydir="ns2")
++    dnskeys = [ksk.dnskey, zsk.dnskey]
++
++    tdata = {
++        "dnskeys": dnskeys,
++    }
++    templates.render(f"ns2/{zonename}db", tdata, template=f"ns2/{zonename}db.j2.manual")
++    signer(
++        f"-P -o {zonename} -f {zonename}signed.db -3 A1B2C3D4 -H too-many -H 151 -S {zonename}db",
++        cwd="ns2",
++    )
++
++    return {
++        "trust_anchors": [
++            ksk.into_ta("static-key"),
++        ],
++    }
++
++
++def test_excessive_nsec3_iterations_delegation(ns3):
++    # reproducer for CVE-2026-1519 [GL#5708]
++    zone = "example.sub.iter-too-many"
++    msg = isctest.query.create(zone, "A")
++    res = isctest.query.tcp(msg, ns3.ip)
++
++    # an insecure response is expected regardless of the NSEC3 iteration limit,
++    # because the sub.iter-too-many. zone is unsigned. the real difference is
++    # in the CPU usage required for generating such response, but that can't be
++    # easily and reliably tested in an automated fashion
++    isctest.check.noerror(res)
++
++    with ns3.watch_log_from_start() as watcher:
++        watcher.wait_for_line(
++            f"validating {zone}/A: validator_callback_ds: too many iterations"
++        )
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch
new file mode 100644
index 0000000000..ee033b4b91
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p2.patch
@@ -0,0 +1,176 @@
+From e77c45ddae1ca87058244978868b6489610ca136 Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Tue, 3 Mar 2026 10:40:36 +0100
+Subject: [PATCH] Check iterations in isdelegation()
+
+When looking up an NSEC3 as part of an insecurity proof, check the
+number of iterations. If this is too high, treat the answer as insecure
+by marking the answer with trust level "answer", indicating that they
+did not validate, but could be cached as insecure.
+
+CVE: CVE-2026-1519
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/85c21feff9acb0982fe60f2c88201bf55533bd0e]
+
+(cherry picked from commit 988040a5e02f86f4a8cdb0704e8d501f9082a89c)
+(cherry picked from commit 85c21feff9acb0982fe60f2c88201bf55533bd0e)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/validator.c | 64 +++++++++++++++++++++++++++++++++------------
+ 1 file changed, 48 insertions(+), 16 deletions(-)
+
+diff --git a/lib/dns/validator.c b/lib/dns/validator.c
+index 9ec13581ab..179b6590b5 100644
+--- a/lib/dns/validator.c
++++ b/lib/dns/validator.c
+@@ -256,12 +256,25 @@ exit_check(dns_validator_t *val) {
+ }
+ 
+ /*%
+- * Look in the NSEC record returned from a DS query to see if there is
+- * a NS RRset at this name.  If it is found we are at a delegation point.
++ * The isdelegation() function is called as part of seeking the DS record.
++ * Look in the NSEC or NSEC3 record returned from a DS query to see if the
++ * record has the NS bitmap set. If so, we are at a delegation point.
++ *
++ * If the response contains NSEC3 records with too high iterations, we cannot
++ * (or rather we are not going to) validate the insecurity proof. Instead we
++ * are going to treat the message as insecure and just assume the DS was at
++ * the delegation.
++ *
++ * Returns:
++ *\li	#ISC_R_SUCCESS	the NS bitmap was set in the NSEC or NSEC3 record, or
++ *			the NSEC3 covers the name (in case of opt-out), or
++ *			we cannot validate the insecurity proof and are going
++ *			to treat the message as isnecure.
++ *\li	#ISC_R_NOTFOUND the NS bitmap was not set,
+  */
+-static bool
+-isdelegation(dns_name_t *name, dns_rdataset_t *rdataset,
+-	     isc_result_t dbresult) {
++static isc_result_t
++isdelegation(dns_validator_t *val, dns_name_t *name, dns_rdataset_t *rdataset,
++	     isc_result_t dbresult, const char *caller) {
+ 	dns_fixedname_t fixed;
+ 	dns_label_t hashlabel;
+ 	dns_name_t nsec3name;
+@@ -289,7 +302,7 @@ isdelegation(dns_name_t *name, dns_rdataset_t *rdataset,
+ 			goto trynsec3;
+ 		}
+ 		if (result != ISC_R_SUCCESS) {
+-			return false;
++			return ISC_R_NOTFOUND;
+ 		}
+ 	}
+ 
+@@ -303,7 +316,7 @@ isdelegation(dns_name_t *name, dns_rdataset_t *rdataset,
+ 		dns_rdata_reset(&rdata);
+ 	}
+ 	dns_rdataset_disassociate(&set);
+-	return found;
++	return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
+ 
+ trynsec3:
+ 	/*
+@@ -342,6 +355,18 @@ trynsec3:
+ 			if (nsec3.next_length > NSEC3_MAX_HASH_LENGTH) {
+ 				continue;
+ 			}
++			/*
++			 * If there are too many iterations assume bad things
++			 * are happening and bail out early. Treat as if the
++			 * DS was at the delegation.
++			 */
++			if (nsec3.iterations > DNS_NSEC3_MAXITERATIONS) {
++				validator_log(val, ISC_LOG_DEBUG(3),
++					      "%s: too many iterations",
++					      caller);
++				dns_rdataset_disassociate(&set);
++				return ISC_R_SUCCESS;
++			}
+ 			length = isc_iterated_hash(
+ 				hash, nsec3.hash, nsec3.iterations, nsec3.salt,
+ 				nsec3.salt_length, name->ndata, name->length);
+@@ -353,7 +378,7 @@ trynsec3:
+ 				found = dns_nsec3_typepresent(&rdata,
+ 							      dns_rdatatype_ns);
+ 				dns_rdataset_disassociate(&set);
+-				return found;
++				return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
+ 			}
+ 			if ((nsec3.flags & DNS_NSEC3FLAG_OPTOUT) == 0) {
+ 				continue;
+@@ -369,12 +394,12 @@ trynsec3:
+ 			      memcmp(hash, nsec3.next, length) < 0)))
+ 			{
+ 				dns_rdataset_disassociate(&set);
+-				return true;
++				return ISC_R_SUCCESS;
+ 			}
+ 		}
+ 		dns_rdataset_disassociate(&set);
+ 	}
+-	return found;
++	return found ? ISC_R_SUCCESS : ISC_R_NOTFOUND;
+ }
+ 
+ /*%
+@@ -590,8 +615,9 @@ fetch_callback_ds(isc_task_t *task, isc_event_t *event) {
+ 		} else if (eresult == DNS_R_SERVFAIL) {
+ 			goto unexpected;
+ 		} else if (eresult != DNS_R_CNAME &&
+-			   isdelegation(devent->foundname, &val->frdataset,
+-					eresult))
++			   isdelegation(val, devent->foundname, &val->frdataset,
++					eresult,
++					"fetch_callback_ds") == ISC_R_SUCCESS)
+ 		{
+ 			/*
+ 			 * Failed to find a DS while trying to prove
+@@ -755,10 +781,13 @@ validator_callback_ds(isc_task_t *task, isc_event_t *event) {
+ 			      dns_trust_totext(val->frdataset.trust));
+ 		have_dsset = (val->frdataset.type == dns_rdatatype_ds);
+ 		name = dns_fixedname_name(&val->fname);
++
+ 		if ((val->attributes & VALATTR_INSECURITY) != 0 &&
+ 		    val->frdataset.covers == dns_rdatatype_ds &&
+ 		    NEGATIVE(&val->frdataset) &&
+-		    isdelegation(name, &val->frdataset, DNS_R_NCACHENXRRSET))
++		    isdelegation(val, name, &val->frdataset,
++				 DNS_R_NCACHENXRRSET,
++				 "validator_callback_ds") == ISC_R_SUCCESS)
+ 		{
+ 			result = markanswer(val, "validator_callback_ds",
+ 					    "no DS and this is a delegation");
+@@ -2590,7 +2619,8 @@ validate_nx(dns_validator_t *val, bool resume) {
+ 			result = findnsec3proofs(val);
+ 			if (result == DNS_R_NSEC3ITERRANGE) {
+ 				validator_log(val, ISC_LOG_DEBUG(3),
+-					      "too many iterations");
++					      "%s: too many iterations",
++					      __func__);
+ 				markanswer(val, "validate_nx (3)", NULL);
+ 				return ISC_R_SUCCESS;
+ 			}
+@@ -2626,7 +2656,7 @@ validate_nx(dns_validator_t *val, bool resume) {
+ 		result = findnsec3proofs(val);
+ 		if (result == DNS_R_NSEC3ITERRANGE) {
+ 			validator_log(val, ISC_LOG_DEBUG(3),
+-				      "too many iterations");
++				      "%s: too many iterations", __func__);
+ 			markanswer(val, "validate_nx (4)", NULL);
+ 			return ISC_R_SUCCESS;
+ 		}
+@@ -2833,7 +2863,9 @@ seek_ds(dns_validator_t *val, isc_result_t *resp) {
+ 			return ISC_R_COMPLETE;
+ 		}
+ 
+-		if (isdelegation(tname, &val->frdataset, result)) {
++		result = isdelegation(val, tname, &val->frdataset, result,
++				      "seek_ds");
++		if (result == ISC_R_SUCCESS) {
+ 			*resp = markanswer(val, "seek_ds (3)",
+ 					   "this is a delegation");
+ 			return ISC_R_COMPLETE;
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch
new file mode 100644
index 0000000000..0473f40752
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p3.patch
@@ -0,0 +1,52 @@
+From 87c7c1aa7c648f15d57810afb198db709aa08ad3 Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Tue, 3 Mar 2026 11:17:25 +0100
+Subject: [PATCH] Don't verify already trusted rdatasets
+
+If we already marked an rdataset as secure (or it has even stronger
+trust), there is no need to cryptographically verify it again.
+
+CVE: CVE-2026-1519
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/8890a91c1c16129333139b9d8a4381e0f741f0d6]
+
+(cherry picked from commit 0ec08c212022d08c9717f2bc6bd3e8ebd6f034ce)
+(cherry picked from commit 8890a91c1c16129333139b9d8a4381e0f741f0d6)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/include/dns/types.h | 1 +
+ lib/dns/validator.c         | 7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/lib/dns/include/dns/types.h b/lib/dns/include/dns/types.h
+index 8ddcbeb4e2..bd9623058a 100644
+--- a/lib/dns/include/dns/types.h
++++ b/lib/dns/include/dns/types.h
+@@ -352,6 +352,7 @@ enum {
+ 	((x) == dns_trust_additional || (x) == dns_trust_pending_additional)
+ #define DNS_TRUST_GLUE(x)   ((x) == dns_trust_glue)
+ #define DNS_TRUST_ANSWER(x) ((x) == dns_trust_answer)
++#define DNS_TRUST_SECURE(x) ((x) >= dns_trust_secure)
+ 
+ /*%
+  * Name checking severities.
+diff --git a/lib/dns/validator.c b/lib/dns/validator.c
+index 179b6590b5..47efd3940f 100644
+--- a/lib/dns/validator.c
++++ b/lib/dns/validator.c
+@@ -1523,6 +1523,13 @@ verify(dns_validator_t *val, dst_key_t *key, dns_rdata_t *rdata,
+ 	bool ignore = false;
+ 	dns_name_t *wild;
+ 
++	if (DNS_TRUST_SECURE(val->event->rdataset->trust)) {
++		/*
++		 * This RRset was already verified before.
++		 */
++		return ISC_R_SUCCESS;
++	}
++
+ 	val->attributes |= VALATTR_TRIEDVERIFY;
+ 	wild = dns_fixedname_initname(&fixed);
+ again:
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch
new file mode 100644
index 0000000000..fd5d1afcd7
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-1519_p4.patch
@@ -0,0 +1,59 @@
+From 52b1997275768884d46c648b40f2ea625c386d17 Mon Sep 17 00:00:00 2001
+From: Matthijs Mekking <matthijs@isc.org>
+Date: Tue, 3 Mar 2026 11:43:23 +0100
+Subject: [PATCH] Check RRset trust in validate_neg_rrset()
+
+In many places we only create a validator if the RRset has too low
+trust (the RRset is pending validation, or could not be validated
+before). This check was missing prior to validating negative response
+data.
+
+CVE: CVE-2026-1519
+Upstream-Status: Backport [https://gitlab.com/isc-projects/bind9/-/commit/85fcd704e2f7cc2a25d2195bc4bb28398c889ed3]
+
+(cherry picked from commit 6ca67f65cd685cf8699540a852c1e3775bd48d64)
+(cherry picked from commit 85fcd704e2f7cc2a25d2195bc4bb28398c889ed3)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ lib/dns/validator.c | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/lib/dns/validator.c b/lib/dns/validator.c
+index 47efd3940f..7db102062b 100644
+--- a/lib/dns/validator.c
++++ b/lib/dns/validator.c
+@@ -2463,6 +2463,17 @@ validate_neg_rrset(dns_validator_t *val, dns_name_t *name,
+ 		}
+ 	}
+ 
++	if (rdataset->type != dns_rdatatype_nsec &&
++	    DNS_TRUST_SECURE(rdataset->trust))
++	{
++		/*
++		 * The negative response data is already verified.
++		 * We skip NSEC records, because they require special
++		 * processing in validator_callback_nsec().
++		 */
++		return DNS_R_CONTINUE;
++	}
++
+ 	val->currentset = rdataset;
+ 	result = create_validator(val, name, rdataset->type, rdataset,
+ 				  sigrdataset, validator_callback_nsec,
+@@ -2573,11 +2584,9 @@ validate_ncache(dns_validator_t *val, bool resume) {
+ 		}
+ 
+ 		result = validate_neg_rrset(val, name, rdataset, sigrdataset);
+-		if (result == DNS_R_CONTINUE) {
+-			continue;
++		if (result != DNS_R_CONTINUE) {
++			return result;
+ 		}
+-
+-		return result;
+ 	}
+ 	if (result == ISC_R_NOMORE) {
+ 		result = ISC_R_SUCCESS;
+-- 
+2.35.6
+
diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipes-connectivity/bind/bind_9.18.44.bb
index d424edcb4e..9c8b73dccc 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
@@ -18,6 +18,11 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2026-1519_p1.patch \
+           file://CVE-2026-1519-dependent.patch \
+           file://CVE-2026-1519_p2.patch \
+           file://CVE-2026-1519_p3.patch \
+           file://CVE-2026-1519_p4.patch \
            "
 
 SRC_URI[sha256sum] = "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274abf73f5b5389a6f82d"
-- 
2.35.6


