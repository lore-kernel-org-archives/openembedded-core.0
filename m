Received: from mail-yh0-f53.google.com ([209.85.213.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U3nE5-0000wc-DJ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:38:45 +0100
Received: by mail-yh0-f53.google.com with SMTP id q3so416482yhf.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=of19jj5ToAt8cmWcIrRkNuAF7ZiIHwrnvzZ25EnAbj4=;
	b=d8Jt39v/F82bJB9RexP6gd4BBAFRB8ZQjt9HVwZxx36Uuw3PbaWs1RATdoq/Fyoif+
	0PK3raD0P1Hng1w1V+QXnU7GEbeYUL8FPCqb+kYW695xDFK2rkw3GFsF7lWNTk/LKNWX
	2F3eLNdH8LWz6JzIdbL12Ulqh21T/9Xzdd8Iutj6SHoKHtTyvdC65KdgEFzOS/8Ymtjl
	u7wEntHSe9El0T0Ypqh7rtcRxWbXLpYvK99pFTsZpTEbGsAeJSD/h4GgZFmEMigU1KXO
	rSTjAqB8IeUo624TKgyUV+3xBKxqkAqWOF9q8A6Du4ZWdmuvyXFsJbmUFsIwvWPYQHEI
	cmVQ==
X-Received: by 10.236.57.10 with SMTP id n10mr5941715yhc.50.1360326171382;
	Fri, 08 Feb 2013 04:22:51 -0800 (PST)
Received: from localhost.localdomain ([187.23.144.59])
	by mx.google.com with ESMTPS id s3sm52308661yhm.10.2013.02.08.04.22.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 08 Feb 2013 04:22:50 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 10:22:40 -0200
Message-Id: <1360326160-8310-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1360326160-8310-1-git-send-email-otavio@ossystems.com.br>
References: <1360326160-8310-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] tzdata: Simplify code removing not used cases
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
X-List-Received-Date: Fri, 08 Feb 2013 12:38:45 -0000

We shouldn't have an use-case where we'd use 'FUBAR' timezone so
instead of adding postinst handling for this use case we handle it at
install time and keep the Universal as fallback if user did something
wrong.

Change-Id: I9a4f05db7a0bdc06511deb5693d1d16569d2fc63
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/tzdata/tzdata_2012d.bb |   36 ++++++-------------------
 1 files changed, 9 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata_2012d.bb b/meta/recipes-extended/tzdata/tzdata_2012d.bb
index 9ec6715..4811072 100644
--- a/meta/recipes-extended/tzdata/tzdata_2012d.bb
+++ b/meta/recipes-extended/tzdata/tzdata_2012d.bb
@@ -47,48 +47,30 @@ do_install () {
         cp -pP "${S}/iso3166.tab" ${D}${datadir}/zoneinfo
 
         # Install default timezone
-        install -d ${D}${sysconfdir}
-        echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
-        ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
+        if [ -e ${D}${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ]; then
+            install -d ${D}${sysconfdir}
+            echo ${DEFAULT_TIMEZONE} > ${D}${sysconfdir}/timezone
+            ln -s ${datadir}/zoneinfo/${DEFAULT_TIMEZONE} ${D}${sysconfdir}/localtime
+        else
+            bberror "DEFAULT_TIMEZONE is set to an invalid value."
+            exit 1
+        fi
 
         chown -R root:root ${D}
 }
 
 pkg_postinst_${PN} () {
-
-# code taken from Gentoo's tzdata ebuild
-
 	etc_lt="$D${sysconfdir}/localtime"
 	src="$D${sysconfdir}/timezone"
 
 	if [ -e ${src} ] ; then
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
-	else
-		tz="FUBAR"
 	fi
 	
 	if [ -z ${tz} ] ; then
 		return 0
 	fi
 	
-	if [ ${tz} = "FUBAR" ] ; then
-		echo "You do not have TIMEZONE set in ${src}."
-
-		if [ ! -e ${etc_lt} ] ; then
-			# if /etc/localtime is a symlink somewhere, assume they
-			# know what they're doing and they're managing it themselves
-			if [ ! -L ${etc_lt} ] ; then
-				cp -f "$D${datadir}/zoneinfo/Universal" "${etc_lt}"
-				echo "Setting ${etc_lt} to Universal."
-			else
-				echo "Assuming your ${etc_lt} symlink is what you want; skipping update."
-			fi
-		else
-			echo "Skipping auto-update of ${etc_lt}."
-		fi
-		return 0
-	fi
-
 	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
 		echo "You have an invalid TIMEZONE setting in ${src}"
 		echo "Your ${etc_lt} has been reset to Universal; enjoy!"
@@ -97,7 +79,7 @@ pkg_postinst_${PN} () {
 		if [ -L ${etc_lt} ] ; then
 			rm -f "${etc_lt}"
 		fi
-		cp -f "$D${datadir}/zoneinfo/${tz}" "${etc_lt}"
+		ln -s "${datadir}/zoneinfo/${tz}" "${etc_lt}"
 	fi
 }
 
-- 
1.7.2.5



