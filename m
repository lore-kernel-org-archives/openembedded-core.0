Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8099FC2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 15:54:07 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web10.372.1719849240701279920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 08:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GGSx7qk+;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.172, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e0354459844so2956646276.3
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 08:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719849240; x=1720454040; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZlE7YJhDpSHNKR17NZKlom61TmhLbeL2DizoOPxlcY=;
        b=GGSx7qk+Y2RgaJwU0l6q607xJ9WDdsQ6t8SbCOT32d6Gdf5BYQMqU5VXoGAI/yNw1n
         s/6DN+ROr3Itjjpo0DxhafKfjt6Dq3eSFI2uzpfrfKkqFI9QLs3+Ki+Pj0T74L6FlvB0
         xLmfvr6BZB/Qy5zuIQE7TarFLtGXP0HBy3jT/oiNCLAc2SSfeEsbEeyTdXP6wQ1JUCzB
         tseQSOFR3zj0ESp+Uj4+hCCXsqUBY5oMizvd08d9GjuntluvjSBH3sFOl/fkW85b9xSU
         GB99z/WaxG3ngkSB8vItHCHF/64xcfIR7uALcWrRbgfEAuuCfCIP7jRmPgAoRokrvoQe
         EwFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719849240; x=1720454040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZlE7YJhDpSHNKR17NZKlom61TmhLbeL2DizoOPxlcY=;
        b=QC9bI008jIyG3YA4WepEzdz9ZSraW5Z/iYQ30u5K+25V8i3/Dhh1LYqVA5NUvicHXh
         ffDxOihtOSD5jimQHlkAgRhYeNuG7UUxhFaFRSUjdN6FOkZmAzSnxEkFHuMpgq7XyqFg
         /ctXe1gSygcVu/yuVu/6Auoa7DDmBceHNQOhH0AUKy20eF2ytOgnwvbJcsfF4t8wynj8
         W8K7X+Rs3ziYJYrp+Vbz1VyX7ISlOltCgw4Yn8t7jk43VG1GofvOVNygOSE28E7QdBpg
         BDhil3ZjmfgTtbogYXKLQxVrG4W22rTuZFJ4V/TAis5em1Mv0bUEPcs8RFWLAoReAro6
         PM2g==
X-Gm-Message-State: AOJu0YxBtXz929tTy3x2jkl7dRnv7PmNHab0zf140Jl+njQVg0sGvtmR
	KHcgMGI6Pr3csKYrJmgF++HP4Rnqu/Y+37v6ivr9nSOsPBGNO+O584zTPrjjbMI6l2FP/oTuPRL
	vUct/x4qPTqTh+BIBZHqjTaJSu8gJkSz51T/nWw==
X-Google-Smtp-Source: AGHT+IE4lD4AQSxYvb7ifGiTr33bl4asHgOwtEx84w7sIlc/ijGpwnkoKq4PMtFr1PQ7AWvBNxbO8KWKV6T3DlLDF8Y=
X-Received: by 2002:a25:2f96:0:b0:dff:4a3:2de9 with SMTP id
 3f1490d57ef6-e036eb3da9amr6021912276.20.1719849239670; Mon, 01 Jul 2024
 08:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240626150614.19870-1-asharma@mvista.com>
In-Reply-To: <20240626150614.19870-1-asharma@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 1 Jul 2024 08:53:46 -0700
Message-ID: <CAOSpxdYQ6o_mAsxjACY778uhH67qLjYqi7zfApDVQh2rgTsHnQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] python3: Fix CVE-2024-4032
To: asharma@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201309

This patch is breaking the python3-native build:

