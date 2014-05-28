Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f51.google.com (unknown [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A13756FB92
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 11:56:47 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id x13so11061354wgg.22
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 04:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=j7vANaNB7IatYGNVLg0j8SzOIN5r7Vy6MEuoRptts8s=;
	b=PuNajxZ49jgo5+Ci3Ft0ZMFptP3drpWr5dX2gfhRglsw0xRKR7K6fH12k6M3jK5Gv3
	2Kh7ffkr9pP2KJ4CvDJFdbzSM6eRkPXFFlyeznucDq3hc1BeaqIaqFPwCu7Q0/5YPhbe
	DQ2xB9VhuqLmI4HUaf913Cg8R9JLzr+4zELbSJRZT/8nsuY7WuidCZ5PLoMqG3uNtsHy
	/puGTTuIWUHEGShAbCn9kaTlMnjzYzt5sH0Mg5EqpqQH1aYsJz4LNNXr7MA+Bh1YE7Xi
	VFvWJA08CbGpcxgAm1bsJb2eBnX6+S//NcnV783FTVExPr62qoB4CZ6y/cc9USoCmmk/
	yxgQ==
X-Gm-Message-State: ALoCoQkVUyluZLjrongTy0g3Rg7Q9VYd/aCbOmsOh4LGiJSrBHQtanCVDpn1sjSfRurJRyuB2m3v
X-Received: by 10.194.71.71 with SMTP id s7mr52196238wju.48.1401278207858;
	Wed, 28 May 2014 04:56:47 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id bj2sm16345631wib.3.2014.05.28.04.56.46
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 May 2014 04:56:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Wed, 28 May 2014 12:56:24 +0100
Message-Id: <109f78bb2752d4397069129e8db1a71f233b4d86.1401277810.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
In-Reply-To: <cover.1401277810.git.ross.burton@intel.com>
References: <cover.1401277810.git.ross.burton@intel.com>
Subject: [PATCH 2/4] readline: exclude autoheader from autoreconf
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
X-List-Received-Date: Wed, 28 May 2014 11:56:49 -0000

readline ships a hand-maintained config.h, instead of letting autoheader
generate one from configure.ac.  The required arguments to AC_DEFINE are not in
configure.ac so autoheader will produce warnings and the generated code will not
behave as expected.

Solve this by excluding autoheader from autoreconf, so the upstream config.h.in
is used.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/readline/readline.inc |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/readline/readline.inc b/meta/recipes-core/readline/readline.inc
index c33e91a..2c5ad00 100644
--- a/meta/recipes-core/readline/readline.inc
+++ b/meta/recipes-core/readline/readline.inc
@@ -21,6 +21,8 @@ S = "${WORKDIR}/${BPN}-${PV}"
 
 inherit autotools texinfo
 
+EXTRA_AUTORECONF += "--exclude=autoheader"
+
 LEAD_SONAME = "libreadline.so"
 
 do_configure_prepend () {
-- 
1.7.10.4


