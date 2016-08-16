Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id A65CD7326D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 14:46:14 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id n59so125042215uan.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tUONKCqM2nFBPJVylybG9HN8jQWHzJUkigt7I9gOMTk=;
	b=MmYg1pSa1m/pnFmUp/c04Vng2a+VnzKw8ra/h+tWDPnKHVzuzSsM6UD3uXPYiJXZpN
	GO5uLvsOWpEAR3HjN1HKOzmP2/6IjNlNC2R58sxJgA1fLQf0LXmS7k0xyGRHS/hK4jqj
	Lq9Muywad1tsxc+ZNAhWvB2tVMCq4lo7eBqwHtvTplmVw2h231n5uE+wSZEWx9b/VeTk
	NDCV9NMPEP1+QK8MzEur2yy6kVX5nKIdh36/mf8te6Nxxpzvmxet/uO1SQVDNhj5BzYI
	NAvLEMDyS+r3LEY7DNi6yrRqlo5MnrkPpje++lwM9pCVxihNch7NGZFgPgZI07Ks+DsK
	6MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tUONKCqM2nFBPJVylybG9HN8jQWHzJUkigt7I9gOMTk=;
	b=B6Gnp3GYxckykx3ctc2I66BAPXnvO6mlyV6idUcgMouK6hllMthEIA1yLSe7gt/hN9
	BrAAM1p1hg5Q77sL79Je3tk/PzTu5usGn2+bLUewpoPiSSW8bwYJfaW45kfJATKYQ4Lu
	bIS8bjdIwqW4iC1/hl4FHgy/ZebgyZwx8p+ehoknde2pmnQI0RyjZX/kzxqjUzlYnsKs
	f0i5lZ6ih/Kjd6BDTdsUvqae6GMPRfNtY9Fa+KRPIqK3B85p0atj/40GJc2jCu33PObz
	lhakeSRwblLdwT1s/5Lb9q2nhkeOdg6l90873z6da1bVqxu9yrl+bE6lZbfH+eb6KRBF
	YxZg==
X-Gm-Message-State: AEkooutgfNG8JGE0VmfnEUzb622dDgBu9aAuBr0Syj0DIRtlgIMX5CiwYkCkm5DTMkkP2V7TzD1Nu7zAdG/kZA==
X-Received: by 10.176.66.132 with SMTP id j4mr17091003uaj.120.1471358774610;
	Tue, 16 Aug 2016 07:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.124.70 with HTTP; Tue, 16 Aug 2016 07:46:14 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 16 Aug 2016 16:46:14 +0200
Message-ID: <CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Tue, 16 Aug 2016 14:46:16 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 16, 2016 at 4:02 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>
>   was about to submit a small number of patches to clean up redundancy
> when people combine "_append" with "+=" (because it offends my
> delicate sensibilities), and ran across this in oe-core,
> unfs3_0.9.22.r497.bb:
>
>   DEPENDS_append_class-nativesdk += "flex-nativesdk"
>
> uh, what?
>
>   most of the time, i assume the above doesn't hurt, it's just ...
> silly. but normally, with "_append", you *need* to add the leading
> space explicitly, and that's not being done above. so does that mean
> that combining "_append" with "+=" *does* generate a leading space?
> that just makes my head hurt -- the possibility that "_append" is
> being used in a way that normally makes it fail, only to have "+="
> step in and save the day. at which point "_append" saves processing
> that until the end of parsing? yeesh.
>
>   thoughts?

By the point the += is handled, the override won't have been interpreted
yet. My guess is that += fetches the value of the variable
"DEPENDS_append_class-nativesdk", gets back the empty string, and
adds a space followed by "flex-nativesdk" to that.

The resulting " flex-nativesdk" is then interpreted as usual when the
overrides are handled.

You might like the note I added to
https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages
by the way. :)

Cheers,
Ulf

