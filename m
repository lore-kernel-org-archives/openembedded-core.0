Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.4554.1590033960441281020
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 21:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04L45wJK017346
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Wed, 20 May 2020 21:05:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Wed, 20 May 2020
 21:05:57 -0700
From: "Robert Yang" <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pbarker@konsulko.com>
Subject: [PATCH 1/1] archiver.bbclass: Fix duplicated SRC_URIs for do_ar_original
Date: Wed, 20 May 2020 21:05:56 -0700
Message-ID: <990b33fc44d9449f1a3e7c9d6703a8ba225e681e.1590033901.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1590033901.git.liezhi.yang@windriver.com>
References: <cover.1590033901.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The argument urls of bb.fetch2.Fetch(urls, d) are duplicated to SRC_URI, which caused errors like:

bb.data_smart.ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError: Fetcher failure: The SRCREV_FORMAT variable must be set when multiple SCMs are used.
The SCMs are:
git://github.com/docker/notary.git;destsuffix=git/src/github.com/docker/notary
git://github.com/docker/notary.git

The first one is from original SRC_URI, the second one is from the
variable 'urls', so cleanup SRC_URI before call bb.fetch2.Fetch() can fix the
problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/archiver.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 43333a7551..780c562b68 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -193,7 +193,13 @@ python do_ar_original() {
                 del decoded[5][param]
         encoded = bb.fetch2.encodeurl(decoded)
         urls[i] = encoded
-    fetch = bb.fetch2.Fetch(urls, d)
+
+    # Cleanup SRC_URI before call bb.fetch2.Fetch() since now SRC_URI is in the
+    # variable "urls", otherwise there might be errors like:
+    # The SRCREV_FORMAT variable must be set when multiple SCMs are used
+    ld = bb.data.createCopy(d)
+    ld.setVar('SRC_URI', '')
+    fetch = bb.fetch2.Fetch(urls, ld)
     tarball_suffix = {}
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
-- 
2.21.0

