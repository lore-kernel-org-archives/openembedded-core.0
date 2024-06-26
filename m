Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C033CC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:08:41 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.29316.1719414515913942977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=e7BFgm3F;
 spf=pass (domain: mvista.com, ip: 209.85.214.195, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1f8395a530dso53232245ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 08:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719414515; x=1720019315; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YoWWqOXD1wMc/n4t7o7tOZBdov7Q8pA/1dKH7WiH/Do=;
        b=e7BFgm3FUqrMr3Wu2CI/XjYB/y0lkLFg0IzzH7kWNdj70qFntXKv7a9cUhOIfn5MfK
         fCxzbMwdLv58L3nCGzJcJUKe8bPXMHP8R0j/9Izm0R8l+7ZFDzz3o5UqVWrN6FnZ9m4y
         SsXLui92t68yeQ/UBNXzu96xyQX/KZKvOw9d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414515; x=1720019315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoWWqOXD1wMc/n4t7o7tOZBdov7Q8pA/1dKH7WiH/Do=;
        b=lO3Xny9GaLXdusv3RBGRTihtq1ajiAe5ax2VRtR9pwQIQJ7En2ehLDspGVfouQX+Qr
         0MuZxqAeGgwYfveXARrwARe2DBJ2lmGh4lpEu8ztyn/isBWGICIXStfKWv4Hy5lPK8Vv
         aT0/3N7gO5jypH0oLKHjWsC1fiIFsycEQp/ckORg8OASw+XrVZMeYCWDc4FRasoep3PR
         mYNW1Dq3bYur9CiQS2Lj+A+4tXHwnaxdZ5Btp/JcpEy6kpjtivTWzxge1CfMjsqARQM0
         s5Xy7bR8esSVWKBpiaBDQZDIA0AhEf3O7DYA4/X5nOsTDhnmBPnXggzSs4g7m+LG96c+
         4JUQ==
X-Gm-Message-State: AOJu0Ywelc5eKTpTi+WmojUdN88vix2yJ3Iqbgyv+SHmFJDv2OKAD3zH
	vmXylf9gtoN1Du8VER4xahG9bARZwpHDmremhsA3hbg9yI8jh3EzdBluWH04y7Rk7J0tHRMAo9a
	u6EU=
X-Google-Smtp-Source: AGHT+IGNCjCgs8n6fRR1W+Uomw8tSn1PEYLebOV6bfWgDzut7svIcZV4PXtAC/tMDL/PtqapkZKOiA==
X-Received: by 2002:a17:902:f685:b0:1fa:d3d:a681 with SMTP id d9443c01a7336-1fa23ed7128mr124331095ad.24.1719414514563;
        Wed, 26 Jun 2024 08:08:34 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.82.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb3c5ccasm101241365ad.171.2024.06.26.08.08.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 08:08:33 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 26 Jun 2024 20:36:16 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] python3: Fix CVE-2024-4032
Date: Wed, 26 Jun 2024 20:36:14 +0530
Message-Id: <20240626150614.19870-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 15:08:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201172

