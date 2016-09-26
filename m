Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id DAA8D607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 09:55:23 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id n143so69946020ita.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 02:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gaanRTKmmwfl7AufaIM7KhE03dBelsQd5fmniaBXXU=;
	b=NARCsE9iGimcCCeUxarh98VaccbG4IiSh4TfMRSJxWSe13Bl+0pH+LHuS7CwfSBdo3
	F6TYUc2sb7ZqTIkLC60OAzYrizinVB0oaGNrF2KUSuQeiIpvQDlt/e42GsBrqAUU9h1C
	fwkgnSVJ1wMNQn8AecEFxqKg/s449krfp5S1nSzrkRVJoA++ZVqegcht9ki/OOvBbRW1
	oxHtTw+IF4jIUQl2hcLxKILeTzWpraDjMu9LdO5JriTiEr8rYkW8xGvRv+AidwAtJruO
	TUvAclWjZOc131FSRKVqJ1Kdxez7mKo/4q4qGf51fd2k1fQmA72so94RMc0DCAp8oESt
	zVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6gaanRTKmmwfl7AufaIM7KhE03dBelsQd5fmniaBXXU=;
	b=ON/s52YHFUdSrhJq7Xb2sFyv3/YFyvaByxzhNk3rLPUt7RCFWGwLnSdNOj6BPFPGkm
	9P5hq3DZFWJINt/qzTOk55XO6c6JJ3yn5UHHUQ5NhdWQjTFqimDCDYnFIr0+9xmjd0up
	KloeHQTymopLtiIeH0z1Am4xNIfzCkTGLcvrFI59KbuC0zIJia1aO/eE1+9AGSbiS/QJ
	QOyFqkIvhc9Mqy7Z8LMSUA6g2mAmK7iphgI6QLeBD/836MkaPTs+vaB8GXJtMQDHPYDC
	WyLOMi9fr0G98IoErCGzIaU4+799ryRcO3QkS8BaZJqo0ZrsVwJKA2/hyy+PY4/cYhqx
	wydw==
X-Gm-Message-State: AA6/9RnpAxTRD3SMsbBBw1ek0AO0ypVbOb20aC524npk2gDWcp464eqW7nrtO4Re711suOEh
X-Received: by 10.36.120.197 with SMTP id p188mr16702491itc.44.1474883724687; 
	Mon, 26 Sep 2016 02:55:24 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8EA4A.dip0.t-ipconnect.de.
	[93.232.234.74])
	by smtp.gmail.com with ESMTPSA id u62sm7984577iod.6.2016.09.26.02.55.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 02:55:23 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Sep 2016 11:55:15 +0200
Message-Id: <28afdfb29b4b8f7da3b48ca1829041a575bfa96b.1474882990.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1474882990.git.patrick.ohly@intel.com>
References: <cover.1474882990.git.patrick.ohly@intel.com>
Cc: philippe.coval@osg.samsung.com
Subject: [PATCH 1/2] archiver.bbclass: ignore unpack sub-directories in do_ar_original
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
X-List-Received-Date: Mon, 26 Sep 2016 09:55:24 -0000

Support for absolute paths in the "subdir" parameter was recently
added (bitbake rev: c3873346c6fa). The git fetcher has supported
absolute paths in "destsuffix" already before.

When the path is absolute as in destsuffix=${S}/foobar, the tmpdir
used by do_ar_original gets ignored, which breaks:
- source code archiving (tmpdir is empty)
- compilation due to race conditions (for example, ${S} getting
  modified by do_ar_original while do_compile runs)

To solve this, these parameters get removed from URLs before
instantiating the fetcher for them.

This is done unconditionally also for relative paths, because these
paths are not useful when archiving the original source (upstream
source does not have them, they only get used by the recipe during
compilation).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 2f3b278..5f9c91d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -132,7 +132,25 @@ python do_ar_original() {
 
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
     bb.note('Archiving the original source...')
-    fetch = bb.fetch2.Fetch([], d)
+    urls = d.getVar("SRC_URI", True).split()
+    # destsuffix (git fetcher) and subdir (everything else) are allowed to be
+    # absolute paths (for example, destsuffix=${S}/foobar).
+    # That messes with unpacking inside our tmpdir below, because the fetchers
+    # will then unpack in that directory and completely ignore the tmpdir.
+    # That breaks parallel tasks relying on ${S}, like do_compile.
+    #
+    # To solve this, we remove these parameters from all URLs.
+    # We do this even for relative paths because it makes the content of the
+    # archives more useful (no extra paths that are only used during
+    # compilation).
+    for i, url in enumerate(urls):
+        decoded = bb.fetch2.decodeurl(url)
+        for param in ('destsuffix', 'subdir'):
+            if param in decoded[5]:
+                del decoded[5][param]
+        encoded = bb.fetch2.encodeurl(decoded)
+        urls[i] = encoded
+    fetch = bb.fetch2.Fetch(urls, d)
     for url in fetch.urls:
         local = fetch.localpath(url).rstrip("/");
         if os.path.isfile(local):
-- 
2.1.4


