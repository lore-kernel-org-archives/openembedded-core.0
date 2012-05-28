Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ive.found@gmail.com>) id 1SZ57g-00087k-CQ
	for openembedded-core@lists.openembedded.org;
	Mon, 28 May 2012 20:56:56 +0200
Received: by wibhm14 with SMTP id hm14so1687812wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2012 11:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=HNvo6OGbgDI+VDvn/hb2H1DCIn7nisWydfEKIWzFZdY=;
	b=RKsUqpVZM+303qndzRslwhBUCvy/sK+a102Q/uguivkSYVE/8COFpZQTN8p2VEWcGB
	tEU84sFgOT1haB5UbY8i/4OnpH0c9Q28bN7v4tbFC7NlgHpzco+l8NWlKJlrNwixyvj7
	bCu4CO8bdTR5rIg2B0QE3OL4KEoUMs3g4oy3Ca6Uhgg6CoN8FLpc0IFEfOjLfNd7Wb43
	VWftOkyogcLycKpQ65N5OAYz+6zqCJWbfFygrRnwiVUVOkS5WMWlWgSqilS+1JBkwA1i
	h3EfBzR8dUgbNiu3so6G4cwyew0du6472RlFgi+EhvdOJ9wGjzC4rXdQqWkySRVx338o
	DOag==
Received: by 10.216.208.71 with SMTP id p49mr5321166weo.172.1338230799812;
	Mon, 28 May 2012 11:46:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.89.131 with HTTP; Mon, 28 May 2012 11:46:19 -0700 (PDT)
In-Reply-To: <1338198283.1964.320.camel@phil-desktop>
References: <1336915722-8155-1-git-send-email-ive.found@gmail.com>
	<1338198283.1964.320.camel@phil-desktop>
From: Ive Found <ive.found@gmail.com>
Date: Mon, 28 May 2012 21:46:19 +0300
Message-ID: <CABnTX71G-CE_poX2jvPZxcJsqhD420LF3Vwt2G=cf_3z4XdJPQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Support additional user-defined package metadata
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
X-List-Received-Date: Mon, 28 May 2012 18:56:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 28, 2012 at 12:44 PM, Phil Blundell <philb@gnu.org> wrote:
> On Sun, 2012-05-13 at 16:28 +0300, Leonid Borisenko wrote:
>> Custom metadata field with supported firmware version(s) could be
>> included into package control file for preventing of installing packaged
>> modifications onto unsupported firmware.
>
> Why isn't RDEPENDS sufficient for this?

I didn't think about using RDEPENDS for specifing supported firmware version.

I'll try to discuss possible scenario with RDEPENDS. Correct me please
if I'll miss your point.

So RDEPENDS transforms into Depends field in package control file (I'm
speaking about ipk/deb, as it's the chosen format). Depends field
contains list of packages (with their's versions) on which target
package is depended. Dependencies must be installed before target
package and target package will not be installed if all dependencies
will not be satisfied.

So there could be empty package kindle-touch-firmware on which target
package will depend. Supported version of firmware could be specified
as version of package. Package will be empty as only it's version
string is signifcant.

Using of stub package for describing supported version of stock
proprietary firmware is pretty weird (as for me), but on the other
side it's OK as it uses existing capabilities of package format and
existing support of package format in OE.

However, user-defined metadata fields are existing capabilities of
deb/ipk format too [1].

Also, it could be reasonable to override supported firmware
specification and install package forcefully. Noone could foresee
whether his/her package will work on future firmware version, but it
could in fact work. If package is abandoned and supported firmware
version wasn't changed in long time and user want to install it on
newer firmware, then using of stub package in Depends field will bring
problems. It's not possible to ignore just one package from Depends
field, all packages from Depends field will be ignored.

[1] http://www.debian.org/doc/debian-policy/ch-controlfields.html#s5.7


