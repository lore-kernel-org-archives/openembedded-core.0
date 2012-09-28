Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THajj-0005fF-Na for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:36:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDNF5Y010446;
	Fri, 28 Sep 2012 14:23:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09843-08; Fri, 28 Sep 2012 14:23:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SDN6MY010440
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 14:23:07 +0100
Message-ID: <1348838588.15753.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 28 Sep 2012 14:23:08 +0100
In-Reply-To: <1348679272.32611.4.camel@phil-desktop>
References: <1347373349.2122.35.camel@ted>
	<1348679272.32611.4.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: Add functionality to force a clean of ${B} when reconfiguring (and ${S} != ${B})
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
X-List-Received-Date: Fri, 28 Sep 2012 13:36:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 18:07 +0100, Phil Blundell wrote:
> On Tue, 2012-09-11 at 15:22 +0100, Richard Purdie wrote:
> > Unfortunately whilst rerunning configure and make against a project will mostly
> > work there are situations where it does not correctly do the right thing.
> > 
> > In particular, eglibc and gcc will fail out with errors where settings
> > do not match a previously built configuration. It could be argued they are
> > broken but the situation is what it is. There is the possibility of more subtle
> > errors too.
> 
> FWIW, I just encountered another instance of what appears to be a
> similar problem (with this patch applied).  I had changed my CFLAGS to
> work around a compiler problem and then just reran the build, which led
> eventually to:
> 
> ERROR: Function failed: do_siteconfig_gencache
> (see ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/temp/log.do_populate_sysroot.6005 for further information)
> ERROR: Logfile of failure stored
> in: ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/temp/log.do_populate_sysroot.6005
> Log data follows:
> | DEBUG: Executing python function sstate_task_prefunc
> [...]
> | DEBUG: Executing shell function do_siteconfig_gencache
> | configure: WARNING: unrecognized options: --disable-silent-rules,
> --disable-dependency-tracking, --with-libtool-sysroot
> | configure: loading cache eglibc_cache
> | configure: error: `CFLAGS' has changed since the previous run:
> | configure:   former value:  `...'
> | configure:   current value: `...'
> | configure: error: in
> `/.../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
> +svnr20393/site_config_cheetah':
> | configure: error: changes in the environment can compromise the build
> | configure: error: run `make distclean' and/or `rm eglibc_cache' and
> start over
> | DEBUG: Python function siteconfig_do_siteconfig finished
> | DEBUG: Python function autotools_do_siteconfig finished
> | DEBUG: Python function do_siteconfig finished
> | DEBUG: Python function sstate_task_postfunc finished
> ERROR: Task 30 (.../oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb,
> do_populate_sysroot) failed with exit code '1'

I also ran into this and have posted a fix (to siteconfig.bbclass) which
once applied let my build continue.

Cheers,

Richard



