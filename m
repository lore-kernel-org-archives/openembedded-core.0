Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB8071DCC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:02:42 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so22993249wma.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 01:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=nLyenC37ngnqxVsgjbX8RdTVxfG0RQ/1hGg+33qmXuo=;
	b=KkUgIRbn2zutBEnt+/IVLpw54XshfIwQ/YRwH0+YNldF8J7G4y7XOiCl46Hd7DL0mJ
	RfBCnOWq7k7qAI6v5XUcHen4i9FNJMVAGjwdoul8wmEfvDvGHFbXtfZyMCxNtvZkhCtP
	ZPfMGuWPfRI7xXb9kb0W6zHegO0C0TNgPdlCuX8FHimY/q+lESzCyaQyP5hzAYpwyaa3
	GV3B9OiQbFHRGCB+FVhY/u+CHW2qovKSrsT1va5T3kLgpg0T22pvbmqlnc+VicHLIsup
	bitcLyAeggyQklLnArhNBKuqcTiM4guEnQnKFu+fkXfHoEH5fn3SInxiuhRdMVv3tO1D
	v8Og==
X-Gm-Message-State: AIkVDXIvGy3szanslk0ipNaNoRX6fxji6x7bC6/Ilrw5BERHWVhQS8IrUEut+xipAssC6Q==
X-Received: by 10.28.98.130 with SMTP id w124mr937681wmb.125.1482224562970;
	Tue, 20 Dec 2016 01:02:42 -0800 (PST)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	ia7sm24419804wjb.23.2016.12.20.01.02.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 01:02:41 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Dec 2016 09:02:40 +0000
Message-Id: <20161220090240.23555-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] initscripts: populate-volatile: suppress read-only-rootfs warnings
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
X-List-Received-Date: Tue, 20 Dec 2016 09:02:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

rm: can't remove '/etc/resolv.conf': Read-only file system
ln: /etc/resolv.conf: File exists

/etc/default/volatiles contains an entry:
l root root 0644 /etc/resolv.conf /var/run/resolv.conf

which causes populate-volatile.sh to execute the following in link_file():
  if [ -L \"$2\" ]; then
    [ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
  elif [ -d \"$2\" ]; then
    ...

At the time the image is created, /etc/resolv.conf is already a
symlink to /var/run/resolv.conf, but at boot time when
populate-volatiles.sh is run, /var/run/resolv.conf doesn't
exist, causing it to try to rm -f and ln -sf which of course
fails due to the read-only filesystem.

[YOCTO #10814]

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
index ce4622a5e5..74e1e6e17c 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
@@ -70,7 +70,7 @@ mk_dir() {
 link_file() {
 	EXEC="
 	if [ -L \"$2\" ]; then
-		[ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
+		[ \"\$(readlink -f \"$2\")\" != \"$1\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
 	elif [ -d \"$2\" ]; then
 		if awk '\$2 == \"$2\" {exit 1}' /proc/mounts; then
 			cp -a $2/* $1 2>/dev/null;
-- 
2.11.0


