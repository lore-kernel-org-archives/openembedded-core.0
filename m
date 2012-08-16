Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1T28k9-00055x-OR
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:40:45 +0200
Received: by weyr6 with SMTP id r6so2159868wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 15:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=7P7cHY3wfEgZJzFOfsOajxkdlhGhdmqP18k4pPDH/eI=;
	b=PfdJcTsQi2Eha0cuqG3u2X9qu0NDK6Li7l+IgXWeakC4mt6FgDOFHd3h5MHChTVOF9
	e/LsydMUS63Zs4TUzzVoq5xesTrBwIWQwy/uy97tvIfJk1B+xVvsyVKNBWlppnhIMgD9
	q3JbxFKruBCIviel/K3rsycE/H9sraEzJOTQJxdEOm4HpDLW0mWNcpicHyppj7ClgJfD
	0l6woU3KqDQX7bqM4Eybqr3GB/LEnC4UwbYDsfpHlXl8duvHa2r3cD1VpQ/JuhegNcRs
	iCx99vTs7yUfIOz5ZsilU2F+swi6FHU8KvP7YmpG2up0o7dlIwWeEEutYT73CWjTK+YG
	gWsA==
Received: by 10.216.132.76 with SMTP id n54mr1358751wei.135.1345156128080;
	Thu, 16 Aug 2012 15:28:48 -0700 (PDT)
Received: from localhost.localdomain ([79.115.110.29])
	by mx.google.com with ESMTPS id w7sm6348289wiz.0.2012.08.16.15.28.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 15:28:47 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 01:28:40 +0300
Message-Id: <cover.1345155936.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmKE0N6H2xL4aPhK6h9xBbJu+mtAdgfJSlV3C/Y23ntnQ4JD/zrkbFARACp3UYcC3SK7egH
Subject: [V2 PATCH 0/6] Don't have hwclock init scripts for machines without rtc
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
X-List-Received-Date: Thu, 16 Aug 2012 22:40:45 -0000

V2:
Remove: 3f88694 subversion: Add gettext to DEPENDS as msgfmt is needed at compile time
Sent as (it should be) a different pull request.

I dropped the idea of maching Busybox HW dependent. A bad idea indeed.
Now, hwclock init script is packaged separately and pulled into image
only if MACHINE_FEATURES contains rtc value. The inclusion of rtc is 
done in a BACKFILL way.

The following changes since commit af847d36375aa53f0c1ee2a00c97ba9f38837d1b:

  bitbake: bitbake: build.py: Add stampdir argument to cached_mtime_noerror (2012-08-16 12:27:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ag/backfill-busybox
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/backfill-busybox

Andrei Gherzan (6):
  utils.py: Modify and rename distro_features_backfill python function
  bitbake.conf: Use the new form of features_backfill function
  bitbake.conf: Add MACHINE_FEATURES_BACKFILL and append to
    MACHINE_FEATURES
  bitbake.conf: Add rtc to MACHINE_FEATURES_BACKFILL
  task-core-boot: Add busybox-hwclock if MACHINE_FEATURES contains rtc
  busybox: Package hwclock.sh initscript separately

 meta/conf/bitbake.conf                    |    5 ++++-
 meta/lib/oe/utils.py                      |    9 ++++++---
 meta/recipes-core/busybox/busybox.inc     |    5 +++--
 meta/recipes-core/tasks/task-core-boot.bb |    1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

-- 
1.7.9.5



