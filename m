Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 899DB606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id p138so5777053wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xQMm38FRwzDpelRVsKYetbEuqOuakt+FYhaCL1n28X8=;
	b=N49MDrMfwCT4QT0bpTMuJN9wfa8WE59k1PhWEBO1vC2h5Cmj0KW9nJ1WSAIpZcuB7C
	3MmM5VZYuGlIKr8MsI/MbxYvtXjEle7iUHViP8ah6NATcGaEdw6aB6WRZIeckEXRQ/Ri
	4iB/pC9KpJYAUviAONkulolduLk1RFHeaNiQ6LVQ2cnU1RrTIhcyYb2EJo3Tn3YDQSJ3
	iw5btgPG5ABHqcysC02ANQ9YhorE75P8Ivs6RKbGKOh5KyLT5kAv7c2zTt5qBKjooapv
	FKMyHYL8fMRvfzLKJhaWMwfHbvt48uyrQn6TJQP4aHJjx6GbFEYU6Skd5pZzZoXyGj51
	TIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xQMm38FRwzDpelRVsKYetbEuqOuakt+FYhaCL1n28X8=;
	b=YHV+hBBP2eYE9wVMw1oHxr6k7o3nbMQu1Bktqa+qGQUWJCWOr109G2dkK9PXQrzxTO
	9+uJ2qfWqcUVvPPsiBl0wXeucdYlY7oSHeLsUR2gPg5s1hC6YM4EtlLCekKq1WV7Cjg0
	4z8AabwzD5BiJWvvWUvE6o28WygCcWpBAqQxU5HqxnPaI2lIm04QI+CY0TxSYuSa/xhX
	ipd7vADdt+ZBCmGUy+PuUG1QOksi2YCnKLxBrrc9K1l0ZcnA9a69ikJ+oQ/XMdbNktmN
	YxmHz38VsgserUnRagEJ7YxnaC0c1MtlqUfrHWte5Ny+fBbCv5yeS9qewLBtVNpFOybG
	2LOg==
X-Gm-Message-State: AA6/9RmxJNbr6l+L9AV6wg+pBGk7SGuwZ5bBu9aGKKp1DL6f01m6IiYDmxTcFiX5RENc+g==
X-Received: by 10.28.67.132 with SMTP id q126mr467840wma.84.1475290055242;
	Fri, 30 Sep 2016 19:47:35 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:34 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:50 +0200
Message-Id: <1475290031-20568-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 01/22] base.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:34 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/base.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 21957d8..024fe43 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -113,7 +113,7 @@ def get_lic_checksum_file_list(d):
                     continue
                 filelist.append(path + ":" + str(os.path.exists(path)))
         except bb.fetch.MalformedUrl:
-            raise bb.build.FuncFailed(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
+            bb.fatal(d.getVar('PN', True) + ": LIC_FILES_CHKSUM contains an invalid URL: " + url)
     return " ".join(filelist)
 
 addtask fetch
@@ -131,7 +131,7 @@ python base_do_fetch() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.download()
     except bb.fetch2.BBFetchException as e:
-        raise bb.build.FuncFailed(e)
+        bb.fatal(str(e))
 }
 
 addtask unpack after do_fetch
@@ -152,7 +152,7 @@ python base_do_unpack() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.unpack(d.getVar('WORKDIR', True))
     except bb.fetch2.BBFetchException as e:
-        raise bb.build.FuncFailed(e)
+        bb.fatal(str(e))
 }
 
 def pkgarch_mapping(d):
@@ -671,7 +671,7 @@ python do_cleanall() {
         fetcher = bb.fetch2.Fetch(src_uri, d)
         fetcher.clean()
     except bb.fetch2.BBFetchException as e:
-        raise bb.build.FuncFailed(e)
+        bb.fatal(str(e))
 }
 do_cleanall[nostamp] = "1"
 
-- 
2.7.4


