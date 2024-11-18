Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0020D43FEA
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 08:00:25 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.36274.1731916820198204941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 00:00:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yDOxUi9g;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53da209492cso3138698e87.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 00:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731916818; x=1732521618; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rb+1Z719zZTTwNhKiPHzDd6XUgGjdfN7lCRKQOtCnxI=;
        b=yDOxUi9gAXVdPtuB1iPy1ucTnQ0Ie9in9bNZFR76GY16yvDjWUHLwRuZiNDxgCazCO
         lgoI7GlwTt0IYcOswMCcBYe+LYLnCBRB1/1IHlxNf4ClhYsmHQmk+lM57f2nqJy8KtHI
         M/Xh/C8gf5FgolqBNMKGc+DcxNLHRLMjU3f9GDg+LdQbkVsNBLc+yd/dqAc5lQnp+dBB
         ghszr6jiQiL23WHg9DGknXEZ/6BQB6vuLCMcLpH1j4xwmg2/uWRZyCR3iUh446AfdeBX
         OktXsihCnWQveYj/+lERUzBWc3Ws/P9yYP41sE86JRodhSpUwOMnKdjZHFTGZEN8NPkH
         gaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731916818; x=1732521618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb+1Z719zZTTwNhKiPHzDd6XUgGjdfN7lCRKQOtCnxI=;
        b=UsaMLWrHJkpHb+4TVNOb2Pxf2G14uZ3AeFKE2nxuU8x9el7elys1pUT8x7CWjhON8w
         AZczxvYVtklhZ01hxNB6u1wHC1qtPXIEYinIhvqaCv+Tlcb8nJ/56KKaIsYEn94G+cVm
         /B5Qev7ZeQf2Q1BmdUpLd4E1E99EcEk7F6v39+crZtEtNub1Ob7tms6xa8cbIOhVyQCs
         dT8wyGhcQ2OJrZ6dVPyQpOQoBNjqqdtaW0AuQxNJpfDtk1/L1lT+zAK+G69bBQwEdJ4j
         CKebGgzCeCNKRjqzDCpsDBgzhnhQDx8dQ1SoH6CfuAGhThG5mnkxPKbLSkFHtTx642Ba
         j2YA==
X-Gm-Message-State: AOJu0YzZO15uPR6YqGx5F6ap+z/XgqT2RILtADPoafZcDU/189PoqhIS
	CYqpxlnmQ1PJSZU9+P2D69ZKecogpjsHqNaAqjvjsNVX1S6CvWLO/bBBOfxSYftrOrZmS8/4iRl
	BxgU=
X-Google-Smtp-Source: AGHT+IE8xXykxQmosIAXheV++U6/BRJh1cK/kBdcl9A8HEMk8WkDEgCrgKTXCp813Pkv7C2lH5AUVw==
X-Received: by 2002:a05:6512:28c:b0:53d:b4ab:13b9 with SMTP id 2adb3069b0e04-53db4ab1616mr1102321e87.3.1731916817934;
        Mon, 18 Nov 2024 00:00:17 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6548c3csm1498453e87.261.2024.11.18.00.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:00:16 -0800 (PST)
Date: Mon, 18 Nov 2024 10:00:13 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError too
Message-ID: <Zzr0Df_92qav6fWq@nuoska>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
 <20241111131604.364308-3-mikko.rapeli@linaro.org>
 <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 08:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207209

Hi,

On Tue, Nov 12, 2024 at 11:25:51AM +0000, Richard Purdie wrote:
> On Mon, 2024-11-11 at 13:16 +0000, Mikko Rapeli via lists.openembedded.org wrote:
> > runqemu can fail with RuntimeError exception. Non-cought exception
> > causes cooker process leaks which bind to successive bitbake command
> > line calls and that can cause really odd errors to users, e.g. when
> > build/tmp is wiped and cooker processes expect files to be there.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �meta/classes-recipe/testimage.bbclass | 2 +-
> > �1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
> > index 19075ce1f3..a9b031093a 100644
> > --- a/meta/classes-recipe/testimage.bbclass
> > +++ b/meta/classes-recipe/testimage.bbclass
> > @@ -371,7 +371,7 @@ def testimage_main(d):
> > �������� complete = True
> > �������� if results.hasAnyFailingTest():
> > ������������ run_failed_tests_post_actions(d, tc)
> > -��� except (KeyboardInterrupt, BlockingIOError) as err:
> > +��� except (KeyboardInterrupt, BlockingIOError, RuntimeError) as err:
> > �������� if isinstance(err, KeyboardInterrupt):
> > ������������ bb.error('testimage interrupted, shutting down...')
> > �������� else:
> > 
> 
> During review it is hard to understand what the real issue is from this
> description. I don't like the sound of processes leaking and if that is
> happening, adding another exception to this list doesn't feel correct.
> I was going to ask for a better explanation but looking at the code,
> perhaps this error handling path just needs rewriting/improving with
> more of the code in the finally, conditionally?
> 
> I just want to make sure we fix the real bug here.

Sorry for being unclear. I thought the backtrace would be too verbose.

The bug happens when runqemu startup fails:

poky/meta/lib/oeqa/targetcontrol.py:            raise RuntimeError("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)

cooker processes do leak when the exceptions are not cought.
Maybe these are not strictly related but it happens for me. It
can be that cleanup happens but just slowly, and when I run
other bitbake commands right after failure they connect to these
leaked cooker processes which then behave badly, for example when
build/tmp was already wiped.

Here is a failure log from one of my builds from meta-arm with other
changes on top which are the root cause for missing rootfs file:

ERROR: core-image-base-1.0-r0 do_testimage: Invalid rootfs /home/builder/src/base/meta-arm/build/tmp/deploy/images/qemuarm64-secureboot/core-image-base-qemuarm64-secureboot.rootfs.wic.qcow2
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

Error running command: ['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_boot_log.20241031142321']
Command '['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_boot_log.20241031142321']' returned non-zero exit status 1.


===== end: snippet =====


ERROR: Logfile of failure stored in: /home/builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/log.do_testimage.1779338
NOTE: recipe core-image-base-1.0-r0: task do_testimage: Failed
ERROR: Task (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage) failed with exit code '1'
NOTE: Tasks Summary: Attempted 7084 tasks of which 7054 didn't need to be rerun and 1 failed.

Summary: 1 task failed:
  /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/core-image-base.bb:do_testimage

Cheers,

-Mikko

