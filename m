Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE7F7713E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RMDNZv019147; Wed, 27 Jan 2016 22:13:23 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eY7-bjFUsj_P; Wed, 27 Jan 2016 22:13:23 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0RMDInb019143
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 27 Jan 2016 22:13:19 GMT
Message-ID: <1453932798.10340.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Jan 2016 22:13:18 +0000
In-Reply-To: <F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
References: <cover.1453882496.git.hongxu.jia@windriver.com>
	<1453889810.10340.5.camel@linuxfoundation.org>
	<F43BB7C8-5982-46B5-90B1-D11128DEA616@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] base/bbclass: use target path to replace build ones in debugging info
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
X-List-Received-Date: Wed, 27 Jan 2016 22:13:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-27 at 14:34 -0500, Khem Raj wrote:
> > On Jan 27, 2016, at 5:16 AM, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > I like the idea of this a lot, I think it makes sense however why
> > not
> > just:
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index e80ee18..284f7fb 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -546,7 +546,14 @@ EXTRA_OEMAKE_prepend_task-install =
> > "${PARALLEL_MAKEINST} "
> > ##################################################################
> > # Optimization flags.
> > ##################################################################
> > -DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types"
> > +DEBUG_FLAGS ?= "-g \
> > +    -feliminate-unused-debug-types \
> > +    -fdebug-prefix-map=${B}=/usr/src/${BPN} \
> > +    -fdebug-prefix-map=${S}=/usr/src/${BPN}
> > +    -gno-record-gcc-switches \
> 
> can we leave the switches in ?

Is there a way we can do some path substitutions on the switches?

I think part of the desire here is that the end resulting binaries
shouldn't depend upon the path in which they were built and leaving
these in is causing a problem there.

Cheers,

Richard

> > +    -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
> > +    -fdebug-prefix-map=${STAGING_DIR_HOST}= \
> > +"
> > # Disabled until the option works properly -feliminate-dwarf2-dups
> > FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> > DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} 
> > -pipe"
> > 
> > ?
> > 
> > Cheers,
> > 
> > Richard
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

