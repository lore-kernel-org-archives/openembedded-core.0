Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 61A336D44A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:05:44 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rADI4xZi005205 for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:05:40 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pT4leiDFgisO
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:05:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rADI5XtA005211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 18:05:35 GMT
Message-ID: <1384365930.6460.99.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Nov 2013 18:05:30 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] staging: Use hardlinking for sysroot_stage_dir
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
X-List-Received-Date: Wed, 13 Nov 2013 18:05:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This saves about 2GB on a core-image-sato build so is worth doing and is
consistent with our efforts to try and decrease our build footprint.

Build time in my local test seemed unaffected but on more IO bound
machines it should help.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index ddba0c9..94abcda 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -7,14 +7,11 @@ sysroot_stage_dir() {
 		 return
 	fi
 
-	# We only want to stage the contents of $src if it's non-empty so first rmdir $src
-	# then if it still exists (rmdir on non-empty dir fails) we can copy its contents
-	rmdir "$src" 2> /dev/null || true
-	# However we always want to stage a $src itself, even if it's empty
 	mkdir -p "$dest"
-	if [ -d "$src" ]; then
-		tar -cf - -C "$src" -p . | tar -xf - -C "$dest"
-	fi
+	( 
+		cd $src
+		find . -print0 | cpio --null -pdlu $dest
+	)
 }
 
 sysroot_stage_stripdir() {



