Received: from mail-pa0-f46.google.com ([209.85.220.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US9eW-0001fL-56
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 19:26:49 +0200
Received: by mail-pa0-f46.google.com with SMTP id lb1so448931pab.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 10:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=q6VJo+CPC2HLilhD+LAeOzTpl4C/5vQgx33K6LQpFi0=;
	b=QV8xPlFMwGBHRwY7YiPaT+qDpVaupL/LEAmb+FdUxBIHjT3Wa7HcU+Fe2AIiJGMC97
	iHcJ9C5uECR5Su9tBpHaFzQ0Hir6Vi8n3Emfo5d0gQolGWbK+1xej1EEGEANcJ5BOOm3
	rIqviq+CtcKozZ6V/NGtX3jOKXR9DW7FFZxfmXTbulo4j2ZcksWDkrV7gkKjHZccmyXH
	v6b+Fa61iLD+NWf1sUwv8bUwaaqMSKJ/MaF1rNFPLMM+U0Ccn2wzF4eNwy5ASpfuPRd8
	6e8RvaLFBsPkJZx6MRXf+rXDPTHyGv4TA1r+ma5U2eY6/d1SFtIs7Lcl64m5MDF4dDdH
	2J1Q==
X-Received: by 10.68.95.133 with SMTP id dk5mr4443838pbb.171.1366132152749;
	Tue, 16 Apr 2013 10:09:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id n6sm2781783pbn.6.2013.04.16.10.09.09
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 10:09:11 -0700 (PDT)
Date: Tue, 16 Apr 2013 19:09:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130416170909.GR10628@jama.dyndns-home.com>
References: <cover.1365797632.git.paul.eggleton@linux.intel.com>
	<30edf2f0744b6ce209455d2c5c63015e06f09265.1365797632.git.paul.eggleton@linux.intel.com>
	<20130412211005.GY2477@jama> <1365802242.16702.71.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1365802242.16702.71.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] classes/sanity: fix handling of bblayers.conf updating
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 17:26:49 -0000
X-Groupsio-MsgNum: 38030
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tV/+6PImfyFtriLg"
Content-Disposition: inline

--tV/+6PImfyFtriLg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 10:30:42PM +0100, Richard Purdie wrote:
> On Fri, 2013-04-12 at 23:10 +0200, Martin Jansa wrote:
> > On Fri, Apr 12, 2013 at 09:16:51PM +0100, Paul Eggleton wrote:
> > > Fix the fairly long-standing problem of treating a newer bblayers.conf
> > > in the same manner as an older one (reporting that it had been updated
> > > even if nothing was done). The recent work to do a reparse without
> > > having to manually re-run bitbake turned this from an annoyance into =
an
> > > endless loop, so it had to be fixed.
> >=20
> > Is this endless loop, bitbake hanging forever while parsing or was it
> > showing something or failing soon with endless loop detected by python?
>=20
> You'd see nothing at all, you'd run "bitbake X" and it would just sit
> there indefinitely in a loop.
>=20
> It could be triggered by including meta-yocto but not setting
> DISTRO=3Dpoky* in a build dir where DISTRO=3Dpoky* has previously been us=
ed.

OK, so it's different than hangs I'm seeing here, because I'm still seeing =
them with latest oe-core

$ . ./oe-init-bitbake-build-env && bitbake my-image
Altered environment for machine@distro development (this is from oe-init-bi=
tbake-build-env)
# and nothing else is shown after that

ps auxf (shortened paths and ascii tree)

bitbake  17625  0.0  0.0   4396   612 pts/18   S+   18:31   0:00  \_ /bin/s=
h -c . ./oe-init-bitbake-build-env && bitbake  my-image
bitbake  17626  0.0  0.0   4396   700 pts/18   S+   18:31   0:00     \_ /bi=
n/sh /OE/build/oe-core/scripts/bitbake my-image
bitbake  17656  0.2  1.0 219356 168120 pts/18  S+   18:31   0:02        \_ =
python /OE/build/bitbake/bin/bitbake my-image
bitbake  18504  0.0  1.0 289044 166556 pts/18  Sl+  18:31   0:00           =
\_ python /OE/build/bitbake/bin/bitbake my-image

Not sure if there is better way to see what's going on in those python proc=
esses, here is strace:

# strace -p 17656
Process 17656 attached
wait4(18504,=20

# strace -p 18504
Process 18504 attached
recvfrom(12,=20

Hitting Ctrl+C with strace still running:
# strace -p 17656
Process 17656 attached
wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restarted =
if SA_RESTART is set)
--- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D12337=
, ptr=3D0x3031}} ---
wait4(18504,

Process 18504 attached
recvfrom(12, 0xb773684, 8192, 0, 0, 0)  =3D ? ERESTARTSYS (To be restarted =
if SA_RESTART is set)
--- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D12337=
, ptr=3D0x3031}} ---
rt_sigreturn()                          =3D -1 EINTR (Interrupted system ca=
ll)
futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL

More Ctrl+C only repeats it in both processes but bitbake does not quit

