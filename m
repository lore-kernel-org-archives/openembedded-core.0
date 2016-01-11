Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5E76FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 23:18:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l65so28451021wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 15:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=IOlLxFl3aC1cS213cf2SqujtYRvRTS+/Q7xHM4v+aBE=;
	b=vpKT6Katu5Y/HtTlXIY2JJRdBlgIghmSud+H4e/OPOBfJdJkB+4uBLX8rRObtR96n+
	1Wj1UxojpER8JHtKHwiquCoDbOzVXFU4NT+MmJ64kjdeQXxj4YJswXXpKSg07KB7tGt/
	OIbzc6b9JpcEgFaEZbYjaJDzpNC6O8NQQfPbehFlJKArTItdAKloD4gIAHz2MI8GRjbk
	EvsyS57hDLkZn7+YS5yvrTSVc1jGjr126DIoUpFNJw927EI5b2qcGEZ0ycWjN14fdk/a
	mfNxQqkZT6jNU1ViM71NaATkAY0M6jNYzYW38j5yhcygF7sZKEbCTdxmuPlK9yDtLNIr
	uUSw==
MIME-Version: 1.0
X-Received: by 10.194.203.99 with SMTP id kp3mr137609482wjc.3.1452554298813;
	Mon, 11 Jan 2016 15:18:18 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 11 Jan 2016 15:18:18 -0800 (PST)
In-Reply-To: <1452553655.7598.206.camel@linuxfoundation.org>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
	<4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
	<1452553655.7598.206.camel@linuxfoundation.org>
Date: Mon, 11 Jan 2016 15:18:18 -0800
Message-ID: <CAJ86T=XsdWexKsqOxsHxAnxJ7-88D70g7bwcxCHKi5veEWkfqQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Mon, 11 Jan 2016 23:18:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 3:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2016-01-11 at 14:58 -0800, Khem Raj wrote:
>> > On Jan 7, 2016, at 3:40 PM, Phil Blundell <pb@pbcl.net> wrote:
>> >
>> > On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>> > > FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations -fomit
>> > > -frame-pointer -O4 -ffast-math"
>> > > +FULL_OPTIMIZATION_armv7ve = "-fexpensive-optimizations -fomit
>> > > -frame-pointer -O4 -ffast-math"
>>
>> O4 ? may be just replace this whole thing with -Ofast now a days
>> -fexpensive-optimizations is enabled at -O2,-O3 anyway same for fomit
>> -frame-pointer and -Ofast turns on
>> feast-match on top of -O3
>>
>> > I wonder if this would be better as just FULL_OPTIMIZATION_arm.
>> >  That
>> > said, the OPTIMIZATION variables are primarily distro knobs and
>> > it's not
>> > entirely clear that individual packages ought to be overriding them
>> > at
>> > all.
>> >
>> > Does anybody know whether there is any actual science behind the
>> > use of
>> > those flags on armv7a specifically?
>>
>> it came into ffmpeg circa 2008 and proliferated into related
>> components primarily to support vectorization and neon
>> which was quite nascent for ARM architecture in those days in gcc.
>> Today if you were to configure libav with default options
>> then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno -fno
>> -signed-zeros -fno-tree-vectorize
>>
>> which is primarily -Ofast -fno-tree-vectorize
>
> I have to admit that my personal instinct on these is simply to remove
> them. I doubt they're buying much now and if people really want to tune
> specific recipes by hand they still can do so from their local/distro
> config.

It's the other armv7a over-ride which probably needs more careful
consideration, ie:

  EXTRA_FFCONF_armv7a = "--cpu=cortex-a8"

Khem, did you look into that? What happens to libav if we don't
configure for a suitable CPU?


> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

