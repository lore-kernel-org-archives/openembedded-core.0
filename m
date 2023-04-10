Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC271C77B61
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:56:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.40567.1681117014648786038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VRaHiY6/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117015; i=@fujitsu.com;
	bh=77rNb0+f5+fniSyUhqyXTKXo3wyLgg1cTePhLtbSPWc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=VRaHiY6/DkIZ0pJ7/HhW4Bjexk8n4Dc76rIJ4u6Pz1UZIvpeWhiSqz8UwAhgsCmCy
	 Dgy9EPghePMtNQZ38DFFjY/icb5MXOrKMjF7bYySv8M8DzyNu7YWv9F0zkZLT4p+Rt
	 lWoEm6ldJpQfDLBQaCwDc1roQzn9Hy3ab/WyX1RZPfZ+6ue94HFEm2cUGm9lEe3+VE
	 utaTrBM0y3YeNACgag0WulWH8npOf7+pcJ2hk20SN/v8sTuq7LjZ/9WDorRjgou/f5
	 znDHm7apc90jA1VQobfq5PMFB0H886v4gshtHvQUslZtXlzyWW7dXVp0qyScMxiZqH
	 2Rbnf+5yUiDTw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSTfsvHG
  Kwe3JRhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bGjl9MBavsKq6fP8TYwHjevIuRi0NI4DGj
  xIYnL1khnGtMEid/nGWHcPYwSpz+cRYow8nBJiAlceP+f7YuRg4OEQE9iav/REHCzAIqEi9+9
  7CD2MIC1hJr165hA7FZBFQl3n7pYAGxeQWcJB5+e8QMYksIKEhMefgezOYUcJZo7+piBLGFgG
  raz3cwQ9QLSpyc+YQFYr6ExMEXL6B6FSVmX25mgbArJBqnH2KCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQvTi0qSy3SNTTXSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN+U4qQ7Oxh39v3VO8QoycGkJMrbxWWcIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC1+AsUE6wKDU9tSItMwcYSzBpCQ4eJRHeimNAad7igsTc4sx0iNQpRkUpcV7Jc0AJAZBERm
  keXBssfi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubddhhoCk9mXgnc9FdAi5mAFnO5GIA
  sLklESEk1MKmmZx/WvaynbBnPtzc9OK2n8VuF+ueLleI+175XGq18VX5pX9sG7uWHmS8zSK98
  xZ073dK1PCCdLWm9MPfH6QvcbKf/8gwsUrQRuKibyn3hOcuarr2Xzr7ZNnP/wf5yoYMWnMtnK
  /6PeHp8be63V8tuLaiZFP2kt7uv7OO7WdJPbPmmX8pV5OiMPrG2wNrsWJDpprz1bBfZTpTffK
  r1qmPRgXMy3Ol/lsasbDDaKXFmUo1I6s/vJZvretQ2/FPwWjV//lKfVPalMh68DObqke/zLpa
  6nrkqHTHx/90tGn+WW6ZbcCg9abXQtr3aULzTzoi5Knal/hv5yUF8hffuXD4q5RQjE2AeO2OS
  xuTgzUosxRmJhlrMRcWJANVg2g9aAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-728.messagelabs.com!1681117014!1550382!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21635 invoked from network); 10 Apr 2023 08:56:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:56:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3C5DC100329
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:54 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2ED34100323
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:56:54 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:56:52 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.18.12 -> 9.18.13
Date: Mon, 10 Apr 2023 16:56:34 +0800
Message-ID: <1681116997-24685-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
References: <1681116997-24685-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:56:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179844

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
[bug] Use two pairs of dns_db_t and dns_dbversion_t in a
      catalog zone structure to avoid a race between the
      dns__catz_update_cb() and dns_catz_dbupdate_callback()
      functions. [GL #3907]

[bug] Make sure to revert the reconfigured zones to the
      previous version of the view, when the new view
      reconfiguration fails during the configuration of
      one of the configured zones. [GL #3911]

[bug] Fix error path cleanup issues in dns_catz_new_zones()
      and dns_catz_new_zone() functions. [GL #3900]

[bug] Unregister db update notify callback before detaching
      from the previous db inside the catz update notify
      callback. [GL #3777]

[func Run the catalog zone update process on the offload
      threads. [GL #3881]

[func Add shutdown signaling for catalog zones. [GL !7571]

[func Add reference count tracing for dns_catz_zone_t and
      dns_catz_zones_t. [GL !7570]

[bug] Detach 'rpzs' and 'catzs' from the previous view in
      configure_rpz() and configure_catz(), respectively,
      just after attaching it to the new view. [GL #3880]

[test Don't test HMAC-MD5 when not supported by libcrypto.
      [GL #3871]

[bug] Fix RPZ reference counting error on shutdown in
      dns__rpz_timer_cb(). [GL #3866]

[test Test various 'islands of trust' configurations when
      using managed keys. [GL #3662]

[bug] Building against (or running with) libuv versions
      1.35.0 and 1.36.0 is now a fatal error.  The rules for
      mixing and matching compile-time and run-time libuv
      versions have been tightened for libuv versions between
      1.35.0 and 1.40.0. [GL #3840]

[bug] dnssec-cds failed to cleanup properly. [GL #3831]

[bug] Source ports configured for query-source,
      transfer-source, etc, were being ignored. (This
      feature is deprecated, but it is not yet removed,
      so the bug still needed fixing.) [GL #3790]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/bind9                   | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/conf.patch              | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.12 => bind-9.18.13}/named.service           | 0
 .../bind/{bind_9.18.12.bb => bind_9.18.13.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.12 => bind-9.18.13}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.12.bb => bind_9.18.13.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/bind9 b/meta/recipes-connectivity/bind/bind-9.18.13/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.13/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.13/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.13/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.12/named.service b/meta/recipes-connectivity/bind/bind-9.18.13/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.12/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.13/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.12.bb b/meta/recipes-connectivity/bind/bind_9.18.13.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.12.bb
rename to meta/recipes-connectivity/bind/bind_9.18.13.bb
index 68dad77cdc..8617137e87 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.12.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.13.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "47766bb7b063aabbad054386b190aa7f6c14524427afd427c30ec426512027e7"
+SRC_URI[sha256sum] = "3b06b6390c1012dd3956b1479c73b2097c0b22207817e2e8aae352fd20e578c7"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


