Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D768C43217
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 21:15:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.30933.1668892537175635537
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 13:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=H2mIq+4d;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id v17so7447098plo.1
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 13:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2JdeKz6fzqUtp7S0CHBcqta824CKK1en0ZQnFF3tC6M=;
        b=H2mIq+4dvNgFv6FyGvOJd/gO2P+ln5xpHTuDx5ONZYHNvAh6BLlDFVV29xCWPoFmh/
         Cc9V2H/U1a4EOJXNeFvovJEX79fkx2FdBCXeF5WX+1zPW0wfCoDM2PfKIikipIrMOJQs
         AaomMbHTh9bxsqmZLuCflC3zA/MgHTeBz14NaMBE4notTgZOR5TWOMApca9wTO7/pbzW
         e667dfNHNbR75PihN5s29ystoH7Rk9X4oaAIED8ot0Wat4gUotleo+0IqpWY5rXXLrOk
         N24+qzburjXUMUtmE/uSr4MXHOVH57X783ZMzsENViE3UPWZ1pJXnM7dwcPHqCzvE1dI
         ZiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JdeKz6fzqUtp7S0CHBcqta824CKK1en0ZQnFF3tC6M=;
        b=W64T9RMHvlkzezylU1vmh9/7p7bz2lXXJkD2araJyFwYTfdZhncWaqCCx8C60SCFKV
         pf0A1u2PoEHOWBwHlh55JMl7WX34IvqmcHXvMpOvBknvwPB9+DPuchJJBtvnkn8cuUhV
         85afPqRy9AuYg4SK9AwbUSdPVjyJGnU7g11z7qMShAAtWb0IlmlAW0pEzpCZVxDOpZjV
         oD31QjAu8Q1VjZamF03G90TpqADiS4+MrR3Bi4OBIYm0F1o9WQDjY3nZF43eg2E1bIiG
         JpvOLQQ8cUNgxFlTN2b5g5Qn2InxotGfOPaIZup0ikwnzQ4/5POp1Xqj6x3CUEIYDWRa
         1VRg==
X-Gm-Message-State: ANoB5pnYzSrQBTRiDXR3+QEGdnrXbqjFjWcTC+D0Xf1IssfsbUeT1dfF
	wrzo+8wkr1zBjYMKNW8FrULLDKYESqCZKKs8HS8=
X-Google-Smtp-Source: AA0mqf7utSM+Xn0dQ1/ZDdYoEWrrUOqxKauU85s354C1A4JcLR+wwrIlVtyinP9UN6Lb08MphRW/aQ==
X-Received: by 2002:a17:903:2112:b0:172:f5b1:e73b with SMTP id o18-20020a170903211200b00172f5b1e73bmr621171ple.58.1668892536065;
        Sat, 19 Nov 2022 13:15:36 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id s16-20020a170902a51000b001869f2120a5sm6197735plq.34.2022.11.19.13.15.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:15:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/35] bind: upgrade 9.18.7 -> 9.18.8
Date: Sat, 19 Nov 2022 11:14:46 -1000
Message-Id: <14b6bcb46a5e81027ec823aa7315c0e519cfece6.1668892398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668892398.git.steve@sakoman.com>
References: <cover.1668892398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 21:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173547

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_18_8/CHANGES

	--- 9.18.7 released ---

