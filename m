Return-Path: <ross.burton@intel.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 68CA66AE6C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:11:06 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so4142787eek.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:11:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=yBNcTLz9yqmOhMcWNCsZOy4kFY++oUjDsbsghLY6HBU=;
	b=J3DBOdNm7gHDES2wczR6ZdNPBENh/mpHtnBGx6j0ePydLUcbfxIr+AK3fcn0H/MEDT
	CMQOuJjK/Oqc1vkfBlj4uSJLlfOH9W+OReSxIdoQppdDgRXp8gnEziZY4RAVspNoOmG/
	hpyXct0r0hD5tB4k9B7msDdq1fU3KyBqJcrJMTAqpUU1r1eGjefwqVnzdMi0rTsHVjpW
	4TIqhugJTC1im8YIRxlpS639OFWqz9F/xiYlAoivh0yNUZk7fuSSh8uannrmc4PU4DXj
	aveI9Updcegw4ABEGSInKCtv8T/ivmldINFHhqDy6UEyYkTMm4+FVB/yD4gqqy6AWd4E
	ruHg==
X-Gm-Message-State: ALoCoQnEjHropYyAF/1MAvTM2qlWLZNYOf/20nTWDtpv2kwNqbbkQEGGsVrLZkmcm4AzBnTie1yD
X-Received: by 10.14.101.13 with SMTP id a13mr51730eeg.86.1376388665824;
	Tue, 13 Aug 2013 03:11:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id t6sm65098119eel.12.2013.08.13.03.11.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 Aug 2013 03:11:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:10:58 +0100
Message-Id: <cover.1376388241.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [RFC][PATCH 0/2] WORKDIR and insane tweaks
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
X-List-Received-Date: Tue, 13 Aug 2013 10:11:06 -0000

Hi,

Last night I was attempting a build with WORKDIR in a tmpfs to see what impact
it made on build time (the results were fairly interesting, I'll write them up
shortly).

I noticed that to move WORKDIR I had to replicate the full WORKDIR path logic,
which was a bit irritating but not that serious.  I then noticed that the
"rpaths" sanity test checks that WORKDIR is in fact TMPDIR/work, and does a
bb.fatal() if it isn't.  My best understanding here is that the check needs to
know the base of all possible WORKDIRS so that it can check for linkage directly
into another package's work directory.

Assuming that understanding is correct then both problems can be resolved with a
BASE_WORKDIR variable, which this series adds to bitbake.conf and then uses in
insane.bbclass.

Ross

The following changes since commit 16d522bcd1f1b7741577fa31fab7e2129da0cae9:

  maintainers.inc: reassign maintainers, remove obsolete recipes (2013-08-12 13:13:05 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/workdir

for you to fetch changes up to e91cbd17131101d1c470669acce66682ae06960a:

  insane: don't abort if workdir is not TMPDIR/work (2013-08-13 10:36:53 +0100)

----------------------------------------------------------------
Ross Burton (2):
      bitbake.conf: define WORKDIR in terms of BASE_WORKDIR
      insane: don't abort if workdir is not TMPDIR/work

 meta/classes/insane.bbclass |    5 +----
 meta/conf/bitbake.conf      |    3 ++-
 2 files changed, 3 insertions(+), 5 deletions(-)

Ross Burton (2):
  bitbake.conf: define WORKDIR in terms of BASE_WORKDIR
  insane: don't abort if workdir is not TMPDIR/work

 meta/classes/insane.bbclass |    5 +----
 meta/conf/bitbake.conf      |    3 ++-
 2 files changed, 3 insertions(+), 5 deletions(-)

-- 
1.7.10.4


