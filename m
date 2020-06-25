Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.7369.1593080507932135272
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 03:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=Y/4fQRoc;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1779; q=dns/txt; s=axis-central1;
  t=1593080508; x=1624616508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lrQL31uvHkH5i7SNUg1NZb1w99UsbX1GGQE6QalQ/HA=;
  b=Y/4fQRochjiKgymX5rpF/iCwQHi5y4mKmpnkJ6s+bcUaWONwjcs0cyBI
   9IgCB5ofTSgamQcVLAdQnzx67TJtJ+/3WmTer5TGmgO6je9dsIvEKJbne
   nMEk5y6i1vyqpZAnGM+iB/Dl57990NvBCOgbRPXwKCFEL+yJvSmaTx54u
   WWGSViaDV0HnfMG2I6xbq0DMNdwke/zzv2VrOtQuTkwwj9X9dmatkAKIy
   NHon8hU4Ln0ZdR3DqAPOsnH8mMjRY22mFHm0KRH12WOKIEZ4D4xgHiYlK
   NdFBF1+TGnRoCXuYZ3f2WdgLSrnXqA46mV+CHAg2X2KQQBicu+pE8RWxP
   Q==;
IronPort-SDR: ogHROao26r5eiTjBbHviEzTeG8otcPGVjQYeeW2YvwNOumI/HCH0oeSaZvZvx3KSLu9SqYxMR0
 Hnjp0N9HH6sgGXvHHm3Yz5S4I7NgSMbp9IIWTOZ6Tm3QLUhRmybVCKVqUERgWoYf4qrfWpA2XE
 7ww6XhGKKJOVVoVOOU0qliP5P7E1R00jPZqijwAuFYqqHgckDFkHwj9APpf1WOChZLYEYtAW9D
 2MpmnbqgmfBqAPKeG2pqoy9k3eE0LmZP/vfUI6KolLmhqbku7r8hirLb7MBB+wffHSKno3gjT2
 ohU=
X-IronPort-AV: E=Sophos;i="5.75,278,1589234400"; 
   d="scan'208";a="10185320"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>
Subject: Add package managers as a plugin
Date: Thu, 25 Jun 2020 12:21:19 +0200
Message-ID: <20200625102145.7139-1-fredrigu@axis.com>
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
