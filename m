Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RDJfs-00055B-Ml
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 19:30:00 +0200
Received: by eyd9 with SMTP id 9so1083352eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 10:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=KybB/TGeluLsJWnaJrignNw5Av4NFMiLU/tJFJdEsFs=;
	b=VANvBdkBIl5xtt9h7r+sFNXDdvltLvDmTbNmlEclMKW7cWV+14qi6IyF4ZtfJvO61n
	yOaCtZeKhv/TnJIIcP82OzXEi153+W4IvyaNrXVL5KVrn5MULr6qXJ3l+t8xBH4r8dU3
	EBGUJO//1XFKn8K/YaOGsToPDKIHzd6Sc0Yqc=
Received: by 10.216.72.72 with SMTP id s50mr5807650wed.39.1318267419512; Mon,
	10 Oct 2011 10:23:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.160.80 with HTTP; Mon, 10 Oct 2011 10:23:19 -0700 (PDT)
In-Reply-To: <5313791D-358D-4280-967E-8F622071C091@dominion.thruhere.net>
References: <5313791D-358D-4280-967E-8F622071C091@dominion.thruhere.net>
From: Chris Larson <clarson@kergoth.com>
Date: Mon, 10 Oct 2011 10:23:19 -0700
X-Google-Sender-Auth: _RlQp9pNb2dZWVlnWOQhP11c1Bo
Message-ID: <CABcZANnivXvEs8FZHNGoJ-3rkFk8aDrL4CvXaVz_3HAs6FHyOQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: PREFERRED_PROVIDER weirdness with libltdl-dev
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
X-List-Received-Date: Mon, 10 Oct 2011 17:30:00 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 10, 2011 at 9:54 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> NOTE: multiple providers are available for runtime libltdl-dev (libtool-nativesdk, libtool)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libltdl-dev
>
> So I added that do angstrom:
>
> koen@dominion:/OE/tentacle/sources/meta-angstrom$ git grep libltdl
> conf/distro/include/angstrom-core-tweaks.inc:PREFERRED_PROVIDER_libltdl-dev = "libtool"
>
> But the warning remains:
>
> koen@dominion:/OE/tentacle/sources/openembedded-core/meta$ MACHINE=beagleboard bitbake -e task-sdk-target | grep PREFERRED_PROVIDER | grep ltdl
> NOTE: consider defining a PREFERRED_PROVIDER entry to match libltdl-dev
> # PREFERRED_PROVIDER_libltdl-dev=libtool
> PREFERRED_PROVIDER_libltdl-dev="libtool"
>
> And it keeps trying to build -sdk stuff

The warning is referring to the *runtime* package, but there's
actually no existing syntax to specify a runtime preference directly.
You can't say I want this recipe as the provider for that runtime
package, not this other one. The only thing you can do is specify a
build time preference on that same recipe, which will be seen as an
implicit preference on the runtime. E.g.:

PREFERRED_PROVIDER_libtool = "libtool"

This is a glaring weak spot in bitbake's preference configuration, in
my opinion. It would be nice to address this more directly.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


