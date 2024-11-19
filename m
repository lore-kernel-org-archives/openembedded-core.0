Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563C1D4415E
	for <webhook@archiver.kernel.org>; Tue, 19 Nov 2024 13:33:40 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.20899.1732023215731811466
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Nov 2024 05:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=O2T6+EIT;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53b13ea6b78so5268289e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 05:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732023214; x=1732628014; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EB9L8EjHUG7NmgrbLJDgza6tfuSvOyVDKzfGZ8IN1Y=;
        b=O2T6+EIT3w4Jru8aD/X5d4L6Ehnyk2Ia33affVIjm9+ZU+mMsguAyvu/6c/nJ0XSQu
         TJM5l8wiNdbG/a7Fb3n+VJ61YLj8HTr6/UuTLKaYf8h9NJthoWcw1vCEXR97oxb5HIzs
         aMnqp52WdrvRj4oGIn8seVvibdpsRaYCQn03CWZVwQOLQ25nsFKnAP9FISRFHui3jm3h
         qB0KvtuRS18slR7Wng3I0SKmUnB4pAY6NPM7Z0LPwS1AxH553aY8AJHMFpq1cie9hQZx
         n2JvTF+NIYIDmTynr18ascTGVQqorqrWGbZKq/tWYsHhoUsJUt36TL2koP+i8E/RVR/x
         6W5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732023214; x=1732628014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EB9L8EjHUG7NmgrbLJDgza6tfuSvOyVDKzfGZ8IN1Y=;
        b=kdc0EtLUzXKzMD6Ch6s7bFz7V8eOTfB0kpRBsKrFdptp98o+Wa0U126WF+5P06kmux
         bGdBizXUptvJj3TSS8Yt4hXI+x1QSd/RAfvDG8kkRDTVO/MUWSHhaenaBWFthfsCk2T7
         eP/j9WnuVTBTxvbZDylqBivA+eZX07FPIFkwbCpYkllKMAWBOXDZdKQ0HcuqynBjczxW
         NPErlECsK+lFr2MR8ZMZBu71R2I+dInqswC3v06vn/ybXjSB2EKKX/8vW7aGXbgyOImS
         zVRXdwdHeCy22lMGCynmLnJGqzEiM3+Evhmbo4AJAoE7hoTRhmCRjzBdo1JRIYyawCG8
         uu/A==
X-Gm-Message-State: AOJu0YyWNv5BUV2/oqMQOwdAA9yOHrxrMnKHsWg6Qp9fAXVP50HFnvNH
	4Gdtms7R+4lxXrZ4ghZiUYHJh1tvZ3aM+1tk6tNYJx4Mg/XM7p+VN6dsGuggq5LEHLwlrF8pZKG
	ViOA=
X-Google-Smtp-Source: AGHT+IEUzbzrnu2YW20jSB05JObBqLtuto4zXWKBru5bD7vJ2Tv9kGvTpAqa/GzSMZhwPAt0TKckRg==
X-Received: by 2002:a05:6512:3c9c:b0:53d:a2da:d396 with SMTP id 2adb3069b0e04-53dab2a6441mr9436308e87.23.1732023213446;
        Tue, 19 Nov 2024 05:33:33 -0800 (PST)
Received: from nuoska (2001-14ba-7452-eb00--193.rev.dnainternet.fi. [2001:14ba:7452:eb00::193])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbdbb89casm254937e87.21.2024.11.19.05.33.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 05:33:31 -0800 (PST)
Date: Tue, 19 Nov 2024 15:33:28 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] wic builds an empty rootfs on second image build with
 rm_work enabled
Message-ID: <ZzyTqIJtIjHqgyOY@nuoska>
References: <Zyjj-0oflBsZfj1C@nuoska>
 <553b223a0d437044e587b0ddaf0519803ff57f2f.camel@linuxfoundation.org>
 <ZztNMmHa7s21MJXI@nuoska>
 <3c967bf5-9856-4a91-874a-5e40b4b4e7cd@koansoftware.com>
 <180917DC7939F09D.10466@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <180917DC7939F09D.10466@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Nov 2024 13:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207391

Hi,

For reproduction, few things are needed:

 * a failing oeqa runtime test, for example when enabling uki support in meta-arm qemuarm64-secureboot
   build the uki.py can be made to always fail:

--- a/meta/lib/oeqa/runtime/cases/uki.py
+++ b/meta/lib/oeqa/runtime/cases/uki.py
@@ -9,7 +9,7 @@ class UkiTest(OERuntimeTestCase):
     @skipIfNotInDataVar('IMAGE_CLASSES', 'uki', 'Test case uki is for images which use uki.bbclass')
     def test_uki(self):
         uki_filename = self.td.get('UKI_FILENAME')
