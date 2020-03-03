Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id DEF9660691
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 16:05:14 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so3879013wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 08:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TnrwhrMOFQ+Tw1jKrKYVxWC2Z4NxYgxf1h6PqgKFYhM=;
	b=Xqo+uWoW7xnHdBxJ7lWu7MwcgEK6q0peUPBHNDHyP2kZlcUCapLHhUamxwZ29aK38i
	tzE/YNBEDBRoOHn/44+7zMcS2SwJVv6bmcPTSjAT0HOXG6IfLP6ifgpqCDNaIjzfeAZw
	m2LTtMzdEREitzldKBcLLjGbsHuI1Hy3uPVxq6T9QZPjO0f+IzgrDPKsXsfxfW6Zzzkz
	hnDHnJ25OkBFHjr2T4KLbzoVXDNM60/AjvvoaCoV51EL5Y2JjmfT51sZ4fglpqLik5rv
	VWsVfifEq1z3vDgmOv5b/DytMFxkrvn7liO0IAib+eA0K8NRbJZWLWO9OGg7JMkwMFMJ
	i/Vw==
X-Gm-Message-State: ANhLgQ05AlpAIF4t5l5cIbMyue0swWgj7laQ7neIn/tTESTXf3J7XU1u
	6nYDkGWLA9ck3BJJrifHdwbmSEk+
X-Google-Smtp-Source: ADFU+vviMlj3nEKIC7Bt/srILkM6qBYJI8voAJL8CY68UIoXc18pP75bQy9QQfCOM0wUH9b2CKbOow==
X-Received: by 2002:a1c:29c2:: with SMTP id p185mr1447481wmp.79.1583251514984; 
	Tue, 03 Mar 2020 08:05:14 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e8sm35335861wrr.69.2020.03.03.08.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 08:05:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2020 16:05:10 +0000
Message-Id: <20200303160513.17645-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH v2 1/4] lib/oe/utils: allow to set a lower bound on returned cpu_count()
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
X-List-Received-Date: Tue, 03 Mar 2020 16:05:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be needed for making xz compression more deterministic,
as xz archives are created differently in single- vs multi-threaded
modes.

This means that due to bitbake's default of using as many threads
as there are cores in the system, files compressed with xz
will be different if built on a multi-core system compared to
single-core systems.

Allowing cpu_count() here to return a lower bound, will allow
forcing xz to always use multi-threaded operation.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/lib/oe/utils.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index e350b05ddf..aee4336482 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -248,9 +248,10 @@ def trim_version(version, num_parts=2):
     trimmed = ".".join(parts[:num_parts])
     return trimmed
 
-def cpu_count():
+def cpu_count(at_least=1):
     import multiprocessing
-    return multiprocessing.cpu_count()
+    cpus = multiprocessing.cpu_count()
+    return max(cpus, at_least)
 
 def execute_pre_post_process(d, cmds):
     if cmds is None:
-- 
2.23.0.rc1


