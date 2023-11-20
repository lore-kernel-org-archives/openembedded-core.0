Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F097CC197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 21:27:44 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.13542.1700515660222894454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 13:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lDZDRF/Y;
 spf=pass (domain: baylibre.com, ip: 209.85.222.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-778711ee748so324280585a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 13:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700515659; x=1701120459; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fk3Snn7sYznp3p77uePy7BI8FI040Kiwz3Zfag+Ssls=;
        b=lDZDRF/YwQc9FwB3+jeOuwpO8WQ3pkOPqhWp1E/YXk7E5CG0QqUXD0W0rizf0evclc
         1yVDN+pUmc2Wzy+Wr/Of2EhUyvYUlryGniM+12mnge3SFHTS0ujibZNZp1Amja29FKJv
         IIf9Odn78fyyLW1XVs3rnIW4Cfcmy967Il6W1tP9lCn4oPjW2/atUiMmxn36G5yW06ym
         +9xLNoIF07j6/txf58Dz42lRxoltKmry/a9Su4F9JRH0rbz9xxuKHEhAk+7181KJ84UI
         AFj/haPZOLjRrwIhfXmez2+fLQ8BbLAVNSbFTvlUT57R1dsK+KGbTdgRIGhyaEps4k0J
         tc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515659; x=1701120459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fk3Snn7sYznp3p77uePy7BI8FI040Kiwz3Zfag+Ssls=;
        b=YY6eH7PcxfIt9/f/xl+sF+P3P2/zDhlHuxhvuEZ4ZZx2Ze3EzAzFqljo47q31is1Rv
         sjq4rrzwt1/KX2hujp4ecE5yT2ZhKWIp+t0z202t+Z7jGtpv4l3qQh8bT4GS6TYTRKjr
         KnRTtRiOBz0iU+6rhUJSsVjOFcdGa5Gt51RiWTw6NcJ1Np44SissYAZSlu7ZHgXvyadJ
         Xwig7OGJZwcq7v8g9bTgWXmWLqgxMk7DvvJMvtNrYmwbuXZmGAqiCVjb3aWHv855WEeN
         afx6Av4gOzN+mV/CmSNzexv5mcqGwiVkREnpAbcSZqKD3gOkjTxGTbB2yhng6L9ezCoD
         309w==
X-Gm-Message-State: AOJu0YzK9Xo4WD01ehS6GGlKJ4rRmj8zWJ+tlE7NKui6+eUAhvEC2125
	k53KsbwSAL12hwA4r1naIdc7zA==
X-Google-Smtp-Source: AGHT+IGU7gc9/5yc+LVS/uFVUdASUti2YePK//teyO/3YSoAeiRAtQmVKAZeFKF2ck3lysaVlUM8nQ==
X-Received: by 2002:a05:620a:1926:b0:77a:51cb:211e with SMTP id bj38-20020a05620a192600b0077a51cb211emr11778117qkb.32.1700515658942;
        Mon, 20 Nov 2023 13:27:38 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id i16-20020a05620a249000b0076e1e2d6496sm2974761qkn.104.2023.11.20.13.27.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 13:27:38 -0800 (PST)
Message-ID: <817f001c-6013-4d5e-8cf7-5d9e4ce02e57@baylibre.com>
Date: Mon, 20 Nov 2023 16:27:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 4/4] python3-cython: upgrade 0.29.36 -> 3.0.5
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20231117194905.2080320-1-tgamblin@baylibre.com>
 <20231117194905.2080320-4-tgamblin@baylibre.com>
 <2023112021114550af6fde@mail.local>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <2023112021114550af6fde@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 21:27:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190933


On 2023-11-20 16:11, Alexandre Belloni wrote:
> Hello Trevor,
>
> Do you mind rebasing, this cnflicts with changes that are now on master?
Sure. Working on a new revision now.
>
> On 17/11/2023 14:49:05-0500, Trevor Gamblin wrote:
>> License-Update: Update license link to use https
>>
>> cython 3.0.x attempts to remain compatible with 0.29.x but still makes
>> some major changes (in addition to fixing old issues). For a complete
>> overview it's best to view the CHANGES.rst doc rather than including
>> them here: https://github.com/cython/cython/blob/master/CHANGES.rst.
>>
>> Note that more source files were added to cython_fix_sources to avoid
>> the following:
>>
>> |WARNING: python3-cython-3.0.5-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Utils.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/StringIOTree.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Parsing.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Compiler/Code.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Machines.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/DFA.c in package python3-cython-src contains reference to TMPDIR
>> |File /usr/src/debug/python3-cython/3.0.5-r0/Cython/Plex/Transitions.c in package python3-cython-src contains reference to TMPDIR [buildpaths]
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/recipes-devtools/python/python-cython.inc             | 4 ++--
>>   .../{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} | 7 +++++++
>>   2 files changed, 9 insertions(+), 2 deletions(-)
>>   rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.5.bb} (73%)
>>
>> diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
>> index 6aec6b012f1..e757e3f7c87 100644
>> --- a/meta/recipes-devtools/python/python-cython.inc
>> +++ b/meta/recipes-devtools/python/python-cython.inc
>> @@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
>>   and the messy, low-level world of C."
>>   SECTION = "devel/python"
>>   LICENSE = "Apache-2.0"
>> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
>> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
>>   PYPI_PACKAGE = "Cython"
>>   BBCLASSEXTEND = "native nativesdk"
>>   
>> -SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
>> +SRC_URI[sha256sum] = "39318348db488a2f24e7c84e08bdc82f2624853c0fea8b475ea0b70b27176492"
>>   UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
>>   
>>   inherit pypi
>> diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
>> similarity index 73%
>> rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
>> rename to meta/recipes-devtools/python/python3-cython_3.0.5.bb
>> index 78be2b94edb..94074aaf811 100644
>> --- a/meta/recipes-devtools/python/python3-cython_0.29.36.bb
>> +++ b/meta/recipes-devtools/python/python3-cython_3.0.5.bb
>> @@ -24,10 +24,17 @@ cython_fix_sources () {
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/FusedNode.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Scanning.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Visitor.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Parsing.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Compiler/Code.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Actions.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Scanners.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Machines.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/DFA.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Plex/Transitions.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Runtime/refnanny.c \
>>   		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Tempita/_tempita.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/StringIOTree.c \
>> +		${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/Cython/Utils.c \
>>   		${PKGD}${libdir}/${PYTHON_DIR}/site-packages/Cython*/SOURCES.txt; do
>>   		if [ -e $f ]; then
>>   			sed -i -e 's#${WORKDIR}/Cython-${PV}#/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}#g' $f
>> -- 
>> 2.42.0
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#190860): https://lists.openembedded.org/g/openembedded-core/message/190860
>> Mute This Topic: https://lists.openembedded.org/mt/102654597/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

