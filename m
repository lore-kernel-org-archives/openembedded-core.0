Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RH5vW-0004tB-U2
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 05:37:47 +0200
Received: by ywf9 with SMTP id 9so1012306ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 20:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=WY0s22nJ1w9/umrTVfJDqf845lshYp/9nlKmT69x2ok=;
	b=QKssiyF3k0rVqCsVVhzevTNVeHNq2St8gyqI/4SuHerWI6ft5ghvVPOIaUi4jOIHri
	qGqHXI+js3JZr5UYu8nzmj23C+wLxLCM6sqfHW3HaOQB7aketPIKCfUwGbMQmJ+Und7k
	oH8QU73dWbkE1mbMooCg3bKxWygII3uRTp/4U=
Received: by 10.150.188.9 with SMTP id l9mr12513931ybf.15.1319167913620;
	Thu, 20 Oct 2011 20:31:53 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id m3sm32008971ang.0.2011.10.20.20.31.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 20:31:52 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2011 03:31:40 +0000
Message-Id: <9c3cff6e514e8ccc69b9462197c7bceeb117a55e.1319167843.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1319167843.git.otavio@ossystems.com.br>
References: <cover.1319167843.git.otavio@ossystems.com.br>
Subject: [PATCH 2/4] useradd.bbclass: check if a group already exists manually
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
X-List-Received-Date: Fri, 21 Oct 2011 03:37:47 -0000

The use of groupadd -f makes much more difficult to figure when a
group is not add. This was the case of the class not working for our
usage and this being caused by the lack of '/etc/group' file but
unnoticed as groupadd wasn't failing according.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/useradd.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 1e03a04..fb70b3e 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -37,7 +37,13 @@ if test "x$GROUPADD_PARAM" != "x"; then
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1`
 	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2-`
 	while test "x$opts" != "x"; do
-		eval $PSEUDO groupadd -f $OPT $opts
+		groupname=`echo "$opts" | awk '{ print $NF }'`
+		group_exists=`grep "^$groupname:" $SYSROOT/etc/group || true`
+		if test "x$group_exists" = "x"; then
+			eval $PSEUDO groupadd  $OPT $opts
+		else
+			echo "Note: group $groupname already exists, not re-creating it"
+		fi
 
 		if test "x$opts" = "x$remaining"; then
 			break
-- 
1.7.2.5



