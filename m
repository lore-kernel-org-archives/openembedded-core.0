Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 83616787DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 07:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 29762184DB;
	Fri, 23 Feb 2018 08:42:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6VUDmFsZH7A0; Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 466591847E;
	Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ADB21A08A;
	Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EAEC1A082;
	Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 123C51E15;
	Fri, 23 Feb 2018 08:42:35 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 23 Feb 2018 08:42:34 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Fri, 23 Feb 2018 08:42:34 +0100
Received: from XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a]) by
	XBOX04.axis.com ([fe80::6c88:230d:cafd:2f2a%22]) with mapi id
	15.00.1263.000; Fri, 23 Feb 2018 08:42:34 +0100
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/8] lib/oe/path: implement is_path_under()
Thread-Index: AQHTrFLY3U9EqY0MB0mydZwyWYCvfqOxmhBg
Date: Fri, 23 Feb 2018 07:42:34 +0000
Message-ID: <bb76902073b54d2bba0774471fd64543@XBOX04.axis.com>
References: <cover.1519354910.git.paul.eggleton@linux.intel.com>
	<e1e012bd3bb79e363b65b911f805989301f4188f.1519354910.git.paul.eggleton@linux.intel.com>
In-Reply-To: <e1e012bd3bb79e363b65b911f805989301f4188f.1519354910.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/8] lib/oe/path: implement is_path_under()
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
X-List-Received-Date: Fri, 23 Feb 2018 07:49:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Paul Eggleton
> Sent: den 23 februari 2018 04:02
> To: openembedded-core@lists.openembedded.org
>=20
<snip>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/lib/oe/path.py | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/meta/lib/oe/path.py b/meta/lib/oe/path.py index
> 1ea03d5d568..346b48f3641 100644
> --- a/meta/lib/oe/path.py
> +++ b/meta/lib/oe/path.py
> @@ -237,3 +237,27 @@ def realpath(file, root, use_physdir =3D True, loop_=
cnt
> =3D 100, assume_dir =3D False)
>          raise
>=20
>      return file
> +
> +def is_path_under(path1, possible_parent):

Changing the signature to is_path_under(possible_parent, *paths) will make =
the list management more natural.

This function will return True if path1 is the empty list. Is that intentio=
nal?

/Ola Nilsson

> +    """
> +    Return True if a path is underneath another, False otherwise.
> +    Multiple paths to test can be specified (as a list or tuple) in
> +    which case all specified test paths must be under the parent to
> +    return True.
> +    """
> +    def abs_path_trailing(pth):
> +        pth_abs =3D os.path.abspath(pth)
> +        if not pth_abs.endswith(os.sep):
> +            pth_abs +=3D os.sep
> +        return pth_abs
> +
> +    possible_parent_abs =3D abs_path_trailing(possible_parent)
> +    if isinstance(path1, str):
> +        testpaths =3D [path1]
> +    else:
> +        testpaths =3D path1
> +    for path in testpaths:
> +        path_abs =3D abs_path_trailing(path)
> +        if not path_abs.startswith(possible_parent_abs):
> +            return False
> +    return True
> --
> 2.14.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

