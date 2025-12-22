Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD51E67810
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 18:36:54 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86121.1766428606862941405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 10:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=d73TwIKs;
 spf=pass (domain: baylibre.com, ip: 209.85.222.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b25ed53fcbso574265985a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 10:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1766428606; x=1767033406; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahkJ6Yv3f0bqcFogz7b/HayxJBOss8VD39BbGwQ6kQo=;
        b=d73TwIKsPzIy72p8ftphEc6QPjtgLZhLnw4+xNrL0clxbVawt3u+aON//H5/Cx2bnX
         pLHuqC+bKMdewy26B2GgBXPxTDGUSzhkXJWdgRwXubzDSiKIqRwniVtq26wo2rIWVG+I
         vga4VZNktBWhhP9DXZPDw2OxNskCVGJxbh7W33hVPTpPanW91ovch0XPHEDe2OgOZZEB
         jGh+0QDC4WdCJblK47fZbYVnAfk6Lcr44gSiiwvOVznSi+MQtsEaESz7Wgx/tV3NLmlf
         63nByTsQ8dod6ki9cMNc34Ks2QYAmUh/EY2x9IJ2TQ0dP+cK1vDHXtNJbvcgUQbJRCgi
         Xgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766428606; x=1767033406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahkJ6Yv3f0bqcFogz7b/HayxJBOss8VD39BbGwQ6kQo=;
        b=Hy2qy1K6+9F2J6L5eAuZusK8touhfjbOmLvMBDjM/sIvUvIABPqAi/kJ5y8o8UgVYC
         zDiRO6x72+ObhPz0IjqehESKtUvrpLrc+RRRBozRkwmrOmiJR9JdCWj8B5LoDEe+8/ch
         FLw0BJ5hCAXD6/9EzjZ7p4apjUo0mfpDnoIl5BRcsnNzK+z4LK1WRpERPG74qP3o5abe
         ckeHAlbhqUsalvxFU7RmCU7kz7gWFLpEfjX5c+uPCt7hZF2OxAXcuKRhjtt7Z8eRvABP
         pWp09XW90qa2Pmqly+DpQjzEEU7Sj2prfk+M/XkwOYt/i77xOnMVn+yU00bsDFjP0KNz
         mWdw==
X-Forwarded-Encrypted: i=1; AJvYcCUvlTWThdqizoW4nCXEvaYSn8d8k4EhkkenUFjtOGIE3pOfwbtPRKS/rfQ1kvt8kfPEfm2p5acu11vesbFef7AXmQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsMrrMtD4tcQU4wwAfYFC4zIIzUrx04rMdj74nozmdPiquaOYu
	bkfQGMORn3gDeUMGH4iVokl73klt01HspyjkzChIpNA5zFyjlfpCpmcyakmujpQ5zUbTRgSEXMh
	xZC2cMYA=
X-Gm-Gg: AY/fxX77ZDPhZBMHiuqk3smRe+GX1as+92LgrdcHY7slZv4cNZYxZLo8V3eDD+CAQBa
	M/k6HKf35RUAOpxtLMr8Li3Wt9NQTvmkK041kZKPKiq9/pXgXs4ZY4ImHDe4GxcfRy+ptbox5+9
	goQ+wrw1JitXSsMtVQKv257p7AtpWavoLxv+1tKcS8eQ8J/F9YvSjzEebqfzSWHuivSub/frLbs
	sUMsu/RmVzlaRpS4n4zoQlAyWhA770bKgdWc6kxVfyUYIgvIby2TomVFbmb8EtXxAQNgyuh6LQK
	uxNWlO1EH7Dalg2YIFh+Ob9RNXckwEK1fOorCE3i4eLLY1d4GM99DJjUNqm27p2YZsTGoyUVUmJ
	/idTPgWpZDUPErw4XGn7wxJ23/Q/oyaYgMeubNiLuGJYa62s6BY3Ov0jW2Ve0c2SLClRLb5uZd9
	U7wB9/6GsrQpfxiGCNCkhsKL9A2aaIeOPrg1oOsCaXWviIGEFRMCAsRQxl+RSDRD+Y
X-Google-Smtp-Source: AGHT+IHJHZXq96duFBjiAMnCOTV7aLj/0B8MdoXfgnl2FRyWRPmWroBPdXCw1j9d9gOS8dVFln7rjw==
X-Received: by 2002:a05:620a:7004:b0:8b2:a049:4ac4 with SMTP id af79cd13be357-8c08f669593mr1853900885a.27.1766428605604;
        Mon, 22 Dec 2025 10:36:45 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c09689246asm888244085a.20.2025.12.22.10.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 10:36:44 -0800 (PST)
Message-ID: <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
Date: Mon, 22 Dec 2025 13:36:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 18:36:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228321


On 2025-12-22 03:11, Mathieu Dubois-Briand wrote:
> On Fri Dec 19, 2025 at 2:47 PM CET, Trevor Gamblin wrote:
>> Compared to v1
>> (https://lists.openembedded.org/g/openembedded-core/message/227955):
>>
>> - Drop python3-bcrypt upgrade, as someone else has submitted that;
>> - Drop rpm patch to manually override Python3_SITEARCH with a patch, as that was
>>    masking the real issue (see below);
>> - Add a new patch to fix python3targetconfig by exporting _PYTHON_PROJECT_BASE,
>>    which Python's sysconfig looks for (as of 3.14.0) when doing
>>    cross-compilation. The absence of this was resulting in packages like rpm
>>    finding paths for the native interpreter when making use of sysconfig, when
>>    they needed the host values.
>>
>> Note that I've dropped my own version of the python3-bcrypt upgrade, but I
>> tested this patch series on top of the other one that was submitted, as
>> otherwise the ptest images would break during build (version mismatch errors
>> around PyO3, which is fixed with the bcrypt upgrade).
>>
>> v1 details below.
>>
>> This supersedes a previous series sent, which only did the 3.14.0 upgrade.
>>
>> Compared to the first series
>> (https://lists.openembedded.org/g/openembedded-core/message/227310), I've
>> done the following:
>>
>> - Added a commit for including the '_py_warnings' and 'annotationlib' modules in
>>    python3-core;
>> - Adds the python 3.14.2 upgrade;
>> - Removed commits for adding python3-misc to RDEPENDS for python3-pytest and
>>    python3-jsonpointer, as these are now solved by a new patch to add new modules
>>    to python3-core in the manifest. Doing it this way was fragile in the sense
>>    that there were many other recipes needing this same fix that testing didn't
>>    easily catch, and it doesn't make sense to add python3-misc to recipe RDEPENDS
>>    just because (for example) python3-logging (another package split) is trying
>>    to make use of warnings, but can't find the right module;
>> - Modified the rpm commit to apply a patch (submitted upstream) to fix
>>    CMakeLists.txt, rather than a do_configure prepend;
>> - Fixed the Python 3.14.0 upgrade commit so that one of the patches we carry to
>>    skip tests doesn't include duplicate calls to the relevant skip functions.
>>
>> I've kept the upgrades from 3.13.9 to 3.14.0 and 3.14.0 to 3.14.2 separate to
>> reflect separate testing and let people review those changelogs individually if
>> desired.
>>
>> Trevor Gamblin (5):
>>    python3: upgrade 3.13.9 -> 3.14.0
>>    python3targetconfig: export _PYTHON_PROJECT_BASE
>>    python_pep517: add --prefix to nativepython3 call
>>    python3: upgrade 3.14.0 -> 3.14.2
>>    python3: add _py_warnings, annotationlib to core
>>
> Hi Trevor,
>
> Thanks for the new version. It looks like we are having issues with
> maturin and click.
>
> Testing 'maturin develop' requires Rust cross-canadian in the SDK
> Traceback (most recent call last):
>    File "/srv/pokybuild/yocto-worker/qemux86/build/layers/openembedded-core/meta/lib/oeqa/sdk/cases/maturin.py", line 30, in test_maturin_list_python
>      self.assertIn(expected, output)
>      ~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^
> AssertionError: '3.14 at /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0/testsdkext/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3' not found in '🐍 1 python interpreter found:\n - CPython 3.13 at /srv/pokybuild/yocto-worker/qemux86/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3.13\n'
> ...
> RESULTS - maturin.MaturinTest.test_maturin_list_python: FAILED (3.57s)
I'm not sure how to address this one - it looks like the problem is that 
the buildtools tarball has a 3.13.4 binary in it (at least when I try 
locally). Where does that get updated?
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2876
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/2900
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/837
>
> AssertionError:
> Failed ptests:
> {'python3-click': 'START: ptest-runner\n'
>                    '2025-12-21T20:15\n'
>                    '\n'
>                    '../../python3.14/ast.py:620: in unparse\n'
>                    '    unparser = _Unparser()\n'
>                    '               ^^^^^^^^^\n'
>                    "E   NameError: name '_Unparser' is not defined\n"
>                    '\n'
>                    'During handling of the above exception, another exception '
>                    'occurred:\n'
>                    '../../python3.14/site-packages/pluggy/_hooks.py:512: in '
>                    '__call__\n'
>                    '    return self._hookexec(self.name, '
>                    'self._hookimpls.copy(), kwargs, firstresult)\n'
>                    '           '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/pluggy/_manager.py:120: in '
>                    '_hookexec\n'
>                    '    return self._inner_hookexec(hook_name, methods, kwargs, '
>                    'firstresult)\n'
>                    '           '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/python.py:240: in '
>                    'pytest_pycollect_makeitem\n'
>                    '    return list(collector._genfunctions(name, obj))\n'
>                    '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/python.py:448: in '
>                    '_genfunctions\n'
>                    '    definition = FunctionDefinition.from_parent(self, '
>                    'name=name, callobj=funcobj)\n'
>                    '                 '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/python.py:1625: in '
>                    'from_parent\n'
>                    '    return super().from_parent(parent=parent, **kw)\n'
>                    '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/nodes.py:233: in '
>                    'from_parent\n'
>                    '    return cls._create(parent=parent, **kw)\n'
>                    '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/nodes.py:110: in '
>                    '_create\n'
>                    '    return super().__call__(*k, **kw)  # type: '
>                    'ignore[no-any-return,misc]\n'
>                    '           ^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/python.py:1616: in '
>                    '__init__\n'
>                    '    fixtureinfo = fm.getfixtureinfo(self, self.obj, '
>                    'self.cls)\n'
>                    '                  '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/fixtures.py:1565: in '
>                    'getfixtureinfo\n'
>                    '    argnames = getfuncargnames(func, name=node.name, '
>                    'cls=cls)\n'
>                    '               '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/compat.py:136: in '
>                    'getfuncargnames\n'
>                    '    parameters = signature(function).parameters.values()\n'
>                    '                 ^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/site-packages/_pytest/compat.py:70: in '
>                    'signature\n'
>                    '    return inspect.signature(obj, '
>                    'annotation_format=Format.STRING)\n'
>                    '           '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/inspect.py:3321: in signature\n'
>                    '    return Signature.from_callable(obj, '
>                    'follow_wrapped=follow_wrapped,\n'
>                    '../../python3.14/inspect.py:3036: in from_callable\n'
>                    '    return _signature_from_callable(obj, sigcls=cls,\n'
>                    '../../python3.14/inspect.py:2511: in '
>                    '_signature_from_callable\n'
>                    '    return _signature_from_function(sigcls, obj,\n'
>                    '../../python3.14/inspect.py:2334: in '
>                    '_signature_from_function\n'
>                    '    annotations = get_annotations(func, globals=globals, '
>                    'locals=locals, eval_str=eval_str,\n'
>                    '../../python3.14/annotationlib.py:981: in get_annotations\n'
>                    '    ann = _get_and_call_annotate(obj, format)\n'
>                    '          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/annotationlib.py:1112: in '
>                    '_get_and_call_annotate\n'
>                    '    ann = call_annotate_function(annotate, format, '
>                    'owner=obj)\n'
>                    '          '
>                    '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/annotationlib.py:750: in '
>                    'call_annotate_function\n'
>                    '    key: _stringify_single(val)\n'
>                    '         ^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/annotationlib.py:883: in '
>                    '_stringify_single\n'
>                    '    return repr(anno)\n'
>                    '           ^^^^^^^^^^\n'
>                    '../../python3.14/annotationlib.py:487: in __repr__\n'
>                    '    return ast.unparse(self.__ast_node__)\n'
>                    '           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
>                    '../../python3.14/ast.py:622: in unparse\n'
>                    '    from _ast_unparse import Unparser as _Unparser\n'
>                    "E   ModuleNotFoundError: No module named '_ast_unparse'\n"
>                    'ERROR: '
>                    'tests/test_shell_completion.py:tests/test_shell_completion.py\n'
>                    '============================================================================\n'
>                    'Testsuite summary\n'
>                    '# TOTAL: 1\n'
>                    '# PASS: 0\n'
>                    '# SKIP: 0\n'
>                    '# XFAIL: 0\n'
>                    '# FAIL: 0\n'
>                    '# XPASS: 0\n'
>                    '# ERROR: 1\n'
>                    '\n'
>                    'ERROR: Exit status is 2\n'
>                    'DURATION: 28\n'}
>
> ptests which had no test results:
> ['python3-click']
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/860
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/2751
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2794
>
> Ptest logs can be found here:
>
> http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemuriscv64-ptest/core-image-ptest-python3-click/
> http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemuarm64-ptest/core-image-ptest-python3-click/
> http://valkyrie.yocto.io/pub/non-release/20251221-102/testresults/qemux86-64-ptest/core-image-ptest-python3-click/
>
> Can you have a look at these failures?
>
> Thanks,
> Mathieu
>

