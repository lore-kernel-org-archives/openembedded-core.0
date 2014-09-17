Return-Path: <kergoth@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4871865E1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 01:17:15 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id t60so649788wes.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 18:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4/oYzHm3UE/hgdKgQw+xekDl822D5ttguiYcdIHl6aQ=;
	b=akjtqUFvcwcCuP0Gq6cGONjFJB+rlfSb6vstPViU8l82GNDPW0O/tfzL2w7ki6cyfH
	wBoesnb2znJ79+t3WSEMk/od6UJvc4yK+wHtyhyGlbZqCjEdFrBXtnOrG3oz2H7Vzveb
	AyLERalqoadfPYzNZSUBO72qOJcmf6W1ak26btU9OydLPrbOcR/tbIBP6w/97a51c3FM
	tg2ADz3afo63PQpGhlT4rGdBhKu3PnhsBcvvAVk9cqUOnjUSPVeDQbvNCx02HkglIHUv
	rnRSxOQgqKnFStNPl2AHVww9JrgM89u9FYT7ncCb7zlpWkTL4fYL0Gg3SLPUh4CgSBQL
	Z0xA==
X-Received: by 10.180.11.234 with SMTP id t10mr1799719wib.49.1410916636392;
	Tue, 16 Sep 2014 18:17:16 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	bg10sm20164661wjc.47.2014.09.16.18.17.14 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Sep 2014 18:17:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Sep 2014 18:16:54 -0700
Message-Id: <1410916622-26204-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409764769.git.chris_larson@mentor.com>
References: <cover.1409764769.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 0/8] Various fixes to obey LDFLAGS
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
X-List-Received-Date: Wed, 17 Sep 2014 01:17:18 -0000

From: Christopher Larson <chris_larson@mentor.com>

This patch series fixes 8 recipes to obey LDFLAGS. These issues are easy to
miss, now that the internal toolchain defaults to passing the correct
GNU_HASH, so GNU_HASH warnings when LDFLAGS isn't obeyed are only seen when
using an external toolchain. These were kept in meta-sourcery or meta-mentor,
but given these are general correctness fixes, regardless of the lack of
warnings for most users, I think they're appropriate for upstream inclusion.

v2 update: added missing patch headers, corrected a bug in the python fix (it introduced a host path contamination issue in do_install, which is now fixed)

This series can be pulled from https://github.com/kergoth/openembedded-core ldflags-fixes

Christopher Larson (8):
  zlib: obey LDFLAGS for tests
  gdbm-1.8.3: obey LDFLAGS
  ossp-uuid: obey LDFLAGS
  setserial: obey LDFLAGS
  hostap-utils: obey LDFLAGS
  blktrace: obey LDFLAGS for btrecord
  irda-utils: obey LDFLAGS
  python: obey LDFLAGS

 .../hostap/hostap-utils-0.4.7/ldflags.patch        | 27 ++++++++
 meta/recipes-bsp/hostap/hostap-utils_0.4.7.bb      |  1 +
 meta/recipes-bsp/setserial/setserial/ldflags.patch | 24 +++++++
 meta/recipes-bsp/setserial/setserial_2.17.bb       |  1 +
 .../irda-utils/irda-utils-0.9.18/ldflags.patch     | 75 ++++++++++++++++++++++
 .../irda-utils/irda-utils_0.9.18.bb                | 18 ++++--
 .../zlib/zlib-1.2.8/ldflags-tests.patch            | 45 +++++++++++++
 meta/recipes-core/zlib/zlib_1.2.8.bb               |  1 +
 .../ossp-uuid/ossp-uuid/ldflags.patch              | 26 ++++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |  1 +
 meta/recipes-devtools/python/python_2.7.3.bb       |  2 +-
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |  8 ++-
 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch | 22 +++++++
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |  3 +-
 14 files changed, 245 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/ldflags.patch
 create mode 100644 meta/recipes-bsp/setserial/setserial/ldflags.patch
 create mode 100644 meta/recipes-connectivity/irda-utils/irda-utils-0.9.18/ldflags.patch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.8/ldflags-tests.patch
 create mode 100644 meta/recipes-devtools/ossp-uuid/ossp-uuid/ldflags.patch
 create mode 100644 meta/recipes-support/gdbm/gdbm-1.8.3/ldflags.patch

-- 
1.8.3.4


