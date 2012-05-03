Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SPzjT-0002W5-P9
	for openembedded-core@openembedded.org; Thu, 03 May 2012 19:22:23 +0200
Received: by wera1 with SMTP id a1so1410680wer.6
	for <openembedded-core@openembedded.org>;
	Thu, 03 May 2012 10:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=S/B86i+ILfUZsFJ8Glf9wNGZP8+UQVpDhR9/oWpcgow=;
	b=r9S2tE0v5+SrQNO9hp/JqLM6yMRMl9hDkIQ8eZkzUbLR0atbAR5A0d8Mb3czdnXwiP
	lwbKUlphnC2jhRWSJKlT5E+JHwXyKONcIJTTMf5ncqKUexJwKmjhfJUA96UH1ZtzfDSv
	lk8rbyIKkJlwST1wJ00AVjkgtbCH16V6lgzOQhZHv7eTElK6NbmOy/DbH0oZ/stNxVPb
	Y8E4RHo5MS7u5o51twhQELJbrADncyvFqjugY7yxz1UyD8FodXk48t406GQ1LGmoTWWc
	D8MPlc0SjwguwC/3uck334Sta5XENRCTT534KWsXH6vAdOcgYzVJonvrpkAypM/yohzW
	BwAg==
Received: by 10.180.94.7 with SMTP id cy7mr5935616wib.3.1336065158332;
	Thu, 03 May 2012 10:12:38 -0700 (PDT)
Received: from s42.loc (85-127-86-115.dynamic.xdsl-line.inode.at.
	[85.127.86.115])
	by mx.google.com with ESMTPS id w10sm5063183wiy.3.2012.05.03.10.12.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 10:12:36 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.77)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SPzZz-0002Dw-Hr; Thu, 03 May 2012 19:12:35 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu,  3 May 2012 19:12:31 +0200
Message-Id: <1336065154-8513-3-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.9.1
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 3/6] runqemu: simplify process_filename()
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
X-List-Received-Date: Thu, 03 May 2012 17:22:23 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/runqemu |   47 +++++++++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 18fd691..dfa7f4b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -62,28 +62,31 @@ process_filename() {
 
     # Extract the filename extension
     EXT=`echo $filename | awk -F . '{ print \$NF }'`
-    # A file ending in .bin is a kernel
-    if [ "x$EXT" = "xbin" ]; then
-        if [ -z "$KERNEL" ]; then
-            KERNEL=$filename
-        else
-            echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
-            usage
-        fi
-    elif [ "x$EXT" = "xext2" -o "x$EXT" = "xext3" -o \
-            "x$EXT" = "xjffs2" -o "x$EXT" = "xbtrfs" ]; then
-        # A file ending in a supportted fs type is a rootfs image
-        if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
-            FSTYPE=$EXT
-            ROOTFS=$filename
-        else
-            echo "Error: conflicting FSTYPE types [$FSTYPE] and [$EXT]"
-            usage
-        fi
-    else
-       echo "Error: unknown file arg [$filename]"
-       usage
-    fi
+    case /$EXT/ in
+	/bin/)
+		# A file ending in .bin is a kernel
+		if [ -z "$KERNEL" ]; then
+		    KERNEL=$filename
+		else
+		    echo "Error: conflicting KERNEL args [$KERNEL] and [$filename]"
+		    usage
+		fi
+		;;
+	/ext[234]/|/jffs2/|/btrfs/)
+		# A file ending in a supportted fs type is a rootfs image
+		if [ -z "$FSTYPE" -o "$FSTYPE" = "$EXT" ]; then
+		    FSTYPE=$EXT
+		    ROOTFS=$filename
+		else
+		    echo "Error: conflicting FSTYPE types [$FSTYPE] and [$EXT]"
+		    usage
+		fi
+		;;
+	*)
+		echo "Error: unknown file arg [$filename]"
+		usage
+		;;
+    esac
 }
 
 # Parse command line args without requiring specific ordering. It's a
-- 
1.7.10



