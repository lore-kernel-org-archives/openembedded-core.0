Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.4351.1593718150102815778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2020 12:29:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=fGpF+xra;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=840; q=dns/txt; s=axis-central1;
  t=1593718150; x=1625254150;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XyWYzNED3F7d5rrTK4GaNI1B+JbTouo1PP/9gci0cKo=;
  b=fGpF+xraWy3G/gAEtAoU9Jnh3Qa5JWhVe/+hf1+SMfABAGtWvauflBJh
   T5R97dRHkv2JDShfSxEDbDHZIlVVjnt0uguO29OgHAVxMJkHR1ZGsLVdm
   q7PLBbQB0VVyOX8ZdatDsLnecdCAB83c0JUj+Eqi8nJ0AhgqWazgXI/+z
   1sDqkHEGJLsKJqXny6aKY72H8Jnwrgwmdiq6Qb8so4cD0Oi9EhftiDRyu
   vyWPpz1wrgnNi4LUyFG/Iu3eIBOa22nIDet5l9HMFWC/Ceub1lrzCyVtf
   oCKtADFXSXokNqgXUm1pfPdB1qWzr87fZKqt7a+uJFviDrjQ8TrcuXzbQ
   A==;
IronPort-SDR: VukTE5JLJDTjACf/S8du4N0NDIOhoeQumCZhu6WxKdhdx2XudOtXebSpjRUMKp89jdQ1oHTCeN
 laMYApkXVfAMXFs13VtDwtyxaoxkKHy7UwIZkn1N8Gd8si4CZqTX6d/wlAFidFYgkfdI3CPqt9
 qA4M51pjjgihoFfnV0tK05CY1E18wsxDnEJV+vtHjyfmvRZ93ok5cpN1cwkmIdIjjJK6697NU2
 1ZyD37pOSQecL5TtpPsfTeBYnI3cWrBvdv5cJ5md91ytefnOHhTEmYO5Ivxsd+ejVXVIZWjFwe
 yVU=
X-IronPort-AV: E=Sophos;i="5.75,305,1589234400"; 
   d="scan'208";a="10441132"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>
Subject: Add package managers as a plugin
Date: Thu, 2 Jul 2020 21:29:03 +0200
Message-ID: <20200702192906.6301-1-fredrigu@axis.com>
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
this is the second patch series.
