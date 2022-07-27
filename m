Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85DDC3F6B0
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:36 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.14368.1658882486640850645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wNAVOp9O;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id v18so1650879plo.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Gp1ULT/ixN+remDAFgLcn5OR0dCkPPLNYjnPGPkLHSE=;
        b=wNAVOp9OAlB98M05oISoH19ys1X/8iOgAO0J0+M/4e8C+R0LrIq+M/tGdj+NMw8bKo
         JhqeyhIyTkKb5Lx2TZ10DeCLDvpPg3yAkIRfUWIqIJBzVxWKI9OAW5c3wccbFwyCSaKL
         F0PGfICgc+BXr06Vh+4tFh5QHaOpUUtP2v00FaDwYsyR0EvtR98fP0/doEt8hlUwsfBJ
         xGpWJrdSksz3uVXkOOO897oe/er5HJfTPwQHoiB/qj7FEEHs7QIz/7YIELbDtBhRSzcL
         ukkEXC7jceO5CaBYzFGeoMxvGXGRhGBNjGnUopWT/pXJiuqYCCmSzJa8zzY/GX/NP7jf
         eMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gp1ULT/ixN+remDAFgLcn5OR0dCkPPLNYjnPGPkLHSE=;
        b=3oE7R+YQstTSWRo8zH2cjO6f041s6IXHysJj8SP3vc6Y6FVW787lJ+k3FMNvl0TsnN
         DzkOYIThTbJOIbaOohMgG441D1euYMsqvn7Dh/BUE3dmTMCfM00S1j3AN17v6vGxHWCG
         0hilVpNK333Fn9kMclgUDhWv1ZehABs1MJqs3tRJlyJMBy6R8itW/n5Lvibh/PafpOyM
         y/gQZ1gDiGRZiwV4y1PkG6Yvxiq+1V4sRMM+g67bnTrx0MbmkOMxTrnlX2hiB21qRsYb
         uOka7axBWlXzBSAUxh3fm68u35l1A2kHQXbTwIKCx596y8yvQacgpPgs7q9Q6CYWShBB
         bUrA==
X-Gm-Message-State: AJIora9P9xKyE09Ujp7zO1SoOXrQTpnag+QN2ro2wT36Z/VONVRg07wo
	27UdrCrPbqmOUHaEPle4OF36cMxWN0EXVslC
X-Google-Smtp-Source: 
 AGRyM1v32LA34wraLtqjDdlufib3hUG3Z+FhwejHylGqPH7cWILTQ6aL0/n6gD9FfOriCaCB6mNm9g==
X-Received: by 2002:a17:90a:b782:b0:1f1:abb8:de1b with SMTP id
 m2-20020a17090ab78200b001f1abb8de1bmr1734140pjr.44.1658882485396;
        Tue, 26 Jul 2022 17:41:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] bind: upgrade 9.18.2 -> 9.18.3
Date: Tue, 26 Jul 2022 14:40:35 -1000
Message-Id: 
 <1bbedc1c6f9b1d431a7d72b9e8e2871d0fe988f5.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168527

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
[security]
 Fix a crash in DNS-over-HTTPS (DoH) code caused by
 premature TLS stream socket object deletion.
 (CVE-2022-1183) [GL #3216]

[bug]
 RPZ NSIP and NSDNAME rule processing didn't handle stub
 and static-stub zones at or above the query name.  This
 has now been addressed. [GL #3232]
 Fixed a deadlock that could occur if an rndc
 connection arrived during the shutdown of network
 interfaces. [GL #3272]

 Refactor the fctx_done() function to set fctx to
 NULL after detaching, so that reference counting
 errors will be easier to avoid. [GL #2969]

 udp_recv() in dispatch could trigger an INSIST when the
 callback's result indicated success but the response
 was canceled in the meantime. [GL #3300]

 Work around a jemalloc quirk which could trigger an
 out-of-memory condition in named over time. [GL #3287]

 If there was a pending negative cache DS entry,
 validations depending upon it could fail. [GL #3279]

 dig returned a 0 exit status on UDP connection failure.
 [GL #3235]

 Fix an assertion failure when using dig with +nssearch
 and +tcp options by starting the next query in the
 send_done() callback (like in the UDP mode) instead
 of doing that recursively in start_tcp(). Also
 ensure that queries interrupted while connecting
 are detached properly. [GL #3144]

 Don't remove CDS/CDNSKEY DELETE records on zone sign
 when using 'auto-dnssec maintain;'. [GL #2931]

[contrib]
 Avoid name space collision in dlz modules by prefixing
 functions with 'dlz_'. [GL !5778]

 dlz: Add FALLTHROUGH and UNREACHABLE macros. [GL #3306]

[func]
 Add new named command-line option -C to print built-in
 defaults. [GL #1326]

 Introduce the concept of broken catalog zones described
 in the DNS catalog zones draft version 5 document.
 [GL #3224]

 Add DNS Extended Errors when stale answers are returned
 from cache. [GL #2267]

 Implement support for catalog zones change of ownership
 (coo) mechanism described in the DNS catalog zones draft
 version 5 document. [GL #3223]

 Implement support for catalog zones options new syntax
 based on catalog zones custom properties with "ext"
 suffix described in the DNS catalog zones draft version
 5 document. [GL #3222]

 Implement reference counting for TLS contexts and
 allow reloading of TLS certificates on reconfiguration
 without destroying the underlying TCP listener sockets
 for TLS-based DNS transports. [GL #3122]
 Add support for remote TLS certificates
 verification, both to BIND and dig, making it possible
 to implement Strict and Mutual TLS authentication,
 as described in RFC 9103, Section 9.3. [GL #3163]

[cleanup]
 Remove use of exclusive mode in ns_interfacemgr in
 favor of rwlocked access to localhost and localnets
 members of dns_aclenv_t structure. [GL #3229]

 Remove the task exclusive mode use in ns_clientmgr.
 [GL #3230]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d2ae8b85c71be2e9e332b1ef0a2d3083b30c63e6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/bind9                     | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/conf.patch                | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.2 => bind-9.18.3}/named.service             | 0
 .../bind/{bind_9.18.2.bb => bind_9.18.3.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.2 => bind-9.18.3}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.2.bb => bind_9.18.3.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/bind9 b/meta/recipes-connectivity/bind/bind-9.18.3/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.3/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.3/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.3/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.2/named.service b/meta/recipes-connectivity/bind/bind-9.18.3/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.2/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.3/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.2.bb b/meta/recipes-connectivity/bind/bind_9.18.3.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.18.2.bb
rename to meta/recipes-connectivity/bind/bind_9.18.3.bb
index 1c77aceb9f..b511b77f2e 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.2.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.3.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "2e4b38779bba0a23ee634fdf7c525fd9794c41d692bfd83cda25823a2a3ed969"
+SRC_URI[sha256sum] = "0ad8da773bd93cba0ef66cc81999698ebdf9c3e51faed5e5c8c1eb75cad2ae6f"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


