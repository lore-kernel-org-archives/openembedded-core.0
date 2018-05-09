Return-Path: <jon.szymaniak.foss@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id ABFB2750DF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:46:59 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id q72-v6so781886itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=cX3hqooxlDWyKdYsYZwZpqeK70knDZgRx0hEJq/83D0=;
	b=SWzhPiIdei6boJZ9tTXTMpU0+C1EcfUCsq8lOnPqVgSXsFlPjed9Ll3uwWehrZDgV9
	5DEnViLnJkHV1FA5FeKISZByteXZqoHA7bfqkTWZmTXrwDVop+/gPJlr71L7ko7bzHsH
	0M5zxw5KjAU3vyrogPBRkJ/sVtTiTcAHOoFH9zJtOR7AN2QF5kYQtiwCABKSTuEnNMJ/
	GJq8uT0muVrHMDdBwHuzo0EMsuVDgt9bBbzZTEb8lxnYVbHw4U4F/bmaL37M4ILN+vXv
	XWmz3t4/sQTQ+HQ60LhR2TdzfiVfWIEzHuPbWfLWJ/6A/JA6vfA/fV7hEfpw5D9wGb1s
	VAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cX3hqooxlDWyKdYsYZwZpqeK70knDZgRx0hEJq/83D0=;
	b=AL7ezW/b4bI8Bq18Yh0AoYOlugUcCCz2Dexa2JrQzu8zUrpdS6wjzFMfSf5+ZZDBym
	fHIzesM2ZzEITwJUln/x+Xj6R/5EysnnUv9xvbaHdhObspnOLUXSdDly5kptqP2q1E6D
	7vXfI86sQufwbnt1xSA4xegw9p9Ud6dvapLS3GD8VoyPZnVBXm24MLlkX34zFRmtig+h
	cTO+KgvX1LqzQMFIvVMsyLt1CDOBaOXK5GQ6THq14H9xXp3Z1gEJFXzWPDpAFx6bMDd3
	QMLE5Lx/YLgqFUeZyopK0B76elWVoYDbCgERwPX22W+SbOMVtaxYu3n4OeqjXTAteSl3
	wmFA==
X-Gm-Message-State: ALKqPweiskzxhpykEj2JdgCDWpHTjTUgspm5LU0ppaujmWdq1ocII4Lc
	jND0UMUoU5zubhSFkpgWeZk3l7KL
X-Google-Smtp-Source: AB8JxZqBToHhLb1JLkRanl4HcNIY8EGLuBZuPE1gD0xyVWOBBWvtneYNrqo9Dr5f9fjGqqANz03KEQ==
X-Received: by 2002:a24:6806:: with SMTP id
	v6-v6mr12212647itb.139.1525902420508; 
	Wed, 09 May 2018 14:47:00 -0700 (PDT)
Received: from localhost.localdomain ([199.15.128.78])
	by smtp.gmail.com with ESMTPSA id
	s10-v6sm12533292ioc.84.2018.05.09.14.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 14:47:00 -0700 (PDT)
From: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 16:45:10 -0500
Message-Id: <20180509214510.2210-1-jon.szymaniak.foss@gmail.com>
X-Mailer: git-send-email 2.14.1
Cc: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
Subject: [PATCH] cve-check.bbclass: detect CVE IDs listed on multiple lines
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
X-List-Received-Date: Wed, 09 May 2018 21:46:59 -0000

Some backported patches fix multiple CVEs and list the corresponding
identifiers on multiple lines, rather than on a single line.

cve-check.bbclass yields false positive warnings when CVE IDs are
presented on multiple lines because re.search() returns only
the first match.

An example of this behavior may be found when running do_cve_check() on
the wpa-supplicant recipe while in the rocko branch. Only CVE-2017-13077
is reported to be patched by commit de57fd8, despite the patch including
fixes for a total of 9 CVEs.

This is resolved by iterating over all regular expression matches,
rather than just the first.

Signed-off-by: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
---
 meta/classes/cve-check.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index bc2f03f7dd..86e6a0ae90 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -146,15 +146,17 @@ def get_patches_cves(d):
                 with open(patch_file, "r", encoding="iso8859-1") as f:
                     patch_text = f.read()
 
-        # Search for the "CVE: " line
-        match = cve_match.search(patch_text)
-        if match:
+        # Search for one or more "CVE: " lines
+        text_match = False
+        for match in cve_match.finditer(patch_text):
             # Get only the CVEs without the "CVE: " tag
             cves = patch_text[match.start()+5:match.end()]
             for cve in cves.split():
                 bb.debug(2, "Patch %s solves %s" % (patch_file, cve))
                 patched_cves.add(cve)
-        elif not fname_match:
+                text_match = True
+
+        if not fname_match and not text_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
 
     return patched_cves
-- 
2.14.1


