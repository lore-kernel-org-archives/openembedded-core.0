Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8HsN-0005Ku-0s for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 22:06:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FKvaQ0027078
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:57:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25404-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:57:29 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2FKvRLS027066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2012 20:57:28 GMT
Message-ID: <1331845047.18586.136.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2012 20:57:27 +0000
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F0426D8C3@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F0426D8C3@NAEMMAIL01.na.leapfrog.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Task after do_package repeating despite stamp
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
X-List-Received-Date: Thu, 15 Mar 2012 21:06:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-03-15 at 19:13 +0000, Daniel Lazzari wrote:
> >Date: Thu, 15 Mar 2012 08:19:54 +0000
> >From: Richard Purdie <richard.purdie@linuxfoundation.org>
> >Subject: Re: [OE-core] Task after do_package repeating despite stamp
> >To: Patches and discussions about the oe-core layer
> >	<openembedded-core@lists.openembedded.org>
> >Message-ID: <1331799594.18586.61.camel@ted>
> >Content-Type: text/plain; charset="UTF-8"
> >
> >On Thu, 2012-03-15 at 01:11 +0000, Daniel Lazzari wrote:
> >> Let me preface this by saying I'm running an older oe-core (Angstrom) so
> >this may be fixed in the latest, but if so, I'm hoping someone can point me at
> >the patch to fix it.
> >>
> >> I have a few recipes in our layer that need to generate proprietary packages
> >from ${D} after the do_package task has copied the files for its own devices.
> >To do this, I have a task like:
> >>
> >> do_create_foo() {
> >> 	#Generate foo package here
> >> 	foo_pkger ${D} ${DEPLOY_DIR}/foo/${MACHINE}
> >> }
> >> addtask create_foo after do_package before do_build
> >> do_create_foo[dirs] = "${DEPLOY_DIR}/foo/${MACHINE}"
> >>
> >> The problem is, when building any recipe that depends on this recipe,
> >> it reruns do_create_foo. This is especially problematic because we use
> >> rm_work, so often when it goes back to rerun do_create_foo, ${D} no
> >> longer exists. I checked and a stamp exists for the task.
> >>
> >> Anyone have any insight? Is anyone else seeing something like this?
> >
> >It looks like you're creating something machine specific since you're
> >placing it in ${MACHINE}. This effectively makes anything depending on
> >this task machine specific also.
> >
> >Cheers,
> >
> >Richard
> >
> 
> I finally found the answer to this in case anyone else runs into it.
> The rm_work class removes stamps if they are not in a case statement
> in that class. Once I added *do_create_foo* to the case statement, the
> stamp was left alone and everything is working again.

Ah, right. The other solution would be to cover this task with sstate,
see deploy.bbclass as an example.

Cheers,

Richard




