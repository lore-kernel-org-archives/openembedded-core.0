Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACBB784DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 21:08:41 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id r11-v6so2112203pfl.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Tox8UtkDYnLZFen7HRFP943qD6BV6/LLqLgnCS44EUw=;
	b=p9xkYxRfbhqZsVUVplp+kLzcuOE8lib54cAHaBMeD+ef6Id1HH0G82ptxC2fBYuHCO
	e3lS3tJQKSqz4g05gKER9EH3/UVOJiA4TbsuJrtWF9YghLkJ8B4/dAMBrVv6gqnm0al6
	jFjG78hZdM4bqpmDYihXUjphx/fVfIquIdjnkAkvo+6aO9COgnzvLHXPgwsuS4iIko29
	OhYu942cG0gNHjVC7LSk54HZnBSlrWTGK7OAX8iGy0aMXsfki46j/O1gmG1bXuXG4gDb
	XBT/p3j2imz27lnfkOqD3Zp6NvGaILIkodaVjqtFOfW+C+uLtAKvzjRshT/Xa81la8Qt
	YHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Tox8UtkDYnLZFen7HRFP943qD6BV6/LLqLgnCS44EUw=;
	b=q1YrB1sLnRkREJ/tI+aTkK6VdlR4vkFZXcrd5TbiwC71HrCRfM7l7mEpoPjBQDHtyC
	ba/SYSq/jjQ/MWJUHn49DcEcOA/ree74lL64CWdVADCdT2q1YucB7zRbC6xI6bYMr2+e
	bc4u+wRTt9HkREU3Zqt0nunwo6TiqtnjzkyfwDS9RK/mONAik/CXYyw9e0VqisRkn7Cm
	OdK/IqB+bYlqRcJabSRWEVsKbAkBlAVAQ30lOeXMc12A9U0+Gbjq7VLuDBjlR0+DRrXR
	HuSzIRRxU3DbCxRIGUpvKLhgTdnyTe7vVrREQGNbcuoFsXfo4ybhUlj+vvrwLn8yQIwA
	pAqw==
X-Gm-Message-State: APt69E30aS6jd4WnLW92eYWta6EZ9/1FkfaxllZtMl73Tu4EWVaP62Xm
	6GXqISTkKLR0V9Oi0KMURgE1oQUb
X-Google-Smtp-Source: ADUXVKICaxzavRxDlY/EVJlIfRfDKGUHIe8qbpk5t9k5pY456IAtkbQA3Xycv3RkAW/JY8O84c5rcw==
X-Received: by 2002:a63:b505:: with SMTP id
	y5-v6mr24403315pge.213.1529615322005; 
	Thu, 21 Jun 2018 14:08:42 -0700 (PDT)
Received: from svr-pkl-eng-07.mgc.mentorg.com ([110.93.212.98])
	by smtp.gmail.com with ESMTPSA id
	8-v6sm10513508pfk.132.2018.06.21.14.08.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Jun 2018 14:08:40 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jun 2018 02:08:21 +0500
Message-Id: <61dc8ffbd2c1268e13572d36916dbe3d54e51cce.1529603271.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.11.1
In-Reply-To: <cover.1529603271.git.chris_larson@mentor.com>
References: <cover.1529603271.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/5] bbpath-intercepts.bbclass: add class
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
X-List-Received-Date: Thu, 21 Jun 2018 21:08:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This class sets POSTINST_INTERCEPTS and POSTINST_INTERCEPTS_CHECKSUMS,
to allow us to pull intercepts from BBPATH. This is kept as a separate
class, as it's needed by both image construction and sdk construction,
the latter to support meta-toolchain & similar recipes.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/bbpath-intercepts.bbclass | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/classes/bbpath-intercepts.bbclass

diff --git a/meta/classes/bbpath-intercepts.bbclass b/meta/classes/bbpath-intercepts.bbclass
new file mode 100644
index 00000000000..ed30bbd98d9
--- /dev/null
+++ b/meta/classes/bbpath-intercepts.bbclass
@@ -0,0 +1,23 @@
+# Gather existing and candidate postinst intercepts from BBPATH
+POSTINST_INTERCEPTS_DIR ?= "${COREBASE}/scripts/postinst-intercepts"
+POSTINST_INTERCEPTS_PATHS ?= "${@':'.join('%s/postinst-intercepts' % p for p in '${BBPATH}'.split(':'))}:${POSTINST_INTERCEPTS_DIR}"
+
+python find_intercepts() {
+    intercepts = {}
+    search_paths = []
+    paths = d.getVar('POSTINST_INTERCEPTS_PATHS').split(':')
+    overrides = (':' + d.getVar('FILESOVERRIDES')).split(':') + ['']
+    search_paths = [os.path.join(p, op) for p in paths for op in overrides]
+    searched = oe.path.which_wild('*', ':'.join(search_paths), candidates=True)
+    files, chksums = [], []
+    for pathname, candidates in searched:
+        if os.path.isfile(pathname):
+            files.append(pathname)
+            chksums.append('%s:True' % pathname)
+            chksums.extend('%s:False' % c for c in candidates[:-1])
+
+    d.setVar('POSTINST_INTERCEPT_CHECKSUMS', ' '.join(chksums))
+    d.setVar('POSTINST_INTERCEPTS', ' '.join(files))
+}
+find_intercepts[eventmask] += "bb.event.RecipePreFinalise"
+addhandler find_intercepts
-- 
2.11.1


