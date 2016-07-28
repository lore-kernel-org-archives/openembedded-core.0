Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C73BE60721
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 09:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6S97hUZ021315; Thu, 28 Jul 2016 10:07:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W7rX7XlMk8hu; Thu, 28 Jul 2016 10:07:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6S97dta021310
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 28 Jul 2016 10:07:40 +0100
Message-ID: <1469696859.3351.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jul 2016 10:07:39 +0100
In-Reply-To: <03C3A5A6-D337-4FFA-9013-79FCCD0E50A9@gmail.com>
References: <1469637177-2657-1-git-send-email-ross.burton@intel.com>
	<20160727170756.aridi4qzmmuyedyt@jama>
	<CAJTo0LZxbYTwvv0ywOwaBSVxaCJ82TAejikPefPh1F+Q1zvFkQ@mail.gmail.com>
	<03C3A5A6-D337-4FFA-9013-79FCCD0E50A9@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: add missing wayland-native dependency
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
X-List-Received-Date: Thu, 28 Jul 2016 09:07:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-07-27 at 18:40 -0700, Khem Raj wrote:
> 
> > On Jul 27, 2016, at 12:51 PM, Burton, Ross <ross.burton@intel.com>
> > wrote:
> > Why is this needed when wayland already depends on wayland
> > > -native?
> > Because builds from sstate won't pull in all the build dependencies
> > transitively, just enough to do the required tasks. The
> > requirements are the wayland runtime libraries (wayland) and the
> > native tooling (waylaid-native).
> Is it so that populate_sysroot tasks wont do the above two jobs ? if
> yes then why
> If you are saying that behavior is different with or without sstate
> reuse if  I do
> bitbake gstreamer1.0-plugins-bad, then I think there is a problem. 
>  The entries changed here will
> get added to DEPENDS in the end. So Martin has a point.

The way the sstate code is coded, it assumes that if a target recipe X
is available from sstate, any -native/-cross dependencies of that
target are not needed and not installed.

In general this makes sense as quilt-native isn't needed if we aren't
patching, we don't need a compiler/toolchain if we're not compiling and
so on.

What it does mean is that any recipe needing a -native recipe to build 
should list it in DEPENDS directly, not rely on other dependencies to
pull it in for them. This applies to pkgconfig-native, intltool-native
and also to wayland-native.

I'm open to other ideas on how this could work but right now, its the
only way I can see to make sstate use semi-optimal, rather tahn
requiring *everything* come from sstate all the time.

Cheers,

Richard



