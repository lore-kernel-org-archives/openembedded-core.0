Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TEztu-0004Lk-O1 for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 11:51:59 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9dAjn017827;
	Fri, 21 Sep 2012 10:39:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11894-06; Fri, 21 Sep 2012 10:39:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8L9d0bl017821
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 21 Sep 2012 10:39:02 +0100
Message-ID: <1348220340.10108.35.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Fri, 21 Sep 2012 10:39:00 +0100
In-Reply-To: <505B4FF5.80406@linux.intel.com>
References: <CAB3sqtajQUBTmQz47OxXp+faU94WfDaJ783wFUzx7+83XzX9nA@mail.gmail.com>
	<505B4FF5.80406@linux.intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org,
	Tarek El-Sherbiny <tarek.elsherbiny@gmail.com>
Subject: Re: Lighttpd recipe is failling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2012 09:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-20 at 10:18 -0700, Saul Wold wrote:
> On 09/20/2012 10:07 AM, Tarek El-Sherbiny wrote:
> > I would like to include lighttpd to my image but I can't build it.
> >
> > This is the error message I'm getting.
> >
> > NOTE: package lighttpd-1.4.30-r12: task do_package: Started
> > ERROR: Error executing a python function in
> > /home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> > <http://lighttpd_1.4.30.bb>:
> > AttributeError: 'NoneType' object has no attribute 'split'
> >
> Based on this, some variable is returning a NoneType and split is 
> chocking, I don't really have enough information to go on for where this 
> is happening.
> 
> I know that lighttpd does build in Poky, so it may be some local 
> configuration issue?

Looking at the traceback, its something from meta-oe and its systemd
class, particularly the systemd_check_services() function.

Cheers,

Richard


> Sau!
> 
> > ERROR: The stack trace of python calls that resulted in this
> > exception/failure was:
> > ERROR:   File "populate_packages", line 321, in <module>
> > ERROR:
> > ERROR:   File "populate_packages", line 115, in populate_packages
> > ERROR:
> > ERROR:   File "populate_packages", line 72, in systemd_check_services
> > ERROR:
> > ERROR: The code that was being executed was:
> > ERROR:      0317:bb.note("%s contains dangling symlink to %s" % (pkg, l))
> > ERROR:      0318:d.setVar('RDEPENDS_' + pkg,
> > bb.utils.join_deps(rdepends, commasep=False))
> > ERROR:      0319:
> > ERROR:      0320:
> > ERROR:  *** 0321:populate_packages(d)
> > ERROR:      0322:
> > ERROR: (file: 'populate_packages', lineno: 321, function: <module>)
> > ERROR:      0111:for pkg_systemd in d.getVar('SYSTEMD_PACKAGES', 1).split():
> > ERROR:      0112:if d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1)
> > and d.getVar('SYSTEMD_SERVICE' + "_" + pkg_systemd, 1).strip():
> > ERROR:      0113:systemd_generate_package_scripts(pkg_systemd)
> > ERROR:      0114:systemd_add_rdepends(pkg_systemd)
> > ERROR:  *** 0115:systemd_check_services()
> > ERROR:      0116:def update_rcd_package(pkg):
> > ERROR:      0117:bb.debug(1, 'adding update-rc.d calls to
> > postinst/postrm for %s' % pkg)
> > ERROR:      0118:localdata = bb.data.createCopy(d)
> > ERROR:      0119:overrides = localdata.getVar("OVERRIDES", True)
> > ERROR: (file: 'populate_packages', lineno: 115, function: populate_packages)
> > ERROR: Function failed: populate_packages
> > ERROR: Logfile of failure stored in:
> > /home/telsherbiny/work/fsl/build/tmp/work/armv7a-vfp-neon-poky-linux-gnueabi/lighttpd-1.4.30-r12/temp/log.do_package.5062
> > NOTE: package lighttpd-1.4.30-r12: task do_package: Failed
> > ERROR: Task 282
> > (/home/telsherbiny/work/fsl/sources/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb
> > <http://lighttpd_1.4.30.bb>, do_package) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 3469 tasks of which 3467 didn't need to
> > be rerun and 1 failed.
> >
> > Can someone help please
> >
> > Thanks
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




