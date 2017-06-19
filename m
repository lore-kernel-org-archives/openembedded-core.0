Return-Path: <zeenix@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7A90378170
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 15:12:59 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 70so16984946wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=axJleG6vpzvK82Lv2gxNe6w1EuBaUtDJnJAu0ecLb8o=;
	b=MteoP/3Ep9ysO4FB/joEDbNU9KogMX2GYj2Am8HWqmYjW+8Zt2lQcfp4WwNkqm3hlh
	vFfw2DlerXKjGs3VOZmZ1K6yJB3Fp+qT4yJ/EnpxQiWI8G45AgftNRXRn5O+4y5JElDq
	QjotAJqbans41x95ssKFdaGzLaPZbHV7rXliimnFh8RQ+sv83kNWAm/JUfQy0UIHPqOs
	ryW+iLod0ngzomYoUX2vN2LH/KKdpIH2PVnhUFe6uNM9APAMSQlCOyo4I4w4OH0USgAl
	/0coHmH1xsRxw+LeH2srpYDXTdo2aeUV5ozqdColCPkuQpo2uBeplpsYgpqJDPQEIo5Q
	mURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=axJleG6vpzvK82Lv2gxNe6w1EuBaUtDJnJAu0ecLb8o=;
	b=rA/ziO3GgouawB6hBrrHVjQPBaX+PeBGZWeQ+NyjQUfEyeDMxkrIuhPgrYPApYWpns
	rJsqrqvBGhLjAfgAi0j0Y7fdS7qFs5u7ayyW+bxl+AFY9H8prpeFSYTsQmhG0mVdYsrA
	4grPphlCCp93+3iDb4XL6DUXZgi17ZzTQK4QR2Is6pMxXR7ulh1wLxdW+ZLMWiTUd54o
	viPG4aSwy6gbgQFwlV9GC/mRY/ghX/YIe/8PoeGAU/vK1rmFSKs/inCopf+QOGHxU+5W
	jslMu+Nf2YWd/NqGbxTMOghmyWz7hiRGG+RFFSGTCYqJX8Qu8Y5JoiPDWi9Voo6BhnD3
	urZA==
X-Gm-Message-State: AKS2vOzQ4vGxTA89ZsJE2WCHkQjuUdysjtzS8MlnkEugqI7N+m5ZHgW2
	6BMBgYqg7ls7ZhokP6U=
X-Received: by 10.28.236.205 with SMTP id h74mr16127153wmi.58.1497885180117;
	Mon, 19 Jun 2017 08:13:00 -0700 (PDT)
Received: from zeelaptop.luxoft.com (h-79-136-12-196.NA.cust.bahnhof.se.
	[79.136.12.196])
	by smtp.gmail.com with ESMTPSA id c55sm7996108wrc.7.2017.06.19.08.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 08:12:51 -0700 (PDT)
From: Zeeshan Ali <zeenix@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 17:12:10 +0200
Message-Id: <20170619151210.7692-5-zeenix@gmail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170619151210.7692-1-zeenix@gmail.com>
References: <20170619151210.7692-1-zeenix@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v3 4/4] sshcontrol.py: in copy_to() always use scp
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
X-List-Received-Date: Mon, 19 Jun 2017 15:12:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Erik Botö <erik.boto@pelagicore.com>

The current implementation is broken when the localpath is a link.
Then only a symlink would be created on the target, instead of copying
the actual file.

[YOCTO #11524]

Signed-off-by: Erik Botö <erik.boto@pelagicore.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 05d6502..d292893 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -150,12 +150,9 @@ class SSHControl(object):
 
     def copy_to(self, localpath, remotepath):
         if os.path.islink(localpath):
-            link = os.readlink(localpath)
-            dst_dir, dst_base = os.path.split(remotepath)
-            return self.run("cd %s; ln -s %s %s" % (dst_dir, link, dst_base))
-        else:
-            command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
-            return self._internal_run(command, ignore_status=False)
+            localpath = os.path.dirname(localpath) + "/" + os.readlink(localpath)
+        command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
+        return self._internal_run(command, ignore_status=False)
 
     def copy_from(self, remotepath, localpath):
         command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
-- 
2.9.4


