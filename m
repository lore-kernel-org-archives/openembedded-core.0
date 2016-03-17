Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1370B60017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 22:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2HMGCYZ012265; Thu, 17 Mar 2016 22:16:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g7JjsbW_75Mz; Thu, 17 Mar 2016 22:16:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2HMG7Jg012262
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 17 Mar 2016 22:16:08 GMT
Message-ID: <1458252967.7615.36.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 17 Mar 2016 22:16:07 +0000
In-Reply-To: <20160317213608.GG2553@jama>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-8-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbQbAi-_eoqYkZgNr9qCFr=Ro5UfP7P6OBLP=m6vCzr3Q@mail.gmail.com>
	<20160317213608.GG2553@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gobject-introspection.bbclass: make additional DEPENDS conditional
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
X-List-Received-Date: Thu, 17 Mar 2016 22:16:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-17 at 22:36 +0100, Martin Jansa wrote:
> On Thu, Mar 17, 2016 at 05:29:59PM +0000, Burton, Ross wrote:
> > On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com>
> > wrote:
> > 
> > >  # Generating introspection data depends on a combination of
> > > native and
> > > target
> > >  # introspection tools, and qemu to run the target tools.
> > > -DEPENDS_append = " gobject-introspection gobject-introspection
> > > -native
> > > qemu-native"
> > > +DEPENDS_append = " ${@bb.utils.contains('COMBINED_FEATURES',
> > > 'gobject-introspection-data', 'gobject-introspection
> > > gobject-introspection-native qemu-native', '', d)}"
> > > 
> > 
> > Have you verified this works with g-i disabled and a clean sysroot?
> >   I'm
> > thinking builds will still need at least some of this to provide
> > the m4
> > macros.
> 
> Even with gobject-introspection-data removed from DISTRO_FEATURES I'm
> seeing
> couple recipes (our version of gst-*) failing with:
> 
> > configure:22282: error: possibly undefined macro:
> > PKG_CONFIG_SYSROOT_DIR
> >       If this token and others are legitimate, please use
> > m4_pattern_allow.
> >       See the Autoconf documentation.
> 
> and PKG_CONFIG_SYSROOT_DIR is added by introspection.m4 from g-i
> patchset.

Sounds like a missing pkgconfig depends somewhere. Does the g-i class
inherit pkgconfig?

Cheers,

Richard

