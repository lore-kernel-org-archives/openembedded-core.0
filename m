Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.2132.1601017539182161482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 00:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 08P75aw4028305
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 25 Sep 2020 00:05:36 -0700 (PDT)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 25 Sep 2020
 00:05:35 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: Review request 0/4: multiple fixes for oe-core
Date: Fri, 25 Sep 2020 00:05:31 -0700
Message-ID: <20200925070535.59518-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Summary: multiple fixes for oe-core

[oe-core]
commit 7be68e2c562de447cb3efa35892ede4e5fe7b1db
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Sep 3 14:04:53 2020 +0800

    alsa-state: run alsactl store in pkg_postinst
    
    Since the pkg_postinst is prior than alsa-state-init, it needs
    to run store first. On raspberry pi 4 boards, it failed to
    online install alsa-state
    
    [raspberry pi 4]
    root@bcm-2xxx-rpi4:~# # dnf install alsa-state
    No state is present for card Headphones
    alsa-lib ../../../alsa-lib-1.2.3.2/src/ucm/main.c:983:(snd_use_case_mgr_open)
    error: failed to import hw:0 use case configuration -2
    Found hardware: "bcm2835_headpho" "Broadcom Mixer" "" "" ""
    Hardware is initialized using a generic method
    No state is present for card Headphones
    %post(alsa-state-0.2.0-r5.0.cortexa72): waitpid(823) rc 823 status 6300
    warning: %post(alsa-state-0.2.0-r5.0.cortexa72) scriptlet failed, exit status 99
    
    Error in POSTIN scriptlet in rpm package alsa-state
    [raspberry pi 4]
    
    No regression on qemuxxx bsp
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit e69855895d46e6dcf224f96d06ac22fe606642d2
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Thu Jul 25 04:06:09 2019 -0400

    archive: fix racing between do_ar_patched and do_kernel_configme
    
    While archive mode is 'patched', there is a probably racing between
    do_ar_patched and do_kernel_configme
    [snip]
    |File: 'oe-core/meta/classes/archiver.bbclass', lineno: 313, function: create_tarball
    ...
    |Exception: FileNotFoundError: [Errno 2] No such file or directory: 'build/
    tmp-glibc/work-shared/qemux86-64/kernel-source/.tmp.config.DCUH7mUNe3'
    [snip]
    
    Task do_kernel_configme will modify ${S}, and it broke create_tarball in
    do_ar_patched.
    
    Order do_kernel_configme and do_ar_patched to avoid racing.
    
    Also improve sstatesig.py to respect commit [fed0ed8 archiver.bbclass: do
    not cause kernel rebuilds]
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit 3b15b531c15c298bc914a25b4cb0bf4a61e33fd4
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Tue Aug 20 02:32:54 2019 -0400

    util-linux: fix calling uuidd failed with /run/uuidd not found
    
    It failed to call uuidd
    ...
    root@qemux86-64:~# uuidd
    uuidd: cannot open /run/uuidd/uuidd.pid: No such file or directory
    ...
    
    Create volatile dir /run/uuidd for both of systemd and sysvinit system
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>

commit f11262a873ff0db868ed47538d939acb0b74b9e0
Author: Hongxu Jia <hongxu.jia@windriver.com>
Date:   Mon May 25 10:30:39 2020 +0800

    initramfs-framework/udev: umount /run/media/XXX
    
    In initramfs-framework, udev (initramfs-module-udev) calls hook mount.sh to
    mount /run/media/XXX which is used by setup-live (initramfs-module-setup-live).
    The setup-live calls install-XXX.sh and use /run/media/XXX to do installation
    
    The side effect is while setup-live is not used, after it switches to rootfs,
    and the mounted disk could not be released
    
    Release the mounted disk before switch root and after kill udev
    
    Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>




