Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 85B70713DB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 17:28:05 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id fa1so17915857pad.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Sep 2014 10:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=oqKAxGLPGfDg4I5IBA2cjQg/YwFuYd2h+YjG9Hjz8H0=;
	b=Ds/mOPCc8PdBXsLcHgmutxItuXN5FWdyj0yev8Q/MkSWsnxa8aDShQ39N2XD0KXaDh
	EyycDOsF0RFdJ2y5zzUmCwK+0AFfuM5ohLswgxcAauMM1up0wKLiD7Wa183ldSwdVeLo
	reZrF2yRIZh5PbkQQ4FKHGN0zU2uGQVYkuAfs3rb5HHvDA3nVQHmvPrdBWbZG5yndb7w
	YZ4tmQfV4sSOgQ5GLgEmlA9xU0Bx+ovOw2NfSkh2rTTR57xvDyc8hCuE5M8yqazGDhk1
	TLDyDwmotSF/QdKoaIaGbvpEO6nzbtVVIq2DzLAFAMTCM+ED6Zyb+JwEXq6rUVQNNsvi
	PXCQ==
X-Received: by 10.66.90.162 with SMTP id bx2mr35723238pab.39.1409765281390;
	Wed, 03 Sep 2014 10:28:01 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id zm5sm7367263pbb.76.2014.09.03.10.27.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 03 Sep 2014 10:28:00 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Sep 2014 10:27:39 -0700
Message-Id: <cover.1409764769.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/8] Various fixes to obey LDFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Sep 2014 17:28:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

This patch series fixes 8 recipes to obey LDFLAGS. These issues are easy to
miss, now that the internal toolchain defaults to passing the correct
GNU_HASH, so GNU_HASH warnings when LDFLAGS isn't obeyed are only seen when
using an external toolchain. These were kept in meta-sourcery or meta-mentor,
but given these are general correctness fixes, regardless of the lack of
warnings for most users, I think they're appropriate for upstream inclusion.

The following changes since commit e72aac2ae9e5fce1715fa04b7e94034fd06892d9:

  alsa-lib: libasound should runtime depends on alsa-conf (2014-09-03 11:30:11 +0100)

are available in the git repository at:

  git@github.com:kergoth/openembedded-core ldflags-fixes
  https://github.com/kergoth/openembedded-core ldflags-fixes

for you to fetch changes up to 2cddd349eb9cafbbaf5257fb61beb9dc249df85c:

  python: obey LDFLAGS (2014-09-03 10:18:37 -0700)

----------------------------------------------------------------
Christopher Larson (8):
      zlib: obey LDFLAGS for tests
      gdbm-1.8.3: obey LDFLAGS
      ossp-uuid: obey LDFLAGS
      setserial: obey LDFLAGS
      hostap-utils: obey LDFLAGS
      blktrace: obey LDFLAGS for btrecord
      irda-utils: obey LDFLAGS
      python: obey LDFLAGS

 .../hostap/hostap-utils-0.4.7/ldflags.patch        | 27 ++++++++
 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |  1 +
 meta/recipes-bsp/setserial/setserial/ldflags.patch | 23 +++++++
 meta/recipes-bsp/setserial/setserial_2.17.bb       |  1 +
 .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 79 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                | 18 +++--
 .../zlib/zlib-1.2.8/ldflags-tests.patch            | 45 ++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 .../ossp-uuid/ossp-uuid/ldflags.patch              | 23 +++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  1 +
 meta/recipes-devtools/python/python_2.7.3.bb       |  3 +-
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |  8 ++-
 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch | 22 ++++++
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |  3 +-
 14 files changed, 245 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
 create mode 100644 meta/recipes-bsp/setserial/setserial/ldflags.patch
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
 create mode 100644 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch

-- 
1.8.3.4


