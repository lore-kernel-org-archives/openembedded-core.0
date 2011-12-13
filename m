Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RaOni-0002AA-0l
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 10:37:30 +0100
Received: by bkbzt4 with SMTP id zt4so6378572bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 01:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=v3U/m59KQsKMfNT0VMnvv5hZlYNWMHgw1XSiidDA9Ro=;
	b=u0MgJUzTnLvG0n73MTI4E6yzf4WNHinhdYDKzPNcylzizFQ3oYS7QoyQdZeLP4v5ry
	r6D9+ZOYskoiCtHzfr2Qk6Np7eaZDZ0sDnXVuz6I7UoO/eKJT1l/iKhjJabOkgaRCIew
	7+GNJfkFNRSXBxhUYJaoPttcBewORfXHJ5djc=
MIME-Version: 1.0
Received: by 10.180.104.41 with SMTP id gb9mr32872864wib.9.1323768634562; Tue,
	13 Dec 2011 01:30:34 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Tue, 13 Dec 2011 01:30:34 -0800 (PST)
Date: Tue, 13 Dec 2011 10:30:34 +0100
Message-ID: <CAGiJk9cfqfhg6DqY4hMBVXnABaCw1Ff9Gbojoa1B=+TvWvU9DA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Dependency resolving ignores changed sstate-cache?
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
X-List-Received-Date: Tue, 13 Dec 2011 09:37:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
it seems that I accidentally deleted fbset from my
.../tmp-eglibc/work/... dir while cleaning out old builds for another
recipe.
For some reason I had a r0 directory from the past of the recipe which
is now r1.
So I deleted it manually and fbset too, but I didn't notice.

Thereafter I built an image that has been already built before,
but it had some IMAGE_INSTALL changes.
Everything was alright until opkg encountered the following error:
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following
dependencies for qt4-x11-free:
|  *    fbset *
|  * opkg_install_cmd: Cannot install package qt4-x11-free.

Of course it could not find fbset, as it was deleted previously,
so I did a "bitbake -ccleansstate fbset" but the error still occurred.


This leads me to the conclusion, that the sstate-cache change was not
noticed by bitbake?
Or is there higher cache instance file that makes bitbake believe that
fbset was built?

After I built fbset with bitbake manually everything went back to normal,
so there is no problem just confusion :)



For the reason of understanding it, is there any recent documentation
about the dependency caching of bitbake?

-- 
Regards
Samuel


