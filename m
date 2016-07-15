Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4ED9606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 15:03:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id o80so2525190wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 08:03:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iuSB6ZfyBpnqdovGzSlZhIhgLJwG0Meu3L3DZHXPu0I=;
	b=V4ESumEw8QY1cWmu62oQ9ZdMyVFJXvbPpEjpuwcaf+sWdrn7u9yCODCf0tCe2afSc2
	Xr6rbOzev4Fz3e92XVfKN6lhl/9m4vTxvp0fvOMjvLs7h8fWF5/ZerGX0sUrSsBUHOOX
	R+UW7BC/SCYb492FkkqTY7KU1vvjWdQhEtiD8Vo0gPjdDYwKofhPH6pM6yvFSdNqKzOr
	DJhE7SH+kUIo14raZKKua9n3I49QVjOu4hgeEk92Syi/J8+lNow1VH0+4W6lRtUzHci+
	mNpq+SlI0JtNRl3BI4X0v0I6TgtgizlV/q2h9tGEiOj0Ij1ZiUW8ReiGw/AsC4X1vKpW
	nsdg==
X-Gm-Message-State: ALyK8tI7z/nmJxUZzpJdIrTSeFV+RCI+lIhB27CBKKtcRVzE7yBgzvb99nERa5nScpOW4g==
X-Received: by 10.28.155.196 with SMTP id d187mr41716224wme.30.1468595010502; 
	Fri, 15 Jul 2016 08:03:30 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.59])
	by smtp.gmail.com with ESMTPSA id
	b203sm6317186wmh.20.2016.07.15.08.03.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 08:03:29 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2016 16:03:27 +0100
Message-Id: <1468595007-8031-1-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] oe-git-proxy: don't depend on syslinux
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
X-List-Received-Date: Fri, 15 Jul 2016 15:03:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gethostip comes from syslinux. It seems odd to depend on a bootloader
to clone a git repository.

Switch to using getent from the c-library, which should be available
on every system.

We now also support the case where a hostname resolves to more than
one IP address.

Signed-off-by: André Draszik <git@andred.net>
---
 scripts/oe-git-proxy | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
index 1247902..0078e95 100755
--- a/scripts/oe-git-proxy
+++ b/scripts/oe-git-proxy
@@ -86,13 +86,14 @@ match_host() {
 
 	# Match by netmask
 	if valid_ipv4 $GLOB; then
-		HOST_IP=$(gethostip -d $HOST)
-		if valid_ipv4 $HOST_IP; then
-			match_ipv4 $GLOB $HOST_IP
-			if [ $? -eq 0 ]; then
-				return 0
+		for HOST_IP in $(getent ahostsv4 $HOST | grep ' STREAM ' | cut -d ' ' -f 1) ; do
+			if valid_ipv4 $HOST_IP; then
+				match_ipv4 $GLOB $HOST_IP
+				if [ $? -eq 0 ]; then
+					return 0
+				fi
 			fi
-		fi
+		done
 	fi
 
 	return 1
-- 
2.8.1


