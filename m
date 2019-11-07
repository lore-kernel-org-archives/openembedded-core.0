Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1FD7F817
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 09:40:34 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id a11so2203027wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 01:40:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dEAuwMnuUvFJ9EMs1Gd3M4AW2Fh2RwVVbHUdLWtXj50=;
	b=RkBnPzGJTP51J+THApUynQQuhjhElJ8JqrTfs0n288c/MTzIqnlvMUuMZ2TH0bbjF1
	Nzk8crqTs8eMrsJuhdSE1pP9bZbCZpB6xKWQvYWcSF+nYxb+YiI2lyK+Lt9spJu8zYh4
	B/uhy/Y72Ru5hFCEkzQUIQ2sRchQLPdjgVJZdrurltDlCm7wigts7/WwitGy1EFesjrW
	aKx9MYYYZk+keua+mFerPl7+W/lqAAiaNPQ16YzA563BQE3kDDleq2BE5mCa9Nb9Tkqi
	cRH0UTA6vwaY4GVQezvb8gNbGHkO+I2s16WA+dPvDLD+IexF6s6s95VTlHV42mHTejLe
	m/NQ==
X-Gm-Message-State: APjAAAVHwPC3RIHAvvuPlkO4AYtk2Rr1NC+mgcAs6aqZcHwhhjRm4XVb
	1uFDcGQi9pn0koxWBi5n5hIjPmKn
X-Google-Smtp-Source: APXvYqy0uM0zKlPgld7UBx4gKvm0/PxBYLDjeKB/MglFiMBjbLrS8RTPqb9gSVTYONWgPIFZdz+f/A==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr1990597wro.392.1573119634644; 
	Thu, 07 Nov 2019 01:40:34 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	t133sm6001008wmb.1.2019.11.07.01.40.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 01:40:33 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 09:40:33 +0000
Message-Id: <20191107094033.33950-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH] libevent: enable OpenSSL unconditionally and update packaging
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
X-List-Received-Date: Thu, 07 Nov 2019 09:40:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The original commit describes the reason for disabling openssl
so as to get 'more deterministic build[s]' and size-reduction:
commit 6c36fde6ce2e ("libevent: disable openssl by default"),
commit ad130b97a51a in poky.

Since the introduction of per-recipe sysroots, we always have
deterministic builds.

Size reduction can be achieved by splitting the package into
multiple sub-packages, which each only provide one of the
shared libraries.

Hence there appears no reason anymore to disable OpenSSL
support.

Because this recipe only provides shared libraries which are
handled automatically by bitbake, there is no need to add
the subpackages to the RDEPENDS of PN for backwards
compatibility. The packageing process of dependees will
simply pull in the sub-packages as runtime dependency as
needed.

This also how Debian splits this up.

While updating the packaging, we can also drop event_rpcgen.py
which appears to be a tool for generating rpc bindings, i.e.
something that should normally be in -dev. Given Debian
doesn't package this at all, and given it actually requires
python to run but no runtime dependency is stated at the
moment, it would appear that no users of this exist.

These changes also allow us to build all of nghttp2
out-of-the-box, without affecting existing users.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/recipes-support/libevent/libevent_2.1.11.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index f005ab8bda..c746f22118 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -19,9 +19,6 @@ UPSTREAM_CHECK_URI = "http://libevent.org/"
 
 S = "${WORKDIR}/${BPN}-${PV}-stable"
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-
 inherit autotools
 
 # Needed for Debian packaging
@@ -29,11 +26,19 @@ LEAD_SONAME = "libevent-2.1.so"
 
 inherit ptest multilib_header
 
-DEPENDS = "zlib"
+DEPENDS = "openssl zlib"
+
+PACKAGES =+ "${PN}-core ${PN}-extra ${PN}-openssl ${PN}-pthreads"
+FILES_${PN}-core = "${libdir}/libevent_core*${SOLIBS}"
+FILES_${PN}-extra = "${libdir}/libevent_extra*${SOLIBS}"
+FILES_${PN}-openssl = "${libdir}/libevent_openssl*${SOLIBS}"
+FILES_${PN}-pthreads = "${libdir}/libevent_pthreads-*${SOLIBS}"
 
 BBCLASSEXTEND = "native nativesdk"
 
 do_install_append() {
+	rm ${D}${bindir}/event_rpcgen.py
+	rmdir ${D}${bindir}
         oe_multilib_header event2/event-config.h
 }
 
-- 
2.23.0.rc1


