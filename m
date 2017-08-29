Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD8F78296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E85D718410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id WDK5NXtaq-e0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:34 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0054718421
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC46D1A0AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF3251A0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B37E821F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:33 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v7TK0WJ3009655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 22:00:32 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v7TK0WTo009654
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Aug 2017 22:00:32 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 22:00:28 +0200
Message-Id: <cover.1504036763.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH 0/2] Avoid build failures due to setscene errors
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
X-List-Received-Date: Tue, 29 Aug 2017 20:00:35 -0000

Occasionally, we see errors on our autobuilders where a setscene task
fails to retrieve a file from our global sstate cache. It typically
looks something like this:

WARNING: zip-3.0-r2 do_populate_sysroot_setscene: Failed to fetch URL
file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz, attempting
MIRRORS if available
ERROR: zip-3.0-r2 do_populate_sysroot_setscene: Fetcher failure:
Unable to find file
file://66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz;\
downloadfilename=66/sstate:zip:core2-64-poky-linux:3.0:r2:core2-64:3:\
66832b8c4e7babe0eac9d9579d1e2b6a_populate_sysroot.tgz anywhere. The
paths that were searched were:
    /home/pkj/.openembedded/sstate-cache
ERROR: zip-3.0-r2 do_populate_sysroot_setscene: No suitable staging
package found
WARNING: Setscene task
(meta/recipes-extended/zip/zip_3.0.bb:do_populate_sysroot_setscene)
failed with exit code '1' - real task will be run instead

As the last warning indicates, the build will proceed and the real
task will run and the build will eventually complete. However, due to
the two errors above, bitbake will return with an error code which
causes the autobuilder to treat the build as failed and it proceeds to
throw everything it built away.

Since this is quite pointless and causes unnecessary build resources
to be spent and grief from the developers, the two patches in this
change set turn the errors from setscene tasks into warnings.

//Peter

The following changes since commit bc2e0b2e9b95707d96c840dade12b00e1450ecc3:

  libsdl: Move PACKAGECONFIG options from meta-mingw (2017-08-29 12:23:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib pkj/setscene-errors
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/setscene-errors

Peter Kjellerstedt (2):
  bitbake: fetch2: Allow Fetch.download() to warn instead of error
  sstate.bbclass: Do not cause build failures due to setscene errors

 bitbake/lib/bb/fetch2/__init__.py | 20 +++++++++++++++-----
 meta/classes/sstate.bbclass       |  5 +++--
 2 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.12.0


