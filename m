Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AECE06AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 15:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NFL7Z8032730; Tue, 23 Jun 2015 16:21:07 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GOGYWQP03t4A; Tue, 23 Jun 2015 16:21:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5NFKp4k032724
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 23 Jun 2015 16:21:02 +0100
Message-ID: <1435072851.11489.86.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 23 Jun 2015 16:20:51 +0100
In-Reply-To: <1435072346.2483.417.camel@pbcl.net>
References: <1434221081-4286-1-git-send-email-mac@mcrowe.com>
	<1435072346.2483.417.camel@pbcl.net>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pixbufcache: Ensure that jpeg-native is available for postinst if necessary
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
X-List-Received-Date: Tue, 23 Jun 2015 15:21:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-23 at 16:12 +0100, Phil Blundell wrote:
> On Sat, 2015-06-13 at 19:44 +0100, Mike Crowe wrote:
> > diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
> > index 9e6ecc8..755a654 100644
> > --- a/meta/classes/pixbufcache.bbclass
> > +++ b/meta/classes/pixbufcache.bbclass
> > @@ -72,6 +72,7 @@ PIXBUFCACHE_SYSROOT_DEPS_class-native = "\
> >      glib-2.0-native:do_populate_sysroot_setscene libffi-native:do_populate_sysroot_setscene \
> >      libpng-native:do_populate_sysroot_setscene zlib-native:do_populate_sysroot_setscene \
> >      harfbuzz-native:do_populate_sysroot_setscene \
> > +    ${@bb.utils.contains('PACKAGECONFIG', 'jpeg', 'jpeg-native:do_populate_sysroot_setscene', '', d)} \
> 
> I'm not sure this is quite right.  PACKAGECONFIG at the point this is
> expanded will be the PACKAGECONFIG for whatever recipe is currently
> inheriting pixbufcache.bbclass, whereas I think what you really need
> here is the PACKAGECONFIG that gdk-pixbuf itself was built with.  Or,
> er, something.

Right, its not that simple. As it happens I was just looking at this
patch:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/t222&id=32afecae2495b0486a044b66154573caf39144c7

which I proposed a while ago which does solve this problem, with some
ugliness in base.bbclass. I know Ross doesn't like it, neither do I, I
do prefer it to the pretty horrible things PIXBUFCACHE_SYSROOT_DEPS does
though.

Cheers,

Richard




