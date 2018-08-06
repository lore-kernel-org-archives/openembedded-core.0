Return-Path: <ptsneves@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6384674CB8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 11:28:08 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o11-v6so13378987wmh.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O9l5U9Ev4olRMgEIaCf5UBN7raFBohBic50NjGc6Shw=;
	b=ew0vf12eY/GhWGPj33RF6gOZoApy7awDydtqAvDWZaPNex356L4O8tYsq/OPSvaTXi
	zTlpZNVisMIJ2rHJgj/qBjThtdr2yYkNI8X58J0XQ/JvYRvrQrGLNlXc3s4bUsOXDq22
	iMA88F5vj/YVE9+zgHvOEMqzgRexpBvr6ZyZNG0mdEuI4hmhNLbCHvQWN/4H/2zdYUU2
	rALDnGY3x8YWvUWUR6VxK227u2y8su122wMO7k70CaMZYfmXrpJFyw5U4Q2J0cuZPfAO
	nthVTc1IS5QSS+LTFHeTQJ/8k6JWXHkQl2TdGgRi3kyauwWgEME8xGDt/FGdi+lG17VC
	HRsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O9l5U9Ev4olRMgEIaCf5UBN7raFBohBic50NjGc6Shw=;
	b=MLJnLdfecFYTRrBgPteIK8FfPPcPbYOitDP61QV2pYCL7wU8pQqyiWFf6uRHhVIrB7
	aBnC9VBIBp9sXtPp4vb9r3Eq2qMTuNEcedBQeilLjfpfUmx7X2LXqDOoOECAl+Rypzyv
	KKLLJxv0AeCIgRKwDi1RMqqrbH3kuA+ZTlhnTKkxoyH+qguIw7g8PrFmaPj3558Mn2uE
	YfGyQI/HJ3UIU8FpAoVbAvEHpK5TrntdoNIKcvbCiunmcOug73cAak34TfBDK4BXmu+O
	giwfdpaDTwuUSbrmkG8YD2AGtNZFfJ1uMUn3vHVq26wNlwOLLQcjXyzJ4MbnlTYW7lkJ
	liEw==
X-Gm-Message-State: AOUpUlEct36eiQ9Wl5dkDTNhoGgrQAcxx3lPA1sC05toHWTsR+scFjb5
	9P9qMj+ZpFxGmswHZ7xXJrlJBAmybg==
X-Google-Smtp-Source: AAOMgpc++8h8YmajE1ndPX2ftS9rmx3fU3VKg2Uw8B4EJMDvlaSJqeYO54SZq1cD2JcT9dBsgWM49Q==
X-Received: by 2002:a1c:cf05:: with SMTP id
	f5-v6mr11441401wmg.64.1533554888746; 
	Mon, 06 Aug 2018 04:28:08 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	k6-v6sm9336022wrv.92.2018.08.06.04.28.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Aug 2018 04:28:07 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 13:26:58 +0200
Message-Id: <1533554821-10772-1-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2 1/4] context.py: Do not mask exceptions needlessly.
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
X-List-Received-Date: Mon, 06 Aug 2018 11:28:08 -0000

There were a lot of assumptions in the controller import
code of context.py which were not true anymore.  These
assumptions reflected themselves by catching exceptions and
re-raising them with unhelpful error messages in other parts
of the code.

This commit does not fix the classes controller classes that
became broken after the refactor but at least it allows for
the exceptions to be thrown where the imports fail, thus
actually showing what exactly went wrong with the import.

An example of such an improvement is that before if the
controller class failed during it's init contructor the
controller would just be skipped and the task would just
complain it could not find the controller.  Now for example,
if there is a NamerError due to a variable not being
declared, the user will get that report.

Signed-off-by: Paulo Neves <ptsneves@gmail.com>
---
 meta/lib/oeqa/runtime/context.py | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 0294003..a7f3823 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -112,12 +112,9 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
             # XXX: Don't base your targets on this code it will be refactored
             # in the near future.
             # Custom target module loading
-            try:
-                target_modules_path = kwargs.get('target_modules_path', '')
-                controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
-                target = controller(logger, target_ip, server_ip, **kwargs)
-            except ImportError as e:
-                raise TypeError("Failed to import %s from available controller modules" % target_type)
+            target_modules_path = kwargs.get('target_modules_path', '')
+            controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
+            target = controller(logger, target_ip, server_ip, **kwargs)
 
         return target
 
@@ -173,10 +170,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     def _loadControllerFromModule(target, modulename):
         obj = None
         # import module, allowing it to raise import exception
-        try:
-            module = __import__(modulename, globals(), locals(), [target])
-        except Exception as e:
-            return obj
+        module = __import__(modulename, globals(), locals(), [target])
         # look for target class in the module, catching any exceptions as it
         # is valid that a module may not have the target class.
         try:
-- 
2.7.4