-        status, output = self.target.run('ls /boot/EFI/Linux/%s' % uki_filename)
+        status, output = self.target.run('ls /boot/EFI/Linux-FOOBARZOO/%s' % uki_filename)
         self.assertEqual(status, 0, output)
 
         status, output = self.target.run('echo $( cat /sys/firmware/efi/efivars/LoaderEntrySelected-4a67b082-0a4c-41cf-b6c7-440b29bb8c4f  ) | grep %s' % uki_filename)

Another failing oeqa runtime test is ping.py when slirp networking is used.
This fails, sometimes, on all meta-arm kas builds that I do. Right now it
is passing and I fail to understand why. The failures, when they happen, come
from missing "ping" host command, which is really odd. Build host and kas container
have /usr/bin/ping and permissions to use it.

 * image with "testimage" in IMAGE_CLASSES and
   aldo automatic test execution during build enabled with
   TESTIMAGE_AUTO = "1", in local.conf or similar.

 * then two consecutive builds of the image with very little in between rebuilds.
   Some debug commands can run but not much more.

Logs from meta-arm build:

$ kas shell ci/qemuarm64-secureboot.yml:ci/uefi-secureboot.yml:ci/testimage.yml

$ ( set -x; bitbake -c clean core-image-base ; bitbake core-image-base ; \
wic ls tmp/deploy/images/qemuarm64-secureboot/core-image-base-qemuarm64-secureboot.rootfs.wic:2/ ; \
pstree -upln|grep -i cooker ; bitbake core-image-base ; \
wic ls tmp/deploy/images/qemuarm64-secureboot/core-image-base-qemuarm64-secureboot.rootfs.wic:2/ ; \
pstree -upln|grep -i cooker ) 2>&1 | tee log
...
+ bitbake -c clean core-image-base
...
+ bitbake core-image-base
...
Traceback (most recent call last):
  File "/home/builder/src/base/meta-arm/build/../poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/home/builder/src/base/meta-arm/poky/meta/lib/oeqa/runtime/cases/uki.py", line 13, in test_uki
    self.assertEqual(status, 0, output)
AssertionError: 2 != 0 : ls: cannot access '/boot/EFI/Linux-FOOBARZOO/uki.efi': No such file or directory
...
SUMMARY:
core-image-base () - Ran 76 tests in 851.573s
core-image-base - FAIL - Required tests failed (successes=21, skipped=54, failures=1, errors=0)
ERROR: core-image-base-1.0-r0 do_testimage: core-image-base - FAILED - also check the logs in /home/builder/src/base/meta-arm/build/tmp/log
ERROR: Logfile of failure stored in: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.2991270
NOTE: recipe core-image-base-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 7024 tasks of which 6994 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
    log: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.2991270
Summary: There was 1 ERROR message, returning a non-zero exit code.
+ wic ls tmp/deploy/images/qemuarm64-secureboot/core-image-base-qemuarm64-secureboot.rootfs.wic:2/
debugfs 1.47.0 (5-Feb-2023)
      2   40755 (2)      0      0    1024  5-Apr-2011 23:00 .
      2   40755 (2)      0      0    1024  5-Apr-2011 23:00 ..
     11   40700 (2)      0      0   12288  5-Apr-2011 23:00 lost+found
     13  120777 (7)      0      0       7  5-Apr-2011 23:00 bin
     14   40755 (2)      0      0    1024  5-Apr-2011 23:00 boot
     24   40755 (2)      0      0    1024  5-Apr-2011 23:00 dev
     25   40755 (2)      0      0    3072  5-Apr-2011 23:00 etc
    539   40755 (2)      0      0    1024  5-Apr-2011 23:00 home
    540  120777 (7)      0      0       7  5-Apr-2011 23:00 lib
    541   40755 (2)      0      0    1024  5-Apr-2011 23:00 media
    542   40755 (2)      0      0    1024  5-Apr-2011 23:00 mnt
    543   40555 (2)      0      0    1024  5-Apr-2011 23:00 proc
    544   40700 (2)      0      0    1024  5-Apr-2011 23:00 root
    545   40755 (2)      0      0    1024  5-Apr-2011 23:00 run
    546  120777 (7)      0      0       8  5-Apr-2011 23:00 sbin
    547   40755 (2)      0      0    1024  5-Apr-2011 23:00 srv
    548   40555 (2)      0      0    1024  5-Apr-2011 23:00 sys
    549   41777 (2)      0      0    1024  5-Apr-2011 23:00 tmp
    550   40755 (2)      0      0    1024  5-Apr-2011 23:00 usr
   5117   40755 (2)      0      0    1024  5-Apr-2011 23:00 var
