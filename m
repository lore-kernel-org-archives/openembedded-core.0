Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QQ3L7-00067r-If
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 22:08:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2011 13:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,282,1304319600"; d="scan'208,223";a="5996185"
Received: from vorpal.jf.intel.com (HELO [10.7.199.68]) ([10.7.199.68])
	by orsmga001.jf.intel.com with ESMTP; 27 May 2011 13:05:38 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 May 2011 13:09:06 -0700
In-Reply-To: <7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
References: <cover.1306477652.git.lianhao.lu@intel.com>
	<1306515635.27470.284.camel@rex>
	<7DC6724C-BF20-4EA1-A87D-32FBEEECDA3B@dominion.thruhere.net>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1306526949.1747.8.camel@vorpal>
Mime-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: bitbake-devel@lists.openembedded.org
Subject: Re: [PATCH 00/11] Add PR service and integrate PKGV/PKGR from OE
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
X-List-Received-Date: Fri, 27 May 2011 20:08:58 -0000
Content-Type: multipart/mixed; boundary="=-E8D/MU1wCgQ+v2wVSFCy"

--=-E8D/MU1wCgQ+v2wVSFCy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 20:48 +0200, Koen Kooi wrote:
> Op 27 mei 2011, om 19:00 heeft Richard Purdie het volgende geschreven:
> 
> > Hi Lianhao,
> > 
> > On Fri, 2011-05-27 at 14:31 +0800, Lianhao Lu wrote:
> >>  git://git.pokylinux.org/poky-contrib llu/PR-service
> >>  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/PR-service
> >> 
> >> Lianhao Lu (11):
> >>  Added the PR service.
> >>  conf/bitbake.conf: Added variables for PR service.
> >>  meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
> >>  classes/package(prserv).bbclass: Get PRAUTO and use PKGV/PKGR.
> >>  classes/package_xxx.class: Use PKGE/PKGV/PKGR.
> >>  udev: use EXTENDPKGV instead of EXTENDPV.
> >>  xcb: use EXTENDPKGV instead of EXTENDPV.
> >>  xorg-proto: use EXTENDPKGV instead of EXTENDPV.
> >>  xorg-util/util-macros: use EXTENDPKGV instead of EXTENDPV.
> >>  linux-libc-headers: use EXTENDPKGV instead of EXTENDPV.
> >>  conf/bitbake.conf: Removed EXTENDPV and EXTENDPEVER.
> > 
> > I merged this but I did make some tweaks to both the patch series and
> > one of the patches. The changes I made were:
> > 
> > a) Squash the EXTENDPV and EXTENDPEVER changes into the base patch
> > making all the associated changes in one go.
> > 
> > b) Not include the DISTRO_PR variable for now
> > 
> > c) Not change the default signature handler to basichash.
> > 
> > For c), I'd suggest a follow up patch changing the default in poky.conf
> > in meta-yocto and we'll test this there. This should wait until the
> > PACKAGE_ARCH = "all" sstate issues we've been seeing are addressed
> > though.
> 
> On Fedora 14 I get this when trying to rebuild console-image:
> 
> ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_auto_pr)
> ERROR: Function 'package_get_auto_pr' failed
> ERROR: Logfile of failure stored in: /home/koen/angstrom-core/build/tmp-angstrom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/dbus-1.4.1-r5/temp/log.do_package.24742
> Log data follows:
> | ERROR: Error executing a python function in /home/koen/angstrom-core/sources/openembedded-core/meta/recipes-core/dbus/dbus_1.4.1.bb:
> | ImportError: No module named xmlrpc
> | 
> | ERROR: The stack trace of python calls that resulted in this exception/failure was:
> | ERROR:   File "package_get_auto_pr", line 11, in <module>
> | ERROR:
> | ERROR:   File "package_get_auto_pr", line 4, in package_get_auto_pr
> | ERROR:
> | ERROR:   File "prserv.bbclass", line 8, in prserv_get_pr_auto
> | ERROR:
> | ERROR:   File "prserv.bbclass", line 2, in prserv_make_conn
> | ERROR:
> | ERROR:   File "/home/koen/angstrom-core/sources/bitbake/lib/prserv/serv.py", line 6, in <module>
> | ERROR:     import bb.server.xmlrpc

Upstream BitBake still has the xmlrpc server removed. The version in
Poky's BitBake is functional (I use it daily).

Attached are two patches against BitBake master to add back the xmlrpc
server (copied from Poky's tree) and fix the uievent.

> | ERROR:
> | ERROR: The code that was being executed was:
> | ERROR:      0007:                     return
> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
> | ERROR:      0009:
> | ERROR:      0010:
> | ERROR:  *** 0011:package_get_auto_pr(d)
> | ERROR:      0012:
> | ERROR: (file: 'package_get_auto_pr', lineno: 11, function: <module>)
> | ERROR:      0001:
> | ERROR:      0002:def package_get_auto_pr(d):
> | ERROR:      0003:     if d.getVar('USE_PR_SERV', True):
> | ERROR:  *** 0004:             auto_pr=prserv_get_pr_auto(d)
> | ERROR:      0005:             if auto_pr is None:
> | ERROR:      0006:                     bb.fatal("Can NOT get auto PR revision from remote PR service")
> | ERROR:      0007:                     return
> | ERROR:      0008:             d.setVar('PRAUTO',str(auto_pr))
> | ERROR: (file: 'package_get_auto_pr', lineno: 4, function: package_get_auto_pr)
> | ERROR: Function 'package_get_auto_pr' failed
> 
> It doesn't seem to trigger on my debian box, though

Are you using Poky on the Debian box?

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre

--=-E8D/MU1wCgQ+v2wVSFCy--
