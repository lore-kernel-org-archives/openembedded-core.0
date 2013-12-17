Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 454BC60CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 17:16:06 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id d49so3010584eek.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7ug7Ca41KVSHuSg43Fm6InWLvHf7BhdZHByXIUbaWzo=;
	b=p9WhrKIerIADhSp9kKWpuuCP1B6RqZHef6Q++L9x8gSIOdEBSZOPWICtEFUgAmKqEN
	xbuDPYs5Pq8nVCrWLy5Vr42v+QKR1LX7EojKxV2z2O3SMJ3WvD8p/13qIQ5biOag766W
	VdxkV7ROru2BIIiRaDy7qjrEeN2bXVcmIJxai3iZq9tu6/uYCcpuEw3u2Unq9FHfTTQr
	geXsMlrXDa/C1qT235tmlM6Kf2UG0nq9wb8C2Mb8Rp/xGi/8Qex0BMYCkVcesFchi4Za
	RGbAw/6rFq0Z5+TY+h2jVfsZN75GRCdljGo1YmU8LjPrn0/LNv/81vly/+AnFXKqawR0
	I6PA==
X-Received: by 10.14.47.130 with SMTP id t2mr24006596eeb.12.1387300566616;
	Tue, 17 Dec 2013 09:16:06 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm54794394eew.18.2013.12.17.09.16.04 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Dec 2013 09:16:05 -0800 (PST)
Date: Tue, 17 Dec 2013 18:16:35 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131217171635.GH3706@jama>
References: <cover.1387292119.git.paul.eggleton@linux.intel.com>
	<c98716e9ead1e1273ed03a9bc812d792ea38dc5b.1387292119.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <c98716e9ead1e1273ed03a9bc812d792ea38dc5b.1387292119.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] scripts/contrib: Add graph-tool
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
X-List-Received-Date: Tue, 17 Dec 2013 17:16:06 -0000
X-Groupsio-MsgNum: 48287
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9s922KAXlWjPfK/Q"
Content-Disposition: inline

--9s922KAXlWjPfK/Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2013 at 02:56:21PM +0000, Paul Eggleton wrote:
> A simple script I put together for getting the paths from one node to
> another in a dot graph. This is useful for example in working out why
> a particular recipe is getting built in conjunction with dot graph files
> produced by bitbake -g.
>=20
> For example:
>=20
> $ bitbake -g core-image-minimal
> ...
> $ graph-tool find-paths pn-depends.dot core-image-minimal sqlite3-native
> core-image-minimal -> packagegroup-core-boot -> udev -> libxslt-native ->=
 libxml2-native -> python-native -> sqlite3-native

Nice addition, thanks.

Can it show multiple paths? Maybe it would be better example to show it
on multiple-path case.

As future improvement it would be nice to be able to filter some paths,
e.g. sometimes I'm interested in runtime-dependencies, sometimes finding
path through runtime isn't enough (e.g. when my recipe has runtime
dependency of "foo" but actually needs "foo" at build time).

> Partially addresses [YOCTO #3362].
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/contrib/graph-tool | 92 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 92 insertions(+)
>  create mode 100755 scripts/contrib/graph-tool
>=20
> diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
> new file mode 100755
> index 0000000..6dc7d33
> --- /dev/null
> +++ b/scripts/contrib/graph-tool
> @@ -0,0 +1,92 @@
> +#!/usr/bin/env python
> +
> +# Simple graph query utility
> +# useful for getting answers from .dot files produced by bitbake -g
> +#
> +# Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
> +#
> +# Copyright 2013 Intel Corporation
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License version 2 as
> +# published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License along
> +# with this program; if not, write to the Free Software Foundation, Inc.,
> +# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +#
> +
> +import sys
> +
> +def get_path_networkx(dotfile, fromnode, tonode):
> +    try:
> +        import networkx
> +    except ImportError:
> +        print('ERROR: Please install the networkx python module')
> +        sys.exit(1)
> +
> +    graph =3D networkx.DiGraph(networkx.read_dot(dotfile))
> +
> +    def node_missing(node):
> +        import difflib
> +        close_matches =3D difflib.get_close_matches(node, graph.nodes(),=
 cutoff=3D0.7)
> +        if close_matches:
> +            print('ERROR: no node "%s" in graph. Close matches:\n  %s' %=
 (node, '\n  '.join(close_matches)))
> +        sys.exit(1)
> +
> +    if not fromnode in graph:
> +        node_missing(fromnode)
> +    if not tonode in graph:
> +        node_missing(tonode)
> +    return networkx.all_simple_paths(graph, source=3Dfromnode, target=3D=
tonode)
> +
> +
> +def find_paths(args, usage):
> +    if len(args) < 3:
> +        usage()
> +        sys.exit(1)
> +
> +    fromnode =3D args[1]
> +    tonode =3D args[2]
> +    paths =3D list(get_path_networkx(args[0], fromnode, tonode))
> +    if paths:
> +        for path in paths:
> +            print ' -> '.join(path)
> +    else:
> +        print("ERROR: no path from %s to %s in graph" % (fromnode, tonod=
e))
> +        sys.exit(1)
> +
> +def main():
> +    import optparse
> +    parser =3D optparse.OptionParser(
> +        usage =3D '''%prog [options] <command> <arguments>
> +
> +Available commands:
> +    find-paths <dotfile> <from> <to>
> +        Find all of the paths between two nodes in a dot graph''')
> +
> +    #parser.add_option("-d", "--debug",
> +    #        help =3D "Report all SRCREV values, not just ones where AUT=
OREV has been used",
> +    #        action=3D"store_true", dest=3D"debug", default=3DFalse)
> +
> +    options, args =3D parser.parse_args(sys.argv)
> +    args =3D args[1:]
> +
> +    if len(args) < 1:
> +        parser.print_help()
> +        sys.exit(1)
> +
> +    if args[0] =3D=3D "find-paths":
> +        find_paths(args[1:], parser.print_help)
> +    else:
> +        parser.print_help()
> +        sys.exit(1)
> +
> +
> +if __name__ =3D=3D "__main__":
> +    main()
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9s922KAXlWjPfK/Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKwhvMACgkQN1Ujt2V2gBzYmACZAc6gn9d5r8xHbVJYLXfjlTJt
mLkAn0hTmoFOvFP3qNSHASh3dClm7lcf
=dMHi
-----END PGP SIGNATURE-----

--9s922KAXlWjPfK/Q--
