Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Pv7R2-0001uI-39 for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 13:15:15 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23CDhTm008380
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:13:43 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07751-10 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2011 12:13:39 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p23CDZjj008374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Mar 2011 12:13:35 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110303071506.GA419@jama.jama.net>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-5-git-send-email-raj.khem@gmail.com>
	<20110303071506.GA419@jama.jama.net>
Date: Thu, 03 Mar 2011 12:13:30 +0000
Message-ID: <1299154410.26736.12932.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv3 4/6] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Thu, 03 Mar 2011 12:15:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-03 at 08:15 +0100, Martin Jansa wrote:
> On Wed, Mar 02, 2011 at 10:52:45PM -0800, Khem Raj wrote:
> > * Now qemu can handle lower values we can chnage this sanity test
> >   to check of values if less than 65536
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/classes/sanity.bbclass |   10 ++++++----
> >  1 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> > index 13940f8..aae5028 100644
> > --- a/meta/classes/sanity.bbclass
> > +++ b/meta/classes/sanity.bbclass
> > @@ -170,10 +170,12 @@ def check_sanity(e):
> >          # This path is no longer user-readable in modern (very recent) Linux
> >          try:
> >              if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> > -                f = file("/proc/sys/vm/mmap_min_addr", "r")
> > -                if (f.read().strip() != "0"):
> > -                        messages = messages + "/proc/sys/vm/mmap_min_addr is not 0. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 0 in /etc/sysctl.conf.\n"
> > -                f.close()
> > +                f = open("/proc/sys/vm/mmap_min_addr", "r")
> > +                try:
> > +                    if (int(f.read().strip()) < 65536):
> > +                        messages = messages + "/proc/sys/vm/mmap_min_addr is not >= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n"
> > +                finally:
> > +                    f.close()
> >          except:
> >              pass
> >  
> 
> corner cases when it cannot be read are with kernel between
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=0e1a6ef2dea88101b056b6d9984f3325c5efced3
> 2.6.33-rc2-0e1a6ef2dea88101b056b6d9984f3325c5efced3
> 
> and
> 
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=822cceec7248013821d655545ea45d1c6a9d15b3
> 2.6.34-rc3-822cceec7248013821d655545ea45d1c6a9d15b3
> 
> see:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02340.html
> 
> Don't know if any large distribution is using 2.6.34 without that 2nd
> patch backported.

My laptop at least is running a kernel where that file isn't
readable :/. It isn't a standard distro one though.

Cheers,

Richard




