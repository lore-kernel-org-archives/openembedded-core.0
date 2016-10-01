Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0812F71993
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:54 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id p138so5777598wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oFXpjzwwr7f6hDkxjZ95S9h0VJxg5dJlQEz5QQYL8TI=;
	b=ODYy9LVPhMWeO3LN8ni2gE1hreVAhsNkR417QLxUPffqJLyj6qF+5p7D1DZ6AYZHdm
	l3Dl/rfqDTchDP9V65BYAPJTzTti8jbUnvWeE7ew/iMKdXHO6TWuyjuP8Ix7kdbnVYx6
	mMAjoVZeXmwbEYpmYuJZN92K231V2y+GnMLK/hxcNeSHA++eH0ti+VGCSAKxD6Jfcjur
	vGfCcmFZ6ce4AShsR5nxIc8w/VfT0qklTYi+fGvldVsy0kN7x/gm0HgDvnMjPuvrDZyk
	J1zpeW5FbL03zKWuRuZdGP4WZRJ1u1+RqvObXCwriyZBE9OTA1iDRrnDZZbMEgsv3rNv
	h3oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oFXpjzwwr7f6hDkxjZ95S9h0VJxg5dJlQEz5QQYL8TI=;
	b=DTMeCdwO9jzHgHrg1ZErMEquI7JQj9Yn8d1dSkz6fqUWgw2J36I8GZT6v1KWwi5pyw
	mVhabPuXypeFh9twDZpRMIL9FNpxGJQp/cL2DpO9bI/DcpE4iAHc6bOAftk1PwaPsIns
	Ifle2Y5zJlLZg3GmvYn7nW1zR2QZPu1qlqgBAUgjb2y97yN5RS+iGGEZtqiRFh6Xz81m
	+q66sXP/Mf/JUf3FZiMW2Utv9M/9JtfNFmbpLiWd2H2UIGeLjKW6PzeXAh+G7P3vYAi3
	MPW3H5zReXSJ0J2b+D2mlUVIulOgKoL9fQ/MR3YQPVochN4D/UZcc3N9UMT8dGuxdUqn
	vjrA==
X-Gm-Message-State: AA6/9RlCQPyW1MgU5OFJo3++0nrV9GJNFrM8mXIxcQ780fqKFdWZWtuqsla4NM2lviKgGQ==
X-Received: by 10.194.56.230 with SMTP id d6mr8347301wjq.208.1475290075813;
	Fri, 30 Sep 2016 19:47:55 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:55 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:10 +0200
Message-Id: <1475290031-20568-22-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 21/22] testimage.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:55 -0000

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
 meta/classes/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index a908f92..5ddbecb 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -164,7 +164,7 @@ def testimage_main(d):
                 msg += " (skipped=%d)" % skipped
             bb.plain(msg)
         else:
-            raise bb.build.FuncFailed("%s - FAILED - check the task log and the ssh log" % pn )
+            bb.fatal("%s - FAILED - check the task log and the ssh log" % pn)
     finally:
         signal.signal(signal.SIGTERM, tc.origsigtermhandler)
         target.stop()
-- 
2.7.4


