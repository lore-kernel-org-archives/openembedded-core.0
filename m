Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f51.google.com (mail-ee0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 958D86AA20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 08:26:22 +0000 (UTC)
Received: by mail-ee0-f51.google.com with SMTP id d41so1153968eek.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 01:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PPrGZDoGRv1BbBINY5zAEYAECmvOplKJS3FLzx2zSdI=;
	b=xhUYMCpQBqmB5GLe30hKNGrSvdO0mXmQLWPgEzKGf6xXCWg4/Uoh9oy0ZbUo9n7+JS
	JQOk8tRnVsfWRGB8lV/XIBHz8HnCSCjc0afi1JSKT47ib3x37GpzWZtMl1Wzu8+kAw3T
	W+52rlnlEAYNQFsNA3MTU1hEeVw/7wiHXoGdSl+M5IQUDizRC4/2w3EZOz1i7u6cvYW8
	FmtY0Zh7/v43yFLO/e32lUoQFWhv0UurNXY30QAygK2C85S5K8BDBgFCKwmatOZjvvav
	jGEaAkM8fIaoKhZmpn8mlDBN3z6GKqmtAFGaXcFgYscC5DZ2/rsNfAKQHWmKcFG21pLC
	xZ+w==
X-Received: by 10.14.126.5 with SMTP id a5mr1807258eei.98.1383207983958;
	Thu, 31 Oct 2013 01:26:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id k7sm5490908eeg.13.2013.10.31.01.26.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Oct 2013 01:26:23 -0700 (PDT)
Date: Thu, 31 Oct 2013 09:26:25 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Xufeng Zhang <xufeng.zhang@windriver.com>
Message-ID: <20131031082625.GE32015@jama>
References: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1383182680-20871-1-git-send-email-xufeng.zhang@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Delay rm_work to run after do_bundle_initramfs
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
X-List-Received-Date: Thu, 31 Oct 2013 08:26:23 -0000
X-Groupsio-MsgNum: 46450
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HnQK338I3UIa/qiP"
Content-Disposition: inline

--HnQK338I3UIa/qiP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 31, 2013 at 09:24:40AM +0800, Xufeng Zhang wrote:
> From: "Signed-off-by: Xufeng Zhang" <xufeng.zhang@windriver.com>
>=20
> Since kernel will build twice when we are trying to bundle kernel
> and initramfs together after commit 609d5a9ab("kernel.bbclass,
> image.bbclass: Implement kernel INITRAMFS dependency and bundling"),
> thus, the second building for kernel would fail if rm_work is done
> previously.
>=20
> To fix this problem, we need to delay the rm_work task for kernel
> to run after do_bundle_initramfs task.
>=20
> [YOCTO #5416]
>=20
> Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index dedfab7..6154df0 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -29,6 +29,9 @@ python __anonymous () {
>      image_task =3D d.getVar('INITRAMFS_TASK', True)
>      if image_task:
>          d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
> +
> +    if image or image_task:
> +        d.appendVarFlag('do_rm_work', 'depends', " %s:do_bundle_initramf=
s" % d.getVar('PN', True))
>  }

Why not add "before" param to addtask?

addtask bundle_initramfs after do_compile before do_build

could do the trick

>  inherit kernel-arch deploy
> --=20
> 1.8.3.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HnQK338I3UIa/qiP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJyFDEACgkQN1Ujt2V2gBxEuwCfSU0019FiVuQbYWgxruPC1Hmm
bbcAn0saKJkOY3CxN//az6QfnqIU/6x7
=tFX4
-----END PGP SIGNATURE-----

--HnQK338I3UIa/qiP--
