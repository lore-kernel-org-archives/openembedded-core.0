Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZKvy-00057i-4L
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 12:45:22 +0200
Received: by fxm19 with SMTP id 19so595647fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=LT/mrFI4+L2Lkjwp9x1PDi4rO/QOa5lF1WeFqFYyISE=;
	b=SKlt1XGT4cgW/fHzFUGKvW+CQypWX60GtfbfgXtGpLJFmdHdcVwsPZLOWm/TTbf5xJ
	qamHmNU3SYqk2gsDzLnOFBl+PjbJAu6ock8sxr+m2knTKtADUvgo5C99XYGeAIMDnkJX
	Il8wNQ/8OTlkDU4bzVgOl54DOTUUHYAG4R5nc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MOWtqRqN05kZsRCCdLWFP9kFfF7WRjCLKu3KUdoudS4w+Zc9Zx5ZVm7HDzzTO0Qaa4
	jq0BNlbGgikDJZrPBrGMtMdNeo03zNoyF3ltqt4wjzQudDV9l2IjZWFX20CMY45LoKMf
	G4tUp2sYol6M9Bj0C6FlKpRa74+gUpqxunf1o=
MIME-Version: 1.0
Received: by 10.223.100.15 with SMTP id w15mr683448fan.11.1308739308011; Wed,
	22 Jun 2011 03:41:48 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Wed, 22 Jun 2011 03:41:47 -0700 (PDT)
In-Reply-To: <1308738156.21613.80.camel@phil-desktop>
References: <cover.1308680000.git.anders@chargestorm.se>
	<4e9efffb9118e29178d087577c0cebb360872ebe.1308680000.git.anders@chargestorm.se>
	<1308681938.3083.11.camel@lenovo.internal.reciva.com>
	<BANLkTinkNcN8RBcZapj5xF=q_p4O++trgg@mail.gmail.com>
	<1308738156.21613.80.camel@phil-desktop>
Date: Wed, 22 Jun 2011 12:41:47 +0200
Message-ID: <BANLkTim13H6v6T5eovEOYVXoiW=4bOtLXg@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/5] linux-kernel-base: add support for Linux 3.x
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
X-List-Received-Date: Wed, 22 Jun 2011 10:45:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 12:22, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2011-06-21 at 21:10 +0200, Anders Darander wrote:
>> If we keep the kernel_majorversion, we'll need to have something
>> similar to this,
>> as the major version up to 2.6 was determined by X.Y. From 3.0, only the=
 first
>> digit represents the major number; while the second digit (0 in 3.0)
>> is equal to
>> x in 2.6.x. Thus, the function to determine the major version has to
>> return either
>> 2.6 or 3.
>
> Well, the thing is that OE's "kernelmajorversion" was always something
> of an artificial construct. =A0It was introduced purely as a way of copin=
g
> with some of the differences between 2.4 and 2.6: this was primarily the
> different module format, but it also happened to coincide with major
> rewrites of the iPAQ and Zaurus kernels which were the main ones we were
> using in OE at the time. =A0Returning "3" here isn't going to be helpful
> since none of the classes will know what to do with that value: all they
> ever do is compare it against either 2.4 or 2.6. =A0The exact form of
> those tests has never been standardised, so there is a risk that you
> might encounter

I assumed that the reason was that; and it's nice to get a better grip of t=
he
older history. (At that time I was more concerned with Buildroot and uCLinu=
x).

> Since there are no material differences between Linux 2.6 and Linux 3.0
> that OE needs to be aware of, I think it would make most sense for
> kernelmajorversion() to continue returning "2.6" for Linux 3.0 and
> future versions if we did want to keep that mechanism.

Yes, and that's why I completely removed the tests in the bbclasses that
I've touch sofar.

> However, since the whole purpose of the mechanism was to ease the
> transition from 2.4 to 2.6, I am fairly confident that it can just be
> deleted altogether if support for 2.4 is being removed.

Sounds good. I'll grep through a few more classes to see if the tests seems
to occur in more places. Unless I find that the major version is used for
something else, I'll remove it.

Regards,
Anders


