Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TENY1-0001iQ-Rc
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 18:54:50 +0200
Received: by pbcwy7 with SMTP id wy7so2764549pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 09:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=YViBcByxTOOPEeUAoHY4/HZcdgqU/hkaqYJhlke7iFY=;
	b=gHb4hDl6DqfCTlhPgMhtq2i9kYyHg3sYz5++/WKt9yhvolNCi+GNOs6aGWvyUJaZOZ
	DrSREPPkh6OFW1SsF3OECk5xIXBxGgHV/ErsfxlToRhkvDzT6pUIYyGWZ85XotMwCNDy
	RZQYComCrjRYZJDn23javsXxOAkRj3LniYDsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=YViBcByxTOOPEeUAoHY4/HZcdgqU/hkaqYJhlke7iFY=;
	b=jpqFcKbcASWFssEX2UHK0W7g+E9LTUF7rDbjTWMrVnSww2cPRgm8VPlcbXQnli2JeW
	5BKTm4FJsyO+n6J92mpVX0Pxkg9ALUKaHU+8QRohrkPlkEaiobgAYcDZjlrRecZ4mhgd
	DGGtCpxrSFMIHs8wfGEWmwRXW0kkkzAcKVpNxZbZniqaDKyHZCpEpfmb1oxZtMdFDTtl
	s3r9NQlinWcX7Oxyzw4HvMWaL2vmgusHmKdMyubGbAhhSPYdxRJxM5Qu2CwLh9h1jui5
	ROXG1GmM3Agkde42wpgz2EoWuN7H0Ee2I07DMIjQOOTjzQ8FKYpiDBCEDJFHgM/VPVFO
	R37A==
Received: by 10.66.74.195 with SMTP id w3mr8122431pav.64.1348072927748;
	Wed, 19 Sep 2012 09:42:07 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id te6sm2102917pbc.29.2012.09.19.09.42.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 09:42:07 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 09:41:52 -0700
Message-Id: <1348072912-6827-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkbIauoNfRMu86KQE8LlKydnFJ6CQI3zKxYTG6kW+ruEI2+pC1hpYKokz6qICCqvc1ZTjlN
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
X-List-Received-Date: Wed, 19 Sep 2012 16:54:50 -0000

RPM does not name it's packages with the Multilib prefix,
but the rootfs_rpm class keeps track of the Multilib prefixs
in a list. Use that list to re-attach the prefix for use with
the license bbclass, buildhistory bbclass will also use this
and make it more accurate between multilib and non-multilib.
Use the embedded "Platform" information to ensure we get all
the correct matching.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |   48 +++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c0207d8..3ea5eb2 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -140,13 +140,51 @@ remove_packaging_data_files() {
 RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 		-D "__dbi_txn create nofsync private"'
 
-list_installed_packages() {
+Old_list_installed_packages() {
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
+	# Use awk to find the multilib prefix and then
+	# print the info, need to different return counts
+	if [ "x${MULTILIB_PREFIX_LIST}" = "x" ] ; then
+		if [ "x$1" = "x" ] ; then
+			echo "$GET_LIST" | awk '{print $1}' 
+		else
+			echo "$GET_LIST" | awk '{print $1 $2}'
+		fi
 	else
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
+		for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
+			if [ "x$1" = "x" ] ; then
+				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $1); } $0 !~ prefix {print $1}'
+			else
+				echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s %s\n", prefix, $1, $2); } $0 !~ prefix {print $1, $2}'
+			fi
+		done
+	fi
+
+
+}
+
+list_installed_packages() {
+	GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN} %{Platform}\n]")
+
+	# Use awk to find the multilib prefix and compare it
+	# with the platform RPM thinks it is part of
+	for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
+		GET_LIST=$(echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $0); } $0 !~ prefix {print $0}')
+	done
+
+	# print the info, need to different return counts
+	if [ "$1" = "arch" ] ; then
+		echo "$GET_LIST" | awk '{print $1, $2}'
+        elif [ "$1" = "file" ] ; then
+		echo "$GET_LIST" | awk '{print $1, $3}'
+        else
+		echo "$GET_LIST" | awk '{print $1}' 
 	fi
 }
 
-- 
1.7.9.5



