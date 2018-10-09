Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3AE79202
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Oct 2018 12:48:28 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id i8-v6so1743234wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2018 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=rP4iWn2V/SZTyvcI5TlODnk68ET//Qu4TrUu1+N5gCY=;
	b=BIgk9J5rXEtdAQYyp1vJuDJRrqhxINfpBakGpRbYxcA8Vrr6+YP7Yrwp92t0Ok3aeG
	Z/qx+MCSFViAoWz6dnplgDJpOuRub2ZtEpgRbTMTzDnhgcfGuavbzjhHs7+n1MLjq4Y3
	wjkFiWy2E4M2SNHm+u9J+bcZCLqHWiXPzxZEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rP4iWn2V/SZTyvcI5TlODnk68ET//Qu4TrUu1+N5gCY=;
	b=UjQ1aZTrPZMJlV7VhLMkE0yN3RNIxneKZvrocgpoTWT2BbSMkMBr+29kY8rusYIDpd
	jC8Zdc4wYHYbYDBJEbLrsKRFypNJalQnwi/EMDkpY2nFUtTPfCVzx+VYSiSCAvaVO8Sk
	uZXasC4tneUbVvK2ypSsY7GlxMUmP+HFm75sUMV3CXZz6BJAIs5QXWjm0m08beeDuXdj
	h+2xwBsdnDWQDlz/GJuWQWsf7c51SmO0vPiOLDJLft/xBCnW4f5x/ve2vvI/8WCSHSf1
	V3Cbja6cHug45tu2hLtzyj+CpHCcMJ3WBOueIrwDH23TG3ZEACRji5piBF3eHHIzh+5s
	lE2w==
X-Gm-Message-State: ABuFfohBWfM5ULSH13sS3e0BFBG7fPN6ZNAJgyHT/o4H+RycwexofDEG
	9OsxbGGVar56xgPbivov0CwgwD+omg4=
X-Google-Smtp-Source: ACcGV62yN/FMQzipPXrYFVoIqEuZq+nnLJKd+taZbd7klRFQG/DY9fhZLDq5wkFNYBxN8TWiYivxUQ==
X-Received: by 2002:a1c:1c4e:: with SMTP id c75-v6mr2022114wmc.4.1539089308144;
	Tue, 09 Oct 2018 05:48:28 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i4-v6sm21599592wrs.87.2018.10.09.05.48.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 05:48:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2018 13:48:24 +0100
Message-Id: <20181009124825.11864-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] qemurunner: Remove the signal handler before stopping qemu
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
X-List-Received-Date: Tue, 09 Oct 2018 12:48:28 -0000

The qemu shutdown can race with the signal handler removal leading to
confusing tracebacks on slower/loaded systems.

Remove the signal handler first before shutting down.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index c3c643d7107..dfab1bd5f11 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -350,10 +350,10 @@ class QemuRunner:
         return True
 
     def stop(self):
-        self.stop_thread()
-        self.stop_qemu_system()
         if hasattr(self, "origchldhandler"):
             signal.signal(signal.SIGCHLD, self.origchldhandler)
+        self.stop_thread()
+        self.stop_qemu_system()
         if self.runqemu:
             if hasattr(self, "monitorpid"):
                 os.kill(self.monitorpid, signal.SIGKILL)
-- 
2.17.1


