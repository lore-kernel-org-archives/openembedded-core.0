Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QN2IH-0001JV-Lw for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 14:25:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCMcpS007804
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:22:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07427-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:22:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JCMUjx007798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 13:22:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
	<BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
	<1305804906.3424.480.camel@rex>
	<BANLkTinzLqz6ED+=WpT_wnXkta03OiC0Yw@mail.gmail.com>
Date: Thu, 19 May 2011 13:22:28 +0100
Message-ID: <1305807748.3424.515.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 12:25:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-19 at 14:02 +0200, Frans Meulenbroeks wrote:
> 2011/5/19 Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> > On Thu, 2011-05-19 at 13:01 +0200, Frans Meulenbroeks wrote:
> > > What should I do to either disable this for some recipes, or use a
> > > different (private) server?
> > > We do not wish to rely on an external server for proprietary recipes (or
> > for
> > > recipes for which we made a local change in an overlay).
> > > How is this case handled?
> >
> > This could be handled by doing things like setting:
> >
> > PRSERV_HOST_pn-myprivaterecipe = "somelocalhost"
> >
> > or
> >
> > PRSERV_HOST_pn-myprivaterecipe = ""
> >
> > to disable it.
> >
> > One thing we lack is a good way to apply changes like this, only if code
> > is within a given layer. Even in that case, it should be possible with
> > anonymous python to look at the location of the current .bb file and
> > then conditionally set these variables as appropriate to the right
> > server.
> >
> > Certainly this needs to be thought about and documented but I think
> > there are ways to do it.
> >
> > Pardon my ignorance, but I do not really understand the complete flow and
> way of working.
> 
> Anyway if I do something like:
>  PRSERV_HOST_pn-myprivaterecipe = ""
> would I still be able to use PR in my recipe (like I do today)?

Yes, since the PR server appends to this.

> Also we do have the issue that it is desired to be able to rebuild without
> network connectivity (e.g. while temporary offline while travelling). Would
> that still be possible?

You could use a local PR server. Obviously connecting to one central
server without any network connectivity isn't going to happen so we have
to be realistic about expectations.

To make a perfect rebuild the local PR server would need a dump of the
database on the central server. There isn't code for that at the moment
and I don't think its the highest priority task out there or the most
important use case but its certainly possible for someone to add.

> For layers, one solution could be to allow variable overriding on the
> overlay level. I can imagine there are more uses for that (and I understand
> this requires changes to the bitbake machinery).

There is certainly a use case for something like this. The exact
implementation and workings needs a lot more thought and discussion
though. I believe its at least already possible in anonymous python (and
if not, any extensions needed shouldn't be invasive by comparison).

Cheers,

Richard



