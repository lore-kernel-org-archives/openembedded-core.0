Return-Path: <gizero@gmail.com>
Received: from mail-wr0-f179.google.com (mail-wr0-f179.google.com
	[209.85.128.179])
	by mail.openembedded.org (Postfix) with ESMTP id 260E27840D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 09:19:29 +0000 (UTC)
Received: by mail-wr0-f179.google.com with SMTP id f21so120103990wrf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 02:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Tg00A1eRr759S17KBSVULGI/G4Av5uVVmtcCXF7+V50=;
	b=FIALhQ/0GKViqdTZUq5OrJkCKQuTuvftNTGusY3+ZQ1EoTLFqApPPtuqWlM1STZRbS
	fQB0GUOeu9XRM4nAZrdWa6Vo6wCEts2Jywik2VBG75+y5YZWBNhLl/VUWYFbG83Zp9so
	LYnun05qR0rd2r44Yt6hYQGVJUxKeA4Ozgj5jpQ1SyeCCJRtBPhdX62K+S98mlj3QT7R
	XtLpn03INuUDgkDRI11/aua14O9hATYYF+Pc52bDaULsstIXpcow7MFPjTNQzsQ2i6j+
	mJkssvvki1SF2EtK4anNgz+YW/RAIKG87c+SgaNhHanvk1BLdiasUPpf5pl1ZyD/BmNR
	TvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tg00A1eRr759S17KBSVULGI/G4Av5uVVmtcCXF7+V50=;
	b=scBun+Vfz/lONLSklKPmeUxjXa/wv3fhrwcPzNMY23Aq4lBxVrsGvC+IHFEaNk1Ue5
	Hh8RSmyerjagsVG17GI6zPK7X8K8lWfWHtGjOQprXdFsQ6ECtqM/i/tMfuR25b2WwOoO
	tmwU9IhJYOOwAYvrYC4XEKCA0iTofY2nuj6uFSL3zDcuE/oX0gvJ+t4Naih0iq6wfHq5
	+P0yha1Cz5NvzdeH8lbAmzdduBD/cgrAFSrATIaoV+equm8Q7QxAoIq19TD4Qie6T1tz
	iz22LysDJdrDqz6ysI5Mj0KodS48nc8cgGNRuUQN5Cz8FxVY1HZOeKSozFjKXFn3+0Fh
	wWnQ==
X-Gm-Message-State: AIVw111NIBtAzI8J4ngGfi3Lb9fl956XTqImHUwNT/CcaBJaq9IBAYDS
	Mclqi9T5Ac+IWbrY
X-Received: by 10.223.154.203 with SMTP id a69mr11858060wrc.139.1501492770468; 
	Mon, 31 Jul 2017 02:19:30 -0700 (PDT)
Received: from gizero-desktop.tw.it
	(host193-245-static.58-79-b.business.telecomitalia.it.
	[79.58.245.193]) by smtp.gmail.com with ESMTPSA id
	l25sm2914103wrb.44.2017.07.31.02.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Jul 2017 02:19:29 -0700 (PDT)
From: Andrea Galbusera <gizero@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Jul 2017 11:19:17 +0200
Message-Id: <1501492758-29076-1-git-send-email-gizero@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] devtool: sdk-update: fix pulling updates from git
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
X-List-Received-Date: Mon, 31 Jul 2017 09:19:30 -0000

Commit 4657bc9d165e51981e034e73e7b92552e873eef7 replaced the git pull logic with
the git fetch + git reset --hard combo, but resetting to HEAD does not really
pull in new commits from remote... Replace with resetting to the upstream branch
instead.

Signed-off-by: Andrea Galbusera <gizero@gmail.com>
---
 scripts/lib/devtool/sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/sdk.py b/scripts/lib/devtool/sdk.py
index e8bf0ad..f46577c 100644
--- a/scripts/lib/devtool/sdk.py
+++ b/scripts/lib/devtool/sdk.py
@@ -155,7 +155,7 @@ def sdk_update(args, config, basepath, workspace):
         if os.path.exists(os.path.join(basepath, 'layers/.git')):
             out = subprocess.check_output("git status --porcelain", shell=True, cwd=layers_dir)
             if not out:
-                ret = subprocess.call("git fetch --all; git reset --hard", shell=True, cwd=layers_dir)
+                ret = subprocess.call("git fetch --all; git reset --hard @{u}", shell=True, cwd=layers_dir)
             else:
                 logger.error("Failed to update metadata as there have been changes made to it. Aborting.");
                 logger.error("Changed files:\n%s" % out);
-- 
2.7.4


