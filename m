Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FE5C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 13:04:31 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.97421.1723640668947607328
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Aug 2024 06:04:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dwSJzVOl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a1da036d35so414267485a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723640668; x=1724245468; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ALYF8LsIL9Ka0yK/1XEmI9VrifG2enmwS2qNReNFPII=;
        b=dwSJzVOlsen9auIB4TcibcPNvRx/TluhNe6QORvgUCBPQqYgN9CwcgnaoFCosXtl24
         k+8BBqeGBnzX+CT1nH5339W5c9d711v1x7zpsRMOj0nQzA4YXCLZs2NsYuGa4oBWgjCF
         eSnoxH1ntkodkdi+JoBCeJ8WfMRTygaMyelYclALWu+5hmaA9DPsGT3qSJwBVV0iYnPh
         1aFDwgIRWP7NpL6nXsEbBrpbGCY05TLgGIKyAu/RfAJKbQF41hIAPCALDvGyd1MdPEeZ
         7KIJDAOEql8w2D3fGISIDlVFfm16qcKlz3wOS8bBLpSZKrhZYWJEMP7NAU4hDdEUC3MD
         tBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723640668; x=1724245468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ALYF8LsIL9Ka0yK/1XEmI9VrifG2enmwS2qNReNFPII=;
        b=qt5ozE7JD7qjzt96OQhtyQpTt+mUPtJRgtjzsNJ69hM81tLOO+eLaKFs/HTDp+QoyN
         ++HM6OUOy02mZPjweutWwzipSf1zhZG/otUuSQXO1HXD+cwYXzPgXlARZ+ecIb7goO+r
         C88QCQIJTXAM/ZO1VEM7un2iTk/iGaHRZMET7k0N8tLsAtXA8NLY4ECTErwEC7FH3W9Z
         KEo9QjU7X27Yb/f++pvr6dQfEZXixKbpqMBS5isnXR2SGgksOXFC0CIatuB83qlQUhKM
         Q/dNDpuoGM7ea9nmTssDc5l41T8rTJWdi8X2mGBxAWQlWvBLpZxqdpzVOgl82xjfPyl9
         Bv1w==
X-Forwarded-Encrypted: i=1; AJvYcCXTDtZiO+UG6YgqWmY7U9J4BPbzVHFvFocmBW0pNjHTO70Jr04j9vnKVpcgka5Nm9vFXd5Bc1ddRJuQPQxyaVCm6zhgs3+YRXFCprMNIMOlsJAnaGp/nH6v
X-Gm-Message-State: AOJu0Yw8gKpj5wjdk0bE5Oq4rBuR5anBtl5hKnd01dSKEhcEUPPY3Fer
	FbJoJyac+lGSTVy0PRMB9KtTYblBk5PGcc0tav2SNbZ845QR4BRGgjz2oY4XmQI=
X-Google-Smtp-Source: AGHT+IFYBuYaXhgeIf1Pp+Da0NRwS6BfA83R+OFiD9jpqsDerhrSYDIQluw60GOKmGMU6VMo1zTibA==
X-Received: by 2002:a05:620a:254f:b0:7a1:d303:ed3d with SMTP id af79cd13be357-7a4ee407b3fmr214469185a.70.1723640667714;
        Wed, 14 Aug 2024 06:04:27 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e053b4sm431320385a.104.2024.08.14.06.04.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 06:04:27 -0700 (PDT)
Message-ID: <00acffd5-d23e-4d6b-a653-d926f2eb417b@baylibre.com>
Date: Wed, 14 Aug 2024 09:04:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] python3: skip readline limited history tests
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, alexandre.belloni@bootlin.com
References: <20240813164101.3425564-1-tgamblin@baylibre.com>
 <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <7f6a3ca8-1eff-0288-d667-2824dbcfefc9@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 13:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203321


