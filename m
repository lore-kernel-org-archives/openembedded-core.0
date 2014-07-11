Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id 518727032F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 12:14:10 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id j17so1072512oag.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jul 2014 05:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hXOkAET+dZjZvcDf/W+ncy3eR17vNZFmq/AKcJ+/HnU=;
	b=bvXmBy1Yjmal06chkuQy1jFZnm1s3sqwQegusIu6I2GZUTYm567xN2dxwTGnHnJb+R
	oLERMrpawylhf0yg+jLNpyMPLUPUOZB+rkjxizWNzu+3wdTMpx39MTllyFb672vtHuyW
	a3Qrc4w1KcGn40fT5e7q5la2P65KFjApDYdPMUCqF7PHKgxtQw/kn7DQDJS4D/Ae/NJ8
	pFHcJUxTyf/WD4kW30TJKKvAwLrQs1srYheYm+u8V6l2QF564LAk/jUtYYh5L8LwDyUD
	tNCpv0pRn6eyeqBnlgGt5a2iVemcU+QSHRjEKl8vLkFuGyEJCnd3jNvMVdu0L9l4Vrro
	ZK8A==
MIME-Version: 1.0
X-Received: by 10.60.42.162 with SMTP id p2mr64061723oel.27.1405080851250;
	Fri, 11 Jul 2014 05:14:11 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Fri, 11 Jul 2014 05:14:11 -0700 (PDT)
In-Reply-To: <1405067225.15985.89.camel@ted>
References: <1404936934.15985.48.camel@ted>
	<CAP9ODKpd5-KkRZg7QMbaMS-zn=f6uephJObn3X44RNoEK8y76A@mail.gmail.com>
	<1405067225.15985.89.camel@ted>
Date: Fri, 11 Jul 2014 09:14:11 -0300
X-Google-Sender-Auth: 3sX-z7dviQn1CSnzMQGFwC4thg8
Message-ID: <CAP9ODKrWDP4OR4W3xxuKgCKzW7iqDZo5uc3DBEm43syYP=EA5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC 1/3] insane: Split do_package_qa into a separate task (from do_package)
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
X-List-Received-Date: Fri, 11 Jul 2014 12:14:19 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

On Fri, Jul 11, 2014 at 5:27 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2014-07-10 at 23:43 -0300, Otavio Salvador wrote:
>> On Wed, Jul 9, 2014 at 5:15 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > Its possible to run the package QA checks as a separate task rather than
>> > as part of the do_package task. This offers more parallelism but the
>> > fact that made me propose this is that ideally we'd like to access
>> > pkgdata to help add new tests and to do that, we need to run later in
>> > the task list. We also need to add in RDEPENDS to the task which apply
>> > to do_package_write_* but not do_package. See the subsequent patches
>> > for why this is desireable.
>> >
>> > If we split into a separate task, we need to add in calls to read
>> > the sub package data, build the cache structure used by do_package and
>> > cover the task with sstate (which is empty and just acts as a stamp
>> > saying it passed package QA). We also need to handle our own
>> > dependencies.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> I've just seen this email. I did see the failure from the overnight
> build and already sent a reply suggesting how this can be fixed, it
> should be a simple change.

Yes; I saw the proposed fix and I will do it here and test.

>> When I see a RFC serie I expect people to wait some days /for
>> comments/. I learned today those are already merged and /no comment
>> time/ has been given.
>
> The whole RFC was not merged. The previous RFC was and when that
> happened, to avoid more rebuilds, I chose to merge some parts of the
> second one since there appeared low risk.
>
> I send out a lot of patches, in general I get zero replies to most of
> them so its hard to know when I've waited "long enough". I did seek out
> and talk to some people about those RFCs and the feedback was positive,
> we all agree that the improvements to the dependency checking outweigh
> any downsides, including to be this issue.

Right but we could have it tried in AB and, as other times we did, do
the fixes to avoid master breakage.

I liked the patches and I did look at them. I was going to test the
stuff when I noticed it were merged. For RFC patches to be sincere I
expect them to be send /again/ without being RFC prior merging.

When you intend to give a short time for review/comment please comment
this in the series; so if someone wants more time can comment.

>> The problem I found is that running the QA checks in another task
>> seems to break some use-cases.
>
> I think in this case the usage is rather horrid and not something I'd
> say we've ever suggested or supported.

Well ... I'd prefer Freescale to fix their binaries for sure but I
cannot do it myself ;-)

>> In the libfslcodec (it is a binary blob provided by Freescale for
>> multimedia) we have:
>>
>> ...
>> python populate_packages_prepend() {
>>     ...
>>     # FIXME: All binaries lack GNU_HASH in elf binary but as we don't have
>>     # the source we cannot fix it. Disable the insane check for now.
>>     for p in d.getVar('PACKAGES', True).split():
>>         d.setVar("DEBIAN_NOAUTONAME_%s" % p, "1")
>>
>>         if p == 'libfslcodec-test-bin':
>>             # FIXME: includes the DUT .so files so we need to deploy those
>>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel libdir")
>>         else:
>>             d.appendVar("INSANE_SKIP_%s" % p, "ldflags textrel")
>>     ...
>> }
>>
>> In this case the INSANE_SKIP var is not being set on time. If we check
>> the value it is being set but it seems to be too late.
>>
>> How we can address it?
>
> Should be as simple as s/populate_packages_prepend//. The
> DEBIAN_NOAUTONAME doesn't really fit the description of the code there
> FWIW, I know why you're doing it but its not what the comment says.

I will review it.

> I would not recommend setting variables in function prepends like this,
> its ugly and error prone, as you've just found out.

Any suggested better way of to do it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

