Return-Path: <net147@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1DA4173ABC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 04:07:41 +0000 (UTC)
Received: by qcwr17 with SMTP id r17so7397444qcw.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 21:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IgbZS+Koyd75DLkfUysQ2DFlqGAI7pbF22ntTo4kuRk=;
	b=dqZdAy6ADpSioVtaWyRqgo+0wV5z5/AxF+i1CkccNn2et0GjSEmTt/Am9shpvWAqHa
	NBnymcT9y0T5z90rMGU8vi3DVA9jQ65IJboKD9f7CKaVICqsWxMXDoExqf1/UDBLDFNc
	l3MfBJOxzCrMNJjiSPL4ByxMWNnTMQuYry87O4zMV5XoEKruUP3Pa+idVuOVfdjBttrq
	ObVMaClZ/myjVks2Fj2YHWCL17jJ4zg+MR8u0al+VvNIOG1nqsXZpCVKLpRGae8o0fac
	56MwQoYJNNO+NsvJxEltjS/ieAlpySJbvAKVgetUDJ4osJIyXM8tpPL4ZkGLbGIOza/C
	N0Ow==
MIME-Version: 1.0
X-Received: by 10.55.23.6 with SMTP id i6mr19113626qkh.39.1426046862285; Tue,
	10 Mar 2015 21:07:42 -0700 (PDT)
Received: by 10.96.56.100 with HTTP; Tue, 10 Mar 2015 21:07:42 -0700 (PDT)
In-Reply-To: <7511E9C6-04D6-40AF-AA84-FCA7DFA21B66@gmail.com>
References: <1426041185-27916-1-git-send-email-net147@gmail.com>
	<5AFC8E79-5AD6-4CED-BE24-98C2A6D6F944@gmail.com>
	<CANwerB3641NBFH6QB-3CBZi15_s2YT7AErY7HKKYAL=fXqJKiA@mail.gmail.com>
	<7511E9C6-04D6-40AF-AA84-FCA7DFA21B66@gmail.com>
Date: Wed, 11 Mar 2015 15:07:42 +1100
Message-ID: <CANwerB3MG_6oXREt-YLzD3m1op4U+sZiLkYni03Sq6FmFOSeYA@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] libunwind: backport patch to link against libgcc_s intead of libgcc
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
X-List-Received-Date: Wed, 11 Mar 2015 04:07:42 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2015 at 14:19, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 10, 2015, at 8:05 PM, Jonathan Liu <net147@gmail.com> wrote:
>>
>> On 11 March 2015 at 13:43, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Mar 10, 2015, at 7:33 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>>
>>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>>> ---
>>>> ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 42 ++++++++++++++++++++++
>>>> meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
>>>> 2 files changed, 43 insertions(+)
>>>> create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>>>>
>>>> diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>>>> new file mode 100644
>>>> index 0000000..0e55c91
>>>> --- /dev/null
>>>> +++ b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>>>> @@ -0,0 +1,42 @@
>>>> +From 508ca17a7be01d1cc960d9a07d0af4513948fb8d Mon Sep 17 00:00:00 2001
>>>> +From: Thierry Reding <treding@nvidia.com>
>>>> +Date: Fri, 27 Jun 2014 08:40:33 +0200
>>>> +Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
>>>> +
>>>> +For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM for
>>>> +example, libgcc_s.so.1 contains some symbols needed by libunwind which
>>>> +are not present in libgcc.
>>>> +
>>>> +This causes the following link error when building the X.Org X server
>>>> +with libunwind support:
>>>> +
>>>> +       CCLD     Xorg
>>>> +     /usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr0'
>>>> +     /usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr1'
>>>> +
>>>> +Linking against libgcc_s explicitly solves this problem.
>>>> +
>>>
>>> have you tried it at runtime too ?
>>>
>> strace 4.9 with libunwind PACKAGECONFIG wouldn't build on master
>> without the patch.
>> If I add strace 4.9 recipe to dizzy branch, using the libunwind
>> PACKAGECONFIG also fails to build without the patch. It gives the same
>> errors during linking.
>>
>> I tested at runtime on master branch which has libunwind 1.1 running
>> strace 4.9 on the target and didn't notice any issues. I haven't
>> tested on dizzy branch at runtime though.
>
> OK thanks, it would be interesting to see if exception handling in some binaries and shared objects is able to unwind through
> to make sure this all works
>

Seems to work on dizzy branch too with strace 4.9 + libunwind 1.1 +
libunwind patch:
# strace -k uname 2>&1 | sed -n '/^write(1/,$p'
write(1, "Linux\n", 6Linux
)                  = 6
> /lib/libc-2.20.so(__write+0x1c) [0xbf8cc]
> /lib/libc-2.20.so(_IO_file_write+0x20) [0x69c10]
> /lib/libc-2.20.so(_IO_file_setbuf+0xd0) [0x690b8]
> /lib/libc-2.20.so(_IO_do_write+0x1c) [0x6ab20]
> /lib/libc-2.20.so(_IO_file_sync+0xc0) [0x68fb0]
> /lib/libc-2.20.so(fflush+0x8c) [0x5e1f4]
> /bin/busybox.nosuid(+0x0) [0x67178]
exit_group(0)                           = ?
+++ exited with 0 +++
> /lib/libc-2.20.so(_exit+0x10) [0x9a930]
> /lib/libc-2.20.so(__libc_secure_getenv+0xf8) [0x30dc8]
> /bin/busybox.nosuid(+0x0) [0x67194]

Regards,
Jonathan

