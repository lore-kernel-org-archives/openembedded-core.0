Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web08.14121.1631302766000333624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 12:39:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id E93421BF205;
	Fri, 10 Sep 2021 19:39:23 +0000 (UTC)
Date: Fri, 10 Sep 2021 21:39:23 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: tobias.kaufmann@wusto.de
Cc: openembedded-core@lists.openembedded.org,
	Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
Subject: Re: [OE-core] [PATCH] package-manager: escape package names for regexps
Message-ID: <YTu0awQbjCVQUyRk@piout.net>
References: <20210908174641.223936-1-tobias.kaufmann@wusto.de>
 <YTuz+F17i6FDyB/n@piout.net>
MIME-Version: 1.0
In-Reply-To: <YTuz+F17i6FDyB/n@piout.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 10/09/2021 21:37:29+0200, Alexandre Belloni wrote:
> Hello,
> 
> On 08/09/2021 19:46:41+0200, tobias.kaufmann@wusto.de wrote:
> > From: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
> > 
> > If a package-name contains characters which are used
> > in regular expressions (e.g. libstdc++) this might
> > break the regexp compilation.
> > 
> > To solve this issue the package names are escaped before using
> > them in the regular expression
> > 
> 
> I believe this is the cause of:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2528/steps/14/logs/stdio
> can you check?
> 

Sorry, to make it easier for you, the error is:

ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1565688/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/dpkg-query --admindir=/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1565688/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/dpkg -W -f=Package: ${Package}
Architecture: ${PackageArch}
Version: ${Version}
File: ${Package}_${Version}_${Architecture}.deb
Depends: ${Depends}
Recommends: ${Recommends}
Provides: ${Provides}
' returned 2:
dpkg-query: error: parsing file '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-1565688/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lib/dpkg/status' near line 1060:
 invalid package name in 'Package' field: character '\' not allowed (only letters, digits and characters '-+._')


> > Signed-off-by: Tobias Kaufmann <Tobias.KA.Kaufmann@bmw.de>
> > ---
> >  meta/lib/oe/package_manager/deb/__init__.py | 5 +++--
> >  meta/lib/oe/package_manager/ipk/__init__.py | 5 +++--
> >  2 files changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/lib/oe/package_manager/deb/__init__.py b/meta/lib/oe/package_manager/deb/__init__.py
> > index 9f112ae25b..4d5921044a 100644
> > --- a/meta/lib/oe/package_manager/deb/__init__.py
> > +++ b/meta/lib/oe/package_manager/deb/__init__.py
> > @@ -208,8 +208,9 @@ class DpkgPM(OpkgDpkgPM):
> >  
> >                      status = sf.read()
> >                      for pkg in packages:
> > -                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
> > -                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
> > +                        _pkg = re.escape(pkg)
> > +                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % _pkg,
> > +                                        r"Package: %s\n\1Status: \2%s" % (_pkg, status_tag),
> >                                          status)
> >  
> >                      tmp_sf.write(status)
> > diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
> > index 4cd3963111..503a4f5181 100644
> > --- a/meta/lib/oe/package_manager/ipk/__init__.py
> > +++ b/meta/lib/oe/package_manager/ipk/__init__.py
> > @@ -207,8 +207,9 @@ class OpkgPM(OpkgDpkgPM):
> >  
> >                      status = sf.read()
> >                      for pkg in packages:
> > -                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % pkg,
> > -                                        r"Package: %s\n\1Status: \2%s" % (pkg, status_tag),
> > +                        _pkg = re.escape(pkg)
> > +                        status = re.sub(r"Package: %s\n((?:[^\n]+\n)*?)Status: (.*)(?:unpacked|installed)" % _pkg,
> > +                                        r"Package: %s\n\1Status: \2%s" % (_pkg, status_tag),
> >                                          status)
> >  
> >                      tmp_sf.write(status)
> > -- 
> > 2.33.0
> > 
> 
> > 
> > 
> > 
> 
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
