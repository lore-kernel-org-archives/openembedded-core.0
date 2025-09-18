Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7DACCAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 21:08:20 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.272.1758229693678711923
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 14:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=LeatWZRu;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-1329275-2025091821081141ec2e213e00020795-465u0p@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2025091821081141ec2e213e00020795
        for <openembedded-core@lists.openembedded.org>;
        Thu, 18 Sep 2025 23:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=xIS3rbVE2szwqIXaoq8AjT6E4BvnEDcpuBitHLnwjVo=;
 b=LeatWZRuLMQiMQKUCFV2kcyUEzcf8Q7wJa1cIacoONtlDJtKDR5mkXKyPQCKK/Np+Wal4t
 YHZGnwyFA24T9KUzDha8jQ0tScAzGoDUVKJFT1CqJ5agsozPzotTx0GPLhpDInBwB/nonuig
 7ROdG46LglSfiAA8WiJWSG/J4rrD7Rp7lne8Y7FToY3N4w1sv60o8oLYjVANxH+e00PAnniZ
 sfkAJcVy0t4TOk2dgVMuxj8ymPZCwp+vbPYo94d3GP0ZmZGoV5dbxWjGntE63MI6OPGVtlrR
 IiTVrVz+BSXmLyu22dYzmTXDJG7lL1MXxTtAFwIEqnVzvnjD+Y69Qu2A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 01/19] fedora_essential.sh: add util-linux-script package
Date: Thu, 18 Sep 2025 23:07:03 +0200
Message-ID: <20250918210754.477049-2-adrian.freihofer@siemens.com>
In-Reply-To: <20250918210754.477049-1-adrian.freihofer@siemens.com>
References: <20250918210754.477049-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 21:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223659

From: Adrian Freihofer <adrian.freihofer@siemens.com>

The util-linux-script package provides the 'script' command which is
required by devtool for terminal session recording functionality.

Without this package this error can occur on Fedora 42:

/bin/sh: line 1: script: command not found
Traceback (most recent call last):
  File "/home/adrian/projets/oss/poky/scripts/devtool", line 352, in <module>
    ret = main()
  File "/home/adrian/projets/oss/poky/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/adrian/projets/oss/poky/scripts/lib/devtool/ide_sdk.py", line 980, in ide_setup
    exec_build_env_command(
    ~~~~~~~~~~~~~~~~~~~~~~^
        config.init_path, basepath, bb_cmd_early, watch=True)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/adrian/projets/oss/poky/scripts/lib/devtool/__init__.py", line 47, in exec_build_env_command
    return exec_watch('%s%s' % (init_prefix, cmd), **options)
  File "/home/adrian/projets/oss/poky/scripts/lib/devtool/__init__.py", line 73, in exec_watch
    raise bb.process.ExecutionError(cmd, process.returncode, buf, None)
bb.process.ExecutionError: Execution of 'script -e -q -c "bitbake oe-selftest-image:do_build \
  cmake-example:do_install gdb-cross-x86_64:do_addto_recipe_sysroot meson-example:do_install" «
  /dev/null' failed with exit code 127:
/bin/sh: line 1: script: command not found

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/tools/host_packages_scripts/fedora_essential.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/tools/host_packages_scripts/fedora_essential.sh b/documentation/tools/host_packages_scripts/fedora_essential.sh
index ea14134398b..f65b0494e85 100644
--- a/documentation/tools/host_packages_scripts/fedora_essential.sh
+++ b/documentation/tools/host_packages_scripts/fedora_essential.sh
@@ -1 +1 @@
-sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip wget which xz zstd
+sudo dnf install bzip2 ccache chrpath cpio cpp diffstat diffutils file findutils gawk gcc gcc-c++ git glibc-devel glibc-langpack-en gzip hostname libacl make patch perl perl-Data-Dumper perl-File-Compare perl-File-Copy perl-FindBin perl-Text-ParseWords perl-Thread-Queue perl-bignum perl-locale python python3 python3-GitPython python3-jinja2 python3-pexpect python3-pip rpcgen socat tar texinfo unzip util-linux-script wget which xz zstd
-- 
2.51.0


