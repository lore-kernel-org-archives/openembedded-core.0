Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF96BC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 15:20:11 +0000 (UTC)
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web10.29637.1719415205039021433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 08:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XoX/v4Gy;
 spf=pass (domain: mvista.com, ip: 209.85.214.195, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-1f4c7b022f8so58740375ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719415204; x=1720020004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecGamO4tYdgZl6TJZV+hc/cfJrkBHNWgW3VFQbUoZlA=;
        b=XoX/v4GygIVeHjA/rmw61oajhu/gLxrIL810Sx8bdniWby70SS2J6hfLm5cLDheQGS
         JGbi/Fsry+vvCcOV+Wlj7+tfvx6JGBSS1VeyJzRb1DXkM0+UrXBVmyHCJ3mSk3ULa7q9
         57pUjSUEMWjedehnQvGbz7jc11n00tCXBRHWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719415204; x=1720020004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecGamO4tYdgZl6TJZV+hc/cfJrkBHNWgW3VFQbUoZlA=;
        b=gHFtGQ2f6fqf5KllE08AhQ1yfykyWi6+9IN25xQtJvAlMVujia5qDdZHdKja3b0Sdc
         +lNAxomIkK10cbLD/NgiQt4C96j9t1DCTanx09fbzYp7tOwVdJfbahw0R+77p6CPZ7cS
         nI6hYWSddiyxKh+ZK8t9N1kkGUiERrvCC1W2Y93V11c95/iaDwrKXDfGuqCp31mrOfrr
         f/oH96aXgL12WjY2CtWgPEPRbCXQN1i11dB68agZmdgG0HstU8DnVBsMssc+5kn+8e08
         WKgxN4S5yAo7yPJoPIQ6noDflzAgV4nBXtXTB2A27GjznJ6zrs7P9enXow8OVc9ybDDC
         DuCg==
X-Gm-Message-State: AOJu0Yym4fJNl0YZvpYLHVZctCvbh5TyR7Q8FNZ3bwjkeduPcFVzGjAV
	6V2X22FlL8hVY2ey6qIdYwqY+D4hHjWIFHcCy5lsY1/zoD4qa/XdiVbSgDtN1Y4DRVV0DLvc9P5
	R13k=
X-Google-Smtp-Source: AGHT+IG34Z+5MRZijLx78vbLRJ/vQcYsXhAPrRoxiyWV+EKodyKUwOhw/1FWkbn5HSIhzjMUeiffSA==
X-Received: by 2002:a17:902:e846:b0:1fa:4b9:d002 with SMTP id d9443c01a7336-1fa23bdf6c0mr141576455ad.23.1719415201500;
        Wed, 26 Jun 2024 08:20:01 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.82.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f01fesm100995035ad.24.2024.06.26.08.19.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Jun 2024 08:20:01 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 26 Jun 2024 20:47:44 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] python3: Fix CVE-2024-4032
Date: Wed, 26 Jun 2024 20:47:42 +0530
Message-ID: <20240626151743.21115-1-asharma@mvista.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jun 2024 15:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201173

Upstream-Status: Backport from [https://github.com/python/cpython/commit/ba431579efdcbaed7a96f2ac4ea0775879a332fb]
CVE: CVE-2024-4032

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../python/python3/CVE-2024-4032.patch        | 346 ++++++++++++++++++
 .../recipes-devtools/python/python3_3.12.3.bb |   1 +
 2 files changed, 347 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2024-4032.patch

diff --git a/meta/recipes-devtools/python/python3/CVE-2024-4032.patch b/meta/recipes-devtools/python/python3/CVE-2024-4032.patch
new file mode 100644
index 00000000000..d29ed01c1fa
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
diff --git a/meta/recipes-devtools/python/python3_3.12.3.bb b/meta/recipes-devtools/python/python3_3.12.3.bb
index 9f41cd1e6b8..1ea7aba372f 100644
--- a/meta/recipes-devtools/python/python3_3.12.3.bb
+++ b/meta/recipes-devtools/python/python3_3.12.3.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_storlines-skip-due-to-load-variability.patch \
            file://0001-gh-114492-Initialize-struct-termios-before-calling-t.patch \
            file://0001-test_shutdown-skip-problematic-test.patch \
+           file://CVE-2024-4032.patch \
            "
 
 SRC_URI:append:class-native = " \
-- 
2.44.0


