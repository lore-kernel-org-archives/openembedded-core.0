Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TWllV-0006pB-DN
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Nov 2012 11:24:46 +0100
Received: from mail-wg0-f69.google.com ([74.125.82.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Nov 2012 02:10:55 -0800
Received: by mail-wg0-f69.google.com with SMTP id 16so2644621wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2012 02:10:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=SDpK4UuDUCZRLQTmpJAVHX5co3r4x7Yzzr4dil65eBU=;
	b=mgFP53DGqLPEcjbg8IrD53LIcY3CKrhYAIcWi0sWwh5MZlJDme2rOm4gNb1EIj1nO3
	sGhUUkjfICMpkc/+Zy0zngzgia5xuOfyjL1YDAMPsPFx0lnUg5ACTtLHIK2rhQDyseJU
	IBV4NCs1EtESfB5JNfdJdgL5kR7jxISFQHTjC1/GvtaOTPhiJwZgs6S82wUpGAAK6zHj
	N9jltQvcKDxztBjWtQOhVwqtIvdaBQYHTLXg+95P0PfddULddWYcufeqXrfkvbVmyYpY
	aZOVJZDZmhP4EpiP3686AZmAjKlF/2MkLHB6/AWhdsSumQKX99aP0JQtPnwdpQDjGD1h
	PY3Q==
Received: by 10.216.207.103 with SMTP id m81mr4356031weo.190.1352455853039;
	Fri, 09 Nov 2012 02:10:53 -0800 (PST)
Received: by 10.216.207.103 with SMTP id m81mr4356026weo.190.1352455852813;
	Fri, 09 Nov 2012 02:10:52 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hf10sm1514085wib.0.2012.11.09.02.10.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Nov 2012 02:10:51 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2012 10:09:27 +0000
Message-Id: <cover.1352455397.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQnp2FJfb5TiOCselmhLw7AhLVFInUWHc+HXsfuko7b8sJszNs28Fx7TSIBRScuKgLFduU8XylTS1QKGJPskrpWtCqbSTo9XBYvZGjDDrfYmLP2B+9Z8K7h1kkSgzyhypX0yCoUD68pOjrEjOGfV8UZKe9GZQIXOdwzD8ei8HnztNsmEJ3vfa2lYLI6AJX8TtsMttwk2
Subject: [PATCH 0/2] Consolidate _FOR_BUILD variables
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
X-List-Received-Date: Fri, 09 Nov 2012 10:24:46 -0000

Hi,

It's autotools best practise[1] to use the variables CC_FOR_BUILD etc when
building tools that are required to build the rest of the package.  A lot of
packages do this, and they all repeat the same variable assignements, so
consolidate these assignments in autotools.bbclass.

Not every instance of _FOR_BUILD has been removed from the metadata, as there
are several cases where the assignment isn't the same (added flags, mainly).

Tested with a world build of oe-core, zero buildhistory differences.

Ross

[1] http://www.sourceware.org/autobook/autobook/autobook_270.html#SEC270

The following changes since commit 78983e939ab17f02f8911c8b0d0e326b419856b9:

  lib/oe/classextend: Ensure we don't extend expressions more than once (2012-11-06 09:34:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ross/cross

for you to fetch changes up to 154a30032b03a9ce269752adbf5bbec85205720e:

  meta: remove redundant _FOR_BUILD variables (2012-11-09 10:00:05 +0000)

----------------------------------------------------------------
Ross Burton (2):
      autotools: set _FOR_BUILD variables here
      meta: remove redundant _FOR_BUILD variables

 meta/classes/autotools.bbclass                 |   15 +++++++++++++++
 meta/recipes-devtools/binutils/binutils.inc    |    4 ++--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb         |    1 -
 meta/recipes-extended/bash/bash.inc            |    1 -
 meta/recipes-gnome/gnome/metacity_2.30.3.bb    |    5 ++---
 meta/recipes-graphics/mutter/mutter.inc        |    5 ++---
 meta/recipes-graphics/xorg-lib/libx11.inc      |    8 ++------
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ----
 meta/recipes-support/gmp/gmp_4.2.1.bb          |    2 --
 meta/recipes-support/gmp/gmp_5.0.5.bb          |    2 --
 10 files changed, 23 insertions(+), 24 deletions(-)

Ross Burton (2):
  autotools: set _FOR_BUILD variables here
  meta: remove redundant _FOR_BUILD variables

 meta/classes/autotools.bbclass                 |   15 +++++++++++++++
 meta/recipes-devtools/binutils/binutils.inc    |    4 ++--
 meta/recipes-devtools/rpm/rpm_5.4.9.bb         |    1 -
 meta/recipes-extended/bash/bash.inc            |    1 -
 meta/recipes-gnome/gnome/metacity_2.30.3.bb    |    5 ++---
 meta/recipes-graphics/mutter/mutter.inc        |    5 ++---
 meta/recipes-graphics/xorg-lib/libx11.inc      |    8 ++------
 meta/recipes-kernel/systemtap/systemtap_git.bb |    4 ----
 meta/recipes-support/gmp/gmp_4.2.1.bb          |    2 --
 meta/recipes-support/gmp/gmp_5.0.5.bb          |    2 --
 10 files changed, 23 insertions(+), 24 deletions(-)

-- 
1.7.10



