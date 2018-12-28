Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DBAA6BF3D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2018 09:42:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBS9fjjM013186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Dec 2018 01:41:55 -0800
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Fri, 28 Dec 2018 01:41:34 -0800
To: <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
	<8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <298dd0b5-f2f8-23dc-3a0d-cf05958e038c@windriver.com>
Date: Fri, 28 Dec 2018 17:49:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org>
X-Originating-IP: [128.224.163.141]
Subject: Re: gdb failure on simplest hello world program -- oe-selftest
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
X-List-Received-Date: Fri, 28 Dec 2018 09:42:52 -0000
Content-Type: multipart/alternative;
	boundary="------------8D6FB67C9F5CA505DAE32D82"

--------------8D6FB67C9F5CA505DAE32D82
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2018 07:06 PM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
>> Hi All,
>>
>> 'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug' fails.
>> I did the tests on both my Fedora27 and ubuntu16.04 servers. They both
>> failed.
>> I can also reproduce this issue manually.
>>
>> I did some investigation. No clue how to fix this it. So I want to seek
>> help from community.
>>
>> Below is some output from oe-selftest.
>> [snip]
>> 2018-12-26 09:27:58,440 - oe-selftest - INFO - test_gdb_hardlink_debug
>> (package.PackageTests)
>> 2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest /usr/bin/hello1
>> 2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
>> 1: Reading symbols from /usr/bin/hello1...Reading symbols from
>> /usr/bin/.debug/hello4...done.
>> done.
>> (gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line 107.
>> (gdb) Starting program: /usr/bin/hello1
>>
>> Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
>> 107    /usr/include/bits/stdio2.h: No such file or directory.
>> (gdb) Continuing.
>> Hello World!
>> [Inferior 1 (process 312) exited normally]
>> (gdb)
>> 2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
>> [snip]
>>
>> The hello world problem is as follows.
>> $ cat
>> meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c
>> #include <stdio.h>
>>
>> int main() {
>>       printf("Hello World!\n");
>> }
>>
>> Some extra information:
>> 1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
>> 2. Adding some system call like daemon(0,0) before printf also works.
>> 3. Reverting poky repo to 1c048479af7cc98e30f9a33d1f3bef03711544aa,
>> which adds this selftest case, does not work. It still fails.
>> 4. Hongxu confirms that things work on his host.
>> 5. I also don't see failure about this test case on yocto's autobuilder.
>>
>> Could somebody help to provide some suggestions?
> This is strange and there must be some difference between your
> configuration and what what we test on the autobuilder or on Hongxu's
> setup.

Hi Richard,

I have talked with Hongxu and we can now both confirm that there does 
exist some problem.

> Which DISTRO and MACHINE are you using?

DISTRO is poky
MACHINE is qemux86.

It seems that if MACHINE is qemux86-64, the test case could pass. But 
that's just because the test case only checks 'Breakpoint 1, main () at 
hello.c:4'. See the console output below.
(gdb) b main
*Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h, line 107.*
(gdb) r
Starting program: /usr/bin/hello1

*Breakpoint 1, main () at hello.c:4*
4        printf("Hello World!\n");
(gdb) c
Continuing.
Hello World!
[Inferior 1 (process 156) exited normally]
(gdb) q

Even in this case, the 'b main' does not give correct result. The test 
case passes because 'Breakpoint 1, main () at hello.c:4' is there.

On qemux86, we have:
*(gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line 107.*
(gdb) Starting program: /usr/bin/hello1

*Breakpoint 1, main () at /usr/include/bits/stdio2.h:107*
107    /usr/include/bits/stdio2.h: No such file or directory.
(gdb) Continuing.
Hello World!
[Inferior 1 (process 156) exited normally]
(gdb)

> I think the key to resolving this is will be to understanding how to
> reproduce it...

Two ways to reproduce the problem:

I) reproduce it via oe-selftest
1) . oe-init-build-env build-selftest
2) SANITY_TESTED_DISTROS = ""
3) oe-selftest -r package.PackageTests.test_gdb_hardlink_debug

II) reproduce it manually
1) add meta-selftest to bblayers.conf
2) IMAGE_INSTALL_append = " selftest-hardlink selftest-hardlink-dbg 
selftest-hardlink-gdb"
3) bitbake core-image-minimal
4) On target:
      gdb /usr/bin/hello1
      (gdb) b main

Best Regards,
Chen Qi

> I think its worth investigating and figuring out...
>
> Cheers,
>
> Richard
>
>
>
>


--------------8D6FB67C9F5CA505DAE32D82
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 12/26/2018 07:06 PM,
      <a class="moz-txt-link-abbreviated" href="mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a> wrote:<br>
    </div>
    <blockquote
cite="mid:8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">On Wed, 2018-12-26 at 10:09 +0800, ChenQi wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Hi All,

'oe-selftest -r package.PackageTests.test_gdb_hardlink_debug' fails.
I did the tests on both my Fedora27 and ubuntu16.04 servers. They both 
failed.
I can also reproduce this issue manually.

