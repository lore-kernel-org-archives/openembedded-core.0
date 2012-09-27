Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THGSo-0000wr-Gf
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:57:22 +0200
Received: by eaac1 with SMTP id c1so605876eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=swZZg/+wkfo26ItewB/189eJ2/qOx7NsnpcvgKP2BoE=;
	b=kEj37E/jwkxIwGmLaNYBJpJsXS5mCKJFT4r/FS22Vf4o1pbrOn7wmXm2CkRu0VWglv
	z0f5os7evkapjVHgxnRMsNOyT6aFzRIvgNwkLo/Kl4zTPE8k+cDv4urqUNb7WJsWySQA
	htj/eYlsm6aij7dGR0ibT9WO2F8QDzWSyupV950lXOJJOY1/Rfrh+HvqikG6Oiw24RNt
	qLVje8wOophQpQtJh/ZgqQUMv4rbkzWsi8DftjCEp0LCOMeNXGypUDJ0BkiZ30YzaeHY
	5Eg+g1QwLTgLTQr05jQ1s4pnyyJsTXcdjR9bgUP1yrVnoSPXvE3LZa9aug2BS7qNVg9a
	nauw==
Received: by 10.14.202.131 with SMTP id d3mr6412509eeo.32.1348760670696; Thu,
	27 Sep 2012 08:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 27 Sep 2012 08:44:00 -0700 (PDT)
In-Reply-To: <1348759013.8493.5.camel@ted>
References: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
	<1348560878.8662.29.camel@ted>
	<CAMKF1srWM46Jofrjd8xxX22waY1b7O3a0Nwr-Av+B_mid9fSfw@mail.gmail.com>
	<1348667991.8662.108.camel@ted>
	<CAMKF1sqFe+8xmEg6r+g9+2xLo0TYyfGQp0aYOCT+kp-WHE03+A@mail.gmail.com>
	<1348759013.8493.5.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2012 08:44:00 -0700
Message-ID: <CAMKF1soymsRiG_AfauPo8RWqEemmd36MeqhdRkDrYrFnAuG-eg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Sep 2012 15:57:22 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 27, 2012 at 8:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-09-27 at 07:14 -0700, Khem Raj wrote:
>> On Wed, Sep 26, 2012 at 6:59 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On Tue, 2012-09-25 at 06:27 -0700, Khem Raj wrote:
>> >> On Tue, Sep 25, 2012 at 1:14 AM, Richard Purdie
>> >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > This wallpapers over cracks. Why is libtool-native/libtool-cross broken?
>> >> > Shouldn't we fix whatever is breaking libtool?
>> >> >
>> >>
>> >> it is not broken. But we were ending up using cross-libtool for native
>> >> recipe that does not seem right.
>> >
>> > Looking at your original error message, it says:
>> >
>> >  /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool
>> >
>> > which is libtool-native. I appreciate that the OEMAKE line to use the
>> > cross version is wrong but it looks like it still manages to find the
>> > native libtool and that it isn't working.
>>
>> hmmm I tried and it worked fine when libtool-cross was staged. I guess
>> my problem was
>> that it was trying to find native sed in native sysroot. I cant
>> reproduce it. But I guess
>> the patch still makes sense. I can send it with commit message changed
>> if you are ok with that
>
> I'm not really. I'd like to understand what the problem is we're fixing
> before I take patches. We don't understand what is wrong here.
>


yes it seems something else is going on since for native recipes
STAGING_BINDIR_CROSS=${STAGING_BINDIR_NATIVE}
which means it ends up sourcing the native libtool for jpeg-native

When I did bitbake jpeg-native from scratch it worked fine too.

It appeared on a build server so it could have some weird race condition show
up. I will keep an eye if it happens again then I would like to
understand and hopefully reproduce.

Let me withdraw this patch.

> Cheers,
>
> Richard
>


