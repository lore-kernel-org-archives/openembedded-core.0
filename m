Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYgCS-0007g0-JW
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:47:58 +0100
Received: by mail-gy0-f175.google.com with SMTP id r13so1562133ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=7Af13Y/LNLSkzNXceTYAwCU1G5ZQGwMhWhLOoy8YjUc=;
	b=ldUSfPCGd1TDv4mVphx39r/1CSMhzrlfDZ22bxotmcr3LGtcLZEz2+wScLP9Le6sJz
	iYig/FImgx8kVRx26gmQWH3DcHCudjyrEQX4W/zQ6yPe1V6l6Yx3VmFvRk7aGK+6ffrX
	nfxmyzgmJLnQQkIA9JoBinisAQQWaiWv10zMg=
Received: by 10.236.179.7 with SMTP id g7mr5221006yhm.74.1323358868613;
	Thu, 08 Dec 2011 07:41:08 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 32sm15415340anu.10.2011.12.08.07.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:41:07 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2011 15:40:49 +0000
Message-Id: <abe8db681be0a2ec0ada964957236a5f0511d746.1323358819.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] scripts/send-pull-request: allow sending of patches without a cover letter
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
X-List-Received-Date: Thu, 08 Dec 2011 15:47:58 -0000

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



