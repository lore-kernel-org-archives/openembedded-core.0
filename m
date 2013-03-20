Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UIFit-0002RL-OM
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 10:54:20 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 28573D20D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:37:32 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Mar 2013 10:37:17 +0100
Message-Id: <1363772243-370-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [RFC] Switching from glibc RPC to TI RPC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 09:54:23 -0000

The main reasons for me to write this email were decissions made by
Linaro Toolchain WG when they started building AArch64 cross toolchains.

One of them was disabling RPC support in glibc as it is marked obsolete.
So I had two ways of handling it:

- add RPC back into glibc in Linaro's cross toolchain
- check how to switch OpenEmbedded to TI RPC

This patch series is my attempt for the latter. I disabled RPC in
eglibc, expanded libtirpc with code taken from glibc (patchset taken
from OpenMandriva distribution) and then went though build failures.

MOUNT_NFS in busybox is not needed on 2.6.23 Linux kernels and is the
only part of code which requires RPC. I assumed that OE does not support
such old kernels nowadays.

nfs-utils already had libtirpc support which just needed to be enabled.

quota needed to be told how to find out RPC headers and how to link with
libtirpc.

rpcbind needed removal of yellow pages support (whatever it is). I took
patch from Buildroot.

So far I did builds only for AArch64 but not checked 'on target'. Please
take a look and tell me does this work will be useful at all before I go
into other recipes.



