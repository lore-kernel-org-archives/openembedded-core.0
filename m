Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (unknown [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 96C486ABDB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 11:56:44 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id k14so6811753wgh.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 04:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=rArj+PAmalfGoQKCI8N+T/WRfvvVZJ9kKM0HPoJgg7A=;
	b=IS/bHiXjX3h2QouesBChcCHjzS3vOukGI2IJ14Dprl/ULhzhsD1VUO0Rqcp7zVTItG
	zXp59vI/BkrzJgkvBwfcjooRguXb1+f/7KgUb56uigkIsG3gKeF95cl8t0oSUp6dtHww
	f0lFoAWzxcFATKwYNhRs3Y0XQPQ58dsEtRuuBW0CvMRuAFQhDVhFD21jk07BLO0qqmcF
	x8JL4gk98Hn+lMsI+ForPo5yQuI9xnb0WRoSTBBXltaql1ZkPv7oKbInZvr30s1a1Ge6
	usTBGhx2s8abgcOoO8noSK8mUZcPO6riZxWo+6ihVz4U4cOGGhyspqp7rkOymaexjx9P
	zYag==
X-Gm-Message-State: ALoCoQlTZmBuR6rYkoVsd4XNzj0X+YrmDwxg8qbwM6+w/X2W3nz4xcle1xiR3+byvhLs7cwnHp9p
X-Received: by 10.194.60.114 with SMTP id g18mr50848741wjr.61.1401278205202;
	Wed, 28 May 2014 04:56:45 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.43
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:22 +0100
Message-Id: <cover.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 0/4][RFT] Stop disabling autoheader warnings
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
X-List-Received-Date: Wed, 28 May 2014 11:56:45 -0000

Hi,

When autoheader emits a warning along the lines of "missing template for
variable HAVE_FOO", it's not moaning that you need to be more verbose for nice
comments in the config.h files.  In fact it's saying that it's not writing that
symbol at all to config.h.in, so even if that test succeeds this isn't reflected
in config.h.

I removed the patch and did a build of core-image-sato: readline was the only
recipe that failed.  I'll spare you the anger but readline is special...  the
short version is that if an upstream package hand-maintains config.h.in instead
of using autoheader then set EXTRA_AUTORECONF += "--exclude=autoheader" and
autoheader won't be executed.

This is also a call out for a request for testing: I've done a core-image-sato
build with this but haven't yet done world or any other layers.  If there's
breakage it's often due to the upstream being unconventional so feel free to
prod me for help.

Ross

The following changes since commit c42df8cb48ceb6081680ffb802e85dad557cf29c:

  i2c-tools: Add i2c-tools to the core (2014-05-28 09:42:14 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/autoconf

for you to fetch changes up to a12ceb971fefe2b2f412f46b82c0d5ea6043ad62:

  autoconf: don't disable the autoheader warnings (2014-05-28 12:47:58 +0100)

----------------------------------------------------------------
Ross Burton (4):
      readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
      readline: exclude autoheader from autoreconf
      readline: use upstream's aclocal.m4 as acinclude.m4
      autoconf: don't disable the autoheader warnings

 meta/recipes-core/readline/files/acinclude.m4      | 1871 --------------------
 .../readline-6.3/config-dirent-symbols.patch       |   34 +
 meta/recipes-core/readline/readline.inc            |   10 +-
 .../autoconf/autoheader-nonfatal-warnings.patch    |   15 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 5 files changed, 41 insertions(+), 1890 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/acinclude.m4
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

Ross Burton (4):
  readline: add missing STRUCT_DIRENT_D_* symbols to config.h.in
  readline: exclude autoheader from autoreconf
  readline: use upstream's aclocal.m4 as acinclude.m4
  autoconf: don't disable the autoheader warnings

 meta/recipes-core/readline/files/acinclude.m4      | 1871 --------------------
 .../readline-6.3/config-dirent-symbols.patch       |   34 +
 meta/recipes-core/readline/readline.inc            |   10 +-
 .../autoconf/autoheader-nonfatal-warnings.patch    |   15 -
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 5 files changed, 41 insertions(+), 1890 deletions(-)
 delete mode 100644 meta/recipes-core/readline/files/acinclude.m4
 create mode 100644 meta/recipes-core/readline/readline-6.3/config-dirent-symbols.patch
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoheader-nonfatal-warnings.patch

-- 
1.7.10.4


