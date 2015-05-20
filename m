Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7909D601E3;
	Wed, 20 May 2015 12:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KCBUtL005518; Wed, 20 May 2015 13:11:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kXq95ZTWdJrG; Wed, 20 May 2015 13:11:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4KCBHaC005497
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 May 2015 13:11:29 +0100
Message-ID: <1432123877.28910.59.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 20 May 2015 13:11:17 +0100
In-Reply-To: <CAP9ODKo2hE6PtjnOZtgYJP7=OiF8ZEr0Hi0YDZoBrXVwVq7gtw@mail.gmail.com>
References: <1432044868-9170-1-git-send-email-ldnunes@ossystems.com.br>
	<1432069635.28910.43.camel@linuxfoundation.org>
	<CAP9ODKo2hE6PtjnOZtgYJP7=OiF8ZEr0Hi0YDZoBrXVwVq7gtw@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: bitbake-devel-request@lists.openembedded.org,
	Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cooker: release lockfile on process exit
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
X-List-Received-Date: Wed, 20 May 2015 12:11:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-19 at 18:24 -0300, Otavio Salvador wrote:
> On Tue, May 19, 2015 at 6:07 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > So having thought more about this, my proposal is actually that rather
> > than fix this and cause all kinds of other potential problems, we just
> > make memory resident bitbake the default which is something we'd like to
> > ideally do in the 1.9 timeframe anyway.
> 
> I understand your background ideas here however the non-deterministic
> lock release is driving us crazy at the autobuilder management. The
> sstate cleanup script, workdir cleanup script and in-house scripts all
> need to be teach to deal with this and this is far from optimal.
> 
> Would be acceptable for you a command line option to 'wait' it to
> release the lock before exit? This could be done easily and we avoid
> side effects. This also provide a solution which is isolated enough to
> be safely backported for previous releases and provide more
> deterministic script output.
> 
> How does it sounds?

I don't know how you'd implement this safely. I did give this some
further thought last night and concluded that if we want to backport
something, the safest approach might be to change the lock acquisition
code.

Basically, if we can't obtain the lock, sleep for one second and try
again. If on the second try we can't obtain the lock, error/exit.

If we need a longer delay than one second, we need to figure out what is
exiting that slowly and fix that instead.

Seems reasonable?

Cheers,

Richard





