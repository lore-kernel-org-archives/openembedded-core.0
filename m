Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFFBCCF2E3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 12:30:02 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32827.1792411787753550622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 05:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=kmBTW0BA;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=hbodzoko;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792411785; x=1793016585;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=7domJ/KVnit8QFHq1K7d8kQKPhwhxi6R/HLLpL9l3Jo=;
	b=kmBTW0BAP0iO+hmyUyvYlDzQp13zAdUEkI4X7Q9Ue18Mj16BjVKGAQFc7dRfEm4A6Vl7SQJd6gSe3
	 yWfDZzmXu78z/4YkL1bd5HRwzjXrhp0uXYrn5xLRBGBgybAId/0J2Z+boXmlwwurHzkeohEAFYbiPj
	 q4LklMzkcLdwJVwLHNOBL0ycOiuBTkl6vkUEaVlyUvn9l56t00BhBbB05ZJMmedLJXQYNIciKxYnX5
	 OeHUsMaQpODyn/mKPyR6ytIa/o7kcGuWwM1O7jddFiPrCUTjoMRJWHzDw6Td/c/6XxiOUXOkuhJ+rN
	 hUMNq7omvMU6tNXtgrcIjtFlKuCLKFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792411785; x=1793016585;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=7domJ/KVnit8QFHq1K7d8kQKPhwhxi6R/HLLpL9l3Jo=;
	b=hbodzokoLLSMmhzAloLEUOwOiiEEV2M+S5oE+F7ee8ztHjodClZTcY5bsXSvHCZfHoN2dB7IILtKR
	 7e+Z4KvDw==
X-HalOne-ID: f7e33640-cbb5-11f1-8278-7d3e33f7de26
Received: from [IPV6:2a02:3102:8c10:1ae0:8ef1:f8eb:f1e:99b9] (dynamic-2a02-3102-8c10-1ae0-8ef1-f8eb-0f1e-99b9.310.pool.telefonica.de [2a02:3102:8c10:1ae0:8ef1:f8eb:f1e:99b9])
	by mailrelay1.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id f7e33640-cbb5-11f1-8278-7d3e33f7de26;
	Mon, 19 Oct 2026 12:09:44 +0000 (UTC)
Message-ID: <2054b497-3add-46b9-8dcc-051fae96262c@embetrix.com>
Date: Mon, 19 Oct 2026 14:09:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] minicom: fix baud rate setting with glibc 2.42 and newer
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
 <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr>
 <2cc2f09f-9f7b-4014-bb02-1d1eff6d9647@embetrix.com>
 <CAMSfU+6JRV-m2c8zNRCD48N_-TUm7uQsk87XFrC++Ue1e_HFaA@mail.gmail.com>
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
In-Reply-To: <CAMSfU+6JRV-m2c8zNRCD48N_-TUm7uQsk87XFrC++Ue1e_HFaA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 12:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248163

Hi Yoann,