One more python process is created and disowned by parent and becames child=
 of init and dies later
bitbake  18524  0.0  1.0 289044 165128 ?       S    18:31   0:00 python /OE=
/build/bitbake/bin/bitbake my-image
but bitbake is still hanging until I send kill 18504 from another terminal

Process 18504:
futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) =3D ? ERESTARTSYS (To be rest=
arted if SA_RESTART is set)
--- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D12337=
, ptr=3D0x3031}} ---
rt_sigreturn()                          =3D -1 EINTR (Interrupted system ca=
ll)
futex(0xb16e5a0, FUTEX_WAIT_PRIVATE, 0, NULL) =3D ? ERESTARTSYS (To be rest=
arted if SA_RESTART is set)
--- SIGTERM {si_signo=3DSIGTERM, si_code=3DSI_USER, si_pid=3D23837, si_uid=
=3D1026} ---
+++ killed by SIGTERM +++

Process 17656: (iirc you said that python-logging module is not safe with m=
ultiple processes and it looks like logging something)
# strace -p 17656
Process 17656 attached
wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restarted =
if SA_RESTART is set)
--- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D12337=
, ptr=3D0x3031}} ---
wait4(18504, 0x7fffd2abdf80, 0, NULL)   =3D ? ERESTARTSYS (To be restarted =
if SA_RESTART is set)
--- SIGINT {si_signo=3DSIGINT, si_code=3DSI_KERNEL, si_value=3D{int=3D12337=
, ptr=3D0x3031}} ---

read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 554) =3D 554
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\34", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 540) =3D 540
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2&", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 550) =3D 550
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\32", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 538) =3D 538
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2$", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 548) =3D 548
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2!", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 545) =3D 545
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2+", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 555) =3D 555
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2)", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 553) =3D 553
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\0023", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 563) =3D 563
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2#", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 547) =3D 547
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2-", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 557) =3D 557
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\36", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 542) =3D 542
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2(", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 552) =3D 552
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2*", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 554) =3D 554
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2$", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 548) =3D 548
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2.", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 558) =3D 558
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\37", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 543) =3D 543
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\7", 4)                  =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 519) =3D 519
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\37", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 543) =3D 543
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\7", 4)                  =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 519) =3D 519
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2\36", 4)                 =3D 4
read(4, "\0\0\2q", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 625) =3D 625
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2R", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 594) =3D 594
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2=3D", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 573) =3D 573
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2r", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 626) =3D 626
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2S", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 595) =3D 595
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2>", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 574) =3D 574
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2l", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 620) =3D 620
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\2M", 4)                   =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 589) =3D 589
select(5, [4], NULL, NULL, {0, 0})      =3D 1 (in [4], left {0, 0})
read(4, "\0\0\0028", 4)                 =3D 4
read(4, "\200\2clogging\nLogRecord\nq\1)\201q\2}q\3(U"..., 568) =3D 568
select(5, [4], NULL, NULL, {0, 0})      =3D 0 (Timeout)
close(6)                                =3D 0
close(4)                                =3D 0
rt_sigaction(SIGINT, {SIG_DFL, [], SA_RESTORER, 0x2aaaaaf27cb0}, {SIG_IGN, =
[], SA_RESTORER, 0x2aaaaaf27cb0}, 8) =3D 0
rt_sigaction(SIGTERM, {SIG_DFL, [], SA_RESTORER, 0x2aaaaaf27cb0}, {0x45190f=
, [], SA_RESTORER, 0x2aaaaaf27cb0}, 8) =3D 0
close(7)                                =3D 0
munmap(0x2aaaaac18000, 32)              =3D 0
munmap(0x2aaaaac10000, 32)              =3D 0
munmap(0x2aaaaab78000, 32)              =3D 0
munmap(0x2aaaaab70000, 32)              =3D 0
munmap(0x2aaaaab80000, 32)              =3D 0
munmap(0x2aaaaab68000, 32)              =3D 0
close(5)                                =3D 0
munmap(0x2aaaaab58000, 32)              =3D 0
munmap(0x2aaaaab60000, 32)              =3D 0
close(8)                                =3D 0
close(9)                                =3D 0
exit_group(1)                           =3D ?
+++ exited with 1 +++


I'll put this in bug report later, but if you see what other information co=
uld be useful,
I'll add it next time I see bitbake hanging like this (it doesn't happen ev=
ery time, probably more
with machine under higher load).

Happens in my gentoo chroot with
Python 2.7.3 (default, Mar 19 2013, 08:59:58)=20
[GCC 4.7.2] on linux2

as well as in ubuntu-12.10 chroot with
Python 2.7.3 (default, Sep 26 2012, 21:51:14)=20
[GCC 4.7.2] on linux2

both using latest oe-core+bitbake.
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tV/+6PImfyFtriLg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFthbUACgkQN1Ujt2V2gByQhACfXcQIzplQP8S6NgQymKD9n0bI
fucAoKurwuSTClQuJr8AwgxNTr32/rDe
=szYc
-----END PGP SIGNATURE-----

--tV/+6PImfyFtriLg--
