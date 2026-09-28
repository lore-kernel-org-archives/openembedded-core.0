Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF86C9832F
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 07:13:10 +0000 (UTC)
Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52916.1790579580745914995
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 00:13:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=L2IoBN+u;
 spf=pass (domain: mvista.com, ip: 74.125.229.12, mailfrom: hprajapati@mvista.com)
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-328664dbe2dso1453450eec.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 00:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1790579580; x=1791184380; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HTnTByutD3xTzJwoXTkLnKqSJoTvkf0PIaoc15qD/c=;
        b=L2IoBN+uLiOzLpFsdYmUkto/y7SzuP91sOZUlANY9mrt6OmqrUtEmwYp0lsjXOw3G5
         +2sdacbPgcwRf92LP7xfdbmYtaEApllAdkq1jROvZnQIrhgNwOzgfTaw1qQLOXcGdsr4
         E1EQyY7QCE/iC3gcAmwdQ6ovYhG7bWLyXQrcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579580; x=1791184380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5HTnTByutD3xTzJwoXTkLnKqSJoTvkf0PIaoc15qD/c=;
        b=pvBtLNTpjwV2279cltsN4KX2i/dV23O+8iUDk2Lt0IMopVPCiwqki0Z5r+LnZ9ngO1
         Fz8x+71+RcUeR2gCQbRR6PPkeYjO6IUG4Dn04WShkNGCnRswW6QWARQKppoTK7T+fD16
         1NHvBv5HHRNj/JqIRSMQ8ykWcRlzD6aq42Z0q45a/aaI2TM9pQkXOvMvVeGhUNoLPP47
         nSduKuY9bt9fTC7+B9j0KClJExhdqdgo+aDp3xTu15hGGme5bbY8xKvtx1lwG7tRe3ME
         KQ+pj+gOfGnD5v+2JIc25fmAtD006vSqKs9JSrOayXbNftEIMq530l7zQGDngi2KpUpJ
         PUxw==
X-Gm-Message-State: AFq9FYJmzSa4dW9UZtX2sz14+VVySGHub452J3jmzq72T3XJVGbOceb1
	fLU4Giw2xIs1I+HL8vPmNZOTymny8qdFcnmv91fOXCoAaedNzvLuIwOnrUNt11KQe1Lw4WONw1u
	pKSDe9yk=
X-Gm-Gg: AYBFou0GZprjoIWdnhK7/aElW9mR06mGccDoHOktOFLjM9VPVMWS+w5PJE+Te/d33Mc
	b6TYuhhFYAJI6XfXmBphQb7EWYdaBN0k4uA0+iOmr1zsBwITuaNHNNxFHvSAJwcaoCqnIIvoe4y
	DtUvR2tv3TdQYxiKzs54z0WOSchhifk2MTFzxjoZoeNQDJTGIJ3ZG6k92QN47qPNDcyE6P/5P+Q
	/vn3DgLNa2XALSRgGGfGprtafMCi/vRS4iyY3yGrNBZH1f0Kda+x4tYJWtbEfFIcyg9fttJa/Vy
	+XWg6gzEbLW2rT2XCU6/cIKyZLlGqs4SndLz/8gPJ936bqOGWdO7Ltg/HhaBYjEgrWGl/mVAB8Z
	aORGONkNkXfhkdzRP0baD4QFP4FhfcbOBTARf+UXuvLWHK1TCrS9bn+xsSKwIJkJdpwQbeo7v8o
	9Q75wSizSnztPqLazb4z/Fts7RwK5NhqpKHT6z/1hXjx30Z1VXMmTBwYaYy92WTUiegFbCfc7vm
	Rn2PvUiCMs=
X-Received: by 2002:a05:7301:2727:b0:332:94e9:a72e with SMTP id 5a478bee46e88-34272754c58mr9337203eec.9.1790579579843;
        Mon, 28 Sep 2026 00:12:59 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3434958c3adsm31166948eec.22.2026.09.28.00.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 00:12:59 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH 3/6] bind: fix for CVE-2026-11331
Date: Mon, 28 Sep 2026 12:41:08 +0530
Message-ID: <20260928071115.304055-3-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260928071115.304055-1-hprajapati@mvista.com>
References: <20260928071115.304055-1-hprajapati@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246733

