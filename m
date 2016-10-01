Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5F6D7606B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:24 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id f193so15483410wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4nn+wCIzHP5uEHAe2o+cTBTXH+ldG9Al82y3pX7wMy8=;
	b=w2mCTthfWiHiEPU1aEr7xzk6dUk9ZcpQ25x/B8dY0R+ExVSCM5Ro5VkxA4DmHnY73f
	kvU3Ue3qgI2l2dWrp85T8KIOugGfbfHb6W/O/5akqmg8VUNoweyzybA6Zs5jnf917AUS
	olrYS8ZT1DU2T/+hHVoZOxA+oUUvcmMidH5eZLQJlrH34raVqAnv3Xoouil5GloV03Rr
	AwnjCJOan9CyvnqKidqeszlrIYuW7sbsy55Bge1g+G4y7Bkxkd9bcvUNJkmvQaNzAb1p
	XF93eA6VOjks4W8Ddj0c9kxSDQY9N2Vaoa6wO3IYEziOpfncZ+YEKa5wdy11XWzkDFf8
	GOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4nn+wCIzHP5uEHAe2o+cTBTXH+ldG9Al82y3pX7wMy8=;
	b=LqU5ht7vwGVeoUHkpX2NI2uL3wtahi+LfcEHwaBBw04AYEHgysnTTEXZ/dPMh+CDK9
	c8Anon+Q367FC3oSXfwgk9DhshwP/55KwhYZDJ31OpEg4Pzs5NJ6GLXV0gSv3qW8yNEx
	sFD3128g1vsz5zsPlsmQbw8V98xY82nz8C1vSkbPH6hLBsV4a/Cn9lBEDvTBg4cr1u93
	8jFq2WVyxPZpC/P++S1ua9CC6r5mfB5adcHe7ijaxrFXFOQQShPYtxS9JooOS8+1OaqB
	IejB4Y6iCY5lMgIQUcOHkrMpOwMzXkEtN+SK7dxF5h/AF3rV6d5PRnwd5Ev7KcoVcdo6
	BKOA==
X-Gm-Message-State: AA6/9Rl+7fJZGmdVz7edvRR3IuAA7NmdSiqGmj156O5blCs3X8gdwGYNEhBML4CIiMZ3qg==
X-Received: by 10.194.223.8 with SMTP id qq8mr8706958wjc.7.1475290045357;
	Fri, 30 Sep 2016 19:47:25 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:24 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:49 +0200
Message-Id: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 00/22] Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:27 -0000

Motiving quote:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

This seems to be true from looking at the code. exec_func_python() in
bitbake/lib/bb/build.py raises FuncFailed when it catches the
BBHandledException raised by bb.fatal(). Metadata functions that catch
FuncFailed (e.g. in image.bclass) should still work, per the original purpose
of FuncFailed.

The output might change slightly (imo for the better). Here's an example before
the change:

  ERROR: gettext-0.19.8.1-r0 do_fetch: Function failed: Fetcher failure for URL: 'http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.gz'. ...
  ERROR: Logfile of failure stored in: /home/ulf/poky/build/tmp/work/i586-poky-linux/gettext/0.19.8.1-r0/temp/log.do_fetch.19715

Here's what it looks like after the change:

  ERROR: gettext-0.19.8.1-r0 do_fetch: Fetcher failure for URL: 'http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.gz'. ...
  ERROR: gettext-0.19.8.1-r0 do_fetch: Function failed: base_do_fetch
  ERROR: Logfile of failure stored in: /home/ulf/poky/build/tmp/work/i586-poky-linux/gettext/0.19.8.1-r0/temp/log.do_fetch.19608

I won't get terribly offended if not all of these get merged. Hopefully it
makes people aware that there's a simpler way at least.

There's also a few instances in meta/lib/oe and meta/lib/oeqa that could
probably be replaced, but I got tired and wasn't sure that they're always
called in a context where it'd be safe.

Ulf Magnusson (22):
  base.bbclass: Use bb.fatal() instead of raising FuncFailed
  package_ipk.bbclass: Use bb.fatal() instead of raising FuncFailed
  package_deb.bbclass: Use bb.fatal() instead of raising FuncFailed
  package_rpm.bbclass: Use bb.fatal() instead of raising FuncFailed
  useradd-staticids.bbclass: Use bb.fatal() instead of raising
    FuncFailed
  grub-efi.bbclass: Use bb.fatal() instead of raising FuncFailed
  syslinux.bbclass: Use bb.fatal() instead of raising FuncFailed
  systemd-boot.bbclass: Use bb.fatal() instead of raising FuncFailed
  gummiboot.bbclass: Use bb.fatal() instead of raising FuncFailed
  update-rc.d.bbclass: Use bb.fatal() instead of raising FuncFailed
  license.bbclass: Use bb.fatal() instead of raising FuncFailed
  systemd.bbclass: Use bb.fatal() instead of raising FuncFailed
  gtk-immodules-cache.bbclass: Use bb.fatal() instead of raising
    FuncFailed
  useradd.bbclass: Use bb.fatal() instead of raising FuncFailed
  sstate.bbclass: Use bb.fatal() instead of raising FuncFailed
  chrpath.bbclass: Use bb.fatal() instead of raising FuncFailed
  testsdk.bbclass: Use bb.fatal() instead of raising FuncFailed
  libc-package.bbclass: Use bb.fatal() instead of raising FuncFailed
  package.bbclass: Use bb.fatal() instead of raising FuncFailed
  utility-tasks.bbclass: Use bb.fatal() instead of raising FuncFailed
  testimage.bbclass: Use bb.fatal() instead of raising FuncFailed
  cmake: Use bb.fatal() instead of raising FuncFailed

 meta/classes/base.bbclass                  |  8 ++++----
 meta/classes/chrpath.bbclass               |  3 +--
 meta/classes/grub-efi.bbclass              |  8 ++++----
 meta/classes/gtk-immodules-cache.bbclass   |  2 +-
 meta/classes/gummiboot.bbclass             |  6 +++---
 meta/classes/libc-package.bbclass          |  2 +-
 meta/classes/license.bbclass               |  4 ++--
 meta/classes/package.bbclass               |  2 +-
 meta/classes/package_deb.bbclass           | 10 +++++-----
 meta/classes/package_ipk.bbclass           | 10 +++++-----
 meta/classes/package_rpm.bbclass           |  6 +++---
 meta/classes/sstate.bbclass                |  2 +-
 meta/classes/syslinux.bbclass              |  8 ++++----
 meta/classes/systemd-boot.bbclass          |  6 +++---
 meta/classes/systemd.bbclass               |  3 +--
 meta/classes/testimage.bbclass             |  2 +-
 meta/classes/testsdk.bbclass               |  2 +-
 meta/classes/update-rc.d.bbclass           |  4 ++--
 meta/classes/useradd-staticids.bbclass     |  8 ++++----
 meta/classes/useradd.bbclass               |  2 +-
 meta/classes/utility-tasks.bbclass         |  2 +-
 meta/recipes-devtools/cmake/cmake_3.6.1.bb |  2 +-
 22 files changed, 50 insertions(+), 52 deletions(-)

-- 
2.7.4


