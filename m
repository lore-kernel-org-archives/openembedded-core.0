Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BE2DF6FFE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 00:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2A0FC4J031905; Thu, 10 Mar 2016 00:15:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TLpLQkwIFKti; Thu, 10 Mar 2016 00:15:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2A0F9Wq031902
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Mar 2016 00:15:10 GMT
Message-ID: <1457568909.2804.209.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Andreas Oberritter
	<obi@opendreambox.org>
Date: Thu, 10 Mar 2016 00:15:09 +0000
In-Reply-To: <20160310000955.GP2542@jama>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
	<56E0B734.4000607@opendreambox.org> <20160310000955.GP2542@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 10 Mar 2016 00:15:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-10 at 01:09 +0100, Martin Jansa wrote:
> On Thu, Mar 10, 2016 at 12:52:20AM +0100, Andreas Oberritter wrote:
> > Hello Alexander,
> > 
> > On 09.03.2016 16:01, Alexander Kanavin wrote:
> > > Signed-off-by: Alexander Kanavin <
> > > alexander.kanavin@linux.intel.com>
> > > ---
> > >  meta/classes/gobject-introspection.bbclass | 39
> > > ++++++++++++++++++++++++++++++
> > >  1 file changed, 39 insertions(+)
> > >  create mode 100644 meta/classes/gobject-introspection.bbclass
> > > 
> > > diff --git a/meta/classes/gobject-introspection.bbclass
> > > b/meta/classes/gobject-introspection.bbclass
> > > new file mode 100644
> > > index 0000000..ef51629
> > > --- /dev/null
> > > +++ b/meta/classes/gobject-introspection.bbclass
> > > @@ -0,0 +1,39 @@
> > > +# Inherit this class in recipes to enable building their
> > > introspection files
> > > +
> > > +# This allows disabling introspection support in recipes
> > > +# (and therefore avoiding the use of qemu)
> > > +# if gobject-introspection-data is omitted from DISTRO_FEATURES
> > > and MACHINE_FEATURES.
> > > +EXTRA_OECONF_prepend = "${@bb.utils.contains('COMBINED_FEATURES'
> > > , 'gobject-introspection-data', '--enable-introspection', '-
> > > -disable-introspection', d)} "
> > 
> > testing only DISTRO_FEATURES would be better. If MACHINE_FEATURES
> > gets
> > tested, even though indirectly, I'd expect every recipe inheriting
> > this
> > class to switch to MACHINE_ARCH implicitly.
> 
> I think the idea was to prevent using qemu for MACHINEs without
> support
> in qemu. But I fully agree that causing all recipes which inherit
> this
> bbclass effectively MACHINE_ARCH is even worse.
> 
> DISTRO needs to make sure that all supported MACHINEs have support in
> qemu or disable introspection for all of them.

Remember that bitbake has special knowledge of bb.utils.contains() and
is clever enough to make the checksums depend on "gobject-introspection
-data" being present or not and not the actual complete value.

So we can get the best of both worlds here, you can disable g-i on a
per machine basis yet still enable at the distro level. Recipes don't
become machine specific.

Cheers,

Richard


