Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C389779C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 12:17:20 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 188so6856310itx.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 05:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9drKRSvOOSQI5E+hAKieizD2ABMbxB9LfC4enhSDUyo=;
	b=Zp8125sZ8zIlN0e6xYgHfJl47udMTHZy1swUZoAix9V/6HzmH1RsrZ4T3LpMlGQB9f
	jouANmQoBtHdXV3JHTtfIUwYnK3phiT2Pp/uTLjYnaFh+LWuCUGvBxPCE3ahA8lePNdK
	EDzHL441wn8dZBLD5Tp4nI88paUao+Qa6V+1hd7xXsyzjDm/glADiS4WBbVU75zioKsp
	poO+WCb6kCkoXSfxybFQGeF0cK/P8+YncfcLVrqq7KBQjCCVx4PlPcDmCMYQDnS0x8qs
	6KdZa4HAJ0fXd7ftVIKnRyBAgh2Wb1oV1oFOHrmKWEBIpH8odru5vFxGpGdNYsL/EtKn
	Lx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9drKRSvOOSQI5E+hAKieizD2ABMbxB9LfC4enhSDUyo=;
	b=BUT5I+Sq6p9NA72yw3sqnl5ymtN8el3sqOMFDvQfGO/H/9QbAuC5QS9Dbx212NGQyJ
	qaQXymh1n9WAQZ1yTSsnZZqMm6vLTrETu3n2dyii5nR2Khf/b7k1z9KkXBSDVy6aTFCs
	+FGEY4ELvO+SMcKgxsa/2Snge1tji0zgvPl3U2bUC4L0LN5zkTu18u3Awuiyd9d/zVX7
	L/DtkYBJANhp7K3YmcmmXm6iAKBme1OcUowthpofH89ubYa+ZCf/IwIo3kms2epJT8HM
	3IV0QMCibkkVxVPzalxYS4p2rx+RJV0l27AdxdqqQvrYt3LHbPr9gLoB/5/3xsH7GWZh
	NR1Q==
X-Gm-Message-State: AIVw111g92zi30gT9hMqV4YIhDciQHBnRm969s2FOn/YnIgQnOZzzTbb
	dN30sSJf0pdGJPqMFys=
X-Received: by 10.107.10.232 with SMTP id 101mr2980150iok.102.1499948241720;
	Thu, 13 Jul 2017 05:17:21 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:a83:3700:10fb:b4c1:2c33:798c])
	by smtp.gmail.com with ESMTPSA id u10sm2784669itb.2.2017.07.13.05.17.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 05:17:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 07:15:38 -0500
Message-Id: <20170713121538.11083-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
Subject: [PATCH v10] openssh: Atomically generate host keys
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
X-List-Received-Date: Thu, 13 Jul 2017 12:17:21 -0000

Generating the host keys atomically prevents power interruptions during the
first boot from leaving the key files incomplete, which often prevents users
from being able to ssh into the device.

[YOCTO #11671]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../openssh/openssh/sshd_check_keys                | 42 +++++++++++++++++-----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index f5bba53..5463b1a 100644
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
2.9.4


