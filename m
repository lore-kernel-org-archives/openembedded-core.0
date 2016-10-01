Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29F6071979
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:48 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b201so593556wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9I4kOx9ipWJDQ8aUjbIZX3ddSB5rw3Sd8MXsoR7fISI=;
	b=nJkcVjeHi9Vz4/PxQZVE3GVhK2C5m3unehbqZ2fNKYEoh1bSEzyNfLlaZgLphmbEXs
	zyW4UWEZNns1On46twOz68lsO9HDmfHHD5SgE3ImNq3hPJ8NvEWMJEfg/nncvwmidQPB
	zm5gTy6wVPJiAsFUpcd5Lkp+yHXMCsHRWPrVCl8JgEwZ5MD+KbjU0OPHGHbmKQaDlmZ9
	USWdwEXdyzqJM6hFkguODB4RrAMWCWgIg2B85yxsY+lMvHIjOqoZcOKvdMjCSBwwMqOF
	YJzL0bH45kKk6+hoZ7yj+6F6q9+PQ9WRm1MBvoK6Yhmqlh7le/LuS19apuGl/nx5taJj
	hXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9I4kOx9ipWJDQ8aUjbIZX3ddSB5rw3Sd8MXsoR7fISI=;
	b=H9LFYjpUsDUpkHZX6AZKbuOtgHY1t0V+pVHye/wCnwzfPV3TjZxF46g0LCideL63jw
	cTY6G1qBRCn8C3B4nShFGoGnet+eRiJ/1ndsq4e+c1JKUJvrTCUHnIYfW4QZuD52x9kx
	nPTp0YGH4t8a20C3RltpVDH2JnZJV7hMNeH1kcuQAh4GbqcCk+DgyEeegzLn0BYyYDj2
	RjTk6xuKydcDTN9sIcRE3Ms/k+47ik6iDO70mlF2O12te10WwtcJ1lWJsv2AdcVeLdq5
	Yi4Jy1mZ8ps5iIZcbzoMzJP8UxrXuN77NmxKhM7Ywf0PrkGoM2+TnanvATzDkEwyNyDI
	D/fQ==
X-Gm-Message-State: AA6/9Rnke6VOVjjrDDJ3jbd5JP9zK1GHpquRpiOB3QlMGZzXy6NZ1bMnRts6PovIVotDsQ==
X-Received: by 10.194.112.169 with SMTP id ir9mr9077417wjb.24.1475290069499;
	Fri, 30 Sep 2016 19:47:49 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:48 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:02 +0200
Message-Id: <1475290031-20568-14-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 13/22] gtk-immodules-cache.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:50 -0000

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
 meta/classes/gtk-immodules-cache.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 3a4634c..ebbc9de 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -84,6 +84,6 @@ python __anonymous() {
         gtkimmodules_check = d.getVar('GTKIMMODULES_PACKAGES', False)
         if not gtkimmodules_check:
             bb_filename = d.getVar('FILE', False)
-            raise bb.build.FuncFailed("ERROR: %s inherits gtk-immodules-cache but doesn't set GTKIMMODULES_PACKAGES" % bb_filename)
+            bb.fatal("ERROR: %s inherits gtk-immodules-cache but doesn't set GTKIMMODULES_PACKAGES" % bb_filename)
 }
 
-- 
2.7.4


