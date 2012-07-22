Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsrwC-0003S5-65 for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 10:54:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8hRCT026831
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:43:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19951-07 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:43:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6M8hJF3026825
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 09:43:20 +0100
Message-ID: <1342946604.21788.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 09:43:24 +0100
In-Reply-To: <lyipdhp4ae.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20120720104117.GE3534@jama.jama.net> <1342782398.21788.7.camel@ted>
	<ly629i7inz.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyipdhp4ae.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
X-List-Received-Date: Sun, 22 Jul 2012 08:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-07-21 at 16:39 +0200, Enrico Scholz wrote:
> Enrico Scholz
> <enrico.scholz-wttK6gPy29v+Hn7q9Vec/7NAH6kLmebB@public.gmane.org>
> writes:
> 
> >> Encrico: Which DISTRO are you using and do you use rm_work*.bbclass?
> >
> > yes; rm_old_work seems to cause the problem. 
> 
> The signature stuff was one problem; there is another, more trivial (but
> probably more difficult) one:
> 
> Adding a task like
> 
> | addtask do_rm_old_work before do_unpack
> 
> causes stampfile dependencies for the shared gcc like
> 
> gcc.do_unpack ->  gcc-initial.do_rm_old_work
> gcc.do_unpack ->  gcc-intermediate.do_rm_old_work
> 
> E.g. the earlier 'do_rm_old_work' stamps are recipe dependent but the
> later 'do_unpack' are shared between recipes. Bitbake reexecutes do_unpack
> when the corresponding do_rm_old_work is newer which is causing the seen
> errors.

do_rm_old_work[stamp-base] = "${SS}"

in the gcc recipe would probably help that. Your alternative solution
obviously works too.

Cheers,

Richard



