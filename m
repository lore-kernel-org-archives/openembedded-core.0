Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id EFB636107D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:28:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id m10so375134wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FuLC2uMK+UALHG55w7QHyNlRK2J1rpWamhDpPrYYPd4=;
	b=GhoU1+JX1c/04zLcTxZxydjpcEJDOGxe3LZdLffyky7r5K+Pgp9ihIC7igtdVnqSLy
	oDdqxGbWxDNBjwaPl3g4Z90R+wSz7CatmRZd2zrBupEKUk6txGPHJzUzM3mNao6kd0JG
	wU1Nmeq2KyPPugGO8Ue+xksHMvCRjG5/oh5rXWiiKJv+TqQB2zACeN2SdlcyATcyKX6n
	dZMZwKUUb2+/2i85as6Vv+nJj9PvPNumfZbFMPI2qeyTTiMibCk22zz4u5d09eC99AMT
	kTIFP575BMbop9GwwodSLrcizQssm27QsELCsOifyagRSu3VVL+Avfrb09PWv5yqSiWG
	2hew==
X-Gm-Message-State: APjAAAW5dXc3XDGYXEJTvvMj8Z8AWc8dGJ93Cq5PpwqUzbaCV8LaKjBV
	OPq+drgsK7iqmL0uqaYbTuKpHTO4
X-Google-Smtp-Source: APXvYqxIVFPoPn3KFqf6vhzpckyeSkaVAuj2+WHNAuSrrHv7pLD+Oew+6+Z5omJ9HqWpUau380LX/w==
X-Received: by 2002:a05:600c:20f:: with SMTP id
	15mr130323wmi.128.1580750894468; 
	Mon, 03 Feb 2020 09:28:14 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	f8sm10253657wru.12.2020.02.03.09.28.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Feb 2020 09:28:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2020 17:28:12 +0000
Message-Id: <20200203172813.12800-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH 1/2] oeqa: modernise subprocess: preexec_fn=os.setsid -> start_new_session=True
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
X-List-Received-Date: Mon, 03 Feb 2020 17:28:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

start_new_session was added to python3 subprocess in v3.2 and
is meant to take the place of the common use of preexec_fn to
call os.setsid() in the child - as done here.

Update to use the new equivalent.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oeqa/controllers/masterimage.py | 2 +-
 meta/lib/oeqa/core/target/ssh.py         | 2 +-
 meta/lib/oeqa/utils/sshcontrol.py        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index 0435dfa125..0bf5917e48 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -97,7 +97,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
         if self.powercontrol_cmd:
             cmd = "%s %s" % (self.powercontrol_cmd, msg)
             try:
-                commands.runCmd(cmd, assert_error=False, preexec_fn=os.setsid, env=self.origenv)
+                commands.runCmd(cmd, assert_error=False, start_new_session=True, env=self.origenv)
             except CommandError as e:
                 bb.fatal(str(e))
 
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 63fc9468b3..090b40a814 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -247,7 +247,7 @@ def SSHCall(command, logger, timeout=None, **opts):
         "stdin": None,
         "shell": False,
         "bufsize": -1,
-        "preexec_fn": os.setsid,
+        "start_new_session": True,
     }
     options.update(opts)
     output = ''
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 49a07264c6..36c2ecb3db 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -23,7 +23,7 @@ class SSHProcess(object):
             "stdin": None,
             "shell": False,
             "bufsize": -1,
-            "preexec_fn": os.setsid,
+            "start_new_session": True,
         }
         self.options = dict(self.defaultopts)
         self.options.update(options)
-- 
2.23.0.rc1


