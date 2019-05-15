Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id DB3E1751D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 11:08:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 453sH93J4Tz60;
	Wed, 15 May 2019 13:08:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557918502;
	bh=MpVYT6OyNQKxewjv/8R7+9wy0jxTl0+fNv98OaDfdzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJiWbJNbpj5EChEyr9yvgoE3QGJTIKNM+ucemTpt7/xLoS8P5tAuQ1g6wINVB2741
	Hov3aaPjAJnR0YGUwxJJnYiXBATN0q7YoilUB5KbcvtauizM7LFQwFz+R9BYW4M0Mb
	zAMcBUUrPMOH1UATP/2j2/ycpmfBS8LHzdYh2PjIQ/e6h7Rxo3x3QxnKoXlKOJJyPH
	0cnf8D9b3OE80N+y9PLsAWtfU4B5nMv3r/5RqXR8WsCJJ41WmhrQp8AvU1jTnFssNQ
	Ujhn6/Vv/K0faSHqmI7qmDxmQW6tvn+W6ptWkJclvvQ0r1s4K6FsipjnBk8abm3j4J
	WURkkxlnOoHQ5vShvT1s6A/sEgD9YmHhrszeqcHrCgirRjM5aF0uYqr7k4AmbE8mH6
	Ip1OzPvOYG+dLcStEdwkfOd7LLaFzyAhwLquks7BoTiJX+hpHQg0AQIagLBmujrKVC
	6xNOp2s/DcJaEHN76YoLxAh1eRwG4ikJP/5cpNm0ZSkX421S40XhlYxLcn3nIAIcZT
	h1gMjzqVd+7r9ScKuIrL7FeaoLoejqwvfrn5ZjWudWcJjUZxAtdRLWWc/glTzuV14V
	BUKNTEaDjsT0A8DS8yKixb0s4gs+d9KInnc4/fcIEMnlAL/aemSiIFjjgdUG1u/5sT
	vCm+RsyPMZYE0yx9krx9oWC4=
Date: Wed, 15 May 2019 14:08:13 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20190515110813.GA13420@localhost>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
MIME-Version: 1.0
In-Reply-To: <0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 May 2019 11:08:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 15, 2019 at 05:50:44PM +0800, Hongxu Jia wrote:
> On 5/15/19 5:32 PM, Andreas Müller wrote:
> > > --- a/meta/classes/autotools.bbclass
> > > +++ b/meta/classes/autotools.bbclass
> > > @@ -90,7 +90,11 @@ oe_runconf () {
> > >                  bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
> > >                  if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
> > >                          bbnote "The following config.log files may provide further information."
> > > -                       bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
> > > +                       config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
> > > +                       bbnote "$config_log"
> > > +                       [ -e "$config_log" ] && cat "$config_log" | while read line; do
> > > +                               bbnote "$line"
> > > +                       done
> > >                          bbfatal_log "configure failed"
> > >                  fi
> > >          else
> > > --
> > > 2.7.4
> > > 
> > That output is useful only sometimes and extremly verbose. I'd suggest
> > to introduce a switch to enable/disable (even as newbie user I am able
> > to find config.log). How about making autobuilder's WORKDIR
> > accessible?
> 
> The output only happens while do_configure failure, it does nothing when
> build succeed,
> 
> while failure occurs, I believe related message is the more the better.
> 
> The autobuilder is just an example, for community development, it is hard to
> login
> 
> others build host to debug issue, and we have to take time to reproduce it
> 
> if we could trace it with a simple glance from the log, why not

The end of config.log often contains expected error messages completely 
unrelated to the actual problem.

Debian autobuilders already dump config.log when when configuring failed,
and there it is a common problem that people end up searching for the 
problem in the wrong places due to that.

If possible, it would therefore be better to make it accessible separately.

> //Hongxu

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


