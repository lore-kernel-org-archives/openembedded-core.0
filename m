Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id D3D4572F7A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 01:42:32 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id o126so20434831pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 17:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QWS0UxExZNEYrV6KBC0diJ0U/2S9KDJZnas7JXNQt8k=;
	b=ZaNEHrYzWpihSvSz8bVImnTLUfXN2c7BB2P7wj+SCN7eTT08lRDhFLetHrvy9aXJcw
	trWdAw9NCcZrp3cHik3vl281QdxNcKxp9bxpmUV5XrT3CbKxClUkPvMIdS+PzPBeNqyC
	B9dDxSq/BjhUvLUZAy4OPWiTyJYqmdeuf2DeB0B3tmcWV7m/3if611+nkkhkzaoPMWnY
	3kkiaXTMa3EXVsuzP2L1WF1CSlDhRqqjQ+EfhL9saEWbIgG1mpOSAiP9BOZlIb+7Gjqw
	9Lp4Eh4Z2AxyDBdCEA6A1r0/jqFmssUHSODhQ2abqsDBJVSKjq9VQcDmQX1gKJ9SKmju
	psZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QWS0UxExZNEYrV6KBC0diJ0U/2S9KDJZnas7JXNQt8k=;
	b=n4R8KlaxCqP4l/THsYn98CDx7iYwGVzhkwQiSjbrcKRiIdG6Y7AM4MXpJDlkwbG6Vh
	E+gbll6XFZWkDaRm/SHK+c3T68dQzMgc+Otq86yO8ZH6jREKNwCVF36Ce0uQeLmC9Jmv
	Cw0B5gd6LAiG42EuTFIW8tnMEnhXNFrBKYXzacZab1QwNVUz8uTTmz2p084avS0Wg6tZ
	5T0/7bUnVvk1O/Jtfxsa5bYp/jc0tI36zHvfKoEcNyIqVOQ+1Dtw/jWQDUcloKML9c+U
	t1MAUuG4CG8I0Tbo5Iq3WOxgLoDSb04+Nzk06SxsDAR12yFd7bVVNMree1PCnnNrevnP
	iLZg==
X-Gm-Message-State: AMke39kPxlnh9FPLFOX6B+Upq8n0vJN3EK4xin16Opcfeo1umK4Boq7n7xspwxJxuU/Okg==
X-Received: by 10.84.225.22 with SMTP id t22mr31583132plj.14.1488850953787;
	Mon, 06 Mar 2017 17:42:33 -0800 (PST)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	o125sm41796792pfb.109.2017.03.06.17.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Mar 2017 17:42:32 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:42:25 -0800
Message-Id: <1488850945-21632-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] dropbear: drop support for DSA host keys in dropbear init script
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
X-List-Received-Date: Tue, 07 Mar 2017 01:42:33 -0000

Bring the dropbear init script into sync with the systemd service
file (dropbearkey.service supports RSA host keys only) and with
recent versions of openssh which deprecate DSA host keys.

  https://www.gentoo.org/support/news-items/2015-08-13-openssh-weak-keys.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/dropbear/dropbear/init | 36 ++++++--------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear/init b/meta/recipes-core/dropbear/dropbear/init
index 434bd6b..f6e1c46 100755
--- a/meta/recipes-core/dropbear/dropbear/init
+++ b/meta/recipes-core/dropbear/dropbear/init
@@ -40,49 +40,28 @@ done
 if [ $readonly_rootfs = "1" ]; then
   mkdir -p /var/lib/dropbear
   DROPBEAR_RSAKEY_DEFAULT="/var/lib/dropbear/dropbear_rsa_host_key"
-  DROPBEAR_DSSKEY_DEFAULT="/var/lib/dropbear/dropbear_dss_host_key"
 else
   DROPBEAR_RSAKEY_DEFAULT="/etc/dropbear/dropbear_rsa_host_key"
-  DROPBEAR_DSSKEY_DEFAULT="/etc/dropbear/dropbear_dss_host_key"
 fi
 
 test -z "$DROPBEAR_BANNER" || \
   DROPBEAR_EXTRA_ARGS="$DROPBEAR_EXTRA_ARGS -b $DROPBEAR_BANNER"
 test -n "$DROPBEAR_RSAKEY" || \
   DROPBEAR_RSAKEY=$DROPBEAR_RSAKEY_DEFAULT
-test -n "$DROPBEAR_DSSKEY" || \
-  DROPBEAR_DSSKEY=$DROPBEAR_DSSKEY_DEFAULT
-test -n "$DROPBEAR_KEYTYPES" || \
-  DROPBEAR_KEYTYPES="rsa"
 
 gen_keys() {
-for t in $DROPBEAR_KEYTYPES; do
-  case $t in
-    rsa)
-        if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
-                rm $DROPBEAR_RSAKEY || true
-        fi
-        test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY $DROPBEAR_RSAKEY_ARGS
-	;;
-    dsa)
-        if [ -f "$DROPBEAR_DSSKEY" -a ! -s "$DROPBEAR_DSSKEY" ]; then
-                rm $DROPBEAR_DSSKEY || true
-        fi
-        test -f $DROPBEAR_DSSKEY || dropbearkey -t dss -f $DROPBEAR_DSSKEY $DROPBEAR_DSSKEY_ARGS
-	;;
-  esac
-done
+    if [ -f "$DROPBEAR_RSAKEY" -a ! -s "$DROPBEAR_RSAKEY" ]; then
+        rm $DROPBEAR_RSAKEY || true
+    fi
+    test -f $DROPBEAR_RSAKEY || dropbearkey -t rsa -f $DROPBEAR_RSAKEY $DROPBEAR_RSAKEY_ARGS
 }
 
 case "$1" in
   start)
 	echo -n "Starting $DESC: "
 	gen_keys
-	KEY_ARGS=""
-	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
-	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
 	start-stop-daemon -S -p $PIDFILE \
-	  -x "$DAEMON" -- $KEY_ARGS \
+	  -x "$DAEMON" -- -r $DROPBEAR_RSAKEY \
 	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
 	echo "$NAME."
 	;;
@@ -95,11 +74,8 @@ case "$1" in
 	echo -n "Restarting $DESC: "
 	start-stop-daemon -K -x "$DAEMON" -p $PIDFILE
 	sleep 1
-	KEY_ARGS=""
-	test -f $DROPBEAR_DSSKEY && KEY_ARGS="$KEY_ARGS -d $DROPBEAR_DSSKEY"
-	test -f $DROPBEAR_RSAKEY && KEY_ARGS="$KEY_ARGS -r $DROPBEAR_RSAKEY"
 	start-stop-daemon -S -p $PIDFILE \
-	  -x "$DAEMON" -- $KEY_ARGS \
+	  -x "$DAEMON" -- -r $DROPBEAR_RSAKEY \
 	    -p "$DROPBEAR_PORT" $DROPBEAR_EXTRA_ARGS
 	echo "$NAME."
 	;;
-- 
1.9.1