Upstream-Status: Backport from [https://github.com/python/cpython/commit/ba431579efdcbaed7a96f2ac4ea0775879a332fb]
CVE: CVE-2024-4032

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../python/python3/CVE-2024-4032.patch        | 346 ++++++++++++++++++
 .../python/python3_3.10.14.bb                 |   1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-4032.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-4032.patch b/meta/recipes-devtools/python/python3/CVE-2024-4032.patch
new file mode 100644
index 0000000000..d29ed01c1f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/CVE-2024-4032.patch
@@ -0,0 +1,346 @@
+From ba431579efdcbaed7a96f2ac4ea0775879a332fb Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Thu, 25 Apr 2024 14:45:48 +0200
+Subject: [PATCH] [3.11] gh-113171: gh-65056: Fix "private" (non-global) IP
+ address ranges (GH-113179) (GH-113186) (GH-118177) (#118227)
+
+Upstream-Status: Backport from [https://github.com/python/cpython/commit/ba431579efdcbaed7a96f2ac4ea0775879a332fb]
+CVE: CVE-2024-4032
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ Doc/library/ipaddress.rst                     | 43 +++++++-
+ Doc/whatsnew/3.11.rst                         |  9 ++
+ Lib/ipaddress.py                              | 99 +++++++++++++++----
+ Lib/test/test_ipaddress.py                    | 21 +++-
+ ...-03-14-01-38-44.gh-issue-113171.VFnObz.rst |  9 ++
+ 5 files changed, 157 insertions(+), 24 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.VFnObz.rst
+
+diff --git a/Doc/library/ipaddress.rst b/Doc/library/ipaddress.rst
+index 03dc956cd1352a..f57fa15aa5b930 100644
+--- a/Doc/library/ipaddress.rst
++++ b/Doc/library/ipaddress.rst
+@@ -178,18 +178,53 @@ write code that handles both IP versions correctly.  Address objects are
+ 
+    .. attribute:: is_private
+ 
+-      ``True`` if the address is allocated for private networks.  See
++      ``True`` if the address is defined as not globally reachable by
+       iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
+-      (for IPv6).
++      (for IPv6) with the following exceptions:
++
++      * ``is_private`` is ``False`` for the shared address space (``100.64.0.0/10``)
++      * For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++        semantics of the underlying IPv4 addresses and the following condition holds
++        (see :attr:`IPv6Address.ipv4_mapped`)::
++
++            address.is_private == address.ipv4_mapped.is_private
++
++      ``is_private`` has value opposite to :attr:`is_global`, except for the shared address space
++      (``100.64.0.0/10`` range) where they are both ``False``.
++
++      .. versionchanged:: 3.11.10
++
++         Fixed some false positives and false negatives.
++
++         * ``192.0.0.0/24`` is considered private with the exception of ``192.0.0.9/32`` and
++           ``192.0.0.10/32`` (previously: only the ``192.0.0.0/29`` sub-range was considered private).
++         * ``64:ff9b:1::/48`` is considered private.
++         * ``2002::/16`` is considered private.
++         * There are exceptions within ``2001::/23`` (otherwise considered private): ``2001:1::1/128``,
++           ``2001:1::2/128``, ``2001:3::/32``, ``2001:4:112::/48``, ``2001:20::/28``, ``2001:30::/28``.
++           The exceptions are not considered private.
+ 
+    .. attribute:: is_global
+ 
+-      ``True`` if the address is allocated for public networks.  See
++      ``True`` if the address is defined as globally reachable by
+       iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
+-      (for IPv6).
++      (for IPv6) with the following exception:
++
++      For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++      semantics of the underlying IPv4 addresses and the following condition holds
++      (see :attr:`IPv6Address.ipv4_mapped`)::
++
++         address.is_global == address.ipv4_mapped.is_global
++
++      ``is_global`` has value opposite to :attr:`is_private`, except for the shared address space
++      (``100.64.0.0/10`` range) where they are both ``False``.
+ 
+       .. versionadded:: 3.4
+ 
++      .. versionchanged:: 3.11.10
++
++         Fixed some false positives and false negatives, see :attr:`is_private` for details.
++
+    .. attribute:: is_unspecified
+ 
+       ``True`` if the address is unspecified.  See :RFC:`5735` (for IPv4)
+diff --git a/Doc/whatsnew/3.11.rst b/Doc/whatsnew/3.11.rst
+index f670fa1f097aa1..42b61c75c7e621 100644
+--- a/Doc/whatsnew/3.11.rst
++++ b/Doc/whatsnew/3.11.rst
+@@ -2727,3 +2727,12 @@ OpenSSL
+ * Windows builds and macOS installers from python.org now use OpenSSL 3.0.
+ 
+ .. _libb2: https://www.blake2.net/
++
++Notable changes in 3.11.10
++==========================
++
++ipaddress
++---------
++
++* Fixed ``is_global`` and ``is_private`` behavior in ``IPv4Address``,
++  ``IPv6Address``, ``IPv4Network`` and ``IPv6Network``.
+diff --git a/Lib/ipaddress.py b/Lib/ipaddress.py
+index 16ba16cd7de49a..567beb37e06318 100644
+--- a/Lib/ipaddress.py
++++ b/Lib/ipaddress.py
+@@ -1086,7 +1086,11 @@ def is_private(self):
+         """
+         return any(self.network_address in priv_network and
+                    self.broadcast_address in priv_network
+-                   for priv_network in self._constants._private_networks)
++                   for priv_network in self._constants._private_networks) and all(
++                    self.network_address not in network and
++                    self.broadcast_address not in network
++                    for network in self._constants._private_networks_exceptions
++                )
+ 
+     @property
+     def is_global(self):
+@@ -1333,18 +1337,41 @@ def is_reserved(self):
+     @property
+     @functools.lru_cache()
+     def is_private(self):
+-        """Test if this address is allocated for private networks.
++        """``True`` if the address is defined as not globally reachable by
++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
++        (for IPv6) with the following exceptions:
+ 
+-        Returns:
+-            A boolean, True if the address is reserved per
+-            iana-ipv4-special-registry.
++        * ``is_private`` is ``False`` for ``100.64.0.0/10``
++        * For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++            semantics of the underlying IPv4 addresses and the following condition holds
++            (see :attr:`IPv6Address.ipv4_mapped`)::
+ 
++                address.is_private == address.ipv4_mapped.is_private
++
++        ``is_private`` has value opposite to :attr:`is_global`, except for the ``100.64.0.0/10``
++        IPv4 range where they are both ``False``.
+         """
+-        return any(self in net for net in self._constants._private_networks)
++        return (
++            any(self in net for net in self._constants._private_networks)
++            and all(self not in net for net in self._constants._private_networks_exceptions)
++        )
+ 
+     @property
+     @functools.lru_cache()
+     def is_global(self):
++        """``True`` if the address is defined as globally reachable by
++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
++        (for IPv6) with the following exception:
++
++        For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++        semantics of the underlying IPv4 addresses and the following condition holds
++        (see :attr:`IPv6Address.ipv4_mapped`)::
++
++            address.is_global == address.ipv4_mapped.is_global
++
++        ``is_global`` has value opposite to :attr:`is_private`, except for the ``100.64.0.0/10``
++        IPv4 range where they are both ``False``.
++        """
+         return self not in self._constants._public_network and not self.is_private
+ 
+     @property
+@@ -1548,13 +1575,15 @@ class _IPv4Constants:
+ 
+     _public_network = IPv4Network('100.64.0.0/10')
+ 
++    # Not globally reachable address blocks listed on
++    # https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml
+     _private_networks = [
+         IPv4Network('0.0.0.0/8'),
+         IPv4Network('10.0.0.0/8'),
+         IPv4Network('127.0.0.0/8'),
+         IPv4Network('169.254.0.0/16'),
+         IPv4Network('172.16.0.0/12'),
+-        IPv4Network('192.0.0.0/29'),
++        IPv4Network('192.0.0.0/24'),
+         IPv4Network('192.0.0.170/31'),
+         IPv4Network('192.0.2.0/24'),
+         IPv4Network('192.168.0.0/16'),
+@@ -1565,6 +1594,11 @@ class _IPv4Constants:
+         IPv4Network('255.255.255.255/32'),
+         ]
+ 
++    _private_networks_exceptions = [
++        IPv4Network('192.0.0.9/32'),
++        IPv4Network('192.0.0.10/32'),
++    ]
++
+     _reserved_network = IPv4Network('240.0.0.0/4')
+ 
+     _unspecified_address = IPv4Address('0.0.0.0')
+@@ -2010,27 +2044,42 @@ def is_site_local(self):
+     @property
+     @functools.lru_cache()
+     def is_private(self):
+-        """Test if this address is allocated for private networks.
++        """``True`` if the address is defined as not globally reachable by
++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
++        (for IPv6) with the following exceptions:
+ 
+-        Returns:
+-            A boolean, True if the address is reserved per
+-            iana-ipv6-special-registry, or is ipv4_mapped and is
+-            reserved in the iana-ipv4-special-registry.
++        * ``is_private`` is ``False`` for ``100.64.0.0/10``
++        * For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++            semantics of the underlying IPv4 addresses and the following condition holds
++            (see :attr:`IPv6Address.ipv4_mapped`)::
+ 
++                address.is_private == address.ipv4_mapped.is_private
++
++        ``is_private`` has value opposite to :attr:`is_global`, except for the ``100.64.0.0/10``
++        IPv4 range where they are both ``False``.
+         """
+         ipv4_mapped = self.ipv4_mapped
+         if ipv4_mapped is not None:
+             return ipv4_mapped.is_private
+-        return any(self in net for net in self._constants._private_networks)
++        return (
++            any(self in net for net in self._constants._private_networks)
++            and all(self not in net for net in self._constants._private_networks_exceptions)
++        )
+ 
+     @property
+     def is_global(self):
+-        """Test if this address is allocated for public networks.
++        """``True`` if the address is defined as globally reachable by
++        iana-ipv4-special-registry_ (for IPv4) or iana-ipv6-special-registry_
++        (for IPv6) with the following exception:
+ 
+-        Returns:
+-            A boolean, true if the address is not reserved per
+-            iana-ipv6-special-registry.
++        For IPv4-mapped IPv6-addresses the ``is_private`` value is determined by the
++        semantics of the underlying IPv4 addresses and the following condition holds
++        (see :attr:`IPv6Address.ipv4_mapped`)::
++
++            address.is_global == address.ipv4_mapped.is_global
+ 
++        ``is_global`` has value opposite to :attr:`is_private`, except for the ``100.64.0.0/10``
++        IPv4 range where they are both ``False``.
+         """
+         return not self.is_private
+ 
+@@ -2271,19 +2320,31 @@ class _IPv6Constants:
+ 
+     _multicast_network = IPv6Network('ff00::/8')
+ 
++    # Not globally reachable address blocks listed on
++    # https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml
+     _private_networks = [
+         IPv6Network('::1/128'),
+         IPv6Network('::/128'),
+         IPv6Network('::ffff:0:0/96'),
++        IPv6Network('64:ff9b:1::/48'),
+         IPv6Network('100::/64'),
+         IPv6Network('2001::/23'),
+-        IPv6Network('2001:2::/48'),
+         IPv6Network('2001:db8::/32'),
+-        IPv6Network('2001:10::/28'),
++        # IANA says N/A, let's consider it not globally reachable to be safe
++        IPv6Network('2002::/16'),
+         IPv6Network('fc00::/7'),
+         IPv6Network('fe80::/10'),
+         ]
+ 
++    _private_networks_exceptions = [
++        IPv6Network('2001:1::1/128'),
++        IPv6Network('2001:1::2/128'),
++        IPv6Network('2001:3::/32'),
++        IPv6Network('2001:4:112::/48'),
++        IPv6Network('2001:20::/28'),
++        IPv6Network('2001:30::/28'),
++    ]
++
+     _reserved_networks = [
+         IPv6Network('::/8'), IPv6Network('100::/8'),
+         IPv6Network('200::/7'), IPv6Network('400::/6'),
+diff --git a/Lib/test/test_ipaddress.py b/Lib/test/test_ipaddress.py
+index fc27628af17f8d..16c34163a007a2 100644
+--- a/Lib/test/test_ipaddress.py
++++ b/Lib/test/test_ipaddress.py
+@@ -2269,6 +2269,10 @@ def testReservedIpv4(self):
+         self.assertEqual(True, ipaddress.ip_address(
+                 '172.31.255.255').is_private)
+         self.assertEqual(False, ipaddress.ip_address('172.32.0.0').is_private)
++        self.assertFalse(ipaddress.ip_address('192.0.0.0').is_global)
++        self.assertTrue(ipaddress.ip_address('192.0.0.9').is_global)
++        self.assertTrue(ipaddress.ip_address('192.0.0.10').is_global)
++        self.assertFalse(ipaddress.ip_address('192.0.0.255').is_global)
+ 
+         self.assertEqual(True,
+                          ipaddress.ip_address('169.254.100.200').is_link_local)
+@@ -2294,6 +2298,7 @@ def testPrivateNetworks(self):
+         self.assertEqual(True, ipaddress.ip_network("169.254.0.0/16").is_private)
+         self.assertEqual(True, ipaddress.ip_network("172.16.0.0/12").is_private)
+         self.assertEqual(True, ipaddress.ip_network("192.0.0.0/29").is_private)
++        self.assertEqual(False, ipaddress.ip_network("192.0.0.9/32").is_private)
+         self.assertEqual(True, ipaddress.ip_network("192.0.0.170/31").is_private)
+         self.assertEqual(True, ipaddress.ip_network("192.0.2.0/24").is_private)
+         self.assertEqual(True, ipaddress.ip_network("192.168.0.0/16").is_private)
+@@ -2310,8 +2315,8 @@ def testPrivateNetworks(self):
+         self.assertEqual(True, ipaddress.ip_network("::/128").is_private)
+         self.assertEqual(True, ipaddress.ip_network("::ffff:0:0/96").is_private)
+         self.assertEqual(True, ipaddress.ip_network("100::/64").is_private)
+-        self.assertEqual(True, ipaddress.ip_network("2001::/23").is_private)
+         self.assertEqual(True, ipaddress.ip_network("2001:2::/48").is_private)
++        self.assertEqual(False, ipaddress.ip_network("2001:3::/48").is_private)
+         self.assertEqual(True, ipaddress.ip_network("2001:db8::/32").is_private)
+         self.assertEqual(True, ipaddress.ip_network("2001:10::/28").is_private)
+         self.assertEqual(True, ipaddress.ip_network("fc00::/7").is_private)
+@@ -2390,6 +2395,20 @@ def testReservedIpv6(self):
+         self.assertEqual(True, ipaddress.ip_address('0::0').is_unspecified)
+         self.assertEqual(False, ipaddress.ip_address('::1').is_unspecified)
+ 
++        self.assertFalse(ipaddress.ip_address('64:ff9b:1::').is_global)
++        self.assertFalse(ipaddress.ip_address('2001::').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:1::1').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:1::2').is_global)
++        self.assertFalse(ipaddress.ip_address('2001:2::').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:3::').is_global)
++        self.assertFalse(ipaddress.ip_address('2001:4::').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:4:112::').is_global)
++        self.assertFalse(ipaddress.ip_address('2001:10::').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:20::').is_global)
++        self.assertTrue(ipaddress.ip_address('2001:30::').is_global)
++        self.assertFalse(ipaddress.ip_address('2001:40::').is_global)
++        self.assertFalse(ipaddress.ip_address('2002::').is_global)
++
+         # some generic IETF reserved addresses
+         self.assertEqual(True, ipaddress.ip_address('100::').is_reserved)
+         self.assertEqual(True, ipaddress.ip_network('4000::1/128').is_reserved)
+diff --git a/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.VFnObz.rst b/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.VFnObz.rst
+new file mode 100644
+index 00000000000000..f9a72473be4e2c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2024-03-14-01-38-44.gh-issue-113171.VFnObz.rst
+@@ -0,0 +1,9 @@
++Fixed various false positives and false negatives in
++
++* :attr:`ipaddress.IPv4Address.is_private` (see these docs for details)
++* :attr:`ipaddress.IPv4Address.is_global`
++* :attr:`ipaddress.IPv6Address.is_private`
++* :attr:`ipaddress.IPv6Address.is_global`
++
++Also in the corresponding :class:`ipaddress.IPv4Network` and :class:`ipaddress.IPv6Network`
++attributes.
diff --git a/meta/recipes-devtools/python/python3_3.10.14.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
index 31c458c09a..7d8fb76103 100644
--- a/meta/recipes-devtools/python/python3_3.10.14.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -36,6 +36,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
+           file://CVE-2024-4032.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.35.7


