Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SE6aR-0005py-FK
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Apr 2012 00:15:55 +0200
Received: by wera1 with SMTP id a1so992741wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2012 15:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=KKIrahGnFJueQkIgJ0LZ3W7oWyS9c5a+3hf1xB1HvvA=;
	b=DDX8FY1v0hpsJct3GZqppEi7MXY7jiJt5zYCyAVySBYGC40OxFV3uMqWOKyX+/BI1e
	PanpQIXaINqID6ytoYjQ1Ai294eOOBEqDyoh9HL0iYcq/Vk461q3MP6YdB0AeGa9vh28
	sXl3fOrURgkgf2Qk7AUpC/skFG2vtKXtCjyQZy1RTCcaveG7jOXDdztUW4GXElQuBnew
	wVrK0SEYREPVtuZ6GJREJG+ei4RDyKlU/PvbplxaNbPcDyCa9Ja5ZsmTzlbrhwCgvSrY
	whdnAY7Zkbc/IHpre2lQX0d2M+jXw/kEDJNb7Suv7GUcN3EquQdYpfOQ1Lp0FhBxmHk8
	Xwxg==
Received: by 10.180.102.100 with SMTP id fn4mr9751730wib.1.1333231609242;
	Sat, 31 Mar 2012 15:06:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm31332824wib.8.2012.03.31.15.06.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 31 Mar 2012 15:06:48 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Apr 2012 00:06:42 +0200
Message-Id: <1333231604-24561-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQk5B6uLeBfREFtMQYr34d5EWDpVjom6BHRaGhPuVM8kQEi3LZ2Zl2o2fCWhUnkIrqohpj6x
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/3] buildhistory: remove duplicate entries from dot graph
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Mar 2012 22:15:55 -0000

There are various conditions that lead to duplicate entries in the dot graph which need to get fixed, but this patch is a catchall. A previous attempt to address this only works on rpm which gives a \n seperated output, opkg doesn't.

Another benefit is that the sort order is now know, leading to less spurious diffs in buildhistory commits.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/classes/buildhistory.bbclass |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f99aa7f..386c32c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -300,16 +300,16 @@ buildhistory_get_image_installed() {
 			echo $pkgsize $pkg >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
 		fi
 
-		deps=`list_package_depends $pkg | sort | uniq`
+		deps=`list_package_depends $pkg`
 		for dep in $deps ; do
-			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+			echo "$pkg OPP $dep;" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
 		done
 
-		recs=`list_package_recommends $pkg | sort | uniq`
+		recs=`list_package_recommends $pkg`
 		for rec in $recs ; do
-			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g' >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+			echo "$pkg OPP $rec [style=dotted];" | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' | sed 's:OPP:->:g'
 		done
-	done
+	done | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 
 	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt
-- 
1.7.2.5



