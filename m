Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79EC3770A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 14:53:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t92ErjPe008841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Oct 2015 07:53:45 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 2 Oct 2015 07:53:45 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Oct 2015 09:53:43 -0500
Message-ID: <1443797624-183169-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Cc: david.reyna@windriver.com
Subject: [PATCH v2] "Finish" the IMAGE_GEN_DEBUGFS implementation
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
X-List-Received-Date: Fri, 02 Oct 2015 14:53:47 -0000
Content-Type: text/plain

V2:
By adjusting the _write_script function (and associated _get_imagecmds) the
script may optionally pass in a prefix for the generated script.  This solves
one of the problems in the prior version.  (No more script name collisions.)

The second issue is that the datastore is used to find various parameters
(which are different in the DEBUGFS datastore) when doing the final symlink
generation.

So we do have to switch (based on the script prefix) which datastore we
should be using.  (Note, I'm not completely sure that the switch is 'safe',
so this is an area that should be verified.)

V1:

It was noticed today that the IMAGE_GEN_DEBUGFS implementation was not 
complete.  The version that was merged back in May only contained the 
filesystem generation pieces, but not the pieces for creating the image
from that filesystem.

The code has been tested and is working.  The only thing that I don't 
particularly like is that the processing code and loop is a duplicate of
the code that runs just before.  Unfortunately the only way around this
is to change the way that way the parallel bits are processed to support
multiple datastores..  (or create "another" function..)

Any feedback appreciated, but without this the feature is broken!

Mark Hatle (1):
  lib/oe/image.py: Add image generation for companion debug filesystem

 meta/conf/documentation.conf         |  2 ++
 meta/conf/local.conf.sample.extended |  9 +++++++++
 meta/lib/oe/image.py                 | 37 +++++++++++++++++++++++++++++++-----
 3 files changed, 43 insertions(+), 5 deletions(-)

-- 
1.9.3


