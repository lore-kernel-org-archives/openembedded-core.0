Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id DA93D7E799
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 12:47:43 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id w9so16683277wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EupPyL+MedF6pPqew6L5uPCqrekRVoYgXmCNDPaZmao=;
	b=NYEcq1wBm3Ze0W8XkYWAp3QBea7mNneguriK0XuSUP2+F9JHH+V7sXcmyOAaFSDbbl
	2PdJrRMwIOqGkayISdrHUDvskfI+j90ssmEuaTykBkXPCvJr8QyNUcY8vV/AHpLvKucC
	eSBw/JIrbTmxnGYyGjYjYECnzv0FogNaNuGnbN6pVO7+7RjVqiUyMzyG15HoLd0u4oGk
	gjvF7RwZYeLTKxehHXzsdQxmgNFtNEIwzmpAl1Nry6BU9oY8LSU8gp0yJRN0qxTGSpyo
	k1Rd75bQbEgo5iiSNNW9kCrnYOBKBfRG8ZneyQitICdNPqkJfN6IcVQW6pVA1zNXVxfY
	btyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EupPyL+MedF6pPqew6L5uPCqrekRVoYgXmCNDPaZmao=;
	b=Nfn5Sx+nr503Q9tb5N7BeyyU5fBx96JeoPCpI3XKZ42xfeuHJGxiE39j1zknSFjbBv
	KLPXtMJDnNnJVh9c3Dx1HHdtelsAgPbjlex1U91xvNzNSoTCECm2Q70nM8g7dY2mHyL0
	ON+20sHeUGlE/6af4tOvPOfgWtF3ZUKSHd+eaUYZiSvxl3Herl/VWgAz/j+dnXcaeR7D
	3lPwdaF7j8Y3bw5omUbqiFJa9Rz6VzbOtWYTGYdeM3i3YvS2Q+deRIBbgFv6PYXseRlt
	3A3rjmO4hmoX/gNoB26dvo2xX4DGHG6Mu0Ad4zPgbQojOWOw5IUsrhS44XWwpLe4g6u9
	W3eQ==
X-Gm-Message-State: APjAAAUDRswvpkI3BgM/IeEXNgG3o8nryKBouIQ1bXovrX0f+i5Uik8u
	eitHzmf/m4mh6bJ3ChLHVSRFUAkKfAk=
X-Google-Smtp-Source: APXvYqyIvHHOuVAXcs3PDlVIxosf3U+dE4M2Xlt9oqpdZrcESZuJZ4Iu3lecaDPCTSDwQ1kVhp1r/A==
X-Received: by 2002:a1c:f918:: with SMTP id x24mr29410907wmh.132.1563281264289;
	Tue, 16 Jul 2019 05:47:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o20sm47959960wrh.8.2019.07.16.05.47.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 16 Jul 2019 05:47:43 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2019 13:47:39 +0100
Message-Id: <20190716124739.22442-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libid3tag: handle unknown encodings (CVE-2017-11550)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2019 12:47:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libid3tag/unknown-encoding.patch          | 39 +++++++++++++++++++
 .../libid3tag/libid3tag_0.15.1b.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch

diff --git a/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
new file mode 100644
index 00000000000..f0867b5f01c
--- /dev/null
+++ b/meta/recipes-multimedia/libid3tag/libid3tag/unknown-encoding.patch
@@ -0,0 +1,39 @@
+In case of an unknown/invalid encoding, id3_parse_string() will
+return NULL, but the return value wasn't checked resulting
+in segfault in id3_ucs4_length().  This is the only place
+the return value wasn't checked.
+
+Patch taken from Debian:
+https://sources.debian.org/patches/libid3tag/0.15.1b-14/11_unknown_encoding.dpatch/
+
+CVE: CVE-2017-11550
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff -urNad libid3tag-0.15.1b~/compat.gperf libid3tag-0.15.1b/compat.gperf
+--- libid3tag-0.15.1b~/compat.gperf	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/compat.gperf	2007-01-14 14:36:53.000000000 +0000
+@@ -236,6 +236,10 @@
+ 
+     encoding = id3_parse_uint(&data, 1);
+     string   = id3_parse_string(&data, end - data, encoding, 0);
++    if (!string)
++    {
++	continue;
++    }
+ 
+     if (id3_ucs4_length(string) < 4) {
+       free(string);
+diff -urNad libid3tag-0.15.1b~/parse.c libid3tag-0.15.1b/parse.c
+--- libid3tag-0.15.1b~/parse.c	2004-01-23 09:41:32.000000000 +0000
++++ libid3tag-0.15.1b/parse.c	2007-01-14 14:37:34.000000000 +0000
+@@ -165,6 +165,9 @@
+   case ID3_FIELD_TEXTENCODING_UTF_8:
+     ucs4 = id3_utf8_deserialize(ptr, length);
+     break;
++  default:
++  	/* FIXME: Unknown encoding! Print warning? */
++	return NULL;
+   }
+ 
+   if (ucs4 && !full) {
diff --git a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
index 43edd3fe6a9..0312a610c07 100644
--- a/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
+++ b/meta/recipes-multimedia/libid3tag/libid3tag_0.15.1b.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/mad/libid3tag-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
            file://0001-Fix-gperf-3.1-incompatibility.patch \
            file://10_utf16.patch \
+           file://unknown-encoding.patch \
            "
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mad/files/libid3tag/"
 UPSTREAM_CHECK_REGEX = "/projects/mad/files/libid3tag/(?P<pver>.*)/$"
-- 
2.20.1


