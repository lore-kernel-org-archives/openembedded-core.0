Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SASye-00025h-66 for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 22:21:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LLCs8I006163;
	Wed, 21 Mar 2012 21:12:54 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06055-02; Wed, 21 Mar 2012 21:12:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2LLCkAk006157
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 21 Mar 2012 21:12:47 GMT
Message-ID: <1332364369.9740.185.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 21:12:49 +0000
In-Reply-To: <CAEsOVNcy6kwQQ0oank6gO4yOSuUM6NNG0fYk752sQvYWy+9GDA@mail.gmail.com>
References: <1332326683.9740.136.camel@ted>
	<CAEsOVNcy6kwQQ0oank6gO4yOSuUM6NNG0fYk752sQvYWy+9GDA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf/sstate.bbclass: Change PATH when installing sstate files to avoid issues
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
X-List-Received-Date: Wed, 21 Mar 2012 21:21:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-03-21 at 17:54 +0000, McClintock Matthew-B29882 wrote:
> On Wed, Mar 21, 2012 at 5:44 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > This resolves issues related to pigz-native when installing from sstate that people
> > have been seeing. It also gives us a way to solve issues like the gzip-native race
> > during sstate package creation covered in Yocto #1774.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 0d16d11..1570654 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -153,6 +153,12 @@ def sstate_installpkg(ss, d):
> >         bb.mkdirhier(dir)
> >         oe.path.remove(dir)
> >
> > +    # We're adding binaries into the sysroots, we don't want to execute them
> > +    # whilst they're half installed or being installed so we need to
> > +    # remove the sysroots from PATH
> > +    savedpath = d.getVar("PATH")
> > +    d.setVar("PATH", "${ORIGPATH}")
> > +
> >     sstateinst = d.expand("${WORKDIR}/sstate-install-%s/" % ss['name'])
> >     sstatepkg = d.getVar('SSTATE_PKG', True) + '_' + ss['name'] + ".tgz"
> >
> > @@ -190,6 +196,8 @@ def sstate_installpkg(ss, d):
> >         # conflict with another writer
> >         os.remove(fixmefn)
> >
> > +    d.setVar("PATH", savedpath)
> > +
> 
> So we always use the host tar and gzip here? Isn't there a reason we
> build tar-native explicitly? Could be fine if it's not needed for
> sstate-cache...

I had to hit the archives but:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=577dd4b3e5d4861c31824d920fa170ba3a585f63

so yes, there is a good reason we might want to use our tar and I just
broken our old versions of tar workaround :(. We did check that tar code
for races and its relatively safe. The gzip situation is of course not
so safe and we have the open bugs to prove it :(.

So I should probably revert this patch although I'm reluctant since I
can think of other ways we can break the sysroots which this patch very
neatly solves.

The only other option would be to explicitly allow tar through some
linking/PATH magic :/.

Cheers,

Richard





