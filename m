Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 988A960B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:33 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so2342764wib.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0oiV23PNRGdpw7bWzTqX67DyC4ZfZigKqVQATNcqh6k=;
	b=vOnJ0SpItuBnbELkpxwg4XEVlAZp3NMJGQrbURCp8kfQcgDRFhDvPqxjEB2lLm2FQN
	NrGHiKwb+41FuEoYPVIUxAg8gBp+GVKVYXCs+4v2NjxPQfQU6B24E/rtugOgm4CEosp+
	QK+xJFGcmCjqzToyRuh8LJZRAr2KtiOwcX+nsFf+ykyP2b4mnLf4ZiZ5HZE4vn7tIQez
	yZvyowfS84wasUE2PqCDNQCNKPiZuEHJFkF2374nn8NoCR4wUdzpP7asQzbK7JpvnwAH
	xYu/ecjoDsOCN91GouGUH36ujegGzEbTkkudHJZqL343CRfSBuEnKN6ZsNQAFwd5Hi7q
	/11Q==
X-Received: by 10.194.189.230 with SMTP id gl6mr3483685wjc.118.1407600454978; 
	Sat, 09 Aug 2014 09:07:34 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	f16sm20438452wic.7.2014.08.09.09.07.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:34 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:07:56 +0200
Message-Id: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/8] test-dependencies, insane.bbclass: improve the message
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/insane.bbclass  | 2 +-
 scripts/test-dependencies.sh | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 55bfaf2..3dd2e7f 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -794,7 +794,7 @@ def package_qa_check_rdepends(pkg, pkgdest, skip, taskdeps, packages, d):
                             break
                 if rdep_data and 'PN' in rdep_data and rdep_data['PN'] in taskdeps:
                     continue
-                error_msg = "%s rdepends on %s but its not a build dependency?" % (pkg, rdepend)
+                error_msg = "%s rdepends on %s, but it isn't a build dependency?" % (pkg, rdepend)
                 sane = package_qa_handle_error("build-deps", error_msg, d)
 
     return sane
diff --git a/scripts/test-dependencies.sh b/scripts/test-dependencies.sh
index ecbb710..2bcc2ca 100755
--- a/scripts/test-dependencies.sh
+++ b/scripts/test-dependencies.sh
@@ -244,9 +244,11 @@ compare_deps() {
     else
       missing_deps=
       for dep in ${max_deps}; do
-        echo "${min_deps}" | grep -q " ${dep} " || missing_deps="${missing_deps} ${dep}"
-        echo # to get rid of dots on last line
-        echo "WARN: ${recipe}: ${package} rdepends on ${dep} but its not a build dependency?" | tee -a ${OUTPUT_FILE}
+        if ! echo "${min_deps}" | grep -q " ${dep} " ; then
+          missing_deps="${missing_deps} ${dep}"
+          echo # to get rid of dots on last line
+          echo "WARN: ${recipe}: ${package} rdepends on ${dep}, but it isn't a build dependency?" | tee -a ${OUTPUT_FILE}
+        fi
       done
       if [ -n "${missing_deps}" ] ; then
         echo ${recipe} >> ${OUTPUTC}/failed-recipes.log
-- 
2.0.4


