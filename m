Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.17126.1593593197065006014
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 01:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fft/5R85;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=843; q=dns/txt; s=axis-central1;
  t=1593593197; x=1625129197;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wXzuwz9E89h1hLY21p6dggaB7CDvPtMGzZUSaUff2lA=;
  b=fft/5R85Vv9l0m0HbAdvcylHJFv0yl1tzzxCakWqV7telSTCCyO4w4+Y
   L3lsmzcsj4RJ1X6W81e38B+86qUY/QMmjcfkTmB5WmtukYzzqBqRCmB4l
   p3Kx+9Y5R4IrwDUHr9L5ahKSgxtMJ4XhLaOtldEh/twkaISSKXYVoAobU
   dSSl+7YLxtnrSQDwfZZtR3C9LBsIaKCTjc9lVpElZe7mxdT0VP+A+/AbZ
   hakpgcTw3pWISsK7rPDOYGlXP38d4YvKYZQvXx4IYMS56vmRLrHQV5fMu
   ggk+0lN1o83AF5j4W2lcaJigqN/oSYkgxf9iOkpPdz5uG4wnAH9y+hpj5
   Q==;
IronPort-SDR: 47udUSpxg5+dynNvPlDQsCnWshdBHm8S0rDWI5+7ORMEe9geS7CP/4GdEbx2e2v/q7AJdSgEJZ
 rBePhN2i1l9HV6GBLeTbpEDutWrzYKHpxPRDhmjICw/In235CebtuPNoPaCe0429K0kbFLQO8d
 3T2tTUZVr9IIl2RKvcZPp3bZF5jIoJJtr/qqBinB6mf6+lXkzhsRga5mPwzVIJzDrkqOdZg/fT
 GFo0TjHdoMPX3uxZi5NkoDBMl/20TPeT9OqqgYdiFcEfxofdhYVdpGEzILF5LdhB9+ROJePCrA
 HXA=
X-IronPort-AV: E=Sophos;i="5.75,299,1589234400"; 
   d="scan'208";a="10379496"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>
Subject: Add package managers as a plugin
Date: Wed, 1 Jul 2020 10:46:33 +0200
Message-ID: <20200701084634.11428-1-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

OE-core today has three different package managers, the well-known formats deb
and rpm is supported as well as ipkg that is good for embedded devices.

When building and having a good cache hit, a significant amount of time is
spent in the phase of generating a rootfs, which is really about the
performance of the package manager. To save build time and also get a
package manager that is suitanle for use on targets where flash memory is a
concern, support for apk is suggested.

However, it might or might not be what's wanted for OE-core since it increases
the test matrix. Therefore I will refactor the package management code to
allow a layer to add a new package manager without editing the meta layer.

This refactor will be divided into multiple patch series to be easier to review,
this first one with a single patch.
