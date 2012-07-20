Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsExp-0000uS-LK for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:17:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KF6ZfP013043
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:06:35 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09727-08 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:06:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KF6QtT013037
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:06:28 +0100
Message-ID: <1342796791.21788.30.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 16:06:31 +0100
In-Reply-To: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc>
References: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Broken gettext/gdbm
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
X-List-Received-Date: Fri, 20 Jul 2012 15:17:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 15:10 +0200, Matthieu CRAPET wrote:
> Greetings,
> 
> I updated my OE-core and bitbake today (2012.07.20). Build from scratch
> fails:
> 
> <code>
> NOTE: package gdbm-1.10-r3: task do_configure: Started
> ERROR: Function failed: do_configure (see
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
> emp/log.do_configure.31222 for further information)
> ERROR: Logfile of failure stored in:
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
> emp/log.do_configure.31222
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.12.1
> | Copyright (C) 2012 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.12
> | cp: cannot stat
> `/home/.../build/tmp-eglibc/sysroots/rp02/usr/share/gettext/config.rpath
> ': No such file or directory
> | ERROR: Function failed: do_configure (see
> /home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
> emp/log.do_configure.31222 for further information)
> NOTE: package gdbm-1.10-r3: task do_configure: Failed
> </code>
> 
> gdbm needs gettext to have config.rpath. But gettext is not built, but
> gettext-native & gettext-minimal-native are built.
> 
> Issue comes from  "meta/classes/autotools.bbclass":
> 
> <code>
>         else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC
> >/dev/null; then
>                             # We'd call gettextize here if it wasn't so
> broken...
>           cp ${STAGING_DATADIR}/gettext/config.rpath
> ${AUTOTOOLS_AUXDIR}/
> </code>
> 
> What would be the best workaround to take config.rpath from
> gettext-native?

This is odd since gdbm inherits gettext and therefore should have a
DEPENDS on virtual/gettext. gettext should therefore have been built.

Any idea why gettext wasn't built?

bitbake gdbm -e | grep ^DEPENDS

shows virtual/gettext here...

Cheers,

Richard



