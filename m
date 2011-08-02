Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1+v5U7A3/K6icvl+nYupTUhGDo4cimZ+IU=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QoH5X-0005Lq-41
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:40:59 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p72Faa0a031891;
	Tue, 2 Aug 2011 10:36:36 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <3C9A62B9-7C88-4DF0-A379-8E58955B89CD@kernel.crashing.org>
Date: Tue, 2 Aug 2011 10:36:35 -0500
Message-Id: <A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
References: <3C9A62B9-7C88-4DF0-A379-8E58955B89CD@kernel.crashing.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: help with gcc-configure-common bug
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
X-List-Received-Date: Tue, 02 Aug 2011 15:40:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 1, 2011, at 1:58 PM, Kumar Gala wrote:

> I'm trying to track down a bug related the following in =
gcc-configure-common.inc.  I know there is one bug in the sed line, but =
when I fix that I run into a second issue.  I'm trying to understand =
what we think the following two lines are trying to attempt:
>=20
>        SYSTEMLIBS_DIR=3D`dirname ${SYSTEMLIBS}`
>        [ "$SYSTEMLIBS_DIR" =3D "/" ] && SYSTEMLIBS_DIR=3D""
>=20
> any ideas?
>=20
>> =46rom the commit log we expect something like:
>        #define GLIBC_DYNAMIC_LINKER64 =
SYSTEMLIBS_DIR"/ld-linux-x86-64.so.2"
>        and we define SYSTEMLIBS_DIR in defaults.h.
>=20
> so its seems if SYSTEMLIBS =3D 'lib', that we end up with:
> 	#define SYSTEMLIBS ""
>=20
> and thus becomes:
> 	GLIBC_DYNAMIC_LINKER64 "ld-linux-x86-64.so.2"
>=20
> which ends up being wrong.
>=20
> - k
>=20
> do_configure_prepend () {
>        # Change the default dynamic linker path, only useful for SDK, =
other's value
>        # are not changed according to the SYSTEMLIBS_DIR
>        sed -i ${S}/gcc/config/*/linux*.h -e \
>                's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 =
SYSTEMLIBS_DIR\2#'
>=20
>        SYSTEMLIBS_DIR=3D`dirname ${SYSTEMLIBS}`
>        [ "$SYSTEMLIBS_DIR" =3D "/" ] && SYSTEMLIBS_DIR=3D""
>        # teach gcc to find correct target includedir when checking =
libc ssp support
>        mkdir -p ${B}/gcc
>        echo "NATIVE_SYSTEM_HEADER_DIR =3D ${SYSTEMHEADERS}" > =
${B}/gcc/t-oe
>        cat ${S}/gcc/defaults.h | grep -v "\#endif.*GCC_DEFAULTS_H" > =
${B}/gcc/defaults.h.new
>        cat >>${B}/gcc/defaults.h.new <<_EOF
> #ifndef STANDARD_INCLUDE_DIR
> #define STANDARD_INCLUDE_DIR "${SYSTEMHEADERS}"
> #endif
> #ifndef STANDARD_STARTFILE_PREFIX_1
> #define STANDARD_STARTFILE_PREFIX_1 "${SYSTEMLIBS}"
> #endif
> #ifndef STANDARD_STARTFILE_PREFIX_2
> #define STANDARD_STARTFILE_PREFIX_2 "${SYSTEMLIBS1}"
> #endif
> #define SYSTEMLIBS_DIR "$SYSTEMLIBS_DIR"
> #endif /* ! GCC_DEFAULTS_H */
> _EOF
>        mv ${B}/gcc/defaults.h.new ${B}/gcc/defaults.h
> }

Would really love if anyone knows what is suppose to be going on with =
SYSTEMLIBS_DIR to chime in here.

- k=


