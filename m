Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12B0C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 01:14:44 +0000 (UTC)
Received: from anchovy3.45ru.net.au (anchovy3.45ru.net.au [203.30.46.155])
 by mx.groups.io with SMTP id smtpd.web08.32871.1656638082898146224
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 18:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: electromag.com.au,
 ip: 203.30.46.155, mailfrom: preid@electromag.com.au)
Received: (qmail 8454 invoked by uid 5089); 1 Jul 2022 01:14:40 -0000
Received: by simscan 1.2.0 ppid: 8401, pid: 8402, t: 0.0623s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?10.1.1.101?)
 (preid@electromag.com.au@115.64.172.57)
  by anchovy2.45ru.net.au with ESMTPA; 1 Jul 2022 01:14:40 -0000
Message-ID: <fbe2ba5d-f82c-ea57-a00d-4e0ff1b9586f@electromag.com.au>
Date: Fri, 1 Jul 2022 09:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-AU
From: Phil Reid <preid@electromag.com.au>
Subject: libstdc++ honister -> kirkstone
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 01:14:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167447

G'day All,

We're just updating from honister to kirkstone branch and run into
an issue with libstdc++. We're targeting a 32 bit arm device.

is_empty throws with "filesystem error: cannot check if file is empty: Operation not supported"
when called on an empty directory.

tracing this status is returning fs::file_type::unknown which looks to result from stat returnung EOVERFLOW.
Which appears to be related to 64 / 32 bit file size limits.

We are compiling our code with: -D_FILE_OFFSET_BITS=64


It does look like the builds are linking things slightly differently.

preid:~/dev/kirkstone/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-r0/package/usr/lib$ arm-emit-linux-gnueabi-readelf -r libstdc++.so | grep seek
0015433c  00007916 R_ARM_JUMP_SLOT   00000000   lseek@GLIBC_2.4
00154d70  0000aa16 R_ARM_JUMP_SLOT   00000000   fseek@GLIBC_2.4

preid:~/dev/kirkstone/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.3.0-r0/package/usr/lib$ arm-emit-linux-gnueabi-readelf -r libstdc++.so | grep stat
0015561c  0000c016 R_ARM_JUMP_SLOT   00000000   stat64@GLIBC_2.33
00155620  00003016 R_ARM_JUMP_SLOT   00000000   statvfs64@GLIBC_2.4



preid:~/dev/honister/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.2.0-r0/package/usr/lib$ arm-emit-linux-gnueabi-readelf -r libstdc++.so.6 | grep seek
00159328  00008a16 R_ARM_JUMP_SLOT   00000000   lseek64@GLIBC_2.4
00159d68  0000c616 R_ARM_JUMP_SLOT   00000000   fseeko64@GLIBC_2.4

preid:~/dev/honister/tmp-glibc/work/cortexa9t2hf-neon-emit-linux-gnueabi/gcc-runtime/11.2.0-r0/package/usr/lib$ arm-emit-linux-gnueabi-readelf -r libstdc++.so.6 | grep stat
00159334  00009f16 R_ARM_JUMP_SLOT   00000000   fstat64@GLIBC_2.33
0015a618  00006d16 R_ARM_JUMP_SLOT   00000000   statvfs64@GLIBC_2.4
0015a63c  00008816 R_ARM_JUMP_SLOT   00000000   stat64@GLIBC_2.33
0015a68c  00008016 R_ARM_JUMP_SLOT   00000000   lstat64@GLIBC_2.33


Not sure where to look to fix this...

Any help appreciated.


Regards
Phil


