Received: from smtp2.axis.com (smtp2.axis.com [])
 by mx.groups.io with SMTP id smtpd.web10.4699.1592910811064946914
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 04:13:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=AppTBQw+;
 spf=fail (domain: axis.com, ip: <nil>, mailfrom: fredrik.gustafsson@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2260; q=dns/txt; s=axis-central1;
  t=1592910812; x=1624446812;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+S9+h3ipwqdKZCqGJieHoQ5ILQzdopIDX8eDGfnlRq4=;
  b=AppTBQw+Hxa8XXERSpa82y0os28J/rn2EyVh18v7QOHcM2hIlw15sIhL
   j24uu6aCp69/FO4ne/CBt3ji7ZgZ9c7XszT8TpPNU+tDr46Q0dhdp93QT
   nmMlu7Q7+VnjgC2fRAqT/rdkUHxEOaTFQgOtsGAo4GDd5aLuX7x/JrO8E
   eVDSz6e9NbIcAxQ06VCS9NrqjFmqDs1z5Q51scraNTjtqmpuaBjkRB+cD
   TFJa1TDhrWItfOVke7dDc5+W2/8vkwuJZ+wJJZkNz4QkTvB88JJENMFYy
   teUl1LVc0R7fzErFJHOVYJ4U0OEpRraWo9MNuhWz6BCu9qlYrHqGSriA0
   Q==;
IronPort-SDR: /nlVpOtnXukFs7E/DBqWPVoio/j2sIY2dPOzNQtnFh1BjEkDS2VLIIAXqWu/vnwf0AICwWMTsD
 +8W80bHas73NGpW0Jp5M4kHo74rk6Hf50NvFd5ydzSN8hCbYc1NX7RoA9TprjA+0Uoc95AdGOd
 8+wiu5ao9SGOhLvVDx9tZ3cCb+gwHzarGui5BhGZDoY/KJQNjdG1EkzcWNSSJRbCe9DD8Ihjyu
 abfIxj7TNurlJ1J8p44vwvqxnV7eIQfAd3WtNUi5AGLk2PECWi3xBFkFMWtMUd3rIj0dDirKSJ
 DdI=
X-IronPort-AV: E=Sophos;i="5.75,271,1589234400"; 
   d="scan'208";a="9815768"
From: "Fredrik Gustafsson" <fredrik.gustafsson@axis.com>
To: <openembedded-core@lists.openembedded.org>
CC: <tools-cfpbuild-internal@axis.com>, <hugo.cedervall@axis.com>, Fredrik
 Gustafsson <fredrigu@axis.com>
Subject: [PATCH 1/2] nopackages.bbclass: Move to nopackages_base.bbclass
Date: Tue, 23 Jun 2020 13:13:27 +0200
Message-ID: <20200623111328.5838-2-fredrigu@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200623111328.5838-1-fredrigu@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
MIME-Version: 1.0
Return-Path: fredrigu@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When for example adding an other package mananger a two rows
deltask do_package_write_PKGMGR
deltask do_package_write_PKGMGR_setscene
is needed to be added to nopackages.bbclass. When adding the new package
manager in a new layer in order to extend poky (rather than forking it)
the whole nopackages.bbclass needs to be copied which is a maintenance
problem. Moving nopackages.bbclass to nopackages.bbclass would make the
new layer just adding an image.bbclass containing:
inherit nopackages_base.bbclass
deltask do_package_write_PKGMGR
deltask do_package_write_PKGMGR_setscene

Which is much easier to maintain.

Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
---
 meta/classes/nopackages.bbclass      | 15 +++------------
 meta/classes/nopackages_base.bbclass | 12 ++++++++++++
 2 files changed, 15 insertions(+), 12 deletions(-)
 create mode 100644 meta/classes/nopackages_base.bbclass

diff --git a/meta/classes/nopackages.bbclass b/meta/classes/nopackages.bbclass
index 559f5078bd..78bbd8c85c 100644
--- a/meta/classes/nopackages.bbclass
+++ b/meta/classes/nopackages.bbclass
@@ -1,12 +1,3 @@
-deltask do_package
-deltask do_package_write_rpm
-deltask do_package_write_ipk
-deltask do_package_write_deb
-deltask do_package_qa
-deltask do_packagedata
-deltask do_package_setscene
-deltask do_package_write_rpm_setscene
-deltask do_package_write_ipk_setscene
-deltask do_package_write_deb_setscene
-deltask do_package_qa_setscene
-deltask do_packagedata_setscene
+# This file should only inherit nopackages_base. This is to make
+# this file easy to extend from an other layer.
+inherit nopackages_base
diff --git a/meta/classes/nopackages_base.bbclass b/meta/classes/nopackages_base.bbclass
new file mode 100644
index 0000000000..e898cef00f
--- /dev/null
+++ b/meta/classes/nopackages_base.bbclass
@@ -0,0 +1,12 @@
+deltask do_package
+deltask do_package_qa
+deltask do_packagedata
+deltask do_package_setscene
+deltask do_package_qa_setscene
+deltask do_packagedata_setscene
+deltask do_package_write_rpm
+deltask do_package_write_deb
+deltask do_package_write_ipk
+deltask do_package_write_rpm_setscene
+deltask do_package_write_deb_setscene
+deltask do_package_write_ipk_setscene
-- 
2.20.1

