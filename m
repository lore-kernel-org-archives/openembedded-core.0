Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32C7C36014
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 00:50:36 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.2589.1743641428307182453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 17:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dJ9Vn4PE;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ae727e87c26so266182a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743641427; x=1744246227; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mV7H0S/A9ZZYCk4bGB7fx/mHqQD+8AhU71ajHXr4QTs=;
        b=dJ9Vn4PEFPhLxf3ZV1OO5AJcgs0VUOkaPxlFT+/ll+dYhaIGRk5DP8UqnxCRPY0ptj
         PDu9ZSJLZtbjBbWjKAk5N/VYgUAvWFQv1NWSJ9ptu86x6BB0U4OMe4bcOLJgotWmKBnI
         PrqnAjTFgMgUJJvrL7HVErg8xiGw9ZSHjkudoDIun3448O+QJXTGP5++pdjunERsKeLx
         H8GvBGcRAPjVc0tfcSeUTJC8z2EAp+0QJqL0RVzEX2Z+/0HswOFM0gYvtGDted2soMik
         BxUK8ndfeY21lretnMz4O5SG0+EuQxnsfgtFyzBWdpsuQ/T+vS8EwMG78PGAVC2z/Vnw
         cBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743641427; x=1744246227;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mV7H0S/A9ZZYCk4bGB7fx/mHqQD+8AhU71ajHXr4QTs=;
        b=Ae7NCSfX70WS5MsRJ+6RPL5wjngbH1vobF6VxT0aN5MELUoziLs0EQ6LubMOLG0fPA
         8vFyolJTTTKwtMrtd6shdRZF3QmqVpjw9zZQI2Gd4ezyJpCcyWCZtMSsEPWkQnihjDe9
         NAR6NIVMFrgupgOo3ox7L+K3EQGt+sZp79IeZHN7npHOrk2gJUgwy4J+A4XmrEKp2XsC
         wFIiNnA5uYeu9lkYhu5agyx5s9AEjGA13MvfHeUZ2JResXccGWpHWSsy4n0WfGYC2F+G
         Abu6d4b4IUOrbymKixREkwj0q8ezG7gN3TX+N+S8hvzZE5ZFElYwH2MCsUcugCxlqW4/
         3FtA==
X-Forwarded-Encrypted: i=1; AJvYcCV0aTjYbg8XVjMpcchOC+eJ9dIOhBd9D/hjrKoPLdcQcQ36famWY4x1+/oVQ2EJv70a50yNK7ctKVUKiEngqrshWA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzAvyPbKuNgtSmpt1CAQUNQPWJ562pTjzjuuLt27aNX8YY0PaLw
	CoWkqxlO3jBNnW6aonP4Sw3Ci2VqBuhb3kGDw+0kEt/JsTxcAkW0
X-Gm-Gg: ASbGncsd3zhtnJjr77e7foWCc5/XmHiBtCmDoVGzZzJCuiyzzWs6LjiO5DH5ePl0Y2q
	TZZFDlQnAZjHUBdf8obBoe8ItsqoHx5Cj2CdVhAMCSbcJFNSDl/mDeMnGhO4cMNV/7/wqM4h95E
	aGcYRBMKYmg9UYYSqiW+hAsuAakoyqtV/1srqn3E59HD9cEutgH4QYy57SNmKJvl++HcIE0Auav
	UFzlEJL7Si9GPMCNIdk3/qtCrQDpFEJMPBFR6jwAchbcpINevfphmzxeR40OO7eBa9yNMJIWVLk
	tDZtQEijPgST6hZAnRPVdWa59HTUyD1v3SaQmQPPxqMVfUmFPtQlb6vTCF3tr+ROFl017QDnpka
	T0vUMQea5GhhyXiY1BY4jmzVXO/MeNv3yvD3uIQ==
