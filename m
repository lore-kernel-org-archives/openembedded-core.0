Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jason.wessel@windriver.com>) id 1UCddG-0001FG-9n
	for Openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 23:13:28 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r24Luogf003281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 4 Mar 2013 13:56:51 -0800 (PST)
Received: from [172.25.32.35] (172.25.32.35) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 4 Mar 2013 13:56:48 -0800
Message-ID: <5135189F.5070203@windriver.com>
Date: Mon, 4 Mar 2013 15:56:47 -0600
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <Openembedded-core@lists.openembedded.org>
References: <1362432115-43230-1-git-send-email-jason.wessel@windriver.com>
In-Reply-To: <1362432115-43230-1-git-send-email-jason.wessel@windriver.com>
X-Enigmail-Version: 1.5.1
Subject: Re: [PATCH] ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Mar 2013 22:13:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 03/04/2013 03:21 PM, Jason Wessel wrote:
> Previously there was a change to the ncurses compile to make it more
> like the typical way it was compiled on a host system.  This fixed a
> whole class of host machines, but masked the real underlying problem
> with the display corruption issues and menuconfig.
>
> The corner case that led to the discovery that the wrong curses.h file
> was getting used was when there was no curses libraries at all on one
> of the development hosts.  What had happened before was that
> /usr/include/curses.h on the host system had to match closely enough
> to the curses.h in the sysroot and then linking against the sysroot
> version of curses.so was ok (meaning no display corruption).  But on
> some systems with ncurses.h vs curses.h such as SuSE hosts, there were
> still issues.
>
> If we fix the root of the problem and force the mconf and lxdialog to
> use the correct headers and libraries from the sysroot there is no
> further issues and the menuconfig target works properly.  It also
> means we can back out the custom compilation flags to the ncurses
> recipe because they are no longer needed.
>
> For the kernel part of the menuconfig / nconfig changes it will be
> merged separately and this is all based on:
>
> https://lkml.org/lkml/2013/3/3/103

Probably best to hold off merging this until we see if the kernel patch is accepted upstream.  This is more of an RFC and to raise further awareness of the problem and the fact that we have a solution now that the root cause is well understood on the menuconfig corruption.

Cheers,
Jason.


