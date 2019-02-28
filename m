Return-Path: <jdmason@kudzu.us>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2AEEA7CC9B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 04:15:43 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id i204so7539795ywb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 20:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=m86cCG7dTnuNRU4r2SS+cUYjkkEK9mJLnMG8QQdP5qo=;
	b=fuVQrNIzMphsDUK5ZPPWIhFSW0xGnqYUDNTKPFrfV6T2M6390K8J5+pW8wwJR+B18Y
	9HAlV1bLRq3H1B7wWCmuXv3zkFr82dhZWMhEPUrcUANUlyOgYvn4xQbd/K0LtEqwZnjZ
	P91L7HJC5PPC2bmYxG7/gk6sOQHzcU+VtIXSoC6l3TTX/E8RhVNgCK955RGAXMKTbyol
	tuFDKkq3Y4Dh/AnpHqiL70WPiWBoZsfjjPPQ2Xvk733qGLgFh6uVR7GoqmDVq0eX5c30
	U/7VJ4+PP24G2KgNUQxIoOfmmuT7+by4gMfMCGI0RMYdEhJI6p2fLkU7kFNBCbtsN5bM
	yRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=m86cCG7dTnuNRU4r2SS+cUYjkkEK9mJLnMG8QQdP5qo=;
	b=L4jAXZhB59PiRK+VBz7ZP/5oArt1+lNNWmLQnzuXCAmsgzH0utWw//yTWfweS6v9+8
	qesS9SKlcRA4aHPddlyhw9r1nw2uAR4AuCT4bDSi5GkP1Zavwrh2H54Yu8bgQ51dP2x+
	yUBqND0ZRwk134JtU0/Pk+rp9vULD4Wx5UeVTHoUnMqNlr45D00XXuHLg7hqIz6BbAD+
	SFGUT+235nKQdHHv5Mp+DZwFqx/UYfzu/CvAHBDdecTNg03ehB2R1MDA/+pR/DpPggXw
	Gr2AZBmBmcHV8DTiyQTv43zcE/wHZp4i/8SYzxOqUMVoISydmR1YSeCGO7R3jicxzH5A
	+67w==
X-Gm-Message-State: AHQUAuYrcmduYcwuVLCMXBNXHXvGgshfxl11WgVwoUhdpCz3bIE/tyHG
	csqaOX/CTm87DA+Ur5YRbpJSMffQMcZQtw==
X-Google-Smtp-Source: AHgI3Ia0eIx/ECcMddJMNdB2R8xbTYwMiMsNxINXAMKH6/MyCYYgDnMRCa/UeW8FsoQmat9GKZyHtQ==
X-Received: by 2002:a81:7a54:: with SMTP id v81mr4086566ywc.50.1551327343876; 
	Wed, 27 Feb 2019 20:15:43 -0800 (PST)
Received: from graymalkin (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4]) by smtp.gmail.com with ESMTPSA id
	b67sm5517519ywb.102.2019.02.27.20.15.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Feb 2019 20:15:43 -0800 (PST)
Received: by graymalkin (sSMTP sendmail emulation);
	Wed, 27 Feb 2019 23:15:41 -0500
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2019 23:15:39 -0500
Message-Id: <20190228041541.14628-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.17.2
Subject: [RFC 0/2] qemuarm64: cleanup and Add graphics support
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
X-List-Received-Date: Thu, 28 Feb 2019 04:15:43 -0000


This series is dependent on the yocto-kernel-cache RFC series similarly
named.  See
https://lists.yoctoproject.org/pipermail/linux-yocto/2019-February/007580.html

This series cleans up the hvc0 respawning issue, by removing the
reference in meta/conf/machine/qemuarm64.conf.  So virtio console will
not work, but I don't think it was properly working before.  A bug
should be opened to track this and correct it when a solution is found.

Also, graphics support is added by using the QEMU VGA device, which
emulates a Bochs VGA PCI adapter.  Virtio would be a superior
implementation (in theory), but I was unable to get it working fully.  A
bug should be opened to track this and switch to using virtio when the
issue(s) can be resolved.

Finally, when starting the graphics, a kernel warning is issued.  It
is not fatal and graphics work despite the warning.  However, this might
be unacceptable.  For the record, it is:

[   18.370702] ------------[ cut here ]------------
[   18.382099] WARNING: CPU: 0 PID: 446 at drivers/gpu/drm/ttm/ttm_bo_vm.c:303 ttm_bo_vm_open+0x3c/0x4c
[   18.383267] Modules linked in:
[   18.383789] CPU: 0 PID: 446 Comm: Xorg Not tainted 4.19.19-yocto-standard #1
[   18.383964] Hardware name: Generic DT based system
[   18.384508] [<c021306c>] (unwind_backtrace) from [<c020d174>] (show_stack+0x20/0x24)
[   18.384719] [<c020d174>] (show_stack) from [<c09964a0>] (dump_stack+0x84/0xa4)
[   18.384904] [<c09964a0>] (dump_stack) from [<c0231dd0>] (__warn+0xe8/0x104)
[   18.385114] [<c0231dd0>] (__warn) from [<c0232180>] (warn_slowpath_null+0x4c/0x58)
[   18.385300] [<c0232180>] (warn_slowpath_null) from [<c072b408>] (ttm_bo_vm_open+0x3c/0x4c)
[   18.385499] [<c072b408>] (ttm_bo_vm_open) from [<c0230718>] (copy_process.part.3+0x13c4/0x17f0)
[   18.385703] [<c0230718>] (copy_process.part.3) from [<c0230ce8>] (_do_fork+0xc8/0x414)
[   18.385907] [<c0230ce8>] (_do_fork) from [<c0231154>] (sys_clone+0x30/0x38)
[   18.386108] [<c0231154>] (sys_clone) from [<c0201000>] (ret_fast_syscall+0x0/0x4c)
[   18.386308] Exception stack(0xde279fa8 to 0xde279ff0)
[   18.386477] 9fa0:                   b6ef7078 b6f03000 01200011 00000000 00000000 00000000
[   18.386672] 9fc0: b6ef7078 b6f03000 b6ef74d0 00000078 00000000 b6ef7010 0051b03d be9bc9fc
[   18.386857] 9fe0: 00000078 be9ba8a8 b6ad564d b6a7ac46
[   18.387096] ---[ end trace e8a5e15e3b7db8a9 ]---


Given these number of issues, I wanted to post this as a request for
comment to see if this is acceptable to the community.  If it is
acceptable, I will open the bugs mentioned above.

I have made similar modifications to qemuarma15, and can resubmit them
if the solution above is acceptable.  However, I thought using qemuarm64
was a cleaner way to show what was done and start the dialog.

Thanks,
Jon


Jon Mason (2):
  qemuarm64: fix hvc0 error and cleanup
  qemuarm64: Add graphics support

 meta/conf/machine/qemuarm64.conf | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

-- 
2.17.2


