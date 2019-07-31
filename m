Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62A827F4CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 17:42:59 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z1so70594377wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=r3NSolor5iemzaZRkVR01KGwwKyfROi3A+v/46OBOF0=;
	b=PTMQR7TIAukMBdWKIWA703GfBdEosmcth/ZclagbI+R2fnhDEqeKI7FzxyB447u/qQ
	onsr6uKxHKATSMNowKZErm6O5WgPNDdHGmZYbz44pjF3uDIR93PUPuKmNq6CEElD/na+
	HHBKgqCxlHKh5UZZv9rlPptIoUUt9k3FmES45dRz88z80IJYFSKdufVaZA7XNzLTNpF3
	3iT8bO9Qxt0x4oaMF5vTxsG4WVZicvJWSH7jsTaA5o87pjcTq5h912AQmgL89L22Gr6I
	xIUASZVuDfS3bO+QHKxxrx56TCZLaF0fCg9FCLhKVhBnF5p+Us0Ez/WGZkb3u+GpkBi6
	eQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r3NSolor5iemzaZRkVR01KGwwKyfROi3A+v/46OBOF0=;
	b=CIECAuaSdmeahsKc6OOibaL0Nuhtzdf1tAvvLqHVoF0RmEkTqkHIOU7IZbEBcIO0Va
	exQ7yowsdzTCOasDcZ4ysxByPbH1gin8EuOI+lEst8yYJkOjDl4IiK7Q79e8MHMbEqIC
	2MKb3B4RK4HfsWxtUT/8eb5CrF7EmR4Dqq/y15Vc+fgxiqYHtUAk/xIQExPIzPmqo753
	JUWehfakkP/ZBOqt97d3Z/3SkYYKLTHH2db3f6x9GdmtaGJ8sv4Ye3hf/7ZnzCjez3q9
	OMsQpWVf87IOi0Cogs6qZ0fACqVVKZrxIg19/XBotPzYX5JRzFq27zO1dgZ2/aYhm87d
	QsqQ==
X-Gm-Message-State: APjAAAV8avUgql5LjE3l0KPyiJTYbnqQ7HaDih3/8/ZKa6A0zHzFRnx7
	X2jE7DDlBk7j7swNsxnHBWO8N0TIZ6g=
X-Google-Smtp-Source: APXvYqy3GVl753vrCSBYEF5YabCgQUzsWOsQmQ+9ok0AHtYOsSSF6pfUG8r2RMg85FhNwCK3T/B9jg==
X-Received: by 2002:adf:ab51:: with SMTP id r17mr109480675wrc.95.1564594979921;
	Wed, 31 Jul 2019 10:42:59 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t63sm62973454wmt.6.2019.07.31.10.42.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 10:42:59 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 18:42:53 +0100
Message-Id: <20190731174254.11340-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731174254.11340-1-ross.burton@intel.com>
References: <20190731174254.11340-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] python3: support recommends in manifest
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
X-List-Received-Date: Wed, 31 Jul 2019 17:42:59 -0000
Content-Transfer-Encoding: 8bit

Add support for runtime recommends along with runtime depends to the manifest.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3_3.7.4.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index a63abfd6cb2..59d70249880 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -229,7 +229,7 @@ python(){
 
     newpackages=[]
     for key in python_manifest:
-        pypackage= pn + '-' + key
+        pypackage = pn + '-' + key
 
         if pypackage not in packages:
             # We need to prepend, otherwise python-misc gets everything
@@ -249,8 +249,14 @@ python(){
         for value in python_manifest[key]['rdepends']:
             # Make it work with or without $PN
             if '${PN}' in value:
-                value=value.split('-')[1]
+                value=value.split('-', 1)[1]
             d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
+
+        for value in python_manifest[key].get('rrecommends', ()):
+            if '${PN}' in value:
+                value=value.split('-', 1)[1]
+            d.appendVar('RRECOMMENDS_' + pypackage, ' ' + pn + '-' + value)
+
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
     # Prepending so to avoid python-misc getting everything
-- 
2.20.1


