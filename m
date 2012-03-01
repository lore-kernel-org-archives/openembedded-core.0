Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S38JV-0001XW-1C for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 16:53:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21FiZe3018365
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 15:44:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17710-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2012 15:44:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q21FiSir018359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Mar 2012 15:44:29 GMT
Message-ID: <1330616672.31767.23.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Mar 2012 15:44:32 +0000
In-Reply-To: <4F4F9552.8040107@mlbassoc.com>
References: <1330612994-26329-1-git-send-email-gary@mlbassoc.com>
	<1330613948.31767.12.camel@ted> <4F4F918B.4010404@mlbassoc.com>
	<4F4F9552.8040107@mlbassoc.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] initscripts: Properly handle new timestamp format
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
X-List-Received-Date: Thu, 01 Mar 2012 15:53:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-01 at 08:27 -0700, Gary Thomas wrote:
> On 2012-03-01 08:11, Gary Thomas wrote:
> > On 2012-03-01 07:59, Richard Purdie wrote:
> >> On Thu, 2012-03-01 at 07:43 -0700, Gary Thomas wrote:
> >>> Recent changes have attempted to make consistant use of /etc/timestamp
> >>> In particular
> >>> 5aab665 initscripts: Make /etc/timestamp consistent again.
> >>> 173a48f image.bbclass: Ensure timestamp matches format used in initscripts after recent changes
> >>>
> >>> This new format can cause problems as the value is too large for
> >>> most [32 bit] machines. Work around this by only comparing the
> >>> YYYYMMDD portion (which does fit in 32 bits). Also, the new format
> >>> is not directly compatible with the 'date' command line, so it
> >>> must be reformatted for use.
> >>>
> >>> Signed-off-by: Gary Thomas<gary@mlbassoc.com>
> >>> ---
> >>> .../initscripts/initscripts-1.0/bootmisc.sh | 4 ++--
> >>> 1 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> I merged the changes to busybox in relation to this. Is this patch still
> >> needed?
> >
> > Let me check - I didn't see the related busybox change.
> >
> 
> I missed the busybox change because there was no PR bump :-(
> 
> The problem with the change turning off CONFIG_FEATURE_DATE_COMPAT is that
> now 'date' from busybox works one way and 'date' from coreutils works another.
> 
> Using coreutils:
> 
> root@cobra8148p81:~# date 201203011520
> date: invalid date `201203011520'
> root@cobra8148p81:~# date 030115202012
> Thu Mar  1 15:20:00 UTC 2012
> root@cobra8148p81:~# ls -l /bin/date
> lrwxrwxrwx 1 root root 14 Mar  1 15:14 /bin/date -> date.coreutils
> 
> Using busybox:
> 
> root@cobra8148p81:~# ln -s /bin/busybox /tmp/date
> root@cobra8148p81:~# /tmp/date 201203011520
> Thu Mar  1 15:20:00 UTC 2012
> 
> I think the best thing would be to turn CONFIG_FEATURE_DATE_COMPAT back
> on along with my reformatting change.
> 
> I can make an updated patch if you agree.

Is this going to cause us a problem in real world usage? I'd hope in the
general case we use standard formatting?

I have to admit I'm getting more than a little frustrated with what
seems like a continual set of changes bouncing this format around in
different directions :(.

Cheers,

Richard