Pick patch from [1], [2] & [3] also mentioned at Debian report in [4]

[1] https://gitlab.isc.org/isc-projects/bind9/-/commit/adc8285d23e2eac6ec463f5dbc5a9596fdd36c60
[2] https://gitlab.isc.org/isc-projects/bind9/-/commit/095b11f20f911f5b8059bdc349b256d6c64ece30
[3] https://gitlab.isc.org/isc-projects/bind9/-/commit/dc328a199f96222e0c30cc20b7b795bfc2c9b2e4
[4] https://security-tracker.debian.org/tracker/CVE-2026-11331

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../bind/bind/CVE-2026-11331-01.patch         | 30 ++++++++++
 .../bind/bind/CVE-2026-11331-02.patch         | 58 +++++++++++++++++++
 .../bind/bind/CVE-2026-11331-03.patch         | 34 +++++++++++
 .../recipes-connectivity/bind/bind_9.18.49.bb |  3 +
 4 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11331-01.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11331-02.patch
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2026-11331-03.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11331-01.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-01.patch
new file mode 100644
index 0000000000..1aaca7392a
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-01.patch
@@ -0,0 +1,30 @@
+From: Mark Andrews <marka@isc.org>
+Date: Fri, 10 Apr 2026 10:24:06 +1000
+Subject: Fix TTL extraction from A/AAAA record
+
+(cherry picked from commit 89c86e338db2492b92e6618c586f146c6928dc6d)
+
+Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/adc8285d23e2eac6ec463f5dbc5a9596fdd36c60
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11331
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11331
+
+CVE: CVE-2026-11331
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/adc8285d23e2eac6ec463f5dbc5a9596fdd36c60]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tests/system/rpz/tests.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/bin/tests/system/rpz/tests.sh b/bin/tests/system/rpz/tests.sh
+index 87e4118..90cf80c 100644
+--- a/bin/tests/system/rpz/tests.sh
++++ b/bin/tests/system/rpz/tests.sh
+@@ -391,7 +391,7 @@ addr() {
+   digcmd $2 >$DIGNM
+   #ckalive "$2" "server crashed by 'dig $2'" || return 1
+   ADDR_ESC=$(echo "$ADDR" | sed -e 's/\./\\./g')
+-  ADDR_TTL=$(sed -n -e "s/^[-.a-z0-9]\{1,\}[	 ]*\([0-9]*\)	IN	AA*	${ADDR_ESC}\$/\1/p" $DIGNM)
++  ADDR_TTL=$(sed -n -e "s/^[-.a-z0-9]\{1,\}[	 ]*\([0-9]*\)[ 	]IN[ 	]AA*[ 	]${ADDR_ESC}\$/\1/p" $DIGNM)
+   if test -z "$ADDR_TTL"; then
+     setret "'dig $2' wrong; no address $ADDR record in $DIGNM"
+     return 0
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11331-02.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-02.patch
new file mode 100644
index 0000000000..8f45d7021b
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-02.patch
@@ -0,0 +1,58 @@
+From: Mark Andrews <marka@isc.org>
+Date: Fri, 10 Apr 2026 10:24:40 +1000
+Subject: Check rpz name too long wildcard CNAME expansion handling
+
+(cherry picked from commit 9345394e2097031b55b3ef34ceaadf5a7ebbeef2)
+
+Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/095b11f20f911f5b8059bdc349b256d6c64ece30
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11331
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11331
+
+CVE: CVE-2026-11331
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/095b11f20f911f5b8059bdc349b256d6c64ece30]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ bin/tests/system/rpz/ns2/tld2.db | 2 ++
+ bin/tests/system/rpz/ns4/tld4.db | 2 ++
+ bin/tests/system/rpz/tests.sh    | 5 ++++-
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/bin/tests/system/rpz/ns2/tld2.db b/bin/tests/system/rpz/ns2/tld2.db
+index c6f2556..c091ee2 100644
+--- a/bin/tests/system/rpz/ns2/tld2.db
++++ b/bin/tests/system/rpz/ns2/tld2.db
+@@ -123,3 +123,5 @@ a7-1		A	192.168.7.1
+ 
+ a7-2		A	192.168.7.2
+ 		TXT	"a7-2 tld2 text"
++
++*.wild		A	192.168.9.1
+diff --git a/bin/tests/system/rpz/ns4/tld4.db b/bin/tests/system/rpz/ns4/tld4.db
+index fca419c..8accd76 100644
+--- a/bin/tests/system/rpz/ns4/tld4.db
++++ b/bin/tests/system/rpz/ns4/tld4.db
+@@ -59,6 +59,8 @@ a3-6.tld2	A	56.56.56.56
+ 
+ a3-7.sub1.tld2	A	57.57.57.57
+ 
++*.wild.sub1.tld2	A	57.57.57.57
++
+ a3-8.tld2	A	58.58.58.58
+ 
+ a3-9.sub9.tld2	A	59.59.59.59
+diff --git a/bin/tests/system/rpz/tests.sh b/bin/tests/system/rpz/tests.sh
+index 90cf80c..5297437 100644
+--- a/bin/tests/system/rpz/tests.sh
++++ b/bin/tests/system/rpz/tests.sh
+@@ -516,7 +516,10 @@ nochange TCP a3-9.tld2                # 33 tcp-only
+ here x.servfail <<'EOF'               # 34 qname-wait-recurse yes
+   ;; status: SERVFAIL, x
+ EOF
+-addr 35.35.35.35 "x.servfail @$ns5" # 35 qname-wait-recurse no
++addr 35.35.35.35 "x.servfail @$ns5"                                                                                                                                                                                                                                    # 35 qname-wait-recurse no
++here aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.wild.sub1.tld2 <<'EOF' # 36 wildcard CNAME name to long
++    ;; status: YXDOMAIN, x
++EOF
+ end_group
+ ckstats $ns3 test1 ns3 22
+ ckstats $ns5 test1 ns5 1
diff --git a/meta/recipes-connectivity/bind/bind/CVE-2026-11331-03.patch b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-03.patch
new file mode 100644
index 0000000000..2d57122632
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2026-11331-03.patch
@@ -0,0 +1,34 @@
+From: Mark Andrews <marka@isc.org>
+Date: Fri, 10 Apr 2026 10:26:14 +1000
+Subject: Properly handle rpz name to long wildcard expansion
+
+Previously a self referential CNAME and the original address
+record were returned.  We now return a YXDOMAIN response.
+
+(cherry picked from commit cfc4c4f69870ce492deaaa429453563d1621ded3)
+
+Origin: https://gitlab.isc.org/isc-projects/bind9/-/commit/dc328a199f96222e0c30cc20b7b795bfc2c9b2e4
+Bug-Debian-Security: https://security-tracker.debian.org/tracker/CVE-2026-11331
+Bug-Freexian-Security: https://deb.freexian.com/extended-lts/tracker/CVE-2026-11331
+
+CVE: CVE-2026-11331
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/bind9/-/commit/dc328a199f96222e0c30cc20b7b795bfc2c9b2e4]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/ns/query.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ns/query.c b/lib/ns/query.c
+index 86485b7..f0e5244 100644
+--- a/lib/ns/query.c
++++ b/lib/ns/query.c
+@@ -7579,7 +7579,8 @@ query_rpzcname(query_ctx_t *qctx, dns_name_t *cname) {
+ 					      qctx->fname, NULL);
+ 		if (result == DNS_R_NAMETOOLONG) {
+ 			client->message->rcode = dns_rcode_yxdomain;
+-		} else if (result != ISC_R_SUCCESS) {
++		}
++		if (result != ISC_R_SUCCESS) {
+ 			return result;
+ 		}
+ 	} else {
diff --git a/meta/recipes-connectivity/bind/bind_9.18.49.bb b/meta/recipes-connectivity/bind/bind_9.18.49.bb
index 42007383c4..dc274f6076 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.49.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
@@ -26,6 +26,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://CVE-2026-10822-03.patch \
            file://CVE-2026-10822-04.patch \
            file://CVE-2026-10822-05.patch \
+           file://CVE-2026-11331-01.patch \
+           file://CVE-2026-11331-02.patch \
+           file://CVE-2026-11331-03.patch \
            "
 
 SRC_URI[sha256sum] = "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa352b1093e525cd24"
-- 
2.50.1


