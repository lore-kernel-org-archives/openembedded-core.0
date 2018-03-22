Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD5BA788D6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 06:05:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M65agO026487
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Mar 2018 23:05:37 -0700 (PDT)
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 23:05:36 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Randy MacLeod
	<randy.macleod@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
	<6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
Date: Thu, 22 Mar 2018 14:06:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
X-Originating-IP: [128.224.162.197]
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2018 06:05:36 -0000
Content-Type: multipart/alternative;
	boundary="------------01A35F5EE7CC1B65AD89BD31"

--------------01A35F5EE7CC1B65AD89BD31
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/19/2018 05:04 PM, Alexander Kanavin wrote:
> On 03/19/2018 06:53 AM, ChenQi wrote:
>
>> For autotools,
>> 1) if the test framework of some package is a standalone set of 
>> scripts or it could be easily decoupled from Makefile, adding ptest 
>> support for such package is easy.
>> 2) if the test framework of some package is coupled with Makefile, we 
>> need to adjust or replace vars in Makefile, install make on target 
>> and rely on the Makefile to run tests. In such case, adding ptest is 
>> not easy.
>>
>> For meson, the test framework is coupled with meson/ninja. We need to 
>> at least install ninja and meson on target as a first step. Maybe we 
>> need to adjust other things in do_install_ptest. That's why I said 
>> "there's no easy way to add ptest support."
>>
>> Why didn't I look further into this problem? Because I view ptest 
>> support as optional, not necessary.
>> What I thought was: "let's upgrade the package first. If ptest 
>> support is required from community, deal with that in a separate patch."
>>
>> Now that I've got feedback from you, I think I'll look further into 
>> this issue and try to add ptest support via a separate patch.
>
> But is it tightly coupled with meson/ninja? From what I see here:
>
> https://github.com/systemd/systemd/blob/master/test/meson.build
>
> there is no testing logic as such in the meson.build file, it simply 
> runs a few test scripts, and checks the outcome. Which we can easily 
> replicate in a script.
>
> Alex
>

Hi Alex,

The test framework meson uses is like:

|e = executable('prog', 'testprog.c') test('name of test', e)|


http://mesonbuild.com/Unit-tests.html

So they could be defined in any valid meson.build file. In systemd's 
case, most of them are in top-level meson.build.

I agree with you that it's possible to extract all these test cases and 
hold them in a custom script we write. I think this could serve as a 
fall-back approach to adding ptest support for systemd.
But I'd like to spend some time to try to find a more general approach, 
avoiding headaches when upgrading.

Best Regards,
Chen Qi


--------------01A35F5EE7CC1B65AD89BD31
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 03/19/2018 05:04 PM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote
      cite="mid:6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com"
      type="cite">On 03/19/2018 06:53 AM, ChenQi wrote:
      <br>
      <br>
      <blockquote type="cite">For autotools,
        <br>
        1) if the test framework of some package is a standalone set of
        scripts or it could be easily decoupled from Makefile, adding
        ptest support for such package is easy.
        <br>
        2) if the test framework of some package is coupled with
        Makefile, we need to adjust or replace vars in Makefile, install
        make on target and rely on the Makefile to run tests. In such
        case, adding ptest is not easy.
        <br>
        <br>
        For meson, the test framework is coupled with meson/ninja. We
        need to at least install ninja and meson on target as a first
        step. Maybe we need to adjust other things in do_install_ptest.
        That's why I said "there's no easy way to add ptest support."
        <br>
        <br>
        Why didn't I look further into this problem? Because I view
        ptest support as optional, not necessary.
        <br>
        What I thought was: "let's upgrade the package first. If ptest
        support is required from community, deal with that in a separate
        patch."
        <br>
        <br>
        Now that I've got feedback from you, I think I'll look further
        into this issue and try to add ptest support via a separate
        patch.
        <br>
      </blockquote>
      <br>
      But is it tightly coupled with meson/ninja? From what I see here:
      <br>
      <br>
      <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd/blob/master/test/meson.build">https://github.com/systemd/systemd/blob/master/test/meson.build</a>
      <br>
      <br>
      there is no testing logic as such in the meson.build file, it
      simply runs a few test scripts, and checks the outcome. Which we
      can easily replicate in a script.
      <br>
      <br>
      Alex
      <br>
      <br>
    </blockquote>
    <br>
    Hi Alex,<br>
    <br>
    The test framework meson uses is like:<br>
    <pre class="  language-meson"><code class="  language-meson">e <span class="token operator">=</span> <span class="token function">executable</span><span class="token punctuation">(</span><span class="token string">'prog'</span><span class="token punctuation">,</span> <span class="token string">'testprog.c'</span><span class="token punctuation">)</span>
<span class="token function">test</span><span class="token punctuation">(</span><span class="token string">'name of test'</span><span class="token punctuation">,</span> e<span class="token punctuation">)</span></code></pre>
    <br>
    <a class="moz-txt-link-freetext" href="http://mesonbuild.com/Unit-tests.html">http://mesonbuild.com/Unit-tests.html</a><br>
    <br>
    So they could be defined in any valid meson.build file. In systemd's
    case, most of them are in top-level meson.build.<br>
    <br>
    I agree with you that it's possible to extract all these test cases
    and hold them in a custom script we write. I think this could serve
    as a fall-back approach to adding ptest support for systemd.<br>
    But I'd like to spend some time to try to find a more general
    approach, avoiding headaches when upgrading.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
  </body>
</html>

--------------01A35F5EE7CC1B65AD89BD31--
