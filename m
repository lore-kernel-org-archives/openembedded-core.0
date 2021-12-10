Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2256C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 11:08:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5899.1639134500051649241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FF5B2B
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:18 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18FDA3F73B
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 03:08:17 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 1/4] lib/pyinotify.py: Remove deprecated module
 asyncore
Date: Fri, 10 Dec 2021 11:08:11 +0000
Message-Id: <20211210110814.112954-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 11:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159494

From: Robert Yang <liezhi.yang@windriver.com>

When build with nativesdk-python3 (3.10) from buildtools:
/path/to/bitbake/lib/pyinotify.py:55: DeprecationWarning: The asyncore mo=
dule is deprecated. The recommended replacement is asyncio

The pyinotify.py's upstream didn't have any update in recent 7 years:
https://github.com/seb-m/pyinotify

And bitbake doesn't use the asyncore module, so remove the related code.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 bitbake/lib/pyinotify.py | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/bitbake/lib/pyinotify.py b/bitbake/lib/pyinotify.py
index 6ae40a2d765..8c94b3e3348 100644
--- a/bitbake/lib/pyinotify.py
+++ b/bitbake/lib/pyinotify.py
@@ -52,7 +52,6 @@ from collections import deque
 from datetime import datetime, timedelta
 import time
 import re
-import asyncore
 import glob
 import locale
 import subprocess
@@ -1475,35 +1474,6 @@ class ThreadedNotifier(threading.Thread, Notifier)=
:
         self.loop()
=20
=20
-class AsyncNotifier(asyncore.file_dispatcher, Notifier):
-    """
-    This notifier inherits from asyncore.file_dispatcher in order to be =
able to
-    use pyinotify along with the asyncore framework.
-
-    """
-    def __init__(self, watch_manager, default_proc_fun=3DNone, read_freq=
=3D0,
-                 threshold=3D0, timeout=3DNone, channel_map=3DNone):
-        """
-        Initializes the async notifier. The only additional parameter is
-        'channel_map' which is the optional asyncore private map. See
-        Notifier class for the meaning of the others parameters.
-
-        """
-        Notifier.__init__(self, watch_manager, default_proc_fun, read_fr=
eq,
-                          threshold, timeout)
-        asyncore.file_dispatcher.__init__(self, self._fd, channel_map)
-
-    def handle_read(self):
-        """
-        When asyncore tells us we can read from the fd, we proceed proce=
ssing
-        events. This method can be overridden for handling a notificatio=
n
-        differently.
-
-        """
-        self.read_events()
-        self.process_events()
-
-
 class TornadoAsyncNotifier(Notifier):
     """
     Tornado ioloop adapter.
--=20
2.25.1


