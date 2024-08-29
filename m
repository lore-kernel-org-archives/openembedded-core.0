Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02136C83F21
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 13:33:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15306.1724938376079745853
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 06:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bmSPumiJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-201fae21398so4646675ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1724938375; x=1725543175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDMjRL3Nh68J+NMA0n87C1Rjj1QuxA/y32KEtDnJfjk=;
        b=bmSPumiJyQj5+i0r6U5aoigMBOvnOxIckVzFLHUfljKjUDU5qbSF3A3Ef2q6xL4j98
         JptUoBzrb7uXyvil8zZsPzAd8OZTIGBba2LhgI3V26cLI+f+y4EqiD7tXORfEsvPAB6+
         IH6QIIWR0qnNmDYkuADH9+vUyzN7qtWviTv1QaSbeerotnppeNnj+b25cSD5C4ILP6WE
         uZBzMbswa+pSau6lAaPJEKDW6Zlk+4CA2qX7RhDvnkiFcuA6CNaF6mYdfoHw3xpXp4lm
         7/bahJy2nXF8VCzd4K1pB2fzZE9dWOhkrMMCpdiaSWh/N3RPfR5FsihZht3oAWZYlLU2
         /FAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724938375; x=1725543175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDMjRL3Nh68J+NMA0n87C1Rjj1QuxA/y32KEtDnJfjk=;
        b=djMoR2AiB2Fu54yBYIlgux0CsKBJcEbgje1tHROHidwv5hoXN5/JXlUT0mpos/iYp1
         /9sqdE8nRsOVxqTjmLzStRczm/IwMBLy/geVVJvhD4ZQgphnnzUxb9j9gvbr8vLAkSxV
         ZzoMZX8o1WX80739Uz5njUFlF0+2kPz6oFokaBH1WxyevbMSoExtzZlMfsesQg205FH4
         D9RUDx3a2W1cTu7y77hYmekUdVnl5rzI0wWppLpzOOzgncsVmTMjEJgz4RBsJiEWfd/Y
         mvI6+nEYmE/fCvxBcdJCsGRsiKCOi6oST8XMrC4RS6QJhHQQ7P7UzXfrAGrNah76MEn8
         SohQ==
X-Gm-Message-State: AOJu0YzGfsNCZ9J/De8YcTcsU6VMjMGBdJtd9iDFfJgU30rifjg6FJd8
	9kCTUGpYC27J5WWpw00OqTbf/Ff5JF6Yk6M8EI3feWZdxzV4fIj9Vkkb75tYFpFXFikW5UoVqLB
	q9qc=
X-Google-Smtp-Source: AGHT+IHwYEb8/8FkNogM2j4pEet+T+ib8AxFa1I3CgKfUv6MLBK00HuAxt6SmCxu+9UvxhlWiHVBKg==
X-Received: by 2002:a17:902:d48c:b0:202:2ed:b3a2 with SMTP id d9443c01a7336-2050c217067mr39592515ad.8.1724938375089;
        Thu, 29 Aug 2024 06:32:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b1446sm11241235ad.58.2024.08.29.06.32.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 06:32:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/12] util-linux: Add PACKAGECONFIG option to mitigate rootfs remount error
Date: Thu, 29 Aug 2024 06:32:31 -0700
Message-Id: <c0487c8141ae2b9242447b53b71052769db6338f.1724938187.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724938187.git.steve@sakoman.com>
References: <cover.1724938187.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 13:33:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203928

From: Niko Mauno <niko.mauno@vaisala.com>

The 2.39 version of util-linux took new file descriptors based mount
kernel API into use. In relation to this change, the upstream release
notes in
https://github.com/util-linux/util-linux/blob/v2.39/Documentation/releases/v2.39-ReleaseNotes#L14-L21
mention that

  This change is very aggressive to libmount code, but hopefully, it does not introduce regressions in traditional mount(8) behavior.

After observing following failure when booting a board using a bit
older 6.1 series kernel together with initramfs rootfs based boot flow

  [FAILED] Failed to start Remount Root and Kernel File Systems.
  See 'systemctl status systemd-remount-fs.service' for details.

closer inspection revealed:

  demoboard ~ # systemctl status -l systemd-remount-fs.service
  x systemd-remount-fs.service - Remount Root and Kernel File Systems
       Loaded: loaded (/usr/lib/systemd/system/systemd-remount-fs.service; enabled-runtime; preset: disabled)
       Active: failed (Result: exit-code) since Wed 2024-08-14 14:53:48 UTC; 1min 22s ago
         Docs: man:systemd-remount-fs.service(8)
               https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
      Process: 76 ExecStart=/usr/lib/systemd/systemd-remount-fs (code=exited, status=1/FAILURE)
     Main PID: 76 (code=exited, status=1/FAILURE)

  Aug 14 14:53:48 demoboard systemd-remount-fs[76]: /usr/bin/mount for / exited with exit status 32.
  Aug 14 14:53:48 demoboard systemd-remount-fs[81]: mount: /: mount point not mounted or bad option.
  Aug 14 14:53:48 demoboard systemd-remount-fs[81]:        dmesg(1) may have more information after failed mount system call.
  Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Main process exited, code=exited, status=1/FAILURE
  Aug 14 14:53:48 demoboard systemd[1]: systemd-remount-fs.service: Failed with result 'exit-code'.
  Aug 14 14:53:48 demoboard systemd[1]: Failed to start Remount Root and Kernel File Systems.

