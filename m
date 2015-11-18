Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8299C6057A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 02:54:21 +0000 (UTC)
Received: by wmww144 with SMTP id w144so52988264wmw.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 18:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YlB8J6KivWm719xAdPzmsOkTgsfuRsgr1AbvSliSP1I=;
	b=WofhVKK87N1AkiJq3Mbq5HQj5ig2tdejcUZV3viIAoQExbR5pshXM34HppHBEJLH44
	091N8k10uMCF+K+45Udhw0NlPlJiall1ZkFjvyMfIyrhb6LRZAUDyWGcPDQSrBjJZLaR
	Yx/jyRZjIDqWqEpefhDEpEggYfzvC+d6eJ0/wj/J1JIvXg7+PTvCuJM16I1v8FiB6QdE
	yKdl8Q3mMHbgn9kUUCcp9/F1iT89TSQ0sAvqt5P5S2QA/cr1UU1/Abh6WHv/XY2AIca7
	TM+eH8KMNAECkRBG/i91p1GzIkkwoWeW17lyRvyJOpPTCDWXlswRuPsNxJmtut1fWJpJ
	/lTA==
MIME-Version: 1.0
X-Received: by 10.28.46.137 with SMTP id u131mr889871wmu.61.1447815262513;
	Tue, 17 Nov 2015 18:54:22 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 17 Nov 2015 18:54:22 -0800 (PST)
In-Reply-To: <CAJ86T=XhuWTfFr3-7VGH6yM96e+brxe3hMW79xuaNuE-vjD1mQ@mail.gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
	<1447780178.1472.29.camel@pbcl.net>
	<CAJ86T=V7WyuBuLvn7spNWJxW3TohpeAgf7yFFyahr0F29t1RhQ@mail.gmail.com>
	<CAJ86T=XhuWTfFr3-7VGH6yM96e+brxe3hMW79xuaNuE-vjD1mQ@mail.gmail.com>
Date: Tue, 17 Nov 2015 18:54:22 -0800
Message-ID: <CAJ86T=WgmsLifH--XFWf2LQgXk7PqCBPnxwZgF9eAwBqrOfgKA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Wed, 18 Nov 2015 02:54:25 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 11:34 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Nov 17, 2015 at 11:16 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> On Tue, Nov 17, 2015 at 9:09 AM, Phil Blundell <pb@pbcl.net> wrote:
>>> On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
>>>
>>> On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:
>>>
>>> Does the resulting directfb-csource binary actually work with that
>>> change?  My recollection is that ld.bfd will just silently permit
>>> relocs that gold (correctly) refuses to allow.
>>>
>>> Personally I don't use DirectFB (and am constantly surprised it's still a
>>> thing) so at this point I'm not going to merge either of these patches until
>>> someone can confirm that their fix *works on hardware* instead of just
>>> fixing the build.
>>>
>>> I think that's a reasonable position.  In any case, the underlying issue is
>>> a compiler bug and ought really to be fixed there rather than patching
>>> directfb or any other package that just happens to fall over it.
>>
>> The directfb-csource binary linked with the bfd linker segfaults on
>> startup, so it does indeed look like a compiler problem.
>
> Hmmm... maybe I spoke too soon. lsmod is also segfaulting on startup
> so there's something else going wrong with this build.
>
> If I copy the same directfb-csource binary into a rootfs built with
> security_flags.inc enabled then it runs OK...

OK, so the segfaults were due to building Jethro with prelink enabled :-(

With prelink disabled, directfb-csource linked with the bfd linker
runs fine on real HW:

root@eos:~# cat /proc/cpuinfo
processor       : 0
model name      : ARMv7 Processor rev 3 (v7l)
Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls
vfpv4 idiva idivt vfpd32 lpae evtstrm
CPU implementer : 0x42
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0x00f
CPU revision    : 3

processor       : 1
model name      : ARMv7 Processor rev 3 (v7l)
Features        : swp half thumb fastmult vfp edsp neon vfpv3 tls
vfpv4 idiva idivt vfpd32 lpae evtstrm
CPU implementer : 0x42
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0x00f
CPU revision    : 3

Hardware        : Broadcom STB (Flattened Device Tree)
Revision        : 0000
Serial          : 0000000000000000
root@eos:~#
root@eos:~# directfb-csource
directfb-csource version 1.7.7

Usage: directfb-csource [options] <imagefile>
   --name=<identifer>      specifies variable name
   --format=<identifer>    specifies surface format
   --rgbformat=<identifer> specifies format for non-alpha images
   --multi                 multiple images
   --raw                   dump a single file directly to header
   --dither-rgb16          dither images rendered to RGB16 surfaces
   --help                  show this help message
   --version               print version information

See the directfb-csource(1) man-page for more information.

root@eos:~#

