Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BA4CD129A
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 07:02:55 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web11.5340.1712127766027128390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 00:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=QqpoY/tS;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QDsYtsKrRnLLJNZwGZUv4czlgZYHgZsXDP0svEolK0I=; b=QqpoY/tS2qnZI9pposwsItdaP1
	+ukJ0xoGDFyXIaZN8ZZvhMGuyj3RVKQmAq3AitNo9s7DA34dzZWj/SPfAuxpygPnjQAwEsvuaEbb0
	cJ4OL4ks8YP/eRVRdizUr0v5wHARepJ3ovyh7MY1Gi4p3rDNDynEAWr6CSYj83nFNeXIO86dkTo2q
	H1bkKuI4hUtA6YBu2rhyIqoAj++9yvrb6KwixKkN/Q2APuuJMFJ+U4436h4SPNXMALrQonLG9Wy5h
	+NdVsM6DWf/fCOSJvmYw9o7uouTC8qE0kybFPwbvAS4GJj5gHAwJsOb3c1CcCvMVxMDQEKQpHbMQH
	4a9W95fw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rrudv-0007UY-19; Wed, 03 Apr 2024 09:02:43 +0200
Received: from [185.17.218.86] (helo=rap..)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rrudv-000NUU-1N;
	Wed, 03 Apr 2024 09:02:42 +0200
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	=?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH 5/5] contrib: add python service and systemd unit to run shared jobserver
Date: Wed,  3 Apr 2024 09:02:04 +0200
Message-ID: <20240403070204.367470-6-martin@geanix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403070204.367470-1-martin@geanix.com>
References: <20240403070204.367470-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27233/Tue Apr  2 10:26:21 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 07:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197909

For CI setups that might end up building multiple yocto builds in
parallel, a shared jobserver can reduce the total load of the system.
Setting up such a jobserver is simple, but it does require a process
hanging around to keep the jobserver fifo open (to avoid blocking token
requests).

Add a simple python script that creates such a jobserver fifo and waits
forever. Also add a systemd unit file to start the python service at
boot.

The systemd unit can be installed in $HOME/.config/systemd/user/, but
one might need to add a droplet config (i.e. `systemctl --user edit
jobserver.service`) to setup the PYTHONPATH variable to make the python
script loadable.

Signed-off-by: Martin Hundebøll <martin@geanix.com>
---
 contrib/jobserver/jobserver.py      | 78 +++++++++++++++++++++++++++++
 contrib/jobserver/jobserver.service | 10 ++++
 2 files changed, 88 insertions(+)
 create mode 100644 contrib/jobserver/jobserver.py
 create mode 100644 contrib/jobserver/jobserver.service

diff --git a/contrib/jobserver/jobserver.py b/contrib/jobserver/jobserver.py
new file mode 100644
index 0000000000..41b085f47f
--- /dev/null
+++ b/contrib/jobserver/jobserver.py
@@ -0,0 +1,78 @@
+#!/usr/bin/env python3
+
+from pathlib import Path
+from threading import Event
+import argparse
+import os
+import shutil
+import signal
+
+resumed = Event()
+runtime_dir = os.environ.get("XDG_RUNTIME_DIR", "/run")
+
+def signal_handler(signum, _frame):
+    """Wait for an external signal exit the process gracefully."""
+    resumed.set()
+
+
+def main(path, user, group, mode, jobs):
+    """Setup a fifo to used as jobserver shared between builds."""
+    try:
+        path.unlink(missing_ok=True)
+        os.mkfifo(path)
+        shutil.chown(path, user, group)
+        os.chmod(path, mode)
+    except (FileNotFoundError, PermissionError) as exc:
+        raise SystemExit(f"failed to create fifo: {path}: {exc.strerror}")
+
+    print(f"jobserver: {path}: {jobs} jobs")
+    fifo = os.open(path, os.O_RDWR)
+    os.write(fifo, b"+" * jobs)
+
+    print("jobserver: ready; waiting indefinitely")
+    signal.signal(signal.SIGTERM, signal_handler)
+    signal.signal(signal.SIGINT, signal_handler)
+    resumed.wait()
+
+    print("jobserver: exiting")
+    path.unlink()
+    os.close(fifo)
+
+
+if __name__ == "__main__":
+    parser = argparse.ArgumentParser(
+        prog='Make jobserver',
+        description='Simple application to instantiate a jobserver fifo and hang around',
+    )
+    parser.add_argument(
+        "--mode",
+        help="Permission to apply to jobserver fifo",
+        type=lambda v: int(v, 8),
+        default=0o0666,
+    )
+    parser.add_argument(
+        "--user",
+        help="Username or id to assign ownership of fifo to",
+        default=os.getuid(),
+    )
+    parser.add_argument(
+        "--group",
+        help="Groupname of id to assign ownership of fifo to",
+        default=os.getgid(),
+    )
+    parser.add_argument(
+        "path",
+        help="Path to jobserver fifo path",
+        type=Path,
+        nargs='?',
+        default=f"{runtime_dir}/jobserver",
+    )
+    parser.add_argument(
+        "jobs",
+        help="Number of tokens to load jobserver with",
+        type=int,
+        nargs='?',
+        default=os.cpu_count(),
+    )
+    args = parser.parse_args()
+    main(args.path, args.user, args.group, args.mode, args.jobs)
diff --git a/contrib/jobserver/jobserver.service b/contrib/jobserver/jobserver.service
new file mode 100644
index 0000000000..bbc7167ac0
--- /dev/null
+++ b/contrib/jobserver/jobserver.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Shared jobserver fifo
+
+[Service]
+Type=simple
+Environment=PYTHONUNBUFFERED=1
+ExecStart=python jobserver.py
+
+[Install]
+WantedBy=multi-user.target
-- 
2.44.0


