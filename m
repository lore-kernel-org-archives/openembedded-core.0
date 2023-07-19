Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314EEC001DC
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 22:50:12 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.765.1689807010122450103
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 15:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SG3QsoUe;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F191160003;
	Wed, 19 Jul 2023 22:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689807007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6GvewsAjnOlrK7sT5jrbooqI5uthKzSM+z6KGq9/Ink=;
	b=SG3QsoUeq/262Xu4WHZ1aXakJb+cGNrb4YvYwZ7cEud+0ic4HEK5I7eTUXhlQfRvMV61d9
	F3OJLmYQ8Jp3mWJD5EwCNQTI0flczP+aSuvfd+hR+Fj3g1/JksEvQtIIh4jHTCKZOhESIh
	AMPYrYPk2lFeQIJc94I48OUmihUhl0CNt3INiEX3safCaODDn78zvflwFrdeDoDzumxqLp
	oJ2MBPwg+2eq4KeIlT768AD+WOuHeq5wDOujZEQTmUm+whQnrqGxxXjoyHoXzdcGf2sii0
	gNE4ftShGYIh1UETp5LvvxYaJma6+/Rb/fuYrR0MOUZTJYG90uNJ4XXUSoZ0Kg==
Date: Thu, 20 Jul 2023 00:50:06 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] python3-jsonschema: upgrade 4.17.3 -> 4.18.3
Message-ID: <202307192250065e23063f@mail.local>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
 <1689585025-23731-16-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689585025-23731-16-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 22:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184618

This fails:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5489/steps/14/logs/stdio

2023-07-19 16:59:12,999 - oe-selftest - INFO - bblayers.BitbakeLayers.test_bitbakelayers_setup (subunit.RemotedTestCase)
2023-07-19 16:59:13,001 - oe-selftest - INFO -  ... FAIL
Stderr:
2023-07-19 16:54:28,044 - oe-selftest - INFO - Adding: "include selftest.inc" in /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/conf/local.conf
2023-07-19 16:54:28,044 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
2023-07-19 16:59:13,001 - oe-selftest - INFO - 2: 5/42 34/529 (20.90s) (0 failed) (bblayers.BitbakeLayers.test_bitbakelayers_setup)
2023-07-19 16:59:13,001 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/bblayers.py", line 152, in test_bitbakelayers_setup
    self.validate_layersjson(jsonfile)
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/bblayers.py", line 143, in validate_layersjson
    result = runCmd("{} {} -i {} {}".format(python, jsonvalidator, json, jsonschema))
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/utils/commands.py", line 212, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/bin/nativepython3 /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/bin/jsonschema -i /home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/meta-selftest/setup-layers.json /home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/files/layers.schema.json' returned non-zero exit status 1:
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/bin/jsonschema", line 5, in <module>
    from jsonschema.cli import main
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/jsonschema/__init__.py", line 13, in <module>
    from jsonschema._format import FormatChecker
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/jsonschema/_format.py", line 11, in <module>
    from jsonschema.exceptions import FormatError
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2056592/tmp/work/x86_64-linux/python3-jsonschema-native/4.18.3-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/jsonschema/exceptions.py", line 15, in <module>
    from referencing.exceptions import Unresolvable as _Unresolvable
ModuleNotFoundError: No module named 'referencing'


Please, test your series before sending them out!


On 17/07/2023 17:10:22+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> =========
> -Properly preserve applicable_validators in extended validators.
> -Fix an additional regression with the deprecated
>  jsonschema.RefResolver and pointer resolution.
> -Fix a regression with jsonschema.RefResolver based resolution when used in
>  combination with a custom validation dialect (via jsonschema.validators.create).
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...ython3-jsonschema_4.17.3.bb => python3-jsonschema_4.18.3.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb => python3-jsonschema_4.18.3.bb} (93%)
> 
> diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
> similarity index 93%
> rename from meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
> rename to meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
> index 24cde3711c..6ce2259f16 100644
> --- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
> +++ b/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
> @@ -4,7 +4,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
>                      file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
>  
> -SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
> +SRC_URI[sha256sum] = "64b7104d72efe856bea49ca4af37a14a9eba31b40bb7238179f3803130fd34d9"
>  
>  inherit pypi python_hatchling
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184452): https://lists.openembedded.org/g/openembedded-core/message/184452
> Mute This Topic: https://lists.openembedded.org/mt/100191315/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

