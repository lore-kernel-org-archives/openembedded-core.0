Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6A79879CA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 23:58:56 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 29EED1C0037;
	Fri, 14 Dec 2018 12:58:56 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 12:58:53 +1300
Message-Id: <20181213235853.11206-3-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181213235853.11206-1-douglas.royds@taitradio.com>
References: <20181213235853.11206-1-douglas.royds@taitradio.com>
Subject: [PATCH 3/3] acl: reproducibility: copy configure.ac into ${S} at patch-time
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
X-List-Received-Date: Thu, 13 Dec 2018 23:58:57 -0000

Previously, we were unpacking our local configure.ac file directly into ${S} at
unpack time, which meant that the SOURCE_DATE_EPOCH was being set to the local
timestamp of that file.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 6bc77d868d..b10767776d 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=c781d70ed2b4d48995b790403217a249 \
 DEPENDS = "attr"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
-           file://configure.ac;subdir=${BP} \
+           file://configure.ac \
            file://run-ptest \
            file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
            file://test-fix-insufficient-quoting-of.patch \
@@ -25,6 +25,11 @@ SRC_URI[sha256sum] = "179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c787
 
 require ea-acl.inc
 
+copy_configure_ac_file() {
+	cp -v ${WORKDIR}/configure.ac ${S}
+}
+do_patch[prefuncs] += "copy_configure_ac_file"
+
 # avoid RPATH hardcode to staging dir
 do_configure_append() {
 	sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
-- 
2.17.1


