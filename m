Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TENd5-0001pb-BT
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 19:00:03 +0200
Received: by pbcwy7 with SMTP id wy7so2774277pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=0BUMO8WUpyd/2S3tpeGCx0kXvF8l/pEGea0CxrQIhys=;
	b=SBIzncEQxyAk90j4dSgxfMZHMZZY364Gv6eg7Plymiv4DiwrqgQbbjqQd9S3xaTZt3
	ojDqlTIW39xy/Zb7Zmmf8fJBnzCoPzf5Ho1ZKqwI7AQMNYoADgyDUsIn0hTYaM95Al8u
	HRl3eA9Di63ARMlowHX1Mdfi7iDf7MCvqHSVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=0BUMO8WUpyd/2S3tpeGCx0kXvF8l/pEGea0CxrQIhys=;
	b=WjbpUwh7NvVsuR6bxXfZ9RZTjztg99DIt2SqCnodGwTnMrbJ1/prFStEp13nVQ+Luk
	4O/u/1q4JJtAVjY2/P2/WDcmrxBG3qfDMUh13VFpI6yfZ6a62ClHTY0/xlUXPA7x6sR8
	eXN48X4TYjMlJDbMFYPCrckzoK5IV7GY7TbMZRu3vXzqXCnlv4r94HlZryhSJoDQzFBR
	6MLH4feCWbh7WiX6/+FXsmILbcbM9LuhCPShiotV/d4rBtqXZ5SfaBe9XQRutz+3TiKO
	5fF7QSJrLnLUbJAyqjgd2CWiPeh60EBrNfnqsB34KMJ5lqpmzFheN8KzOOYtMPcf7by5
	Yp5g==
Received: by 10.68.195.226 with SMTP id ih2mr9226113pbc.9.1348073241041;
	Wed, 19 Sep 2012 09:47:21 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id jz10sm2115636pbc.8.2012.09.19.09.47.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Sep 2012 09:47:20 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2012 09:47:06 -0700
Message-Id: <1348073226-13002-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQlw11TXBgL77dLAmWPfvr1lfzghkQoPKwcpj70Nw9/0zuQ0toEdczpVkwA2VseRd6AYgoMu
Subject: [PATCH v2] rootfs_rpm: Add Multilib prefix to installed_packages list
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
X-List-Received-Date: Wed, 19 Sep 2012 17:00:03 -0000

RPM does not name it's packages with the Multilib prefix,
but the rootfs_rpm class keeps track of the Multilib prefixs
in a list. Use that list to re-attach the prefix for use with
the license bbclass, buildhistory bbclass will also use this
and make it more accurate between multilib and non-multilib.
Use the embedded "Platform" information to ensure we get all
the correct matching.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |   19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c0207d8..d95ccfa 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -141,12 +141,21 @@ RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 		-D "__dbi_txn create nofsync private"'
 
 list_installed_packages() {
+	GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN} %{Platform}\n]")
+
+	# Use awk to find the multilib prefix and compare it
+	# with the platform RPM thinks it is part of
+	for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
+		GET_LIST=$(echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $0); } $0 !~ prefix {print $0}')
+	done
+
+	# print the info, need to different return counts
 	if [ "$1" = "arch" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]"
-	elif [ "$1" = "file" ] ; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{PACKAGEORIGIN}\n]"
-	else
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME}\n]"
+		echo "$GET_LIST" | awk '{print $1, $2}'
+        elif [ "$1" = "file" ] ; then
+		echo "$GET_LIST" | awk '{print $1, $3}'
+        else
+		echo "$GET_LIST" | awk '{print $1}' 
 	fi
 }
 
-- 
1.7.9.5



