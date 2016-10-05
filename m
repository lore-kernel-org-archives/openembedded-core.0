Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 99F7D719C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2016 20:53:11 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 123so433290wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2016 13:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=91y4papxzpo/UmWofnTEh23e5JPlY9WzaBElQDD7TWc=;
	b=XN8G0GRLIaur6JQzwtkUa1kZ+V6tSKbxX3/PQaAHX/IDnIw+1lDLcLX5H+hdGmKGSR
	ZMbZ8t18CxUautg32li/nCxjFLkxYik9BIJLEonYTqkL9moY5KofjycGKs9riVH4Tltb
	d6MaHRB9iWX8lP+fT3cO5V7tt1Kn03kp4AJAvWfhw93R/MS1LamloEk77p0XDAHO/HX5
	/CgCAnker0OU9MUyV4Xot5UuItn4rXe9m9/oiFcdOc4qwv7LwGkD+sSSROXGsikBleOn
	pQnQsg5csdHslMEbl1Jn3hzGOnsvJN3qVKFRDsWd1kMUbABIr/4ZajH8LWi0gULhwjmJ
	/vrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=91y4papxzpo/UmWofnTEh23e5JPlY9WzaBElQDD7TWc=;
	b=Z6/uHrgh2o8bzADcLiL0gurZclWrcqxhGMwyMDkcwnO7YAnOrjqR9hDrOxWQEMaqdj
	eKJQU8UxUGWmN7QXiYaXHNgiYmZ06v7MRQIGEbkf7bzWnoj8u42vp+c3+0FAOwt7U1G3
	rJzAlHO+3VVmcEVumVbDZ56BIe7+jYpP9AH9uo6OGevJYz9ISg2g6XEy9v7a0OFtlU9X
	O148xgzNJ/+VEZVf/daq1oaTdk/YhmwWo1gKdGxWiCGuHgmJNKT0S+zzS7OBoGaTYWXh
	l1bBteis2RQfqv9vrNie4aQzHppgwA6W+JbN51W9nCe3L0Ygiyd6fAvt3tuUPKMCqen7
	lA2g==
X-Gm-Message-State: AA6/9Rm7ddMG/GrHhroOZF0B6BvGwqXvCBcYA/i1fIv9j1MhXauRTnxRu9xlnASVFx3OXQ==
X-Received: by 10.28.50.3 with SMTP id y3mr10182470wmy.23.1475700792315;
	Wed, 05 Oct 2016 13:53:12 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	137sm31610416wmi.16.2016.10.05.13.53.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Oct 2016 13:53:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2016 22:53:11 +0200
Message-Id: <20161005205311.20940-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20160614140357.6145-1-Martin.Jansa@gmail.com>
References: <20160614140357.6145-1-Martin.Jansa@gmail.com>
Subject: [PATCHv2] icecc.bbclass: replace os.popen with subprocess.check_output
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
X-List-Received-Date: Wed, 05 Oct 2016 20:53:11 -0000

* otherwise there is a lot of warnings about missing close on file descriptor

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/icecc.bbclass | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index e1c06c4..a837894 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -47,7 +47,8 @@ def get_cross_kernel_cc(bb,d):
 
     # evaluate the expression by the shell if necessary
     if '`' in kernel_cc or '$(' in kernel_cc:
-        kernel_cc = os.popen("echo %s" % kernel_cc).read()[:-1]
+        import subprocess
+        kernel_cc = subprocess.check_output("echo %s" % kernel_cc, shell=True).decode("utf-8")[:-1]
 
     kernel_cc = d.expand(kernel_cc)
     kernel_cc = kernel_cc.replace('ccache', '').strip()
@@ -220,9 +221,14 @@ def icecc_get_and_check_tool(bb, d, tool):
     # PATH or icecc-create-env script will silently create an invalid
     # compiler environment package.
     t = icecc_get_tool(bb, d, tool)
-    if t and os.popen("readlink -f %s" % t).read()[:-1] == get_icecc(d):
-        bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
-        return ""
+    if t:
+        import subprocess
+        link_path = subprocess.check_output("readlink -f %s" % t, shell=True).decode("utf-8")[:-1]
+        if link_path == get_icecc(d):
+            bb.error("%s is a symlink to %s in PATH and this prevents icecc from working" % (t, get_icecc(d)))
+            return ""
+        else:
+            return t
     else:
         return t
 
-- 
2.10.1


