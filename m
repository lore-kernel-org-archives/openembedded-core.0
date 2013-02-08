Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3nE3-0000wX-4Z
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:38:43 +0100
Received: by mail-gh0-f175.google.com with SMTP id g18so834468ghb.34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=pZyniiIFJ01eRNiX6w24pFzEGcRir8VlZt0+cim5JdY=;
	b=lPnQFk3MMyZ0Wt8JtPv2PYcSYcHMNYSdKMTJiev/FpFH0OcmNW0wxceJ4xcQcTXetA
	yC180pXWoFICC4GzHLpdnVT8YdxLbUdVYWan7xMr8AzOfVUqkGdXLfWvM4MMZbMOYWda
	7EaPqV64q8OSEDYjSjYcl3OstGo0+zKN+b8GAtmmEm/n4hYAum91mmvBUipe5ddDE2FT
	FbmXkEPY/37ZuU/RZoWnlo8SLB5I6Xz82pJ+LOX8cTDAL4bdJXPc3BY3tptwx2KEG9O3
	WMBpeLJr8q7KU6wjc8iEJXwrXisgbKcV/odKp2CNyPGkr4MEtW4XyEk4szKhxqYexVb0
	EHYg==
X-Received: by 10.100.84.3 with SMTP id h3mr1648236anb.32.1360326169095;
	Fri, 08 Feb 2013 04:22:49 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id s3sm52308661yhm.10.2013.02.08.04.22.46
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 04:22:48 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 10:22:39 -0200
Message-Id: <1360326160-8310-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 1/2] tzdata: We shouldn't override the localtime if it is valid
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
X-List-Received-Date: Fri, 08 Feb 2013 12:38:44 -0000

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



