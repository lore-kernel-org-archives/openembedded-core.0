Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AC4D760721
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 02:02:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBQ21av5026818
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Dec 2018 18:01:47 -0800
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 25 Dec 2018 18:01:26 -0800
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <efccb653-580b-3a5f-6e3d-be5d51b6b8c1@windriver.com>
Date: Wed, 26 Dec 2018 10:09:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
X-Originating-IP: [128.224.163.141]
Subject: gdb failure on simplest hello world program -- oe-selftest
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
X-List-Received-Date: Wed, 26 Dec 2018 02:02:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi All,

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
#include <stdio.h>

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

Best Regards,
Chen Qi

