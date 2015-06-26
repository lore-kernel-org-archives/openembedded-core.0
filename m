Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id AE33D605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 23:06:23 +0000 (UTC)
Received: by obbkm3 with SMTP id km3so75688315obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cmNcB7fXdLLFg9DnI0Boc+5EnLuy0iDZRG7mEXbqmwk=;
	b=ZSfqBo57kjTvloHTbIM79Tow0cN0yoNzegK7iJCHvzi06+p7MYaiY/tXzmCyX8LXqU
	u6uRCbbafNEQTSvvKROZWNhMRLqw8/P3xZyY6jW2FxTI9s5xcCCZDGWzewCufq/Me2ha
	BDoAgrQUG+D1IuIZ2dY9REGHeipvQWi2Wbtn4aG/fkbmAUi8L53IaMg/Tr3s4+bnKX8x
	ViU6gsE8ajx6VAZhcFJhT2pkXS7G3Xpleiplz8xeeoR0nuTPgBim1XQtROFQM+T6VGw5
	kaFQFpxK8N5Vts2aOFzSFsEY0RsSVyTBPvmNjSKSrEz3PjPe7ol7qHK1qxwDLl/jMz2f
	97Jw==
MIME-Version: 1.0
X-Received: by 10.60.145.169 with SMTP id sv9mr454243oeb.69.1435359983996;
	Fri, 26 Jun 2015 16:06:23 -0700 (PDT)
Received: by 10.202.64.130 with HTTP; Fri, 26 Jun 2015 16:06:23 -0700 (PDT)
In-Reply-To: <1435358821.10583.36.camel@linuxfoundation.org>
References: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
	<1435358156.10583.34.camel@linuxfoundation.org>
	<1435358821.10583.36.camel@linuxfoundation.org>
Date: Fri, 26 Jun 2015 16:06:23 -0700
Message-ID: <CAJ86T=VpxtnCn=HvFRoy_uQs__OJF=ErzpnPf5S1N+6J0=c65A@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] pbzip2: add initial recipe, pbzip2 v1.1.12
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
X-List-Received-Date: Fri, 26 Jun 2015 23:06:24 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 26, 2015 at 3:47 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-06-26 at 23:35 +0100, Richard Purdie wrote:
>> On Thu, 2015-06-25 at 12:46 -0700, Andre McCurdy wrote:
>> > Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> > ---
>> >  meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb | 27 +++++++++++++++++++++++++++
>> >  1 file changed, 27 insertions(+)
>> >  create mode 100644 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
>> >
>> > diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
>> > new file mode 100644
>> > index 0000000..fb70d0c
>> > --- /dev/null
>> > +++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
>> > @@ -0,0 +1,27 @@
>> > +SUMMARY = "PBZIP2 is a parallel implementation of bzip2"
>> > +DESCRIPTION = "PBZIP2 is a parallel implementation of the bzip2 block-sorting \
>> > +file compressor that uses pthreads and achieves near-linear speedup on SMP \
>> > +machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
>> > +newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
>> > +HOMEPAGE = "http://compression.ca/pbzip2/"
>> > +SECTION = "console/utils"
>> > +LICENSE = "BSD"
>> > +LIC_FILES_CHKSUM = "file://COPYING;md5=4c4f2edec9679d5abef3514a816b54a4"
>> > +
>> > +DEPENDS = "bzip2"
>>
>> http://errors.yoctoproject.org/Errors/Details/12617/
>>
>> probably as bzip2-native is in ASSUME_PROVIDED at a guess and the bzip2
>> headers weren't installed :/.
>>
>> We might have to force this to build bzip2-native, the only issue with
>> that is installing bzip2 itself into the sysroot will cause a race like
>> we've had with tar and gzip :(. We might have to teach it to install the
>> libs but not the binaries in the native case (and do a PROVIDES +=
>> "bzip2-replacement-native" or something so we can depend on the right
>> thing.
>
> Turns out we've been here before. We can fix this with:
>
> DEPENDS_append_class-native = " bzip2-replacement-native"
>
> I'll send out a patch.

Thanks.

I'm wondering why I haven't seen an issue though - no build errors
here and I don't have any bzip2 headers on the host.

>
> Cheers,
>
> Richard
>

