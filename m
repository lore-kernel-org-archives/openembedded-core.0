Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 87F33606D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 09:47:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so2800313wml.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 02:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hw1K7gr4roo5bJ8DM017xsxZOXihW2ciJUpAZWGan7Y=;
	b=G1zO9ZTkq4HzItgHmBArOB9hadkP2yXrcGda2RlynRq5v30inDDP0o+EqMnXvSIndc
	nrsLTkE/416sf7PzkYJ4JmqERwgfyfU/H40xV4q7D+19eNYyCH0OY3pt+iJ16rwZ5TMa
	bCH+8hG0lDqzuk8dQMoiuNJNl9pvBLQKrWoc1Bo+jcMDi44SYH3IY5kgkRmeEnReQy3s
	fMIYYU7kl0kSfPH+1iiZD8+5w9PN2B1E24VKSSumkG8HyQT6QgpHdGNxLrbhDf2gPFy/
	ahbuHBxN0czKB2gsBwi+jj0XmdPsclUIVsuJP3E6kp8ivhZDzYOIj8hsBrBU1zY93FTO
	ckRg==
X-Gm-Message-State: AD7BkJIhVBVF3PzVVT+KjNPYKugWw2AibZglzd/357o4FdW1gYudFNKeuZleiQRRT4pf+A==
X-Received: by 10.28.17.141 with SMTP id 135mr2923777wmr.48.1458726434654;
	Wed, 23 Mar 2016 02:47:14 -0700 (PDT)
Received: from sushi.stratoserver.net (sushi.andred.org. [85.214.105.253])
	by smtp.gmail.com with ESMTPSA id
	k124sm2044853wmb.11.2016.03.23.02.47.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 02:47:13 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 10:47:05 +0100
Message-Id: <1458726425-24672-3-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1458726425-24672-1-git-send-email-git@andred.net>
References: <1458726425-24672-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <adraszik@tycoint.com>
Subject: [PATCH 2/2] oe-git-proxy: support username / password in http proxy
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
X-List-Received-Date: Wed, 23 Mar 2016 09:47:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

We also make sure to correctly support usernames that contain spaces.

For simplicity sed + regex has been replaced with shell parameter expansion,
which works in both, bash and dash.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 scripts/oe-git-proxy | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 38ce7b6..1247902 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -116,14 +116,27 @@ for H in ${NO_PROXY//,/ }; do
 done
 
 # Proxy is necessary, determine protocol, server, and port
-PROTO=$(echo $ALL_PROXY | sed -e 's/\([^:]*\):\/\/.*/\1/')
-PROXY=$(echo $ALL_PROXY | sed -e 's/.*:\/\/\([^:]*\).*/\1/')
-# For backwards compatibility, this allows the port number to be followed by /?
-# in addition to the customary optional /
-PORT=$(echo $ALL_PROXY | sed -e 's/.*:\([0-9]*\)\(\/?\?\)\?$/\1/')
-if [ "$PORT" = "$ALL_PROXY" ]; then
+# extract protocol
+PROTO=${ALL_PROXY%://*}
+# strip protocol:// from string
+ALL_PROXY=${ALL_PROXY#*://}
+# extract host & port parts:
+#   1) drop username/password
+PROXY=${ALL_PROXY##*@}
+#   2) remove optional trailing /?
+PROXY=${PROXY%%/*}
+#   3) extract optional port
+PORT=${PROXY##*:}
+if [ "$PORT" = "$PROXY" ]; then
 	PORT=""
 fi
+#   4) remove port
+PROXY=${PROXY%%:*}
+
+# extract username & password
+PROXYAUTH="${ALL_PROXY%@*}"
+[ "$PROXYAUTH" = "$ALL_PROXY" ] && PROXYAUTH=
+[ -n "${PROXYAUTH}" ] && PROXYAUTH=",proxyauth=${PROXYAUTH}"
 
 if [ "$PROTO" = "socks" ] || [ "$PROTO" = "socks4a" ]; then
 	if [ -z "$PORT" ]; then
@@ -140,7 +153,7 @@ else
 	if [ -z "$PORT" ]; then
 		PORT="8080"
 	fi
-	METHOD="PROXY:$PROXY:$1:$2,proxyport=$PORT"
+	METHOD="PROXY:$PROXY:$1:$2,proxyport=${PORT}${PROXYAUTH}"
 fi
 
-exec $SOCAT STDIO $METHOD
+exec $SOCAT STDIO "$METHOD"
-- 
2.8.0.rc3


