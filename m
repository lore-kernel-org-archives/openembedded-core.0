Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Q7D4i-00086t-RJ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 22:42:08 +0200
Received: by gwb11 with SMTP id 11so130183gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 13:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=tW8eNkANoX/VnLkwXH3tAUxwjUDMG3sz4+qrsmFjhcY=;
	b=f15AiCkRFRDzTlwIybjJhaWJIkq9erDk9c4TAid6GZ8nAgXCtJKKeSZON1JWq8B27V
	KqE9njo1UKPei4eD4S/PQ64EhPBv1ufg6YG7T57oAHv/bby15Ip8zw43xGIWYF6pOAco
	CmbuG3/kj/JfMegLSavVqMIIyk9Gom4BRmwZk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=DS0K/A0Lwd6eUkIK+ddmQDOB6QqvQDORGLHCxIrZopAAefKQZR8lBywxMsSz2lg/Jy
	7Kv3Bakj+1SptDa0xZqyFoKT3TFJLFPt9bu6rlxiOvQ2xrp4XbkGN5ITQeNLeAhVNMnu
	+oBbgcOxCaxAOHrxiHnMrvSZmq3tQ7g+kN+VQ=
Received: by 10.151.69.24 with SMTP id w24mr1016729ybk.263.1302036001999;
	Tue, 05 Apr 2011 13:40:01 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id p28sm288105ybk.0.2011.04.05.13.40.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 13:40:01 -0700 (PDT)
From: Chris Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Apr 2011 13:39:54 -0700
Message-Id: <cover.1302035800.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.7.4.1
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH 0/3] Add oe.fetch, rework fetch/unpack deps from SRC_URI
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
X-List-Received-Date: Tue, 05 Apr 2011 20:42:09 -0000

From: Chris Larson <chris_larson@mentor.com>

This was intended to clean up and consolidate the code in base.bbclass which
sets up dependencies conditionally based upon the contents of SRC_URI.  To get
there, I decided to incorporate and rewrite some Uri handling code I had
written previously.  This is much more convenient to use than urldata and
SRC_URI, and the caching can be easily re-implemented if we move it into
bitbake at some point (e.g. create an lru cache decorator, inject its
construction/sync into the standard caching spots where cache/signature code
caching is done, if necessary).  Finally, this makes .zip files pull in
unzip-native.

Pull URL: https://github.com/kergoth/oe-core
  Branch: unpack-fetch-deps
  Browse: https://github.com/kergoth/oe-core/commits/unpack-fetch-deps

Thanks,
    Chris Larson <chris_larson@mentor.com>
---


Chris Larson (3):
  oe.fetch: add module with uri convenience code
  Clean up how we handle unpack/fetch deps from SRC_URI
  base: when using zip files, depend on unzip-native

 meta/classes/base.bbclass |   58 ++++++++++++++++--------------
 meta/conf/bitbake.conf    |    1 +
 meta/lib/oe/fetch.py      |   87 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 27 deletions(-)
 create mode 100644 meta/lib/oe/fetch.py

-- 
1.7.4.1



