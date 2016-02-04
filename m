Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2BF60588
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 14:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14EntnI028698 for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 14:49:55 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id D4YK_Qnf0fiO
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 14:49:55 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u14EnobU028692
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Feb 2016 14:49:51 GMT
Message-ID: <1454597390.27087.240.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Feb 2016 14:49:50 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] lttng-tools: Fix ptest installed la files
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
X-List-Received-Date: Thu, 04 Feb 2016 14:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The ptest .la files are just getting copied into new directories, we need
to relocate them and update the paths within.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index e68e7f3..2631203 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -69,6 +69,11 @@ do_install_ptest () {
 		  -i $i
 	done
 
+	# Update libdir references in copied .la files
+	for i in `find ${D}${PTEST_PATH} -type f -name *.la`; do
+		sed -i -e 's#${S}/tests/#${STAGING_DIR}${PTEST_PATH}#g' $i
+	done
+
 	sed -e "s:src/bin:bin:g" -e "s:lt-::g" \
 	-i ${D}${PTEST_PATH}/tests/utils/utils.sh
 	sed -e "s:ini_config:\.libs\/ini_config:" \



