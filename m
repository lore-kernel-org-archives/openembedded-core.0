Return-Path: <olof.johansson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 253CE786D6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 15:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A8DB918835
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id EOWyfEb9asAv
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id DA83A1851A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD5D51A0BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B076B1A0B9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: from lnxolofjn.se.axis.com (lnxolofjn.se.axis.com [10.92.17.1])
	by seth.se.axis.com (Postfix) with ESMTP id A458D2430;
	Fri,  1 Dec 2017 16:50:41 +0100 (CET)
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)
	id 94B3D9C0AD; Fri,  1 Dec 2017 16:50:41 +0100 (CET)
From: Olof Johansson <olof.johansson@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Dec 2017 16:50:19 +0100
Message-Id: <20171201155024.3002-1-olofjn@axis.com>
X-Mailer: git-send-email 2.11.0
X-TM-AS-GCONF: 00
Cc: Olof Johansson <olofjn@axis.com>
Subject: [PATCH 0/5] Improve isELF, gets triggered by ELF anywhere in pathname
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
X-List-Received-Date: Fri, 01 Dec 2017 15:59:08 -0000

If the substring "ELF" is found anywhere in the pathname, the isELF function
would identify the file as an ELF file. The function could also be used to
execute arbitrary shell commands as the user running bitbake, since the file
execution allows processing of shell meta characters like variable expansion.

The isELF function has been copied and was until this patchset available from
two locations, one in lib/oe/package.py and one in package.bbclass. The two
functions had diverged. This is changed so that one common implementation is
used.

Olof Johansson (5):
  lib/oe/package.py: Expose is_elf
  package.bbclass: Make use of common is_elf function
  lib/oe/package.py: is_elf: Don't let filename influence filetype
  lib/oe/package.py: is_elf: Disallow shell specials to be expanded
  lib/oe/package.py: is_elf: Make it less prone to false positives

 meta/classes/package.bbclass | 40 +++++---------------
 meta/lib/oe/package.py       | 88 +++++++++++++++++++++++++++-----------------
 2 files changed, 63 insertions(+), 65 deletions(-)

-- 
2.11.0


