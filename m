Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGvHt-0007tm-9u
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 19:20:41 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TGv5U-0006dY-Iq; Wed, 26 Sep 2012 19:07:52 +0200
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 26 Sep 2012 18:07:51 +0100
In-Reply-To: <1347373349.2122.35.camel@ted>
References: <1347373349.2122.35.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348679272.32611.4.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 26 Sep 2012 17:20:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 15:22 +0100, Richard Purdie wrote:
> Unfortunately whilst rerunning configure and make against a project will mostly
> work there are situations where it does not correctly do the right thing.
> 
> In particular, eglibc and gcc will fail out with errors where settings
> do not match a previously built configuration. It could be argued they are
> broken but the situation is what it is. There is the possibility of more subtle
> errors too.

FWIW, I just encountered another instance of what appears to be a
similar problem (with this patch applied).  I had changed my CFLAGS to
work around a compiler problem and then just reran the build, which led
eventually to:

ERROR: Function failed: do_siteconfig_gencache
(see ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
+svnr20393/temp/log.do_populate_sysroot.6005 for further information)
ERROR: Logfile of failure stored
in: ..../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
+svnr20393/temp/log.do_populate_sysroot.6005
Log data follows:
| DEBUG: Executing python function sstate_task_prefunc
[...]
| DEBUG: Executing shell function do_siteconfig_gencache
| configure: WARNING: unrecognized options: --disable-silent-rules,
--disable-dependency-tracking, --with-libtool-sysroot
| configure: loading cache eglibc_cache
| configure: error: `CFLAGS' has changed since the previous run:
| configure:   former value:  `...'
| configure:   current value: `...'
| configure: error: in
`/.../tmp-eglibc/work/mips32el-oe-linux/eglibc/2.16-r11.micro1
+svnr20393/site_config_cheetah':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm eglibc_cache' and
start over
| DEBUG: Python function siteconfig_do_siteconfig finished
| DEBUG: Python function autotools_do_siteconfig finished
| DEBUG: Python function do_siteconfig finished
| DEBUG: Python function sstate_task_postfunc finished
ERROR: Task 30 (.../oe-core/meta/recipes-core/eglibc/eglibc_2.16.bb,
do_populate_sysroot) failed with exit code '1'

p.




