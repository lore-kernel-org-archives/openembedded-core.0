Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T27rs-0003Vy-Bq
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 23:44:40 +0200
Received: by wgbds1 with SMTP id ds1so907938wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=zVFHG57rHKQVeXQ6s3OqJn1BEc0btqTeBNIYQIigZuY=;
	b=S7DyUU32s9g+ZH8/WQ/SbS7CbUplkZzxm33XK70X75bnAa6mTTT6ce5Yrn/44jHioO
	3sDah/lp2J1iConODC7zGKXfcToRVdGLGPGrZCaEjGD+BWdcSFoagcmD++LoF8dXMrUQ
	NTsJsBqHHNgghOfmDNqOtM9hNbRnrY8vibNz5SzjT+r9FObBOqI+U4ptXuRi437h0Z2q
	WauGfiRYxb1RjHtJT+wUEbNjP71JGrp5SKjwyDSL6f3rc0k2T090JjMlxxHbpz549RZi
	jexNPRQ9xr4U6fx65XHehBQZe9ubu5mOjJdU0LMHh7+VgI7AkGmkv8zErN7wtYo82ppC
	MT9Q==
Received: by 10.180.105.163 with SMTP id gn3mr6333589wib.2.1345152762649;
	Thu, 16 Aug 2012 14:32:42 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id ck9sm8947122wib.2.2012.08.16.14.32.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:32:41 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 00:32:33 +0300
Message-Id: <cover.1345152235.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmD6HAuKikL5lxeBYyI2gfTsQ/b1B9Ftea1x3RvshL23UwIzecxV5WujsSN79nzqOywX9AS
Subject: [PATCH 0/7] hwclock and a fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 21:44:40 -0000

I dropped the idea of maching Busybox HW dependent. A bad idea indeed.
Now, hwclock init script is packaged separately and pulled into image
only if MACHINE_FEATURES contains rtc value. The inclusion of rtc is 
done in a BACKFILL way.

This pull req. adds a fix which i got into it while working on this - 
add gettext to subversion's DEPENDS.

The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:

  bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/backfill-busybox
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/backfill-busybox

Andrei Gherzan (7):
  utils.py: Modify and rename distro_features_backfill python function
  bitbake.conf: Use the new form of features_backfill function
  bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to
    MACHINE_FEATURES
  bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
  subversion: Add gettext to DEPENDS as msgfmt is needed at compile
    time
  task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
  busybox: Package hwclock.sh initscript separately

 meta/conf/bitbake.conf                             |    5 ++++-
 meta/lib/oe/utils.py                               |    9 ++++++---
 meta/recipes-core/busybox/busybox.inc              |    5 +++--
 meta/recipes-core/tasks/task-core-boot.bb          |    1 +
 .../subversion/subversion_1.7.2.bb                 |    4 +++-
 5 files changed, 17 insertions(+), 7 deletions(-)

-- 
1.7.9.5



