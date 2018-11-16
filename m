Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6C34F6C1C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 10:29:38 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so11438213wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2018 02:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=/mt3tL/xE42Rh5SaKwpdJNtVaB5nQNn9JBqR0vJD9QI=;
	b=KNcCpWM+pPfBRMThdWBnOXiOkjmAsUyAwcVVVvmTZk7l5rtIqJvWiPref5jxr4Mcxl
	zcrie2xugN7E/VfeaVCJKJqm8MwxJzqlPzC8gKCNr8VEey40M9s9F2nL0iTUhnn2czVF
	0pHDHN+bwGPyeGB+c93xGvJvJAE50P8UACbHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=/mt3tL/xE42Rh5SaKwpdJNtVaB5nQNn9JBqR0vJD9QI=;
	b=f8frm/OIDm21icX8lFfj38pb2+/GGHnbf+QUbkfl1M+Ikf/cmWJKGcWMDYzctV+CSH
	fCPxJdvZrpLI6gL68eZ8UubNEav4MibvYBqxXn35nVWZRojHxRB9H6MHV2Du9ecATJy2
	yWTKoJEy1VBMGX9m0aZ9gprLxcZa4p0aMgn+MzSg1BkRPh6nqiPIo3EQwxdKgzrjSM8E
	HPr0VpCY1eGUobPM4Irk6R2bSnOe0yAtJOXC2165yNPWl4INg3Zt0V9FFZwtLUkzjBMN
	7Ao1vaBplrHT2yc6VctJbKotQ5xZTqscxaQMKdZycJt4fZxMP9STu2lk/SovrVJRrvCW
	3NKg==
X-Gm-Message-State: AGRZ1gIqlbUnh9F7AqAAZ8iJL9OiwN2PBDbW4Rp8rHDF7FZEkPn7oAhC
	QtsdFKN9UWEQ5v0R92QkZsRjxf4wug8=
X-Google-Smtp-Source: AJdET5cGl7+1k6zAU+oye8a8z9kRhgzMXfosycFYxUcecXGLuiDZDRe+MjB3eKYp7SkjU3/9MXCDag==
X-Received: by 2002:a5d:4344:: with SMTP id
	u4-v6mr8884929wrr.306.1542364178521; 
	Fri, 16 Nov 2018 02:29:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z8sm27523082wrw.78.2018.11.16.02.29.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 02:29:37 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Nov 2018 10:29:36 +0000
Message-Id: <20181116102936.5481-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] sanity: Add check for WSL
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
X-List-Received-Date: Fri, 16 Nov 2018 10:29:38 -0000

Users are starting to expect OE to work under WSL which it doesn't. Add a warning to
tell them about this up front and manage expectations.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4e8eae8946d..374dacf4d0e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -511,6 +511,16 @@ def check_make_version(sanity_data):
     return None
 
 
+# Check if we're running on WSL (Windows Subsystem for Linux). Its known not to
+# work but we should tell the user that upfront.
+def check_wsl(d):
+    with open("/proc/version", "r") as f:
+        verdata = f.readlines()
+    for l in verdata:
+        if "Microsoft" in l:
+            return "OpenEmbedded doesn't work under WSL at this time, sorry"
+    return None
+
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 def check_tar_version(sanity_data):
@@ -625,6 +635,7 @@ def check_sanity_version_change(status, d):
     status.addresult(check_tar_version(d))
     status.addresult(check_git_version(d))
     status.addresult(check_perl_modules(d))
+    status.addresult(check_wsl(d))
 
     missing = ""
 
-- 
2.17.1


