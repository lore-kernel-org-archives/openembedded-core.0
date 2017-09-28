Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 269C672FB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 13:40:11 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id m123so1368601ita.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 06:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ubFUzk6xwRvJs7oRVMOIw5NqZxRiv0kV9vVTwsdr2VE=;
	b=lWQYRQ22/m6kJCgCEDEgcGkvooM4b7TmT6yYHmqAWiQcgRpaenDk/8wwaF3gK4rLP1
	0EP4DwsGFKdbdsWr60GuUbyvq5mrU2vBWzv2nVMpO8g4r6k0WxmTzTOJJfpRoanUV3q6
	ziEdNFw2ji8/4gkJi2K+kp1tTwSaI//uGhzKCEZitm+zkXGjyu97SqXwuTfgAujg1tcs
	k98rh4Sq/2RpWS41GlVR9p/MePoNeJE9tUwUbb6L1iRV4sMM5EAtc0HYAzgT14IY51lj
	68todcb/UaAafGqNJySxCjTMlSCKH296jnYELpOUtB1NHevHJ6CqGFBPsKfrTCEu9stx
	chUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ubFUzk6xwRvJs7oRVMOIw5NqZxRiv0kV9vVTwsdr2VE=;
	b=JyjcwhUFCkN+ngq1iH8T+tpv/q0tgmllkvxVko8j5hnMoRpZz64LbiPnK6Q9nIAwZN
	QJ5amqHBXbbG3pBuCM6y+8AekB3LKXgZuEC2Bi8CGNXQbXZwI9l3/Q50FGutJFVIk8gV
	2GegpRhds0eHL/C3blsjcg8lrnJbHSkqsSJ4N4LBR+JJJ86ABcBna8g0rxyHGnLVa7yy
	TG/M1SZs1gIE7uFyY03MjOgfspmXsahoDQs6x4lF4UuTxmt0ZpaxJB4V4KVskdPeuJ5P
	4qrsBQwAc4svHNT2HmdryCKdwrEVE/9GFDLnpWPkoDvZjTxDxZxVbvPdNpohZKi6+9Tv
	tfFg==
X-Gm-Message-State: AHPjjUhzpjuHcW1tIJMB27ZWANluE0gR8fdUamvYmSz9Enbx9/RdIlLo
	lLKph/SvbeDZgMFpbpmrtC6t1NYC
X-Google-Smtp-Source: AOwi7QCCppM0gll6tZ3Hx7PpMLYh9fe7WLzooGiRS2yv4+dWWJ0eOR7EWKrqGd/ndmpAZJnTmNgPKQ==
X-Received: by 10.36.39.142 with SMTP id g136mr1661126ita.73.1506606012786;
	Thu, 28 Sep 2017 06:40:12 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id
	h195sm339739itc.40.2017.09.28.06.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Sep 2017 06:40:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Sep 2017 08:40:01 -0500
Message-Id: <20170928134001.14733-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.13.5
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [PATCH v11] openssh: Atomically generate host keys
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
X-List-Received-Date: Thu, 28 Sep 2017 13:40:12 -0000

Generating the host keys atomically prevents power interruptions during the
first boot from leaving the key files incomplete, which often prevents users
from being able to ssh into the device.

[YOCTO #11671]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../openssh/openssh/sshd_check_keys                | 42 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index f5bba53ca31..5463b1a4cb1 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -1,5 +1,35 @@
 #! /bin/sh
 
+generate_key() {
+    local FILE=$1
+    local TYPE=$2
+    local DIR="$(dirname "$FILE")"
+
+    mkdir -p "$DIR"
+    ssh-keygen -q -f "${FILE}.tmp" -N '' -t $TYPE
+
+    # Atomically rename file public key
+    mv -f "${FILE}.tmp.pub" "${FILE}.pub"
+
+    # This sync does double duty: Ensuring that the data in the temporary
+    # private key file is on disk before the rename, and ensuring that the
+    # public key rename is completed before the private key rename, since we
+    # switch on the existence of the private key to trigger key generation.
+    # This does mean it is possible for the public key to exist, but be garbage
+    # but this is OK because in that case the private key won't exist and the
+    # keys will be regenerated.
+    #
+    # In the event that sync understands arguments that limit what it tries to
+    # fsync(), we provided them. If it does not, it will simply call sync()
+    # which is just as well
+    sync "${FILE}.pub" "$DIR" "${FILE}.tmp"
+
+    mv "${FILE}.tmp" "$FILE"
+
+    # sync to ensure the atomic rename is committed
+    sync "$DIR"
+}
+
 # /etc/default/ssh may set SYSCONFDIR and SSHD_OPTS
 if test -f /etc/default/ssh; then
     . /etc/default/ssh
@@ -43,22 +73,18 @@ HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | a
 # create keys if necessary
 if [ ! -f $HOST_KEY_RSA ]; then
     echo "  generating ssh RSA key..."
-    mkdir -p $(dirname $HOST_KEY_RSA)
-    ssh-keygen -q -f $HOST_KEY_RSA -N '' -t rsa
+    generate_key $HOST_KEY_RSA rsa
 fi
 if [ ! -f $HOST_KEY_ECDSA ]; then
     echo "  generating ssh ECDSA key..."
-    mkdir -p $(dirname $HOST_KEY_ECDSA)
-    ssh-keygen -q -f $HOST_KEY_ECDSA -N '' -t ecdsa
+    generate_key $HOST_KEY_ECDSA ecdsa
 fi
 if [ ! -f $HOST_KEY_DSA ]; then
     echo "  generating ssh DSA key..."
-    mkdir -p $(dirname $HOST_KEY_DSA)
-    ssh-keygen -q -f $HOST_KEY_DSA -N '' -t dsa
+    generate_key $HOST_KEY_DSA dsa
 fi
 if [ ! -f $HOST_KEY_ED25519 ]; then
     echo "  generating ssh ED25519 key..."
-    mkdir -p $(dirname $HOST_KEY_ED25519)
-    ssh-keygen -q -f $HOST_KEY_ED25519 -N '' -t ed25519
+    generate_key $HOST_KEY_ED25519 ed25519
 fi
 
-- 
2.13.5


