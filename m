Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f52.google.com (mail-yh0-f52.google.com
	[209.85.213.52])
	by mail.openembedded.org (Postfix) with ESMTP id 75FC672E3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 15:53:41 +0000 (UTC)
Received: by mail-yh0-f52.google.com with SMTP id f10so6538657yha.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Feb 2015 07:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=e5Lk99mgO/Pg74H+T/N9MTdNgdw3w8PN55tob12ZY6g=;
	b=Rqw51D9hef5GlmBqBgQaN0AJkvhTT9567yyA7JKk3YRXj+wdKAG8gf3U2UD0g9eAP+
	xzevpcleOx3R8y41yD616ueHk72ZWljy02u7j7iCeE4qSBh80IMWRGzXaJwXzAT8Wdla
	MSkOww+8vbT7NqT5OZC5nDZdCWO5EPD4Ll1lzT9bqVWocPVyohvfjhhfrGsxHCY1jbOt
	ZNscYR12IG1DvVuhEA9Hi2JkzDeneSw8sKQJuJafjaEBOPuseOEjV1uhx+pvf8CAGZ9n
	HRIoLdq/1VV9GwygSBoRVPAizMyreMlPfwqKeaswE6OtSISaMVPwMAIrzlJzhk8GjCQA
	WCSw==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr1626587yhb.136.1423238022963;
	Fri, 06 Feb 2015 07:53:42 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.143 with HTTP; Fri, 6 Feb 2015 07:53:42 -0800 (PST)
In-Reply-To: <1423235582.20217.16.camel@linuxfoundation.org>
References: <1423085616-6729-1-git-send-email-ross.burton@intel.com>
	<4479188.gEPuv5Te0O@peggleto-mobl5.ger.corp.intel.com>
	<1423222962.20217.13.camel@linuxfoundation.org>
	<CAP9ODKqxCyd=h0ZdyjjY+eogPumbtY3VMBwvskSBQEcw8+D5+g@mail.gmail.com>
	<CAJTo0LZeVbSajYg6iNZo33O1BGRrU8SuQgnDA=Ra+XpOFprcuQ@mail.gmail.com>
	<CAP9ODKoE12hnigK3Z1MKjV5TYRu-EACd2KsCgD0M2hZSEFeNww@mail.gmail.com>
	<20150206150241.GG2287@jama>
	<1423235582.20217.16.camel@linuxfoundation.org>
Date: Fri, 6 Feb 2015 13:53:42 -0200
X-Google-Sender-Auth: 6VX6IRQGlZE6ArBenon7pKIJzXY
Message-ID: <CAP9ODKp2k4WScT76iBsF=Aq=AJGh5cXQui3-rb47uzMsPmhsKA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"
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
X-List-Received-Date: Fri, 06 Feb 2015 15:53:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 6, 2015 at 1:13 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2015-02-06 at 16:02 +0100, Martin Jansa wrote:
>> On Fri, Feb 06, 2015 at 12:21:23PM -0200, Otavio Salvador wrote:
>> > On Fri, Feb 6, 2015 at 12:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > >
>> > > On 6 February 2015 at 14:10, Otavio Salvador <otavio@ossystems.com.br>
>> > > wrote:
>> > >>
>> > >> I think they should re-run. Otherwise we can end having errors and QA
>> > >> issues unnoticed until a full rebuild.
>> > >
>> > >
>> > > That was the state of things until my original patch last week.  The patch
>> > > had the side-effect that changing QA tasks causing *everything* to rebuild.
>> > > I'm really not sure that's a good solution.
>> >
>> > If someone adds a QA tasks it is because it matters. In this case we
>> > ought to have it in an immediate effect so it does makes sense to
>> > rerun everything.
>> >
>> > I know it is bad from build time point of view but predictability and
>> > correctness is more important from my point of view.
>>
>> Agreed, especially when someone decides to make something fatal it
>> should highlight all failing recipes before it's enabled in "official"
>> build instead of sneaking the failures one-by-one as sstate is being
>> invalidated by other changes.
>
> Thinking about this from the other angle. Should someone having a
> different set of WARN/ERROR local settings mean they don't reuse sstate?

It should be checked against the different setting. If the price for
it is sstate invalidness, so be it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

