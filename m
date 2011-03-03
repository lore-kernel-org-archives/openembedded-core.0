Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pv2m5-0000BD-Qj
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 08:16:37 +0100
Received: by fxm8 with SMTP id 8so826880fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Mar 2011 23:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ECGVeo0nrdHSJiZo4zvE6Gmw0kpQUyvDz3B0PH+a6yY=;
	b=J5DSI8JJOjDKxewl67kK7oAJ+CiWLg8yVV4qdKiTSBZeBJTNlNiT6h/73sOnGx0eXE
	DmZrkTpuR/Ys8oSLp9JLUxOK7ehQquVQz3bOcTBJ2KLxnjfJSgQx3EurD3AZt2jrUsPf
	Tx/Mma+p55UC/fECbgJ0UYP13iXWxRfBEaiAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aB2YgzrQFRfGwrppApSwqgvCij5xKj/Ip4mqUQSQ3Ek8ZSHWB9DCpgKWBja2UzT8AH
	afhH2x9XdT5pHlzkLfI5UT4hJQEKF88lOsCh4r83GkVzlJmcmdP4tz/2BoUy0at2Cfbh
	5HqCPQxIpZhARWeqdqodw7nzdRCkYX/b7JbHg=
Received: by 10.223.98.193 with SMTP id r1mr1014041fan.89.1299136509868;
	Wed, 02 Mar 2011 23:15:09 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a15sm412952faw.1.2011.03.02.23.15.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 Mar 2011 23:15:08 -0800 (PST)
Date: Thu, 3 Mar 2011 08:15:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110303071506.GA419@jama.jama.net>
References: <1299135167-18330-1-git-send-email-raj.khem@gmail.com>
	<1299135167-18330-5-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1299135167-18330-5-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCHv3 4/6] sanity.bbclass: Check for /proc/sys/vm/mmap_min_addr to be >= 65536
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
X-List-Received-Date: Thu, 03 Mar 2011 07:16:37 -0000
X-Groupsio-MsgNum: 159
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2011 at 10:52:45PM -0800, Khem Raj wrote:
> * Now qemu can handle lower values we can chnage this sanity test
>   to check of values if less than 65536
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/sanity.bbclass |   10 ++++++----
>  1 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 13940f8..aae5028 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -170,10 +170,12 @@ def check_sanity(e):
>          # This path is no longer user-readable in modern (very recent) L=
inux
>          try:
>              if os.path.exists("/proc/sys/vm/mmap_min_addr"):
> -                f =3D file("/proc/sys/vm/mmap_min_addr", "r")
> -                if (f.read().strip() !=3D "0"):
> -                        messages =3D messages + "/proc/sys/vm/mmap_min_a=
ddr is not 0. This will cause problems with qemu so please fix the value (a=
s root).\n\nTo fix this in later reboots, set vm.mmap_min_addr =3D 0 in /et=
c/sysctl.conf.\n"
> -                f.close()
> +                f =3D open("/proc/sys/vm/mmap_min_addr", "r")
> +                try:
> +                    if (int(f.read().strip()) < 65536):
> +                        messages =3D messages + "/proc/sys/vm/mmap_min_a=
ddr is not >=3D 65536. This will cause problems with qemu so please fix the=
 value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr =3D=
 65536 in /etc/sysctl.conf.\n"
> +                finally:
> +                    f.close()
>          except:
>              pass
> =20

corner cases when it cannot be read are with kernel between

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
it;h=3D0e1a6ef2dea88101b056b6d9984f3325c5efced3
2.6.33-rc2-0e1a6ef2dea88101b056b6d9984f3325c5efced3

and

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3Dcomm=
it;h=3D822cceec7248013821d655545ea45d1c6a9d15b3
2.6.34-rc3-822cceec7248013821d655545ea45d1c6a9d15b3

see:
http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg02=
340.html

Don't know if any large distribution is using 2.6.34 without that 2nd
patch backported.

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk1vP/oACgkQN1Ujt2V2gBwFuQCfZEcQYfKqh99SjVY5yE+UNckC
1x4An0W1GCdUn8fBUNXMMknwMLfv/7I5
=2pNE
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
