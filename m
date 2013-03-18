Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UHda5-0002zs-AL for openembedded-core@lists.openembedded.org;
	Mon, 18 Mar 2013 18:11:17 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IH2uwf021722; Mon, 18 Mar 2013 17:02:56 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YB5GrFqriYUB; Mon, 18 Mar 2013 17:02:56 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2IH2nV9021715
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 18 Mar 2013 17:02:52 GMT
Message-ID: <1363625615.16482.61.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chris Larson <clarson@kergoth.com>
Date: Mon, 18 Mar 2013 16:53:35 +0000
In-Reply-To: <CABcZAN=qcf7gxWoAyuArPVCSieiPejOazZX9BOPx03rNWEOCOg@mail.gmail.com>
References: <1363312663.14476.12.camel@ted>
	<CABcZAN=qcf7gxWoAyuArPVCSieiPejOazZX9BOPx03rNWEOCOg@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r2IH2uwf021722
Cc: Scholz <enrico.scholz@sigma-chemnitz.de>, Enrico,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: package: Add cachedpath optimisation
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
X-List-Received-Date: Mon, 18 Mar 2013 17:11:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2013-03-14 at 20:02 -0700, Chris Larson wrote:
>=20
> On Thu, Mar 14, 2013 at 6:57 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         Currently, various standard library operations like os.walk(),
>         os.path.isdir() and os.path.islink() each call stat or lstat
>         which
>         involves a syscall into the kernel. There is no caching since
>         they could
>         conceivably have changed on disk. The result is that for
>         something like
>         the do_package task of the kernel we're spending over two
>         minutes making
>         868,000 individual stat calls for 23,000 files. This is
>         suboptimal.
>        =20
>         This patch adds lib/oe/cachedpath.py which are a set of
>         replacement
>         functions for these operations which use cached stat data
>         rather than
>         hitting the kernel each time. It gives a nice performance
>         improvement
>         halving the build time of the kernel do_package.
>        =20
>         Signed-off-by: Richard Purdie
>         <richard.purdie@linuxfoundation.org>
>=20
> Have you considered having the initcache() return a cache object,
> either with the rest as methods on it, or pass that in? I think it'd
> be substantially cleaner than messing with globals, particularly given
> with globals we tend to have issues with cache lifetime and
> invalidation =E2=80=94 if the cache was returned, it would go away when=
 the
> object gets collected.

Agreed. Due to the way package.bbclass is structured, we currently need
a global there but that is no reason we shouldn't have a sensible
class/object structure for the new code. I've sent out a v2 which
hopefully does better in that regard.

Cheers,

Richard
>=20




