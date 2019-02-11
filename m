Return-Path: <wbourque@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9C5447C439
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 20:00:59 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id m1so288834otf.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2019 12:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=zl5owTxKClUFn5CZ5dUSXzNzFJNfZ3Ik096s8ffLKKY=;
	b=tJTMIGKtcBa2TNiiI+W1eNvlMmze1TohSHVFcUsifqnFkmkwQz1yqNdbfZxKWuf8YZ
	XjcH2oLL2/vkspK5TKG7KZfuYg6UI8DU7VDHNIVGw5N77JRZFYahatGA7l2dZLm3Jxw7
	h1UebI9Aqa7o86VtW9iy8ySHuR4SlNh2LgGPT3M6S6T1JA/6PoW1O6ZQfQYSAE+SokKZ
	pGjuxpG0XRJ3TnFFKCprrpJ9DTn1+ueK4I84LLcfTteQD3y6XmYp2bj5t53HfuPgqIOB
	RZ41Cxkl0VsMYD+2r+H/zh65u5gueHiNc8PwFuNmyWswaolVDv/jmuXZw94ceBFb3In7
	TrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=zl5owTxKClUFn5CZ5dUSXzNzFJNfZ3Ik096s8ffLKKY=;
	b=Kjo2ZnVBx8VPDteNGd4sNIlP8l/uuXE+vWEZKePeu8aGcpaQBT7tBp+NB4jCYrsX9H
	UOFRcW5N9eT9vOwMU0CRxuHlmUX1T5Vf4reqKtBCI2N5QX02aKvKQZA7nI6ZUzMcJa+z
	Wbx3EUump3rfKJCJY+nvyp0vXj8dNzewMzIl9jUZhmBUSDz/M+oUdlu+2AJjmUbmVUro
	no/x9CfhLAiKfHDn7avSV/hr4VgS8XYdMSaAFDxcMnuc2ZSg8eg1hsEMjUhqjagRAP8e
	GeDwSs8G5A+JbGJCFlDMXPPJvvEcI8rIx/A8yZEXHzBGOE+9XGXqdwXwazoz3yd3dS+K
	6osQ==
X-Gm-Message-State: AHQUAuaIAGxSt6fmO/SMocBtTQy6Nv4HqHpYD2OkM4HiEFUKnu8SALh1
	byoyLImXPPxdQssJ1wcU+XZ5cvJCji/+Uyb+EeRDr4UmlA4=
X-Google-Smtp-Source: AHgI3Ibt7cEVrdCgqlKKcpXJGTpUO6vDUJn9VAFNEL38y4joXRCiHSev9Kj8dvccTELHWKPcqxjg5RmIpao4sdo9pA4=
X-Received: by 2002:a9d:7f8d:: with SMTP id t13mr19478526otp.281.1549915260271;
	Mon, 11 Feb 2019 12:01:00 -0800 (PST)
MIME-Version: 1.0
From: William Bourque <wbourque@gmail.com>
Date: Mon, 11 Feb 2019 15:00:48 -0500
Message-ID: <CANBSh+Mn5KqNz21ySUhtx_PDnujqGEo65wJwiS4jS2N0ASEq1Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] wic/engine.py: Load paths from PATH environment variable
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
X-List-Received-Date: Mon, 11 Feb 2019 20:00:59 -0000
Content-Type: text/plain; charset="UTF-8"

Load self.paths from environment variable and
if it fails, fall back to hardcoded list.
This is required for users that would need to load
different e2fsprogs binaries if their system's ones
are not recent enought

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 scripts/lib/wic/engine.py | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index 4662c66..880e464 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -244,8 +244,13 @@ class Disk:
         self._psector_size = None
         self._ptable_format = None

-        # find parted
-        self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+        # read paths from $PATH environment variable
+        # if it fails, use hardcoded paths
+        try:
+            self.paths = os.environ['PATH']
+        except KeyError:
+            self.paths = "/bin:/usr/bin:/usr/sbin:/sbin/"
+
         if native_sysroot:
             for path in self.paths.split(':'):
                 self.paths = "%s%s:%s" % (native_sysroot, path, self.paths)
-- 
2.7.4

