Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 894FD60620
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 17:11:41 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id k90so44301152uak.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 10:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rGnA8bbioGY3R3JpyoxtKKuljLE2YdiWIVVYkpG5P9k=;
	b=teDZubQdDSIlshlKcFg+2XkR4iHD+Oc5LTpzh74GKAzcxmiePpzOzUNM4vyEOnLbLI
	xqOR/doHXPpGgIYS2tOTYSm0NyJpXZa/YZAdEnzwAOBtirSS3wHawKQGW0Soc6oVkHOd
	UT/uoC6FW/Om8e4P8lwNtJAD4sJxyqtDy1q7JMFAjQsYv3R77EHzH5+aBhSVH05TpwRA
	OdnS6y8YjQF5XLCb3E4trHW0mY1yQlCpgMc5NvrGB6NuHCdnvV+tj/bQMUm+k/FfFPfu
	LMBo0r0gh7mcsgrdcBsEZbVUznN2w28rbvgD/U9c3Gz7ZFM4qV1G8xrE42fAmUCej1Xl
	X9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rGnA8bbioGY3R3JpyoxtKKuljLE2YdiWIVVYkpG5P9k=;
	b=M1g3KkO6PO37jowhlcCoMYheSU4vHL0duo34u7VUDkTV6A1/9uzo3XcVIc/QbWHHBs
	wIefZLVpeIAXAZPz1pblaaS3DuveJKYgSB0A+1CjPYjz1JaSRl/dGxfTnyTW/LWUxCJ6
	V/Hq25EyqWOAtveRZbWpUQFqy83dy7L+6KC2+vrWpa+50N8M1EX+5gcTeYWF/ibTNnHm
	76Bpp9zN4NzadArml3s/1MPMHdRlf4XxBp4sIrQCAa2Um5EvfylfVgt7sVe+sM+1CNZR
	xDLc3rPf8ThRZdaNoBhPMJIkGamqzTM5NfQuth8YorPIDtrTsZvsSOtGfAWqIhU6OXfs
	n4kw==
X-Gm-Message-State: AE9vXwPcu2u+8LDFWydSFjzJ4AXbUL28yDFvkamlfK9h00SnopQFoyuI66RXb6Vp1Ppwebtiyt2q46MdPetOwA==
X-Received: by 10.31.95.137 with SMTP id t131mr2479668vkb.67.1472577096798;
	Tue, 30 Aug 2016 10:11:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Tue, 30 Aug 2016 10:11:36 -0700 (PDT)
In-Reply-To: <1472576443.29583.33.camel@linuxfoundation.org>
References: <6564e30c-bf94-8476-ac22-0be131193ebd@embed.me.uk>
	<1472576443.29583.33.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 30 Aug 2016 19:11:36 +0200
Message-ID: <CALbNGRTvyqTO=oDFQ7LjwhxKCGkopDk2Bd_AMZQ0F==OL++vKQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: gcc 6.1+ and isystem
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
X-List-Received-Date: Tue, 30 Aug 2016 17:11:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 30, 2016 at 7:00 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2016-08-30 at 16:37 +0100, Jack Mitchell wrote:
>> Some of the headers shipped with gcc 6.1 and above now use
>> #include_next
>> to try to and do clever things with munging system header files. Our
>> injection of isystem into the build at 'meta/conf/bitbake.conf' seems
>> to
>> be causing some programs to fail to compile. A full explanation can
>> be
>> found at [1], a bug report from GCC specifying that it should only be
>> used in extreme cases at [2].
>>
>> Since we seem to be adding -isystem unconditionally to BUILD_CFLAGS
>> from
>> bitbake, and that the default behavior has now changed should this be
>> revisited? I'll admit that I am no where near experienced enough with
>> GCC and friends internals to make a call on this one, I'm just
>> looking
>> for some input.
>
If I read the bug correct, the error occurs only for c++ when
including STL headers (and for us on native recipes). As this
combination is not that common (meta-qtx?) we have not seen fallout so
far.
> Its been a long time since we've looked at the native build flags and
> the world is a different place from when they were first implemented
> around a decade ago. I did cull some bits occasionally but more cleanup
> remains and it could be we can change it. A build of all the native
> recipes trying to replace it with a -I flag would likely be the first
> step...
>
a bit off topic: I did prepare similar for cmake-native. I saw much
fallout and helped myself by patching cmake-native. Will send out a
patch as RFC.

Andreas

