Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TE3Wj-0000eR-9v
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 21:32:09 +0200
Received: by pbcwy7 with SMTP id wy7so611584pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=W7disZBiOQ54RbeBlJFM8cjDekaPFawhvAAg+5l2yhs=;
	b=dOwyvzWwv7uhyOrJl1z8KScr//hZIHGnbjct0YRj1IFoBtTtEDb58RCOd1C81Mvezo
	r6TlK1OOkaBHqhcnZk/x1f5q5wzEY787q2jjodC1wX0RONDHggIL62qN1jzTlY5MYtzg
	u5KfNP0nv4wSxV3G93cpxg+4WbpBshxucsGf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=W7disZBiOQ54RbeBlJFM8cjDekaPFawhvAAg+5l2yhs=;
	b=AafR7F0LHyP8svqbthp69GBdsD5C3UqJ3GBkRJwKU1IYGIh48wYQVAH4YwMG6kVYsd
	ElZktx9Ve09P1WKbgR0U2DFWmRvYO6FbuOeNH6XDzcIhZzbXimAeRzk8kJM7NTXTZlGz
	VAVErsjF3hdhhoywI1ndcmQxJ1uAqzruldQZrcPebuPmH5tW07X6xKD6U5W9GqQRH5kE
	5Amvc1N9kbBefPKOG4hbh5MnLfyBIUOMxTGtYwbPFoP1uHdEGFXkRF4j3fnUmYf/R9FE
	lGkBtxWKmzjW/fTxmVXWt6vyf5dwvy8tbGA7lKXoktBDUD3smafH1cb6DXsVCB9Zaenb
	ZTSQ==
Received: by 10.66.90.38 with SMTP id bt6mr1151295pab.53.1347995968262;
	Tue, 18 Sep 2012 12:19:28 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id pi1sm426351pbb.7.2012.09.18.12.19.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 12:19:27 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 12:19:13 -0700
Message-Id: <1347995954-1200-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQns7cKdxARvKmpHqr40wS/F5mkGFTZrh/lSkAS2VlOLgBEkR1l8ttds43q34RkhaU7c56b2
Subject: [PATCH] rootfs_rpm: Add Multilib prefix to installed_packages list
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
X-List-Received-Date: Tue, 18 Sep 2012 19:32:09 -0000

RPM does not name it's packages with the Multilib prefix,
but the rootfs_rpm class keeps track of the Multilib prefixs
in a list. Use that list to re-attach the prefix for use with
the license bbclass, buildhistory bbclass will also use this
and make it more accurate between multilib and non-multilib.
Use the embedded "Platform" information to ensure we get all
the correct matching.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |   23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c0207d8..a93b3ec 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -142,12 +142,27 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 
 list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
-	elif [ "$1" = "file" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{Platform}\n]")
+        elif [ "$1" = "file" ] ; then
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN} %{Platform}\n]")
+        else
+		GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{Platform}\n]")
+	fi
+	if [ "x${MULTILIB_PREFIX_LIST}" = "x" ] ; then
+		echo "$GET_LIST"
 	else
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
+		for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
+			# Use awk to find the multilib prefix and then
+			# print the info, need to different return counts
+			if [ "x$1" = "x" ] ; then
+				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $1); } $0 !~ prefix {print $1}'
+			else
+				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s %s\n", prefix, $1, $2); } $0 !~ prefix {print $1, $2}'
+			fi
+		done
 	fi
+
+
 }
 
 rootfs_list_installed_depends() {
-- 
1.7.9.5



