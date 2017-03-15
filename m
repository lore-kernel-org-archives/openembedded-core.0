Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 5022972F71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 16:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489596657; x=1521132657;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=fvnOLb8t84AWkG/f2lZWnP3QXk7vqsU3NVKH3Xn17TM=;
	b=XX1n38ySVR/2tvDkAHMYuOUu+pGNk0SHY0zYc6nU0nRz3NQW6+S//8rx
	0vnVB1VEUyVSMrIcw9FIb4tzkFfs5g==;
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 09:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,169,1486454400"; 
	d="asc'?scan'208";a="67693025"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by orsmga004.jf.intel.com with ESMTP; 15 Mar 2017 09:50:55 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170315100134.6461-1-patrick.ohly@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58C971C8.4090005@linux.intel.com>
Date: Wed, 15 Mar 2017 10:54:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20170315100134.6461-1-patrick.ohly@intel.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH] yocto-compat-layer: improve error handling in signature creation
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
X-List-Received-Date: Wed, 15 Mar 2017 16:50:55 -0000
X-Groupsio-MsgNum: 94788
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="n9DE1NTS5f01jHo8lI76tSGlLj19wQWbb"

--n9DE1NTS5f01jHo8lI76tSGlLj19wQWbb
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Acked-by:  An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

On 03/15/2017 04:01 AM, Patrick Ohly wrote:
> When "bitbake -k -S none world" failed, the error printed by
> yocto-compat-layer.py contained the stack trace multiple times and did =
not
> contain the stderr output from bitbake, making the error hard to unders=
tand
> and debug:
>=20
>   INFO: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   INFO: ERROR: test_signatures (common.CommonCompatLayer)
>   INFO: ---------------------------------------------------------------=
-------
>   INFO: Traceback (most recent call last):
>     File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 14=
4, in get_signatures
>       stderr=3Dsubprocess.PIPE)
>     File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
>       raise CalledProcessError(retcode, process.args, output=3Doutput)
>   subprocess.CalledProcessError: Command 'bitbake -k -S none world' ret=
urned non-zero exit status 1
>=20
>   During handling of the above exception, another exception occurred:
>=20
>   Traceback (most recent call last):
>     File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", lin=
e 51, in test_signatures
>       curr_sigs =3D get_signatures(self.td['builddir'], failsafe=3DTrue=
)
>     File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 14=
9, in get_signatures
>       raise RuntimeError(msg)
>   RuntimeError: Traceback (most recent call last):
>     File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 14=
4, in get_signatures
>       stderr=3Dsubprocess.PIPE)
>     File "/usr/lib/python3.4/subprocess.py", line 620, in check_output
>       raise CalledProcessError(retcode, process.args, output=3Doutput)
>   subprocess.CalledProcessError: Command 'bitbake -k -S none world' ret=
urned non-zero exit status 1
>=20
>   Loading cache...done.
>   Loaded 1328 entries from dependency cache.
>   NOTE: Resolving any missing task queue dependencies
>   NOTE: Runtime target 'zlib-qat' is unbuildable, removing...
>   Missing or unbuildable dependency chain was: ['zlib-qat']
>   ...
>   Summary: There were 5 ERROR messages shown, returning a non-zero exit=
 code.
>=20
> The yocto-compat-layer.log was incomplete, it only had the first part
> without the command output.
>=20
> stderr was missing due to stderr=3Dsubprocess.PIPE.
>=20
> Instead of the complicated try/except construct it's better to check
> the return code ourselves and raise just a single exception. The
> output (both on stderr and in the yocto-compat-layer.log) now is:
>=20
>   INFO: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   INFO: ERROR: test_signatures (common.CommonCompatLayer)
>   INFO: ---------------------------------------------------------------=
-------
>   INFO: Traceback (most recent call last):
>     File "/fast/work/poky/scripts/lib/compatlayer/cases/common.py", lin=
e 51, in test_signatures
>       curr_sigs =3D get_signatures(self.td['builddir'], failsafe=3DTrue=
)
>     File "/fast/work/poky/scripts/lib/compatlayer/__init__.py", line 14=
7, in get_signatures
>       raise RuntimeError(msg)
>   RuntimeError: Generating signatures failed. This might be due to some=
 parse error and/or general layer incompatibilities.
