Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QJVYO-0002Bu-1J
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 20:51:36 +0200
Received: by pvc30 with SMTP id 30so2598513pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 11:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=ye9xWDezZKOiGi1HCC50IeYGxv2FO0pJfIdsxIAXacw=;
	b=kkEjqR8yOOql0a/b9v5fh5cf0b3mJgoZ6iOubNqx3C9Z1yfZzeidqvrm1XoJGNiC5p
	T4Mqp+DK1cvLTIp0aljJrctKd0fXURMsti1vqsVjr7F9H1PZxB+uP6BpoSkwrm+KnrVw
	nmfug/RoDRU5QnQwnOnh3dangSmT3dmR03Kl8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=AGFJYVfq1I7226tQgs3YxiNBZbFS6V6K79HSp67ZhGwJWRBcdnb8TTTpQDmWNAI/Im
	c6zszak7X1vT5KXYi3HGK+RIASD6YikRBd8Nw5n8kY4YL5Lm4gccCQpAmJbPnRfW2ZHT
	Oy5VeqDg8E2C856Q6zwETDnx8InBMAgU1bRTk=
Received: by 10.68.9.38 with SMTP id w6mr10154866pba.205.1304966432519;
	Mon, 09 May 2011 11:40:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id p17sm4260922pbt.83.2011.05.09.11.40.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 11:40:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon,  9 May 2011 11:40:25 -0700
Message-Id: <cover.1304966147.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] Fix recipes for uclibc and others
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
X-List-Received-Date: Mon, 09 May 2011 18:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches address build failures when using uclibc
oe/patch.py fix is a backport from oe, we need to fix
BBFILES for oe-core since some class code expects it
to be first entry in BBFILES. gconf-dbus to dbus is needed
for SDKs to compile for angstrom

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/misc-fixes
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-fixes

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (6):
  recipes: Replace gconf-dbus with gconf
  conf/layer.conf: Use .= to append to BBPATH and =+ for BBFILES
  libgalago_0.5.2.bb: Fix compile for uclibc
  liburcu_0.5.4.bb: Let it build on uclibc targets
  lttng-ust_0.12.bb: Fix compilation on uclibc
  oe/patch.py: Remove series file during Clean()

 .../recipes-gnome/gnome/libgnomekbd_2.26.0.bb      |    2 +-
 meta/conf/layer.conf                               |   10 ++++-
 meta/lib/oe/patch.py                               |    1 +
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 ++
 meta/recipes-gnome/gnome/gnome-desktop.inc         |    2 +-
 meta/recipes-gnome/gthumb/gthumb_2.12.2.bb         |    2 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    2 +-
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |   50 ++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |    4 +-
 meta/recipes-support/libproxy/libproxy_0.4.6.bb    |    2 +-
 meta/recipes-support/liburcu/liburcu_0.5.4.bb      |    2 +-
 11 files changed, 73 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch

-- 
1.7.4.1



