Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3453B739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:08:51 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so63006577wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5Gg+iYQk2xP+zg/7G/LcQDmc4VpFDGkuAJ/trzCsBgo=;
	b=HY0CD6yJwyYqIaV9PFGfS0lnt7RcvLEDv34hLRsETlJ4xO1X9ZaC8mzlAcMlrGtWOZ
	RrWaKRb7xrsH2V1/3g6mSFWy0bRlIecQGgsZtC2vjrfigg/8Q6/5yPwnLovUPbKxAKnc
	cORrURmcrV78AvhFjoGuNuI2mBn741x0JwbtBK3N9d0/C6eEoxRBkvLUVD2+p6uYgIp2
	ULaZ1H0qTNMaPe0P5+6P/iO3gp3Cc1jHIwNCAsDqoR5ytp+ulNrIqe3+B6JU68Bm/SKG
	WPjoq4TcHlIhmnOmDdGYDOLYj8EqaN9gr0aTHJJd7EU1L4VTgtfmmaPvEOifZuTJbZvf
	34yQ==
X-Gm-Message-State: ALoCoQlcW4bCWIGYJFVq5LXNSvtiSFLBaokJDgelm3l/6AQQy8VArixhngvdV4lEnM2nhbvkXyqz
X-Received: by 10.180.7.129 with SMTP id j1mr7287174wia.39.1436796531080;
	Mon, 13 Jul 2015 07:08:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.08.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:08:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:02:58 +0100
Message-Id: <cover.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/7][RFC][HEREBEDRAGONS] Remove bitbake's knowledge of ${B}
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
X-List-Received-Date: Mon, 13 Jul 2015 14:08:54 -0000

Hi,

So when starting a new task if you don't tell bitbake what directories it should
create (and implicit, chdir() into) it uses ${B}.  Which is bitbake knowing
about openembedded variables, and generally frowned upon.

This branch series removes that knowledge, and if a task is executed without any
directories to create or chdir into it just doesn't do anything.

This revealed a few classes and recipes which assume they're being ran in ${B}
so the rest of the series is either adding back [dirs] flags to the tasks, or
making paths absolute.

Testing has been quite minimal: core-image-sato builds but I've not verified the
contents haven't changed yet.

Comments?

Ross


The following changes since commit 7f8286fb9ec9f9d9f606c69e5abd717078ace5b2:

  classes/sstate.bbclass: Improve checkstatus using connection cache. (2015-07-12 22:55:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/dirs

for you to fetch changes up to b306a4b740868835ff0e0ac14d8b7ed9afe83091:

  kernel: fix path assumptions (2015-07-13 14:51:57 +0100)

----------------------------------------------------------------
Ross Burton (7):
      build: don't automatically mkdir/chdir B
      build: add remove/mkdir/chdir debugging
      ptest: add dirs
      boost: add dirs
      python: add explicit directory when copying
      libc-package: fix path assumption
      kernel: fix path assumptions

 bitbake/lib/bb/build.py                       | 19 ++++++++++++++++++-
 meta/classes/kernel.bbclass                   |  8 ++++----
 meta/classes/libc-package.bbclass             |  3 +--
 meta/classes/ptest.bbclass                    |  3 +++
 meta/recipes-devtools/python/python3_3.4.3.bb |  2 +-
 meta/recipes-devtools/python/python_2.7.9.bb  |  2 +-
 meta/recipes-support/boost/boost.inc          |  1 +
 7 files changed, 29 insertions(+), 9 deletions(-)

Ross Burton (7):
  build: don't automatically mkdir/chdir B
  build: add remove/mkdir/chdir debugging
  ptest: add dirs
  boost: add dirs
  python: add explicit directory when copying
  libc-package: fix path assumption
  kernel: fix path assumptions

 bitbake/lib/bb/build.py                       | 19 ++++++++++++++++++-
 meta/classes/kernel.bbclass                   |  8 ++++----
 meta/classes/libc-package.bbclass             |  3 +--
 meta/classes/ptest.bbclass                    |  3 +++
 meta/recipes-devtools/python/python3_3.4.3.bb |  2 +-
 meta/recipes-devtools/python/python_2.7.9.bb  |  2 +-
 meta/recipes-support/boost/boost.inc          |  1 +
 7 files changed, 29 insertions(+), 9 deletions(-)

-- 
2.1.4