I did some investigation. No clue how to fix this it. So I want to seek 
help from community.

Below is some output from oe-selftest.
[snip]
2018-12-26 09:27:58,440 - oe-selftest - INFO - test_gdb_hardlink_debug 
(package.PackageTests)
2018-12-26 09:37:55,333 - oe-selftest - INFO - gdbtest /usr/bin/hello1
2018-12-26 09:37:59,904 - oe-selftest - ERROR - GDB result:
1: Reading symbols from /usr/bin/hello1...Reading symbols from 
/usr/bin/.debug/hello4...done.
done.
(gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h, line 107.
(gdb) Starting program: /usr/bin/hello1

Breakpoint 1, main () at /usr/include/bits/stdio2.h:107
107    /usr/include/bits/stdio2.h: No such file or directory.
(gdb) Continuing.
Hello World!
[Inferior 1 (process 312) exited normally]
(gdb)
2018-12-26 09:38:00,907 - oe-selftest - INFO -  ... FAIL
[snip]

The hello world problem is as follows.
$ cat 
meta-selftest/recipes-test/selftest-hardlink/selftest-hardlink/hello.c
#include &lt;stdio.h&gt;

int main() {
     printf("Hello World!\n");
}

Some extra information:
1. Remove '-O2' or '-D_FORTIFY_SOURCE=2', and it works correctly.
2. Adding some system call like daemon(0,0) before printf also works.
3. Reverting poky repo to 1c048479af7cc98e30f9a33d1f3bef03711544aa, 
which adds this selftest case, does not work. It still fails.
4. Hongxu confirms that things work on his host.
5. I also don't see failure about this test case on yocto's autobuilder.

Could somebody help to provide some suggestions?
</pre>
      </blockquote>
      <pre wrap="">
This is strange and there must be some difference between your
configuration and what what we test on the autobuilder or on Hongxu's
setup.
</pre>
    </blockquote>
    <br>
    Hi Richard,<br>
    <br>
    I have talked with Hongxu and we can now both confirm that there
    does exist some problem.<br>
    <br>
    <blockquote
cite="mid:8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
Which DISTRO and MACHINE are you using?
</pre>
    </blockquote>
    <br>
    DISTRO is poky<br>
    MACHINE is qemux86.<br>
    <br>
    It seems that if MACHINE is qemux86-64, the test case could pass.
    But that's just because the test case only checks 'Breakpoint 1,
    main () at hello.c:4'. See the console output below.<br>
    (gdb) b main<br>
    <b>Breakpoint 1 at 0x1050: file /usr/include/bits/stdio2.h, line
      107.</b><br>
    (gdb) r<br>
    Starting program: /usr/bin/hello1 <br>
    <br>
    <b>Breakpoint 1, main () at hello.c:4</b><br>
    4        printf("Hello World!\n");<br>
    (gdb) c<br>
    Continuing.<br>
    Hello World!<br>
    [Inferior 1 (process 156) exited normally]<br>
    (gdb) q<br>
    <br>
    Even in this case, the 'b main' does not give correct result. The
    test case passes because 'Breakpoint 1, main () at hello.c:4' is
    there.<br>
    <br>
    On qemux86, we have:<br>
    <b>(gdb) Breakpoint 1 at 0x1060: file /usr/include/bits/stdio2.h,
      line 107.</b><br>
    (gdb) Starting program: /usr/bin/hello1 <br>
    <br>
    <b>Breakpoint 1, main () at /usr/include/bits/stdio2.h:107</b><br>
    107    /usr/include/bits/stdio2.h: No such file or directory.<br>
    (gdb) Continuing.<br>
    Hello World!<br>
    [Inferior 1 (process 156) exited normally]<br>
    (gdb)<br>
    <br>
    <blockquote
cite="mid:8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
I think the key to resolving this is will be to understanding how to
reproduce it...
</pre>
    </blockquote>
    <br>
    Two ways to reproduce the problem:<br>
    <br>
    I) reproduce it via oe-selftest<br>
    1) . oe-init-build-env build-selftest<br>
    2) SANITY_TESTED_DISTROS = ""<br>
    3) oe-selftest -r package.PackageTests.test_gdb_hardlink_debug<br>
    <br>
    II) reproduce it manually<br>
    1) add meta-selftest to bblayers.conf<br>
    2) IMAGE_INSTALL_append = " selftest-hardlink selftest-hardlink-dbg
    selftest-hardlink-gdb"<br>
    3) bitbake core-image-minimal<br>
    4) On target:<br>
         gdb /usr/bin/hello1<br>
         (gdb) b main<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:8569515ec23ddf8ca122621a6f59d89b024066df.camel@linuxfoundation.org"
      type="cite">
      <pre wrap="">
I think its worth investigating and figuring out...

Cheers,

Richard




</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------8D6FB67C9F5CA505DAE32D82--
