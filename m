Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsC80-0000hz-I8 for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 14:16:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KC4riV011990
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:04:53 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:04:49 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KC4k3x011984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 13:04:47 +0100
Message-ID: <1342785890.21788.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 13:04:50 +0100
In-Reply-To: <ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net> <1342782398.21788.7.camel@ted>
	<ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 12:16:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 13:53 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > Encrico: Which DISTRO are you using and do you use rm_work*.bbclass?
> 
> yes; rm_old_work seems to cause the problem.  Task uses ${PN} and was
> declared with
> 
>   addtask rm_old_work before do_unpack
> 
> which causes different base hashes.
> 
> 
> Is there a way to exclude such tasks from the signature handling?

The easiest option is probably something like:

do_rm_old_works[vardepexclude] = "PN"

but this will trigger rebuilds depending on whether rm_work_old is
turned on or off.

The more advanced way to fix this would be in:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/lib/oe/sstatesig.py

probably something like:

if dep.endswith("do_rm_old_works"):
    return False

before the first check.

Cheers,

Richard



