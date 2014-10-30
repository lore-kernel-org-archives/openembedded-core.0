Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 00D8D70EE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:43:28 +0000 (UTC)
Received: from hundeboll.localdomain (5634263f.rev.stofanet.dk [86.52.38.63])
	by mail.hundeboll.net (Postfix) with ESMTPSA id C67D31BF287;
	Thu, 30 Oct 2014 11:43:26 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:43:23 +0100
Message-Id: <1414665805-21734-1-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
MIME-Version: 1.0
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
Subject: [RFCv2 0/2] Support systems with python3 as default
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
X-List-Received-Date: Thu, 30 Oct 2014 10:43:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since more distributions plan to move to python3, steps should be taken
to support such systems.

My previous attemt was pretty intrusive and changed all occurrences of
/usr/bin/{env ,}python to /usr/bin/env python2. Such apporach might break
on systems with no python2 alias in env, so here is a different approach.

Paul Braker suggested to auto-detect the available python version and
setup a fake environment, so I have given it a shot. This is quite simple
and much less intrusive than my first attempt. It utilizes the existing
bitbake env and simply tests a few different python names and, if a
compatible version is found, creates a symlink in ./bitbate/bin/python

Comments/suggestions are welcome!

Martin Hundebøll (2):
  scripts: use '/usr/bin/env' in shebangs with python
  scripts: modify environment to use python2 instead

 bitbake/lib/progressbar.py                         |  2 +-
 scripts/lib/wic/conf.py                            |  2 +-
 scripts/lib/wic/creator.py                         |  2 +-
 scripts/lib/wic/imager/baseimager.py               |  2 +-
 scripts/lib/wic/kickstart/__init__.py              |  2 +-
 .../lib/wic/kickstart/custom_commands/micboot.py   |  2 +-
 .../wic/kickstart/custom_commands/micpartition.py  |  2 +-
 scripts/lib/wic/msger.py                           |  2 +-
 scripts/lib/wic/plugin.py                          |  2 +-
 scripts/lib/wic/pluginbase.py                      |  2 +-
 scripts/lib/wic/utils/errors.py                    |  2 +-
 scripts/lib/wic/utils/fs_related.py                |  2 +-
 scripts/lib/wic/utils/misc.py                      |  2 +-
 scripts/lib/wic/utils/partitionedfs.py             |  2 +-
 scripts/lib/wic/utils/runner.py                    |  2 +-
 scripts/oe-buildenv-internal                       | 30 +++++---------
 scripts/pybootchartgui/pybootchartgui.py           |  2 +-
 scripts/python-env.sh                              | 46 ++++++++++++++++++++++
 18 files changed, 72 insertions(+), 36 deletions(-)
 create mode 100755 scripts/python-env.sh

-- 
2.1.2


