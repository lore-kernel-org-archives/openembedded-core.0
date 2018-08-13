Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0F878F5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 17:21:02 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id q8-v6so9618676wmq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=HtK2GT2ji5jE7OrQDMHUWwxWEoJ0RZqvH3WFklB8Ngk=;
	b=dgnoGxomF3MwLE1lkhtlfESs3Ye1QerqGvB+M6g4tMr9VV0D8vcxGV99JICKlNgKVw
	SKFkmRXQ5/e4HGMz7P0VRt8g3ajiX7eIcsNRFb0ReNBrzyB21tEL6aHyV6ON4SUXBHMC
	hBLD/dcVMSzNWLVjT0V+K8CYUW64bUoGiiyejPWZNUelVpyyvqDbI9iPJgzOTBmtw7sf
	xxuLCVWUgy8LkEAgIgaeLVBKoZyFPq3XjbAdf9oBKXNqxgXIB4uq0I50Q2WKfUqdIuPu
	IRvbLS69acMpllB9ajOeQW/yu3M7P8sFqNRkupFQY/6PfmYSAuBG/tU7P2OVI5SQGWNi
	Ss7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=HtK2GT2ji5jE7OrQDMHUWwxWEoJ0RZqvH3WFklB8Ngk=;
	b=EpMXkaXU0d4zr1CGKh9jV9cPtqawhjmw7pqM4bKUqDessnzmGxhVVKGxVq4LW5CE2W
	Mzvlaem/OrBE1qdBDvUOkg384pfH7wqJFrxoOO1U6DfIH0lkvcIPgbNmn9E6/SSkJ6Qa
	nxy1oGNQcJQMF2NqjYKzUDYd4NMU3VroApN2tJtUVTjSV6BDd66MLC6S1GFyxWEhIECc
	mUmu8eVyfwBxvWmaMpeEPYLscxzWNTCCoQ8XA6qM7GC/ut2RdrfYN+59R4Mn8tkiXwoQ
	CNgnRAI1+O0xzCG/jds7qGEaYHuqaS5BUWivpwj6BzkJvwPP+jeaRopnZdoNekKohD4Q
	IwbQ==
X-Gm-Message-State: AOUpUlGqsZUdxR+Tz1VGXe/lPgFQXlS3oqCgOwZUQHFHbRhYlL1RhIBg
	rnt3qg0ih2NcTzSrLjAZPHmh5qC1RE0=
X-Google-Smtp-Source: AA+uWPwWeFzMYTVZwLWCZC5RZIMm7PGSXG78qKbGty/konLnIhw894TZ58TN2Toh8UaeD/ZVMJSvkA==
X-Received: by 2002:a1c:cf0a:: with SMTP id
	f10-v6mr8340716wmg.32.1534180863109; 
	Mon, 13 Aug 2018 10:21:03 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e141-v6sm16598921wmd.32.2018.08.13.10.21.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 10:21:02 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2018 18:20:54 +0100
Message-Id: <20180813172054.17767-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180813172054.17767-1-ross.burton@intel.com>
References: <20180813172054.17767-1-ross.burton@intel.com>
Subject: [PATCH 3/3] classes: sanity-check LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 13 Aug 2018 17:21:03 -0000

We assume that LIC_FILES_CHKSUM is a file: URI but don't actually verify this,
which can lead to problems if you have a URI that resolves to a path of / as
Bitbake will then dutifully checksum / recursively.

[ YOCTO #12883 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass    | 4 ++--
 meta/classes/license.bbclass | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 1a359a04b78..df11c8b270e 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -100,8 +100,8 @@ def get_lic_checksum_file_list(d):
         # We only care about items that are absolute paths since
         # any others should be covered by SRC_URI.
         try:
-            path = bb.fetch.decodeurl(url)[2]
-            if not path:
+            (method, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+            if method != "file" or not path:
                 raise bb.fetch.MalformedUrl(url)
 
             if path[0] == '/':
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 2ac15a1bc89..4cf7f074fc2 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -205,7 +205,9 @@ def find_license_files(d):
 
     for url in lic_files.split():
         try:
-            (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+            (method, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
+            if method != "file" or not path:
+                raise bb.fetch.MalformedUrl()
         except bb.fetch.MalformedUrl:
             bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF'), url))
         # We want the license filename and path
-- 
2.11.0


