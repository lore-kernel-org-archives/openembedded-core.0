Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q7RX2-0006VB-Qy for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 14:08:21 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36C6B3t017538;
	Wed, 6 Apr 2011 13:06:11 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17361-03; Wed,  6 Apr 2011 13:06:07 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p36C5xFq017532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 6 Apr 2011 13:06:02 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Esben Haabendal <eha@dev.doredevelopment.dk>
In-Reply-To: <87y63n5028.fsf@eha.doredevelopment.dk>
References: <1302001365.24596.459.camel@rex>
	<87y63n5028.fsf@eha.doredevelopment.dk>
Date: Wed, 06 Apr 2011 05:05:54 -0700
Message-ID: <1302091554.22904.18.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: poky <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] Proposed Multilib Implementation Brainstorming
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
X-List-Received-Date: Wed, 06 Apr 2011 12:08:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 09:08 +0200, Esben Haabendal wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> 
> > One of the items on our post 1.0 schedule is multilib and we need a plan
> > of implementation. I've been thinking about this for a while and at
> > least have some ideas how some of the issues can be handled.
> > ....
> > Does this make sense to everyone, are there any questions/ objections/
> > concerns/ things I've missed?
> 
> Which actual OE use-cases justify this kind of addition to OE?

Several people wanting to use OECore have a requirement of multilib
support. The typical embedded use case is where you have one main
application which you might want to run in some kind of large memory
mode or with some special optimisation (think a database engine) whilst
the rest of the system is "standard". This requires the ability to mix
different libraries.

> I know it is on the Yocto post 1.0 schedule, but is it actually a good
> thing for OE?  Maintaining OE recipes is clearly not going to get any
> easier with multilibs support.

As detailed in the proposal you will see that the complexity added is
minimal. It requires a simple enhancement to BBCLASSEXTEND which is
likely desirable for other reasons too and that is the only real bitbake
change required. For the metadata, individual recipes remain unaffected
and also the core conf files are unchanged too. The toolchain dependency
changes will be the only change affecting users at the recipe level and
most of the class/machine configuration will be opt in by anyone using
multilib. The only other invasive change is the package manager
integration. For rpm, it has good support for multilib already and we're
just enabling that. For opkg, we still need to determine the best
approach but the simplistic approach I mentioned will probably suffice
and anyone wanting true support at the package manager level can use
rpm.

For day to day recipe maintenance I don't see much direct impact.

Cheers,

Richard





