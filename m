Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YbY-0002FG-Aq
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:25:38 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE67se007221; Wed, 30 Jan 2013 14:06:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jBUVzKz1GgGA; Wed, 30 Jan 2013 14:06:09 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE64bV007191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:06:05 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YE0-00083d-AT; Wed, 30 Jan 2013 14:01:16 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:05 +0000
Message-Id: <13527ddc3ed140aa78ca1e02b3844edd82f39264.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
References: <9a148e6b100fe8bc3e162d79630552df5eb78fc0.1359554291.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
References: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/17] package.bbclass: Tweak PACKAGEFUNCS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 14:25:42 -0000

Move package_rename_hook call into PACKAGEFUNCS and also move package_get_auto_pr
to a more appropriate execution point, grouping package metadata handling
functions together.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package.bbclass |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8bf80f5..2f1695b 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1035,8 +1035,6 @@ python populate_packages () {
             for f in unshipped:
                 msg = msg + "\n  " + f
             package_qa_handle_error("installed_vs_shipped", msg, d)
-
-    bb.build.exec_func("package_name_hook", d)
 }
 populate_packages[dirs] = "${D}"
 
@@ -1841,13 +1839,15 @@ def gen_packagevar(d):
     return " ".join(ret)
 
 PACKAGE_PREPROCESS_FUNCS ?= ""
-PACKAGEFUNCS ?= "package_get_auto_pr \
+PACKAGEFUNCS ?= " \
                 perform_packagecopy \
                 ${PACKAGE_PREPROCESS_FUNCS} \
                 package_do_split_locales \
                 split_and_strip_files \
                 fixup_perms \
                 populate_packages \
+                package_name_hook \
+                package_get_auto_pr \
                 package_fixsymlinks \
                 package_do_filedeps \
                 package_do_shlibs \
-- 
1.7.10.4