>   Command: bitbake -k -S none world
>   Output:
>   Loading cache...done.
>   Loaded 1328 entries from dependency cache.
>   NOTE: Resolving any missing task queue dependencies
>   ERROR: Nothing PROVIDES 'qat16' (but /fast/work/meta-intel/common/rec=
ipes-extended/openssl-qat/openssl-qat_0.4.9-009.bb DEPENDS on or otherwis=
e requires it)
>   ERROR: qat16 was skipped: incompatible with machine qemux86 (not in C=
OMPATIBLE_MACHINE)
>   ...
>   Missing or unbuildable dependency chain was: ['openssl-qat-dev']
>   ...
>   Summary: There were 5 ERROR messages shown, returning a non-zero exit=
 code.
>=20
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  scripts/lib/compatlayer/__init__.py | 20 +++++++++-----------
>  1 file changed, 9 insertions(+), 11 deletions(-)
>=20
> diff --git a/scripts/lib/compatlayer/__init__.py b/scripts/lib/compatla=
yer/__init__.py
> index b3a166aa9ab..a7eb8625310 100644
> --- a/scripts/lib/compatlayer/__init__.py
> +++ b/scripts/lib/compatlayer/__init__.py
> @@ -135,17 +135,15 @@ def get_signatures(builddir, failsafe=3DFalse):
> =20
>      sigs =3D {}
> =20
> -    try:
> -        cmd =3D 'bitbake '
> -        if failsafe:
> -            cmd +=3D '-k '
> -        cmd +=3D '-S none world'
> -        output =3D subprocess.check_output(cmd, shell=3DTrue,
> -                stderr=3Dsubprocess.PIPE)
> -    except subprocess.CalledProcessError as e:
> -        import traceback
> -        exc =3D traceback.format_exc()
> -        msg =3D '%s\n%s\n' % (exc, e.output.decode('utf-8'))
> +    cmd =3D 'bitbake '
> +    if failsafe:
> +        cmd +=3D '-k '
> +    cmd +=3D '-S none world'
> +    p =3D subprocess.Popen(cmd, shell=3DTrue,
> +                         stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess=
=2ESTDOUT)
> +    output, _ =3D p.communicate()
> +    if p.returncode:
> +        msg =3D "Generating signatures failed. This might be due to so=
me parse error and/or general layer incompatibilities.\nCommand: %s\nOutp=
ut:\n%s" % (cmd, output.decode('utf-8'))
>          raise RuntimeError(msg)
>      sigs_file =3D os.path.join(builddir, 'locked-sigs.inc')
> =20
>=20


--n9DE1NTS5f01jHo8lI76tSGlLj19wQWbb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYyXHKAAoJEGJqcE9h3glgMVsP/jth3igvlX+PyaIzR4UrTdkm
ROxamJQTiaRaReLtdHeEZ8Lvdsr1D0POTzGmJqIJPd6o7q0pWsmzuJJNHDfZ2LBg
abgPGpCKqL1uelb1gJUB3yYnjCh1cuffXjW3GuocYkWXQTgsfFxFKwZbSCtd2ZxW
ONlMdQG//AnFFdm7V7GUoltMZizzli2ihj4uZQ7JXxA2XsaS/wyxL5/s31QHGfKE
Xtp50mPEWCsDGGB1km0dUXUE1/96JwYdO5ZLrwmELcoFqYw0+7VapYcVJRR4RUP+
QPZgXu0+o6CBftcjN0OrfzQQw/apeDzWH0+h6bWcgsKZVUyEzqLlNBa4nVIJgklv
uuASip7gqkmj8be+rywtpiqtvcf2siqBxt4OSqKZVJvt4uiSRumWVIUn1wDLbMY4
TmxvShV+hEky3Ais5m3XRIb9KHCD1zJwsZ4QqLIP+o4WpoqqNrjyLFnF9DIgu9PI
YFKBM0KEslrOTafTHXV0k9qcsw4wXNK6yioBd3+wcFulMPyyqwUtJOjiv3qDEu5A
Ybdw9eMdcjGKgFTqkNoMEjH5nS6kOo2eeqf8awAjpVBCYUswMIfrcNWWjajwqAfW
z8VlrE3IWPK6HWXUYvySHRAsLULiyZPR2kI9n5UPViVDCrkwVGrVMExfeSNBXxyg
yjwm6RlT9EkaL6x+xEn7
=i/FY
-----END PGP SIGNATURE-----

--n9DE1NTS5f01jHo8lI76tSGlLj19wQWbb--
