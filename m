Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id A70A86C747
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 22:25:21 +0000 (UTC)
Received: by mail-la0-f52.google.com with SMTP id ev20so1322650lab.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SZ1PCqAAVdsZwz2vaOdaoOCFuKufB2Gt5Y99+K+eygc=;
	b=Qno6GJSgWwTUlIYxUHqa/DhGC/8tx+r8R+9Ow7MpLMezsY/ju8KNOt8+sQtGmiY01E
	9yQsRrdeSHBZKSL4z/bvdg/f63VTYIGLGSGCe0GGXgQ4NdVeB0E/Latu0dzB1dIfqyrm
	4/DXGwPp6eYH7m/afOJ6tm0yqs9Vs8gn/mkITiR0iSVb4wvr03amYHgjSDJnIVdxegTV
	d4pWPfPlGiJlJAatLUxoYyAPEXw0zrAX6e+5+J+YAEXwjEI+QWM4TB9eVYet5U/UgUtt
	yRO61Sl/IZoXrIbeO8/fkgcHEJBDq4C/UfDIK3IFkXBk0BATsTAuyrgxIlpbRHEuLTWC
	diPg==
MIME-Version: 1.0
X-Received: by 10.112.132.9 with SMTP id oq9mr27661lbb.67.1385159120026; Fri,
	22 Nov 2013 14:25:20 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Fri, 22 Nov 2013 14:25:19 -0800 (PST)
In-Reply-To: <CAAQYJAt-EwCrEGXjEN1zU8oM4if7KOniKegHDQS=zezmJZFoZg@mail.gmail.com>
References: <1384520708.23724.12.camel@phil-desktop.brightsign>
	<CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
	<1384625383.3814.34.camel@x121e.pbcl.net>
	<1384777609.6460.224.camel@ted>
	<CAAQYJAt-EwCrEGXjEN1zU8oM4if7KOniKegHDQS=zezmJZFoZg@mail.gmail.com>
Date: Fri, 22 Nov 2013 23:25:19 +0100
Message-ID: <CAAQYJAuTZVe5zcP7pfz39fBDVOcZsc_-JYuOK8gXABCcm0fbEw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Tolerate empty INITRAMFS_IMAGE when INITRAMFS_TASK is set
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
X-List-Received-Date: Fri, 22 Nov 2013 22:25:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 12:26 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Mon, Nov 18, 2013 at 1:26 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sat, 2013-11-16 at 18:09 +0000, Phil Blundell wrote:
>>> On Fri, 2013-11-15 at 11:26 -0200, Otavio Salvador wrote:
>>> > Hello Phil,
>>> >
>>> > On Fri, Nov 15, 2013 at 11:05 AM, Phil Blundell <pb@pbcl.net> wrote:
>>> > > The idiomatic way to reinstate the old-style initramfs handling appears to be to
>>> > > set:
>>> > >
>>> > > INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
>>> >
>>> > What problems are you having with the 'new-style'?
>>>
>>> Good question.  When I first merged the version of kernel.bbclass that
>>> implemented the "new-style" system I was having a bunch of problems
>>> which seemed to be due to the new code.  However, after a bit of further
>>> debugging it now appears that most of them are issues with the
>>> implementation rather than with the concept and selecting INITRAMFS_TASK
>>> doesn't actually help very much because the code that was causing my
>>> problems is shared between the two paths.
>>>
>>> The main difficulty I was having was that kernel.bbclass was looking for
>>> the initramfs image with slightly the wrong filename.  After a certain
>>> amount of sleuthing and some clues from Andrea it eventually became
>>> apparent that kernel.bbclass relies on the initramfs image recipe
>>> leaving ${IMAGE_LINK_NAME} at its default value and will fail if it's
>>> set to anything else.  This seems slightly fragile and it seems as
>>> though it would be better for kernel.bbclass to look for the initramfs
>>> image at its primary location rather than relying on the symlink.
>>>
>>> I also discovered that the new code in kernel.bbclass uncompresses the
>>> initramfs image before embedding it in the kernel.  I can guess why this
>>> seemed like a good plan, but it's slightly surprising behaviour and it
>>> seems like anybody who wanted to embed the initramfs in uncompressed
>>> form would just select IMAGE_TYPE = "cpio" for it in the first place.
>>> Also, Andrea reports that he does actually get worse compression overall
>>> with this approach in at least some circumstances.
>>>
>>> Anyway, with those things fixed I can now at least build images again
>>> and it's entirely possible that the "new style" system would also work
>>> for me.  However, it doesn't seem as though the new technology would
>>> bring me any particular benefits, and as far as I can tell it would
>>> introduce an extra kernel compile step that I don't particularly want,
>>> so I am inclined to stick with INITRAMFS_TASK for the moment.
>>
>> FWIW I would *love* to simplify this code and have one good/efficient
>> codepath everyone uses. The initramfs decompression code looks nasty to
>> me for example and I agree with your thoughts on that.
>>
>
>
> This decompression is apparently what makes my kernel unbootable.
> We purposedly specify options for the XZ compressor (for machines with
> 32MB ram) and if the cpio is uncompressed before these preferences are
> lost.
>
> Andrea
>
>

So, can we change it? I'd say if one bothers to specify compression
for the cpio then respect that...
If on the other hand one needs to do dirty things within the cpio,
then don't compress it as first: the compression options can be
specified in the kernel recipe/config so the artifact is compressed
afterwards.

Cheers

Andrea

>
>> Cheers,
>>
>> Richard
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

