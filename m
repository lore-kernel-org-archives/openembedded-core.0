Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJ97P-0002By-IB for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 22:31:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92KI4Dk020396;
	Tue, 2 Oct 2012 21:18:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19437-07; Tue,  2 Oct 2012 21:18:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q92KHtDV020362
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 2 Oct 2012 21:17:56 +0100
Message-ID: <1349209077.18301.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 02 Oct 2012 21:17:57 +0100
In-Reply-To: <506B224B.3090509@windriver.com>
References: <1349136658.15753.126.camel@ted> <506B224B.3090509@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes: Update to use corrected bb.utils.explode_dep_versions2 API
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
X-List-Received-Date: Tue, 02 Oct 2012 20:31:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-10-02 at 12:20 -0500, Mark Hatle wrote:
> On 10/1/12 7:10 PM, Richard Purdie wrote:
> > The bb.utils.explode_dep_versions function has issues where dependency information
> > can be lost. The API doesn't support maintaining the correct information so this
> > changes to use a new function which correctly handles the data.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> > diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.bbclass
> > index dc32c81..0f49936 100644
> > --- a/meta/classes/libc-common.bbclass
> > +++ b/meta/classes/libc-common.bbclass
> > @@ -29,14 +29,7 @@ python populate_packages_prepend () {
> >           d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
> >           d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
> >           # For backward compatibility with old -dbg package
> > -
> > -        def add_dep(var, dep):
> > -            deps = bb.utils.explode_dep_versions(d.getVar(var + '_' + bpn, True) or "")
> > -            if not dep in deps:
> > -                deps[dep] = ""
> > -                d.setVar(var + '_' + bpn, bb.utils.join_deps(deps, commasep=False))
> > -
> > -        add_dep('RPROVIDES', 'libc-dbg')
> > -        add_dep('RCONFLICTS', 'libc-dbg')
> > -        add_dep('RREPLACES', 'libc-dbg')
> > +        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
> > +        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
> > +        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
> >   }
> 
> The above is almost the same as the original code.  The problem with appendVar 
> is that then you get duplicate entries.  With the new code, I know we won't get 
> exceptions, but do we really want the duplicates?
> 
> Everything else looks good.

Its not really an error to have duplicates in the field. I'm fine with
avoiding it where it makes sense but I don't like adding too much
runtime cost or complexity.

In the above case it will get filtered out later anyway so I'm not
really bothered by it and prefer the simpler syntax.

Cheers,

Richard



