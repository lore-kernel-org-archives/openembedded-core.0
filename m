Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F350773A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 02:42:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u862fwT2020076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Sep 2016 19:41:58 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 5 Sep 2016 19:41:57 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <ross.burton@intel.com>
Date: Tue, 6 Sep 2016 10:39:37 +0800
Message-ID: <1473129577-17238-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH v2] groff: not ship /usr/bin/glilypond
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
X-List-Received-Date: Tue, 06 Sep 2016 02:42:01 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Not ship /usr/bin/glilypond and related files such
as man file /usr/share/man/man1/glilypond.1 and other
three files related to glilypond under
/usr/lib/groff/glilypond in embedded system, it is because:

- Remove the confusion about glilypond fails to run
  because it lacks dependency on File::HomeDir perl
  module

- We don't often have need for sheet music conversion
  in groff in embedded or IoT devices (glilypond
  transforms sheet music written in the lilypond language
  into the groff language using the .PSPIC request, such
  that groff can transform it into a format that can be
  displayed directly).

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.3.bb b/meta/recipes-extended/groff/groff_1.22.3.bb
index af5acbe..dd241f3 100644
--- a/meta/recipes-extended/groff/groff_1.22.3.bb
+++ b/meta/recipes-extended/groff/groff_1.22.3.bb
@@ -62,6 +62,11 @@ do_install_append() {
 	if [ -f ${SPECIAL_AWK} ]; then
 		sed -i -e 's:#!.*awk:#! ${USRBINPATH}/awk:' ${SPECIAL_AWK}
 	fi
+
+	# not ship /usr/bin/glilypond and its releated files in embedded target system
+	rm -rf ${D}${bindir}/glilypond
+	rm -rf ${D}${libdir}/groff/glilypond
+	rm -rf ${D}${mandir}/man1/glilypond*
 }
 
 do_install_append_class-native() {
-- 
2.8.1


