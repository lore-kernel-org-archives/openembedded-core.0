Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 320BA607F9;
	Thu, 20 Jun 2013 09:39:53 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id pa12so4815796veb.25
	for <multiple recipients>; Thu, 20 Jun 2013 02:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=vRxb5Xg1h/fjp8wWDjRZZbdUJD6q+SyWsserbdU5UPY=;
	b=uriz3XeoAPXAJX6uKDq8dVDGebC+wbd39oTNaBNOfg3h+N2lBUe3AuJ0Qrbm3THcJk
	3TkW0PeNkEfLpA4y0HqyiFYafbE5pnwbu4EQkubaca7KmTYNJtZ2QHsnz2obfW1sx8fc
	1p1nlZQgBlWg1/is9aYDuGYgtK4TglLD92o+btqsbFTxvfzfZccJ0WpjBXFAw6HO69v5
	T7Lep7/rXguMsFLDhTpU6sg6KXAIN7y16qsXbIoDDqPHAJI+kZU3TkQYILG0HHeI1hQi
	A7p5kjvkzuQCZ7IemSCGhBK5kf7epJrPwyso2uetZolyiiEhTBeALEZXp0+1dbx/MElQ
	qDQQ==
X-Received: by 10.220.250.147 with SMTP id mo19mr2252453vcb.79.1371721194063; 
	Thu, 20 Jun 2013 02:39:54 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.195.201 with HTTP; Thu, 20 Jun 2013 02:39:13 -0700 (PDT)
In-Reply-To: <FB95243C-761D-4268-96A1-B0893DA616AF@gmail.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama>
	<CANyK_8fMj+=hDVMV+q7CJi7_G5HvztE+n_wcHDn0kTUB7dxFhA@mail.gmail.com>
	<FB95243C-761D-4268-96A1-B0893DA616AF@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 20 Jun 2013 10:39:13 +0100
X-Google-Sender-Auth: gXmiGr6lVrM2h9m3_8Q5_-bJU3g
Message-ID: <CANyK_8eXUptxF52CmcJftYZD+oht4gfkDfRsbY3gOnmTRwyzaQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Thu, 20 Jun 2013 09:39:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 20 June 2013 03:28, Khem Raj <raj.khem@gmail.com> wrote:
>
>> luajit is rather a strange error, HOST_CC can't find <sys/types.h> or
>> some other common headers.
>
> hmmm luajit does not fail here for beaglebone/qemuarm so not much I can help.
>

I'll throw a qemuarm build on today and see whether this is an issue
with my build host or not.

>>
>> mplayer2 is failing to find <mad.h>, this needs the same sort of fix I
>> made to vlc (http://git.openembedded.org/meta-openembedded/commit/?id=3d6369b7c39d78b0d424dbe5a97e736b694e3c48).
>>
>> Full logs, conf files, etc: http://www.paulbarker.me.uk/yocto/20130617_poky/
>>
>
> I think missing dependencies. Best is to turn this into PACKAGECONFIG
>

The dependencies are enabled if ENTERPRISE_DISTRO=0 but I'm building
with it set to 1. However mplayer2 is still looking for them, much
like vlc did.

I could remove the ENTERPRISE_DISTRO logic and replace it all with
PACKAGECONFIG options but it would lead to a "Nothing PROVIDES" error
if a PACKAGECONFIG option was set for a dependency which isn't built
when ENTERPRISE_DISTRO=1. The error message doesn't even mention
ENTERPRISE_DISTRO so it may be confusing for a user.

Perhaps I could write a python function to check the combination and
issue a better error if the combination is unbuildable. Is there any
way to get such a function to run during recipe parsing and be able to
produce output before the "Nothing PROVIDES" error?

Thanks,

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

