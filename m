Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D411861005
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 10:06:56 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8RA6pf2022305; Fri, 27 Sep 2013 11:06:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0LZ23RIdU3Op; Fri, 27 Sep 2013 11:06:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8RA6kLN022291
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 27 Sep 2013 11:06:47 +0100
Message-ID: <1380276402.18603.420.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 27 Sep 2013 11:06:42 +0100
In-Reply-To: <1380273659.18603.416.camel@ted>
References: <1360697804-39039-1-git-send-email-jason.wessel@windriver.com>
	<20130926224000.GA31328@denix.org> <1380273659.18603.416.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libtool-native_2.4.2.bb: Always use /bin/sed for SED
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
X-List-Received-Date: Fri, 27 Sep 2013 10:06:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-27 at 10:20 +0100, Richard Purdie wrote:
> On Thu, 2013-09-26 at 18:40 -0400, Denys Dmytriyenko wrote:
> > On Tue, Feb 12, 2013 at 01:36:44PM -0600, Jason Wessel wrote:
> > > If you never use sstate and always build everything from scratch you
> > > will never see this problem.  However, if you use sstate and build
> > > directories that last a long time eventually you can end up with the
> > > scenario where libtool gets a hard coded path in it for sed, and sed
> > > may not exist.  The reason you don't see this problem to often if you
> > > generally build from scratch is that libtool builds before sed and
> > > will pickup the host's /bin/sed.
> > > 
> > > The way to reproduce the issue is:
> > > 
> > > bitbake some_image
> > > bitbake -c cleansstate libtool-native
> > > bitbake sed-native
> > > bitbake libtool-native
> > > bitbake -c clean sed-native
> > > bitbake ANY_PACKAGE_THAT_USES_LIBTOOL_NATIVE
> > > 
> > > In my case I used modphp, which doesn't exist in the oe-core. You will
> > > end up with a strange looking error like:
> > > 
> > > | make[1]: *** [buckets/apr_buckets_alloc.lo] Error 1
> > > | /opt/build/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool: line 981: /opt/build/bitbake_build/tmp/sysroots/x86_64-linux//bin/sed: No such file or directory
> > 
> > Sorry for bringing up this old thread. I'm seeing these and similar errors now 
> > (nothing really changed in my setup, but some race got them exposed).
> > 
> > I do see that the proposed patch got merged all the way back in February. But 
> > looks like it wasn't enough.
> > 
> > I've just seen this error about missing sysroots/x86_64-linux//bin/sed coming 
> > from nativesdk-gettext compilation while calling i686-linux-libtool, i.e. the 
> > nativesdk version of libtool. Should be easy to duplicate the below patch for 
> > libtool from native to nativesdk recipe.
> > 
> > And another error was from sysroots/x86_64-linux/usr/bin/opkg-build during 
> > do_package_write of some other package. Should opkg-utils-native be patched 
> > the same?
> 
> Was this in master with
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=32edeb391f2107bb66b361cdcd4b8d4447731c33 applied?

To answer my own question, the above introduced a bug since I'd
forgotten native doesn't use the site files. It probably should use at
least a minimal one so I've sent out a patch for that.

Cheers,

Richard


