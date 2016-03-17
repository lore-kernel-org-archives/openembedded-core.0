Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBA870101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 05:18:35 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id u110so63171356qge.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 22:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QuUFSSbOkK5W4Rl10ZEi9/AfoHW2PukcfJYaI6SoFfk=;
	b=L3hQ8YZDv35SVb0Y+0C94ib3rRBofycuu7PO1mw1NkqJXTu8NrloThTpp+W5PJqykF
	mGXvS+txQBJC+QoHnKJOkW8l6YVRPwzt9cRm6cR0W70T5coViRzcILZNslm1lIfYxVso
	7L1s0MGQrprbv81K/3TMBh1k14BCQg1Vdnv0nPOJfg4Rzc3w1KICZy9JO2rebfGocHQ2
	N5ytKGA03nfnr+8dbyrbfqww49DrSvl0PVaLksGGYLn/RjSLtBDzBxoD9wz+lavpQ5ia
	MFMwqY/rKcE1nPmcYcadClcBfV2rISSGqwA/LHc31Ra5oSD+mGivCsdwaWBeWIFkP8Uw
	g8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=QuUFSSbOkK5W4Rl10ZEi9/AfoHW2PukcfJYaI6SoFfk=;
	b=OnUlblRM/XkoxmYWJMj2BuZdZwaWVk+k7Avc/05b5SPUkKQuGEFqPjH/FEHf/UIVOJ
	YqekYn3qH27hjIx9vjcLmKQWBOs97LMYkRaFcbtIaP1/G98XMv1daLZFCAK1tc13QGNd
	FTVRw3KqxxRfOwbhsH1gMO10HTWhH8DphLEA68pUAuov2WQ95OyQt/4Dh3p/joxQ1bZF
	7aW77k3iIMKXtqXnGOJNLsj6iYpgd0lADYwXUZmDCWl9tuKL5auF2K+L2VjNvp1jsQ8R
	tc3cv15CzbKUHwgqWndhY9P1EMk6E8d+ddffwW5YTL6oeOEUbUia9u/T8c37WirJ2w/A
	qycQ==
X-Gm-Message-State: AD7BkJKlY7iI195iKIXLs+xKT9UZwU1jNGgavht2P0j67Oj3ccgjPn+fTfK/+/lrf7VjSQ==
X-Received: by 10.141.3.11 with SMTP id f11mr12235710qhd.90.1458191916328;
	Wed, 16 Mar 2016 22:18:36 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	i46sm2216771qgd.19.2016.03.16.22.18.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 16 Mar 2016 22:18:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 05:18:19 +0000
Message-Id: <b180b195a2157def3afabcfb89fc258de1c821d0.1458191793.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
In-Reply-To: <cover.1458191793.git.raj.khem@gmail.com>
References: <cover.1458191793.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] watchdog: Disable nfs on musl targets
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
X-List-Received-Date: Thu, 17 Mar 2016 05:18:37 -0000

Fixes build issue on musl where it needs to link to sunrpc
when enabling nfs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/watchdog/watchdog_5.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.14.bb b/meta/recipes-extended/watchdog/watchdog_5.14.bb
index fc717bc..7330238 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.14.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.14.bb
@@ -28,6 +28,7 @@ inherit update-rc.d
 DEPENDS_append_libc-musl = " libtirpc "
 CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
 LDFLAGS_append_libc-musl = " -ltirpc "
+EXTRA_OECONF_append_libc-musl = " --disable-nfs "
 
 INITSCRIPT_NAME = "watchdog.sh"
 INITSCRIPT_PARAMS = "start 15 1 2 3 4 5 . stop 85 0 6 ."
-- 
1.9.1


