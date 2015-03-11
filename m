Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id B814673A65
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 03:19:50 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so7471795pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lMMmDTb7yJ0bDUvIg71jJIJK4c7lo1TeErxUPhXRw7o=;
	b=blaaE9y+u8Nd6nh0Qu/Vt63oCqGDlr3Wz5cv8pW0lokhLhQinLAZrJL9iu0YeFf5K9
	FhadyE41MxkFlGW0Dyett40oavH+FUPVdb3xLA3TAdkDnUc8KcfYYiT2hSuq5RdRsmKC
	4pvMn5zE9litffuQJ7iZb9R8e3fiCKPQhzTj8pG5XY8cCa7MgeWssnaC3jQLU9YaE9st
	Pne/YcLsDi6ocpyjndokP8knHHlYQ4czkMgUK1Da+8bhNZELIWJUScDsoVw2BN43O17e
	VTjbTUfI3IRjMKnEhoVMNZO5sCBTLcl2lhd5rrkgWvmYg0wa+879884OCzy/4MTSk5xG
	DQ+Q==
X-Received: by 10.70.0.11 with SMTP id 11mr43132056pda.32.1426043991738;
	Tue, 10 Mar 2015 20:19:51 -0700 (PDT)
Received: from 10.25.113.106-ra01.pleasanton.ca.sfba.comcast.net
	([69.241.124.150]) by mx.google.com with ESMTPSA id
	tg14sm3298231pac.15.2015.03.10.20.19.49
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 10 Mar 2015 20:19:50 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANwerB3641NBFH6QB-3CBZi15_s2YT7AErY7HKKYAL=fXqJKiA@mail.gmail.com>
Date: Tue, 10 Mar 2015 20:19:48 -0700
Message-Id: <7511E9C6-04D6-40AF-AA84-FCA7DFA21B66@gmail.com>
References: <1426041185-27916-1-git-send-email-net147@gmail.com>
	<5AFC8E79-5AD6-4CED-BE24-98C2A6D6F944@gmail.com>
	<CANwerB3641NBFH6QB-3CBZi15_s2YT7AErY7HKKYAL=fXqJKiA@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Mailer: Apple Mail (2.2070.6)
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
X-List-Received-Date: Wed, 11 Mar 2015 03:19:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Mar 10, 2015, at 8:05 PM, Jonathan Liu <net147@gmail.com> wrote:
>=20
> On 11 March 2015 at 13:43, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Mar 10, 2015, at 7:33 PM, Jonathan Liu <net147@gmail.com> wrote:
>>>=20
>>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>>> ---
>>> ...-libunwind-to-libgcc_s-rather-than-libgcc.patch | 42 =
++++++++++++++++++++++
>>> meta/recipes-support/libunwind/libunwind_1.1.bb    |  1 +
>>> 2 files changed, 43 insertions(+)
>>> create mode 100644 =
meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-ra=
ther-than-libgcc.patch
>>>=20
>>> diff --git =
a/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch =
b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch
>>> new file mode 100644
>>> index 0000000..0e55c91
>>> --- /dev/null
>>> +++ =
b/meta/recipes-support/libunwind/libunwind-1.1/Link-libunwind-to-libgcc_s-=
rather-than-libgcc.patch
>>> @@ -0,0 +1,42 @@
>>> +=46rom 508ca17a7be01d1cc960d9a07d0af4513948fb8d Mon Sep 17 00:00:00 =
2001
>>> +From: Thierry Reding <treding@nvidia.com>
>>> +Date: Fri, 27 Jun 2014 08:40:33 +0200
>>> +Subject: [PATCH] Link libunwind to libgcc_s rather than libgcc
>>> +
>>> +For some architectures, -lgcc and -lgcc_s are not equivalent. On =
ARM for
>>> +example, libgcc_s.so.1 contains some symbols needed by libunwind =
which
>>> +are not present in libgcc.
>>> +
>>> +This causes the following link error when building the X.Org X =
server
>>> +with libunwind support:
>>> +
>>> +       CCLD     Xorg
>>> +     /usr/lib/libunwind.so: undefined reference to =
`__aeabi_unwind_cpp_pr0'
>>> +     /usr/lib/libunwind.so: undefined reference to =
`__aeabi_unwind_cpp_pr1'
>>> +
>>> +Linking against libgcc_s explicitly solves this problem.
>>> +
>>=20
>> have you tried it at runtime too ?
>>=20
> strace 4.9 with libunwind PACKAGECONFIG wouldn't build on master
> without the patch.
> If I add strace 4.9 recipe to dizzy branch, using the libunwind
> PACKAGECONFIG also fails to build without the patch. It gives the same
> errors during linking.
>=20
> I tested at runtime on master branch which has libunwind 1.1 running
> strace 4.9 on the target and didn't notice any issues. I haven't
> tested on dizzy branch at runtime though.

OK thanks, it would be interesting to see if exception handling in some =
binaries and shared objects is able to unwind through
to make sure this all works=20


