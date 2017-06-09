Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 2DB0971AD9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 03:41:27 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id 83so23818022pfr.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 20:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XHL856Rh+0qhERI1ptAbHYTeu/2W5VT72yA53ksWYjI=;
	b=QgrD4WyLxagcFsbSA7DtxeLpqVj1Cqg+gTX9k9pLRn/1RuybMTrRpTjWaWNBN0Pq2U
	7/RT0zJJmkM4mYqZpZbcjl5cXGRAVj8vYN+wUUnFKyKkDZ8balCawAolaBaF72GzRZEn
	iv/gwEEql3Ob2hc5PcqOQ/cxKXa4YsTL7i93IFLF2rWqPHjy2teUpA3iZhzjc8Aa0aNc
	DqIUlh8izSJe8roiOSSOEJ5NgiYdm92ZnLKfi1/dofJ1gQjwjGYK0mIvhaSqE2vfd2Ku
	SQ7C+VSgGseYuBT/7DzxsFIY1ey1J92ieDY49xDJos1+Idr25zsRfsyH2wqIFn0krWMi
	jVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XHL856Rh+0qhERI1ptAbHYTeu/2W5VT72yA53ksWYjI=;
	b=psyYuG8zwgpogoejkZb00bYRXRiaNpPF7Qwkiboot+KKLnFMqF6aMooGOvgWviXN9z
	jpqmwS5YwazmEQeQOE3ALkHvWmgcOcKL2zFby4sPT/3V5385tgIsTps9hrvRA9IGLymR
	GsN0eh1jOsLkJ62Abupi3hq2HMELuKkedccAjLi83KAxL+fgUDSpLM6RjLxaV/jrfjvg
	/aLp0yhb9Ijqc8Z0qy8N962T57ewelz1DPbz3/UwHmRBiYeO1pKh1xHG6pdEjgkiNDuw
	XpeNshjDfLTAJAL5zd25RZXX6Paj3j5RO2VP2mvI4170jxQvav5YJCFXMgmggyypo3MY
	noHA==
X-Gm-Message-State: AODbwcBLb+Yk1dSy04BzxOktlws60ZT3e/vN13pQpmAdS4bTM/75mkDO
	QwulxFD/YuVlOy3u
X-Received: by 10.101.85.14 with SMTP id f14mr41104612pgr.112.1496979688132;
	Thu, 08 Jun 2017 20:41:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id
	w3sm10733343pfw.19.2017.06.08.20.41.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 20:41:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 20:41:19 -0700
Message-Id: <cover.1496979431.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH 0/3] Fix imagetests with harderning flags
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
X-List-Received-Date: Fri, 09 Jun 2017 03:41:38 -0000

This patchset is fixing packages to build without textrels when
security flags are turned on. When testing the image built with musl
it clearly segfaults and results in failures in imagetest

Tested with MACHINE=qemux86 TCLIBC=musl bitbake -ctestimage core-image-sato

ore-image-sato-1.0-r0 do_testimage_auto: SUMMARY:
core-image-sato-1.0-r0 do_testimage_auto: core-image-sato () - Ran 13 tests in 19.907s
core-image-sato-1.0-r0 do_testimage_auto: core-image-sato - OK - All required tests passed
core-image-sato-1.0-r0 do_testimage_auto: RESULTS:
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - connman.ConnmanTest.test_connmand_help - Testcase 961: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - connman.ConnmanTest.test_connmand_running - Testcase 221: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - date.DateTest.test_date - Testcase 211: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - df.DfTest.test_df - Testcase 234: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - oe_syslog.SyslogTest.test_syslog_running - Testcase 201: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger - Testcase 1149: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart - Testcase 1150: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - oe_syslog.SyslogTestConfig.test_syslog_startup_config - Testcase 202: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - parselogs.ParseLogsTest.test_parselogs - Testcase 1059: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - ping.PingTest.test_ping - Testcase 964: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - scp.ScpTest.test_scp_file - Testcase 220: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - ssh.SSHTest.test_ssh - Testcase 224: PASSED
core-image-sato-1.0-r0 do_testimage_auto: RESULTS - xorg.XorgTest.test_xorg_running - Testcase 1151: PASSED
NOTE: Tasks Summary: Attempted 5732 tasks of which 5717 didn't need to be rerun and all succeeded.

The following changes since commit 186882ca62bf683b93cd7a250963921b89ba071f:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/hardening-fixes
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/hardening-fixes

Khem Raj (3):
  testimage.bbclass: Correct the comment to state right dir for test
    cases
  pulseaudio: disable PIE flags when hardened flags are enabled
  rng-tools: Fix textrels on 32bit x86

 meta/classes/testimage.bbclass                     |   2 +-
 .../pulseaudio/pulseaudio_10.0.bb                  |   2 +
 .../rng-tools-5-fix-textrels-on-PIC-x86.patch      | 104 +++++++++++++++++++++
 meta/recipes-support/rng-tools/rng-tools_5.bb      |   1 +
 4 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/rng-tools/rng-tools/rng-tools-5-fix-textrels-on-PIC-x86.patch

-- 
2.13.1


