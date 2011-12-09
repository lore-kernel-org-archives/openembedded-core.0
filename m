Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RZ4LK-0002Op-O0
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 18:34:42 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so2538752yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 09:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=7Af13Y/LNLSkzNXceTYAwCU1G5ZQGwMhWhLOoy8YjUc=;
	b=cGdAAS5qO03aoCCXA9sOHizBz1YmhFc7sRaB61DDekCtRk6WOm9BZKblhQFVbk//P3
	2vozGVHlW1OS7gdZymof+uL4ncy1LNZbp+Xre5q7knrUu5VU7iAsZBBdwRJSK555oDrK
	F9vUl6XRk0gJyuFD3pFuRMJR95G9JzhOPp9RY=
Received: by 10.236.185.9 with SMTP id t9mr14048949yhm.50.1323451673525;
	Fri, 09 Dec 2011 09:27:53 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id l11sm25562627anm.22.2011.12.09.09.27.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 09:27:52 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 17:27:32 +0000
Message-Id: <9c9a2cdfb96e8a06053e2bd3134385be4ca2a4b3.1323451575.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323451575.git.otavio@ossystems.com.br>
References: <cover.1323451575.git.otavio@ossystems.com.br>
Subject: [PATCH 2/5] scripts/send-pull-request: allow sending of patches without a cover letter
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Dec 2011 17:34:43 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/send-pull-request |   21 ++++++++++++---------
 1 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index be13009..8d51ce2 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -108,15 +108,18 @@ fi
 
 
 # Verify the cover letter is complete and free of tokens
-CL="$PDIR/0000-cover-letter.patch"
-for TOKEN in SUBJECT BLURB; do
-	grep -q "*** $TOKEN HERE ***" "$CL"
-	if [ $? -eq 0 ]; then
-		echo "ERROR: Please edit $CL and try again (Look for '*** $TOKEN HERE ***')."
-		exit 1
-	fi
-done
-
+if [ -e $PDIR/0000-cover-letter.patch ]; then
+	CL="$PDIR/0000-cover-letter.patch"
+	for TOKEN in SUBJECT BLURB; do
+		grep -q "*** $TOKEN HERE ***" "$CL"
+		if [ $? -eq 0 ]; then
+			echo "ERROR: Please edit $CL and try again (Look for '*** $TOKEN HERE ***')."
+			exit 1
+		fi
+	done
+else
+	echo "WARNING: No cover letter will be send."
+fi
 
 # Harvest emails from the generated patches and populate AUTO_CC.
 if [ $AUTO_CL -eq 1 ]; then
-- 
1.7.2.5



