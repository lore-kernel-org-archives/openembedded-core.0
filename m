Return-Path: <azoff@svenskalinuxforeningen.se>
X-Greylist: delayed 445 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 02 Nov 2019 15:50:40 UTC
Received: from ch-p-mailout01.sth.basefarm.net
	(ch-sth2-lb01-mailout-snat1.sth.basefarm.net [164.40.177.83])
	by mail.openembedded.org (Postfix) with ESMTP id A05AC7FC0D
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Nov 2019 15:50:40 +0000 (UTC)
Received: from c83-252-213-239.bredband.comhem.se ([83.252.213.239]:47552
	helo=spamfilter.azoff.se)
	by ch-p-mailout01.sth.basefarm.net with esmtps
	(TLSv1:DHE-RSA-AES256-SHA:256) (Exim 4.84)
	(envelope-from <azoff@svenskalinuxforeningen.se>)
	id 1iQvY8-000S6o-43; Sat, 02 Nov 2019 16:42:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.azoff.se (Postfix) with ESMTP id F272A1C093E;
	Sat,  2 Nov 2019 16:42:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at azoff.se
Received: from spamfilter.azoff.se ([127.0.0.1])
	by localhost (spamfilter.azoff.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WyrvIwWLE0tD; Sat,  2 Nov 2019 16:42:47 +0100 (CET)
Received: from burk.azoff.se (unknown [192.168.20.5])
	by spamfilter.azoff.se (Postfix) with ESMTPSA id DBE971C08D9;
	Sat,  2 Nov 2019 16:42:47 +0100 (CET)
From: =?UTF-8?q?Torbj=C3=B6rn=20Svensson?= <azoff@svenskalinuxforeningen.se>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Nov 2019 16:42:39 +0100
Message-Id: <20191102154239.25353-1-azoff@svenskalinuxforeningen.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Originating-IP: 83.252.213.239
X-Scan-Result: No virus found in message 1iQvY8-000S6o-43.
X-Scan-Signature: ch-p-mailout01.sth.basefarm.net 1iQvY8-000S6o-43
	be60923b568d0cc02ec46330191a7043
Subject: [PATCH] psplash: Do mount psplash tmpfs if not mounted
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
X-List-Received-Date: Sat, 02 Nov 2019 15:50:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The change in 5cea0448c5c75b9defc5fc2582e9b0c14e26a4e9 cases the
following to be printed during boot:
/etc/rcS.d/S00psplash.sh: line 28: [: -q: binary operator expected
and the volume is thus never mounted, neither when invoked during
boot nor shutdown/reboot.

Signed-off-by: Torbjörn Svensson <azoff@svenskalinuxforeningen.se>
---
 meta/recipes-core/psplash/files/psplash-init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/psplash/files/psplash-init b/meta/recipes-core/psplash/files/psplash-init
index dcb751907f..4bee866b0d 100755
--- a/meta/recipes-core/psplash/files/psplash-init
+++ b/meta/recipes-core/psplash/files/psplash-init
@@ -25,7 +25,7 @@ done
 
 export TMPDIR=/mnt/.psplash
 [ -d $TMPDIR ] || mkdir -p $TMPDIR
-if [ ! mountpoint -q $TMPDIR ]; then
+if ! mountpoint -q $TMPDIR; then
 	mount tmpfs -t tmpfs $TMPDIR -o,size=40k
 fi
 
-- 
2.23.0


