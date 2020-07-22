Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.18841.1595424690864242356
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 06:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=c2Y/nGBN;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1116; q=dns/txt; s=axis-central1;
  t=1595424691; x=1626960691;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aL21CnIAOTTxxOpbJRkEf07KO50e2zvqoRnsx9g2rfs=;
  b=c2Y/nGBNoDqqp0CeO5OHQLbzkiTsJHa52NOMx1W0hTiHDmJHDLHuZiCk
   yVi+M88NMco+mjidme3fzVIhfmIbaX4plccxOKsnbOYIVTSRrPHLvEQvA
   ReZ0LzcsoR+gnNloXKho/so83i8tkGDIkJFfDa5CtdB5YmKjeyCuwydli
   sqqyX7HY52LOwScM0knC2HFJHMxaHzuVh6lcVZ8rOuQhGRuA8OES1+0i4
   g70MFKhxlIwRWIVhUByRh7dybXDUkx+HgZHVkhVuR1kifYe1rUbAaQeqE
   KT+SpyY7u9FE4xgvL/px5SfnWmCGLp4zLHvNxYPkpG5GYQLLeU+E1aS9m
   A==;
IronPort-SDR: iF8EgU2Jrv3gABQesSlVbo20jDVOshIjKjKn/4yCBd6PHMp885O9bciLrnFXJ8pMVDJaXyjAny
 BBMc/LOK8gefbloVNucEb2wrl5bt1Rnau9H2E+ovDwxx1NEYUROwFZf/aQf2ORf3HsUZzGxxn0
 Hn8pCF89jTj2E1BpSGXEB2o5N7kQEOtTAqGeIuCE0AgWbZd2BTEU32ElUCRUOlT64qakayNHB5
 hQlcFqsEX6VuqRBsMATox3zFMeBQv1GKYZDs5lXOsjt9LYWVyuEHflMbzIYiBVbQxe/eWGu6O6
 +hY=
X-IronPort-AV: E=Sophos;i="5.75,383,1589234400"; 
   d="scan'208";a="11107581"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>
Subject: [PATCH v5] Add package managers as a plugin
Date: Wed, 22 Jul 2020 15:31:07 +0200
Message-ID: <20200722133120.11484-1-fredrigu@axis.com>
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

Changes since v4:
* Removed blank lines in end of new files
* Rename package_managers to package_manager
* Move import statements out from function when it's possible.
* Edit commit message to prepend subject with rpm:, ipk:, deb:, etc.
