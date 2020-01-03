Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8F887F98A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2020 18:09:28 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so43137288wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jan 2020 10:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rio6CIQQBHhM/22TIYLxEL4Ipp/iInzFCqY2LUflVP0=;
	b=zlq7hUqbPtmzuCAdj8bske/rb5hXyB9Stc6qUfJdZ2nx5qP8ybeao9NbooZPzhTXf5
	/ocFXtja6JxzDBIxyVokjxzGKgSZkIBl6mZbGr4ktUvRg6LvL8l3orWqDubZCO+AJdY2
	JVM6vuT81RtdFzjit0BYgwEbss5LhOi/0rXryjwoW+VYlcbk8ut0hP5VQnQZggYPgb6O
	T4su695aNDHJ+qBW4dcb6voKgZacyaQzg+n8ONDuMegiNoawXormgYqoTNKUYzVTCPlu
	B2ZAZbRWOCSiZuzjij/yf7szH3VWaGV8pjqeLgniPyktM/xU5bq0Tv9w7n3FIz5Ji68u
	4ijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Rio6CIQQBHhM/22TIYLxEL4Ipp/iInzFCqY2LUflVP0=;
	b=QzZSRL4uIebaf5wb+gPcYWcyUS1hJdaMHfOFPVosHUMmCwuLtedfRrn8y0a5MRvSGz
	pPrdptQVCWfWBlCeKyMQPwtm+UYWIaFRs89tpyw6eAwyxv9GaTWAnrFXBL1PcBSDRRR/
	vTGaWFCI5GrEBTxHNvBjps0/h3VbxnvzdYZzUvhzfcF+8/EeM3W9reQWsOy+LhKy3SFZ
	14Ia2Ot1SumSH6hHYIe7NZoLg2i1x0eiw0prKcakauSFhZyMmJuObk1ll/SP09g+HEv4
	Cee0ZUZWALh041045H2TtLJUI7hYsCOMGWPdg3Jd1yY2ZdxblPEZgYpfbeHh8btTWl2t
	h/oA==
X-Gm-Message-State: APjAAAW8/j0VlqinjiCarwnYn1e15UDoUdNVC/qo1orqnFD7sbYP8ni9
	SJA+9/AktBHnpger2TH04t/VKNWeYcs=
X-Google-Smtp-Source: APXvYqxiodtGLuIIV4Ugt39FUfzjcmIFbIRBzp/Dt/odCgv5A766q/60N465jQ8af6Lq29dbfiYAZg==
X-Received: by 2002:adf:fa12:: with SMTP id m18mr85827395wrr.309.1578074968680;
	Fri, 03 Jan 2020 10:09:28 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o7sm12625104wmh.11.2020.01.03.10.09.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Jan 2020 10:09:27 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jan 2020 18:09:14 +0000
Message-Id: <20200103180914.13278-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] meson.bbclass: warn if cross property defaults are used
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
X-List-Received-Date: Fri, 03 Jan 2020 18:09:30 -0000
Content-Transfer-Encoding: 8bit

The Meson idiom for checks which require running code on the target
(which isn't possible in cross compilation) is to use a cross property,
which the user can set in the cross file:

if cc_can_run
  rres = cc.run(test_foo_code)
  have_foo = rres.compiled() and rres.returncode() == 0
else
  have_foo = meson.get_cross_property('have_foo', false)
endif

The default value may be overly conservative so we should review every
property and explicitly set them as apppropriate.  oe-core 669ddaf added
a log message when the default value is used, so look for this message
and emit a warning that the user will see.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 71f9de1a570..6a3c0c55e30 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -158,6 +158,15 @@ meson_do_configure_prepend_class-native() {
     export PKG_CONFIG="pkg-config-native"
 }
 
+python meson_do_qa_configure() {
+    import re
+    warn_re = re.compile(r"^WARNING: Cross property (.+) is using default value (.+)$", re.MULTILINE)
+    log = open(d.expand("${B}/meson-logs/meson-log.txt")).read()
+    for (prop, value) in warn_re.findall(log):
+        bb.warn("Meson cross property %s used without explicit assignment, defaulting to %s" % (prop, value))
+}
+do_configure[postfuncs] += "meson_do_qa_configure"
+
 do_compile[progress] = "outof:^\[(\d+)/(\d+)\]\s+"
 meson_do_compile() {
     ninja -v ${PARALLEL_MAKE}
-- 
2.20.1


