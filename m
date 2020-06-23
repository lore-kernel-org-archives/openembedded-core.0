Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.4699.1592910811064946914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 04:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cFElqwaZ;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1779; q=dns/txt; s=axis-central1;
  t=1592910811; x=1624446811;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lrQL31uvHkH5i7SNUg1NZb1w99UsbX1GGQE6QalQ/HA=;
  b=cFElqwaZyQz1X4fqPFS0xOdgUlsSCCblht7qmxAhFxXuhTgKGpQA4pQq
   V7ljSFsW6z6mvgmOpOux8UN4E7X7I09hEN6age9jDTzUX1B5Rtcm7cdDm
   h3JWJQ3YutWVJKSftZhHm1ilEuFbgBemQRLoAyjT8H4ZfcF5sq4rQNXSh
   SN+hoePrsULJoUyT0MmwvpDEz/AQfRnAWVxq0IXoqhjaBxdAncVR3+oFL
   5sfExU8wW6mpYojJIy2S5WlWkW7bmwjTRgIXpuza+6K9OlL/WdeVxLdIg
   jII2atRUe+28VpBEqM4qXek9uhkOWEUQ1LCrBWhZ8/YSTNcd3EmHXyYdL
   g==;
IronPort-SDR: XUPAsMlzogaLXf5RyEYUQ+viuYmh8gQaQ/dSAB7qv/35jYn7Pc/ixZCQXVWuWHC3Xi0BpJF5U1
 MwyP2KeQ+nyMaLkPBoUXNMUAQrCgQlDN+MgWhg2cF9Qj/PP/LMQ+uTs+ykZo1qpsa2fSY++HQI
 qb8/J7aj0mIF2V6Tv2N4Qj405SnEFDpRJDDnl/jydN8myC934Oox2wQNAiCdNkeM+ErxL6eGqE
 Sh9H4Q5HDCPhi5EChL8S1evLr6SKeaEp++zCIz7bJXmQjv1a8HDks3G8+KQo2md4PnWOlZmymn
 oLg=
X-IronPort-AV: E=Sophos;i="5.75,271,1589234400"; 
   d="scan'208";a="9815766"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>
Subject: Add package managers as a plugin
Date: Tue, 23 Jun 2020 13:13:26 +0200
Message-ID: <20200623111328.5838-1-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Poky today has three different package managers, the well-known formats deb
and rpm is supported as well as ipkg that is good for embedded devices.

When building and having a good cache hit, a significant amount of time is
spent in the phase of generating a rootfs, which is really about the
performance of the package manager. ipkg is way slower than deb or rpm. To
save build time and also get a package manager that is suitanle for use on
targets where flash memory is a concern, support for apk is suggested.

However, it might or might not be what's wanted for Poky since it increases
the test matrix. Therefore this patch series refactors the package
management code so that it's possible to add more package managers in other
own layer. I will send another patch serie that will add apk.

Perfomance metrics below, (note that this includes build times).

APK
===
bitbake core-image-minimal
15.84s user 2.60s system 0% cpu 1:26:19.21 total
16.01s user 2.58s system 0% cpu 1:26:03.72 total
15.69s user 2.61s system 0% cpu 1:26:45.45 total

bitbake core-image-minimal -c cleansstate
bitbake core-image-minimal -c clean
bitbake core-image-minimal -f -c do_rootfs
0.55s user 0.06s system 4% cpu 14.236 total
0.54s user 0.08s system 4% cpu 15.247 total
0.52s user 0.15s system 4% cpu 15.143 total

RPM
===
bitbake core-image-minimal
18.57s user 3.09s system 0% cpu 1:31:29.09 total
18.58s user 3.08s system 0% cpu 1:30:53.80 total
18.20s user 3.31s system 0% cpu 1:31:06.69 total

bitbake core-image-minimal -c cleansstate
bitbake core-image-minimal -c clean
bitbake core-image-minimal -c do_rootfs -f
0.58s user 0.10s system 3% cpu 19.470 total
0.57s user 0.09s system 3% cpu 19.480 total
0.60s user 0.07s system 3% cpu 20.381 total