X-Google-Smtp-Source: AGHT+IELC3n/SJ+YtZv5C61gpVbZ+2TJdY3a3jW8O0qWgka6ESwjdrH+0PDfgX4hzgQHyr5Oja6VhA==
X-Received: by 2002:a17:90b:53cb:b0:2ff:6788:cc67 with SMTP id 98e67ed59e1d1-3057de489e0mr412564a91.34.1743641427406;
        Wed, 02 Apr 2025 17:50:27 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:259d:91dc:bf30:aea7? ([2601:646:8201:fd20:259d:91dc:bf30:aea7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8d6sm2251405ad.1.2025.04.02.17.50.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 17:50:26 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------C4hyz9jRtX93P35Yj8gOexy0"
Message-ID: <32d1e8f3-5dbb-48a4-b33b-b9f1c790a4da@gmail.com>
Date: Wed, 2 Apr 2025 17:50:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -> 24.11.1
To: richard.purdie@linuxfoundation.org,
 "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>,
 Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 Jose Quaresma <quaresma.jose@gmail.com>, Anuj Mittal
 <anuj.mittal@intel.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250402090749.2119-1-leimaohui@fujitsu.com>
 <20250402090749.2119-2-leimaohui@fujitsu.com>
 <d59454214fc72c26186fc86f073b66fbef83d12c.camel@linuxfoundation.org>
 <CA+chaQdN+VKmo+DdYPoDsoz2XZuS9h=ZTJJaQd+3q2v2tJoqRg@mail.gmail.com>
 <TY3PR01MB11056551D94171A6BC8F06F4AA0AF2@TY3PR01MB11056.jpnprd01.prod.outlook.com>
 <5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 00:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214293

This is a multi-part message in MIME format.
--------------C4hyz9jRtX93P35Yj8gOexy0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 4/2/25 4:09 AM, Richard Purdie via lists.openembedded.org wrote:
> On Wed, 2025-04-02 at 10:31 +0000, Maohui Lei (Fujitsu) wrote:
>>
>>> -----Original Message-----
>>> From: Martin Jansa<martin.jansa@gmail.com>
>>> Sent: Wednesday, April 2, 2025 6:04 PM
>>> To:richard.purdie@linuxfoundation.org
>>> Cc: Lei, Maohui/雷 茂慧<leimaohui@fujitsu.com>; Alexander Kanavin
>>> <alex@linutronix.de>; Jose Quaresma<quaresma.jose@gmail.com>; Anuj
>>> Mittal<anuj.mittal@intel.com>;
>>> openembedded-core@lists.openembedded.org
>>> Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 ->
>>> 24.11.1
>>>
>>> On Wed, Apr 2, 2025 at 11:59 AM Richard Purdie via
>>> lists.openembedded.org
>>> <richard.purdie=linuxfoundation.org@lists.openembedded.org> wrote:
>>>> On Wed, 2025-04-02 at 17:07 +0800, leimaohui via
>>>> lists.openembedded.org
>>> wrote:
>>>>> Fix the issue that:
>>>>>   | Traceback (most recent call last):
>>>>>   |   File
>>> "/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-
>>> webcolors/24.
>>> 11.1/recipe-sysroot-native/usr/lib/pyth
>>> on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in
>>> _call_hook
>>>>>   |     raise BackendUnavailable(
>>>>>   |     ...<4 lines>...
>>>>>   |     )
>>>>>   | pyproject_hooks._impl.BackendUnavailable: Cannot import
>>> 'pdm.backend'
>>>>> python3-webcolors has migrated to pdm-backend  | diff --git
>>>>> a/pyproject.toml b/pyproject.toml  | index 6fcec77..9f2dfa9
>>>>> 100644
>>>>>> --- a/pyproject.toml  | +++ b/pyproject.toml  | @@ -1,65
>>>>>> +1,110 @@
>>>>>>   [build-system]  | -requires = ["setuptools>=61.0"]  |
>>>>> -build-backend = "setuptools.build_meta"
>>>>>   | +requires = [
>>>>>   | +    "pdm-backend",
>>>>>   | +]
>>>>>   | +build-backend = "pdm.backend"
>>>>>
>>>>> Signed-off-by: Lei Maohui<leimaohui@fujitsu.com>
>>>>> ---
>>>>>   ...n3-webcolors_24.8.0.bb => python3-webcolors_24.11.1.bb} | 7
>>>>> ++++++-
>>>>>   1 file changed, 6 insertions(+), 1 deletion(-)  rename
>>>>> meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb =>
>>>>> python3-webcolors_24.11.1.bb} (70%)
>>>>>
>>>>> diff --git
>>>>> a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
>>>>> b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
>>>>> similarity index 70%
>>>>> rename from meta/recipes-devtools/python/python3-
>>>>> webcolors_24.8.0.bb
>>>>> rename to meta/recipes-devtools/python/python3-
>>>>> webcolors_24.11.1.bb
>>>>> index c5ed4bd7d3..cda63d2a35 100644
>>>>> --- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
>>>>> +++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
>>>>> @@ -3,10 +3,15 @@ HOMEPAGE =
>>>>> "https://pypi.org/project/webcolors/"
>>>>>   LICENSE = "BSD-3-Clause"
>>>>>   LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"
>>>>> -SRC_URI[sha256sum] =
>>> "08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d
>>> "
>>>>> +SRC_URI[sha256sum] =
>>> "ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f
>>> 6"
>>>>>   inherit pypi python_setuptools_build_meta ptest-python-pytest
>>>>>
>>>>> +DEPENDS += " \
>>>>> +    python3-pdm-native \
>>>>> +    python3-pdm-backend-native \
>>>>> +"
>>>>> +
>>>> ERROR: Nothing RPROVIDES 'python3-webcolors-dev' (but
>>>> meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
>>>> RDEPENDS
>>> on or otherwise requires it) No eligible RPROVIDERs exist for
>>> 'python3-webcolors-dev'
>>>
>>>
>>>> That recipe isn't in core.
>>> Looks like you've accidentally copied the 2nd error about RPROVIDES
>>> not the
>>> first one about PROVIDES.
>>>
>>> The main error is about python3-pdm which is in
>>> meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
>> Thank you, but how can we solve this kind of issue that 24.11.1
>> version of python3-webcolors depends on packages out of core
> Sometimes we have to move recipes to oe-core for this reason, or we
> move the recipe to meta-oe. It depends what is using it and which layer
> it really belongs in.

