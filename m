Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1EE9673899
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2015 08:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2C84PkU000303; Thu, 12 Mar 2015 08:04:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dAD1Y_ADV9Kh; Thu, 12 Mar 2015 08:04:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2C84Bvt032749
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Mar 2015 08:04:22 GMT
Message-ID: <1426147451.9114.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 12 Mar 2015 08:04:11 +0000
In-Reply-To: <CAP9ODKqBs7sqNMrTESE_fiNfnRO3jLYTDoUkE4twwgczSU=L2g@mail.gmail.com>
References: <1426109339-12975-1-git-send-email-randy.e.witt@linux.intel.com>
	<13FDACD4-FC30-49CD-AC52-9D614F407C5D@gmail.com>
	<CAP9ODKqBs7sqNMrTESE_fiNfnRO3jLYTDoUkE4twwgczSU=L2g@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 12 Mar 2015 08:04:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-03-12 at 04:18 -0300, Otavio Salvador wrote:
> On Thu, Mar 12, 2015 at 12:09 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Mar 11, 2015, at 2:28 PM, Randy Witt <randy.e.witt@linux.intel.com> wrote:
> >>
> >> When the storage mode for the journal is "auto" if /var/log/journal
> >> exists then the journal will flush to /var/log/journal assuming that
> >> /var/log/journal is persistent.
> >>
> >> However /var/log -> /var/volatile/log in poky, so even though
> >> /var/log/journal exists, it is still volatile.
> >>
> >> Since this can cause ordering issues due to /var/volatile needing to be mounted before the journal actually writes to it, just specify that the journal
> >> should always be volatile and never try to write to "persistent"
> >> storage. The journal will exist in /run/log/journal only.
> >>
> >> This also disables the "After" of the journal on var-volatile.mount
> >> since the ordering is no longer necessary when the journal is only
> >> stored in /run/log/journal.
> >>
> >> [Yocto #7388]
> >
> >
> > This is not right. What if I want persistent logs.? the options is just gone. Both cases should work. /var/volatile should only be used
> > when doing ro-rfs its not FHS specified anyway. Lets not go with this patch.
> 
> Agreed.

This isn't quite so simple as "agreed". Are we saying that we want to
rework volatiles handling after feature freeze?

My view on this is that yes, we do need to do something about it, but
right now during stabilisation is not the right time. Particularly when
the patches proposed aren't even tested with sysvinit.

So I'm interested in patches which make things work better without
making fundamental changes now. We can look at changing volatiles with a
properly thought out plan in the next development cycle.

Making the systemd configuration match the rest of the default system
setup would seem to be sensible. We should make it possible for others
to override that if their setup isn't volatile.

Cheers,

Richard





