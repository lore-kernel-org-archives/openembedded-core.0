Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738FBF4210F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 18:09:49 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1636.1776276581195268352
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 11:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WsA67Ug4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260415180938b2e5a6be3e000207ef-vdqxmw@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260415180938b2e5a6be3e000207ef
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 20:09:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=y21HV7wDIFqFuvK0QtQzYR40mLvvSOQFU8CEyFRuo4Q=;
 b=WsA67Ug4w4Z+JkcwtohYx25K73/1cyu/kLQ4avRxH1PCcp3JaByqK7txAbbSE2r1Q7F7kY
 41js7A+5PHhoV9hTHHyERMR2TUDTOA3aAPmWjcznBbov1O45nZhs2h6D57bOTw2BFeNibO0g
 1cn7gsjHSyM2/uo1rdZAXq2bJDOZfUcBL/fAKryMnFLhEiVaSOw5CZ7o3/0rhwKNKFqCI4kB
 AvOY5RyG07dzXyzi3PRHHSsgtchQm2hUbXAQtuihp5dwG+Q1UwLeTQKrrL6QolXie7rn/i2y
 7hhFx4bIpwQlVlhFqLuqou7aQAKK6o5Pckx7oumU9tqEd09fLpiV4QdQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] kea: upgrade 3.0.2 -> 3.0.3
Date: Wed, 15 Apr 2026 20:09:34 +0200
Message-ID: <20260415180934.1748344-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 18:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235315

Solves CVE-2026-3608.

License-Update: copyright years refreshed

Release notes [1]:

Welcome to Kea 3.0.3, a vulnerability release of the stable 3.0 series.
This supersedes the previous release, version 3.0.2.

1. **Vulnerability**: We addressed an issue, which was assigned
CVE-2026-3608, where a large number of bracket pairs in a JSON payload
directed to any endpoint would result in a stack overflow, due to
recursive calls when parsing the JSON [#4275, #4288, #4387]. Since the
exploit does not require the JSON request to have the full syntax of a
valid command, it bypasses RBAC and the command filters on the
High-Availability endpoints.

2. **Security**: A null dereference is now no longer possible when
configuring the Control Agent with a socket that lacks the mandatory
socket-name entry [#4388, #4365].

3. **Permissions**: UNIX sockets are now created as group-writable
[#4398, #4260]. This allows users belonging to the group to send
commands to the UNIX sockets. In particular, it allows Stork 2.4.0 and
above to detect the Kea daemon.

[1] https://downloads.isc.org/isc/kea/3.0.3/Kea-3.0.3-ReleaseNotes.txt

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-connectivity/kea/{kea_3.0.2.bb => kea_3.0.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_3.0.2.bb => kea_3.0.3.bb} (96%)

diff --git a/meta/recipes-connectivity/kea/kea_3.0.2.bb b/meta/recipes-connectivity/kea/kea_3.0.3.bb
similarity index 96%
rename from meta/recipes-connectivity/kea/kea_3.0.2.bb
rename to meta/recipes-connectivity/kea/kea_3.0.3.bb
index f46cb1bf80..0646bf702e 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.2.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fb634ed1d923b8b8fd1ed7ffc9b70ae4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a64dc8efc3c40d0502ad372f810700e4"
 
 DEPENDS = "boost log4cplus openssl"
 
@@ -23,7 +23,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch \
            "
-SRC_URI[sha256sum] = "29f4e44fa48f62fe15158d17411e003496203250db7b3459c2c79c09f379a541"
+SRC_URI[sha256sum] = "09702ddb078b637e85de9236cbedd3fb9d7af7c6e797026c538b45748ad4d631"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 

