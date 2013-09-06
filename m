Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id A66DD615C4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 08:36:41 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id ro12so2939950pbb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2013 01:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=EjrtdA9Ko51iPb0lpvZWdCDPxDT5nXNT+2fWju5LfO8=;
	b=m5myaP5dfswsyjr7YQ4mD0R9nh+RA4gHXq1i7Y9OhzRWUkLK7krt09JeD0iiQv24Rd
	AbGJeft0Wf+s3EYoHoRFcpqSr4O5yadWk3vn+QAV29zOVdm5xH2RmVH5YEoN4d5sOE+N
	lY6R+Y2pzG39fxygh56TmBnN6/123hDPj1m5cE3eA02oLUpkS6CebdcKUNo2V3BnraRl
	iH6OsdBLNyO8t0wBBtqgTNoCF9v6LO3nLNwQ6/cHbmbZ7TT2hCdzOfA/YZ/kR7rw+QRA
	LnniHYsjfqFnYtr4uRoDPUvne9RMFRYzgx5eRad5K9rjFQ6umYksGYikh7W6arj/IZpI
	N+JQ==
X-Received: by 10.68.163.98 with SMTP id yh2mr1663789pbb.62.1378456603501;
	Fri, 06 Sep 2013 01:36:43 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id xe9sm3228248pab.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 06 Sep 2013 01:36:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2013 01:35:23 -0700
Message-Id: <1378456523-16123-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.4
Subject: [PATCH] package.bbclass: skip already-stripped QA test if asked for
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
X-List-Received-Date: Fri, 06 Sep 2013 08:36:43 -0000

Some packages like grub have already stripped binaries e.g.

ERROR: QA Issue: File '/boot/grub/kernel.img' from grub was already
stripped, this will prevent future debugging!
ERROR: QA run found fatal errors. Please consider fixing them.

We would like to have a possibility to skip it using something like

INSANE_SKIP_${PN} = "already-stripped"

This adds the logic to do so

it acts at PN level and not at package level. so something like

INSANE_SKIP_${PN}-misc = "already-stripped" wont work.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 50490bc..96e649a 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -811,8 +811,11 @@ python split_and_strip_files () {
                     elf_file = isELF(file)
                     if elf_file & 1:
                         if elf_file & 2:
-                            msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
-                            package_qa_handle_error("already-stripped", msg, d)
+                            if 'already-stripped' in (d.getVar('INSANE_SKIP_' + pn, True) or "").split():
+                                bb.note("Package %s skipping already-stripped QA test" % (pn))
+                            else:
+                                msg = "File '%s' from %s was already stripped, this will prevent future debugging!" % (file[len(dvar):], pn)
+                                package_qa_handle_error("already-stripped", msg, d)
                             continue
                         # Check if it's a hard link to something else
                         if s.st_nlink > 1:
-- 
1.8.4


