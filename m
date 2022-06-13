Return-Path: <ptsneves@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5CAC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 10:32:06 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.4233.1655116324974583456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 03:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=faNtW0c+;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: ptsneves@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id k16so6538617wrg.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 03:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QxRjAtXdyZL5v0Fo745N53IR+gLvLfrv6qXq+W5ArsI=;
        b=faNtW0c+nFnWDyoTuA2vKShJdOO6mqM5bov2IFrEw7pWIfhyr/9gcLNKKTiNlGREuu
         jN/OP/X43O9pvoGTtFwD7zCG48mB5zOW6lxL6cz8vapzXRDO3AXZmvB/Lhv6ljZ2bNFD
         eO/MxpHo7mS3yOYKUoTHDVXLRhLkBS0sJgyyerrLGSR+pNo+cMBZpY90LZx3tDfLHAFC
         ryUm8IH75pkM2ktrbHnHlOYiJvVdxM1lyN7+0I81kZCnGfaDwZsoLJ1oN/u9TXKRTw0n
         DT6oNpy7ATj+cTozH1T6zJgo4rH2aQYeDY2x+LNkoevpWYARGQqBq3KQIDkj94CUs36L
         gO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QxRjAtXdyZL5v0Fo745N53IR+gLvLfrv6qXq+W5ArsI=;
        b=oWIdqZ+9uUXqzJpZb1J/gnJf8cLMa47l6WCon+gWikWR1RL3pd5hYRaxK85j6y4P6l
         ADrzHRvM6nURiSXCXVBoTuRcaCnBX4TcwRpewtCfxqFw5d1Y8wG0S1sl65O8SOyc808s
         jTuZSKd2KegoIoMV6ZIAeFV6pH8xnwuGkG0r6Tga2Wwgl4G6fatTuHXkNdJDw1U67biS
         1C0LRcqZkPACjkVUHVNxyzVHVZwu5lxAeB5uEgbmZPMFQNuBLA54OHEyhbBS15Q7zc5C
         ertb7cyLdyBmpVXStmeIKCG3vQeDhl0CAAoqYjGgNn4EoUFZkbF7QVrF3bza+AUeEoIK
         PH5A==
X-Gm-Message-State: AOAM5302kcusEoqbZnreSO2hHVfu4YsDC0zwfl6rBLgOT8ZcxGtNyQxI
	6TvBi76NKJ5QT00F2y0e2w==
X-Google-Smtp-Source: 
 ABdhPJzu9rnZDkCBcAm5mHhnIXWtt28t0O2ikaSkynb737BPRzGg52wMuqm788Goxf39oE+y3Fi2HQ==
X-Received: by 2002:a5d:594f:0:b0:213:d715:cec7 with SMTP id
 e15-20020a5d594f000000b00213d715cec7mr51826736wri.44.1655116323277;
        Mon, 13 Jun 2022 03:32:03 -0700 (PDT)
Received: from [192.168.1.248]
 (031011128028.dynamic-3-poz-k-0-2-0.vectranet.pl. [31.11.128.28])
        by smtp.gmail.com with ESMTPSA id
 v1-20020adfebc1000000b0020d07d90b71sm8030332wrn.66.2022.06.13.03.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jun 2022 03:32:02 -0700 (PDT)
Message-ID: <a58cdf25-70a2-967b-2802-e35e6a62c6fb@gmail.com>
Date: Mon, 13 Jun 2022 12:32:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH v3 1/7] python: Avoid shebang overflow on
 python-config.py
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20220606155807.1414519-1-ptsneves@gmail.com>
 <20220610214314.2754247-1-ptsneves@gmail.com>
 <CANNYZj_e=nGby_zVsUEzHmGS9o+nutMXcdeCTDuRExEy+36DYQ@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
In-Reply-To: 
 <CANNYZj_e=nGby_zVsUEzHmGS9o+nutMXcdeCTDuRExEy+36DYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 10:32:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166836

As requested
https://github.com/python/cpython/pull/93760

Paulo Neves

On 6/13/22 09:30, Alexander Kanavin wrote:
> As requested, please submit upstream.
>
> Alex
>
> On Fri, 10 Jun 2022 at 23:43, Paulo Neves <ptsneves@gmail.com> wrote:
>> The native path may be too big, leading to shebang
>> overflow. Just use the #!/usr/bin/env python3.
>>
>> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
>> ---
>>   ...shebang-overflow-on-python-config.py.patch | 29 +++++++++++++++++++
>>   .../recipes-devtools/python/python3_3.10.4.bb |  1 +
>>   2 files changed, 30 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
>>
>> diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
>> new file mode 100644
>> index 0000000000..9f23278a30
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
>> @@ -0,0 +1,29 @@
>> +From f0c9dec63d452a7cd1e15ea653f4aced281f021c Mon Sep 17 00:00:00 2001
>> +From: Paulo Neves <ptsneves@gmail.com>
>> +Date: Tue, 7 Jun 2022 16:16:41 +0200
>> +Subject: [PATCH 1/1] Avoid shebang overflow on python-config.py
>> +
>> +The whole native path may be too big, leading to shebang
>> +overflow. Let's just use the env shebang.
>> +
>> +Upstream-Status: Inappropriate [distribution]
>> +---
>> + Makefile.pre.in | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/Makefile.pre.in b/Makefile.pre.in
>> +index f0aedb76cb58999427804255da56fa53284d7032..dd88e43114730f7681715777cc76dabb31113176 100644
>> +--- a/Makefile.pre.in
>> ++++ b/Makefile.pre.in
>> +@@ -1638,6 +1638,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
>> +       @ # Substitution happens here, as the completely-expanded BINDIR
>> +       @ # is not available in configure
>> +       sed -e "s,@EXENAME@,$(BINDIR)/python$(LDVERSION)$(EXE)," < $(srcdir)/Misc/python-config.in >python-config.py
>> ++      @ # Otherwise we might get huge shebangs with native paths
>> ++      sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' python-config.py
>> +       @ # Replace makefile compat. variable references with shell script compat. ones; $(VAR) -> ${VAR}
>> +       LC_ALL=C sed -e 's,\$$(\([A-Za-z0-9_]*\)),\$$\{\1\},g' < Misc/python-config.sh >python-config
>> +       @  # In OpenEmbedded, always use the python version of the script, the shell
>> +--
>> +2.25.1
>> +
>> diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
>> index 6bd3a6aba8..357025f856 100644
>> --- a/meta/recipes-devtools/python/python3_3.10.4.bb
>> +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
>> @@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>              file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
>>              file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>>              file://deterministic_imports.patch \
>> +           file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
>>              "
>>
>>   SRC_URI:append:class-native = " \
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#166813): https://lists.openembedded.org/g/openembedded-core/message/166813
>> Mute This Topic: https://lists.openembedded.org/mt/91678611/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