In this case, I think we need to bring pdm module to core, since 
webcolors is needed by jsonschema which is used in selftests and also in 
dtschema which is used by validation feature for linux-yocto, so moving 
webcolors out would not be right thing to do here.


> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214260):https://lists.openembedded.org/g/openembedded-core/message/214260
> Mute This Topic:https://lists.openembedded.org/mt/112043451/1997914
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
-Khem

--------------C4hyz9jRtX93P35Yj8gOexy0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/2/25 4:09 AM, Richard Purdie via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Wed, 2025-04-02 at 10:31 +0000, Maohui Lei (Fujitsu) wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Martin Jansa <a class="moz-txt-link-rfc2396E" href="mailto:martin.jansa@gmail.com">&lt;martin.jansa@gmail.com&gt;</a>
Sent: Wednesday, April 2, 2025 6:04 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>
Cc: Lei, Maohui/雷 茂慧 <a class="moz-txt-link-rfc2396E" href="mailto:leimaohui@fujitsu.com">&lt;leimaohui@fujitsu.com&gt;</a>; Alexander Kanavin
<a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>; Jose Quaresma <a class="moz-txt-link-rfc2396E" href="mailto:quaresma.jose@gmail.com">&lt;quaresma.jose@gmail.com&gt;</a>; Anuj
Mittal <a class="moz-txt-link-rfc2396E" href="mailto:anuj.mittal@intel.com">&lt;anuj.mittal@intel.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Subject: Re: [OE-core] [PATCH] python3-webcolors: upgrade 24.8.0 -&gt;
24.11.1

