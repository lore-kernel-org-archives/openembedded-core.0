Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBC170567
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 16:18:41 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id n3so4384372wiv.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:18:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CBk50kZwJYGU8ji7FFpQolgkszjXxwTz2Q8rNIG0XP8=;
	b=ABwv8zPCJ+8QE1UjcWb1AQ3TH3S6XISbx6cRK/MgiZXzgP38tY06EWBELiQq92NTo9
	BqEQivgYpGobWgwM77HO3x/gBZYucaN9Q7jB35uPtzaO0gU7zdpr/6Eb4O0Ct0g20Vw+
	YL3n/u7IcmcyDeQrdLrPw7p77UejCVAAzYP4MUwZ/nxm5gWlO3W6iuCyhcg/FRcxA+b+
	33hUfgWJdOETPeiyJT/uGDXF9DxyRNPE69LEJh8h+FsJS0nZirPWJId95A7bb1Hvf92j
	GqGYsrJq+jXsQmw0YEvcftAy3deKnCTXj2DIFYSuUG+TtvDzhZnOiBXFxpR1MmOPKQt9
	i+DA==
X-Gm-Message-State: ALoCoQneLd13stuEtjgXDOJSZqD39PFLS+lLgPMpEDsG1UHxe6OVACqjtvBEfGErgm2eCoOH6C/9
X-Received: by 10.180.7.230 with SMTP id m6mr6685289wia.3.1405441122224;
	Tue, 15 Jul 2014 09:18:42 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	au7sm33554040wjc.41.2014.07.15.09.18.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jul 2014 09:18:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 17:18:30 +0100
Message-Id: <cover.1405440532.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 0/7][RFC] Remove enforced --foreign in autoreconf
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
X-List-Received-Date: Tue, 15 Jul 2014 16:18:43 -0000

Hi,

Since 2004 we've been forcibly passing --foreign to automake in autoreconf.
This is a change from upstream behaviour and can actually break packages that
expect GNU behaviour (admittedly the failure case reported was "interesting"),
and I'm on a bit of a mission to remove patches that don't have a solid reason
behind them.

Forcing --foreign doesn't seem that important these days as the majority of
packages are telling automake they're foreign, There are a few packages that
need patches for this change, notably they're mostly packages that haven't seen
a release for ten years.

This series is build tested against a world build in oe-core for NUC, so I'd
call it a demonstration that the patch is viable and would appreciate others
running build tests against other machines or layers.

Ross

The following changes since commit 9e99bcffec594cb5b4c3533200e8eb56d32e6a77:

  insane: Ensure do_package_qa happens after do_packagedata (2014-07-11 23:20:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/automake

for you to fetch changes up to 406153008dc78f4e3198c012f2db98fcac09b5c1:

  autoconf: remove automake patch enforcing --foreign (2014-07-15 17:05:29 +0100)

----------------------------------------------------------------
Ross Burton (7):
      bzip2: use "foreign" automake strictness
      libid3tag: use "foreign" automake strictness
      which: use "foreign" automake strictness
      libmad: use "foreign" automake strictness
      oprofile: use "foreign" automake strictness
      ltp: use "foreign" automake strictness
      autoconf: remove automake patch enforcing --foreign

 .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
 .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 .../which/which-2.20/automake.patch                |   10 ++++++++++
 meta/recipes-extended/which/which_2.20.bb          |    1 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
 .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
 .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 12 files changed, 56 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
 create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

Ross Burton (7):
  bzip2: use "foreign" automake strictness
  libid3tag: use "foreign" automake strictness
  which: use "foreign" automake strictness
  libmad: use "foreign" automake strictness
  oprofile: use "foreign" automake strictness
  ltp: use "foreign" automake strictness
  autoconf: remove automake patch enforcing --foreign

 .../autoconf/autoconf/autoreconf-foreign.patch     |   13 -------------
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    1 -
 .../bzip2/bzip2-1.0.6/configure.ac                 |    2 +-
 .../ltp/ltp/automake-foreign.patch                 |   20 ++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20140422.bb          |    1 +
 .../which/which-2.20/automake.patch                |   10 ++++++++++
 meta/recipes-extended/which/which_2.20.bb          |    1 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    1 +
 .../oprofile/oprofile/automake-foreign.patch       |    7 +++++++
 .../libid3tag/obsolete_automake_macros.patch       |    3 ++-
 .../libmad/libmad/automake-foreign.patch           |   12 ++++++++++++
 meta/recipes-multimedia/libmad/libmad_0.15.1b.bb   |    1 +
 12 files changed, 56 insertions(+), 16 deletions(-)
 delete mode 100644 meta/recipes-devtools/autoconf/autoconf/autoreconf-foreign.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/automake-foreign.patch
 create mode 100644 meta/recipes-extended/which/which-2.20/automake.patch
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/automake-foreign.patch
 create mode 100644 meta/recipes-multimedia/libmad/libmad/automake-foreign.patch

-- 
1.7.10.4


