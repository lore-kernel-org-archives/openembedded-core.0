Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F61C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 14:37:18 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.18603.1738075027991667346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 06:37:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BIgfGSju;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e3778bffdso6394115e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 06:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738075026; x=1738679826; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DHcll91PjwoncvbL2IylU4+z8T12XpX1Uh8ic3A9C+M=;
        b=BIgfGSjurciseTfvUwM5cNfh7DAUXf33lWdTiJlDK7+b2vCGytb+D/ymJ3VoPMXCCE
         Hh6ZMTTg5kE73v+YWzSuY+lGKELfN4ieXx7GSCyzlnYuzs5vlRklvEIlrgriUDbgAIGJ
         Oyhbha5+h2vMtsAruAq6RI6Jpud6wV02E9rZAf9RjC6LZVgiJmdsGaRHZRwIHr6n6SOL
         xTI0RTNQ1Zu5C2UCyX+fOMwUO4ZYnI1NgS8wNaFkGLVxS0uOCzxSm50b4eGy1KdVBukf
         L/6xiBtWILid1O0Nk80jQfkLLq1Aov/RK0cJsLp3jxrw7WnXheVRgF5k4Z5WGihUCRbi
         qN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738075026; x=1738679826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DHcll91PjwoncvbL2IylU4+z8T12XpX1Uh8ic3A9C+M=;
        b=Hv47S6qtxXenT4m1oNr4Y66cqW4sGyO0DWqM6smCseCa/PGdw87Jcu5QIGoKTCNcTc
         /Fux1Pb/tBeIMu1dE5QRzLjhxIiUXDenzTwPYnWbavqHBwjAnzVz93iJpdxpJx9ikJd2
         Hy4hUAeR5D9kw7335pQ2FU1KMji7RDthrGwyhDaa8PGEWhTqzZZdHHQLdWbb6yQjXtLj
         J5sfa/8cAqlFxICZQ2IchfIdiE9K93vY/wnNgrIKCQI99elXzx1SQTf5gVS+q+hCOXKi
         FiiZAnfqbOeU8vsQF+uk2sSyTO+qj929QwZ3O2Vbjzn0MPvo2nq4WYYwCJY0HYYmQyRj
         5MEA==
X-Gm-Message-State: AOJu0Yx+RxEQTAtoHSP9aYPGwQPMO1CoE9t5QASEHrQvH1x1aJBXUwpG
	XhY7w8FyNj9aDznnLK71Wxo8zi463BHzg/Hkv99klAY5mw1t5TvdDkTlBnNfTk8=
X-Gm-Gg: ASbGncvgv9oJXCX6huoCPQ806ggAgcF2DHiTlMOxIV0ydMUXLK8M1veB0HsBB899Eud
	JPNFRPdQIP9J5ZNDMFz+kGorLAFly7avDcQDIHNtShgKLBn0DfMs0MFLObFzfwAIP5r7tRg6h+Y
	n8AyxYWyu58H34v+rV8JYLyfoQ6GimT6pMNQfzhV7uEwuJPPHzdFPVg5fD8SyRCHUexqcIqkWHT
	pA+bv8IvPXvg6CLJpC72PuyLjWEFcv+9bfLOsdqpw+OZUEQzGf9k5c3ZFYZllRBEqVi4t0PctcB
	zlEvCYKZlPuVW4QEP67+1r5UOdiX/m5UvvxjU1S+
X-Google-Smtp-Source: AGHT+IHlq/LoQpw+eVsRiP2j3L8t3zEn1yysz5ma3ohpDgGyqc+h/5RpYJAurrsVdJRlzV3HCQz8lA==
X-Received: by 2002:a05:6512:3b09:b0:542:2f0f:66d9 with SMTP id 2adb3069b0e04-5439c246297mr18482888e87.16.1738075025974;
        Tue, 28 Jan 2025 06:37:05 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368384sm1641022e87.140.2025.01.28.06.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 06:37:05 -0800 (PST)
Date: Tue, 28 Jan 2025 16:37:02 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError too
Message-ID: <Z5jrjpl4hLEeyq8t@nuoska>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
 <20241111131604.364308-3-mikko.rapeli@linaro.org>
 <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
 <Zzr0Df_92qav6fWq@nuoska>
 <181EDCF7C1A1686B.17613@lists.openembedded.org>
 <ba9ffc9ade0e227bf9db0988e2877ddfef275207.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba9ffc9ade0e227bf9db0988e2877ddfef275207.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 14:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210325

