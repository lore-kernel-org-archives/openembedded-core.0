Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA0671A01
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Oct 2016 16:46:00 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP; 04 Oct 2016 09:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,444,1473145200"; 
	d="asc'?scan'208";a="16094523"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.33]) ([10.219.5.33])
	by fmsmga006.fm.intel.com with ESMTP; 04 Oct 2016 09:46:01 -0700
To: openembedded-core@lists.openembedded.org
References: <1475599553-21057-1-git-send-email-anibal.limon@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <57F3DD02.4090300@linux.intel.com>
Date: Tue, 4 Oct 2016 11:46:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1475599553-21057-1-git-send-email-anibal.limon@linux.intel.com>
Cc: joshua.g.lock@intel.com, clarson@kergoth.com
Subject: Re: [PATCH] classes/sstate.bbclass: Enable thread lock when checkstatus
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
X-List-Received-Date: Tue, 04 Oct 2016 16:46:01 -0000
X-Groupsio-MsgNum: 87879
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="M9oHk6wTUP76gi2xGPXE2h7K7Go6W5LCV"

--M9oHk6wTUP76gi2xGPXE2h7K7Go6W5LCV
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch depends on bitbake one,

http://lists.openembedded.org/pipermail/bitbake-devel/2016-October/008129=
=2Ehtml

Cheers,
	alimon

On 10/04/2016 11:45 AM, An=C3=ADbal Lim=C3=B3n wrote:
> The checkstatus function fires an event to notify bitbake UI about
> the progress of the task, this function is implemented using ThreadPool=

> and is causing event lose when multiple threads tries to fire an event
> (writes over socket/fd).
>=20
> [YOCTO #10330]
>=20
> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/sstate.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 6f0c791..172384b 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -851,15 +851,19 @@ def sstate_checkhashes(sq_fn, sq_task, sq_hash, s=
q_hashfn, d, siginfo=3DFalse):
> =20
>          if tasklist:
>              bb.event.fire(bb.event.ProcessStarted("Checking sstate mir=
ror object availability", len(tasklist)), d)
> +
>              import multiprocessing
>              nproc =3D min(multiprocessing.cpu_count(), len(tasklist))
> =20
> +            bb.event.enable_threadlock()
>              pool =3D oe.utils.ThreadedPool(nproc, len(tasklist),
>                      worker_init=3Dcheckstatus_init, worker_end=3Dcheck=
status_end)
>              for t in tasklist:
>                  pool.add_task(checkstatus, t)
>              pool.start()
>              pool.wait_completion()
> +            bb.event.disable_threadlock()
> +
>              bb.event.fire(bb.event.ProcessFinished("Checking sstate mi=
rror object availability"), d)
>              if whitelist and missing:
>                  bb.fatal('Required artifacts were unavailable - exitin=
g')
>=20


--M9oHk6wTUP76gi2xGPXE2h7K7Go6W5LCV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJX890EAAoJEGJqcE9h3glgoKcP/2LEXmT4zk7eIp+Ll+9x2zh5
jpIl++57GvE7phRWrNPxgfyiSTiNijO59bQ7/1sGJtS9tSoPT/uPVtuYtTeXusmY
saUda9LUN8Gonn60drocnJQafB32w8ATooztT4CbnKvaa0yBYZ8sMloSToZJaWFx
AG5Map4qvivFWgD7fuR47ZK3pumlATG2HBddQ6HnCvD8s7RJi7wMZFyA0EFTjlXX
ydtLZp0K1+CHJQCnn1B7DN/KymdWL3zjGvbqZ1bSONBTUMAV3vIlihczJqBrQd12
C2/7AIlXMKhenI6++R9HBuwYHhzjCHIg0j5goj8/bGzov0CgrpQ33aJUWrysVUyg
J1OesZdaDpv6eT5U3VKx1/FP7kV7Cwx6VFBix3Sx4HkPJ9WpvXDVkHBy4DM1u3I4
Vr7KkM2TF1OUHoVpEXITgQ986czIr/C/L6YkgJc6HG5IurGY58zWRjVzwztxK8/c
YoyfnEfuyPeVHL1EGT+QhYCijyhLJSeoI7k7T86KAcsr8c0tNB8Bl+GDXxfrwKLd
j8YIod+IuH/wdcn73rYe1754je61025B/GS6ffFnzkfRdzFILx6hMs6vjicp0aF4
EmpAlHfDAonEBcLE1PzT72AvkG2oHIEafCmaNul0AL8WA9p7f53qoblyjtoKtl2V
nI/ljcnDmqS1hCUd7Sq1
=1tP8
-----END PGP SIGNATURE-----

--M9oHk6wTUP76gi2xGPXE2h7K7Go6W5LCV--