On 2024-08-13 10:56 p.m., ChenQi wrote:
> The github issue you referenced here is not an issue that tracks this 
> test failure. It's an issue that introduced the original commit, and 
> has been closed. If a problem is 100% reproducible, at least some open 
> issue should be there for tracking to validate an explicit skip. As 
> far as I can see, tests that were skipped are rarely revisited.
>
> Also, looking at the issue you referenced, it seems that the problem 
> is that we're using editline instead of readline as the default 
> PACKAGECONFIG. It looks like that this new test case correctly reveals 
> our specific configuration problem.
> PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 
> 'lto', d)}"
> PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
> PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
>
> Can you try using readline as the default PACKAGECONFIG and see if 
> things work?
Yes, the test passes with readline. I didn't make this change for the 
test because I had assumed we want to use editline in the PACKAGECONFIG 
instead of readline, based on commit ce6add6f8aca0. Is this not the 
case? Do we want to switch back to using readline by default?
>
> Regards,
> Qi
>
> On 8/14/24 00:41, Trevor Gamblin wrote:
>> Python 3.12.5 is failing a newer ptest for reading/writing limited
>> history. Skip it for now until a proper fix (if any) is determined.
>>
>> The new test was added in
>> https://github.com/python/cpython/commit/263c7e611bb24715e513d457a3477a61fff15162 
>>
>>
>> The GitHub issue is here: 
>> https://github.com/python/cpython/issues/121160
>>
>> The aforementioned bug report suggests that OSErrors like that show up
>> when using the GNU readline-based readline module if a workaround isn't
>> also incorporated. It also mentions a new readline backend will be
>> available in 3.13 that might help, but that won't be available for a 
>> year.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> v2 adds extra info in the commit message and carried patch about the
>> source of the test failure.
>>
>>   ...t_readline-skip-limited-history-test.patch | 40 +++++++++++++++++++
>>   .../recipes-devtools/python/python3_3.12.5.bb |  1 +
>>   2 files changed, 41 insertions(+)
>>   create mode 100644 
>> meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
>>
>> diff --git 
>> a/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch 
>> b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch 
>>
>> new file mode 100644
>> index 0000000000..851ddd571a
>> --- /dev/null
>> +++ 
>> b/meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
>> @@ -0,0 +1,40 @@
>> +From d9d916d5ea946c945323679d1709de1b87029b96 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Tue, 13 Aug 2024 11:07:05 -0400
>> +Subject: [PATCH] test_readline: skip limited history test
>> +
>> +This test was added recently and is failing on the ptest image. Disable
>> +it until the proper fix is determined.
>> +
>> +See also: https://github.com/python/cpython/issues/121160
>> +
>> +Upstream-Status: Inappropriate [OE-specific]
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + Lib/test/test_readline.py | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/Lib/test/test_readline.py b/Lib/test/test_readline.py
>> +index 91fd7dd13f9..d81f9bf8eed 100644
>> +--- a/Lib/test/test_readline.py
>> ++++ b/Lib/test/test_readline.py
>> +@@ -132,6 +132,7 @@ def test_nonascii_history(self):
>> +         self.assertEqual(readline.get_history_item(1), "entrée 1")
>> +         self.assertEqual(readline.get_history_item(2), "entrée 22")
>> +
>> ++    @unittest.skip("Skipping problematic test")
>> +     def test_write_read_limited_history(self):
>> +         previous_length = readline.get_history_length()
>> +         self.addCleanup(readline.set_history_length, previous_length)
>> +@@ -349,6 +350,7 @@ def test_history_size(self):
>> +             self.assertEqual(len(lines), history_size)
>> +             self.assertEqual(lines[-1].strip(), b"last input")
>> +
>> ++    @unittest.skip("Skipping problematic test")
>> +     def test_write_read_limited_history(self):
>> +         previous_length = readline.get_history_length()
>> +         self.addCleanup(readline.set_history_length, previous_length)
>> +--
>> +2.39.2
>> +
>> diff --git a/meta/recipes-devtools/python/python3_3.12.5.bb 
>> b/meta/recipes-devtools/python/python3_3.12.5.bb
>> index 5665c90fa9..cc2e14baf0 100644
>> --- a/meta/recipes-devtools/python/python3_3.12.5.bb
>> +++ b/meta/recipes-devtools/python/python3_3.12.5.bb
>> @@ -33,6 +33,7 @@ SRC_URI = 
>> "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>> file://0001-gh-107811-tarfile-treat-overflow-in-UID-GID-as-failu.patch \
>>          file://0001-test_deadlock-skip-problematic-test.patch \
>> file://0001-test_active_children-skip-problematic-test.patch \
>> + file://0001-test_readline-skip-limited-history-test.patch \
>>              "
>>     SRC_URI:append:class-native = " \
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#203289): 
>> https://lists.openembedded.org/g/openembedded-core/message/203289
>> Mute This Topic: https://lists.openembedded.org/mt/107879487/7304865
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub 
>> [Qi.Chen@eng.windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

