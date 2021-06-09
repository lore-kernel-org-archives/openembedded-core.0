Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.5205.1623228892710015780
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 01:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: IlQY3sfEzEv6bGVgTsKXRa6jMZbcI16cOMLcyfSGQxyu2xYkwLm3acrNv0zCK7Gn6frvbA1UUV
 q8+esUjZRNoA==
X-IronPort-AV: E=McAfee;i="6200,9189,10009"; a="266187205"
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="266187205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2021 01:54:52 -0700
IronPort-SDR: SSD82bQTtqwZjV9RiNeT6eYMIVfe/70JmPLF2pdeTwiZwEa/A2X2crGYYKukuDwWFDPiXc34ge
 1p/QiGngmTBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,260,1616482800"; 
   d="scan'208";a="552609494"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2021 01:54:51 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/3] bind: 9.11.22 -> 9.11.32
Date: Wed,  9 Jun 2021 16:54:48 +0800
Message-Id: <20210609085449.18975-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609085449.18975-1-chee.yang.lee@intel.com>
References: <20210609085449.18975-1-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fixes for
CVE-2021-25214
CVE-2021-25215
CVE-2021-25216

CVE-2020-8625 fixed in 9.11.28, so drop that patch

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

tmp

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../bind/bind/CVE-2020-8625.patch               | 17 -----------------
 .../bind/{bind_9.11.22.bb => bind_9.11.32.bb}   |  5 ++---
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.22.bb => bind_9.11.32.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
deleted file mode 100644
index 9078f2448e..0000000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
-CVE: CVE-2020-8625
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
-
-diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
-index e61d1c600f2..753dc8049fa 100644
---- a/lib/dns/spnego.c
-+++ b/lib/dns/spnego.c
-@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
- 		return (ASN1_OVERRUN);
- 	}
- 
--	data->components = malloc(len * sizeof(*data->components));
-+	data->components = malloc((len + 1) * sizeof(*data->components));
- 	if (data->components == NULL) {
- 		return (ENOMEM);
- 	}
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.32.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.22.bb
rename to meta/recipes-connectivity/bind/bind_9.11.32.bb
index 5598ba976d..9feebe5ae2 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.32.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bf39058a7f64b2a934ce14dc9ec1dd45"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b88e7ca5f21908e1b2720169f6807cf6"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -19,10 +19,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2020-8625.patch \
            "
 
-SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
+SRC_URI[sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.17.1

