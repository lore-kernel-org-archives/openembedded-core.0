Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7286.1593080056634946542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Zuh4suHC;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1779; q=dns/txt; s=axis-central1;
  t=1593080056; x=1624616056;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lrQL31uvHkH5i7SNUg1NZb1w99UsbX1GGQE6QalQ/HA=;
  b=Zuh4suHCj6OqFluH3C3pwxvpPdzNW+qyKDW8tE2zWWXfF4pr1HEFl9tq
   XAzJTsj0PLg6eWDS644HuMlg+yDs959jRxhHCO2/7/Hzmaq9jrwXZxsLP
   A7RXXOQefT0061QVBW3isT7EoLWydUnBFqGerdE+PKHbOo9KL/ItbZnxb
   ewp+x01pQ4tNIPS3a3oCXpXiIOdAk1MF9+DQuflYJiWQ/GowPCYZo+QKY
   zmpLzFLa+JAVbPAQP1d+2FlXJXyTBq0RB630AX0QS2nKMRExzRW34jDYB
   fq4XwHfwVrg5kpuTE/5PjMhrHsbvdkUSbPNhw241+d+4wUOBNVh7YROk6
   Q==;
IronPort-SDR: GWY/KtPD7GF6b1MKhjswqgdYbAmrvj06P+qrcLSDR6/bPbXETCBTExa/I+cz1zFRKmUiwRpvTr
 jrIU08EkcAtJp9QYraRiQqNBVpTYdQw6cmUwXFIcBCZxMSo8Ke4dODbTXaxFJpsrs+Ov67QPKT
 RlGp7yCynYknFgqEOp+5T9747nCenv8AWcTIgIojUvoUNlTTv08uIUfjTJL7SUoM4ZpixDjPAN
 QeIViY50JovliOen3V0g/SwcdF/G0s+aV31tCbmx/irirB6aqlitjRHyEkNyVQEzY/ALSJrpgp
 xoQ=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185124"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>
Subject: Add package managers as a plugin
Date: Thu, 25 Jun 2020 12:13:47 +0200
Message-ID: <20200625101413.2783-1-fredrigu@axis.com>
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
