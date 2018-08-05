Return-Path: <ptsneves@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 15A1B74621
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Aug 2018 14:43:19 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l2-v6so9284668wme.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Aug 2018 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O9l5U9Ev4olRMgEIaCf5UBN7raFBohBic50NjGc6Shw=;
	b=j7Q4tO/MvQRv5LFz893zSzfbxI/tmlmFnrPKs4lfC3x9hor383OzqeyjKvoeDnU4lv
	1pYJAuXP+PPlKXLVgkdnMWqu9V/sIQrkC0+CRy0jZpNt+/RATaf+uwnFHyZ9DE5G2h+d
	7doYqeoQ+shLXVsQs6suLaoROjQp48sJ5DMmEu1jYYsKib7ZWrioLgtWKk4XAhLSyOcv
	TTLWSLlFg8xB2bSrBTqDQCTt8AFKaMTv+ntK+VI2GfD8ahW7aX53+6NhmarI4emF6R94
	w3JZ21Be82ADQoz0aZRo3m3J8GKI5B0XNnvX/ZPZWUrB8wiLwusMmH7CDoe6AyGWrTMP
	zNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O9l5U9Ev4olRMgEIaCf5UBN7raFBohBic50NjGc6Shw=;
	b=MIZ5Vmjd/FiTq/w2mf5Yv4vtp1IFgW44LXDR6CzhHQSBZd9vjdiuE6NfoLkhnHRKuL
	9Y93kMynsYPb+6oNn+cPlrAIebXfO3V1DGhGdUlp50m2b2jg9/6GxwEMi0UcXDIyUqXy
	gxxJT5nhm3U5W7an5fT8vKwa9Y272DIE3+Fye6JsMgKjVijues3cfUgff04XPI9Nl/9v
	CQMmPoQ4X8Eh0s+/2se3j4GULOiadsmohFp6BPIeVUebpbBNaSHdwuclgEzM7DRaeL3h
	NKIxDoVYWYoIQN1998cYWKzI2Z4Ml+NyI1bzsiFquAcqoRNDC2u2P4t5rixgGgjv7HLx
	wTLQ==
X-Gm-Message-State: AOUpUlEl9cTmdR3rtOyB/mrv/WAJAhskz6mWjuoElto4/QH5KFFN44Qz
	zFbrcnSCwl12+FJpOXEI0YMAi2PIfw==
X-Google-Smtp-Source: AA+uWPz64t1vQTp3s5Jec3gsS5XdnwN/3WzQCU3WQdzq5/+eRMR65IFVdla0bpTekFchp+/xY6trHQ==
X-Received: by 2002:a1c:acc3:: with SMTP id
	v186-v6mr1091629wme.69.1533480200382; 
	Sun, 05 Aug 2018 07:43:20 -0700 (PDT)
Received: from localhost.localdomain (64.196.28.37.rev.vodafone.pt.
	[37.28.196.64]) by smtp.gmail.com with ESMTPSA id
	b13-v6sm11073701wrs.43.2018.08.05.07.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 05 Aug 2018 07:43:19 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 Aug 2018 16:40:38 +0200
Message-Id: <1533480041-6431-1-git-send-email-ptsneves@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/4] context.py: Do not mask exceptions needlessly.
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
X-List-Received-Date: Sun, 05 Aug 2018 14:43:20 -0000

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


