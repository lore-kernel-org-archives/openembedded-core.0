Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9DD671AC1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:57:41 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id d128so9050823wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=OTruswj4L+0fbT+vrKl0qf0v2tJNgCFy4LIuhw0K0C4=;
	b=Kd8x26dTPzBC3H4PTozpQu1obxEpfJ06Pk1See9llmWT7w0leH2w7oFOhBXVUIED+5
	0vjTysIokDwjUiRwTcVe/E3LS1XJ//r7Xc1E7o8bt65EtmhIlHw8DCo84TZ0EfVXkhIB
	ebwyAG6tgIfWjE9k1F5KlKmV2dHGyhhb89hyxthDuZWLnK/G3Q1nSvV6sX8345+l73Sk
	DmLbYhFCT5w6PfDrSRZecWd+VynR9EeihWbuk5g0Fu7LddmvA5U80US5mUiJttNZXWld
	NRLtpE1+515ARsL69D11EDDZORetqNalah/PhKEyy6Y67iaz5sOxlmDBL2FCV+za3o0g
	ov1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OTruswj4L+0fbT+vrKl0qf0v2tJNgCFy4LIuhw0K0C4=;
	b=ZZa2rDaX/ikk48emHIxuG3hamoNYrm19P3SEXjR/kN8SD1hLWdA/+vWWi8GumINlYN
	P4U7HUyTWHaQqP7rinZdDrihEc6TDIGgLYFvS0sEjQL+MCd5GmhENbGX/OGZ721IrPha
	yDiOU3A6ZpKfdS4T+UtaE2KuFlNrbBQP/7r1cIhPyIq7nktJ4KZGUicjI1DSDWUAbCnH
	/XoPpyQe0Y2hOzfhy69Hv3kJYSHxit4uMTuMOT6aOochwKgxTrJq31nJ1j0GpfpR9/vP
	pkJvXe/TlkMDhoIS4LEJDCdXIdkJWGJscMJydfDG8jpIGLUsr/mM+G4d6ezkkDgw18zh
	Kx7Q==
X-Gm-Message-State: AA6/9RmWUySkzptIS2Mj5/HvvL7QzobS2NEAFejTg5M37VhZV532K6lJihheWZkxPE763TDJ
X-Received: by 10.28.207.3 with SMTP id f3mr6540818wmg.15.1476464262678;
	Fri, 14 Oct 2016 09:57:42 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id o1sm32972238wjh.9.2016.10.14.09.57.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Oct 2016 09:57:41 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 17:57:39 +0100
Message-Id: <1476464259-18585-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH][V2] pixbufcache: handle gdk-pixbuf not being present
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
X-List-Received-Date: Fri, 14 Oct 2016 16:57:43 -0000

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
 meta/classes/pixbufcache.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index dbe11e1..3f48a0f 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -54,6 +54,7 @@ gdkpixbuf_complete() {
 # An error exit during populate_sysroot_setscene allows bitbake to
 # try to recover by re-building the package.
 #
+DEPENDS_append_class-native = " gdk-pixbuf-native"
 SSTATEPOSTINSTFUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
 # See base.bbclass for the other half of this
@@ -61,7 +62,8 @@ pixbufcache_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" ]; then
 		${gdkpixbuf_complete}
 	elif [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]; then
-		echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
+		if [ -x ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders ]; then
+			echo "${gdkpixbuf_complete}" >> ${STAGING_DIR}/sstatecompletions
+		fi
 	fi
 }
-
-- 
2.8.1


