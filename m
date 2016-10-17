Return-Path: <ulfalizer@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id C202B71BCB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 18:30:36 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v138so14901636qka.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 11:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YhsBBmIHuarua00T+dF7SJ1uXLN9+F74jRngSznu8Cg=;
	b=HJ7YDqEieDL3jkzUGQ6oAfezZvwnTUqZnFLH7q3CQ3OMp7lQ6enJpLQXUCHD0PJoIX
	38QX4BDuyMTx6XPoaWQlsEtajyT+5Q5w1z3UJYmaDVVuxSoK4z2wpdNNoH++3eFFBDE7
	vhGwgrMxPWYg8l92LuHaH4ZUpSMtz0NYa68AeaGY6Y+ybKYwbwaumlHCgUgmipZbCSsA
	a8xqL+6TYnUZwrXwXS6EB50J4Hg0WEQp/cvt2Q6f57wHV+iqqR3/rskGMmsft2SkhRpP
	6PBIqdQS8vKwfUvyNPS/yOvGwa5JWhn7yzVPNznddMqqZ3YL1m6+xCMAX4ovW+2+Jay0
	x/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YhsBBmIHuarua00T+dF7SJ1uXLN9+F74jRngSznu8Cg=;
	b=PsBOWf+kjq4nd6sUySeWLWauxH7ri1HZeGEIweghlhlJgr5Pip+qaxyPw626zukox6
	yPIXXe3Jj94BI0LppfYbj8iQE1cza+WUw/ve+d/Fw/RhqLvbA/L3lrSYzFhIUIWdeHHl
	732vYOPfcwYV4l6g5BnAxohrTHFbE0r9VaRJKATQZlMfAS4fhpljwFYMAuZSexOP5gnq
	K/mLa+xcN4Pzu2hHqah8+1xoGAeOWud3bX7d8hEOmdKBHrz/Rc3uO5tGO8ezst99Qbtw
	uHTgLfS2NXFrZvjHYrUfWXgSF8i2e6Z/hfvrG5k1CJ/E/65RK7Tqbh68WmHW8CjsFX4j
	ONnw==
X-Gm-Message-State: AA6/9Rl7OdJR1CigtV/C7uiHmC1NU0h4JGLlkgPnHe4nKn4OCkRKca3vqNzJ97duKJHfyw==
X-Received: by 10.194.235.7 with SMTP id ui7mr12058821wjc.66.1476729037907;
	Mon, 17 Oct 2016 11:30:37 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:31d2:84ae:c5a7:750c])
	by smtp.gmail.com with ESMTPSA id
	a1sm55188048wjl.28.2016.10.17.11.30.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 11:30:37 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 20:30:27 +0200
Message-Id: <1476729027-5072-2-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476729027-5072-1-git-send-email-ulfalizer@gmail.com>
References: <1476729027-5072-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH v2] bitbake: bitbake-layers: Make show-recipes show PR
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
X-List-Received-Date: Mon, 17 Oct 2016 18:30:37 -0000

Only PE and PV were shown, which might have been an oversight. The
tuples passed to version_str() contain three elements (PE, PV, and PR),
not two.

Also remove now-redundant default 'pr' argument in
QueryPlugin.version_str().

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 bitbake/lib/bblayers/query.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bblayers/query.py b/bitbake/lib/bblayers/query.py
index ee1e7c8..4d6999a 100644
--- a/bitbake/lib/bblayers/query.py
+++ b/bitbake/lib/bblayers/query.py
@@ -28,7 +28,7 @@ class QueryPlugin(LayerPlugin):
             layername = self.get_layer_name(layerdir)
             logger.plain("%s  %s  %d" % (layername.ljust(20), layerdir.ljust(40), pri))
 
-    def version_str(self, pe, pv, pr = None):
+    def version_str(self, pe, pv, pr):
         verstr = "%s" % pv
         if pr:
             verstr = "%s-%s" % (verstr, pr)
@@ -212,10 +212,10 @@ skipped recipes will also be listed, with a " (skipped)" suffix.
                         if not items_listed:
                             logger.plain('=== %s ===' % title)
                             items_listed = True
-                        print_item(preffile, p, self.version_str(pref[0][0], pref[0][1]), preflayer, True)
+                        print_item(preffile, p, self.version_str(*pref[0]), preflayer, True)
                         for (provfile, provlayer, provver) in provs:
                             if provfile != preffile:
-                                print_item(provfile, p, self.version_str(provver[0], provver[1]), provlayer, False)
+                                print_item(provfile, p, self.version_str(*provver), provlayer, False)
                         # Ensure we don't show two entries for BBCLASSEXTENDed recipes
                         preffiles.append(preffile)
 
-- 
2.7.4


