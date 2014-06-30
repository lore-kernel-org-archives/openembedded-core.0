Return-Path: <rewitt@declaratino.com>
X-Greylist: delayed 432 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jun 2014 18:38:34 UTC
Received: from p3plsmtpa07-09.prod.phx3.secureserver.net
	(p3plsmtpa07-09.prod.phx3.secureserver.net [173.201.192.238])
	by mail.openembedded.org (Postfix) with ESMTP id 96AE660702
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jun 2014 18:38:34 +0000 (UTC)
Received: from localhost.localdomain ([74.138.158.48])
	by p3plsmtpa07-09.prod.phx3.secureserver.net with 
	id LiX31o00312wNLy01iXLdC; Mon, 30 Jun 2014 11:31:22 -0700
From: Randy Witt <rewitt@declaratino.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jun 2014 14:29:58 -0400
Message-Id: <1404152999-10661-1-git-send-email-rewitt@declaratino.com>
X-Mailer: git-send-email 2.0.1
Subject: Speed up sdk creation by supporting multicore compressors.
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
X-List-Received-Date: Mon, 30 Jun 2014 18:38:34 -0000

This change allows the user to pick a different compressor to be used after the
sdk is ran through tar. In my testing I found it speeds up sdk creation times
~20-30% if a compressor that supports multiple cores is used. Here are some
measurments:

Using default compressor(bzip2): core-image-minimal-1.0-r0: do_populate_sdk:
Elapsed time: 133.21 seconds CPU usage: 12.3% core-image-sato-1.0-r0:
do_populate_sdk: Elapsed time: 356.85 seconds CPU usage: 11.6%

Using pigz: core-image-minimal-1.0-r0: do_populate_sdk: Elapsed time: 102.62
seconds CPU usage: 15.3% core-image-sato-1.0-r0: do_populate_sdk: Elapsed time:
261.66 seconds CPU usage: 15.6%


The default compressor hasn't been changed and so I've just been doing it using
local.conf for now, but if desired I can submit another patch changing
SDK_COMPRESSION_TYPE to pigz by default.

This also allows for easy use of xz when disk space concerns are more important
than speed.

