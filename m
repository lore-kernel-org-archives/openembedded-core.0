Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9C459783EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 18:48:54 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id g20-v6so6697011plq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jun 2018 11:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=e9/ev4NaEpnrt4/FaxKyUpkHvXWmDYENrlqc7TdKYZE=;
	b=f1XZ79IVnZeVE3ALbUAqST7MbtFVx4nmj9bKwytEcywRSMJbYOJldorWnbQRXSLi6P
	XpbDozsczG8cqTnxKZYrtUpGP1vgjnNYNetInrqkxLYpMw/dgz2X8LyR/goh0W51rmeX
	JLmiumNKa03N+p8USDvfDVHlOb+A+7+BHXtD6gnEXoMO6RHhNWmXvoqu7al6mLFdWYSp
	bV4BfUGFGQX82OzeIEl2joVFrUdsYjRcy+855RA3VYITdBue68/aGg+68Ophy49MoUwc
	+lEMh3qKpV0SD165An8myOMc0k/mcVPLiCN8hG0vHz3xJmWPxeXPdiptQObguGtUJBsG
	TIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=e9/ev4NaEpnrt4/FaxKyUpkHvXWmDYENrlqc7TdKYZE=;
	b=hKFpuASfRqrg7rTeNY2y6wMTIY4UOeQthN2p50ykONG56Pyj7eXEL/DKVxCqF4QOsR
	JxpHqnjNLiwu3KQZNW9Tug0pxDdKzFmQCfgtyA0mSo+HEIYVz5/09m6mhHQb3wsI3Wtv
	2klTLFAGqsADNeQU5pW4ySChw3KBZozac1eDz7PkWKskqG5h+yBtUUyobIiy+xMS/MPt
	WhXQQTVv443P456JRtM59bPtA4V+NAj8qSBtzp4IACApbeiZZmRWpxMQPIHI9DqjPdOY
	ePkMSC0cffyfhdXSG01Y5Geoq/desCQW8uc4tHtGh3wuUJDINC+p8Sgwinri+c440R63
	9VfQ==
X-Gm-Message-State: APt69E08Kx24lFjIlwHX82wgGLwafsFzxXFEe/U95nN1aHOBqXNJKq5h
	sLyCSfhhJjm+OgyXoVS0b9pOLw==
X-Google-Smtp-Source: ADUXVKLSOPPpm2nIHTs+XcNpC2euPDH8FZ6YSSPvyeLZ6ZuL+ZFmRv/JRGPgD94Dx4E1bnzA3hDbiQ==
X-Received: by 2002:a17:902:bd95:: with SMTP id
	q21-v6mr3076824pls.237.1528397335559; 
	Thu, 07 Jun 2018 11:48:55 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	f30-v6sm27103558pgn.76.2018.06.07.11.48.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jun 2018 11:48:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2018 11:48:39 -0700
Message-Id: <1528397320-32269-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
References: <1528397320-32269-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/7] openssh: only create sshd host keys which have been enabled
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
X-List-Received-Date: Thu, 07 Jun 2018 18:48:54 -0000

Previously sshd_check_keys would create a full set of all possible
sshd host keys, even if sshd_config has been set to only enable
certain key types.

Update sshd_check_keys to only create keys which have been enabled in
sshd_config (with a fallback to creating a full set of key types if
no HostKey options are defined, as before).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../openssh/openssh/sshd_check_keys                | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
index be2e2ec..1931dc7 100644
--- a/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
+++ b/meta/recipes-connectivity/openssh/openssh/sshd_check_keys
@@ -56,27 +56,23 @@ while true ; do
     esac
 done
 
-# parse location of keys
-HOST_KEY_RSA=$(grep ^HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$(grep HostKey "${sshd_config}" | grep _rsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_RSA}" ] && HOST_KEY_RSA=$SYSCONFDIR/ssh_host_rsa_key
-HOST_KEY_ECDSA=$(grep ^HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$(grep HostKey "${sshd_config}" | grep _ecdsa_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_ECDSA}" ] && HOST_KEY_ECDSA=$SYSCONFDIR/ssh_host_ecdsa_key
-HOST_KEY_ED25519=$(grep ^HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$(grep HostKey "${sshd_config}" | grep _ed25519_ | tail -1 | awk ' { print $2 } ')
-[ -z "${HOST_KEY_ED25519}" ] && HOST_KEY_ED25519=$SYSCONFDIR/ssh_host_ed25519_key
+HOST_KEYS=$(sed -n 's/^[ \t]*HostKey[ \t]\+\(.*\)/\1/p' "${sshd_config}")
+[ -z "${HOST_KEYS}" ] && HOST_KEYS="$SYSCONFDIR/ssh_host_rsa_key $SYSCONFDIR/ssh_host_ecdsa_key $SYSCONFDIR/ssh_host_ed25519_key"
 
-# create keys if necessary
-if [ ! -f $HOST_KEY_RSA ]; then
-    echo "  generating ssh RSA key..."
-    generate_key $HOST_KEY_RSA rsa
-fi
-if [ ! -f $HOST_KEY_ECDSA ]; then
-    echo "  generating ssh ECDSA key..."
-    generate_key $HOST_KEY_ECDSA ecdsa
-fi
-if [ ! -f $HOST_KEY_ED25519 ]; then
-    echo "  generating ssh ED25519 key..."
-    generate_key $HOST_KEY_ED25519 ed25519
-fi
+for key in ${HOST_KEYS} ; do
+    [ -f $key ] && continue
+    case $key in
+    *_rsa_key)
+        echo "  generating ssh RSA host key..."
+        generate_key $key rsa
+        ;;
+    *_ecdsa_key)
+        echo "  generating ssh ECDSA host key..."
+        generate_key $key ecdsa
+        ;;
+    *_ed25519_key)
+        echo "  generating ssh ED25519 host key..."
+        generate_key $key ed25519
+        ;;
+    esac
+done
-- 
1.9.1