ERROR: python3-native-3.10.14-r0 do_patch: Applying patch
'CVE-2024-4032.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/pyth=
on3-native/3.10.14-r0/Python-3.10.14'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/pytho=
n3-native/3.10.14-r0/recipe-sysroot-native/etc/quiltrc
push', 0, "stdout: Applying patch CVE-2024-4032.patch
patching file Doc/library/ipaddress.rst
Hunk #1 succeeded at 188 (offset 10 lines).
can't find file to patch at input line 85
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|diff --git a/Doc/whatsnew/3.11.rst b/Doc/whatsnew/3.11.rst
|index f670fa1f097aa1..42b61c75c7e621 100644
|--- a/Doc/whatsnew/3.11.rst
|+++ b/Doc/whatsnew/3.11.rst
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file Lib/ipaddress.py
Hunk #1 FAILED at 1086.
Hunk #2 succeeded at 1323 (offset -10 lines).
Hunk #3 succeeded at 1561 (offset -10 lines).
Hunk #4 succeeded at 1580 (offset -10 lines).
Hunk #5 succeeded at 2026 (offset -14 lines).
Hunk #6 succeeded at 2302 (offset -14 lines).
1 out of 6 hunks FAILED -- rejects in file Lib/ipaddress.py
patching file Lib/test/test_ipaddress.py
Hunk #1 succeeded at 2263 (offset -6 lines).
Hunk #2 FAILED at 2298.
Hunk #3 FAILED at 2314.
Hunk #4 succeeded at 2355 (offset -39 lines).
2 out of 4 hunks FAILED -- rejects in file Lib/test/test_ipaddress.py
patching file Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.=
VFnObz.rst
Patch CVE-2024-4032.patch does not apply (enforce with -f)

stderr: ")
ERROR: Logfile of failure stored in:
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/x86_64-linux/pytho=
n3-native/3.10.14-r0/temp/log.do_patch.1500229
ERROR: Task (virtual:native:/home/steve/builds/poky-contrib-kirkstone/meta/=
recipes-devtools/python/python3_3.10.14.bb:do_patch)
failed with exit code '1'

Steve

