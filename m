Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9435077141
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 07:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u527BgDT020574; Thu, 2 Jun 2016 08:11:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id abVyKBMmtGSv; Thu,  2 Jun 2016 08:11:42 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u527BabQ020569
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 2 Jun 2016 08:11:37 +0100
Message-ID: <1464851496.9588.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>
Date: Thu, 02 Jun 2016 08:11:36 +0100
In-Reply-To: <CABcZANkR9eyTFDx3u4K1G55Vi6HJC7wHUAFTiBR5EfYD+Z2XfA@mail.gmail.com>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1464784540-2786-2-git-send-email-richard.purdie@linuxfoundation.org>
	<CABcZANkR9eyTFDx3u4K1G55Vi6HJC7wHUAFTiBR5EfYD+Z2XfA@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/22] classes/lib: Convert to use python3 octal syntax
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
X-List-Received-Date: Thu, 02 Jun 2016 07:11:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-06-01 at 14:57 -0700, Christopher Larson wrote:
> 
> On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index 4be0a7e..1ba1222 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -456,15 +456,15 @@ python () {
> >      # If we're building a target package we need to use fakeroot
> > (pseudo)
> >      # in order to capture permissions, owners, groups and special
> > files
> >      if not bb.data.inherits_class('native', d) and not
> > bb.data.inherits_class('cross', d):
> > -        d.setVarFlag('do_unpack', 'umask', '022')
> > -        d.setVarFlag('do_configure', 'umask', '022')
> > -        d.setVarFlag('do_compile', 'umask', '022')
> > +        d.setVarFlag('do_unpack', 'umask', '0o022')
> > +        d.setVarFlag('do_configure', 'umask', '0o022')
> > +        d.setVarFlag('do_compile', 'umask', '0o022')
> >          d.appendVarFlag('do_install', 'depends', '
> > virtual/fakeroot-native:do_populate_sysroot')
> >          d.setVarFlag('do_install', 'fakeroot', '1')
> > -        d.setVarFlag('do_install', 'umask', '022')
> > +        d.setVarFlag('do_install', 'umask', '0o022')
> >          d.appendVarFlag('do_package', 'depends', '
> > virtual/fakeroot-native:do_populate_sysroot')
> >          d.setVarFlag('do_package', 'fakeroot', '1')
> > -        d.setVarFlag('do_package', 'umask', '022')
> > +        d.setVarFlag('do_package', 'umask', '0o022')
> >          d.setVarFlag('do_package_setscene', 'fakeroot', '1')
> >          d.appendVarFlag('do_package_setscene', 'depends', '
> > virtual/fakeroot-native:do_populate_sysroot')
> >          d.setVarFlag('do_devshell', 'fakeroot', '1')
> > 
> Rather than modifying the string values in the metadata, shouldn't we
> retain compatibility by letting the umask *string* stored in the flag
> use the old format and if needed convert it when we convert the
> string to a number to pass to the appropriate os functions? Or was
> this just a sed gone wild, since these are string values, not python
> source octal syntax?

I'm not entirely sure why I did this but its not needed, the string
octal values continue to work just fine. This change doesn't break
anything but also doesn't help.

I'll take this piece out...

Cheers,

Richard


