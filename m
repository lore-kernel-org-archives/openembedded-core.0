Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLwnK-0000h0-Lv for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 13:53:55 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3Cl9dO027690
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 12:47:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27251-04 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2011 12:47:06 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA3Cl2VI027684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2011 12:47:03 GMT
Message-ID: <1320324422.20107.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 Nov 2011 12:47:02 +0000
In-Reply-To: <4EB1F3E9.8070103@windriver.com>
References: <cover.1320268188.git.mark.hatle@windriver.com>
	<20111102212240.GG9949@jama.jama.net> <4EB1B89E.8080505@windriver.com>
	<20111102221116.GH9949@jama.jama.net> <4EB1C4DF.8070007@windriver.com>
	<20111102224704.GI9949@jama.jama.net> <4EB1F3E9.8070103@windriver.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Thu, 03 Nov 2011 12:53:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-11-02 at 20:52 -0500, Mark Hatle wrote:
> On 11/2/11 5:47 PM, Martin Jansa wrote:
> > On Wed, Nov 02, 2011 at 05:31:59PM -0500, Mark Hatle wrote:
> >> On 11/2/11 5:11 PM, Martin Jansa wrote:
> >>> On Wed, Nov 02, 2011 at 04:39:42PM -0500, Mark Hatle wrote:
> >>>>> with pseudo.log full of errors like this
> >>>>> pseudo: path mismatch [12 links]: ino 39721500 db
> >>>>> '/OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/usr/share/vim/vim72/tutor'
> >>>>> req
> >>>>> '/OE/shr-core/tmp/work/om_gta02-oe-linux-gnueabi/task-shr-feed-1.0-r96'.
> >>>>
> >>>> Are you building on a NFS filesystem?  NFS (and a few other filesystems) have a
> >>>> habit of remapping inodes out from under the filesystem.  pseudo uses the inodes
> >>>> as a validation that the file hasn't changed.  If these inodes are changing,
> >>>> pseudo will do it's best to keep things in sync, but there is a chance it won't
> >>>> always succeed.
> >>>
> >>> No I'm building on local ext3 filesystem, but I'm also using rm_work, so 
> >>> /OE/shr-core/tmp/work/armv4t-oe-linux-gnueabi/vim-7.2.446-r10.3/image/usr/share/vim/vim72/tutor
> >>> is probably long gone and inode 39721500 wasn't marked as unused in
> >>> pseudo world or do I read it wrong?
> >>
> >> If you use rm_work, then the pseudo DB located within the work directory will
> >> also be removed.  So I'm not sure why you would be having such a large DB.
> > 
> > But I was talking about pseudo db here:
> > tmp/sysroots/x86_64-linux/var/pseudo/
> 
> I just checked my system and the logs in the sysroot isn't very large.  I'm
> curious as to why things are as big on your system.

We did have a problem a while back where pseudo was active when it
shouldn't have been and I noticed huge db/logs on my system too. The
environment changes that were pushed shortly before 1.1 fixed that
problem as far as I know but if this is an old build directory, it could
have those left behind.

This actually accounted for the significant load time bitbake had on one
of my systems too - it was spending the time loading the pseudo db.

Cheers,

Richard



