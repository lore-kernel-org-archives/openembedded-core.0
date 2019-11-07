Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4C94D7F968
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 15:36:40 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id i10so3525351wrs.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 07:36:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c6pjFHGlBSSt5fCHzzw88fwGG4NCh0PeDELwiwIKTMk=;
	b=Q4J8P/baK1+jYkbgwYZFNuFszk6VOGP0OzdKCIYGy58gtEeMnXcWRuPEXGErXxVMQg
	z1OwtEXDaTUh1Zpv2nQV5i6+9NRePFXOPhy5NTiVLIKprNx+T78je0WgRq8bCoA4KAn0
	zuoTVLCqeEF/GiXoqbJ0vYewAgs7zc8prFdTYllUbNnzrNUCNbs9i20mTWxj49d9jLIV
	3PlHKFi3lWQr8ge8iIwARTCj6zunSR8TGrNKmD6Pw2QsMVtWJNfWfsQ0dVYv15vgdiJu
	W61S3XJm/dU2f67xKXT0foIyqF8f8RLhJ6I3Y2i+2Fj911vSBXllt6QEI2wlXpQ0e3W5
	1TmA==
X-Gm-Message-State: APjAAAUdIXm/xzGGykLU3ERF04ghChdFofHlJq5540oq8gMOIZYEx56c
	PWwDJAZZnKVpkZ6oxKP0MacjHvtn
X-Google-Smtp-Source: APXvYqxyBEWI6jA0VNV7dytNvZwFNoymbVJPK4Pcs/M3JOr+04cQPxdFDuWigFH7E2cq4WCnLA/J2Q==
X-Received: by 2002:a05:6000:110a:: with SMTP id
	z10mr3334983wrw.291.1573141000702; 
	Thu, 07 Nov 2019 07:36:40 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a15sm2460124wrw.10.2019.11.07.07.36.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 07 Nov 2019 07:36:40 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 15:36:39 +0000
Message-Id: <20191107153639.22209-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20191107094033.33950-1-git@andred.net>
References: <20191107094033.33950-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2] libevent: update packaging (one package per shared library)
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
X-List-Received-Date: Thu, 07 Nov 2019 15:36:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libevent produces several libraries that might or might not
be used in the end. We can prevent those potentially unused
libraries from being pulled into a file-system by splitting
the individual shared libraries into individual packages.

Because this recipe only provides shared libraries which are
handled automatically by bitbake (shlibs), there is no need
to add the subpackages to the RDEPENDS of PN for backwards
compatibility. The packaging process of dependees will
simply pull in the sub-packages as runtime dependency as
needed.

This also how Debian splits this up.

While updating the packaging, we can also drop event_rpcgen.py
which appears to be a tool for generating rpc bindings, i.e.
something that should normally be in -dev. Given Debian
doesn't package this at all, and given it actually requires
python to run but no runtime dependency is stated at the
moment, it would appear that no users of this exist.

Signed-off-by: André Draszik <git@andred.net>

---
v2: keep SSL support turned-off by default
---
 meta/recipes-support/libevent/libevent_2.1.11.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-support/libevent/libevent_2.1.11.bb b/meta/recipes-support/libevent/libevent_2.1.11.bb
index f005ab8bda..8c7c49e7dd 100644
--- a/meta/recipes-support/libevent/libevent_2.1.11.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.11.bb
@@ -31,9 +31,17 @@ inherit ptest multilib_header
 
 DEPENDS = "zlib"
 
+PACKAGES_DYNAMIC = "^${PN}-.*$"
+python split_libevent_libs () {
+    do_split_packages(d, '${libdir}', r'^libevent_([a-z]*)-.*\.so\..*', '${PN}-%s', '${SUMMARY} (%s)', prepend=True, allow_links=True)
+}
+PACKAGESPLITFUNCS_prepend = "split_libevent_libs "
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install_append() {
+	rm ${D}${bindir}/event_rpcgen.py
+	rmdir ${D}${bindir}
         oe_multilib_header event2/event-config.h
 }
 
-- 
2.23.0.rc1


