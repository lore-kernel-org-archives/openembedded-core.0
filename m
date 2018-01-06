Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay101b.appriver.com [207.97.230.15])
	by mail.openembedded.org (Postfix) with ESMTP id BF7AE77D01
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jan 2018 20:09:22 +0000 (UTC)
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:25 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Note-AR-Scan: None - PIPE
Received: by relay.appriver.com (CommuniGate Pro PIPE 6.1.7)
	with PIPE id 274977338; Sat, 06 Jan 2018 15:07:25 -0500
Received: from [213.210.30.29] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.7)
	with ESMTPS id 274977308; Sat, 06 Jan 2018 15:07:22 -0500
Received: from chuckie.brightsign ([fd44:d8b8:cab5:cb01::19] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumN-000FoL-TJ; Sat, 06 Jan 2018 20:09:19 +0000
Received: from mac by chuckie with local (Exim 4.89)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1eXumN-00020E-Sj; Sat, 06 Jan 2018 20:09:19 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  6 Jan 2018 20:08:57 +0000
Message-Id: <20180106200903.7624-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.11.0
X-Note: This Email was scanned by AppRiver SecureTide
X-Note-AR-ScanTimeLocal: 01/06/2018 3:07:22 PM
X-Note: SecureTide Build: 12/19/2017 1:37:44 PM UTC (2.6.27.2)
X-Note: Filtered by 10.238.11.162
X-Policy: brightsign.biz
X-Primary: brightsign.biz@brightsign.biz
X-Virus-Scan: V-
X-Note: ICH-CT/SI:0-0/SG:1 1/1/0001 12:00:00 AM
X-Note-SnifferID: 0
X-Note: TCH-CT/SI:0-29/SG:1 1/6/2018 3:07:08 PM
X-GBUdb-Analysis: 0, 213.210.30.29, Ugly c=0.548538 p=-0.941463 Source Normal
X-Signature-Violations: 0-0-0-4144-c
X-Note: Spam Tests Failed: 
X-Country-Path: ->->United Kingdom->United States
X-Note-Sending-IP: 213.210.30.29
X-Note-Reverse-DNS: elite.brightsigndigital.co.uk
X-Note-Return-Path: mcrowe@brightsign.biz
X-Note: User Rule Hits: 
X-Note: Global Rule Hits: G293 G294 G295 G296 G300 G301 G433 
X-Note: Encrypt Rule Hits: 
X-Note: Mail Class: VALID
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 0/6] Teach cmake.bbclass to put cmake page files in -dev packages
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
X-List-Received-Date: Sat, 06 Jan 2018 20:09:23 -0000

We've added a few of our own recipes recently for projects that use cmake
and it's a pain to have to add the required magic to ensure that cmake's
package files (a bit like .pc files) end up in the -dev package. Forgetting
to do this causes annoying warnings about unpackaged files.

So, let's just teach cmake.bbclass to deal with this itself.

I've tested that each of the packages build correctly without generating
warnings about left-over files. But I haven't checked that anything that
might be relying the package files can still find them afterwards. I did
test that core-image-sato still builds, but that probably doesn't prove
much.

I don't think there's any harm for third-party recipes that continue to
contain equivalent FILES_${PN}-dev assignments.

Mike.

Mike Crowe (6):
  cmake: Always put cmake package files in -dev packages
  libsolv: Rely on cmake.bbclass to put cmake package files in dev
    package
  vulkan: Rely on cmake.bbclass to put cmake package files in dev
    package
  waffle: Rely on cmake.bbclass to put cmake package files in dev
    package
  libical: Rely on cmake.bbclass to put cmake package files in dev
    package
  libproxy: Rely on cmake.bbclass to put cmake package files in dev
    package

 meta/classes/cmake.bbclass                       | 2 ++
 meta/recipes-extended/libsolv/libsolv_0.6.29.bb  | 1 -
 meta/recipes-graphics/vulkan/assimp_4.0.1.bb     | 2 --
 meta/recipes-graphics/waffle/waffle_1.5.2.bb     | 3 ---
 meta/recipes-support/libical/libical_2.0.0.bb    | 2 --
 meta/recipes-support/libproxy/libproxy_0.4.15.bb | 1 -
 6 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.11.0



