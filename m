Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2D6A873B43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:13:02 +0000 (UTC)
Received: by yhoa41 with SMTP id a41so7388524yho.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 01:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Sdvtim3Zhtd+Jqlv88gpsftBF1EfZbzmwv+3eTaDUV8=;
	b=dAzhcIK+igcDxDyK/0OOHCsJDimxW6zfhbrwn5CXLxi8PG6a+2CRwVL4Wrcwy49cQL
	ZsuqtuE1PKrLN+Dh2dj3X1jATp3hjdXQFsOO5pRd+x6slUEhHlScaWro+vC9mgrmTRYR
	McMCkoA4ceJP5jGBg/2a6hT3QVux4zxzRHZ/k3lmRDO9AdqePRmbLF2yOksllmJ1HLEn
	k3G4+TiIo2Gicu5ejLETssrprmtgvhMNhQ6e++gD8uOUCvcML1AV7cIorkbu/81wSapZ
	EK2MUQXF0A9hmS1aGWIXc64rcN/VFgp4bPHXcBU9twx03Lt6JdLSGEoasz/Uq8lL1WQd
	Gm7A==
MIME-Version: 1.0
X-Received: by 10.236.229.200 with SMTP id h68mr41351458yhq.90.1426147983351; 
	Thu, 12 Mar 2015 01:13:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.112.71 with HTTP; Thu, 12 Mar 2015 01:13:03 -0700 (PDT)
In-Reply-To: <1426147451.9114.82.camel@linuxfoundation.org>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
	<CAP9ODKqBs7sqNMrTESE_fiNfnRO3jLYTDoUkE4twwgczSU=L2g@mail.gmail.com>
	<1426147451.9114.82.camel@linuxfoundation.org>
Date: Thu, 12 Mar 2015 05:13:03 -0300
X-Google-Sender-Auth: bp9xOMzbzNycOsbcwh2Jo7a_joQ
Message-ID: <CAP9ODKq85dFgfZ3pmvFGuyszRHiuLjKp7ojyZJZJn_fwR9vTDA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: Instruct the journal to always be volatile
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
X-List-Received-Date: Thu, 12 Mar 2015 08:13:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 12, 2015 at 5:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2015-03-12 at 04:18 -0300, Otavio Salvador wrote:
>> On Thu, Mar 12, 2015 at 12:09 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com> wrote:
>> >>
>> >> When the storage mode for the journal is "auto" if /var/log/journal
>> >> exists then the journal will flush to /var/log/journal assuming that
>> >> /var/log/journal is persistent.
>> >>
>> >> However /var/log -> /var/volatile/log in poky, so even though
>> >> /var/log/journal exists, it is still volatile.
>> >>
>> >> Since this can cause ordering issues due to /var/volatile needing to be mounted before the journal actually writes to it, just specify that the journal
>> >> should always be volatile and never try to write to "persistent"
>> >> storage. The journal will exist in /run/log/journal only.
>> >>
>> >> This also disables the "After" of the journal on var-volatile.mount
>> >> since the ordering is no longer necessary when the journal is only
>> >> stored in /run/log/journal.
>> >>
>> >> [Yocto #7388]
>> >
>> >
>> > This is not right. What if I want persistent logs.? the options is just gone. Both cases should work. /var/volatile should only be used
>> > when doing ro-rfs its not FHS specified anyway. Lets not go with this patch.
>>
>> Agreed.
>
> This isn't quite so simple as "agreed". Are we saying that we want to
> rework volatiles handling after feature freeze?
>
> My view on this is that yes, we do need to do something about it, but
> right now during stabilisation is not the right time. Particularly when
> the patches proposed aren't even tested with sysvinit.
>
> So I'm interested in patches which make things work better without
> making fundamental changes now. We can look at changing volatiles with a
> properly thought out plan in the next development cycle.
>
> Making the systemd configuration match the rest of the default system
> setup would seem to be sensible. We should make it possible for others
> to override that if their setup isn't volatile.

I am saying we should then test the patch (from Khem) and see if it is
valid for merge. Khem being quite active contributor I am sure will be
willing to help to fix any issue for merging (and regression, if any).
I think having the volatile support working is very important and as
we are not releasing tomorrow ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

