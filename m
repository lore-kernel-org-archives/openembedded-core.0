Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Top43-00076L-Mt
	for openembedded-core@lists.openembedded.org;
	Sat, 29 Dec 2012 06:34:38 +0100
Received: by mail-pa0-f48.google.com with SMTP id fa1so6417920pad.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Dec 2012 21:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=RqwISqMtWk28LEszNTajMhTcOSDMRQRjwKKoAfMPN+o=;
	b=wQ5MrDSm94MIMQYAWjv90Na5lgAMb53iLDbeVQWLUX0T2UKyXZHSW87/FY7P7+pxw5
	KOj3+2rEb7ABSo3+ec3I1OIo8XX6Ua3WgVuTaEXsEAt1ZAMlM8ChmJA4Nsk0sYzHMJL+
	JM8gJK4WwviXyF+skfCIH1x0cWRbA692qGpvZC6T8e8GvoQmMd/2joSbqPfpVVpzTDiy
	NFhANm6nQKtdooiXciIAp5crrGUPSPNerzySpDOVG4v8ptTuQZ4A9igddsz99tAcd0+1
	Dm6iVWmwy36vlMV6UNPMYtHjNATbU7SfNpJj+Y6fq2GuRm6IGxZ4vav6TxTwokaK7wb3
	Js3Q==
X-Received: by 10.66.82.73 with SMTP id g9mr104680624pay.5.1356758374417;
	Fri, 28 Dec 2012 21:19:34 -0800 (PST)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id vs3sm20848581pbc.61.2012.12.28.21.19.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Dec 2012 21:19:32 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Dec 2012 22:19:22 -0700
Message-Id: <cover.1356758000.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 0/6] Add the ability to use chkconfig's update-alternatives
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
X-List-Received-Date: Sat, 29 Dec 2012 05:34:38 -0000

From: Christopher Larson <chris_larson@mentor.com>

This short patch series fixes a few issues with the chkconfig recipe to
prepare for packaging of its C implementation of update-alternatives, enables
this packaging, adds a recipe with minimal deps for the -native case, and
fixes a couple issues in opkg-native and update-alternatives.bbclass.

With this applied, you can use this implementation of update-alternatives
rather than cworth's by defining:

    VIRTUAL-RUNTIME_update-alternatives = "chkconfig-alternatives"
    PREFERRED_PROVIDER_virtual/update-alternatives = "chkconfig-alternatives"
    PREFERRED_PROVIDER_virtual/update-alternatives-native = "chkconfig-alternatives-native"

I've sanity checked both package and image buildhistory, and the only changes
are due to the particular layout of the alternatives directories, which is
reasonable. I've also confirmed that image do_rootfs run times have dropped by
7 seconds on average, so it at least doesn't regress that. Of course, the main
benefit to being able to use this implementation is the removal of the sh
dependency, and that the maintainer of its code is someone other than us and
the opkg maintainer.

Comments welcome. Thanks.


The following changes since commit 69bbce0176183b0dc14eda21e4f6b601443060f0:

  libpng: fix packaging (2012-12-25 14:00:22 -0800)

are available in the git repository at:

  https://github.com/kergoth/oe-core chkconfig-alternatives

for you to fetch changes up to a755aa630c6d2095d5950ee00d396f3249e4a912:

  chkconfig-alternatives-native-1.3.59: add recipe (2012-12-28 14:19:56 -0700)

----------------------------------------------------------------
Christopher Larson (6):
      update-alternatives.bbclass: use absolute paths for link targets
      opkg-native: obey virtual/update-alternatives-native
      chkconfig: don't inherit autotools
      chkconfig: obey sysconfdir, base_libdir
      chkconfig: package the update-alternatives implementation
      chkconfig-alternatives-native-1.3.59: add recipe

 meta/classes/update-alternatives.bbclass           |  2 +-
 meta/recipes-devtools/opkg/opkg.inc                | 10 ++++-
 .../chkconfig-alternatives-native_1.3.59.bb        | 43 +++++++++++++++++++
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb | 48 ++++++++++++++++++----
 4 files changed, 91 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-extended/chkconfig/chkconfig-alternatives-native_1.3.59.bb

-- 
1.8.0



