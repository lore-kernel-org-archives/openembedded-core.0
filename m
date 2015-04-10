Return-Path: <jean-benoit.martin@open.eurogiciel.org>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id F2EAF65C98
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 13:15:39 +0000 (UTC)
Received: by wgso17 with SMTP id o17so17446108wgs.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 06:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=open.eurogiciel.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=fdx075DmSXQlPJsWwYT1q4dTboV1m+7NhLDbqYRDpks=;
	b=2VaYYv9WJ2dshMylrbdDzDKghjyuuEwfgvklGsSA/kKvNbWKlq+imPNOVsMOARW+JP
	nV984qRUsyLZVCCz6us81vgYzrzST+7ZA8YcqhfpMyOhQ4px7dExtBbtOFfDCF8OxHPm
	5FA4EfRiI10GPE5giClctdgX03UrO6LcZIW8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fdx075DmSXQlPJsWwYT1q4dTboV1m+7NhLDbqYRDpks=;
	b=d0K/NIXD090uS3kyteul97u3M35K+TErPJDf7rAJpIoSzcZdgP3rVoYE8LN6pFT6I9
	G0AoTb2D1sp32yWpKNaizrHx1uivFaGQXN0bhDwBf6NIodSrdFGC+JZ22Gqxl7LzbtTh
	DiWq9Xm1CV2eegtPnfYlXxH5ubQMQwm0iGGlqtVUCI2Z3c/wtZZWG/b5vqDWCRG4w5MW
	zl2GoG7+sl0HwEGVgUXrUvnRLJTDoz0aavZuCTw26rFVbAJYhcFQpcetwLHxTOyMgAQY
	fb252wi3D9nqoY9IaTL1wtT7cn6u0worjNchjL3oWvtKoLFST0xRUXPn0/7FRFZIMwIl
	p8nw==
X-Gm-Message-State: ALoCoQkIhL1Pv4cem06MZv58yIyw+UdTjQdqDNLDoyoPP/1j/SKb+R6x3My+KTPNmLT2jJo9sfVy
X-Received: by 10.194.91.129 with SMTP id ce1mr3050886wjb.53.1428671740658;
	Fri, 10 Apr 2015 06:15:40 -0700 (PDT)
Received: from linux-kxib.site.eurogiciel.fr (130.167.26.109.rev.sfr.net.
	[109.26.167.130])
	by mx.google.com with ESMTPSA id e18sm2929543wjz.27.2015.04.10.06.15.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Apr 2015 06:15:40 -0700 (PDT)
From: Jean-Benoit MARTIN <jean-benoit.martin@open.eurogiciel.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 15:15:29 +0200
Message-Id: <1428671729-30484-1-git-send-email-jean-benoit.martin@open.eurogiciel.org>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] package_manager: RpmPM: Fix scriptlet for rpm 4
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
X-List-Received-Date: Fri, 10 Apr 2015 13:15:40 -0000

Path of rpm post install script is different between rpm 4 and 5

Signed-off-by: Jean-Benoit MARTIN <jean-benoit.martin@open.eurogiciel.org>
---
 meta/lib/oe/package_manager.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index ed0c9a7..0460415 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -937,8 +937,10 @@ class RpmPM(PackageManager):
         #
         if self.rpm_version == 4:
             scriptletcmd = "$2 $3 $4\n"
+            scriptpath = "$3"
         else:
             scriptletcmd = "$2 $1/$3 $4\n"
+            scriptpath = "$1/$3"
 
         SCRIPTLET_FORMAT = "#!/bin/bash\n" \
             "\n" \
@@ -956,10 +958,10 @@ class RpmPM(PackageManager):
             "    mkdir -p $1/etc/rpm-postinsts\n" \
             "    num=100\n" \
             "    while [ -e $1/etc/rpm-postinsts/${num}-* ]; do num=$((num + 1)); done\n" \
-            "    name=`head -1 $1/$3 | cut -d\' \' -f 2`\n" \
+            "    name=`head -1 " + scriptpath + " | cut -d\' \' -f 2`\n" \
             '    echo "#!$2" > $1/etc/rpm-postinsts/${num}-${name}\n' \
             '    echo "# Arg: $4" >> $1/etc/rpm-postinsts/${num}-${name}\n' \
-            "    cat $1/$3 >> $1/etc/rpm-postinsts/${num}-${name}\n" \
+            "    cat " + scriptpath + " >> $1/etc/rpm-postinsts/${num}-${name}\n" \
             "    chmod +x $1/etc/rpm-postinsts/${num}-${name}\n" \
             "  else\n" \
             '    echo "Error: pre/post remove scriptlet failed"\n' \
-- 
1.8.4.5


