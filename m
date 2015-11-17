Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 20D2660616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 19:34:18 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so244657199wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=63tDG+zN4UdHzBL1ofwSpEj9XXTT9XWEW+BBvvEdxcM=;
	b=nSlhnjX87LTJVUki0ZXPK0NqZsFo7f1ChVMVsqduNYlFNHsB4ldQzdX2bKrUrt6c+5
	VcKxTHQXVXj3A42x6HEf4qtvTez0f5wwSYgzH7fy41fxRD5ENEDlcBGhjlFdNRd1P6v2
	ewewrV7Gv6B/JKlSGh6Bpjp9XSoMuiL7bnu1+gM1K6bY0++CpNZVYjTRxetVQ5cXY73J
	AkPwpvJlToPV8p746Tpn1e6VNuN6KXWZs1Ct62gFFUFRW2p//iGC3ycHDIuYBvLOrDwm
	jpHfn3h6LknPEbBFmG8m1nG0KylauBKCIct/revI8eNAliMe6agrfUxnilnloVW5x8/3
	JUIQ==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr43391169wjc.114.1447788859367; 
	Tue, 17 Nov 2015 11:34:19 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Tue, 17 Nov 2015 11:34:19 -0800 (PST)
In-Reply-To: <CAJ86T=V7WyuBuLvn7spNWJxW3TohpeAgf7yFFyahr0F29t1RhQ@mail.gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
	<1447780178.1472.29.camel@pbcl.net>
	<CAJ86T=V7WyuBuLvn7spNWJxW3TohpeAgf7yFFyahr0F29t1RhQ@mail.gmail.com>
Date: Tue, 17 Nov 2015 11:34:19 -0800
Message-ID: <CAJ86T=XhuWTfFr3-7VGH6yM96e+brxe3hMW79xuaNuE-vjD1mQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Nov 2015 19:34:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Nov 17, 2015 at 11:16 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Tue, Nov 17, 2015 at 9:09 AM, Phil Blundell <pb@pbcl.net> wrote:
>> On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
>>
>> On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:
>>
>> Does the resulting directfb-csource binary actually work with that
>> change?  My recollection is that ld.bfd will just silently permit
>> relocs that gold (correctly) refuses to allow.
>>
>>
>> Personally I don't use DirectFB (and am constantly surprised it's still a
>> thing) so at this point I'm not going to merge either of these patches until
>> someone can confirm that their fix *works on hardware* instead of just
>> fixing the build.
>>
>>
>> I think that's a reasonable position.  In any case, the underlying issue is
>> a compiler bug and ought really to be fixed there rather than patching
>> directfb or any other package that just happens to fall over it.
>>
>
> The directfb-csource binary linked with the bfd linker segfaults on
> startup, so it does indeed look like a compiler problem.

Hmmm... maybe I spoke too soon. lsmod is also segfaulting on startup
so there's something else going wrong with this build.

If I copy the same directfb-csource binary into a rootfs built with
security_flags.inc enabled then it runs OK...

