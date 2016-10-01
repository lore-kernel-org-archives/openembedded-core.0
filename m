Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 69ABC71957
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:46 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b184so5768875wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lmMvWFYD49JFs1wthacqWM0+jsbaTR2gzisW3RT58HI=;
	b=Gp8VE9c5b770uzEy6RhmjNTMP3JEmzAmPKNkJfIyLLXtBPJWT0kCA6bjkFIVHNGWw9
	BE4dLJ576qGM5mWvNptmNCvXly3WDZjaHw7p+kCdxwpITGsSfnQPp6bqFIRiY+UekKy7
	/uk8OHPLD9tpev9VUehucTsW6mIUBDFVLozC6pX2ehVdN5Fk15tLTlWI8B/6vJNcBKEE
	dwe6O7kHJiECMoFXgpIcWW2N2q8Bfmoar9IjA1canxEB4MIIt0yddXZwh1axY+f5ZkKe
	HQT8R71+Je/VsWGXhh3goczzbvvmQ04yVlTqjf6XsaTa2D2inMff2zRrcIcu5fa2zvEc
	KuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lmMvWFYD49JFs1wthacqWM0+jsbaTR2gzisW3RT58HI=;
	b=PbOzKt/9r/EkN7eTHtbJvP6LAbu5oE9Brid9smzIhziy+qY4wekEZypmwj3nfu6ilJ
	s1zUCuiBqEK/PddFR1wW6IhxoTgq1WsgHViqDBvsfZWzLQ/jZAdA7Jo+PPGLXYMn8CyQ
	TbGqW7f7h/asGpowRUyFsNZpwGAGG15Bo5zjiH2r0xlcguRlydNTzCktDgVURwZYqZpc
	OFk+6t5dVGgMym28+suaoW/2OsP0RGT9yyBh9Zi7p4ZIQBZ5hcMjR1MChyos6kse2Y8r
	gZoG98JmW/h1TtNo59T4vE/t7sB82/bvM5jionFQQ8zXHJEXaCKOakXXU9NRQwunWPeP
	PkWA==
X-Gm-Message-State: AA6/9RmZc+hgShVPkcYZ9v+nKpVIUiFSVkrC4qBd75ekWizPzxr0MwlysT4MsbomIWLQDg==
X-Received: by 10.194.104.9 with SMTP id ga9mr8554592wjb.23.1475290067729;
	Fri, 30 Sep 2016 19:47:47 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:47 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:00 +0200
Message-Id: <1475290031-20568-12-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 11/22] license.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:46 -0000

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
 meta/classes/license.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index ad12db4..da4fc3e 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -465,7 +465,7 @@ def find_license_files(d):
             pass
 
     if not generic_directory:
-        raise bb.build.FuncFailed("COMMON_LICENSE_DIR is unset. Please set this in your distro config")
+        bb.fatal("COMMON_LICENSE_DIR is unset. Please set this in your distro config")
 
     if not lic_files:
         # No recipe should have an invalid license file. This is checked else
@@ -477,7 +477,7 @@ def find_license_files(d):
         try:
             (type, host, path, user, pswd, parm) = bb.fetch.decodeurl(url)
         except bb.fetch.MalformedUrl:
-            raise bb.build.FuncFailed("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF', True), url))
+            bb.fatal("%s: LIC_FILES_CHKSUM contains an invalid URL:  %s" % (d.getVar('PF', True), url))
         # We want the license filename and path
         chksum = parm['md5'] if 'md5' in parm else parm['sha256']
         lic_chksums[path] = chksum
-- 
2.7.4


