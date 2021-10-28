Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <ec1590e4edafc713804be1cc2e8be2123f57e57f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gcc: Improve reproducibility
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Thu, 28 Oct 2021 11:09:43 +0100
In-Reply-To: <CANNYZj-P0iunNY4bEHn13x7D5h06KdUrGU+oyoxZq-PW9_Kmag@mail.gmail.com>
References: <20211027140954.76185-1-oobitots@cisco.com>
	 <c44874c177d7aa9041d1ce266bdbfdbec9dc305d.camel@linuxfoundation.org>
	 <CANNYZj-P0iunNY4bEHn13x7D5h06KdUrGU+oyoxZq-PW9_Kmag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: oobitots@cisco.com, OE-core <openembedded-core@lists.openembedded.org>

On Thu, 2021-10-28 at 11:55 +0200, Alexander Kanavin wrote:
> On Wed, 27 Oct 2021 at 20:00, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Do you know why we wouldn't see this issue on the autobuilder tests?
> > 
> > Also, do you plan to submit something upstream? Has this been discussed with
> > them? I'm starting to become reluctant to taking patches marked as "Pending"
> > which just sit in our tree forever...
> > 
> 
> 
> I was also wondering what the issue really is - there needs to be a description
> of how it can be observed at least.

I agree at the very least the patch needs more explanation. In my local build:

tmp/work/x86_64-linux/gcc-cross-x86_64/11.2.0-r0/gcc-11.2.0/build.x86_64-linux.x86_64-poky-linux/gcc$ cat checksum-options 
g++  -no-pie   -isystem/host/usr/include -O2 -pipe -DIN_GCC  -DCROSS_DIRECTORY_STRUCTURE   -fno-exceptions 
-fno-rtti -fasynchronous-unwind-tables -W -Wall -Wno-narrowing -Wwrite-strings -Wcast-qual -Wmissing-format-attribute 
-Woverloaded-virtual -pedantic -Wno-long-long -Wno-variadic-macros -Wno-overlength-strings   -DHAVE_CONFIG_H 
-static-libstdc++ -static-libgcc -L/host/usr/lib                         -L/host/lib                         
-Wl,--enable-new-dtags                         -Wl,-rpath-link,/host/usr/lib                         
-Wl,-rpath-link,/host/lib                         -Wl,-rpath,/host/usr/lib                         
-Wl,-rpath,/host/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined 
-Wl,--dynamic-linker=/media/build1/poky/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2

so at least in my local build, the problem would appear to be the uninative dynamic linker path?

Oleksiy:
> I am not familiar how tests preformed in your case.
> How we check it. We build gcc native (sdk A) and use this gcc to build 
> packages from sdk A. The same is for sdk B.
> Binaries for gcc from sdk A and B are different.

Are you saying that the two sdks generate different binaries? Or that the gcc
binaries in the two SDKs are different and shouldn't be?

I think we don't compare SDK binaries right now so that might be why our tests
don't see that ("oe-selftest -r reproducible" or see lib/oeqa/selftest/cases/reproducibile.py).

Cheers,

Richard


