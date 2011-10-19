Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RGUCB-0005kz-Sm
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 13:20:27 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 19 Oct 2011
	13:14:33 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 13:14:45 +0200
Message-ID: <cover.1319022793.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Fix race while building external modules
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
X-List-Received-Date: Wed, 19 Oct 2011 11:20:28 -0000
Content-Type: text/plain


When building an image with several external modules, a race is likely to
occur. This race is when building scripts in the staged kernel tree (sysroot).

To prevent this, we promote the do_make_scripts() function to a task, which we
protect by a lock. Tip on how to make this work was received by Richard in
[1]. To avoid new problems, introduced by this promotion, we make this new
task depend on do_populate_sysroot from the modules dependencies
(i.e. virtual/kernel).

This patch has been extensively tested on the 2011-1 release branch, on a
custom ARM-machine and distro with several external modules.

[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011163.html

The following changes since commit e31dd9b65f3b03f79cabab25eca157532de3bd9c:

  fontconfig: fix fix-pkgconfig.patch (2011-10-18 18:13:47 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core ext-mod-race
  https://github.com/darander/oe-core/tree/ext-mod-race

Anders Darander (1):
  module.bbclass: add lock to prevent error bulding ext modules

 meta/classes/module.bbclass |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

-- 
1.7.7



