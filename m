Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC4C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 21:55:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.3194.1667944547959186390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 13:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=n0jBKI32;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3A80E40004;
	Tue,  8 Nov 2022 21:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667944545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CZjSvRNSLjHaX+plDnCm910rHmwG+XoQ5/HRRdt4+mk=;
	b=n0jBKI32r2KvuePaTm2romM36EMkzN6AXfuqCTiOLLPR6e+oSOX2Oz1ooclHt/U/BFdE7Q
	ZcokXfUccHxfcCOleLHS21ysMlNsCZvQmkyJOFdwV/P/JsuJ4MvepZFhoXYmKTi5vBXod8
	M6NkaW5nbDRzlQt3SraN8iVaIEgTT85D/S4gIe15KPI1BoW94EqpYkWesLzwBjZmNtyweL
	mO7Oy+40G5XnYsOG3oswAhssp5MYKsOJ4OjHPQm6i33zddkKxFZmSu3mAd9kF2JymSsyQ0
	f/2V/fLhiSE/msglv3C5Pzqw6rJydYb4lwS8FsV7PcO36xWobeLcJu7L1TBJYw==
Date: Tue, 8 Nov 2022 22:55:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Subject: Re: [OE-core] [PATCH] oeqa/runtime: clean up deprecated backslash
 expansion
Message-ID: <Y2rQYNN8lLh7jxnh@mail.local>
References: <20221107220934.199924-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107220934.199924-1-ross.burton@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 21:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173000

On 07/11/2022 22:09:34+0000, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/lib/oeqa/runtime/cases/apt.py       | 4 ++--
>  meta/lib/oeqa/runtime/cases/buildcpio.py | 7 +++++--
>  meta/lib/oeqa/runtime/cases/systemd.py   | 2 +-
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
> index 4e09374adde..8000645843a 100644
> --- a/meta/lib/oeqa/runtime/cases/apt.py
> +++ b/meta/lib/oeqa/runtime/cases/apt.py
> @@ -39,9 +39,9 @@ class AptRepoTest(AptTest):
>          self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
>  
>      def setup_source_config_for_package_install_signed(self):
> -        apt_get_source_server = 'http:\/\/%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
> +        apt_get_source_server = 'http://%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
>          apt_get_sourceslist_dir = '/etc/apt/'
> -        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's/\[trusted=yes\] http:\/\/bogus_ip:bogus_port/%s/g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
> +        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
>  
>      def cleanup_source_config_for_package_install(self):
>          apt_get_sourceslist_dir = '/etc/apt/'
> diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
> index bd3b46d9ef0..c08de3c914d 100644
> --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> @@ -29,7 +29,10 @@ class BuildCpioTest(OERuntimeTestCase):
>      @OEHasPackage(['autoconf'])
>      def test_cpio(self):
>          self.project.download_archive()
> -        self.project.run_configure('--disable-maintainer-mode',
> -                                   'sed -i -e "/char \*program_name/d" src/global.c;')
> +        self.project.run_configure('--disable-maintainer-mode')
> +        # This sed is needed until
> +        # https://git.savannah.gnu.org/cgit/cpio.git/commit/src/global.c?id=641d3f489cf6238bb916368d4ba0d9325a235afb
> +        # is in a release.
> +        self.project._run(r'sed -i -e "/char \*program_name/d" src/global.c')

I'm pretty sure this breaks:

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/6120/steps/12/logs/stdio

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  [Previous line repeated 1 more time]
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/cases/buildcpio.py", line 36, in test_cpio
    self.project._run(r'sed -i -e "/char \*program_name/d" src/global.c')
  File "/home/pokybuild/yocto-worker/pkgman-rpm-non-rpm/build/meta/lib/oeqa/runtime/utils/targetbuildproject.py", line 43, in _run
    raise Exception(msg)
Exception: Command sed -i -e "/char \*program_name/d" src/global.c failed with exit code 2: sed: can't read src/global.c: No such file or directory

>          self.project.run_make()
>          self.project.run_install()
> diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
> index 720b4b517ae..37f295492d3 100644
> --- a/meta/lib/oeqa/runtime/cases/systemd.py
> +++ b/meta/lib/oeqa/runtime/cases/systemd.py
> @@ -154,7 +154,7 @@ class SystemdJournalTests(SystemdTest):
>          """
>  
>          # The expression chain that uniquely identifies the time boot message.
> -        expr_items=['Startup finished', 'kernel', 'userspace','\.$']
> +        expr_items=['Startup finished', 'kernel', 'userspace', r'\.$']
>          try:
>              output = self.journalctl(args='-o cat --reverse')
>          except AssertionError:
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172937): https://lists.openembedded.org/g/openembedded-core/message/172937
> Mute This Topic: https://lists.openembedded.org/mt/94878419/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

