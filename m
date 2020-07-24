Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.7515.1595601764433711991
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2020 07:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=aKSLpMfA;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1094; q=dns/txt; s=axis-central1;
  t=1595601765; x=1627137765;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/8cQ4RuN3q3WbqSwKZ8SSpmbAC3QlbQwmew06uZKWF4=;
  b=aKSLpMfAHcp8b+X7g+lfgs91IRy9T3au+/+MFSUtMC1u8Bh3xc5Oqaq+
   sQ/uHMfYDrNjjBTnNt6Y+dVLBfEPccvBzT95YTZIVnSHhD5kW9jgFfsm5
   FSr7Hrc2uAjBTpLLMDL+9qmr0mQ/hCgIInfKi9CjJ2AR5DEm8t7KvETmN
   rFnR3Tk2GStMT0dHqJqeuRcIiR0AwsjuVlIMBgPN9+2NATq8V7IMMi7C4
   Boeku4tzbDrfhoQ/XatrL9J3p9vEf8GGReY2rH0G+KRbISUMXlCg7olxI
   8TWFOGUY5qX9/OzW1k34HveMBATCzJoI0l9jGQ3SCb0O3g2nfkzHLy4rT
   Q==;
IronPort-SDR: cpf+qrsmWkgBKuA9M5JrSvwH5moXIpP522d+IK1G8FFueLfvNFJmrUK9HAXzxXlIld8K987unL
 K/eHRL+5i9wbCWY6wk4HaAv+st66sxljtJN9fRUWhlzjNAE2xFJBCgmk0jB2QFIWBziX/S8Euj
 3eys+EM6JqF8OD2yTab5E0bg+nyYm+vCazW0TdHqtuWqhlN4YSOZ4DWl7aX4NSY/ZUkrcnCeJI
 Us6WSDRiZu9Y/+QCbdsEVfnOUUyWYCl8Q/j7aqtyP455ml5nQfhQytsXywYLYVBy22RABaix4k
 7eI=
X-IronPort-AV: E=Sophos;i="5.75,391,1589234400"; 
   d="scan'208";a="10868075"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>
Subject: [PATCH v6] Add package managers as a plugin
Date: Fri, 24 Jul 2020 16:42:28 +0200
Message-ID: <20200724144241.9977-1-fredrigu@axis.com>
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

Changes since v5:
* Moved code in package_manager/rpm/package_manager.py to package_manager/rpm/__init__.py
* Fixed places that used package_managers instead of package_manager
* Added missing imports in a function.
