Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 80D1577F79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 12:59:30 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id o42so2096403wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LtD6bYLeom9uCpiYdTfMjYGbIpmXa1CLL4GdQB9MI28=;
	b=qew0VksRs+BWcwhAsbL7GZwxWFJZONjBzW9ZLJ11d51R9XwqoguVpucSbKUhP12KUm
	gIf1MNC54IppIx0vxUiYNv/NzSdiBH1+xvbtMNxEXC5Jngj1DDSZ9HHG1t3qlW9CCaih
	cD78q9/rOaKN7j1pFyVTsv2EkPHm4BdafQV0s8DBibYvgvEeqfDzZV1UpiLgSQcF6mEk
	0NSA8fBJ/abFk2L2id9WjtUaYDhAuz/A+pbJzc4fe6zt9LaoerB4EYYbabd8cuuhSHpg
	d9CKTCQOvifLSqgZrnqq7uFVfRxtK12rYESJewvP08dJUvgC9kFft6Br2qrB24hTaeSP
	ny6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LtD6bYLeom9uCpiYdTfMjYGbIpmXa1CLL4GdQB9MI28=;
	b=YtjxD1qNyHBwFogvkbo4DUhjxpvN+Behaie9u5ok4JITFRi12DzBDDeKGp+vEuAEMw
	jCEbnO9pKSFe8Wk1sLIWLtv8tlTlX1My3OQKjt3a0R3+NRsFDv/0BxWgw2ULSc+EznQ0
	85qNpYi0Ut8sBOpXx5KTO4ao2eWsTdfP2hjF05vxkrnTIfd5gS3RImwzH/nqtYmahzJF
	Nb74b+tjrGSThT40XlO6x7yMjuNaGCsp66HPbbm0F8RM5l5hGIri90rQX6r9JhisPzr1
	n6mlZXNPq9Ngm1epRD2rqMufdESgvg2KK3RmlktYGeZe7R+h2JR26tSE4Ur6zJkJJesE
	YRFg==
X-Gm-Message-State: AHPjjUgUkjJR9qmPTduGt947AJc0Opf6V78mbsxsY7Q1hJlZYyM26I6U
	nUG8S7x0P8Tt8AXX1OKN/LRlB6Zr
X-Google-Smtp-Source: AOwi7QDC4spzS3LyDcck4WNkPp5SKityUvtLX+ywCfDjYS3rXpZyWZEcd/TBZlIh7NLJyVCeGHlu7A==
X-Received: by 10.223.145.163 with SMTP id 32mr4472487wri.279.1505912370624;
	Wed, 20 Sep 2017 05:59:30 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	p20sm1695658wma.28.2017.09.20.05.59.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Sep 2017 05:59:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2017 13:59:25 +0100
Message-Id: <20170920125925.28089-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170920125925.28089-1-ross.burton@intel.com>
References: <20170920125925.28089-1-ross.burton@intel.com>
Subject: [PATCH 2/2] sanity: check that path variables don't use ~
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
X-List-Received-Date: Wed, 20 Sep 2017 12:59:31 -0000

The core path variables (TMPDIR, DL_DIR, SSTATE_DIR) don't use tilde expansion
but if the user does then the errors are very mysterious, so check on startup.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/sanity.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 91b92ec28a8..1feb7949daa 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -726,6 +726,11 @@ def check_sanity_everybuild(status, d):
         if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
             status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO"))
 
+    # Check that these variables don't use tilde-expansion as we don't do that
+    for v in ("TMPDIR", "DL_DIR", "SSTATE_DIR"):
+        if d.getVar(v).startswith("~"):
+            status.addresult("%s uses ~ but Bitbake will not expand this, use an absolute path or variables." % v)
+
     # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
     # set, since so much relies on it being set.
     dldir = d.getVar('DL_DIR')
-- 
2.11.0


