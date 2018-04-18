Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DCF687451A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 11:34:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3IBYFx0018376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 18 Apr 2018 12:34:17 +0100
Message-ID: <1524051255.18865.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 18 Apr 2018 12:34:15 +0100
In-Reply-To: <CAJ86T=XhMh1+C52TxLR6oPpzyTHe+gt=-VzFZf9A9c-Tt8ST9g@mail.gmail.com>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJ86T=XhMh1+C52TxLR6oPpzyTHe+gt=-VzFZf9A9c-Tt8ST9g@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Wed, 18 Apr 2018 11:34:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-04-17 at 12:15 -0700, Andre McCurdy wrote:
> On Tue, Apr 17, 2018 at 9:44 AM, Richard Purdie
> > We've looked into various options, basically we cannot link against
> > our uninative libc/ld.so since we don't have the right headers or
> > compiler link libraries. The compiler doesn't allow you to switch
> > in a new set either, even if we did want to ship them. Shipping a
> > complete compiler, dev headers and libs also isn't an option.
>
> Maybe not an option now, but in theory wouldn't a set of native tools
> statically linked with musl and downloadable from a public sstate
> server solve all these kinds of issues?

There are a few ways you could solve this problem in theory. The
trouble is you need to build these native tools somehow and to link
against musl, you'd need a cross build more similar to "nativesdk" than
"native" as you can no longer use the host gcc.

We've looked at shoe-horning nativesdk into native before but it gets
very very messy very quickly as they're really not equivalent. We could
of course create some new native-like variant but again, messy very
quickly, particularly trying to get the sstate checksums to match.

You can give up on the native checksums matching or coerce them somehow
but again, very messy very quickly.

uninative works surprisingly well for how "simple" it is, it does have
some rough edges.

I have found one further issue with this patch and the need to tweak it
a little further, I'll send another patch shortly related to that once
we test it a bit more. That said, if these two changes do work, they
fix one of the big flaws in uninative and should make it a lot more
workable/usable.

Cheers,

Richard









