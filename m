Received: from mail-yh0-f41.google.com ([209.85.213.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3pYz-0007S1-GU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:08:37 +0100
Received: by mail-yh0-f41.google.com with SMTP id 47so440463yhr.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=pZyniiIFJ01eRNiX6w24pFzEGcRir8VlZt0+cim5JdY=;
	b=uBUX6vb49zk7naO0sFC+qLeIyYklcWiZzPvOiS5DIUStd9JDf6hDoOsxhlqa7hOvff
	z1sSx2jsacNIPEBFgYIWTaof+RuBf+uDHpJwJpXJusGefJCxTT1B4b6d3XTeCGESVe2J
	foFAi88U8+Ga7aWFC39UoTbjutJKAmJeIls9BQuoiYUnD+PVXxgLjA+ID4dyaDWjd6Tc
	OkDknLm96Z/XJeETyCN9QBEeQZmpu2/CfOPR70uO6UK6qOr+lL3uN0/aSwOdFOY6xilw
	v05cnvyL8QcIvttbARZkOxQ3Y27nA9Hk0uTLidKOBt6nR+Mquyvt5o4lPdSQsbwlTfGT
	hAzg==
X-Received: by 10.101.40.2 with SMTP id s2mr1783483anj.88.1360335155002;
	Fri, 08 Feb 2013 06:52:35 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id w19sm7136954anh.15.2013.02.08.06.52.27
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 06:52:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 12:52:19 -0200
Message-Id: <1360335140-8690-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 1/2] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 15:08:41 -0000

The code where mistakenly replacing the localtime file setting so we
end with a copy of file instead of a symbolic link. This fixes it so
now, we'll only do that in case the link is pointing to invalid data.

Change-Id: I16dfa5ea4f293c48bb396f4e23a2ea53e6c9e745
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/tzdata/tzdata_2012d.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
index 9741101..9ec6715 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -5,7 +5,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a4a29b08234"
 DEPENDS = "tzcode-native"
 
-PR = "r2"
+PR = "r3"
 
 inherit allarch
 
@@ -93,12 +93,12 @@ pkg_postinst_${PN} () {
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
 		tz="Universal"
+		echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
+		if [ -L ${etc_lt} ] ; then
+			rm -f "${etc_lt}"
+		fi
+		cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
 	fi
-	echo "Updating ${etc_lt} with $D${datadir}/zoneinfo/${tz}"
-	if [ -L ${etc_lt} ] ; then
-		rm -f "${etc_lt}"
-	fi
-	cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
 }
 
 # Packages primarily organized by directory with a major city
-- 
1.7.2.5



