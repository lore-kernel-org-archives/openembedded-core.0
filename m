Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0D6C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:45:39 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2192.1684860337008732392
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=VY8c2ojN;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75b08639930so124356785a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 09:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684860336; x=1687452336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zdCz1bKPPui0PYc6QD8KCj1APJHK/P20pMzHSpq148o=;
        b=VY8c2ojNNIirpa5xPCOFZxPNqtJ0W1v25i8Gc8BnEmYv3fq3s9wgb4i6nx6g2YjZ3e
         VT3r16fNWHqy42ifu4di8q5WXrEBgILZLOnvMsdfvo1IEWE0BcvxSxwI7XaBxZIXx/3B
         5HcDIYvX31eUWrhpRHm5Cy4TTxFBA+pR2btHwA7Y+auVkAAG73U8a/eX7WUTWqo8RPMv
         CNkE2AuCPgFGXhB51rkmJmn86DmpAUmerjeHlckOhfrhyq/Dwb2LlFyOMjqhViWw5pEG
         oQtdh3jlAjKT4FbJr7xjUs4WZP3ImJ61TXWi6tbSF8saJ75QfS/bB1cpVM/q457rFFWe
         rK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860336; x=1687452336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zdCz1bKPPui0PYc6QD8KCj1APJHK/P20pMzHSpq148o=;
        b=eLE1ANwUUnqg85DbGNLFhLnolYCTzeO+RWXdkFrE5QMXFN0y0SS6YX049JSfsFK9ve
         mQFHAqOZcfywuhH480yZqRHfzjFMCHqbxJkXrXjhuKawh2fzqpE88RGTji/9JbfqsfPH
         pneqQIotWzeNR6PE/YIrDZ8IWp7i25okV2fiywz/lb2RYJFDZLoo1C01QNifzFW4o+jT
         FsFUCIBZq/NtdNx/XcDERQ7EHp+fA9CF+VVaqxopmU0JcR8PDMIq3Zu/EKcxG0KtJhkP
         +YJUhzZAmcp5txZmjqYa0iuCpIZ54ZBXPvkglAlY4dfQ3Jh7CB7vklopAw7+jhaJdTPJ
         9RWw==
X-Gm-Message-State: AC+VfDz7ISU8MG8sLryFcfWZHj8nO4a9O9vQCwqXixGJByB3XFRLk1l0
	aOBGw+i/m0OYv+4wKxbsPSoCEQ==
X-Google-Smtp-Source: ACHHUZ5aDrc/h17VJvgAiyMnhR0XlEcBMlHY1rzBf5+zLgp4K3FZgGAy4t6XERiCCqaTUTMFAgOZyw==
X-Received: by 2002:a05:620a:6682:b0:75b:23a1:d851 with SMTP id qh2-20020a05620a668200b0075b23a1d851mr5104246qkn.19.1684860335893;
        Tue, 23 May 2023 09:45:35 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca? ([2001:1970:5b1f:ab00:bc2d:57d7:406e:f9ca])
        by smtp.gmail.com with ESMTPSA id f6-20020a05620a15a600b0074d4cf8f9fcsm1778164qkk.107.2023.05.23.09.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 09:45:35 -0700 (PDT)
Message-ID: <5de2d311-2048-e50e-ad5d-6f3eb968bf49@baylibre.com>
Date: Tue, 23 May 2023 12:45:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core][PATCH] b4: add recipe
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230523154122.1798757-1-tgamblin@baylibre.com>
 <CANNYZj93JQVPaE=B5kiZ76YiX2DKC94nhe-S1k8HEL3XTigVNg@mail.gmail.com>
 <CAMKF1soch+2Fs+wibXUQtryViNoGnkf9YxEnBsmVnWDc7-SdeA@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1soch+2Fs+wibXUQtryViNoGnkf9YxEnBsmVnWDc7-SdeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:45:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181650


On 2023-05-23 12:30, Khem Raj wrote:
> On Tue, May 23, 2023 at 9:18 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>> Why?
> I guess implement a new patch test using it.

I'll send a v2 with details included. It's a useful tool for handling 
patch management and may be able to replace some/all of the legacy 
patchtest functionality. I didn't want to put it into meta-patchtest 
since that layer currently makes undesirable changes to the target image 
boot sequence by default.

Trevor

