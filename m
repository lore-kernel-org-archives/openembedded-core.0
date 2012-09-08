Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TAFx4-0007tM-Cj
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Sep 2012 09:59:38 +0200
Received: by pbcwy7 with SMTP id wy7so730308pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Sep 2012 00:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=p2ld5inVWkbgX2PZDMnTNoK3u2qNjS+UG1iLcEf/RoY=;
	b=dWLaI2ntTC4IX2O3kxD0XUDO2MBaH5c5sl+H6ex4PtxOSbm3dsbv7EFYJCpe9SPv+0
	Fegk7ytZz+1inehhfhmtgpLWUbujYAztQ1bc9D91dZVSm/pAhxZmL8h2sTwnLY2mXgZJ
	goVFRcDGqe63KpSgI0NL2KKh/IvBxBJXha4nBEUPK0Npz3mBp70AcOzt4n723NZBFJ9s
	7pAR21+aAkfjts6Wal5GRHOcv86MKTgbbvqKTu1j1eFYu81TaEKAYRUVZBlpegwHKtqJ
	P8dffqE3VPftzxXs70eG5IE3LNN53JXVxkPRxq6SAvjVbtQ6jiS+gwjgDEDmEHWQIeZM
	IbSg==
Received: by 10.68.203.228 with SMTP id kt4mr1999209pbc.87.1347090430752;
	Sat, 08 Sep 2012 00:47:10 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id gt2sm4735401pbc.62.2012.09.08.00.47.09
	(version=SSLv3 cipher=OTHER); Sat, 08 Sep 2012 00:47:09 -0700 (PDT)
Date: Sat, 8 Sep 2012 00:46:32 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Brandon Stafford <brandon@rascalmicro.com>
Message-ID: <20120908074629.GB3903@sakrah.homelinux.org>
Mail-Followup-To: Brandon Stafford <brandon@rascalmicro.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CA+b4E8xjg7ZWy3pMoGY_HRYpTCwhS95_c+o0ZL_JG58dU0iMdw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+b4E8xjg7ZWy3pMoGY_HRYpTCwhS95_c+o0ZL_JG58dU0iMdw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Trying to compile Scipy, but stuck on native cc and ld
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
X-List-Received-Date: Sat, 08 Sep 2012 07:59:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (06/09/12 12:36), Brandon Stafford wrote:
> Hi all,
> 
> I'm working on a recipe for Scipy, which is a Python library for
> scientific computation. It contains chunks of code in C and Fortran.
> 
> I have seen this recent message from Phil Blundell (about an entirely
> different recipe) that suggests that the problem may be the use of the
> host's cc and ld, rather than the correct ARM cross-compilers:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg27120.html
> 
> This looks like the problem to me, but I'm not sure how to tell the
> Python build script that it should be cross-compiling. Based on Phil's
> message, I'd expect it involves setting ${CC} and ${LD} and somehow
> passing them to Python, but I'm not sure how.
> 
> Full error message: http://pastebin.com/pMvaLpcz
> Recipe in broken state: http://pastebin.com/a5jm45vB
> 
> (The line export LDFLAGS = "-L${STAGING_LIBDIR}" is just there because
> another mailing list suggestion:
> http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24196.html.
> It does not appear to affect the errors produced.)
> 
> Any suggestions?

FIrst you need fortran language frontends and support libraries
compiled with gcc cross compiler. By default we only build c/c++

the you need to take a look at scipy build system and see how
its deriving its CC and LD variables and then override them with
CC LD that recipe gets from environment when building

> 
> Brandon
> 
> --
> Brandon Stafford
> Rascal Micro: small computers for art and science
> Somerville, MA, USA
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


