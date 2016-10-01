Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id AE8E271979
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:50 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so5768997wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sJDgaZ1Ini/uqVdVvMc6q1KfrWCq/ysGWI1ILwOp7ZM=;
	b=cw8E3dgxr+9ixmRW8BxLqNZVm747nbq+ZNZ79UUMFRSXyWkN2doGCaQ+DB5jr3w+af
	jH2OlNFxKhj+NjruCxr09wte6hEIjeBS9W5RfUNZnhbX0FWAMi1i3wAbP1Aq2hbgonbg
	H+M2sA25dU5VCwHU9M9MFyXPJZ5awEbffFtLwUvJHFJsHz3Jp+qJGWJ9FH3zU6gHPKCu
	ABK1BO5kMwk0AuGEDWzdf0EPorV2uEdLepL+KKZijkGUqZ//nxBwYzNT87e0lQEJcg3R
	tfEUQ40puS+OSfDQ/sfRyZOJYlLAjk2Qb73JHCgLpscR/c8RTdlhgv3T8L1dnR733ULs
	gPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sJDgaZ1Ini/uqVdVvMc6q1KfrWCq/ysGWI1ILwOp7ZM=;
	b=OYgVkAI0lphPHc8zs2FaYlD1FY7sCa8a0vZjrf24Dyz6I707F/buI4StEjozF5J6Tm
	wN6b9fKPCz53R2ZYWMFA8kPnbnl/P2lzpvF+A2M7yqDCLuozLqeb3Jxdzal4Bb0miieM
	xjNz6eB/8+GZ7POwUG1Sr3tNkbRcBhrj8S/Y3c6apPQqv6gDj6YQxGq3QSWB7IZnN+29
	G6MQRhv/xQ9hO4lT7GXTDbDbG9g3llkAQEZ57sMbUqtURUmomO01Y7Z9HpbiuKGNdgQi
	Gy60D4NjygR9k5sMocAU4V12MFmfDymJS7NauCeTEJnYtaYmSzaWPYC6krIMal0NxJwy
	9l3g==
X-Gm-Message-State: AA6/9Rnmcd93Dwz8YZM1yxf0LVQxWPZHyYuUXQxNg03MDgF6QeFNX0iINoCBAO4DMXxpjA==
X-Received: by 10.194.176.69 with SMTP id cg5mr8377727wjc.52.1475290071983;
	Fri, 30 Sep 2016 19:47:51 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:51 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:05 +0200
Message-Id: <1475290031-20568-17-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 16/22] chrpath.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:51 -0000

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
 meta/classes/chrpath.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/chrpath.bbclass b/meta/classes/chrpath.bbclass
index 72e8a12..3b5cd37 100644
--- a/meta/classes/chrpath.bbclass
+++ b/meta/classes/chrpath.bbclass
@@ -39,8 +39,7 @@ def process_file_linux(cmd, fpath, rootdir, baseprefix, tmpdir, d):
         p = sub.Popen([cmd, '-r', args, fpath],stdout=sub.PIPE,stderr=sub.PIPE)
         out, err = p.communicate()
         if p.returncode != 0:
-            bb.error("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
-            raise bb.build.FuncFailed
+            bb.fatal("%s: chrpath command failed with exit code %d:\n%s%s" % (d.getVar('PN', True), p.returncode, out, err))
 
 def process_file_darwin(cmd, fpath, rootdir, baseprefix, tmpdir, d):
     import subprocess as sub
-- 
2.7.4


