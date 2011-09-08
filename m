Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R1Yaa-0002He-Nb
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 08:59:56 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R1YVj-00057n-Ch
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 08:54:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E683D5E.70103@linux.intel.com>
References: <1315427297.4368.4.camel@lenovo.internal.reciva.com>
	<4E683D5E.70103@linux.intel.com>
Date: Thu, 08 Sep 2011 07:54:49 +0100
Message-ID: <1315464889.4368.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] dbus: fix paths in startup script, use useradd.bbclass for user creation
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
X-List-Received-Date: Thu, 08 Sep 2011 06:59:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-07 at 20:58 -0700, Saul Wold wrote:
> On 09/07/2011 01:28 PM, Phil Blundell wrote:
> > Replace various hard-coded references to /usr, /var and /etc with symbolic equivalents.
> >
> > Also replace adhoc usage of adduser/addgroup with useradd.bbclass
> > functionality.  This should, in theory, remove the need for a postinst
> > to be run at boot time.
> >
> > Signed-off-by: Phil Blundell<philb@gnu.org>
> 
> This one seems to have some problems:
> 
> ERROR: Function 'useradd_sysroot' failed (see 
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825 
> for further information)
> ERROR: Logfile of failure stored in: 
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825
> Log data follows:
> | DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc', 
> 'bit-64', 'x86_64-linux', 'common']
> | ERROR: Function 'useradd_sysroot' failed (see 
> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/x86_64-poky-linux/dbus-1.4.12-r6/temp/log.do_install.19825 
> for further information)
> | Running groupadd commands...
> | sent invalidate(passwd) request, exiting
> | sent invalidate(group) request, exiting
> | sent invalidate(group) request, exiting
> | sent invalidate(passwd) request, exiting
> | sent invalidate(group) request, exiting
> | sent invalidate(group) request, exiting
> | Running useradd commands...
> | useradd: group messagebus exists - if you want to add this user to 
> that group, use -g.
> NOTE: package dbus-1.4.12-r6: task do_install: Failed

That sounds a bit like the useradd option parsing bug (in shadow-native)
that I mentioned the other day.  I had meant to send a patch for that
but I forgot. 

Do any other recipes which use useradd.bbclass work for you?

p.



