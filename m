Return-Path: <tobias.henkel@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1E76D7E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:34:02 +0000 (UTC)
Received: from duffman.bmw-carit.intra (duffman.bmw-carit.intra
	[192.168.101.67])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tobias.henkel)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id BF92040072
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 08:05:21 +0100 (CET)
From: Tobias Henkel <tobias.henkel@oss.bmw-carit.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2013 09:33:54 +0100
Message-Id: <1384245243-20247-1-git-send-email-tobias.henkel@oss.bmw-carit.de>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/9] icecc.bbclass: Fix some issues
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
X-List-Received-Date: Tue, 12 Nov 2013 08:34:03 -0000

From: Tobias Henkel <tobias.henkel@bmw-carit.de>

Hello,

while trying to get icecc work I faced some issues which are addressed
in this patch series.

First it was difficult to find out the reason why some packages don't
use icecc because the relevant information was missing in the
logs. There were also some messages which were disturbing the normal
log message flow during the build.

I also noticed that changing the ICECC blacklist variables always
caused a full rebuild because the sstate checksums didn't match. So
adding these blacklist variables to BB_HASHBASE_WHITELIST speeds up
working with incremental changes to these variables a lot.

Further I encountered some packages calling the compiler in the
install step. This caused either icecc not being used in this step or
even build failures. For this to work the icecc environment must also
be set in do_install. For this change also a dummy python version of
set_icecc_env was needed because there was at least one package which
provided its own python version of do_install where set_icecc_env
didn't exist.

I also had trouble with our own kernel recipe which caused an error
during recipe parsing. This recipe uses shell expansion in
KERNEL_CC. This causes a syntax error when this variable gets expanded
in get_cross_kernel_cc. This function now shell expands KERNEL_CC if
necessary before expanding it.

Further for some recipes (e.g. icedtea7 in meta-java) it was needed to
add a whitelist to be able to force icecc even if the recipe sets
PARALLEL_MAKE to "" but supports parallel building in a different way.

In some cases I had race conditions when creating the toolchain
package which gets distributed to the icecc nodes. This mostly
happened after the cross toolchain is ready because then several tasks
using the cross toolchain start in parallel. The result was in many
cases a broken toolchain package resulting in build failures.


1..3 : Logging changes
4    : Improve sstate interaction
5..6 : Enable icecc also in install step
7    : Improve KERNEL_CC handling
8    : Add package whitelist
9    : Fix race condition when packaging toolchain

Best regards
Tobias Henkel

Tobias Henkel (9):
  icecc: Log reason in error cases
  icecc: Remove output on stderr when calling which
  icecc: Reduce verbosity with empty PARALLEL_MAKE
  icecc: Add blacklist vars to BB_HASHBASE_WHITELIST
  icecc: Add dummy python version of set_icecc_env
  icecc: Enable icecc also for install step
  icecc: Support shell evaluation of KERNEL_CC
  icecc: Add package whitelist
  icecc: Fix race condition when packaging toolchain

 meta/classes/icecc.bbclass | 75 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 62 insertions(+), 13 deletions(-)

-- 
1.8.3.1


