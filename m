Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2152977B6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 09:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C406318149;
	Fri, 12 May 2017 11:43:20 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id xPYQbXazejx3; Fri, 12 May 2017 11:43:19 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2DDC1184F6;
	Fri, 12 May 2017 11:43:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 111CA1A070;
	Fri, 12 May 2017 11:43:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 056D81A06F;
	Fri, 12 May 2017 11:43:19 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 12 May 2017 11:43:18 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id EDAF2314E;
	Fri, 12 May 2017 11:43:18 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 12 May 2017 11:43:18 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 12 May 2017 11:43:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 4/4] useradd: Create lib/oe/useradd function
	library
Thread-Index: AQHSyvhGxaAHny7NSEiShlNOKtuCSKHwXUZQ
Date: Fri, 12 May 2017 09:43:18 +0000
Message-ID: <950e92fcfac947eb93d9d5c81b342292@XBOX02.axis.com>
References: <1494576982-6006-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1494576982-6006-4-git-send-email-richard.purdie@linuxfoundation.org>
In-Reply-To: <1494576982-6006-4-git-send-email-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] useradd: Create lib/oe/useradd function	library
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
X-List-Received-Date: Fri, 12 May 2017 09:43:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 12 maj 2017 10:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 4/4] useradd: Create lib/oe/useradd function
> library
>=20
> The code in useradd-staticids is generally useful for user addition
> functionality but is not reusable in its current form. Refactor the
> code into a set of library functions.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/useradd-staticids.bbclass | 47 +++--------------------
>  meta/lib/oe/useradd.py                 | 70
> ++++++++++++++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 41 deletions(-)
>  create mode 100644 meta/lib/oe/useradd.py
>=20
> diff --git a/meta/classes/useradd-staticids.bbclass
> b/meta/classes/useradd-staticids.bbclass
> index 2d282c0..615136c 100644
> --- a/meta/classes/useradd-staticids.bbclass
> +++ b/meta/classes/useradd-staticids.bbclass
> @@ -1,7 +1,6 @@
>  # In order to support a deterministic set of 'dynamic' users/groups,
>  # we need a function to reformat the params based on a static file
>  def update_useradd_static_config(d):
> -    import argparse
>      import itertools
>      import re
>      import errno
> @@ -59,31 +58,7 @@ def update_useradd_static_config(d):
>=20
>      # We parse and rewrite the useradd components
>      def rewrite_useradd(params, is_pkg):
> -        # The following comes from --help on useradd from shadow
> -        parser =3D myArgumentParser(prog=3D'useradd')
> -        parser.add_argument("-b", "--base-dir", metavar=3D"BASE_DIR",
> help=3D"base directory for the home directory of the new account")
> -        parser.add_argument("-c", "--comment", metavar=3D"COMMENT",
> help=3D"GECOS field of the new account")
> -        parser.add_argument("-d", "--home-dir", metavar=3D"HOME_DIR",
> help=3D"home directory of the new account")
> -        parser.add_argument("-D", "--defaults", help=3D"print or change
> default useradd configuration", action=3D"store_true")
> -        parser.add_argument("-e", "--expiredate",
> metavar=3D"EXPIRE_DATE", help=3D"expiration date of the new account")
> -        parser.add_argument("-f", "--inactive", metavar=3D"INACTIVE",
> help=3D"password inactivity period of the new account")
> -        parser.add_argument("-g", "--gid", metavar=3D"GROUP", help=3D"na=
me
> or ID of the primary group of the new account")
> -        parser.add_argument("-G", "--groups", metavar=3D"GROUPS",
> help=3D"list of supplementary groups of the new account")
> -        parser.add_argument("-k", "--skel", metavar=3D"SKEL_DIR",
> help=3D"use this alternative skeleton directory")
> -        parser.add_argument("-K", "--key", metavar=3D"KEY=3DVALUE",
> help=3D"override /etc/login.defs defaults")
> -        parser.add_argument("-l", "--no-log-init", help=3D"do not add
> the user to the lastlog and faillog databases", action=3D"store_true")
> -        parser.add_argument("-m", "--create-home", help=3D"create the
> user's home directory", action=3D"store_const", const=3DTrue)
> -        parser.add_argument("-M", "--no-create-home",
> dest=3D"create_home", help=3D"do not create the user's home directory",
> action=3D"store_const", const=3DFalse)
> -        parser.add_argument("-N", "--no-user-group",
> dest=3D"user_group", help=3D"do not create a group with the same name as
> the user", action=3D"store_const", const=3DFalse)
> -        parser.add_argument("-o", "--non-unique", help=3D"allow to
> create users with duplicate (non-unique UID)", action=3D"store_true")
> -        parser.add_argument("-p", "--password", metavar=3D"PASSWORD",
> help=3D"encrypted password of the new account")
> -        parser.add_argument("-P", "--clear-password",
> metavar=3D"CLEAR_PASSWORD", help=3D"use this clear password for the new
> account")
> -        parser.add_argument("-R", "--root", metavar=3D"CHROOT_DIR",
> help=3D"directory to chroot into")
> -        parser.add_argument("-r", "--system", help=3D"create a system
> account", action=3D"store_true")
> -        parser.add_argument("-s", "--shell", metavar=3D"SHELL",
> help=3D"login shell of the new account")
> -        parser.add_argument("-u", "--uid", metavar=3D"UID", help=3D"user
> ID of the new account")
> -        parser.add_argument("-U", "--user-group", help=3D"create a group
> with the same name as the user", action=3D"store_const", const=3DTrue)
> -        parser.add_argument("LOGIN", help=3D"Login name of the new
> user")
> +        parser =3D oe.useradd.build_useradd_parser()
>=20
>          # Return a list of configuration files based on either the
> default
>          # files/passwd or the contents of USERADD_UID_TABLES
> @@ -100,12 +75,12 @@ def update_useradd_static_config(d):
>=20
>          newparams =3D []
>          users =3D None
> -        for param in re.split('''[ \t]*;[
> \t]*(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
> +        for param in oe.useradd.useradd_splitargs2(params):
>              param =3D param.strip()
>              if not param:
>                  continue
>              try:
> -                uaargs =3D parser.parse_args(re.split('''[
> \t]+(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
> +                uaargs =3D
> parser.parse_args(oe.useradd.useradd_splitargs(param))
>              except:
>                  bb.fatal("%s: Unable to parse arguments for
> USERADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
>=20
> @@ -213,17 +188,7 @@ def update_useradd_static_config(d):
>=20
>      # We parse and rewrite the groupadd components
>      def rewrite_groupadd(params, is_pkg):
> -        # The following comes from --help on groupadd from shadow
> -        parser =3D myArgumentParser(prog=3D'groupadd')
> -        parser.add_argument("-f", "--force", help=3D"exit successfully
> if the group already exists, and cancel -g if the GID is already used",
> action=3D"store_true")
> -        parser.add_argument("-g", "--gid", metavar=3D"GID", help=3D"use
> GID for the new group")
> -        parser.add_argument("-K", "--key", metavar=3D"KEY=3DVALUE",
> help=3D"override /etc/login.defs defaults")
> -        parser.add_argument("-o", "--non-unique", help=3D"allow to
> create groups with duplicate (non-unique) GID", action=3D"store_true")
> -        parser.add_argument("-p", "--password", metavar=3D"PASSWORD",
> help=3D"use this encrypted password for the new group")
> -        parser.add_argument("-P", "--clear-password",
> metavar=3D"CLEAR_PASSWORD", help=3D"use this clear password for the new
> group")
> -        parser.add_argument("-R", "--root", metavar=3D"CHROOT_DIR",
> help=3D"directory to chroot into")
> -        parser.add_argument("-r", "--system", help=3D"create a system
> account", action=3D"store_true")
> -        parser.add_argument("GROUP", help=3D"Group name of the new
> group")
> +        parser =3D oe.useradd.build_groupadd_parser()
>=20
>          # Return a list of configuration files based on either the
> default
>          # files/group or the contents of USERADD_GID_TABLES
> @@ -240,13 +205,13 @@ def update_useradd_static_config(d):
>=20
>          newparams =3D []
>          groups =3D None
> -        for param in re.split('''[ \t]*;[
> \t]*(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', params):
> +        for param in oe.useradd.useradd_splitargs2(params):
>              param =3D param.strip()
>              if not param:
>                  continue
>              try:
>                  # If we're processing multiple lines, we could have
> left over values here...
> -                gaargs =3D parser.parse_args(re.split('''[
> \t]+(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', param))
> +                gaargs =3D
> parser.parse_args(oe.useradd.useradd_splitargs(param))
>              except:
>                  bb.fatal("%s: Unable to parse arguments for
> GROUPADD_PARAM_%s: '%s'" % (d.getVar('PN'), pkg, param))
>=20
> diff --git a/meta/lib/oe/useradd.py b/meta/lib/oe/useradd.py
> new file mode 100644
> index 0000000..52eebf0
> --- /dev/null
> +++ b/meta/lib/oe/useradd.py
> @@ -0,0 +1,70 @@
> +import argparse
> +import re
> +
> +class myArgumentParser( argparse.ArgumentParser ):
> +    def _print_message(self, message, file=3DNone):
> +        bb.warn("%s - %s: %s" % (d.getVar('PN'), pkg, message))
> +
> +    # This should never be called...
> +    def exit(self, status=3D0, message=3DNone):
> +        message =3D message or ("%s - %s: useradd.bbclass: Argument
> parsing exited" % (d.getVar('PN'), pkg))
> +        error(message)
> +
> +    def error(self, message):
> +        raise bb.build.FuncFailed(message)
> +
> +def useradd_splitargs(params):
> +    params =3D re.split('''[ \t]+(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''',
> params)
> +    # Remove any empty items
> +    return [x for x in params if x]
> +
> +
> +def useradd_splitargs2(params):
> +    params =3D re.split('''[ \t]*;[
> \t]+(?=3D(?:[^'"]|'[^']*'|"[^"]*")*$)''', params)
> +    # Remove any empty items
> +    return [x for x in params if x]
> +
> +def build_useradd_parser():
> +    # The following comes from --help on useradd from shadow
> +    parser =3D myArgumentParser(prog=3D'useradd')
> +    parser.add_argument("-b", "--base-dir", metavar=3D"BASE_DIR",
> help=3D"base directory for the home directory of the new account")
> +    parser.add_argument("-c", "--comment", metavar=3D"COMMENT",
> help=3D"GECOS field of the new account")
> +    parser.add_argument("-d", "--home-dir", metavar=3D"HOME_DIR",
> help=3D"home directory of the new account")
> +    parser.add_argument("-D", "--defaults", help=3D"print or change
> default useradd configuration", action=3D"store_true")
> +    parser.add_argument("-e", "--expiredate", metavar=3D"EXPIRE_DATE",
> help=3D"expiration date of the new account")
> +    parser.add_argument("-f", "--inactive", metavar=3D"INACTIVE",
> help=3D"password inactivity period of the new account")
> +    parser.add_argument("-g", "--gid", metavar=3D"GROUP", help=3D"name o=
r
> ID of the primary group of the new account")
> +    parser.add_argument("-G", "--groups", metavar=3D"GROUPS", help=3D"li=
st
> of supplementary groups of the new account")
> +    parser.add_argument("-k", "--skel", metavar=3D"SKEL_DIR", help=3D"us=
e
> this alternative skeleton directory")
> +    parser.add_argument("-K", "--key", metavar=3D"KEY=3DVALUE",
> help=3D"override /etc/login.defs defaults")
> +    parser.add_argument("-l", "--no-log-init", help=3D"do not add the
> user to the lastlog and faillog databases", action=3D"store_true")
> +    parser.add_argument("-m", "--create-home", help=3D"create the user's
> home directory", action=3D"store_const", const=3DTrue)
> +    parser.add_argument("-M", "--no-create-home", dest=3D"create_home",
> help=3D"do not create the user's home directory", action=3D"store_const",
> const=3DFalse)
> +    parser.add_argument("-N", "--no-user-group", dest=3D"user_group",
> help=3D"do not create a group with the same name as the user",
> action=3D"store_const", const=3DFalse)
> +    parser.add_argument("-o", "--non-unique", help=3D"allow to create
> users with duplicate (non-unique UID)", action=3D"store_true")
> +    parser.add_argument("-p", "--password", metavar=3D"PASSWORD",
> help=3D"encrypted password of the new account")
> +    parser.add_argument("-P", "--clear-password",
> metavar=3D"CLEAR_PASSWORD", help=3D"use this clear password for the new
> account")
> +    parser.add_argument("-R", "--root", metavar=3D"CHROOT_DIR",
> help=3D"directory to chroot into")
> +    parser.add_argument("-r", "--system", help=3D"create a system
> account", action=3D"store_true")
> +    parser.add_argument("-s", "--shell", metavar=3D"SHELL", help=3D"logi=
n
> shell of the new account")
> +    parser.add_argument("-u", "--uid", metavar=3D"UID", help=3D"user ID =
of
> the new account")
> +    parser.add_argument("-U", "--user-group", help=3D"create a group
> with the same name as the user", action=3D"store_const", const=3DTrue)
> +    parser.add_argument("LOGIN", help=3D"Login name of the new user")
> +
> +    return parser
> +
> +def build_groupadd_parser():
> +    # The following comes from --help on groupadd from shadow
> +    parser =3D myArgumentParser(prog=3D'groupadd')
> +    parser.add_argument("-f", "--force", help=3D"exit successfully if
> the group already exists, and cancel -g if the GID is already used",
> action=3D"store_true")
> +    parser.add_argument("-g", "--gid", metavar=3D"GID", help=3D"use GID
> for the new group")
> +    parser.add_argument("-K", "--key", metavar=3D"KEY=3DVALUE",
> help=3D"override /etc/login.defs defaults")
> +    parser.add_argument("-o", "--non-unique", help=3D"allow to create
> groups with duplicate (non-unique) GID", action=3D"store_true")
> +    parser.add_argument("-p", "--password", metavar=3D"PASSWORD",
> help=3D"use this encrypted password for the new group")
> +    parser.add_argument("-P", "--clear-password",
> metavar=3D"CLEAR_PASSWORD", help=3D"use this clear password for the new
> group")
> +    parser.add_argument("-R", "--root", metavar=3D"CHROOT_DIR",
> help=3D"directory to chroot into")
> +    parser.add_argument("-r", "--system", help=3D"create a system
> account", action=3D"store_true")
> +    parser.add_argument("GROUP", help=3D"Group name of the new group")
> +
> +    return parser
> +
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

I have an updated version of this patch that I have been using ever since y=
ou=20
first showed me this. It does some clean up and corrects one of the regular=
=20
expressions that had been incorrectly changed compared to the original work=
ing=20
version in useradd-staticids.bbclass. I will send it along in a minute.

//Peter


