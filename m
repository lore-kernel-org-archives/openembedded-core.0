Return-Path: <cazfi74@gmail.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 973586B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 16:33:05 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id a1so358895qcx.31
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 09:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Zr7+zy5ivcRgWTOMbcmlaLw3hwoYNehsAC/01pvA/pM=;
	b=aeCDymUTcG46/MOCJeoSg2Sqq7PE7GkGMUDGXG3htp9kXaoY7AL09qk/TME1lyvLYz
	WGvY131pWGpYJq1qIIwVLG1ibcJw4bqpgJosFEnxYJWSditF0E7ASG5kKeChHJJFL/vw
	xBzoOhZrUIKMyfhH7z5a5HolQlT1uVBVP9VVQAUZfSeBxgZ/zXTl/ZoQdUEBx+8mSWJW
	SFnZ/UGtV3aut3QMOKnqzKfYf9Y1U7KNQtnbW/3c3KiY6BuYY1ZIFJBisEkqrRukHtPx
	7+YIYj+OTDj/AkgwszzCVtqcxGPI16UimqACjzHW1huozXqQriUlfHjK69MOOKOseoSS
	4rxw==
MIME-Version: 1.0
X-Received: by 10.224.160.130 with SMTP id n2mr12030885qax.68.1377102785954;
	Wed, 21 Aug 2013 09:33:05 -0700 (PDT)
Received: by 10.224.114.207 with HTTP; Wed, 21 Aug 2013 09:33:05 -0700 (PDT)
In-Reply-To: <CAF6bG8eN02y-jVmrF=onOjZfwbd_-9HVgfsgkNOHYE38ftL9JA@mail.gmail.com>
References: <CAF6bG8cHBD0+5JQfuXNNY0odSU3gs=_Son6zT4RXuH8eBfj=Xg@mail.gmail.com>
	<11672169.pPNsTrMMam@helios>
	<CAF6bG8e=cCDyJGDNebVqaNSJ31PNYCUQ9xPNf_4p+mDVDUMbwA@mail.gmail.com>
	<1507505.mjujvFaXNS@helios>
	<CAF6bG8eN02y-jVmrF=onOjZfwbd_-9HVgfsgkNOHYE38ftL9JA@mail.gmail.com>
Date: Wed, 21 Aug 2013 19:33:05 +0300
Message-ID: <CAF6bG8f7HR25c6FPS0Lz3WqLqG+3-VxijyOKg64vOdRX95M0Dw@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: qemu-native build regularly failing
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
X-List-Received-Date: Wed, 21 Aug 2013 16:33:06 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2013 01:15, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 21 August 2013 00:16, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> On Tuesday 20 August 2013 23:26:44 Marko Lindqvist wrote:
>>> On 20 August 2013 16:32, Paul Eggleton <paul.eggleton@linux.intel.com>
>>> wrote:
>>> > On Tuesday 20 August 2013 15:51:21 Marko Lindqvist wrote:
>>> >> Build of qemu-native regularly fails with:
>>> >> |   LINK  sh4-softmmu/qemu-system-sh4
>>> >> |
>>> >> | /usr/lib/x86_64-linux-gnu/libXext.so.6: undefined reference to
>>> >>
>>> >> `_XEatDataWords'
>>> >>
>>> >> | collect2: error: ld returned 1 exit status
>>> >>
>>> >> This might be some dependency missing, as building first some packets
>>> >> (+ more importantly their dependencies) that do not depend on qemu and
>>> >> only then qemu dependant image success.
>>> >
>>> > Do you have something else causing libxext-native to be built by any
>>> > chance?
>>>
>>>  Yes, it seems to be difference between the tree where build fails and
>>> the one where build success that former has no libxext-native built.
>>> Further, I tested just building libxext-native before building
>>> qemu-native, and then the build succeded.
>>
>> The problem is we want qemu-native to be buildable both on systems without X11
>> and systems with X11, so the dependency has to be floating, and this is more or
>> less acceptable for a native recipe - there's only a problem when libxext-
>> native needs to be built. I can't see a lot of value in building libxext-
>> native in any case - what is causing it to be built on your system?
>>
>> Cheers,
>> Paul
>
>
>  I'm still running more tests - this seems to be complicated matter.
> For one, I just got successful build from empty tree by building
> qemu-native directly. That was build targeted to arm, while failing
> builds have been for x86 (native is amd64). Also, I think (but cannot
> be 100% sure any more) build has succeeded on trees where nothing
> depends on libxext-native but still *something* was needed to be built
> before qemu-native.

 It seems libxext-native is not needed. Rather this seems like problem
with build parallelism.

 - Sometimes "bitbake qemu-native" to empty tree success at once
 - When it first fails (but other tasks get executed while it tries to
build), it then success by forcing configure rerun & building  (
"bitbake qemu-native -c configure -f && bitbake qemu-native" )

 I think next step is to get config.log of the succesful and failed
build to compare.


 - ML

