Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1461FC77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 13:23:44 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.14152.1685539419993541257
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 06:23:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OqMj3C34;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so5923747f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 06:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685539418; x=1688131418;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AHr6rI92uDce1yhAW/Z2p7oUMDqTZG6gIe9imBgaY7w=;
        b=OqMj3C3464q6QjsKZphouVuPX0XQh9mPrj7JQ0rsZ+mpdK7UIJAIUJz6hGm0P1HAh3
         CRaVusGpmA1m0FDNfnYmoCnydCAywUqqixfmS0Z0IFBRMhifRND9UTHj6x7Z8ySZqPwS
         MhP2ehXuDC5wixq+Y4rV6+LHZUkFEUyLvXHQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685539418; x=1688131418;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHr6rI92uDce1yhAW/Z2p7oUMDqTZG6gIe9imBgaY7w=;
        b=F7GuzfiZLccPml7jGVMcAdcXjXPliAOLw1+VDdotgutkge1HncM6zGbKQNDrkXCcvD
         vsJaciiPZn6M2pwiG0PCal5MvcbHyHg0C2xGaeHbOflVfrbyTC+gPJGBCCKXq+w0joAm
         SP3KcOwluOa6uqmlOk6DsbphRkDaCNFNWIpdyxI7HTqHvzbsSzGwd7yFISbUSFpbpG4a
         7G8nTJQhHOxVcEDoXWwg29WrsUyNDcjnJF03aM/+jj3hWN0ULGrER6ehPBc1WWxYc6d1
         lqo1dyRvSj/9DYaEBSyxzMexB8JhqcHD1SguvfEfmbPZrolq92NgbxgofKB94AeZcpHw
         qTTg==
X-Gm-Message-State: AC+VfDwe5HuQKvxTYObbMzsRpLFyQWZV3wY3kRW6tZVFo1fvvDauhktM
	P2z0c1njPqopI1FH40lyFtB1QQ==
X-Google-Smtp-Source: ACHHUZ7oXtTgXErHhLyRr8QpDlF2hS8j0MTEUWV/lUVkkfowxWBn+XGrUICewHjjQHVVezSWPCDwtw==
X-Received: by 2002:a5d:448f:0:b0:306:459b:f575 with SMTP id j15-20020a5d448f000000b00306459bf575mr4224984wrq.12.1685539418314;
        Wed, 31 May 2023 06:23:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422? ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id x15-20020adfec0f000000b003078c535277sm6872821wrn.91.2023.05.31.06.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 06:23:37 -0700 (PDT)
Message-ID: <eb184be946abaf9c76a2af279af2db9bcb43a1e0.camel@linuxfoundation.org>
Subject: python3 cryptic build failures
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Tim Orling <tim.orling@konsulko.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2023 14:23:37 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 13:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182010

Hi Trevor,

I thought this issue might be something you might be able to spot the
solution with quickly.

I had a failing python3-iniconfig build in a TMPDIR I've reused
heavily:

ERROR: python3-iniconfig-2.0.0-r0 do_compile: ExecutionError('/media/build/=
poky/build/tmp/work/core2-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/run=
.do_compile.2391637', 1, None, None)
ERROR: Logfile of failure stored in: /media/build/poky/build/tmp/work/core2=
-64-poky-linux/python3-iniconfig/2.0.0-r0/temp/log.do_compile.2391637
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|=20
| Traceback (most recent call last):
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__main__.py", line 375, in main
|     built =3D build_call(
|             ^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__main__.py", line 208, in build_package
|     out =3D _build(isolation, builder, outdir, distribution, config_setti=
ngs, skip_dependency_check)
|           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__main__.py", line 147, in _build
|     return _build_in_current_env(builder, outdir, distribution, config_se=
ttings, skip_dependency_check)
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__main__.py", line 127, in _build_in_current_env
|     missing =3D builder.check_dependencies(distribution)
|               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__init__.py", line 369, in check_dependencies
|     return {u for d in dependencies for u in check_dependency(d)}
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__init__.py", line 369, in <setcomp>
|     return {u for d in dependencies for u in check_dependency(d)}
|            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__init__.py", line 185, in check_dependency
|     yield from check_dependency(other_req_string, ancestral_req_strings +=
 (normalised_req_string,), req.extras)
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/build=
/__init__.py", line 179, in check_dependency
|     if req.specifier and not req.specifier.contains(dist.version, prerele=
ases=3DTrue):
|                              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packa=
ging/specifiers.py", line 905, in contains
|     item =3D Version(item)
|            ^^^^^^^^^^^^^
|   File "/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-inic=
onfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages/packa=
ging/version.py", line 196, in __init__
|     match =3D self._regex.search(version)
|             ^^^^^^^^^^^^^^^^^^^^^^^^^^^
| TypeError: expected string or bytes-like object, got 'NoneType'
|=20
| ERROR expected string or bytes-like object, got 'NoneType'
| WARNING: exit code 1 from a shell command.
ERROR: Task (/media/build/poky/meta/recipes-devtools/python/python3-iniconf=
ig_2.0.0.bb:do_compile) failed with exit code '1'

I wondered why and I isolated it down to this:

richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ fi=
nd -type d -empty
./hatchling-1.13.0.dist-info/licenses
./pathspec-0.11.0.dist-info
./importlib_metadata-6.0.0.dist-info
./setuptools-67.4.0.dist-info
./wheel-0.38.4.dist-info
./installer-0.6.0.dist-info
./setuptools-67.6.0.dist-info
./packaging-23.0.dist-info
richard@jet:/media/build/poky/build/tmp/work/core2-64-poky-linux/python3-in=
iconfig/2.0.0-r0/recipe-sysroot-native/usr/lib/python3.11/site-packages$ fi=
nd -type d -empty -delete

After which the compile succeeds. These empty dist-info directories
really upset the build. They're left behind by the sstate cleanup code
from when I have older versions of these python modules in play since
the sstate code can race over directory removal. Is there a way to make
python ignore them? Otherwise should we remove them somewhere?

I suspect you can recreate by adding these empty directories and
running a -c compile -f. I've seen it with plenty of other python
modules too.

Cheers,

Richard



