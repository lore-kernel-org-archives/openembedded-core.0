Return-Path: <net147@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 989E173AB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 03:05:50 +0000 (UTC)
Received: by qcwb13 with SMTP id b13so7176904qcw.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SrOrybX7/iXLEdiZuNopqAI4DarlWcPfJzQcnjtqA8w=;
	b=Rdr+Rc40l5EQ5PjU2StzLCUeqG97ZEiSp14k6kQ68vxgUQ8M787juAX172ivEEMhP7
	SOr4Nq+3a4iXDZcwVOl7A+I5b6TgD2LipUFmk9saW/xt5Q9QAhhs/Lsh1vBbTxIektKc
	7WQWWH2iriMJ4nwiTa5GHecTbjzH4KaExeiM3qStjUcQSGWT+Mm5rcHdkQk6cOjeuDlC
	rFpMoAZ0NQUqg98noGf0YESllt5KTEsvO5NtGIegKorzb0MXp0K6lmhRmsz0tOvW73Hz
	izTVpKIlm2Ak8ZDOhEUM53FRF08nNJ+AGHQMaLy0NOtxVshyvtV0lw2d5c9n5p4RxwhC
	JKOw==
MIME-Version: 1.0
X-Received: by 10.55.31.71 with SMTP id f68mr66059589qkf.7.1426043151390; Tue,
	10 Mar 2015 20:05:51 -0700 (PDT)
Received: by 10.96.56.100 with HTTP; Tue, 10 Mar 2015 20:05:51 -0700 (PDT)
In-Reply-To: <5AFC8E79-5AD6-4CED-BE24-98C2A6D6F944@gmail.com>
References: <1426041185-27916-1-git-send-email-net147@gmail.com>
	<5AFC8E79-5AD6-4CED-BE24-98C2A6D6F944@gmail.com>
Date: Wed, 11 Mar 2015 14:05:51 +1100
Message-ID: <CANwerB3641NBFH6QB-3CBZi15_s2YT7AErY7HKKYAL=fXqJKiA@mail.gmail.com>
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
X-List-Received-Date: Wed, 11 Mar 2015 03:05:53 -0000
Content-Type: text/plain; charset=UTF-8

On 11 March 2015 at 13:43, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Mar 10, 2015, at 7:33 PM, Jonathan Liu <net147@gmail.com> wrote:
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>> ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 42 ++++++++++++++++++++++
>> meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
>> 2 files changed, 43 insertions(+)
>> create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>>
>> diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>> new file mode 100644
>> index 0000000..0e55c91
>> --- /dev/null
>> +++ b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-rather-than-libgcc.patch
>> @@ -0,0 +1,42 @@
>> +From 508ca17a7be01d1cc960d9a07d0af4513948fb8d Mon Sep 17 00:00:00 2001
>> +From: Thierry Reding <treding@nvidia.com>
>> +Date: Fri, 27 Jun 2014 08:40:33 +0200
>> +Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
>> +
>> +For some architectures, -lgcc and -lgcc_s are not equivalent. On ARM for
>> +example, libgcc_s.so.1 contains some symbols needed by libunwind which
>> +are not present in libgcc.
>> +
>> +This causes the following link error when building the X.Org X server
>> +with libunwind support:
>> +
>> +       CCLD     Xorg
>> +     /usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr0'
>> +     /usr/lib/libunwind.so: undefined reference to `__aeabi_unwind_cpp_pr1'
>> +
>> +Linking against libgcc_s explicitly solves this problem.
>> +
>
> have you tried it at runtime too ?
>
strace 4.9 with libunwind PACKAGECONFIG wouldn't build on master
without the patch.
If I add strace 4.9 recipe to dizzy branch, using the libunwind
PACKAGECONFIG also fails to build without the patch. It gives the same
errors during linking.

I tested at runtime on master branch which has libunwind 1.1 running
strace 4.9 on the target and didn't notice any issues. I haven't
tested on dizzy branch at runtime though.

Regards,
Jonathan

