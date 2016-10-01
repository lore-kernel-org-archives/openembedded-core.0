Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53A986FFC7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:47 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so5777406wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Vdfpc7Lago/ob8Xt3/GJ1sFaLUPLI8frYWBeRryr9E=;
	b=YiSHn3kn8lPZgViot36I8eAyApMdA57SR6RTWLS8FtlkkvaPMerkpSkV0xobPiL1fs
	kYwskMGZuLfEOpDaLJgL3crsA07DhPZo5WkfTFkigZAzWz1i0JA5E7jCq+7DEt1lVrS8
	kEb13q0Fyt9bZrz7bMhihnZLkNhvgNBk0XXerWSAMEzwuJx+DPsc7B/g3IYNi7h2Y8dj
	rOxbkRy/G6z3sT1t+aDazAILONCIWw7E7HG9T4hNjb45mCU0xFpUUJUPzPFJnEvsuRX+
	jOs3Mkdvw8cVlQg1yuYu5DaXPVDDHKPppTzgwpqt2Ow8RLVoMwhhdnV/oDfXyC5AWpSl
	T31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Vdfpc7Lago/ob8Xt3/GJ1sFaLUPLI8frYWBeRryr9E=;
	b=WPydkmXaBGZFMd4FvClrvr2C6HTvQBIsb2e2+6bbKTGkqQ44/8RN/i4ohdFHg49uFy
	vul3LFaazHWf0R3bE+H9pwQYQMYw7pkGo00fpvHZbAlE/sNlrRKsJUHmiMGXM+SqEg0P
	naXHJLuia88QghKnmGsbPj3roc6PNDnxwDRcMeWooeheeecuwT+jxCtCKFCxO4le993m
	te1ZCmd4dYIREk3+DB/iNmUnxgS16fPZWJF4NHEGy+rRmM7PtbgUHv6RqDZHHH7655KB
	eiNBWViCjqM5NgJvYfYtAGMILbO0XpNEmznFyudKDvB9i1gvbMhTwVq6MhwZaRx4yAHt
	6Rmw==
X-Gm-Message-State: AA6/9Rnqle1qZAgbjUbiYNENVyZ9OnIUQ/0LwAFxCLLJ/ejAnxtDSwCccISmHS6OywN0Bg==
X-Received: by 10.194.141.203 with SMTP id rq11mr9991109wjb.112.1475290068454; 
	Fri, 30 Sep 2016 19:47:48 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:48 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:01 +0200
Message-Id: <1475290031-20568-13-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 12/22] systemd.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:47 -0000

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
 meta/classes/systemd.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index db7873f..d56c760 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -165,8 +165,7 @@ python systemd_populate_packages() {
                 if path_found != '':
                     systemd_add_files_and_parse(pkg_systemd, path_found, service, keys)
                 else:
-                    raise bb.build.FuncFailed("SYSTEMD_SERVICE_%s value %s does not exist" % \
-                        (pkg_systemd, service))
+                    bb.fatal("SYSTEMD_SERVICE_%s value %s does not exist" % (pkg_systemd, service))
 
     # Run all modifications once when creating package
     if os.path.exists(d.getVar("D", True)):
-- 
2.7.4


