Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RWDQf-0005Mh-LJ for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 21:40:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1KXiCD019963
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 20:33:44 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19009-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 20:33:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1KXZ8V019957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 20:33:36 GMT
Message-ID: <1322771625.17484.149.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 20:33:45 +0000
In-Reply-To: <20111201130733.GF19917@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Thu, 01 Dec 2011 20:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 14:07 +0100, Martin Jansa wrote:
> On Thu, Dec 01, 2011 at 10:59:03AM -0200, Otavio Salvador wrote:
> > On Thu, Dec 1, 2011 at 10:37, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > > On Thu, 2011-12-01 at 13:24 +0100, Martin Jansa wrote:
> > > > A while back I've proposed to make .bbappend without corresponding .bb
> > > > only big fat warning, but not fatal to parse. Now you cannot even build
> > > > eglibc if there is libdrm bbappend you don't care at all about..
> > >
> > > You can do this by setting:
> > >
> > > BB_DANGLINGAPPENDS_WARNONLY
> > >
> > 
> > This is even worse; you end up with a package without the changes done on
> > the bbappend and as most bbappend files do not change PR, adding it later
> > won't force a package update.
> 
> If we find a way to allow PRINC in multiple bbappends for same .bb then
> we can say that every .bbappend should use PRINC.
> 
> For record I'll include my discussion about PRINC with RP and kergoth:
> 10:47 < JaMa> RP__: is there any way to improve PRINC concept to allow multiple increments for same recipe while parsing multiple layers?
> 10:48 < RP__> JaMa: PRINC_append = ".1" ?
> 10:49 < JaMa> RP__: ie when meta-openmoko sets PRINC = "1" and meta-shr sets PRINC = "2" then if you're unlucky meta-openmoko is parsed later and bumping PRINC in meta-shr won't help
> 10:49 < RP__> JaMa: I wonder if you could do PRINC := "${PRINC + 1}"
> 10:50 < JaMa> and do we have default PRINC = 0 somewhere?
> 10:50 < RP__> JaMa: you might need to add that
> 10:50 < JaMa> ok, I'll try this, thanks
> 10:51 < JaMa> currently I'm moving PRINC only to meta-shr layer.. but that breaks stuff if someone is using any BSP layer from meta-smartphone..
> 
> 14:53 < JaMa> RP__: btw that PRINC trick didn't work (int type didn't like expresion :/)
> 15:13 < RP__> JaMa: ah, try PRINC := "${int(PRINC) + 1}"
> 15:21 < JaMa> RP__: still ValueError: invalid literal for int() with base 10: '${int(PRINC) + 1}'
> 15:21 < JaMa> with added PRINC := 0 to bitbake.conf
> 15:22 < RP__> PRINC := "${int(d.getVar(PRINC)) + 1}" ? :/
> 15:22 < JaMa> whole log http://paste.pocoo.org/show/514437/
> 15:22  * RP__ was trying to be too clever I suspect
> 15:23 < JaMa> ValueError: invalid literal for int() with base 10: '${int(d.getVar(PRINC)) + 1}'
> 15:41 < kergoth> PRINC is unquoted there, so it tries to get a value for a key of None
> 16:24 < RP__> kergoth: right, trying to do too many things at once :/
> 16:24 < RP__> kergoth: any thoughts on that knotty change to add the footer?
> 17:05 < JaMa> kergoth: something like this? ValueError: invalid literal for int() with base 10: "${int(d.getVar('PRINC')) + 1}"
> 
> Maybe someone else has better idea?

Looking at that I was missing something obvious. Try:

PRINC := "${@int(PRINC) + 1}"

Cheers,

Richard



