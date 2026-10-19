Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287EACCF2D3
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:13:44 +0000 (UTC)
Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29624.1792397099829144221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=ckeBF/V2;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=K2sEO4bG;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792397096; x=1793001896;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=rqfCo097XoSr0vSKRRvAwyOp3GpwZIPaSbv9FucXi08=;
	b=ckeBF/V2sxwObYnHetFtFuj8OliGS+O/pt6oVUle12KK7QfPDswfSQ4exh89DF6WMBLDZJXKZ+Ga8
	 Zw2KzG8cgKSAodln6Z7EuoYG/q70pUyvoAQg9+vvpywzTYVhyB72RQds3w/squ8/Sa0ylwGVxxB8K/
	 SzLfPTudizL0UZvMeUJj/7aGz9UygWG36ULZoXu+Ibqq/dlhyo9LpCyLUshkpxCyXb+EtvsqfrUsUK
	 ITiq9ittpGTaq0TqK0xidkN7UOjsvcftJvJbEt4b+yQxT3sTBxWLQlnbGCv1rLcZV1rxsmpHbUoZ9S
	 YcilpftgrG4Awu8rYJJfwhF4UGguSsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792397096; x=1793001896;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:to:subject:
	 mime-version:date:message-id:from;
	bh=rqfCo097XoSr0vSKRRvAwyOp3GpwZIPaSbv9FucXi08=;
	b=K2sEO4bGpvh2hl4gPM1sgfXLE6fDaumjBlEJ3TIiIdk+foUx/S43UOXBx2CiHRRMbxflz//+d3lHO
	 I5W6AUsCA==
X-HalOne-ID: c4fac5bb-cb93-11f1-8152-33fc7c51c1c8
Received: from [IPV6:2a02:3102:8c10:1ae0:8ef1:f8eb:f1e:99b9] (dynamic-2a02-3102-8c10-1ae0-8ef1-f8eb-0f1e-99b9.310.pool.telefonica.de [2a02:3102:8c10:1ae0:8ef1:f8eb:f1e:99b9])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id c4fac5bb-cb93-11f1-8152-33fc7c51c1c8;
	Mon, 19 Oct 2026 08:04:56 +0000 (UTC)
Message-ID: <2cc2f09f-9f7b-4014-bb02-1d1eff6d9647@embetrix.com>
Date: Mon, 19 Oct 2026 10:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH] minicom: fix baud rate setting with glibc 2.42 and newer
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20261017111813.53186-1-ayoub.zaki@embetrix.com>
 <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr>
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
In-Reply-To: <DM8M06OIXDWR.1KFR0FLAQLZC2@smile.fr>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248138

Hi Yoann,


On 10/19/26 08:43, Yoann Congal wrote:
> On Sat Oct 17, 2026 at 1:18 PM CEST, Ayoub Zaki via lists.openembedded.org wrote:
>> Backport the upstream baud rate fix to minicom 2.10 in wrynose.
>>
>> glibc 2.42 added support for arbitrary termios baud rates on Linux and
>> changed the Bxxx speed constants from bitmasks to integer baud rates.
>> The macros combine these values directly with c_cflag, resulting in
>> incorrect baud rates and garbled UART output. Use the libc functions
>> instead.
>>
>> Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
>> ---
>>   ...ove-cfset-i-o-speed-macros-for-glibc.patch | 41 +++++++++++++++++++
>>   meta/recipes-extended/minicom/minicom_2.10.bb |  4 +-
>>   2 files changed, 44 insertions(+), 1 deletion(-)
>>   create mode 100644 meta/recipes-extended/minicom/files/0001-src-sysdep.h-remove-cfset-i-o-speed-macros-for-glibc.patch
> 
> Hello,
> 
> I think this patch is breaking tests:
> * oe-selftest-armhost ubuntu2404-vk-arm1 wrynose completed at 2026-10-19 03:27:48+00:00
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/5117
> * oe-selftest-debian ubuntu2604-vk-3 wrynose completed at 2026-10-19 01:47:03+00:00
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/5086
> * oe-selftest-fedora opensuse156-vk-1 wrynose completed at 2026-10-19 01:47:59+00:00
>    https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4898
> 
> | 2026-10-18 23:09:29,596 - oe-selftest - INFO - devtool.DevtoolUpdateTests.test_devtool_update_recipe (subunit.RemotedTestCase)
> | 2026-10-18 23:09:29,597 - oe-selftest - INFO -  ... FAIL
> |
> | Stderr:
> | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include selftest.inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1224754/conf/local.conf
> | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> | 2026-10-18 23:09:29,599 - oe-selftest - INFO - 0: 6/66 96/678 (58.37s) (0 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe)
> | 2026-10-18 23:09:29,599 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1215, in test_devtool_update_recipe
> |     result = runCmd('git add minicom', cwd=os.path.dirname(recipefile))
> |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> |     raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> | AssertionError: Command 'git add minicom' returned non-zero exit status 128:
> | fatal: pathspec 'minicom' did not match any files
> |
> | 2026-10-18 23:09:37,115 - oe-selftest - INFO - devtool.DevtoolUpdateTests.test_devtool_update_recipe_append (subunit.RemotedTestCase)
> | 2026-10-18 23:09:37,115 - oe-selftest - INFO -  ... FAIL
> |
> | Stderr:
> | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include selftest.inc" in /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-1224754/conf/local.conf
> | 2026-10-18 23:00:35,915 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> | 2026-10-18 23:09:37,116 - oe-selftest - INFO - 0: 7/66 97/678 (7.52s) (2 failed) (devtool.DevtoolUpdateTests.test_devtool_update_recipe_append)
> | 2026-10-18 23:09:37,116 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
> |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 1305, in test_devtool_update_recipe_append
> |     self._check_repo_status(os.path.dirname(recipefile), [])
> |     ~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openembedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 138, in _check_repo_status
> |     self.fail('Unexpected modified file in line: %s' % line)
> |     ~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> |   File "/usr/lib/python3.14/unittest/case.py", line 750, in fail
> |     raise self.failureException(msg)
> | AssertionError: Unexpected modified file in line: ?? meta/recipes-extended/minicom/files/0001-Change-the-README.patch
> 
> 
> Can you look into this please?



Thanks for reporting this:
The patch exposes a hardcoded minicom/ directory assumption in the 
devtool selftests:
https://github.com/openembedded/openembedded-core/blob/master/meta/lib/
oeqa/selftest/cases/devtool.py#L1360.

devtool puts generated patches in the existing files/ directory but the 
tests stage and clean up minicom/ causing both failures.

Could we fix those selftest assumptions separately?




Mit freundlichen Grüßen / Kind regards

-- 
Ayoub Zaki
Embedded Systems Consultant

Vaihinger Straße 2/1
D-71634 Ludwigsburg

Email    : ayoub.zaki@embetrix.com
Homepage : https://embetrix.com
VAT No.  : DE313902634