On 10/19/26 10:16, Yoann Congal wrote:
> 
> 
> Le lun. 19 oct. 2026 à 10:04, Ayoub Zaki <ayoub.zaki@embetrix.com 
> <mailto:ayoub.zaki@embetrix.com>> a écrit :
> 
>     Hi Yoann,
> 
> 
>     On 10/19/26 08:43, Yoann Congal wrote:
>      > On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via
>     lists.openembedded.org <http://lists.openembedded.org> wrote:
>      >> Backport the upstream baud rate fix to minicom 2.10 in wrynose.
>      >>
>      >> glibc 2.42 added support for arbitrary termios baud rates on
>     Linux and
>      >> changed the Bxxx speed constants from bitmasks to integer baud
>     rates.
>      >> The macros combine these values directly with c_cflag, resulting in
>      >> incorrect baud rates and garbled UART output. Use the libc functions
>      >> instead.
>      >>
>      >> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com
>     <mailto:ayoub.zaki@embetrix.com>>
>      >> ---
>      >>   ...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++++++++++
>     ++++++++
>      >>   meta/recipes-extended/minicom/minicom_2.10.bb <http://
>     minicom_2.10.bb> |  4 +-
>      >>   2 files changed, 44 insertions(+), 1 deletion(-)
>      >>   create mode 100644 meta/recipes-extended/minicom/files/0001-
>     src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch
>      >
>      > Hello,
>      >
>      > I think this patch is breaking tests:
>      > * oe-selftest-armhost ubuntu2404-vk-arm1 wrynose completed at
>     2026-10-19 03:27:48+00:00
>      > https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/
>     builds/5117 <https://autobuilder.yoctoproject.org/valkyrie/#/
>     builders/23/builds/5117>
>      > * oe-selftest-debian ubuntu2604-vk-3 wrynose completed at
>     2026-10-19 01:47:03+00:00
>      > https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/
>     builds/5086 <https://autobuilder.yoctoproject.org/valkyrie/#/
>     builders/35/builds/5086>
>      > * oe-selftest-fedora opensuse156-vk-1 wrynose completed at
>     2026-10-19 01:47:59+00:00
>      > https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/
>     builds/4898 <https://autobuilder.yoctoproject.org/valkyrie/#/
>     builders/48/builds/4898>
>      >
>      > | 2026-10-18 23:09:29,596 - oe-selftest - INFO -
>     devtool.DevtoolUpdateTests.test_devtool_update_recipe
>     (subunit.RemotedTestCase)
>      > | 2026-10-18 23:09:29,597 - oe-selftest - INFO -  ... FAIL
>      > |
>      > | Stderr:
>      > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
>     selftest.inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/
>     build/build-st-1224754/conf/local.conf
>      > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
>     bblayers.inc" in bblayers.conf
>      > | 2026-10-18 23:09:29,599 - oe-selftest - INFO - 0: 6/66 96/678
>     (58.37s) (0 failed)
>     (devtool.DevtoolUpdateTests.test_devtool_update_recipe)
>      > | 2026-10-18 23:09:29,599 - oe-selftest - INFO -
>     testtools.testresult.real._StringException: Traceback (most recent
>     call last):
>      > |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
>     layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
>     line 1215, in test_devtool_update_recipe
>      > |     result = runCmd('git add minicom',
>     cwd=os.path.dirname(recipefile))
>      > |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
>     layers/openembedded-core/meta/lib/oeqa/utils/commands.py", line 214,
>     in runCmd
>      > |     raise AssertionError("Command '%s' returned non-zero exit
>     status %d:\n%s" % (command, result.status, exc_output))
>      > | AssertionError: Command 'git add minicom' returned non-zero
>     exit status 128:
>      > | fatal: pathspec 'minicom' did not match any files
>      > |
>      > | 2026-10-18 23:09:37,115 - oe-selftest - INFO -
>     devtool.DevtoolUpdateTests.test_devtool_update_recipe_append
>     (subunit.RemotedTestCase)
>      > | 2026-10-18 23:09:37,115 - oe-selftest - INFO -  ... FAIL
>      > |
>      > | Stderr:
>      > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
>     selftest.inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/
>     build/build-st-1224754/conf/local.conf
>      > | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include
>     bblayers.inc" in bblayers.conf
>      > | 2026-10-18 23:09:37,116 - oe-selftest - INFO - 0: 7/66 97/678
>     (7.52s) (2 failed)
>     (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)
>      > | 2026-10-18 23:09:37,116 - oe-selftest - INFO -
>     testtools.testresult.real._StringException: Traceback (most recent
>     call last):
>      > |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
>     layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
>     line 1305, in test_devtool_update_recipe_append
>      > |     self._check_repo_status(os.path.dirname(recipefile), [])
>      > |     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      > |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
>     layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py",
>     line 138, in _check_repo_status
>      > |     self.fail('Unexpected modified file in line: %s' % line)
>      > |     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>      > |   File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
>      > |     raise self.failureException(msg)
>      > | AssertionError: Unexpected modified file in line: ?? meta/
>     recipes-extended/minicom/files/0001-Change-the-README.patch
>      >
>      >
>      > Can you look into this please?
> 
> 
> 
>     Thanks for reporting this:
>     The patch exposes a hardcoded minicom/ directory assumption in the
>     devtool selftests:
>     https://github.com/openembedded/openembedded-core/blob/master/meta/lib/
>     oeqa/selftest/cases/devtool.py#L1360 <https://github.com/
>     openembedded/openembedded-core/blob/master/meta/lib/oeqa/selftest/
>     cases/devtool.py#L1360>.
> 
>     devtool puts generated patches in the existing files/ directory but the
>     tests stage and clean up minicom/ causing both failures.
> 
>     Could we fix those selftest assumptions separately?
> 
> 
> Yes, the test must be updated to match the modified recipe. Can you send 
> a v2 as a series, with the test fix included?
> 

The same directory assumptions affect several other devtool selftests. 
I’ll send separate fixes for master and wrynose to address this more 
generally.

Once the selftest fix is applied to wrynose, the original minicom patch 
can be applied unchanged.

Thanks,


Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Mobile   : +4917662901545
Email    : ayoub.zaki@embetrix.com
Homepage : https://embetrix.com
VAT No.  : DE313902634


