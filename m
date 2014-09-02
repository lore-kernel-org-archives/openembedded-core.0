Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f178.google.com (mail-yk0-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8B79E6FE64
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 13:55:46 +0000 (UTC)
Received: by mail-yk0-f178.google.com with SMTP id q200so4176988ykb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 06:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=bwdSyIPOhHNkuDnTPsMHg5PZVYZ74V0OVw9+HCvo+lo=;
	b=maMHQbmaoepaqlfW5JTsjBU8LEehbSqdqoM+IoKoaA4XScMbOrRmzBZ9Q/uAUGmwu3
	zYr1lDGZ3rUxOTk/VSV9gWYl+9xk4ZqcDAHdgnAwpImw4JQcs9T54hFf+8YCHO9boR0x
	eJ+KBC0I9dSNzdfopFjuOpzErC89PLmhhorAbfnbqcWJDP6X8qeQuBOS7+S/byxjjKxq
	IkJjP22J6AEkp0BWM3SJDWmF8cwTl4jeeASQLVP4DMv4lISC4vHSq10LhpuGNuJaI5gO
	G23OTi6a66Q2IC3cMEDGIe5ELE/fCViyDS61fgESAqRuBOQf0+7j6OdRfvK1bJqwA/GA
	mZcA==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr51177449yhi.67.1409666148136;
	Tue, 02 Sep 2014 06:55:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Tue, 2 Sep 2014 06:55:48 -0700 (PDT)
In-Reply-To: <1409663988.18528.7.camel@ted>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
	<540539E6.2030508@windriver.com>
	<CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
	<540568FB.4040006@windriver.com>
	<CAP9ODKqfNwXn_dEUu-WT6zLoUM_MDDtgPRp2WfUU238UcpuKJw@mail.gmail.com>
	<1409663988.18528.7.camel@ted>
Date: Tue, 2 Sep 2014 10:55:48 -0300
X-Google-Sender-Auth: vnuCRfEMn00UNPbaNTd5EPjoMrQ
Message-ID: <CAP9ODKo75p0opJdqs2z_uJPrQBv0Q8t7aCgEz_JoaS1Ezq-2Ug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 13:55:55 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 2, 2014 at 10:19 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-09-02 at 09:36 -0300, Otavio Salvador wrote:
>> > How about only remove the x11 for target ?
>> >
>> > DISTRO_FEATURES_remove_class-target = "x11"
>>
>> This is a workaround. Few days ago it built fine so a clear regression.
>
> Lets take a step back and think about this for a minute.
>
> If you build qemu-native configured with sdl, its likely you do want X
> support. As this stood, the linkage with libxext was problematic.
> Robert's patch makes the situation deterministic so in that sense its as
> correct as the various other determinism patches.
>
> The issue is that in some builds, you relied on x11-native not being
> built and this is now showing up as an issue. What can be done is to
> make the libxext dependency conditional on x11 in DISTRO_FEATURES as
> we've done in other cases. It doesn't really make this invalid or a
> regression, just that like other determinism fixes, we've resolved this
> in a way means we need to rethink a few things.
>
> I'd strongly suggest people think about whether they do really want x11
> in "native" DISTRO_FEATURES since in reality, I suspect most people do.
>
> So I'll take a patch making the dependency conditional but I don't
> believe its what most people actually want.

I agree with most your arguments but this /is/ a regression. It worked
fine few days ago and now fails so it is a regression.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