also consequentially, 'systemctl status' reported:

  State: degraded

When issuing 'strace -ff mount -o remount /' the failure occurred at

  mount_setattr(3, "", AT_EMPTY_PATH, {attr_set=MOUNT_ATTR_RDONLY|MOUNT_ATTR_NOATIME|MOUNT_ATTR_NODIRATIME, attr_clr=MOUNT_ATTR_NOSUID|MOUNT_ATTR_NODEV|MOUNT_ATTR_NOEXEC|MOUNT_ATTR_NOATIME|MOUNT_ATTR_STRICTATIME|MOUNT_ATTR_NOSYMFOLLOW|0x40, propagation=0 /* MS_??? */, userns_fd=0}, 32) = -1 EINVAL (Invalid argument)

After further investigation, The issue was pinpointed to lack of Linux
kernel commit
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=95de4ad173ca0e61034f3145d66917970961c210
("fs: relax mount_setattr() permission checks") in the kernel version
that was being used. Above mitigation was discussed in email related to
then-rejected CVE-2024-26821:
https://lore.kernel.org/linux-cve-announce/2024051606-imaging-entrench-b327@gregkh/T/

After testing with qemuarm64 machine different linux-yocto versions,
it was observed that the issue impacts following versions of currently
supported LTS kernels:
 - 6.6.17 (fixed since 6.6.18 i.e. mount_setattr() returns 0)
 - 6.1.78 (fixed since 6.1.79 i.e. mount_setattr() returns 0)
 - 5.15.164 which is currently the newest of 5.15.y series (i.e. no
   known working version)

Taking the above findings into consideration, add a new PACKAGECONFIG
option removing which enables users to opt-out from using the feature
which can cause issues with a bit older kernels. The option is enabled
only for class-target here, since it otherwise causes following error
during util-linux-native's do_configure task on Debian 11 build host
(mountfd_api requirement fails):

   | configure: error: libmount_mountfd_support selected, but required mount FDs based API not available

Versions 5.10.223, 5.4.279 and 4.10.317 were also tested with qemuarm64
but the issue was not reproduced with those versions - using strace
showed that the mount_setattr call associated with the new mount API
problem was not issued with these LTS kernel versions, which seemed to
be confirmed also by following libmount debug message in these cases:

  415: libmount:     HOOK: [0x7fa115e818]: failed to init new API

Note: In addition to the aforementioned, this change was tested also
briefly using the current latest kernel versions 6.1.104, 6.6.45 and
6.10.3 that using the old mount API with newest kernels did not
introduce any observable regression to the boot flow.

(From OE-Core rev: dc086d9a8613143607af3583c72ed892e20b4d66)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/util-linux/util-linux_2.39.3.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux_2.39.3.bb b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
index 83b3f4e05b..79ddf2d115 100644
--- a/meta/recipes-core/util-linux/util-linux_2.39.3.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.39.3.bb
@@ -90,7 +90,10 @@ EXTRA_OECONF:append = " --disable-hwclock-gplv3"
 # build host versions during development
 #
 PACKAGECONFIG ?= "pcre2"
-PACKAGECONFIG:class-target ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)}"
+PACKAGECONFIG:class-target ?= "\
+    libmount-mountfd-support \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'chfn-chsh pam', '', d)} \
+"
 # inherit manpages requires this to be present, however util-linux does not have
 # configuration options, and installs manpages always
 PACKAGECONFIG[manpages] = ""
@@ -106,6 +109,13 @@ PACKAGECONFIG[pcre2] = ",,libpcre2"
 PACKAGECONFIG[cryptsetup] = "--with-cryptsetup,--without-cryptsetup,cryptsetup"
 PACKAGECONFIG[chfn-chsh] = "--enable-chfn-chsh,--disable-chfn-chsh,"
 PACKAGECONFIG[selinux] = "--with-selinux,--without-selinux,libselinux"
+# Using the new file descriptors based mount kernel API can cause rootfs remount failure with some older kernels.
+# Of currently supported LTS kernels, the old mount API should be used with:
+# - versions prior to 6.6.18 in the 6.6.y series.
+# - versions prior to 6.1.79 in the 6.1.y series.
+# - versions till at least 5.15.164 in the 5.15.y series.
+# - with 5.10.y, 5.4.y and 4.19.y series kernels, libmount seemed to use the old API regardless of this option.
+PACKAGECONFIG[libmount-mountfd-support] = "--enable-libmount-mountfd-support,--disable-libmount-mountfd-support"
 
 EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} CPU= CPUOPT= 'OPT=${CFLAGS}'"
 
-- 
2.34.1


