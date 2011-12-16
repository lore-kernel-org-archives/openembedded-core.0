Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rbabl-0002nJ-Qp for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 17:26:05 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGJ3M5019796;
	Fri, 16 Dec 2011 16:19:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19538-06; Fri, 16 Dec 2011 16:18:58 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBGGIuhp019790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Dec 2011 16:18:57 GMT
Message-ID: <1324052337.4568.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2011 16:18:57 +0000
In-Reply-To: <33febd68cae9e482a7d35c230a0b875849e86669.1324015563.git.dvhart@linux.intel.com>
References: <cover.1324015563.git.dvhart@linux.intel.com>
	<33febd68cae9e482a7d35c230a0b875849e86669.1324015563.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/2] bootimg: Use mcopy to construct the hddimg
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
X-List-Received-Date: Fri, 16 Dec 2011 16:26:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-15 at 22:14 -0800, Darren Hart wrote:
> The initial directory support (-d) added to mkdosfs has proven to be incomplete
> and non-compliant with FAT. Rather than continue to maintain this feature and
> work around the various issues, we can use mcopy to construct the image.
> 
> bootimg.bbclass already depends on mtools-native (although it may not have
> needed to previously). No new dependencies are introduced. The image created
> passes dosfsck cleanly. Remove the call to dosfsck.
> 
> mcopy reported an error with the image we were creating:
> Total number of sectors (107574) not a multiple of sectors per track (32)!
> 
> Add some logic to ensure the total sector count is an integral number of sectors
> per track, including forcing the logical sector size to 512 in the mkdosfs
> command.
> 
> The du -bks arguments are contradictory, -b is equivalent to "--apparent-size
> --block-size=1" and -k is --block-size=1K. If reordered, -kbs will report the
> disk usage in bytes insteadk of 1k blocks. Eliminate the ambiguity by using:
> du --apparent-size -ks
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Nitin A. Kamble <nitin.a.kamble@intel.com>
> ---
>  meta/classes/bootimg.bbclass |   18 +++++++++++++-----
>  1 files changed, 13 insertions(+), 5 deletions(-)

Merged into master, thanks.

I'm going to hold off 2/2 to give other users a chance to migrate to
mcopy.

Cheers,

Richard



