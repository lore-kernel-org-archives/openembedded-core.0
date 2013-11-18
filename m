Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 72ADB6D58B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 23:26:35 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id l4so2943005lbv.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 15:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=CtGCmxcAdF4XAiuYeUjX110dmx721gM+AiymVzw7GSM=;
	b=GE4SNzu0dW+QNPuze2hCg6kC7gOkAnLaA6GqV+CWBgBzdXHlaKpOCAt6G4/BX4v4kz
	pv7NiloqZis9AelHCXCLuUTLXbnprAfFnrTI5lKoktTLPma6PikmszXeshEeyDL+n/Es
	95lngPwp80FCsSl9VuN/9JFGAWw0K/GhPs5XFJlyHfzYAlfssIzUIOFNf+CybbKV1xEr
	OpPWgD6eYCNWfeVQTARRQQmPzaDBv3jPH5qGLmDPYLfnwKwHcBW+9xXqP2Y9ixmctPyJ
	bdXlKDkLW0FiXW+SOqk/7VIyiJ+gccVAWfrzb5B2U52cf8WLtwqUIPURIIQrVzFLJIVT
	qOWw==
MIME-Version: 1.0
X-Received: by 10.112.182.40 with SMTP id eb8mr23921lbc.86.1384817196423; Mon,
	18 Nov 2013 15:26:36 -0800 (PST)
Received: by 10.112.52.74 with HTTP; Mon, 18 Nov 2013 15:26:36 -0800 (PST)
In-Reply-To: <1384777609.6460.224.camel@ted>
References: <1384520708.23724.12.camel@phil-desktop.brightsign>
	<CAP9ODKqVib+iDsGEges9Hhy2dyWoOi2JtfhVJ+pNCs=KUq7Q4A@mail.gmail.com>
	<1384625383.3814.34.camel@x121e.pbcl.net>
	<1384777609.6460.224.camel@ted>
Date: Tue, 19 Nov 2013 00:26:36 +0100
Message-ID: <CAAQYJAt-EwCrEGXjEN1zU8oM4if7KOniKegHDQS=zezmJZFoZg@mail.gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2013 23:26:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 18, 2013 at 1:26 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2013-11-16 at 18:09 +0000, Phil Blundell wrote:
>> On Fri, 2013-11-15 at 11:26 -0200, Otavio Salvador wrote:
>> > Hello Phil,
>> >
>> > On Fri, Nov 15, 2013 at 11:05 AM, Phil Blundell <pb@pbcl.net> wrote:
>> > > The idiomatic way to reinstate the old-style initramfs handling appears to be to
>> > > set:
>> > >
>> > > INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
>> >
>> > What problems are you having with the 'new-style'?
>>
>> Good question.  When I first merged the version of kernel.bbclass that
>> implemented the "new-style" system I was having a bunch of problems
>> which seemed to be due to the new code.  However, after a bit of further
>> debugging it now appears that most of them are issues with the
>> implementation rather than with the concept and selecting INITRAMFS_TASK
>> doesn't actually help very much because the code that was causing my
>> problems is shared between the two paths.
>>
>> The main difficulty I was having was that kernel.bbclass was looking for
>> the initramfs image with slightly the wrong filename.  After a certain
>> amount of sleuthing and some clues from Andrea it eventually became
>> apparent that kernel.bbclass relies on the initramfs image recipe
>> leaving ${IMAGE_LINK_NAME} at its default value and will fail if it's
>> set to anything else.  This seems slightly fragile and it seems as
>> though it would be better for kernel.bbclass to look for the initramfs
>> image at its primary location rather than relying on the symlink.
>>
>> I also discovered that the new code in kernel.bbclass uncompresses the
>> initramfs image before embedding it in the kernel.  I can guess why this
>> seemed like a good plan, but it's slightly surprising behaviour and it
>> seems like anybody who wanted to embed the initramfs in uncompressed
>> form would just select IMAGE_TYPE = "cpio" for it in the first place.
>> Also, Andrea reports that he does actually get worse compression overall
>> with this approach in at least some circumstances.
>>
>> Anyway, with those things fixed I can now at least build images again
>> and it's entirely possible that the "new style" system would also work
>> for me.  However, it doesn't seem as though the new technology would
>> bring me any particular benefits, and as far as I can tell it would
>> introduce an extra kernel compile step that I don't particularly want,
>> so I am inclined to stick with INITRAMFS_TASK for the moment.
>
> FWIW I would *love* to simplify this code and have one good/efficient
> codepath everyone uses. The initramfs decompression code looks nasty to
> me for example and I agree with your thoughts on that.
>


This decompression is apparently what makes my kernel unbootable.
We purposedly specify options for the XZ compressor (for machines with
32MB ram) and if the cpio is uncompressed before these preferences are
lost.

Andrea



> Cheers,
>
> Richard
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

