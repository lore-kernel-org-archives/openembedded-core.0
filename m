Received: from mail-pz0-f51.google.com ([209.85.210.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <darren@apps.dvhart.com>) id 1SKX9D-0004nU-0h
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:50:23 +0200
Received: by dadz8 with SMTP id z8so9831095dad.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2012 08:40:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=1XSvEBdd8ENuV09Ht8Hhy1TjtSTfpGLAbkOkytvVUZY=;
	b=onwttw18ry0LnSmdZI9VP6xWsHmw74Q8HRc3g8KYJ2fzprS7OAi8DNrh6Zb2DigXJ0
	ltEWxOeE+Z1MC8YW4f94mRJSVqehCk5gxjzI5pdVNMrCQP5iYA+BEf61rO2asMvOBveI
	bvxIxEyx7v7ZwyYb3UnzE19lvNuSmuTRnQPjAa2p34j0iZrB/4VAk4uLwaLe66sD/Vve
	+toq8LdDhvr3eT5af9pvar/efP9mPLR32ZIXRwMhycp9LRnmj3Ea2i2kRg3YMsZr8iAJ
	pMDMQ9wRWG5IdrHTMhDWae+geiOpIFdqVMEIyofslDLrKzSVfUKslloIYGQjacawFCEp
	WvEQ==
Received: by 10.68.233.234 with SMTP id tz10mr7231495pbc.68.1334763654835;
	Wed, 18 Apr 2012 08:40:54 -0700 (PDT)
Received: from localhost (static-50-53-99-101.bvtn.or.frontiernet.net.
	[50.53.99.101])
	by mx.google.com with ESMTPS id sx2sm15959135pbc.26.2012.04.18.08.40.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Apr 2012 08:40:53 -0700 (PDT)
Sender: Darren Hart <darren@apps.dvhart.com>
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Apr 2012 08:40:51 -0700
Message-Id: <5840692e28971d911b9c95eb85c2aff0eb028e3c.1334763599.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334763599.git.dvhart@linux.intel.com>
References: <cover.1334763599.git.dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmt7/vs03GPY2TXbe+bthGq5wQ7WeFi09rB3BksFw8CZFM5/Jh2edU+RyMb8+3hqBBRPS0M
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] gthumb: Disable parallel make for gthumb install
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
X-List-Received-Date: Wed, 18 Apr 2012 15:50:23 -0000

With PARALLEL_MAKE set to 14, I frequently see the gthumb do_install
task hang. Make is spinning at 100% CPU and the build makes no
more progress.

The following work-around proposed by Richard Purdie allows progress
to be made.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Joshua Lock <josh@linux.intel.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 5c87dc1..5821dc4 100644
--- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -8,6 +8,8 @@ PR = "r2"
 
 EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
 
+PARALLEL_MAKEINST=""
+
 inherit gnome pkgconfig
 
 FILES_${PN} += "${datadir}/icons"
-- 
1.7.5.4



