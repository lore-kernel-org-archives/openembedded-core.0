Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFj1V-0003Rz-J0
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 11:30:33 +0200
Received: by wibhj13 with SMTP id hj13so1210738wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2012 02:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=DGwn6nGkzuOzsSfqrqyRoCtEu9Jg65BZpEgc/3JEe8o=;
	b=FGC6e+VFUUSF29gPntIKGD9s/zc4yY8LZjEC89ezO+POpxh4MLpUoS4289kMwssFgx
	4tTu8EdnhhMRNGz6YrAK0woxgOrPHeaZLfK/7+CCfeX7VDpc6N9/YNQP93TT1EQFlICr
	wBq8O7/AnyOZpjKqwC6Xd244UaY0f9jpMhu/5WTpQFMlfugTXhnBrcUaihdmM1FgVG4S
	GVEyizdQ60avhHzIjvirVvliqjUZ/7FOPQzFjo3jJvvb44McgSD7UJ56Xq6Jiv9y2CcT
	Q1t+MGyOdEiWFC+d+OO83zdIjfMNacDb/PsAja4oW5OyZpW7D+wKl28hywmd76/DllD7
	D4BA==
Received: by 10.180.24.35 with SMTP id r3mr11185976wif.7.1333617682346;
	Thu, 05 Apr 2012 02:21:22 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n8sm14641399wix.10.2012.04.05.02.21.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Apr 2012 02:21:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 11:21:14 +0200
Message-Id: <1333617674-32640-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.5
Subject: [PATCH] package_ipk: don't generate Packages.filelist
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
X-List-Received-Date: Thu, 05 Apr 2012 09:30:33 -0000

* it works only with 'new' packages and with fixed opkg-utils it will unpack
  *all* packages, because filelist doesn't support 'cache' like Packages does

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/package_ipk.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e4a217b..e7d038f 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -214,7 +214,7 @@ package_update_index_ipk () {
 	for pkgdir in $packagedirs; do
 		if [ -e $pkgdir/ ]; then
 			touch $pkgdir/Packages
-			flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages -p $pkgdir/Packages -l $pkgdir/Packages.filelist -m $pkgdir/"
+			flock $pkgdir/Packages.flock -c "opkg-make-index -r $pkgdir/Packages -p $pkgdir/Packages -m $pkgdir/"
 		fi
 	done
 }
-- 
1.7.8.5



