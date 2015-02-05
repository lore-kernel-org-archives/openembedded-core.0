Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD4872701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:06:08 +0000 (UTC)
Received: by pdbfp1 with SMTP id fp1so8547558pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=BZmUd6Jc+6RBUTAw2meXH8jeM8E0tbVYg9SnlmtLmtM=;
	b=Bd5su6VS75Zb4FDmK9FN+k56RY6kUrE3gC8ES7VI/XDoU7qaXilxc5LgnO18Y18uYW
	XAfZwe4ajAfZzpxlxnFtwHUsH5WR7mdE/pCt7hZfIVKu1N/tFgOzTfaJCDiui6eE/lsc
	dmQd/LPoZbiX6dCR3B1QYmDp2q+cX8kQvvBNG/L1XQes9oT7LHSX8lAId6pzfX4pAiYD
	oxPq33Y2Q7NVnaeaOUHtUmjYPnLklnF+cEKMgX/eoYg090HJ8k+IWWHroUNA802XzN5y
	s+c4iOFMaPj9ulMahEXjxRhw66XfrIFGXar8piUpkuLNm4TSvId6gtoBYQHjlyWK5HNj
	QX2A==
X-Received: by 10.67.6.225 with SMTP id cx1mr6552353pad.1.1423152369691;
	Thu, 05 Feb 2015 08:06:09 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.06.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:06:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:04:06 -0800
Message-Id: <0318a829bfe5dde6065ce32aa2a180d678cb26d8.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 58/61] scripts/send-error-report: Set exit code if error occurs
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
X-List-Received-Date: Thu, 05 Feb 2015 16:06:09 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If an error occurs, set an error exit code so the world knows about it. This fixes
issues where the autobuilder doesn't notice these failures.

[YOCTO #7265]

(From OE-Core rev: b219377defc9517af360986352bd7da1a7906f10)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/send-error-report | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index c99d387..01c292e 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -62,6 +62,7 @@ def sendData(json_file, server):
                     g.write(email + "\n")
             else:
                 print("Invalid inputs, try again.")
+                sys.exit(1)
                 return
 
         with open(json_file) as f:
@@ -74,6 +75,7 @@ def sendData(json_file, server):
             data = json.dumps(jsondata, indent=4, sort_keys=True)
         except:
             print("Invalid json data")
+            sys.exit(1)
             return
 
         try:
@@ -87,12 +89,14 @@ def sendData(json_file, server):
                 print("There was a problem submiting your data, response written in %s.response.html" % json_file)
                 with open("%s.response.html" % json_file, "w") as f:
                     f.write(res)
+                sys.exit(1)
             conn.close()
         except Exception as e:
                 print("Server connection failed: %s" % e)
-
+                sys.exit(1)
     else:
         print("No data file found.")
+        sys.exit(1)
 
 
 if __name__ == '__main__':
-- 
1.9.1


