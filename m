Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QBiO5-00075e-KG for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 08:56:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I6sLDP009281;
	Mon, 18 Apr 2011 07:54:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08813-08; Mon, 18 Apr 2011 07:54:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3I6sG1C009275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 18 Apr 2011 07:54:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Cui, Dexuan" <dexuan.cui@intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
Date: Mon, 18 Apr 2011 07:54:07 +0100
Message-ID: <1303109647.5518.54.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Mon, 18 Apr 2011 06:56:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-04-18 at 13:43 +0800, Cui, Dexuan wrote:
> Richard Purdie wrote:
> > On Fri, 2011-04-15 at 23:54 -0700, Saul Wold wrote:
> >> @@ -3,12 +3,14 @@ DESCRIPTION = "Tool that installs the GNU
> >>  config.guess / config.sub into a direc  SECTION = "devel" LICENSE =
> >>  "GPLv1+" LIC_FILES_CHKSUM =
> >> "file://config.guess;endline=39;md5=a089987af4a25cb0419d1c2fd6d495e3"
> >> -DEPENDS = "" + +DEPENDS_virtclass-native = "perl-native"
> >> +
> >>  INHIBIT_DEFAULT_DEPS = "1"
> > 
> > I haven't taken this. Having looked at the shear number of horrible
> > perl-native issues, I'd like to take the same approach we took with
> > the toolchain staging and place perl into its own bin directory we
> > add to PATH when needed. 
>
> If a recipe does need perl-native but we fail to realize that, the
> host's perl (e.g. /usr/bin/perl) will be used -- this will further
> hinder us from realizing the recipe needs perl-native.
> 
> As to bug #968, the build failure happens because perl-native's
> do_populate_sysroot has begun but hasn't finished. If perl-native
> hasn't started to populate_sysroot, running gnu-configize won't fail
> since host's perl will be used.
> 
> so I've 3 questions:
> 1) in poky how to exclude host's perl from PATH? need to write a
> python function to filter out various possible host perl paths? e.g.,
> ~/bin/perl, /usr/local/bin/perl, /usr/bin/perl, /bin/perl,... too many
> paths...
> 
> 2) how to identify the recipes that need perl-native? I think we have
> to identify them manually one by one? This is time comsuming?
> 
> 3) Even if we solve the above 2 issues, we still need to add
> perl-native into the recipes' (that need perl-native) DEPENDS,
> correct?
> 
> I'm not sure my above understanding is ok. Please correct me if I'm
> wrong.

What I'd like to do is have perl install into a bindir which isn't part
of our PATH by default. For anything which has DEPENDS = "perl-native",
we add this directory to PATH. Anything that doesn't have the DEPENDS
doesn't see it. We can probably make this a perlnative.bbclass or
something which just contains

PATH_prepend = "${STAGING_BINDIR_NATIVE}/perl-native:"
DEPENDS += "perl-native"

This should ensure that anything that really needs perl-native finds it
but we don't have *everything* depending on it unnecessarily.

Cheers,

Richard



