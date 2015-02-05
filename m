Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 389DA60557
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:35 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5961429pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IpC28b45SIfwIp7L943F4uvnyExR95re7RchNvvePxE=;
	b=DwbXQ43Bdf1Ak2jvhG3Y6TIoY4BZ/lQHFCsbaKSI/xNXf46nZX6IInXWIYFlDC8DVC
	73yJBHQCAD4L0XF6+24pKPz7s5Ik0TgDYUpYLKkCXX7xdsxzyUzU0CfzEahMDh+1wC53
	SzwwDVDo5iUaSOUkYhIwpIv1Url/g3cv51RGf9rO2alvIY56NuwZ5t7Y+t0sV0/lRKif
	/o/WPYfA3Hcj0dhLQqZtNx5uEmu7mvVXYIpeavzs7+60j7PN2xgTzCmz7W3sa4GV5pOs
	3yKOWsPiSz3oej8T0uvCHZZPozGACDvYchYSzd8BofeKx8PBjZuZ0NRoppmx+qwpC9tI
	WSfw==
X-Received: by 10.69.20.10 with SMTP id gy10mr6817202pbd.76.1423152276802;
	Thu, 05 Feb 2015 08:04:36 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:20 -0800
Message-Id: <59aaf0f82cc34439d4aad7db78ac5d8cc9cac8be.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 12/61] bitbake: ast: Add error when trying to use dash in sh function names
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:36 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

A dash character is illegal in function names in sh (but not bash). Since
our shell tasks run under sh and the shell parser is sh based, EXPORT_FUNCTIONS
won't work with class names containing a dash.

We can't change sh, we can ensure the user is warned about the problem
straight away though.

[YOCTO #7006]

(Bitbake rev: 86704281b79e524dccccc88cbf996b299b33bae2)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 bitbake/lib/bb/parse/ast.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/bitbake/lib/bb/parse/ast.py b/bitbake/lib/bb/parse/ast.py
index 4e5a06e..4b10ee7 100644
--- a/bitbake/lib/bb/parse/ast.py
+++ b/bitbake/lib/bb/parse/ast.py
@@ -226,6 +226,8 @@ class ExportFuncsNode(AstNode):
             if data.getVarFlag(calledfunc, "python"):
                 data.setVar(func, "    bb.build.exec_func('" + calledfunc + "', d)\n")
             else:
+                if "-" in self.classname:
+                   bb.fatal("The classname %s contains a dash character and is calling an sh function %s using EXPORT_FUNCTIONS. Since a dash is illegal in sh function names, this cannot work, please rename the class or don't use EXPORT_FUNCTIONS." % (self.classname, calledfunc))
                 data.setVar(func, "    " + calledfunc + "\n")
             data.setVarFlag(func, 'export_func', '1')
 
-- 
1.9.1


