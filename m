Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.8468.1593776648023218877
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 04:44:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=eKfniPci;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=872; q=dns/txt; s=axis-central1;
  t=1593776648; x=1625312648;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2xaj6xkV+MJTZM+4vtYdjYDSE/1P9idX/xB2qcEbwWY=;
  b=eKfniPciZywJynqtHeTznQBwiyjTR2YRgX7Hhb1x0nd6fo/ukv5udLw4
   FhrqU0L4kbbVvGDi6iXRo0413JzTf1+L5bVi4D0jqZ4nYuyK4hr8d9Q4+
   FzEjirNE8iFHxosOsKMf3FYg6eNlhnpQKhfHdYGuJ6zGqb6pJIWA+klfL
   JqVvXluZGYVTVX4GY6uBJaTT9NBwK1eI3TCYlP65n0yinBIPDh2z/o865
   DxpUnIFttplZ7L2jqNofiztaK7pYjOKEOkaqtxJx8y4gVfmunX0E8wn85
   JvYFRDt1ZS2GGPp61bLqrda3vAMLvnrFesi6CMklg+y6x7+SL0ByyaZpb
   w==;
IronPort-SDR: jmrIy/H2KVka0lTZ/XgCXmG+Xud10/ocTRe39/lWp+qdaCyCy5xhDGEtEKGE5IcDmH1ERgW/SF
 bpLbNGYIG/8vtISABtwbTZIxiw/k3nvVVbjS6fWn0hUzjnFR8uQFuGVWenpFF92MVQA7b9/gQj
 yxokjhiGrAhHLt8EklVLOOcp1LwGaqHYXmuUAtsomAARlgNFFrXny+WfKs5xEgDd3ixn6g6lt3
 HBPnQrDY5UajI9p/wOuQOSt1dXxj6htcc1F/1uiag7jPg9lGdeJOQ2Mff75hxl7fe1Hty+wIar
 SiI=
X-IronPort-AV: E=Sophos;i="5.75,308,1589234400"; 
   d="scan'208";a="10163718"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>
Subject: [PATCH v4] Add package managers as a plugin
Date: Fri, 3 Jul 2020 13:43:50 +0200
Message-ID: <20200703114402.8850-1-fredrigu@axis.com>
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
this series will only move code but keep existing functionality.
