Return-Path: <andreas.reichel@tngtech.com>
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8483E77ABA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id B1AE21E19FA;
	Fri, 21 Apr 2017 14:10:17 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001,
	URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vQviD4hiNTwP; Fri, 21 Apr 2017 14:10:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 19AAA1E1A43;
	Fri, 21 Apr 2017 14:10:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YHk_yC1Vce9b; Fri, 21 Apr 2017 14:10:14 +0200 (CEST)
Received: from localhost.localdomain (p578a821c.dip0.t-ipconnect.de
	[87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id 3CA481E1A42;
	Fri, 21 Apr 2017 14:10:14 +0200 (CEST)
From: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:11:40 +0200
Message-Id: <20170421121145.9797-1-andreas.reichel@tngtech.com>
X-Mailer: git-send-email 2.12.2
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>
Subject: [wic patch 0/5] Add option to wic and use argparse
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
X-List-Received-Date: Fri, 21 Apr 2017 12:16:16 -0000

This series consists of the following changes to wic:

    * wic previously introduced deletion of all single partition
        image files. In some cases, this deletion can fail, however
        this is no reason for wic to fail. Thus, exception handling
        was added to the clean-up function of the direct imager
        plugin.
    
    * wic uses optparse and a rather complicated approach of its
        initialization. It is much easier to switch from the
        deprecated optparse to the argparse library, which also
        supports sub-commands, which wic heavily makes use of.
        The second patch replaces optparse by argparse.

    * For some embedded projects it is necessary to keep the single
        partition image files to further process them. This is
        the case if a user has no rights to mount and cannot extract
        the images from the already merged .direct file, for example.

        For this purpose, a new option is introduced:

            -P, --keep-partition-images

        which prevents deletion of .p* files created by the direct
        imager plugin.

    * Maintainability improvement in engine.py by comparing parameters
        with enum-like string constants rather than repeating the
        strings and fixes in help texts.

The new argument parser was tested with random sampling manually, since
variable names were not changed inside the core of the subcommands and
transition from optparse to argparse is straight forward regarding access
to argument values.

Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>

Reichel Andreas (5):
  wic: Catch errors during image files clean-up
  wic: Use argparse instead of optparse
  wic: Add missing text to usage and help strings
  wic: Add option to keep partition images
  wic: Use enum like dicts for string constants

 scripts/lib/wic/engine.py                |  21 ++-
 scripts/lib/wic/help.py                  |  30 +++--
 scripts/lib/wic/plugins/imager/direct.py |  23 +++-
 scripts/wic                              | 215 +++++++++++++++++++------------
 4 files changed, 191 insertions(+), 98 deletions(-)

-- 
2.11.0


