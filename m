Received: from smtp1.ingenico.com ([217.108.148.240])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Matthieu.CRAPET@ingenico.com>) id 1SsDB1-000770-1w
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 15:23:27 +0200
X-IronPort-AV: E=Sophos;i="4.77,623,1336341600"; d="scan'208";a="13337783"
Received: from frsnprexc1.usr.ingenico.loc ([10.23.2.11])
	by antispam1.usr.ingenico.loc with ESMTP; 20 Jul 2012 15:10:56 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 20 Jul 2012 15:10:55 +0200
Message-ID: <D9D7124626ED1E43963D86B2657D5CCD03A17BC8@FRSNPREXC1.usr.ingenico.loc>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Broken gettext/gdbm
Thread-Index: Ac1md/BvJw0tZocSTg6A1Ajz/crgfw==
From: "Matthieu CRAPET" <Matthieu.CRAPET@ingenico.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Broken gettext/gdbm
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
X-List-Received-Date: Fri, 20 Jul 2012 13:23:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings,

I updated my OE-core and bitbake today (2012.07.20). Build from scratch
fails:

<code>
NOTE: package gdbm-1.10-r3: task do_configure: Started
ERROR: Function failed: do_configure (see
/home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
emp/log.do_configure.31222 for further information)
ERROR: Logfile of failure stored in:
/home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
emp/log.do_configure.31222
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
'common']
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.1
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later
<http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| cp: cannot stat
`/home/.../build/tmp-eglibc/sysroots/rp02/usr/share/gettext/config.rpath
': No such file or directory
| ERROR: Function failed: do_configure (see
/home/.../build/tmp-eglibc/work/armv5te-ing-linux-gnueabi/gdbm-1.10-r3/t
emp/log.do_configure.31222 for further information)
NOTE: package gdbm-1.10-r3: task do_configure: Failed
</code>

gdbm needs gettext to have config.rpath. But gettext is not built, but
gettext-native & gettext-minimal-native are built.

Issue comes from  "meta/classes/autotools.bbclass":

<code>
        else if grep "^[[:space:]]*AM_GNU_GETTEXT" $CONFIGURE_AC
>/dev/null; then
                            # We'd call gettextize here if it wasn't so
broken...
          cp ${STAGING_DATADIR}/gettext/config.rpath
${AUTOTOOLS_AUXDIR}/
</code>

What would be the best workaround to take config.rpath from
gettext-native?

Thanks for support.

Regards,
Matthieu


