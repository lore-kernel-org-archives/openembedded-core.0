Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC01C4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.11777.1713948173862294744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ITxE+sC3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948174; x=1745484174;
  h=from:to:cc:subject:date:message-id;
  bh=icDsY7Y1++4GpTxAMO9qh+jmAeawgLJpEEx+riezzJA=;
  b=ITxE+sC33Htz4TVw/AvEZu+H1pdER/mcSja7nwy7RkQ0YzX/p2vhI/Sj
   JBWDeKQeWq+LntXOQ1xh22E/IyAB7mm9hJ3Lsg88fPlMehse3sleri3xX
   ZkbuWFHgl8hxSFzD4BScq7SdMHeQ4uVOUSjcrGo7Z5gCfgvBRtRfq+/RA
   C4TjTOZv3VIttK0YO6qjH+IeWYC11nBQVEPhAOsQTaS4OqwqalrQYra+k
   UwsYJ/pQIIK1sBRb/rkTHLTXbK+iT70z9Db+oPLpYA6pYYDAP8vNniIT3
   M6BzL0wwAQUcE98ujEZHP+VAAlUica3ebTW0CS1muqM6Jd9/HMN+wvuoB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="135926013"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="135926013"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:42:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04F0DD4B9F
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 34290DB9FC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B390E1EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:42:47 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 378AA1A000A;
	Wed, 24 Apr 2024 16:42:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/38] bind: upgrade 9.18.25 -> 9.18.26
Date: Wed, 24 Apr 2024 16:41:55 +0800
Message-Id: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10--1.238600-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqyBAXl9LkPp6azZ
	M0ivt5lwZMEckH6k8lNr5U7TCgYEcEpOsvsL8hZ0TbFVCYPBTqbYUDvAr2Y/1xPiIPO2d8g5Uex
	gNDoxdJarNHMnRYrs4YrVacT0av7c+U9kkVDHyL/2TS1YFaI5/xgVC35VE7V0gWzzGGOv2cAtbE
	BnKg+1LXkkxWFgVwnYI2EqAgnJWNPqlw28+hncZ34iswX+GH/Yg8C02zkI7w7FXntfxA7JmL6px
	bTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtII5V1ACIyZtnHqxs
	BjV0bTYPTJ94iLTbSs6gK9/y/z7S1pVckLHgk0KeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKpv
	EGAbTDv94sC3v8/GiPhG0lTw+IT+G3g1JPI0FjCG1qKk2VcMp7cYKOPGLHZnpmV8QaEMK2rXIqD
	JAX/Ky7KnNqU3ayUkMGMu7t8sO9YK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198646

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add RESOLVER.ARPA to the built in empty zones.
- dig/mdig +ednsflags=<non-zero-value> did not re-enable
  EDNS if it had been disabled.
- Some invalid ISO 8601 durations were accepted
  erroneously.
- Don't return static-stub synthesised NS RRset.
- Fix bug in Depends (keymgr_dep) function.
- Support for the RESINFO record type has been added.
- Cleaned up several minor bugs in the RBTDB dbiterator
  implementation.
- Added missing dns_rdataset_disassociate calls in
 validator.c:findnsec3proofs.
- Fix incorrectly reported errors when running tests
 with `make test` on platforms with older pytest.
- Optimize slabheader placement, so the infrastructure
 records are put in the beginning of the slabheader
 linked list.
- Improve ARM parental-agents definition.
- Fix the DNS_GETDB_STALEFIRST flag, which was defined
 incorrectly in lib/ns/query.c.
- Update ZSK minimum lifetime documentation in ARM, also
 depends on signing delay.
- Add workaround to enforce dynamic linker to pull
 jemalloc earlier than libc to ensure all memory
 allocations are done via jemalloc.
- Changes to "listen-on" statements were ignored on
 reconfiguration unless the port or interface address was
 changed, making it impossible to change a related
 listener transport type. Thanks to Thomas Amgarten.
- Expose the TCP client count in statistics channel.
- Fix a possible crash in 'dig +nssearch +nofail' and
 'host -C' commands when one of the name servers returns
 SERVFAIL.
- When dnssec-policy is in effect the DNSKEY's TTLs in
 the zone where not being updated to match the policy.
 This lead to failures when DNSKEYs where updated as the
 TTLs mismatched.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bind/{bind_9.18.25.bb => bind_9.18.26.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.25.bb => bind_9.18.26.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.25.bb b/meta/recipes-connectivity/bind/bind_9.18.26.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.25.bb
rename to meta/recipes-connectivity/bind/bind_9.18.26.bb
index cc35604aba..2784f3bdd9 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.25.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.26.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "5a4a70432a33d009f0e6e9dbb328aae7a5e27507e98e28bf3c0c6b250ccb2ab3"
+SRC_URI[sha256sum] = "75ffee52731e9604c849b658df29e927f1c4f01d5a71ea3ebcbeb63702cb6651"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.34.1