On Wed, Apr 2, 2025 at 11:59 AM Richard Purdie via
lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie=linuxfoundation.org@lists.openembedded.org">&lt;richard.purdie=linuxfoundation.org@lists.openembedded.org&gt;</a> wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
On Wed, 2025-04-02 at 17:07 +0800, leimaohui via
lists.openembedded.org
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">wrote:
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Fix the issue that:
 | Traceback (most recent call last):
 |   File
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">"/mnt/test/build_auh/tmp/work/core2-64-poky-linux/python3-
webcolors/24.
11.1/recipe-sysroot-native/usr/lib/pyth
on3.13/site-packages/pyproject_hooks/_impl.py", line 402, in
_call_hook
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre"> |     raise BackendUnavailable(
 |     ...&lt;4 lines&gt;...
 |     )
 | pyproject_hooks._impl.BackendUnavailable: Cannot import
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">'pdm.backend'
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
python3-webcolors has migrated to pdm-backend  | diff --git
a/pyproject.toml b/pyproject.toml  | index 6fcec77..9f2dfa9
100644
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">--- a/pyproject.toml  | +++ b/pyproject.toml  | @@ -1,65
+1,110 @@
 [build-system]  | -requires = ["setuptools&gt;=61.0"]  |
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">-build-backend = "setuptools.build_meta"
 | +requires = [
 | +    "pdm-backend",
 | +]
 | +build-backend = "pdm.backend"

Signed-off-by: Lei Maohui <a class="moz-txt-link-rfc2396E" href="mailto:leimaohui@fujitsu.com">&lt;leimaohui@fujitsu.com&gt;</a>
---
 ...n3-webcolors_24.8.0.bb =&gt; python3-webcolors_24.11.1.bb} | 7
++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)  rename
meta/recipes-devtools/python/{python3-webcolors_24.8.0.bb =&gt;
python3-webcolors_24.11.1.bb} (70%)

diff --git
a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
similarity index 70%
rename from meta/recipes-devtools/python/python3-
webcolors_24.8.0.bb
rename to meta/recipes-devtools/python/python3-
webcolors_24.11.1.bb
index c5ed4bd7d3..cda63d2a35 100644
--- a/meta/recipes-devtools/python/python3-webcolors_24.8.0.bb
+++ b/meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
@@ -3,10 +3,15 @@ HOMEPAGE =
<a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/webcolors/">"https://pypi.org/project/webcolors/"</a>
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM =
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre"><a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448">"file://LICENSE;md5=cbaebec43b7d199c7fd8f5411b3b0448"</a>
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
-SRC_URI[sha256sum] =
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">"08b07af286a01bcd30d583a7acadf629583d1f79bfef27dd2c2c5c263817277d
"
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+SRC_URI[sha256sum] =
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">"ecb3d768f32202af770477b8b65f318fa4f566c22948673a977b00d589dd80f
6"
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
 inherit pypi python_setuptools_build_meta ptest-python-pytest

+DEPENDS += " \
+    python3-pdm-native \
+    python3-pdm-backend-native \
+"
+
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
ERROR: Nothing RPROVIDES 'python3-webcolors-dev' (but
meta/recipes-devtools/python/python3-webcolors_24.11.1.bb
RDEPENDS
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">on or otherwise requires it) No eligible RPROVIDERs exist for
'python3-webcolors-dev'


</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">That recipe isn't in core.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
Looks like you've accidentally copied the 2nd error about RPROVIDES
not the
first one about PROVIDES.

The main error is about python3-pdm which is in
meta-oe/meta-python/recipes-devtools/python/python3-pdm_2.22.4.bb
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Thank you, but how can we solve this kind of issue that 24.11.1
version of python3-webcolors depends on packages out of core
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sometimes we have to move recipes to oe-core for this reason, or we
move the recipe to meta-oe. It depends what is using it and which layer
it really belongs in.
</pre>
    </blockquote>
    <p>In this case, I think we need to bring pdm module to core, since
      webcolors is needed by jsonschema which is used in selftests and
      also in dtschema which is used by validation feature for
      linux-yocto, so moving webcolors out would not be right thing to
      do here.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
cite="mid:5a0c2b8fb787bdf7d433e8b0c0835f75c2b34df4.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">
Cheers,

Richard

</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#214260): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/214260">https://lists.openembedded.org/g/openembedded-core/message/214260</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/112043451/1997914">https://lists.openembedded.org/mt/112043451/1997914</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-Khem</pre>
  </body>
</html>

--------------C4hyz9jRtX93P35Yj8gOexy0--

