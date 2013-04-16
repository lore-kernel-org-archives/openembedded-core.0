Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1US35Z-0002Gn-Fq for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 12:26:18 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GA8wX7027336; Tue, 16 Apr 2013 11:08:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XJ9JIWOzuCYk; Tue, 16 Apr 2013 11:08:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3GA8r37027318
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 16 Apr 2013 11:08:55 +0100
Message-ID: <1366106906.8670.93.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Apr 2013 11:08:26 +0100
In-Reply-To: <EDFD893A-99B8-4C91-86DB-FFD37D78200E@dominion.thruhere.net>
References: <1366103412-10924-1-git-send-email-koen@dominion.thruhere.net>
	<1366106058.8670.89.camel@ted>
	<EDFD893A-99B8-4C91-86DB-FFD37D78200E@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: add libpng to DEPENDS
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
X-List-Received-Date: Tue, 16 Apr 2013 10:26:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-04-16 at 11:59 +0200, Koen Kooi wrote:
> Op 16 apr. 2013, om 11:54 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Tue, 2013-04-16 at 11:10 +0200, Koen Kooi wrote:
> >> Pango links indirectly to libpng through the cairo-png dependency, but
> >> does encode the libpng version in its .la files. Changing libpng
> >> versions will make a rebuild fail, so let's cheat a bit to let sstate
> >> rebuild pango as well to get around this.
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> meta/recipes-graphics/pango/pango.inc | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > This doesn't follow. If pango -> cairo -> libpng and libpng changes,
> > both cairo and pango will rebuild.
> 
> If it did get rebuilt it still had references to non-existent
> libpng16  .la in its .la files.

Autotools/libtool being broken then, the DEPENDS change might appear to
help but it doesn't, only way to deal with it is either the change below
or to clean the recipe in question.

> > What might be the problem is that autotools (or more likely libtool)
> > isn't rebuilding correctly. This was solved with the separate build
> > directory code. Have you enabled that?
> 
> Not that I know off. How do I do that?

http://git.yoctoproject.org/cgit.cgi/poky/commit/meta-yocto?id=9e366e153234114ab3c51e4bb8e3452593f64070

It was was made opt in since people didn't want it as the default. I've
made it the default for poky as I believe its a good thing and helps
cases like this.

The only downside is that to change to this you need a clean build
directory as autotools throws a fit about this change when you re-run
configure on an existing directory. Nothing we can do about that one,
its autotools :(.

Cheers,

Richard



