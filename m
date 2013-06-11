Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F02F06A9BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 14:28:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5BES5se020765
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:28:05 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 11 Jun 2013 07:28:04 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Jun 2013 09:28:02 -0500
Message-ID: <cover.1370960556.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] tmux new does not take tw commands
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
X-List-Received-Date: Tue, 11 Jun 2013 14:28:03 -0000
Content-Type: text/plain

This got routed to me because the visible error message says
	Execution of "pseudo /bin/bash" failed

but actually it's nothing to do with pseudo. The real
problem is that the tmux class in terminal.py is producing
a string like:
	'tmux new <args> {command}'

This then gets .format called on it, substituting in a command. If
the comand is "pseudo /bin/bash", this is:
	'tmux new <args> pseudo /bin/bash'
which is a usage error. It would be okay if it were:
	'tmux new <args> "pseudo /bin/bash"'

So add double quotes. Of course, that assumes that <command> never has
double quotes in it... If it does, that may need a fancier solution.

The following changes since commit b4f208f418d18f2a4e78a56bebacef481061d917:
  Saul Wold (1):
        tar: don't mv tar for nativesdk

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/tmuxfix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/tmuxfix

Peter Seebach (1):
  handle two-word commands with tmux

 meta/lib/oe/terminal.py |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)