+ pstree -upln
+ grep -i cooker
           |-Cooker(2973143,builder)-+-{Cooker}(2973147)
           |                         `-Cooker(2973155)
+ bitbake core-image-base
NOTE: Reconnecting to bitbake server...
^^^^^^^^^^
Loading cache...done.
...
NOTE: recipe core-image-base-1.0-r0: task do_image_qa: Started
NOTE: recipe core-image-base-1.0-r0: task do_image_qa: Succeeded
NOTE: Running task 7015 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_image)
NOTE: recipe core-image-base-1.0-r0: task do_image: Started
NOTE: recipe core-image-base-1.0-r0: task do_image: Succeeded
NOTE: Running task 7016 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_rootfs_wicenv)
NOTE: Running task 7017 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_write_wks_template)
NOTE: recipe core-image-base-1.0-r0: task do_rootfs_wicenv: Started
NOTE: recipe core-image-base-1.0-r0: task do_rootfs_wicenv: Succeeded
NOTE: recipe core-image-base-1.0-r0: task do_write_wks_template: Started
NOTE: recipe core-image-base-1.0-r0: task do_write_wks_template: Succeeded
NOTE: Running task 7018 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_image_wic)
NOTE: recipe core-image-base-1.0-r0: task do_image_wic: Started
NOTE: recipe core-image-base-1.0-r0: task do_image_wic: Succeeded
NOTE: Running task 7019 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_image_complete)
NOTE: recipe core-image-base-1.0-r0: task do_image_complete: Started
NOTE: recipe package-index-1.0-r0: task do_package_index: Succeeded
NOTE: Running task 7020 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/meta/package-index.bb:do_rm_work)
NOTE: recipe package-index-1.0-r0: task do_rm_work: Started
NOTE: recipe package-index-1.0-r0: task do_rm_work: Succeeded
NOTE: recipe core-image-base-1.0-r0: task do_image_complete: Succeeded
NOTE: Running task 7021 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage)
NOTE: Running task 7022 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_populate_lic_deploy)
NOTE: Running task 7023 of 7027 (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_create_image_spdx)
NOTE: recipe core-image-base-1.0-r0: task do_testimage: Started
NOTE: recipe core-image-base-1.0-r0: task do_populate_lic_deploy: Started
NOTE: recipe core-image-base-1.0-r0: task do_populate_lic_deploy: Succeeded
NOTE: recipe core-image-base-1.0-r0: task do_create_image_spdx: Started
NOTE: recipe core-image-base-1.0-r0: task do_create_image_spdx: Succeeded
QMP Available for connection at /home/builder/src/base/meta-arm/build/tmp/.34zuzopv
QMP connected to QEMU at 11/19/24 11:13:04 and took 0.55 seconds
QMP released QEMU at 11/19/24 11:13:04 and took 0.06 seconds from connect
Bitbake still alive (no events for 600s). Active tasks:
/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
WARNING: core-image-base-1.0-r0 do_testimage: Target didn't reach login banner in 1000 seconds (11/19/24 11:29:44)
WARNING: core-image-base-1.0-r0 do_testimage: Last 25 lines of login console (22976):
...
[    8.573803] EXT4-fs (vda2): mounted filesystem 2419aa86-8c0c-4bda-919d-7d0d3efe0fb9 r/w with ordered data mode. Quota mode: disabled.
[    8.954350] /dev/disk/by-label/root: Can't open blockdev
[    8.955290] /dev/disk/by-label/root: Can't open blockdev
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

===== start: snippet =====



===== end: snippet =====

===== start: snippet =====

Error running command: ['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_boot_log.20241119111231']
Command '['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_boot_l
og.20241119111231']' returned non-zero exit status 1.
...
ERROR: Logfile of failure stored in: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.3000568
NOTE: recipe core-image-base-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 7024 tasks of which 7000 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
    log: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.3000568
Summary: There were 5 WARNING messages.
Summary: There was 1 ERROR message, returning a non-zero exit code.
+ wic ls tmp/deploy/images/qemuarm64-secureboot/core-image-base-qemuarm64-secureboot.rootfs.wic:2/
debugfs 1.47.0 (5-Feb-2023)
      2   40755 (2)      0      0    1024  5-Apr-2011 23:00 .
      2   40755 (2)      0      0    1024  5-Apr-2011 23:00 ..
     11   40700 (2)      0      0   12288  5-Apr-2011 23:00 lost+found
+ pstree -upln
+ grep -i cooker
           |-Cooker(2973143,builder)-+-{Cooker}(2973147)
           |                         `-Cooker(2973155)


So testimage.bbclass and test run failures leak Cooker processes which then somehow corrupts
.wic image so that main rootfs is created from an empty directory. I will dig into the
Cooker leakage which seems to be the starting point.

Cheers,

-Mikko