Hi,

On Tue, Jan 28, 2025 at 01:49:00PM +0000, Richard Purdie wrote:
> On Tue, 2025-01-28 at 13:04 +0000, Richard Purdie via
> lists.openembedded.org wrote:
> > On Mon, 2024-11-18 at 10:00 +0200, Mikko Rapeli wrote:
> > > On Tue, Nov 12, 2024 at 11:25:51AM +0000, Richard Purdie wrote:
> > > > On Mon, 2024-11-11 at 13:16 +0000, Mikko Rapeli via
> > > > lists.openembedded.org wrote:
> > > > > runqemu can fail with RuntimeError exception. Non-cought
> > > > > exception
> > > > > causes cooker process leaks which bind to successive bitbake
> > > > > command
> > > > > line calls and that can cause really odd errors to users, e.g.
> > > > > when
> > > > > build/tmp is wiped and cooker processes expect files to be
> > > > > there.
> > > > > 
> > > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > ---
> > > > > �meta/classes-recipe/testimage.bbclass | 2 +-
> > > > > �1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/meta/classes-recipe/testimage.bbclass
> > > > > b/meta/classes-recipe/testimage.bbclass
> > > > > index 19075ce1f3..a9b031093a 100644
> > > > > --- a/meta/classes-recipe/testimage.bbclass
> > > > > +++ b/meta/classes-recipe/testimage.bbclass
> > > > > @@ -371,7 +371,7 @@ def testimage_main(d):
> > > > > �������� complete = True
> > > > > �������� if results.hasAnyFailingTest():
> > > > > ������������ run_failed_tests_post_actions(d, tc)
> > > > > -��� except (KeyboardInterrupt, BlockingIOError) as err:
> > > > > +��� except (KeyboardInterrupt, BlockingIOError, RuntimeError)
> > > > > as err:
> > > > > �������� if isinstance(err, KeyboardInterrupt):
> > > > > ������������ bb.error('testimage interrupted, shutting
> > > > > down...')
> > > > > �������� else:
> > > > > 
> > > > 
> > > > During review it is hard to understand what the real issue is
> > > > from this
> > > > description. I don't like the sound of processes leaking and if
> > > > that is
> > > > happening, adding another exception to this list doesn't feel
> > > > correct.
> > > > I was going to ask for a better explanation but looking at the
> > > > code,
> > > > perhaps this error handling path just needs rewriting/improving
> > > > with
> > > > more of the code in the finally, conditionally?
> > > > 
> > > > I just want to make sure we fix the real bug here.
> > > 
> > > Sorry for being unclear. I thought the backtrace would be too
> > > verbose.
> > > 
> > > The bug happens when runqemu startup fails:
> > > 
> > > poky/meta/lib/oeqa/targetcontrol.py:����������� raise
> > > RuntimeError("%s - FAILED to start qemu - check the task log and
> > > the boot log" % self.pn)
> > > 
> > > cooker processes do leak when the exceptions are not cought.
> > > Maybe these are not strictly related but it happens for me. It
> > > can be that cleanup happens but just slowly, and when I run
> > > other bitbake commands right after failure they connect to these
> > > leaked cooker processes which then behave badly, for example when
> > > build/tmp was already wiped.
> > > 
> > 
> > Sorry for the delay in looking at this patch. I'm a bit worried about
> > there being a leaked processes and wanted to understand if there was
> > other cleanup we should be doing.
> > 
> > Instead of this path, would it make sense to move the results.stop()
> > inside the finally? I'm worried that other forms of exception would
> > also leak processes.
> 
> I've looked more at this and I don't understand how this patch works.
> 
> By adding the exception to the exception clause, it will trigger a
> bb.error() call. The results.stop() call won't happen as results isn't
> set in this failure.
> 
> The only significant difference would therefore be the results =
> tc.results assignment. Does that really stop processes? If so, should
> we always be doing that?
> 
> I'd like to understand what we need to do to "fix" things so we can
> handle other exceptions.

If I remember correctly, I saw this when building meta-arm qemuarm64-secureboot
kas config which runs oeqa runtime tests with testimage.bbclass during build.

Without fix 4b3b37156cdf70230bc74c647784da8514c284cf in poky a single failing test
leaked Cooker processes. Then a rebuild of core-image-base connected to that Cooker
process and somehow failed to re-generate rootfs which became an empty directory
inside .wic image. This resulted qemu boot hanging which again throws RuntimeError
from meta/lib/oeqa/core/target/qemu.py line 52.

Example with poky from October 2024 (from old log files which I still had):

NOTE: Reconnecting to bitbake server...
...
NOTE: recipe core-image-base-1.0-r0: task do_create_image_spdx: Succeeded
QMP Available for connection at /home/builder/src/base/meta-arm/build/tmp/.ndozl5yn
QMP connected to QEMU at 10/31/24 13:55:56 and took 0.56 seconds
QMP released QEMU at 10/31/24 13:55:56 and took 0.19 seconds from connect
Bitbake still alive (no events for 600s). Active tasks:
/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage
WARNING: core-image-base-1.0-r0 do_testimage: Target didn't reach login banner in 1000 seconds (10/31/24 14:12:36)
WARNING: core-image-base-1.0-r0 do_testimage: Last 25 lines of login console (22962):
[    4.345255] Key type fscrypt-provisioning registered
[    4.363120] Btrfs loaded, zoned=no, fsverity=no
[    4.522255] input: QEMU QEMU USB Tablet as /devices/platform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input
/input0
[    4.528765] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:03.0-1/input0
[    4.636796] Key type encrypted registered
[    4.644819] printk: legacy console [netcon0] enabled
[    4.645638] netconsole: network logging started
[    4.651065] clk: Disabling unused clocks
[    4.651780] PM: genpd: Disabling unused power domains
[    4.669045] usb 1-2: new high-speed USB device number 3 using xhci_hcd
[    4.794967] Freeing unused kernel memory: 1856K
[    4.803684] Run /init as init process
[    4.847358] input: QEMU QEMU USB Keyboard as /devices/platform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/inp
ut/input1
[    4.919633] hid-generic 0003:0627:0001.0002: input: USB HID v1.11 Keyboard [QEMU QEMU USB Keyboard] on usb-0000:00:03.0-2/input0
Starting systemd-udevd version 256.6

[    7.407191] virtio_net virtio0 enp0s1: renamed from eth0
[   12.633172] ext3: Unknown parameter 'umask'
[   12.634318] ext2: Unknown parameter 'umask'
[   12.634924] ext4: Unknown parameter 'umask'
[   12.676391] EXT4-fs (vda2): mounted filesystem 41dc66e6-d693-46b3-a5d6-a46998500609 r/w with ordered data mode. Quota mode: disabled.
[   13.080423] /dev/disk/by-label/root: Can't open blockdev
[   13.081201] /dev/disk/by-label/root: Can't open blockdev
ERROR: There's no '/dev' on rootfs.

WARNING: core-image-base-1.0-r0 do_testimage: Check full boot log: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-l
inux/core-image-base/1.0/testimage/qemu_boot_log.20241031135427
Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 14098967.33

tput: No value for $TERM and no -T specified
WARNING: core-image-base-1.0-r0 do_testimage: Extra log data read: 

Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 14098967.33

tput: No value for $TERM and no -T specified

Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 14098967.33

tput: No value for $TERM and no -T specified

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
     0367:            threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start(
)
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

Error running command: ['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/te
stimage/qemu_boot_log.20241031135427']
Command '['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_b
oot_log.20241031135427']' returned non-zero exit status 1.

===== end: snippet =====


ERROR: Logfile of failure stored in: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/
log.do_testimage.1578012
NOTE: recipe core-image-base-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage) failed with exit code '1
'
NOTE: Tasks Summary: Attempted 7116 tasks of which 7081 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage


Since this exit happens without catching RuntimeError, there is no cleanup
and Cooker, qemu-system-aarch64 etc processes get leaked again.

If the RuntimeError is captured, then clean up is done and qemu-system-aarch64
and Cooker processes get killed. Together with
4b3b37156cdf70230bc74c647784da8514c284cf in poky
the failing oeqa runtime test under qemu was handled correctly
and rebuilds always ended up with same failure, specifically
from parselogs which is a bit greedy when detecting errors.

Does this help? If not, I can try to replicate the setup and failures
again, and try different fixes.

Cheers,

-Mikko

