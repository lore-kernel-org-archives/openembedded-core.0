Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f169.google.com (mail-it1-f169.google.com
	[209.85.166.169])
	by mail.openembedded.org (Postfix) with ESMTP id B81057D710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 14:07:10 +0000 (UTC)
Received: by mail-it1-f169.google.com with SMTP id q14so18133382itk.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2019 07:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MvsHdD/Cuar1MXEC4fJkX32CpOESMwXcRislMryyzqU=;
	b=PHfxoJU8T+o3dBBjcA7A5nzOWip1ib74esNqoqTnyslHu5vwrRy9Ap2813L/yA9dL2
	extBQUApL89aRSmwKx9M9g5IyV87x4KGwBVu3kmpjYA6JRWTMpaZ05tm/78bBYsXvpn1
	hCP2VEDQ46GPO/k1UmW/xH8ITOLyqgHyY3KavK2GJDf94IAkKmDg64ecMdPIq1nhR5+Y
	fryOsfMWNzkbh3biUvx06KCJf6IbDumkUgXTe9U1rCTt0JnXI8zqMlQQNBBqihqQ9w/w
	nrvIWW283dTkIiNHxiRhBGm+t+j5LFgQuq4e16lJoxDG6ecaABKYVaoBMQwiTjU1BQDn
	rtkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=MvsHdD/Cuar1MXEC4fJkX32CpOESMwXcRislMryyzqU=;
	b=cak7RQuvbiWfyYoHG+2cx66eHhJVLuoZspfZiq/YSaRy0MdVGQRQQCehE+PDTA4+ea
	tgH08wdjP0PTYHpQUxD510AFz0M1ChU4BpF0V4wQU5GdRh4T9RsXIojz5vA0QJfB4WOQ
	7A3mzb/QNjQCjLTB938uIcgouRrmy0GP83NSwFqyh4qZVPEGbOqwk9hQ6hg2JSLM+FSF
	l8xDg5EKIiyidSZEnEgn1f9lg1LULjtrb2vl6vABH613hMkQuINJnVR0vMf0qGEhtMWl
	dqsmy1W1Yjmtb47higootXJ46ssGQL4C8b3VOaQzr4Yzeu9oZJTtkHo3IrVUq4cX+pcv
	0lbA==
X-Gm-Message-State: APjAAAXXg5oIKqCqgTiyfyAqHtfHdl5IvzDCDIGqDvmb5VoIWDz2c3Jj
	WFugUsiO4806POu0Nzc0ADqDcoXo5Q8=
X-Google-Smtp-Source: APXvYqy5WfRhIojJ8Ok2BDnA0bLAyHohW11Ta2ck13+vnemGKfkmd3nDVTFW5Yu2BwvyuNzjFQ4RFw==
X-Received: by 2002:a05:660c:b48:: with SMTP id
	m8mr8348998itl.135.1555423631423; 
	Tue, 16 Apr 2019 07:07:11 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	f132sm20131362ioa.76.2019.04.16.07.07.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Apr 2019 07:07:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2019 09:07:02 -0500
Message-Id: <20190416140702.13771-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] classes/waf: Set WAFLOCK
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
X-List-Received-Date: Tue, 16 Apr 2019 14:07:10 -0000
Content-Transfer-Encoding: 8bit

Sets the WAFLOCK environment variable. This controls the name of the
lock file that waf uses to pass the build configuration from 'configure'
to 'build' and 'install'. Using a uniquely generated name based on the
parameters passed to 'configure' ensures that the source directory can
be configured for multiple different builds without conflicting (since
the lock file is stored in ${S})

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/waf.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 8e6d754c299..900244004ec 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -5,6 +5,32 @@ B = "${WORKDIR}/build"
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
+def waflock_hash(d):
+    # Calculates the hash used for the waf lock file. This should include
+    # all of the user controllable inputs passed to waf configure. Note
+    # that the full paths for ${B} and ${S} are used; this is OK and desired
+    # because a change to either of these should create a unique lock file
+    # to prevent collisions.
+    import hashlib
+    h = hashlib.sha512()
+    def update(name):
+        val = d.getVar(name)
+        if val is not None:
+            h.update(val.encode('utf-8'))
+    update('S')
+    update('B')
+    update('prefix')
+    update('EXTRA_OECONF')
+    return h.hexdigest()
+
+# Use WAFLOCK to specify a separate lock file. The build is already
+# sufficiently isolated by setting the output directory, this ensures that
+# bitbake won't step on toes of any other configured context in the source
+# directory (e.g. if the source is coming from externalsrc and was previously
+# configured elsewhere).
+export WAFLOCK = ".lock-waf_oe_${@waflock_hash(d)}_build"
+BB_HASHBASE_WHITELIST += "WAFLOCK"
+
 python waf_preconfigure() {
     import subprocess
     from distutils.version import StrictVersion
-- 
2.20.1


