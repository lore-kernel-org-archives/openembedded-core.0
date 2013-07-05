Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 85AFC62240
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 01:28:19 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so1157052eaj.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jul 2013 18:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ORy1vJOeLQXepbh/gldAoBtD6s1f+c9SVWOA+lKfI2A=;
	b=VhSYNwTKR9nFkb9KjCZk0QuJsPLLV+bKN2gVlnnRBZN+UkREKnwxbOgtqo5tYJpydo
	xgztWslZ7CB7p+CgN90trzWs7G5776qvskhZY2EpM6IP4I4mAFRt+Bml3eBa1nPG+XPm
	XS/6YMJBIh8TvVhfvrklasFqULsZGO+aXrdYcUz/aVb2dWkMMjgVyu2WN28wdPB47Y6t
	6aK9UL7uFo6gbkfA6nya59+PmWJj77BtWHCikGFWGY0/KokN/tT5Q75KxUOldMDNTgZa
	WpPsq4BIsEhMWI3dqcWxEgLt2UtNarGFzrkhEx9ad0YrAD7/yT4hgvbua1kPY9kTshVB
	K42g==
X-Received: by 10.14.48.77 with SMTP id u53mr9118718eeb.154.1372987700028;
	Thu, 04 Jul 2013 18:28:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm9597067eeh.15.2013.07.04.18.28.18 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 04 Jul 2013 18:28:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2013 03:28:21 +0200
Message-Id: <cover.1372987648.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH 0/8] Missing deps discovered in per-recipe builds
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
X-List-Received-Date: Fri, 05 Jul 2013 01:28:19 -0000

I was using simple script to build each component alone:

#!/bin/bash

rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/*
rm -rf log.*

ls -d buildhistory/packages/*/* | xargs -n 1 basename | sort -u > component.list
ncomponents=`cat component.list | wc -l`
i=1
for component in `cat component.list`; do
  echo "Building component: ${component} ($i/$ncomponents)"
  bitbake -c cleansstate ${component} | tee log.${component};
  bitbake ${component} | tee -a log.${component};
  rm -rf tmp-eglibc/abi_version tmp-eglibc/buildstats tmp-eglibc/cache tmp-eglibc/deploy tmp-eglibc/log tmp-eglibc/pkgdata pseudodone tmp-eglibc/saved_tmpdir tmp-eglibc/sstate-control tmp-eglibc/stamps tmp-eglibc/sysroots tmp-eglibc/work-shared tmp-eglibc/work/*
  i=`expr $i + 1`
done
grep "NOTE: Tasks Summary: Attempted.*failed.$" log.*

That should cover missing mandatory dependencies.
Comparing depends.dot files in buildhistory between incremental build and this per-component build should detect at least some autodetected dependencies. In per-component builds it can find only libraries already included in dependency tree, so dependencies lost in buildhistory aren't deterministic.
Even better would be to run per-component build once after building world without removing tmp-eglibc, that will allow components to autodetect all possible libraries and then run another per-component build with removing tmp-eglibc which allows to detect libraries from dependency-tree.


The following changes since commit 3e1dbabbf33a2e461abc92ff10cd970fe604ee38:

  sysstat: backport a patch to fix a parallel building error (2013-07-02 07:58:10 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/deps
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/deps

Martin Jansa (8):
  (lib)telepathy*: add missing dependency on libxslt-native
  gst-plugins-bad: inherit gsettings
  gst-plugins-base: add missing dependency on glib-2.0-native
  taglib: add missing dependency on zlib
  quota: inherit pkgconfig
  libpam: inherit pkgconfig
  systemtap: inherit pkgconfig
  eglibc-locale: add missing dependency on
    virtual/${TARGET_PREFIX}binutils

 meta/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb            | 2 +-
 meta/recipes-connectivity/telepathy/telepathy-glib_0.20.1.bb         | 3 +--
 meta/recipes-connectivity/telepathy/telepathy-idle_0.1.14.bb         | 3 +--
 .../telepathy/telepathy-mission-control_5.14.0.bb                    | 4 +---
 meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb      | 1 +
 meta/recipes-core/eglibc/eglibc-locale.inc                           | 5 +++++
 meta/recipes-extended/pam/libpam_1.1.6.bb                            | 2 +-
 meta/recipes-extended/quota/quota_4.01.bb                            | 2 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb                       | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb         | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb        | 2 +-
 meta/recipes-support/taglib/taglib_1.8.bb                            | 2 ++
 12 files changed, 17 insertions(+), 13 deletions(-)

-- 
1.8.2.1


