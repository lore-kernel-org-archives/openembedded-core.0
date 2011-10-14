Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1REg85-0005oZ-FD for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:40:45 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBfefd010477 for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:41:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V58adS3S+R4T
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:41:40 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9EBfavh010473
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 12:41:38 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 14 Oct 2011 12:34:53 +0100
In-Reply-To: <1318430990.23801.176.camel@ted>
References: <1318279539.23801.68.camel@ted> <1318332940.23801.90.camel@ted>
	<4E95A6E5.6090402@windriver.com> <1318430990.23801.176.camel@ted>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318592102.942.1.camel@ted>
Mime-Version: 1.0
Subject: Re: Some further build dependency timings
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
X-List-Received-Date: Fri, 14 Oct 2011 11:40:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-10-12 at 15:49 +0100, Richard Purdie wrote:
> On Wed, 2011-10-12 at 09:40 -0500, Mark Hatle wrote:
> > It would be interesting to determine first off, if there is anywhere pseudo
> > should be running that it currently isn't.  And second if this is simply due to
> > LD_PRELOAD time, or if enabling the jump table is the culprit.
> > 
> > One potential optimization, when PSEUDO_DISABLE=1 is to only setup the jump
> > table entries for fork/exec items.
> 
> Agreed, I don't know where the time is being spent exactly at this
> point. I do know we execute an absolute ton of exec/fork calls so
> removing any overhead from them will improve our speed though. This
> change means do_configure won't run with pseudo enabled for example
> which is a very exec heavy task. 

So we did some tests, I thought I'd share the results:

base build config:

real	38m12.356s
user	236m4.710s
sys	39m38.180s

adding in the psuedo patches but not enabling (effectively jitter
measurement):

real	38m13.034s
user	235m44.250s
sys	39m6.150s

enabling the lazy linking:

real	38m16.121s
user	236m1.300s
sys	39m45.860s

Enable PSEUDO_UNLOAD:

real	35m46.281s
user	233m56.750s
sys	37m51.400s

So the big win isn't the linking, its the unloading of pseudo when we
don't need it...

Cheers,

Richard



