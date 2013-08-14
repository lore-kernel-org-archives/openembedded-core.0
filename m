Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E9D9A600A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 10:47:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7EAw46a011651; Wed, 14 Aug 2013 11:58:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rBsa6C0Pskku; Wed, 14 Aug 2013 11:58:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7EAwEp5011652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 14 Aug 2013 11:58:15 +0100
Message-ID: <1376477217.22952.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 14 Aug 2013 11:46:57 +0100
In-Reply-To: <20130814065609.GQ17945@jama>
References: <cover.1376379182.git.rongqing.li@windriver.com>
	<02e6f25c210b0628dc4ee4482474b0e6ce5606e4.1376379182.git.rongqing.li@windriver.com>
	<520A82BA.2070706@linux.intel.com> <520B1595.3060909@windriver.com>
	<20130814065609.GQ17945@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] sstate.bbclass: fix parallel building issue
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
X-List-Received-Date: Wed, 14 Aug 2013 10:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-14 at 08:56 +0200, Martin Jansa wrote:
> On Wed, Aug 14, 2013 at 01:28:53PM +0800, Rongqing Li wrote:
> > 
> > 
> > On 08/14/2013 03:02 AM, Saul Wold wrote:
> > > On 08/13/2013 01:20 AM, rongqing.li@windriver.com wrote:
> > >> From: "Roy.Li" <rongqing.li@windriver.com>
> > >>
> > >> sstate_package creates hardlink from sysroot to SSTATE_BUILDDIR, then
> > >> sstate_create_package will store SSTATE_BUILDDIR into a archive file by
> > >> tar, but once other packages install the same file into sysroot, the
> > >> creating the archive file will fail with below error:
> > >>
> > >>      DEBUG: Executing shell function sstate_create_package
> > >>      tar: x86_64-linux/usr/share/aclocal/xorg-macros.m4: file changed
> > >> as we read it
> > >>
> > >> This kind of error is harmless, use --ignore-failed-read to ignore it.
> > >>
> > > I am not sure it's so harmless, what if the file is corrupted, then we
> > > have a bad sstate tarball.  You have identified the part of the root
> > > cause being the hardlink, but what if the file actually does change
> > > (which would be a different bug potentially), then your packaging a
> > > differet set of macros (in this case) with the sysroot.
> > >
> > >
> > > Sau!
> > 
> > 
> > The file is not corrupted, and the file content is not changed,  "tar"
> > said xorg-macros.m4 file is changed, since the number of links of
> > xorg-macros.m4 has changed when other packages is doing configuration
> > and call autotools_copy_aclocal to make a hardlink to ${ACLOCALDIR}
> > 
> > If this fix can be accepted, I will rework the commit header.
> 
> I think there is still some other issue.
> 
> I haven't seen this on ext4 filesystems, but with reiserfs I was able to
> reproduce "cp: will not create hard link" issue, e.g.:
> 
> do_populate_lic_setscene task failing in sstate_install with 
> cp: will not create hard link `/OE/deploy/licenses/recipe' to directory `/OE/deploy/licenses/recipe' (same path)
> 
> or
> ERROR: Error executing a python function in pn.bb:
> CalledProcessError: Command 'cp -afl /OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/* /OE/pkgdata/armv7a-vfp-neon-oe-linux-gnueabi' returned non-zero exit status 1 with output 
> cp: warning: source file `/OE/work/armv7a-vfp-neon-oe-linux-gnueabi/pn/1.0/pkgdata/pn' specified more than once

This sounds like a race issue in reiserfs to me...

Cheers,

Richard


