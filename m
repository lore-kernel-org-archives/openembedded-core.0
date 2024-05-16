Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70153C25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 08:52:06 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.8518.1715849522117285417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 01:52:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PTJ7tUto;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f72a29f13so607124e87.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 01:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715849520; x=1716454320; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9iCbzB1mNp/0nMMhNtp+Ihg0KhC/ZaY/gPDLdErEAjA=;
        b=PTJ7tUto4TLQCqWBsDqNkV0lVERmtXVDRhgMbcUDWPzDrhEmCTI11uQutYIM/mfIRm
         z2jrQOG/fBBH3uZC3vyfgr4pmxFZla2m99xC8wqV5S7LQSv14eY+dtiLW8C2iW/smb+R
         Zqyb44moJQZ5nbtQzm3bFDlCX802ohJS2Ktv7N0CyXz89regfaJkPKzkdzFBw74e7Itn
         3RS7txwLow5mBORCzMzHbzdCix1plwsyxMD/ySNN9JP2VwfdzVa02YTHpyxCL6063VAL
         2qbuHnXqfg6bYsMxDGmIIHugHuo/VWjIdRx0IdkPic1RDhB2KiJh0/JrXz7EWbnMUaQh
         1E+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715849520; x=1716454320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iCbzB1mNp/0nMMhNtp+Ihg0KhC/ZaY/gPDLdErEAjA=;
        b=k8EHKBpkYlYhwIImh3qmhkRor0icLXOsQZTkFe6TQ/n9R5W5DMIisFdzBwGZN5OpXR
         Sz3z5nMqLxUzOoKKX+GHod1Hzm6Pbvi7Heo9/LXzt6/uxVSPwzlCYVCPTNCUZAcx9sVe
         TGVMKcJA68yPpmWxaqcfAptCn17ZaU6YUZ5ivJklguLHagFIunu8FNfMlSDnHg0yt2zV
         e08+rN3A3bqdDryooEI+dh9a3pZdFZbcwAoML7JTudULVGOeXISl/rtlPeA2vqPeahLa
         x9zsoFLskupMf+Bx3F4asabNvt+aGwyOF8cDmCoUes94PZmBqsKsoH7vUsVVVoVMB63T
         GGgw==
X-Gm-Message-State: AOJu0Yynz0UdxRZoOE1bD5Q02TRbeBED9AoFUmEzsFg+XJ01cEksTSYe
	FWzYBaVbjNzTaJ3fc7kWv/QFJ8huETnkd+sjNP2/PMisPZxioKmHxFcp3C9YZndgUZcCn8WjUwU
	8oxyJaqRjTJLU8CxZTzH3mmOGBA82usQZ
X-Google-Smtp-Source: AGHT+IHgdN6TwmR6DVZyFfagq7GA79EdHgjoRXoFRbcb4kxy9yLu34VtkwPRBKe2sorjptbCHVp6rTaKauGnvCfGx2w=
X-Received: by 2002:ac2:4e0f:0:b0:51d:a1ca:5f26 with SMTP id
 2adb3069b0e04-5221006f7b4mr13090146e87.20.1715849519939; Thu, 16 May 2024
 01:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240516001212.1607584-1-seungkyun.kim@lge.com>
In-Reply-To: <20240516001212.1607584-1-seungkyun.kim@lge.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 16 May 2024 10:51:47 +0200
Message-ID: <CANNYZj-AoZ-ketLiSJtTknE1ATaYV=uF643dGaQoToW_r=3VPw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] ipk/rootfs: run sanity test of multilib in parallel
To: seungkyun.kim@lge.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 08:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199446

The code adds significant complexity, and the patch is difficult to
understand. The commit message should explain what the temporary
installation does, and why is needed. What does 'sanity test' do, and
how is it parallelized? Is it a part of that 'temporary installation'?
How is 'Installing package groups through opkg takes much more time
than copying directory.' relevant to all of that?

Also, if it does improve performance, can you please provide some
numbers for that, based on poky?

Alex

