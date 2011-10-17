Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RFlrb-0004nf-1L
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 14:00:15 +0200
Received: from ad.chargestorm.se (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server (TLS) id 8.3.137.0;
	Mon, 17 Oct 2011 13:54:25 +0200
Date: Mon, 17 Oct 2011 13:54:41 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20111017115440.GC3496@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20111014075529.GB4437@ad.chargestorm.se>
	<20111014104745.GD4437@ad.chargestorm.se>
	<1318592560.942.3.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318592560.942.3.camel@ted>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
X-GFI-SMTP-Submission: 1
Subject: Re: [RFC] Preventing race when compiling external kernel modules
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
X-List-Received-Date: Mon, 17 Oct 2011 12:00:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Richard Purdie <richard.purdie@linuxfoundation.org> [111014 13:43]:
> On Fri, 2011-10-14 at 12:47 +0200, Anders Darander wrote:
> > * Anders Darander <anders@chargestorm.se> [111014 09:55]:
> > > In our local tree, I've circumvented this race by applying a patch like
> > > [3]. (Well, we could likely have put the lock in do_make_scripts()
> > > instead of module_do_compile(), as we have done currently). Obviously,
> > > I'm not proposing to apply this patch, as it depends on lockfile from
> > > the procmail-package (host-package).

> > Just to confirm, it seems (after a very few tests) that it indeed is
> > enough to guard the do_make_scripts() with the lock.

> > However, the question on how to make the real solution remains...

> I've not tested this but it might give you enough info to test
> something:

> (Basic idea is to promote that function to a task, then apply a lock to
> it).

Thanks!

I had an idea that it might be something like this, but I didn't really
know if I was completely off... I'll try this and see if I can come up
with something that works reliable for us. When I've got something
ready, I'll send a real patch.

Cheers,
Anders


> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 572df0d..5602e74 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -14,8 +14,10 @@ do_make_scripts() {
>                    -C ${STAGING_KERNEL_DIR} scripts
>  }

> +addtask make_scripts before compile
> +do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
> +
>  module_do_compile() {
> -       do_make_scripts
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
>                    KERNEL_SRC=${STAGING_KERNEL_DIR}    \

-- 
Anders Darander
ChargeStorm AB / eStorm AB