>
>> Alex
>>
>> On Tue, 23 May 2023 at 17:41, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> ---
>>>   meta/conf/distro/include/maintainers.inc      |  1 +
>>>   .../distro/include/ptest-packagelists.inc     |  1 +
>>>   meta/recipes-devtools/b4/b4_0.12.2.bb         | 35 +++++++++++++++++++
>>>   ...skip-tests-requiring-git-filter-repo.patch | 30 ++++++++++++++++
>>>   meta/recipes-devtools/b4/files/run-ptest      |  3 ++
>>>   5 files changed, 70 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/b4/b4_0.12.2.bb
>>>   create mode 100644 meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
>>>   create mode 100644 meta/recipes-devtools/b4/files/run-ptest
>>>
>>> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
>>> index e99fbe4aef..72145a0a38 100644
>>> --- a/meta/conf/distro/include/maintainers.inc
>>> +++ b/meta/conf/distro/include/maintainers.inc
>>> @@ -52,6 +52,7 @@ RECIPE_MAINTAINER:pn-autoconf = "Robert Yang <liezhi.yang@windriver.com>"
>>>   RECIPE_MAINTAINER:pn-autoconf-archive = "Robert Yang <liezhi.yang@windriver.com>"
>>>   RECIPE_MAINTAINER:pn-automake = "Robert Yang <liezhi.yang@windriver.com>"
>>>   RECIPE_MAINTAINER:pn-avahi = "Yi Zhao <yi.zhao@windriver.com>"
>>> +RECIPE_MAINTAINER:pn-b4 = "Trevor Gamblin <tgamblin@baylibre.com>"
>>>   RECIPE_MAINTAINER:pn-babeltrace = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>>   RECIPE_MAINTAINER:pn-babeltrace2 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>>>   RECIPE_MAINTAINER:pn-baremetal-helloworld = "Alejandro Hernandez <alejandro@enedino.org>"
>>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
>>> index da9153b998..2c9fb3433d 100644
>>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>>> @@ -7,6 +7,7 @@ PTESTS_FAST = "\
>>>       acl \
>>>       apr-util \
>>>       attr \
>>> +    b4 \
>>>       babeltrace \
>>>       babeltrace2 \
>>>       bc \
>>> diff --git a/meta/recipes-devtools/b4/b4_0.12.2.bb b/meta/recipes-devtools/b4/b4_0.12.2.bb
>>> new file mode 100644
>>> index 0000000000..f222a8b2e5
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/b4/b4_0.12.2.bb
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY = "B4 workflow tools"
>>> +DESCRIPTION = "A tool to work with public-inbox and patch archives"
>>> +HOMEPAGE = "https://git.kernel.org/pub/scm/utils/b4/b4.git/"
>>> +LICENSE = "GPL-2.0-or-later"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>>> +SRC_URI[sha256sum] = "b6f4afd78bf78a28055b389f0909792b1c7805fb3557f5d71efbda3682aabe6e"
>>> +
>>> +inherit python_setuptools_build_meta ptest
>>> +
>>> +SRC_URI += "git://git.kernel.org/pub/scm/utils/b4/b4.git;branch=stable-0.12.y;protocol=https \
>>> +            file://run-ptest \
>>> +            file://0001-test_ez-skip-tests-requiring-git-filter-repo.patch \
>>> +"
>>> +
>>> +SRCREV = "0529d7ae380c46f8006892d8fffb563326e2d131"
>>> +
>>> +RDEPENDS:${PN} += " \
>>> +        ${PYTHON_PN}-mailbox \
>>> +        ${PYTHON_PN}-requests \
>>> +"
>>> +
>>> +RDEPENDS:${PN}-ptest += " \
>>> +        git \
>>> +        ${PYTHON_PN}-pytest \
>>> +        ${PYTHON_PN}-unittest-automake-output \
>>> +"
>>> +
>>> +S = "${WORKDIR}/git"
>>> +
>>> +do_install_ptest() {
>>> +      install -d ${D}${PTEST_PATH}/tests
>>> +      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
>>> +}
>>> +
>>> +BBCLASSEXTEND = "native nativesdk"
>>> diff --git a/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
>>> new file mode 100644
>>> index 0000000000..579c31d090
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/b4/files/0001-test_ez-skip-tests-requiring-git-filter-repo.patch
>>> @@ -0,0 +1,30 @@
>>> +From 5b77018e0d5648f519345a682752df91d99a6a09 Mon Sep 17 00:00:00 2001
>>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>>> +Date: Tue, 23 May 2023 11:09:07 -0400
>>> +Subject: [PATCH] test_ez: skip tests requiring git-filter-repo
>>> +
>>> +git-filter-repo isn't available and is difficult to properly add as a
>>> +recipe, so skip b4 ptests that require it to be installed.
>>> +
>>> +Upstream-Status: Inappropriate (oe-specific)
>>> +
>>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>>> +---
>>> + tests/test_ez.py | 1 +
>>> + 1 file changed, 1 insertion(+)
>>> +
>>> +diff --git a/tests/test_ez.py b/tests/test_ez.py
>>> +index 1b02e7b..059c84c 100644
>>> +--- a/tests/test_ez.py
>>> ++++ b/tests/test_ez.py
>>> +@@ -32,6 +32,7 @@ def prepdir(gitdir):
>>> +      ['log', '--format=%ae%n%s%n%b---', 'HEAD~4..'], 'trailers-thread-with-followups-and-tripledash',
>>> +      None),
>>> + ])
>>> ++@pytest.mark.skip(reason="no git-filter-repo")
>>> + def test_trailers(sampledir, prepdir, mboxf, bundlef, rep, trargs, compareargs, compareout, b4cfg):
>>> +     if b4cfg:
>>> +         b4.MAIN_CONFIG.update(b4cfg)
>>> +--
>>> +2.40.1
>>> +
>>> diff --git a/meta/recipes-devtools/b4/files/run-ptest b/meta/recipes-devtools/b4/files/run-ptest
>>> new file mode 100644
>>> index 0000000000..b63c4de0d9
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/b4/files/run-ptest
>>> @@ -0,0 +1,3 @@
>>> +#!/bin/sh
>>> +
>>> +pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
>>> --
>>> 2.40.1
>>>
>>>
>>>
>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181647): https://lists.openembedded.org/g/openembedded-core/message/181647
>> Mute This Topic: https://lists.openembedded.org/mt/99090018/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