5962.	[security]	Fix memory leak in EdDSA verify processing.
			(CVE-2022-38178) [GL #3487]

5960.	[security]	Fix serve-stale crash that could happen when
			stale-answer-client-timeout was set to 0 and there was
			a stale CNAME in the cache for an incoming query.
			(CVE-2022-3080) [GL #3517]

5959.	[security]	Fix memory leaks in the DH code when using OpenSSL 3.0.0
			and later versions. The openssldh_compare(),
			openssldh_paramcompare(), and openssldh_todns()
			functions were affected. (CVE-2022-2906) [GL #3491]

5958.	[security]	When an HTTP connection was reused to get
			statistics from the stats channel, and zlib
			compression was in use, each successive
			response sent larger and larger blocks of memory,
			potentially reading past the end of the allocated
			buffer. (CVE-2022-2881) [GL #3493]

5957.	[security]	Prevent excessive resource use while processing large
			delegations. (CVE-2022-2795) [GL #3394]

5956.	[func]		Make RRL code treat all QNAMEs that are subject to
			wildcard processing within a given zone as the same
			name. [GL #3459]

5955.	[port]		The libxml2 library has deprecated the usage of
			xmlInitThreads() and xmlCleanupThreads() functions. Use
			xmlInitParser() and xmlCleanupParser() instead.
			[GL #3518]

5954.	[func]		Fallback to IDNA2003 processing in dig when IDNA2008
			conversion fails. [GL #3485]

5953.	[bug]		Fix a crash on shutdown in delete_trace_entry(). Add
			mctx attach/detach pair to make sure that the memory
			context used by a memory pool is not destroyed before
			the memory pool itself. [GL #3515]

5952.	[bug]		Use quotes around address strings in YAML output.
			[GL #3511]

5951.	[bug]		In some cases, the dnstap query_message field was
			erroneously set when logging response messages.
			[GL #3501]

5948.	[bug]		Fix nsec3.c:dns_nsec3_activex() function, add a missing
			dns_db_detachnode() call. [GL #3500]

5947.	[func]		Change dnssec-policy to allow graceful transition from
			an NSEC only zone to NSEC3. [GL #3486]

5946.	[bug]		Fix statistics channel's handling of multiple HTTP
			requests in a single connection which have non-empty
			request bodies. [GL #3463]

5945.	[bug]		If parsing /etc/bind.key failed, delv could assert
			when trying to parse the built in trust anchors as
			the parser hadn't been reset. [GL !6468]

5944.	[bug]		Fix +http-plain-get and +http-plain-post options
			support in dig. Thanks to Marco Davids at SIDN for
			reporting the problem. [GL !6672]

5942.	[bug]		Fix tkey.c:buildquery() function's error handling by
			adding the missing cleanup code. [GL #3492]

5941.	[func]		Zones with dnssec-policy now require dynamic DNS or
			inline-siging to be configured explicitly. [GL #3381]

5938.	[bug]		An integer type overflow could cause an assertion
			failure when freeing memory. [GL #3483]

5936.	[bug]		Don't enable serve-stale for lookups that error because
			it is a duplicate query or a query that would be
			dropped. [GL #2982]

5935.	[bug]		Fix DiG lookup reference counting bug, which could
			be observed in NSSEARCH mode. [GL #3478]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 1d87d2652f7f6640dda85e037c580c83f99a8ba8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/bind9                     | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/conf.patch                | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh      | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.18.7 => bind-9.18.8}/named.service             | 0
 .../bind/{bind_9.18.7.bb => bind_9.18.8.bb}                     | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.18.7 => bind-9.18.8}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.18.7.bb => bind_9.18.8.bb} (97%)

diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/bind9 b/meta/recipes-connectivity/bind/bind-9.18.8/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/bind9
rename to meta/recipes-connectivity/bind/bind-9.18.8/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.18.8/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.18.8/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.18.7/named.service b/meta/recipes-connectivity/bind/bind-9.18.8/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.18.7/named.service
rename to meta/recipes-connectivity/bind/bind-9.18.8/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.18.7.bb b/meta/recipes-connectivity/bind/bind_9.18.8.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.18.7.bb
rename to meta/recipes-connectivity/bind/bind_9.18.8.bb
index 4ab11486bf..4925c092c7 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.7.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.8.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9e2acf1698f49d70ad12ffbad39ec6716a7da524e9ebd98429c7c70ba1262981"
+SRC_URI[sha256sum] = "0e3c3ab9378db84ba0f37073d67ba125ae4f2ff8daf366c9db287e3f1b2c35f0"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2
-- 
2.25.1


