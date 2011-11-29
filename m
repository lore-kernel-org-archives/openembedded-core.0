Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVPKK-0007F1-PH for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 16:10:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATF3omq014700;
	Tue, 29 Nov 2011 15:03:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14023-08; Tue, 29 Nov 2011 15:03:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pATF3eGk014694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 29 Nov 2011 15:03:42 GMT
Message-ID: <1322579029.7964.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 15:03:49 +0000
In-Reply-To: <4ED0CC76.4040606@emagii.com>
References: <4ED0CC76.4040606@emagii.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: "Garman, Scott A" <scott.a.garman@intel.com>
Subject: Re: Feedback on building openembedded-core for qemuarm. Excerpts from buildlog
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
X-List-Received-Date: Tue, 29 Nov 2011 15:10:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-11-26 at 12:24 +0100, Ulf Samuelsson wrote:
> Downloaded the latest, and tried building console-image for qemuarm.
> Host = Ubuntu 11.04 i686.
> 
> Looked through the build log, and thought I'd share it with the list.

Thanks for doing this, its valuable feedback.

> A number of warnings (see below)

We're trying to work through addressing those. Some of them are from
versions in meta-oe where there is a fix for the error in OECore (such
as the libgcc linker hash style).

> Seen a couple of errors as well.
> 
> 1.    ERROR: Function 'useradd_sysroot' failed
>          Tried to access "/etc/group" but this was locked.
>          Problem disappeared the next time I rebuilt.

Can you file a bug about this problem please. I think we need to go
through the code paths in shadow and ensure its locking is sane. I took
a quick look at the code and was left wondering what lckpwdf() does for
example. Scott, could you take a look at this?

> 2.    "ftp://elsie.nci.nih.gov/pub/tzcode2011i.tar.gz" is no longer 
> available.
>          tzdata , same problem.
>          The recipe is located in two places.
>          meta-openembedded/meta-oe/recipes-extended/tz*/tz*.bb have the 
> problem
>          This is what the build uses.

This is something to raise with the meta-oe maintainers. I think there
isn't a problem in OECore.

> 3.    When I ran into this problem, I exited with ctrl-C.
>          This left some recipes in the middle of a fetch ,and the build 
> could not continue.
>          I had to "bitbake -c clean <package>" on all problematic 
> packages to recover.
>          Seems a little bit fragile to me.

Yes, this isn't good. Could you file a bug report on this please?

> 4.     linux-3.0 recipe in meta-ti does not build (On Ubuntu 11.10 x64).
>          Fails in the fetch stage.
>          I removed the layer, since it was not needed for qemuarm.

Makes sense and its something raise with the meta-ti layer maintainers
which I think I've seen elsewhere.

> 5.    When compiling on a Ubuntu 11.10 x64 host  (linux 3.x host)
>          tiff won't build.
>          Did:
>              bitbake console-image"
>              bitbake -c clean tiff
>              bitbake  tiff
>          - No luck
>          Reading through the mailing list, I found someone which deleted
>          $TMPDIR and then
>              bitbake tiff
>              bitbake console-image
>          That worked for me as well once, second time, same problem.
>          Problem is that #include <iostream> fails.
> 
>          I noted that "iostream" is built and available in 
> <sysroot>/usr/include/c++
>          On the host, it is located in /usr/incolude/c++/<version>
>          "tiff" build seems to be OK with Ubuntu 11.04 i686.

I think these errors should be fixed by recent changes. If not I'd be
interested in the full console log please.

Cheers,

Richard




