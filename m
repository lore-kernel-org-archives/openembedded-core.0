Received: from mail2.matrix-vision.com ([85.214.244.251])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.jones@matrix-vision.de>)
	id 1Q7otm-000591-VA; Thu, 07 Apr 2011 15:05:23 +0200
Received: from mail2.matrix-vision.com (localhost [127.0.0.1])
	by mail2.matrix-vision.com (Postfix) with ESMTP id BC41F3F63B;
	Thu,  7 Apr 2011 15:03:14 +0200 (CEST)
Received: from erinome (g2.matrix-vision.com [80.152.136.245])
	by mail2.matrix-vision.com (Postfix) with ESMTPA id 6DABB3F623;
	Thu,  7 Apr 2011 15:03:14 +0200 (CEST)
Received: from erinome (localhost [127.0.0.1])
	by erinome (Postfix) with ESMTP id 0025C6F8A;
	Thu,  7 Apr 2011 15:03:14 +0200 (CEST)
Received: by erinome (Postfix, from userid 108)
	id E99116F9C; Thu,  7 Apr 2011 15:03:13 +0200 (CEST)
Received: from [192.168.65.46] (host65-46.intern.matrix-vision.de
	[192.168.65.46]) by erinome (Postfix) with ESMTPA id D7C336F8A;
	Thu,  7 Apr 2011 15:03:13 +0200 (CEST)
Message-ID: <4D9DB612.80002@matrix-vision.de>
Date: Thu, 07 Apr 2011 15:03:14 +0200
From: Michael Jones <michael.jones@matrix-vision.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101029 Lightning/1.0b2 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4D832AA4.1020701@matrix-vision.de>	<AB78D48B-B478-47DF-A7CF-94FF96C313AC@dominion.thruhere.net>	<1301060302.3018.129.camel@rex>
	<4D8CA329.10407@matrix-vision.de>	<1301064949.3018.147.camel@rex>
	<4D8CBCA4.2070603@matrix-vision.de>	<1301316136.3018.189.camel@rex>
	<AANLkTikwK_F7Wep4pfj05PMrMsgcaQkBi9aUvtu07+GV@mail.gmail.com>
In-Reply-To: <AANLkTikwK_F7Wep4pfj05PMrMsgcaQkBi9aUvtu07+GV@mail.gmail.com>
X-MV-Disclaimer: true (erinome)
X-AV-Checked: ClamAV using ClamSMTP (erinome)
X-AV-Checked: ClamAV using ClamSMTP (mail2)
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [oe] staging & using kernel headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Apr 2011 13:05:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/28/2011 06:39 PM, Khem Raj wrote:
> On Mon, Mar 28, 2011 at 5:42 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>
>>> OK, so here's what I'm realizing, please correct me if I'm wrong:
>>> What I did unconventionally (ie. wrong) was to use a kernel version
>>> newer than my linux-libc-headers were.  I should create a new
>>> linux-libc-headers recipe, as I had done with the kernel recipe, and
>>> build glibc and linux-libc-headers using my 2.6.38 kernel.
>>
>> We should *always* be using linux-libc-headers >= to the kernel version
>> being used.
>>
> 
> If you use newer kernel should work ok why is that a problem ? kernel
> syscalls are backward compatible
> and we use oldest kernel version of like 2.6.16 for eglibc to build
> against so it should not be a problem
> to use different versions for kernel and kernel-headers. I think your
> problem lies elsewhere
> 

There is a kernel interface in the V4L2 development tree that is being
introduced in 2.6.39 (but which in my local branch is patched on top of
2.6.38).  The problem I kicked off this thread with was due to ti-dmai
and gstreamer-ti _directly_ using the headers from this kernel, which
since 2.6.32 gives a warning for doing so.

Of course, I'm using the newer kernel for a reason, which is to use the
new kernel API.  So I need to use the headers from my local development
kernel (built by an OE recipe) when building that application, which I'm
now writing the recipe for.  I thought at first that userspace apps were
automatically built against the headers derived from the kernel being
used (which is what the ti recipes do, but incorrectly).  During this
thread I realized that linux-libc-headers is a separate recipe intended
for supplying user headers.

I suppose I will use the method for my V4L2 app that I kicked off this
thread with- staging the development kernel's headers with make_install
somewhere which can be used by my app.  As Richard pointed out earlier
in this thread, making the package dependent on the kernel makes the
package machine dependent.  This is OK for this package, but I still
want all other apps to be Angstrom-generic apps, so I don't want to
change linux-libc-headers to use my kernel headers after all.

MATRIX VISION GmbH, Talstrasse 16, DE-71570 Oppenweiler
Registergericht: Amtsgericht Stuttgart, HRB 271090
Geschaeftsfuehrer: Gerhard Thullner, Werner Armingeon, Uwe Furtner


