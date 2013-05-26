Return-Path: <net147@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D830E6065B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 10:59:42 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp6so5841715pab.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2013 03:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=qNdmI76YfJ6R26DbA4pqhQhrF03V5gavzp469h6SO7o=;
	b=FrW2Hy4FsnygbtSTUxLFjscE0ZUuJxZayc3ekTTyjfobTmVQlUdxpmpYC3C5aZwZcg
	LEdNew6bajfKPvkMG9EtYtEhN0Q1pwuOIi2O9W9OkHM+AqodYmZkOj0fnD3VMBZz0shW
	EtFRAj0UtCFrjhRH56/GHi6iB0tgwDdqtn8nlU0OZIVny43PT6kgQc/gKltB3WEah/dr
	qAMrzpplol1pFYdtP5MdgFxwdNc5QQ82EM0qZTsAPh7rSxC4mOhij7mKn9CkvBd41qNQ
	WJJRzE+IuyWcwsBSqFKy6pdcOdsKFyMUkzuEkjq4vLJW6ZHAksuGJYIhIfQPK0kMAwMQ
	HMvA==
X-Received: by 10.68.201.132 with SMTP id ka4mr24442378pbc.162.1369565984091; 
	Sun, 26 May 2013 03:59:44 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id v7sm24021533pbq.32.2013.05.26.03.59.41
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 03:59:42 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2013 21:13:03 +1000
Message-Id: <1369566786-20341-4-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
In-Reply-To: <1369566786-20341-1-git-send-email-net147@gmail.com>
References: <1369566786-20341-1-git-send-email-net147@gmail.com>
Subject: [PATCH 3/6] systemd: do not create symbolic link from /run to /var/run
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
X-List-Received-Date: Sun, 26 May 2013 10:59:43 -0000

The /run directory already exists as a tmpfs with /var/run as a symbolic
link pointing to /run.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-core/systemd/systemd/init | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/init b/meta/recipes-core/systemd/systemd/init
index a42e732..7e67a50 100644
--- a/meta/recipes-core/systemd/systemd/init
+++ b/meta/recipes-core/systemd/systemd/init
@@ -42,9 +42,6 @@ case "$1" in
     [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
     [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     mount -a -t tmpfs 2>/dev/null
-    if [ ! -e /run ]; then
-        ln -s /var/run /run
-    fi
 
     # cache handling
     if [ "$DEVCACHE" != "" ]; then
-- 
1.8.2.3


