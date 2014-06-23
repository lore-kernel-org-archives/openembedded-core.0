Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 583176FCDD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 07:22:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5N7MfXE028558
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 23 Jun 2014 00:22:41 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Mon, 23 Jun 2014 00:22:40 -0700
Message-ID: <53A7D5B7.5090107@windriver.com>
Date: Mon, 23 Jun 2014 15:22:31 +0800
From: Wenlin Kang <wenlin.kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <1401760525-17167-1-git-send-email-wenlin.kang@windriver.com>	<538D4152.5030308@linux.intel.com>	<538D75AD.8030103@windriver.com>
	<539810F0.3090001@windriver.com>
In-Reply-To: <539810F0.3090001@windriver.com>
X-Originating-IP: [128.224.162.182]
Subject: Re: [PATCH] fetch2/svn.py: fix Unable to fetch URL bug
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
X-List-Received-Date: Mon, 23 Jun 2014 07:22:44 -0000
Content-Type: multipart/alternative;
	boundary="------------030607090900040407090409"

--------------030607090900040407090409
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2014年06月11日 16:18, Wenlin Kang wrote:
> On 2014年06月03日 15:13, Wenlin Kang wrote:
>> On 2014年06月03日 11:30, Saul Wold wrote:
>>> On 06/02/2014 06:55 PM, Wenlin Kang wrote:
>>>> For svn source, when download a revsion on branches, if the download
>>>> revsion < the branch created time revsion, then it will fail.
>>>>
>>>
>>>> The detail description reference the Yocto Project bugzilla, please 
>>>> see:
>>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6258
>>>>
>>>> Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
>>>> ---
>>>> lib/bb/fetch2/svn.py | 3 ++-
>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/lib/bb/fetch2/svn.py b/lib/bb/fetch2/svn.py
>>>> index 8847461..75e21df 100644
>>>> --- a/lib/bb/fetch2/svn.py
>>>> +++ b/lib/bb/fetch2/svn.py
>>>> @@ -98,7 +98,8 @@ class Svn(FetchMethod):
>>>> suffix = ""
>>>> if ud.revision:
>>>> options.append("-r %s" % ud.revision)
>>>> - suffix = "@%s" % (ud.revision)
>>>> + #follow this line can make the fetch fail when download a revsion 
>>>> on branches if the download revsion < the branch created time revsion.
>>>> + #suffix = "@%s" % (ud.revision)
>>>>
>>> Will this cause other failures if there versions requests at a 
>>> specific revision? can you detail how you tested this?
>> For a specific revsion download, I also do test, but I don't see 
>> failure now.
>> My test follow, you can reference it.
>>
>> First, you need to create a svn server, eg, my is svnroot
>> $svnadmin create ~/workspace/svnroot
>>
>> Second, on the client side do:
>> $mkdir -p ~/workspace/svntest
>> $cd ~/workspace/svntest
>> $mkdir -p test/{trunk,branches,tag}
>> $mkdir -p test/trunk/tdir0/tdir1/tdir2
>> $touch test/trunk/{hello.c}
>> $touch test/trunk/tdir0/tdir1/tdir2/test2.c
>> $touch test/trunk/tdir0/tdir1/test1.c
>> $touch test/trunk/tdir0/test0.c
>>
>> $svn import -m "create the project test" test/ 
>> svn://xxx.xxx.xxx.xxx/svnroot/test
>>
>> Then, do some commit,...
>> Such, we now get "r15"
>>
>> $svn cp -m "create a branch test_debug-1.0" 
>> svn://xxx.xxx.xxx.xxx/svnroot/test/trunk 
>> svn://xxx.xxx.xxx.xxx/svnroot/test/branches/test_debug-1.0
>>
>> Now, we create a bb file(eg, mytest.bb) to down "tdir1" with the 
>> verion < test_debug-1.0 created time version, eg, download r12
>> in bb file has:
>> SRCREV = "12"
>> SRC_URI = 
>> "svn://xxx.xxx.xxx.xxx/svnroot/test/branches/test_debug-1.0;module=test0/tdir1"
>
>    Replace "module=test0/tdir1"  with "module=tdir0/tdir1"
>
>     //Wenlin
>
>>
>> Last, run fetch for mytest.bb
>>>
>>>

Hi, Saul

What can tell me about this? I wan to know the upstream status for the 
patch and test step, thanks.

// Wenlin