On Thu, 16 May 2024 at 02:12, Seungkyun Kim via lists.openembedded.org
<seungkyun.kim=lge.com@lists.openembedded.org> wrote:
>
> From: "seungkyun.kim" <seungkyun.kim@lge.com>
>
> For multilib type packages, there is an additional temporary
> installation before the actual installation. It makes almost doubles
> the do_rootfs time if having many multilib type packages.
> To avoid this overhead, run sanity test in parallel.
> Installing package groups through opkg takes much more time than
> copying directory.
>
> - Changes in V2:
>     Fix FileNotFoundError exception when copying rootfs
> - Changes in V3:
>     Removed unnecessary test call
> - Changes in V4:
>     Fix invalid argument when create Process
>     Keep the temporary rootfs directory after sanity check
>
> Signed-off-by: seungkyun.kim <seungkyun.kim@lge.com>
> ---
>  meta/lib/oe/package_manager/ipk/rootfs.py | 34 +++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
> index ba93eb62ea..a3842a6264 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -6,7 +6,9 @@
>
>  import re
>  import filecmp
> +import multiprocessing
>  import shutil
> +import stat
>  from oe.rootfs import Rootfs
>  from oe.manifest import Manifest
>  from oe.utils import execute_pre_post_process
> @@ -197,11 +199,34 @@ class PkgRootfs(DpkgOpkgRootfs):
>                          files[key] = item
>
>      def _multilib_test_install(self, pkgs):
> +        def _copy_rootfs(src, dst):
> +            if os.path.islink(src):
> +                linkto = os.readlink(src)
> +                if os.path.isabs(linkto):
> +                    linkto = os.path.normpath(os.path.join(os.path.dirname(dst),
> +                                                           os.path.relpath(linkto, src)))
> +                os.symlink(linkto, dst)
> +            elif os.path.isfile(src):
> +                shutil.copy2(src, dst)
> +            elif stat.S_ISFIFO(os.stat(src).st_mode):
> +                os.mkfifo(dst)
> +            else:
> +                bb.warn("Skip unsupported file type: %s" % src)
> +
>          ml_temp = self.d.getVar("MULTILIB_TEMP_ROOTFS")
> +        rootfs_temp = os.path.join(ml_temp, "rootfs")
>          bb.utils.mkdirhier(ml_temp)
> +        bb.utils.remove(rootfs_temp, True)
>
> -        dirs = [self.image_rootfs]
> +        if os.path.exists(self.image_rootfs):
> +            shutil.copytree(self.image_rootfs, rootfs_temp, copy_function=_copy_rootfs)
> +        else:
> +            bb.utils.mkdirhier(rootfs_temp)
> +        dirs = [rootfs_temp]
> +        return multiprocessing.Process(target=self._multilib_test_pkg_install,
> +                                       args=(pkgs, ml_temp, dirs,))
>
> +    def _multilib_test_pkg_install(self, pkgs, ml_temp, dirs):
>          for variant in self.d.getVar("MULTILIB_VARIANTS").split():
>              ml_target_rootfs = os.path.join(ml_temp, variant)
>
> @@ -300,15 +325,20 @@ class PkgRootfs(DpkgOpkgRootfs):
>
>          for pkg_type in self.install_order:
>              if pkg_type in pkgs_to_install:
> +                sanity_test = None
>                  # For multilib, we perform a sanity test before final install
>                  # If sanity test fails, it will automatically do a bb.fatal()
>                  # and the installation will stop
>                  if pkg_type == Manifest.PKG_TYPE_MULTILIB:
> -                    self._multilib_test_install(pkgs_to_install[pkg_type])
> +                    sanity_test= self._multilib_test_install(pkgs_to_install[pkg_type])
> +                    sanity_test.start()
>
>                  self.pm.install(pkgs_to_install[pkg_type],
>                                  [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
>
> +                if sanity_test is not None:
> +                    sanity_test.join()
> +
>          if self.progress_reporter:
>              self.progress_reporter.next_stage()
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199435): https://lists.openembedded.org/g/openembedded-core/message/199435
> Mute This Topic: https://lists.openembedded.org/mt/106125799/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

