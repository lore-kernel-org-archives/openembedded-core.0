Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 980D86FB69
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 16:50:01 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5AGnuLl000549; Tue, 10 Jun 2014 17:49:57 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GqGkZR_beXYx; Tue, 10 Jun 2014 17:49:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5AGnrA2000542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 10 Jun 2014 17:49:55 +0100
Message-ID: <1402418984.12440.321.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Tue, 10 Jun 2014 17:49:44 +0100
In-Reply-To: <53973577.8080902@mlbassoc.com>
References: <1402417936.12440.317.camel@ted>
	<53973455.9050203@windriver.com> <53973577.8080902@mlbassoc.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] rpm: Fix cpio 32 bit overflow issues on 64 bit inode filesystems
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
X-List-Received-Date: Tue, 10 Jun 2014 16:50:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-10 at 10:42 -0600, Gary Thomas wrote:
> On 2014-06-10 10:37, Mark Hatle wrote:
> > On 6/10/14, 11:32 AM, Richard Purdie wrote:
> >> When building on XFS filesystems, the resulting rpms can be corrupted
> >> with the same inode number being used for multiple hardlinked files.
> >> There are two fixes, one to stop rpm crashing when accessing a broken
> >> binary rpm, the other to stop generating them in the first places. Full
> >> descriptions in the patch headers.
> >>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> diff --git a/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
> >> new file mode 100644
> >> index 0000000..d49de6f
> >> --- /dev/null
> >> +++ b/meta/recipes-devtools/rpm/rpm/rpm-hardlink-segfault-fix.patch
> >> @@ -0,0 +1,43 @@
> >> +We need to sanity check that the nlink size and our linksLeft counter
> >> +do match. If an rpm is badly constucted with identical inode values
> >
> > s/constucted/constructed
> >
> >> +for multiple hardlinked files, such an rpm will overwise access memory
> >
> > s/overwise/otherwise
> >
> >> +out of array bounds and cause memory corruption and crashes.
> >> +
> >> +The fix is to add in the sanity check and exit if bad circumstances
> >> +are found. We need to fix the caller to check the return code too.
> >> +
> >> +RP 10/6/1024
> >
> > 2014?
> 
> Perhaps even an ISO date (2014-06-10) since that's what's used everywhere
> else (and it's not October yet, at least not on this side of the pond)

I do try and use ISO dates in patches after a comment from you a while
back. On this occasion lets just say it wasn't the top thing on my mind
(nor was spelling, clearly :/).

I've been staring at debugging this issue for 48 hours and there is some
pressure on for getting it fixed and several things unblocked. I wasn't
feeling particularly well when I started and am not much better now so
let me just say thanks for the fixes and leave this there :)

Cheers,

Richard


