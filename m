Return-Path: <mschiffer@universe-factory.net>
Received: from chaos.universe-factory.net (chaos.universe-factory.net
	[37.72.148.22])
	by mail.openembedded.org (Postfix) with ESMTP id 12AE473211
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 21:29:25 +0000 (UTC)
Received: from [IPv6:fd1b:c28a:2fd6::2] (unknown [IPv6:fd1b:c28a:2fd6::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by chaos.universe-factory.net (Postfix) with ESMTPSA id 0344E181535;
	Sun, 10 Jan 2016 22:29:25 +0100 (CET)
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
	<CAMKF1srdBj0iSp0ursf8=_pD-bV8Bp81haj8EkOhe8n=xvHFfQ@mail.gmail.com>
From: Matthias Schiffer <mschiffer@universe-factory.net>
X-Enigmail-Draft-Status: N1110
Message-ID: <5692CD35.2060304@universe-factory.net>
Date: Sun, 10 Jan 2016 22:29:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1srdBj0iSp0ursf8=_pD-bV8Bp81haj8EkOhe8n=xvHFfQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sun, 10 Jan 2016 21:29:26 -0000
X-Groupsio-MsgNum: 75794
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="VtRc7vPr1k0Jn47K8LU8ADNCScvU3sUEF"

--VtRc7vPr1k0Jn47K8LU8ADNCScvU3sUEF
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 01/10/2016 10:10 PM, Khem Raj wrote:
> On Fri, Jan 8, 2016 at 6:56 AM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>
>> On 8 January 2016 at 10:19, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> This set of fixes let core-image-full-cmdline build with musl along w=
ith
>>> core-image-sato
>>> and core-image-weston
>>
>>
>> The postinst intercepts that are ran at rootfs time using user-mode qe=
mu
>> don't work with musl:
>>
>> NOTE: Running intercept scripts:
>> NOTE: > Executing update_font_cache intercept ...
>> /lib/ld-musl-i386.so.1: No such file or directory
>> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0=
-r0/rootfs/usr/bin/fc-cache:
>> Invalid ELF image for this architecture
>> WARNING: The postinstall intercept hook 'update_font_cache' failed (ex=
it
>> code: 255)! See log for details!
>> WARNING: The postinstalls for the following packages will be postponed=
 for
>> first boot: liberation-fonts
>> NOTE: > Executing update_icon_cache intercept ...
>> NOTE: > Executing update_pixbuf_cache intercept ...
>> /lib/ld-musl-i386.so.1: No such file or directory
>> /data/poky-master/tmp/work/qemux86-poky-linux-musl/core-image-sato/1.0=
-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders:
>> Invalid ELF image for this architecture
>=20
> I have fixed this issue as well.
>=20
> https://github.com/kraj/openembedded-core/commit/1b65d8b36606167f4f0419=
2abf4e14ada305cd8d

I think making the symlinks relative like that will break in merged-usr
setups (which I'm currently trying to add support for in OE). E.g., when
ld.so is actually in /usr/lib and /lib symlinks to /usr/lib, the symlink
to ../usr/lib/libc.so will be wrong.

systemd has been relying on ln's -r (--relative) option for some time
for similar reasons, but it's a fairly recent addition to ln, so I'm not
sure if it's acceptable for OE. If not, adding a symlink helper based on
python's os.path.relpath might be a good idea.

Matthias


>=20
> Its baking on my master tree, will post it along wiith phase 4 pull req=
uest.
>=20
>=20
>>
>> Ross



--VtRc7vPr1k0Jn47K8LU8ADNCScvU3sUEF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJWks01AAoJEBbvP2TLIB2cCkMQAL+ZKcFaxiXkiCnzw8zX6MoQ
5gxeR6fupMc9MyCgl6AhnPnzAvHZ47u/WsvkzBPOq2CvbwEH0huqhvBqN8vWHghj
qMmyKDuyeCH7XnAkQB/7CKTLfBAGLuSFf3jyrYixAXBIxC3UsWlSrrw0Zem599ED
m4dV/VUoCmDvJzYDR8Te0FdFwyyTUXf/Kc5diPZQ1BR2lW/29gSN5RhxbRzNNQ2i
DMY4a8LL7jhLkzii2kxCMAdTnzoy8HRBeQE/76l3Ltttz+LYIjQ3fV4ZXrW0E0UH
tQWZi1kku9kEdXD0sqCEkPLpMhsXvhRSmRijhBbf6D5BlIhxm27yrl9atbHZs2gr
zn0q7Atx/OqxSytcZ8LIzw2b0hkUR9MF9Q+Q5/RoxoIzVkYhzrop2/UuYyIf3LjT
3Xi4dVPu4r4sIWVn9lUtVLt9D5+D/F+qt3c2swWg7tLuRqaopcKHcsVMXsLgKUew
rOel9onHH2C2bTsE9jKmW03wKSlUPXy5vzrNP4l5+fzqFK7UQHJNJU/Kg9i4WrpS
jzXzHGoylfOKtEkdWR42f7kHBGzIuc3BCLYmNxPuI8eY5P5NKsIYupAV39JLBTCq
yuUXh1dkwJ3EFDi42YaQ7zC+AlOPbXkY9/rWUFcyT7elhuur1NqgyGIhwTfL3wd1
Q67EIMwcP1HUPn5u7DZq
=MZra
-----END PGP SIGNATURE-----

--VtRc7vPr1k0Jn47K8LU8ADNCScvU3sUEF--
