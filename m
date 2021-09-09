Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.2554.1631155861666248912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 19:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.40.192.95])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 1892p0td020589
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 21:51:01 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/2] Fixes for reproducible build and externalsrc
Date: Wed,  8 Sep 2021 21:50:58 -0500
Message-Id: <20210909025100.119427-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Two fixes, the first one ensures that the BUILD_REPRODUCIBLE_BINARIES variable
actually does something useful.  1 (default) normal behavior, anything else it
is off and regular behavior works.

The second makes the reproducible build work properly with externalsrc.

To test this, I did:

bitbake bash
rpm -qp tmp/deploy/.../bash-...rpm --queryformat '[%{FILENAMES} %{FILEMTIMES}\n]'

cleanall the above, and then add:

BUILD_REPRODUCIBLE_BINARIES:pn-bash = '0'

repeat the test...

You can do the same with externalsrc via a bbappen adding externalsrc and repeat
the previous tests and get expected results.

Mark Hatle (2):
  reproducible_build: Honor BUILD_REPRODUCIBLE_BINARIES
  reproducible_build: Work with externalsrc

 meta/classes/reproducible_build.bbclass | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

-- 
2.17.1

