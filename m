Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C062CD6007B
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 08:19:18 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.16262.1732004348875311462
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 00:19:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=tIo/HTFq;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f53973fdso4723468e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 00:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732004347; x=1732609147; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZUSCL+lrOK3tvi4RWZ8BQGDglGv6Y1nFWJksF4l/qU=;
        b=tIo/HTFqn04751gbZRbfCYI4qyKEkOgDwIJatjAoRDLWR6YQOIhrLR188o/WRItuah
         zWW6FRC8WfXYMZXn/FaNpRVlKsXKHXLCFUrOkbHoo3jlNPlBxKWrFi44E8n/BEhD9rjK
         EAIXSopU9ZwABr1VTCBA+ob0o0VPGGKm68vvEfw2WCVdqATqDMjrjRUKydP6fyiPjgqI
         TaWUm3Pmw0xcbALTbhnyZpH7Tht6iBrlibh8u/8gUuF2N+QcZsEWo9SiwHFzO2+qPcX2
         AKibB6anSeF7YLyB0kypccSu7LQXJlGMTHC1ALZmoRnEs30GMenhYA7Z391iAeFlrIkx
         Z0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732004347; x=1732609147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZUSCL+lrOK3tvi4RWZ8BQGDglGv6Y1nFWJksF4l/qU=;
        b=Oqq0evUcHCxaXDGjTS43WUpEiAtp3FxumxElzZjijbwp5Fu3mXfZE7rBnbUzxYPbF3
         rgRxc72SUrEul7/UqIMutu99heVSr4QS/WtS21U60gogMq6m2HI6ouiuu1lUJLdV4YU1
         Zc5NV8vzW/+tpNu6qRZA04Plv5sfm6f58g1nppW39WfLtIJdjR/Xo/Nrr34arFY/Gz81
         vlai7yJOFbhAn+gxqvnPQDjaywsqiNjI3xlLej6olsTNaFna59DYdT2iHR2v8Ax2Kgla
         noqrPx7fGskrRS8YZU7nl/B3hEAgmMEzjl/cCOWc1XylYWjT/EvrHsAcparWlvG+4LtL
         gdNw==
X-Gm-Message-State: AOJu0YyxgVYBHD1MEkLEZ7kWoip03yobZ4076q9tECcYsUW7G+VlmNw7
	RBHhTMXHRZ1sEi5OO0Cepemgcin/GNlyBJ1VDydPWaGGIVE46qvP2i+xI+moq7BCB1JZpaWGiqc
	j76o=
X-Google-Smtp-Source: AGHT+IHFnTMROVXrdFYkrRANoI1379VOY7MRKpjHSHU0LwRJU0OneI5AX4HYnsN5fW/vL2CJnBIBtA==
X-Received: by 2002:a05:6512:1591:b0:53d:bf07:ad9b with SMTP id 2adb3069b0e04-53dbf07ada7mr116340e87.7.1732004346650;
        Tue, 19 Nov 2024 00:19:06 -0800 (PST)
Received: from localhost.localdomain (2001-14ba-7452-eb00--193.rev.dnainternet.fi. [2001:14ba:7452:eb00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd478248sm224648e87.236.2024.11.19.00.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 00:19:04 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2] testimage.bbclass: capture RuntimeError too
Date: Tue, 19 Nov 2024 10:18:38 +0200
Message-ID: <20241119081838.40747-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 08:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207382

runqemu can fail with RuntimeError exception:

$ git grep RuntimeError meta/lib/oeqa/core/
meta/lib/oeqa/core/target/qemu.py:            raise RuntimeError("FAILED to start qemu - check the task log and the boot log")
meta/lib/oeqa/core/target/qemu.py:            raise RuntimeError("FAILED to start qemu - check the task log and the boot log %s" % (msg))

$ bitbake core-image-base
...
/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
WARNING: core-image-base-1.0-r0 do_testimage: Target didn't reach login banner in 1000 seconds (10/31/24 14:12:36)
WARNING: core-image-base-1.0-r0 do_testimage: Last 25 lines of login console (22962):
...
[   12.676391] EXT4-fs (vda2): mounted filesystem 41dc66e6-d693-46b3-a5d6-a46998500609 r/w with ordered data mode. Quota mode: disabled.
[   13.080423] /dev/disk/by-label/root: Can't open blockdev
[   13.081201] /dev/disk/by-label/root: Can't open blockdev
ERROR: There's no '/dev' on rootfs.
...
ERROR: core-image-base-1.0-r0 do_testimage: Error executing a python function in exec_func_python() autogenerated:

The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
     0001:
 *** 0002:do_testimage(d)
     0003:
File: '/home/builder/src/base/meta-arm/build/../poky/meta/classes-recipe/testimage.bbclass', lineno: 122, function: do_testimage
     0118:    dump-guest-memory {"paging":false,"protocol":"file:%s.img"}
     0119:}
     0120:
     0121:python do_testimage() {
 *** 0122:    testimage_main(d)
     0123:}
     0124:
     0125:addtask testimage
     0126:do_testimage[nostamp] = "1"
File: '/home/builder/src/base/meta-arm/build/../poky/meta/classes-recipe/testimage.bbclass', lineno: 364, function: testimage_main
     0360:    orig_sigterm_handler = signal.signal(signal.SIGTERM, sigterm_exception)
     0361:    try:
     0362:        # We need to check if runqemu ends unexpectedly
     0363:        # or if the worker send us a SIGTERM
 *** 0364:        tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
     0365:        import threading
     0366:        try:
     0367:            threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
     0368:        except ValueError:
File: '/home/builder/src/base/meta-arm/build/../poky/meta/lib/oeqa/core/target/qemu.py', lineno: 91, function: start
     0087:            except (subprocess.CalledProcessError, subprocess.TimeoutExpired, FileNotFoundError) as err:
     0088:                msg += "Error running command: %s\n%s\n" % (blcmd, err)
     0089:            msg += "\n\n===== end: snippet =====\n"
     0090:
 *** 0091:            raise RuntimeError("FAILED to start qemu - check the task log and the boot log %s" % (msg))
     0092:
     0093:    def stop(self):
     0094:        self.runner.stop()
Exception: RuntimeError: FAILED to start qemu - check the task log and the boot log
...
Summary: 1 task failed:
  /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
    log: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.1578012

If the exception is not cought, cooker processes will be leaked.
bitbake commands will connect with the leaked cooker processes
which may cause other odd behavior later on.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

v2: added details to commit message

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 19075ce1f3..a9b031093a 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -371,7 +371,7 @@ def testimage_main(d):
         complete = True
         if results.hasAnyFailingTest():
             run_failed_tests_post_actions(d, tc)
-    except (KeyboardInterrupt, BlockingIOError) as err:
+    except (KeyboardInterrupt, BlockingIOError, RuntimeError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
         else:
-- 
2.34.1


