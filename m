Return-Path: <ross.burton@intel.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3378C71AE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 20:53:20 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id l131so115091763lfl.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6nN5ACTl3wIHNdNxv6eATCXg5zx4DfvLWCQwLjPA0/k=;
	b=Gi3HTwtQ9SSErp/Y2jIiRzsXMTjgeMjYY4CRQFJr+wxuR3LZoxUUG8qrU83mcExXFs
	/npuSQq7RbKbgdKoFZBBFNnroYerRDdVDCaY6O50icTq+sMoN5qMUa7e1BO9EFZrFWKH
	gc9HR2lwxuZTi1SHyiuc08DUndzD9aTnm389TJ9vCYKgQBa/2+BG2+n4euxxzXVPp/jl
	+lV/6TpKROnM6X0kqPf0QfBiEnjhsANPcjS4dNDWs97oAvwGRXSwodl1Ftpt7d1XllEk
	j5oqpL6Q4wJIiLF753zzN5cznhXdUtcEXmzCub1Tw0zGjP65cPS2Q/EiGQPJwlXD/Edq
	hHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6nN5ACTl3wIHNdNxv6eATCXg5zx4DfvLWCQwLjPA0/k=;
	b=aafS97/0pb8Aglm2KfbvKsY/RXlUOzyC6UpKcYCdrrrbb/BVsde4XTRdpTS5mGVX9v
	lyaBR3QEpXTDPzv4vQzau6LkWcSybcTA0GtBfTZjpaHyvl/y46BlePx/SCE3qwIQfNyI
	/DYrrBSfBOiLzAqzYab/3LGuHUaSpAkvrZX8a+VAAgOWYadkoesQVgoEF/t6X5Dqorn+
	wMXv+61mqWFYi621VCHwQ0ehSfIENSpkrreHEnoi8OFc4E0CFQEQacO+JZhSUKP2NfPo
	DoanFjsG8CuV2BFGR7rnSoUK/P+1jvrY8QVX43SQJLk3m62cy6wJOh1TVvuzYAfi14Sa
	cw/g==
X-Gm-Message-State: AA6/9RmPYM0usjJGMe1pziVuU1EN+ZsHwQTiq22At3uIxMnRiWU+nMg+wQJQNWa7YTM1aXyt
X-Received: by 10.28.153.66 with SMTP id b63mr3350408wme.79.1476392001152;
	Thu, 13 Oct 2016 13:53:21 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	a1sm25558815wju.41.2016.10.13.13.53.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 13:53:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2016 21:53:15 +0100
Message-Id: <1476391995-17730-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1476391995-17730-1-git-send-email-ross.burton@intel.com>
References: <1476391995-17730-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] pixbufcache: handle gdk-pixbuf not being present
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
X-List-Received-Date: Thu, 13 Oct 2016 20:53:21 -0000

It's possible - albeit unlikely - that gdk-pixbuf isn't present in the sysroot
when a recipe inheriting this class is and the sysroot is finalised.

One example would be if the sstate archive has librsvg but not gdk-pixbuf:
librsvg will be extracted from the sstate but gdk-pixbuf will be built to "fill
in the gap".  In this situation the setscene completion hook installed by
pixbufcache.bbclass will attempt to execute gdk-pixbuf-query-loaders, but that
binary hasn't been installed by gdk-pixbuf yet.

Also add gdk-pixbuf-native to DEPENDS in native builds to ensure that the
binaries we expect will be present, as it's possible to build loaders without
linking to GdkPixbuf.

[ YOCTO #10420 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/pixbufcache.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index dbe11e1..b619a77 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -54,6 +54,7 @@ gdkpixbuf_complete() {
 # An error exit during populate_sysroot_setscene allows bitbake to
 # try to recover by re-building the package.
 #
+DEPENDS_append_class-native = " gdk-pixbuf-native"
 SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
 # See base.bbclass for the other half of this
@@ -61,7 +62,6 @@ pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" ]; then
 		${gdkpixbuf_complete}
 	elif [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
-		echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
+		test -x ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders && echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
 	fi
 }
-
-- 
2.8.1