On Wed, Jun 26, 2024 at 8:08=E2=80=AFAM Ashish Sharma via
lists.openembedded.org <asharma=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport from [https://github.com/python/cpython/commit/=
ba431579efdcbaed7a96f2ac4ea0775879a332fb]
> CVE: CVE-2024-4032
>
> Signed-off-by: Ashish Sharma <asharma@mvista.com>
> ---
>  .../python/python3/CVE-2024-4032.patch        | 346 ++++++++++++++++++
>  .../python/python3_3.10.14.bb                 |   1 +
>  2 files changed, 347 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-4032.pa=
tch
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2024-4032.patch b/m=
eta/recipes-devtools/python/python3/CVE-2024-4032.patch
> new file mode 100644
> index 0000000000..d29ed01c1f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2024-4032.patch
> @@ -0,0 +1,346 @@
> +From ba431579efdcbaed7a96f2ac4ea0775879a332fb Mon Sep 17 00:00:00 2001
> +From: Petr Viktorin <encukou@gmail.com>
> +Date: Thu, 25 Apr 2024 14:45:48 +0200
> +Subject: [PATCH] [3.11] gh-113171: gh-65056: Fix "private" (non-global) =
IP
> + address ranges (GH-113179) (GH-113186) (GH-118177) (#118227)
> +
> +Upstream-Status: Backport from [https://github.com/python/cpython/commit=
/ba431579efdcbaed7a96f2ac4ea0775879a332fb]
> +CVE: CVE-2024-4032
> +Signed-off-by: Ashish Sharma <asharma@mvista.com>
> +
> + Doc/library/ipaddress.rst                     | 43 +++++++-
> + Doc/whatsnew/3.11.rst                         |  9 ++
> + Lib/ipaddress.py                              | 99 +++++++++++++++----
> + Lib/test/test_ipaddress.py                    | 21 +++-
> + ...-03-14-01-38-44.gh-issue-113171.VFnObz.rst |  9 ++
> + 5 files changed, 157 insertions(+), 24 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issu=
e-113171.VFnObz.rst
> +
> +diff --git a/Doc/library/ipaddress.rst b/Doc/library/ipaddress.rst
> +index 03dc956cd1352a..f57fa15aa5b930 100644
> +--- a/Doc/library/ipaddress.rst
> ++++ b/Doc/library/ipaddress.rst
> +@@ -178,18 +178,53 @@ write code that handles both IP versions correctly=
.  Address objects are
> +
> +    .. attribute:: is_private
> +
> +-      ``True`` if the address is allocated for private networks.  See
> ++      ``True`` if the address is defined as not globally reachable by
> +       iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-regis=
try_
> +-      (for IPv6).
> ++      (for IPv6) with the following exceptions:
> ++
> ++      * ``is_private`` is ``False`` for the shared address space (``100=
.64.0.0/10``)
> ++      * For IPv4-mapped IPv6-addresses the ``is_private`` value is dete=
rmined by the
> ++        semantics of the underlying IPv4 addresses and the following co=
ndition holds
> ++        (see :attr:`IPv6Address.ipv4_mapped`)::
> ++
> ++            address.is_private =3D=3D address.ipv4_mapped.is_private
> ++
> ++      ``is_private`` has value opposite to :attr:`is_global`, except fo=
r the shared address space
> ++      (``100.64.0.0/10`` range) where they are both ``False``.
> ++
> ++      .. versionchanged:: 3.11.10
> ++
> ++         Fixed some false positives and false negatives.
> ++
> ++         * ``192.0.0.0/24`` is considered private with the exception of=
 ``192.0.0.9/32`` and
> ++           ``192.0.0.10/32`` (previously: only the ``192.0.0.0/29`` sub=
-range was considered private).
> ++         * ``64:ff9b:1::/48`` is considered private.
> ++         * ``2002::/16`` is considered private.
> ++         * There are exceptions within ``2001::/23`` (otherwise conside=
red private): ``2001:1::1/128``,
> ++           ``2001:1::2/128``, ``2001:3::/32``, ``2001:4:112::/48``, ``2=
001:20::/28``, ``2001:30::/28``.
> ++           The exceptions are not considered private.
> +
> +    .. attribute:: is_global
> +
> +-      ``True`` if the address is allocated for public networks.  See
> ++      ``True`` if the address is defined as globally reachable by
> +       iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-regis=
try_
> +-      (for IPv6).
> ++      (for IPv6) with the following exception:
> ++
> ++      For IPv4-mapped IPv6-addresses the ``is_private`` value is determ=
ined by the
> ++      semantics of the underlying IPv4 addresses and the following cond=
ition holds
> ++      (see :attr:`IPv6Address.ipv4_mapped`)::
> ++
> ++         address.is_global =3D=3D address.ipv4_mapped.is_global
> ++
> ++      ``is_global`` has value opposite to :attr:`is_private`, except fo=
r the shared address space
> ++      (``100.64.0.0/10`` range) where they are both ``False``.
> +
> +       .. versionadded:: 3.4
> +
> ++      .. versionchanged:: 3.11.10
> ++
> ++         Fixed some false positives and false negatives, see :attr:`is_=
private` for details.
> ++
> +    .. attribute:: is_unspecified
> +
> +       ``True`` if the address is unspecified.  See :RFC:`5735` (for IPv=
4)
> +diff --git a/Doc/whatsnew/3.11.rst b/Doc/whatsnew/3.11.rst
> +index f670fa1f097aa1..42b61c75c7e621 100644
> +--- a/Doc/whatsnew/3.11.rst
> ++++ b/Doc/whatsnew/3.11.rst
> +@@ -2727,3 +2727,12 @@ OpenSSL
> + * Windows builds and macOS installers from python.org now use OpenSSL 3=
.0.
> +
> + .. _libb2: https://www.blake2.net/
> ++
> ++Notable changes in 3.11.10
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> ++
> ++ipaddress
> ++---------
> ++
> ++* Fixed ``is_global`` and ``is_private`` behavior in ``IPv4Address``,
> ++  ``IPv6Address``, ``IPv4Network`` and ``IPv6Network``.
> +diff --git a/Lib/ipaddress.py b/Lib/ipaddress.py
> +index 16ba16cd7de49a..567beb37e06318 100644
> +--- a/Lib/ipaddress.py
> ++++ b/Lib/ipaddress.py
> +@@ -1086,7 +1086,11 @@ def is_private(self):
> +         """
> +         return any(self.network_address in priv_network and
> +                    self.broadcast_address in priv_network
> +-                   for priv_network in self._constants._private_network=
s)
> ++                   for priv_network in self._constants._private_network=
s) and all(
> ++                    self.network_address not in network and
> ++                    self.broadcast_address not in network
> ++                    for network in self._constants._private_networks_ex=
ceptions
> ++                )
> +
> +     @property
> +     def is_global(self):
> +@@ -1333,18 +1337,41 @@ def is_reserved(self):
> +     @property
> +     @functools.lru_cache()
> +     def is_private(self):
> +-        """Test if this address is allocated for private networks.
> ++        """``True`` if the address is defined as not globally reachable=
 by
> ++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-reg=
istry_
> ++        (for IPv6) with the following exceptions:
> +
> +-        Returns:
> +-            A boolean, True if the address is reserved per
> +-            iana-ipv4-special-registry.
> ++        * ``is_private`` is ``False`` for ``100.64.0.0/10``
> ++        * For IPv4-mapped IPv6-addresses the ``is_private`` value is de=
termined by the
> ++            semantics of the underlying IPv4 addresses and the followin=
g condition holds
> ++            (see :attr:`IPv6Address.ipv4_mapped`)::
> +
> ++                address.is_private =3D=3D address.ipv4_mapped.is_privat=
e
> ++
> ++        ``is_private`` has value opposite to :attr:`is_global`, except =
for the ``100.64.0.0/10``
> ++        IPv4 range where they are both ``False``.
> +         """
> +-        return any(self in net for net in self._constants._private_netw=
orks)
> ++        return (
> ++            any(self in net for net in self._constants._private_network=
s)
> ++            and all(self not in net for net in self._constants._private=
_networks_exceptions)
> ++        )
> +
> +     @property
> +     @functools.lru_cache()
> +     def is_global(self):
> ++        """``True`` if the address is defined as globally reachable by
> ++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-reg=
istry_
> ++        (for IPv6) with the following exception:
> ++
> ++        For IPv4-mapped IPv6-addresses the ``is_private`` value is dete=
rmined by the
> ++        semantics of the underlying IPv4 addresses and the following co=
ndition holds
> ++        (see :attr:`IPv6Address.ipv4_mapped`)::
> ++
> ++            address.is_global =3D=3D address.ipv4_mapped.is_global
> ++
> ++        ``is_global`` has value opposite to :attr:`is_private`, except =
for the ``100.64.0.0/10``
> ++        IPv4 range where they are both ``False``.
> ++        """
> +         return self not in self._constants._public_network and not self=
.is_private
> +
> +     @property
> +@@ -1548,13 +1575,15 @@ class _IPv4Constants:
> +
> +     _public_network =3D IPv4Network('100.64.0.0/10')
> +
> ++    # Not globally reachable address blocks listed on
> ++    # https://www.iana.org/assignments/iana-ipv4-special-registry/iana-=
ipv4-special-registry.xhtml
> +     _private_networks =3D [
> +         IPv4Network('0.0.0.0/8'),
> +         IPv4Network('10.0.0.0/8'),
> +         IPv4Network('127.0.0.0/8'),
> +         IPv4Network('169.254.0.0/16'),
> +         IPv4Network('172.16.0.0/12'),
> +-        IPv4Network('192.0.0.0/29'),
> ++        IPv4Network('192.0.0.0/24'),
> +         IPv4Network('192.0.0.170/31'),
> +         IPv4Network('192.0.2.0/24'),
> +         IPv4Network('192.168.0.0/16'),
> +@@ -1565,6 +1594,11 @@ class _IPv4Constants:
> +         IPv4Network('255.255.255.255/32'),
> +         ]
> +
> ++    _private_networks_exceptions =3D [
> ++        IPv4Network('192.0.0.9/32'),
> ++        IPv4Network('192.0.0.10/32'),
> ++    ]
> ++
> +     _reserved_network =3D IPv4Network('240.0.0.0/4')
> +
> +     _unspecified_address =3D IPv4Address('0.0.0.0')
> +@@ -2010,27 +2044,42 @@ def is_site_local(self):
> +     @property
> +     @functools.lru_cache()
> +     def is_private(self):
> +-        """Test if this address is allocated for private networks.
> ++        """``True`` if the address is defined as not globally reachable=
 by
> ++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-reg=
istry_
> ++        (for IPv6) with the following exceptions:
> +
> +-        Returns:
> +-            A boolean, True if the address is reserved per
> +-            iana-ipv6-special-registry, or is ipv4_mapped and is
> +-            reserved in the iana-ipv4-special-registry.
> ++        * ``is_private`` is ``False`` for ``100.64.0.0/10``
> ++        * For IPv4-mapped IPv6-addresses the ``is_private`` value is de=
termined by the
> ++            semantics of the underlying IPv4 addresses and the followin=
g condition holds
> ++            (see :attr:`IPv6Address.ipv4_mapped`)::
> +
> ++                address.is_private =3D=3D address.ipv4_mapped.is_privat=
e
> ++
> ++        ``is_private`` has value opposite to :attr:`is_global`, except =
for the ``100.64.0.0/10``
> ++        IPv4 range where they are both ``False``.
> +         """
> +         ipv4_mapped =3D self.ipv4_mapped
> +         if ipv4_mapped is not None:
> +             return ipv4_mapped.is_private
> +-        return any(self in net for net in self._constants._private_netw=
orks)
> ++        return (
> ++            any(self in net for net in self._constants._private_network=
s)
> ++            and all(self not in net for net in self._constants._private=
_networks_exceptions)
> ++        )
> +
> +     @property
> +     def is_global(self):
> +-        """Test if this address is allocated for public networks.
> ++        """``True`` if the address is defined as globally reachable by
> ++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-reg=
istry_
> ++        (for IPv6) with the following exception:
> +
> +-        Returns:
> +-            A boolean, true if the address is not reserved per
> +-            iana-ipv6-special-registry.
> ++        For IPv4-mapped IPv6-addresses the ``is_private`` value is dete=
rmined by the
> ++        semantics of the underlying IPv4 addresses and the following co=
ndition holds
> ++        (see :attr:`IPv6Address.ipv4_mapped`)::
> ++
> ++            address.is_global =3D=3D address.ipv4_mapped.is_global
> +
> ++        ``is_global`` has value opposite to :attr:`is_private`, except =
for the ``100.64.0.0/10``
> ++        IPv4 range where they are both ``False``.
> +         """
> +         return not self.is_private
> +
> +@@ -2271,19 +2320,31 @@ class _IPv6Constants:
> +
> +     _multicast_network =3D IPv6Network('ff00::/8')
> +
> ++    # Not globally reachable address blocks listed on
> ++    # https://www.iana.org/assignments/iana-ipv6-special-registry/iana-=
ipv6-special-registry.xhtml
> +     _private_networks =3D [
> +         IPv6Network('::1/128'),
> +         IPv6Network('::/128'),
> +         IPv6Network('::ffff:0:0/96'),
> ++        IPv6Network('64:ff9b:1::/48'),
> +         IPv6Network('100::/64'),
> +         IPv6Network('2001::/23'),
> +-        IPv6Network('2001:2::/48'),
> +         IPv6Network('2001:db8::/32'),
> +-        IPv6Network('2001:10::/28'),
> ++        # IANA says N/A, let's consider it not globally reachable to be=
 safe
> ++        IPv6Network('2002::/16'),
> +         IPv6Network('fc00::/7'),
> +         IPv6Network('fe80::/10'),
> +         ]
> +
> ++    _private_networks_exceptions =3D [
> ++        IPv6Network('2001:1::1/128'),
> ++        IPv6Network('2001:1::2/128'),
> ++        IPv6Network('2001:3::/32'),
> ++        IPv6Network('2001:4:112::/48'),
> ++        IPv6Network('2001:20::/28'),
> ++        IPv6Network('2001:30::/28'),
> ++    ]
> ++
> +     _reserved_networks =3D [
> +         IPv6Network('::/8'), IPv6Network('100::/8'),
> +         IPv6Network('200::/7'), IPv6Network('400::/6'),
> +diff --git a/Lib/test/test_ipaddress.py b/Lib/test/test_ipaddress.py
> +index fc27628af17f8d..16c34163a007a2 100644
> +--- a/Lib/test/test_ipaddress.py
> ++++ b/Lib/test/test_ipaddress.py
> +@@ -2269,6 +2269,10 @@ def testReservedIpv4(self):
> +         self.assertEqual(True, ipaddress.ip_address(
> +                 '172.31.255.255').is_private)
> +         self.assertEqual(False, ipaddress.ip_address('172.32.0.0').is_p=
rivate)
> ++        self.assertFalse(ipaddress.ip_address('192.0.0.0').is_global)
> ++        self.assertTrue(ipaddress.ip_address('192.0.0.9').is_global)
> ++        self.assertTrue(ipaddress.ip_address('192.0.0.10').is_global)
> ++        self.assertFalse(ipaddress.ip_address('192.0.0.255').is_global)
> +
> +         self.assertEqual(True,
> +                          ipaddress.ip_address('169.254.100.200').is_lin=
k_local)
> +@@ -2294,6 +2298,7 @@ def testPrivateNetworks(self):
> +         self.assertEqual(True, ipaddress.ip_network("169.254.0.0/16").i=
s_private)
> +         self.assertEqual(True, ipaddress.ip_network("172.16.0.0/12").is=
_private)
> +         self.assertEqual(True, ipaddress.ip_network("192.0.0.0/29").is_=
private)
> ++        self.assertEqual(False, ipaddress.ip_network("192.0.0.9/32").is=
_private)
> +         self.assertEqual(True, ipaddress.ip_network("192.0.0.170/31").i=
s_private)
> +         self.assertEqual(True, ipaddress.ip_network("192.0.2.0/24").is_=
private)
> +         self.assertEqual(True, ipaddress.ip_network("192.168.0.0/16").i=
s_private)
> +@@ -2310,8 +2315,8 @@ def testPrivateNetworks(self):
> +         self.assertEqual(True, ipaddress.ip_network("::/128").is_privat=
e)
> +         self.assertEqual(True, ipaddress.ip_network("::ffff:0:0/96").is=
_private)
> +         self.assertEqual(True, ipaddress.ip_network("100::/64").is_priv=
ate)
> +-        self.assertEqual(True, ipaddress.ip_network("2001::/23").is_pri=
vate)
> +         self.assertEqual(True, ipaddress.ip_network("2001:2::/48").is_p=
rivate)
> ++        self.assertEqual(False, ipaddress.ip_network("2001:3::/48").is_=
private)
> +         self.assertEqual(True, ipaddress.ip_network("2001:db8::/32").is=
_private)
> +         self.assertEqual(True, ipaddress.ip_network("2001:10::/28").is_=
private)
> +         self.assertEqual(True, ipaddress.ip_network("fc00::/7").is_priv=
ate)
> +@@ -2390,6 +2395,20 @@ def testReservedIpv6(self):
> +         self.assertEqual(True, ipaddress.ip_address('0::0').is_unspecif=
ied)
> +         self.assertEqual(False, ipaddress.ip_address('::1').is_unspecif=
ied)
> +
> ++        self.assertFalse(ipaddress.ip_address('64:ff9b:1::').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2001::').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:1::1').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:1::2').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2001:2::').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:3::').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2001:4::').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:4:112::').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2001:10::').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:20::').is_global)
> ++        self.assertTrue(ipaddress.ip_address('2001:30::').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2001:40::').is_global)
> ++        self.assertFalse(ipaddress.ip_address('2002::').is_global)
> ++
> +         # some generic IETF reserved addresses
> +         self.assertEqual(True, ipaddress.ip_address('100::').is_reserve=
d)
> +         self.assertEqual(True, ipaddress.ip_network('4000::1/128').is_r=
eserved)
> +diff --git a/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-11317=
1.VFnObz.rst b/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171=
.VFnObz.rst
> +new file mode 100644
> +index 00000000000000..f9a72473be4e2c
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.VFnOb=
z.rst
> +@@ -0,0 +1,9 @@
> ++Fixed various false positives and false negatives in
> ++
> ++* :attr:`ipaddress.IPv4Address.is_private` (see these docs for details)
> ++* :attr:`ipaddress.IPv4Address.is_global`
> ++* :attr:`ipaddress.IPv6Address.is_private`
> ++* :attr:`ipaddress.IPv6Address.is_global`
> ++
> ++Also in the corresponding :class:`ipaddress.IPv4Network` and :class:`ip=
address.IPv6Network`
> ++attributes.
> diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recip=
es-devtools/python/python3_3.10.14.bb
> index 31c458c09a..7d8fb76103 100644
> --- a/meta/recipes-devtools/python/python3_3.10.14.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.14.bb
> @@ -36,6 +36,7 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.xz \
>             file://deterministic_imports.patch \
>             file://0001-Avoid-shebang-overflow-on-python-config.py.patch =
\
>             file://0001-test_storlines-skip-due-to-load-variability.patch=
 \
> +           file://CVE-2024-4032.patch \
>             "
>
>  SRC_URI:append:class-native =3D " \
> --
> 2.35.7
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201172): https://lists.openembedded.org/g/openembedde=
d-core/message/201172
> Mute This Topic: https://lists.openembedded.org/mt/106891137/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

