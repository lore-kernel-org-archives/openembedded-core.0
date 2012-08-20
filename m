Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T3a8X-0000fJ-QJ
	for openembedded-core@openembedded.org; Tue, 21 Aug 2012 00:07:53 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KLtpZ3010717;
	Mon, 20 Aug 2012 22:55:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06930-06; Mon, 20 Aug 2012 22:55:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7KLth2r010711
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 20 Aug 2012 22:55:44 +0100
Message-ID: <1345499743.3907.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andy Ross <andy.ross@windriver.com>
Date: Mon, 20 Aug 2012 22:55:43 +0100
In-Reply-To: <50326CE8.6090206@windriver.com>
References: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-2-git-send-email-andy.ross@windriver.com>
	<1345218791-28891-3-git-send-email-andy.ross@windriver.com>
	<1345370811.27428.86.camel@ted> <50326CE8.6090206@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 2/2] libtool: normalize link paths before considering for RPATH
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
X-List-Received-Date: Mon, 20 Aug 2012 22:07:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-20 at 09:59 -0700, Andy Ross wrote:
> On 08/19/2012 03:06 AM, Richard Purdie wrote:
> > On Fri, 2012-08-17 at 08:53 -0700, Andy Ross wrote:
> >> ++                libdir_norm=`echo $libdir \
> >> ++                  | sed 's/\/\+\.\(\/\+\|$\)/\//g' \
> >> ++                  | sed 's/[^\/]\+\/\+\.\.\(\/\+\|$\)//g' \
> >> ++                  | sed 's/\/\+/\//g' \
> >> ++                  | sed 's/\(.\)\/$/\1/g'`
> >
> > Can't we use func_norm_abspath here?
> 
> I have to admit I got a little confused reading that code (not that my
> sed mess is significantly better, but at least I trust it because I
> wrote it); but it looks to me like it's an abspath implementation on
> the host filesystem (not the use of `pwd` in a few places).  That will
> work for pruning in this case, since the problem case is already an
> absolute path to a host directory.  But I don't see how it won't in
> principle break things by expanding host paths.

As I read it, it will only use pwd if the path is relative or empty. I
can't think of a case where you'd encode something like that into an
rpath...

Libtool can't expect the directory to exist on the filesystem when it
makes these calls so we should be safe from that perspective.

Cheers,

Richard



