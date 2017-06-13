Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 014DC782CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 09:49:55 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5D9nrk7024618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 13 Jun 2017 10:49:54 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dKiSP-0002Yl-SE; Tue, 13 Jun 2017 10:49:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:49:52 +0100
Message-Id: <1497347392-9776-5-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1497347392-9776-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 13 Jun 2017 10:49:55 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 5/5] bitbake.conf: Don't exclude MACHINE/MACHINEOVERRIDES from hashes
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
X-List-Received-Date: Tue, 13 Jun 2017 09:49:56 -0000

A long time ago (6 years), this seemed like a good idea. The reality is
that OVERRIDES should not be being added to hashes and if it is, it likely
needs excluding in its own right. This was a nice workaround but we need
to fix the real underlying issues now. In some cases this means excluding
OVERRIDES from the variables dependency using the vardepsexclude flag however
caution is needed to ensure this is safe.

Variable values used to construct hashes are unexpanded but the values used
are computed after the application of OVERRIDES. The important detail is if
the end resulting unexpanded value changes, not the value of the OVERRIDES
used in the construction of that unexpanded value. This is why dependencies
on OVERRIDES itself shouldn't be in the hashes in general.

The recent DISTRO_FEATURES changes adding in override mappings for them
highlighted this issue. We have some good sstate tests which are effective
at highlighting where potential issues arrive with OVERRIDES contamination
(oe-selftest -r sstatetests.SStateTests).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bc438cc..5d5ddec 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -714,11 +714,9 @@ DISTRO_NAME ??= "OpenEmbedded"
 # This works for  functions as well, they are really just environment variables.
 # Default OVERRIDES to make compilation fail fast in case of build system misconfiguration.
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:build-${BUILD_OS}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}${DISTROFEATURESOVERRIDES}:${CLASSOVERRIDE}:forcevariable"
-OVERRIDES[vardepsexclude] = "MACHINEOVERRIDES"
 CLASSOVERRIDE ?= "class-target"
 DISTROOVERRIDES ?= "${@d.getVar('DISTRO') or ''}"
 MACHINEOVERRIDES ?= "${MACHINE}"
-MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
 
 FILESOVERRIDES = "${TRANSLATED_TARGET_ARCH}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}"
 
-- 
2.7.4