>>>> if command == "fetch":
>>>> svncmd = "%s co %s %s://%s/%s%s %s" % (ud.basecmd, " 
>>>> ".join(options), proto, svnroot, ud.module, suffix, ud.module)
>>>>
>>>
>>>
>>
>>
>
>


-- 
Thanks,
Wenlin Kang


--------------030607090900040407090409
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2014年06月11日 16:18, Wenlin Kang
      wrote:<br>
    </div>
    <blockquote cite="mid:539810F0.3090001@windriver.com" type="cite">On
      2014年06月03日 15:13, Wenlin Kang wrote:
      <br>
      <blockquote type="cite">On 2014年06月03日 11:30, Saul Wold wrote:
        <br>
        <blockquote type="cite">On 06/02/2014 06:55 PM, Wenlin Kang
          wrote:
          <br>
          <blockquote type="cite">For svn source, when download a
            revsion on branches, if the download
            <br>
            revsion &lt; the branch created time revsion, then it will
            fail.
            <br>
            <br>
          </blockquote>
          <br>
          <blockquote type="cite">The detail description reference the
            Yocto Project bugzilla, please see:
            <br>
            <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/show_bug.cgi?id=6258">https://bugzilla.yoctoproject.org/show_bug.cgi?id=6258</a>
            <br>
            <br>
            Signed-off-by: Wenlin Kang <a class="moz-txt-link-rfc2396E" href="mailto:wenlin.kang@windriver.com">&lt;wenlin.kang@windriver.com&gt;</a>
            <br>
            ---
            <br>
            lib/bb/fetch2/svn.py | 3 ++-
            <br>
            1 file changed, 2 insertions(+), 1 deletion(-)
            <br>
            <br>
            diff --git a/lib/bb/fetch2/svn.py b/lib/bb/fetch2/svn.py
            <br>
            index 8847461..75e21df 100644
            <br>
            --- a/lib/bb/fetch2/svn.py
            <br>
            +++ b/lib/bb/fetch2/svn.py
            <br>
            @@ -98,7 +98,8 @@ class Svn(FetchMethod):
            <br>
            suffix = ""
            <br>
            if ud.revision:
            <br>
            options.append("-r %s" % ud.revision)
            <br>
            - suffix = "@%s" % (ud.revision)
            <br>
            + #follow this line can make the fetch fail when download a
            revsion on branches if the download revsion &lt; the branch
            created time revsion.
            <br>
            + #suffix = "@%s" % (ud.revision)
            <br>
            <br>
          </blockquote>
          Will this cause other failures if there versions requests at a
          specific revision? can you detail how you tested this?
          <br>
        </blockquote>
        For a specific revsion download, I also do test, but I don't see
        failure now.
        <br>
        My test follow, you can reference it.
        <br>
        <br>
        First, you need to create a svn server, eg, my is svnroot
        <br>
        $svnadmin create ~/workspace/svnroot
        <br>
        <br>
        Second, on the client side do:
        <br>
        $mkdir -p ~/workspace/svntest
        <br>
        $cd ~/workspace/svntest
        <br>
        $mkdir -p test/{trunk,branches,tag}
        <br>
        $mkdir -p test/trunk/tdir0/tdir1/tdir2
        <br>
        $touch test/trunk/{hello.c}
        <br>
        $touch test/trunk/tdir0/tdir1/tdir2/test2.c
        <br>
        $touch test/trunk/tdir0/tdir1/test1.c
        <br>
        $touch test/trunk/tdir0/test0.c
        <br>
        <br>
        $svn import -m "create the project test" test/
        svn://xxx.xxx.xxx.xxx/svnroot/test
        <br>
        <br>
        Then, do some commit,...
        <br>
        Such, we now get "r15"
        <br>
        <br>
        $svn cp -m "create a branch test_debug-1.0"
        svn://xxx.xxx.xxx.xxx/svnroot/test/trunk
        svn://xxx.xxx.xxx.xxx/svnroot/test/branches/test_debug-1.0
        <br>
        <br>
        Now, we create a bb file(eg, mytest.bb) to down "tdir1" with the
        verion &lt; test_debug-1.0 created time version, eg, download
        r12
        <br>
        in bb file has:
        <br>
        SRCREV = "12"
        <br>
        SRC_URI =
"svn://xxx.xxx.xxx.xxx/svnroot/test/branches/test_debug-1.0;module=test0/tdir1"<br>
      </blockquote>
      <br>
         Replace "module=test0/tdir1"  with "module=tdir0/tdir1"
      <br>
      <br>
          //Wenlin
      <br>
      <br>
      <blockquote type="cite">
        <br>
        Last, run fetch for mytest.bb
        <br>
        <blockquote type="cite">
          <br>
          <br>
        </blockquote>
      </blockquote>
    </blockquote>
    <br>
    Hi, Saul
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <br>
    <br>
    What can tell me about this? I wan to know the upstream status for
    the patch and test step, thanks.<br>
    <br>
    // Wenlin<br>
    <br>
    <blockquote cite="mid:539810F0.3090001@windriver.com" type="cite">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">if command == "fetch":
            <br>
            svncmd = "%s co %s %s://%s/%s%s %s" % (ud.basecmd, "
            ".join(options), proto, svnroot, ud.module, suffix,
            ud.module)
            <br>
            <br>
          </blockquote>
          <br>
          <br>
        </blockquote>
        <br>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
Thanks,
Wenlin Kang</pre>
  </body>
</html>

--------------030607090900040407090409--
