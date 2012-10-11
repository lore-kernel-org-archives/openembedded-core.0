Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TMQmS-0005fR-Ew
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Oct 2012 23:59:00 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1576081wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2012 14:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=dfytmnTnOec3Fn9INd3K6mPLWMp520bY+WDFEmyfvdU=;
	b=miz4lxaI5f70uVX321yzsfIoBy71aTNOmFQnH24CvprjFyIYuG1nQbseb3/B0+cYfg
	yG7QVDFWxNoQBDlqvffbDYgJjaTpViEIuCcDkjVWOt9PV30x57CPWayaCR5g0YNrneEF
	DGEeL+UIJR/9WanbEp8xSx4zfSkzg7Xk03uBuNIbY9gWF8Jkx20ghl8Qrj7Y5e6wWnD9
	eBwXU8clNsSYIKDvHLURPq4NN7XDEeR61QjzthEsqVbqI8tiOPDJD5i7H3cJcHMP2UaW
	Bjelwj3FRwWTZQKweLc+RlrT+YjZ94IRYMF12qwHrFkW4PUjKIqUbtYjeIpll720sxBj
	kbOA==
Received: by 10.180.106.2 with SMTP id gq2mr906769wib.18.1349991949929;
	Thu, 11 Oct 2012 14:45:49 -0700 (PDT)
Received: from nano.lab.ossystems.com.de (gateway03.m3-connect.de.
	[88.79.237.13])
	by mx.google.com with ESMTPS id dm3sm759629wib.3.2012.10.11.14.45.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 14:45:48 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2012 18:46:41 -0300
Message-Id: <1349992001-3965-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] buildhistory.bbclass: Fix hostname print for 'No changes' case
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2012 21:59:00 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 49f2ea5..0a5753f 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -403,9 +403,9 @@ END
 		fi
 		# Check if there are new/changed files to commit (other than metadata-revs)
 		repostatus=`git status --porcelain | grep -v " metadata-revs$"`
+		HOSTNAME=`hostname 2>/dev/null || echo unknown`
 		if [ "$repostatus" != "" ] ; then
 			git add .
-			HOSTNAME=`hostname 2>/dev/null || echo unknown`
 			# porcelain output looks like "?? packages/foo/bar"
 			# Ensure we commit metadata-revs with the first commit
 			for entry in `echo "$repostatus" | awk '{print $2}' | awk -F/ '{print $1}' | sort | uniq` ; do
-- 
1.7.10.4



