Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDZTu-0001WS-Cw for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 12:54:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UAjtcm012335
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:45:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11886-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:45:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UAjmha012329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 11:45:49 +0100
Message-ID: <1333104347.18082.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 11:45:47 +0100
In-Reply-To: <CAGiJk9faGyjgRObDSGk5smQRy6to=U_0UDUuALpEgpZ9s7VFKA@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<CADkTA4MvYRmsLQogaQMHwUeP5y7ws5NvmXiBMgvsreiGNQrsJw@mail.gmail.com>
	<CAGiJk9deLrVFhtGF6pAvvWUgyo5kbAE77t9bnWciKtdtC4oD8g@mail.gmail.com>
	<1333099931.18082.52.camel@ted>
	<CAGiJk9faGyjgRObDSGk5smQRy6to=U_0UDUuALpEgpZ9s7VFKA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 10:54:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 12:07 +0200, Samuel Stirtzel wrote:
> Of course this will only reduce the time of recipes if they are build
> for the first time,
> or when the version/URL changes.
> It is not that important, I agree,
> but it would improve the situation for first time users, or new installations.
> 
> Example for 2 threads:
> http://pastebin.com/kviwQZJ3
> It is very likely that the current situation also uses cpu and network
> resources at the same time,
> but it might occur that the build-task has to wait for a download to
> finish or vice versa.
> 
> Ignoring fetch tasks from the thread count would only do half of the
> job and _could_ cause network bottlenecks ;)
> Fetching should be "independent" from the dependency chain.

This simply isn't true and there is also no benefit to splitting them to
be independent. The fetch tasks have dependencies just like any other
task (for example git:// urls depend on git-native being built unless
its in ASSUME_PROVIDED).

> E.g.: it should not wait with the downloads for dependencies to finish building,
> the download sequence should still match the dependency chain sequence.

I'm afraid I don't understand what you mean. I think you will find that
if you exclude the "fetch" tasks from the normal "cpu" thread count you
will get the behaviour you are describing.

Cheers,

Richard



