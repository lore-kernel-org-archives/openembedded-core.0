Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43E3074573
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 02:13:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L2DjWH006019
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Aug 2018 19:13:45 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 20 Aug 2018 19:13:44 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1534497181.git.Qi.Chen@windriver.com>
	<760193dd3732a2239aa96f7660dd85ed4071ebd2.1534497181.git.Qi.Chen@windriver.com>
	<179b2fa5f801bc5f8cf6618489889352039a4ad9.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <c3f18902-3719-cb74-197e-787a42663953@windriver.com>
Date: Tue, 21 Aug 2018 10:18:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <179b2fa5f801bc5f8cf6618489889352039a4ad9.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] assimp.py: fix AttributeError in tearDownClass
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
X-List-Received-Date: Tue, 21 Aug 2018 02:13:46 -0000
Content-Type: multipart/alternative;
	boundary="------------3BA94B4EECD5FF11F16EA6E1"

--------------3BA94B4EECD5FF11F16EA6E1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2018 12:53 AM, Richard Purdie wrote:
> On Fri, 2018-08-17 at 17:17 +0800, Chen Qi wrote:
>> When running this test case, we will see the following error.
>>
>>    AttributeError: type object 'BuildAssimp' has no attribute
>> 'project'
>>
>> assimp.py test case does not make use of SDKBuildProject, so remove
>> the import statement and the tearDownClass.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
>>   1 file changed, 5 deletions(-)
> I'm not seeing this error when I run the test and I can't see it on the
> autobuilders. Why are you seeing this and we're not?
>
> I'm trying to understand some other odd behaviour in SDK tests and am
> wondering if this is related or not.
>
> (e.g. https://autobuilder.yocto.io/builders/nightly-mips/builds/1221/st
> eps/Running%20SDK%20Sanity%20Tests/logs/stdio)
>
> Cheers,
>
> Richard
>
I did a quick search and found this one: 
https://github.com/pexpect/pexpect/pull/31
"""
|sys.stdout.buffer| is not guaranteed to exist - e.g. if |sys.stdout| 
has been reassigned to an |io.StringIO| instance, it won't.
"""

And we have in ConcurrencyTestSuite:
process_result._stdout_buffer = io.StringIO()

Best Regards,
Chen Qi

--------------3BA94B4EECD5FF11F16EA6E1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/21/2018 12:53 AM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote
cite="mid:179b2fa5f801bc5f8cf6618489889352039a4ad9.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">On Fri, 2018-08-17 at 17:17 +0800, Chen Qi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">When running this test case, we will see the following error.

  AttributeError: type object 'BuildAssimp' has no attribute
'project'

assimp.py test case does not make use of SDKBuildProject, so remove
the import statement and the tearDownClass.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
 1 file changed, 5 deletions(-)
</pre>
      </blockquote>
      <pre wrap="">
I'm not seeing this error when I run the test and I can't see it on the
autobuilders. Why are you seeing this and we're not?

I'm trying to understand some other odd behaviour in SDK tests and am
wondering if this is related or not.

(e.g. <a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/builders/nightly-mips/builds/1221/st">https://autobuilder.yocto.io/builders/nightly-mips/builds/1221/st</a>
eps/Running%20SDK%20Sanity%20Tests/logs/stdio)

Cheers,

Richard

</pre>
    </blockquote>
    I did a quick search and found this one:
    <a class="moz-txt-link-freetext" href="https://github.com/pexpect/pexpect/pull/31">https://github.com/pexpect/pexpect/pull/31</a><br>
    """<br>
    <code>sys.stdout.buffer</code> is not guaranteed to exist - e.g. if
    <code>sys.stdout</code> has been reassigned to an <code>io.StringIO</code>
    instance, it won't.<br>
    """<br>
    <br>
    And we have in ConcurrencyTestSuite:<br>
    process_result._stdout_buffer = io.StringIO()<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------3BA94B4EECD5FF11F16EA6E1--
