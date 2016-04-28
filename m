Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 98BE4731D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 16:42:18 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n129so72521842wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 09:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Mw3Hm198MnGDG8pOxwmp8j1rLK17WDAbdJFUdj9aQxA=;
	b=zEe5CDCWKBwPvcClUmigZGyNE5JjqEBs2z1qjNguJFZg7X77HHCVgggU/0h4F6syrX
	1tjdhGbHE7mFF2qipZIrAJ3g4VYh6KdXlORbUaFTCsPKqGHz6WPC9xIkOh0QPznLJvoJ
	CYJDNPC7hs0viLIUf6j0jLSVSwizrVoTBAZhaJvZPPg42fYfRuwRJ6F3O0PxEE7otFbP
	4dCpDE3wA8KbdWbpJoCN+hDEXhon1xhWFFzGv0Ik04JkH1/m2qjdOAQypnRxW/52T8Xf
	HI8fK0rDVTchJ9zGFs39GKI6cq2hXNAO2FtpwmSQuHaR3NxEkIRSDjG89t7N1cnQtfxQ
	FKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Mw3Hm198MnGDG8pOxwmp8j1rLK17WDAbdJFUdj9aQxA=;
	b=VoimBsqE5yz1fUkVMbXmnLun7sbP09+8mXSztr1aYLSP5mjB+3xfxUbvYRREoxcfQ3
	zrcTFaqcK0HzY7ibHdG2iw6GFLvHPQMmQrNIM2PpWXI7AjnDUk0OPizrvPb+lgqCr2uF
	7bEpCyc7P4rMkifNhfuxBpSkR3S5PiKREmgvKAxR7astYuc3qXnkxtlYijaSXcUbsDRl
	rVpZ18k2n8+XFwMPQ9fzA1a+d87i3uEPUUL229Lt8ZGeaiW7/oGwaHMKB7QbHgQ+sSRm
	h3zEYhd9dv1uU6t2b0N+pnbveSzLUmK0pyiqUSxbgGIZ9a8J1TwI/Uorz97rs4gyL4+k
	39zg==
X-Gm-Message-State: AOPr4FXhszyW5OPpqL1YzNgu0HuiwZpAaww6HORIK6rm5TWIRWK6ZhGkfX3XbNCm+m/L8/2j
X-Received: by 10.194.238.34 with SMTP id vh2mr18844261wjc.157.1461861738388; 
	Thu, 28 Apr 2016 09:42:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	yr1sm10537971wjc.9.2016.04.28.09.42.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 28 Apr 2016 09:42:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 17:42:16 +0100
Message-Id: <1461861736-29652-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] autotools: add default for CACHED_CONFIGUREVARS
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
X-List-Received-Date: Thu, 28 Apr 2016 16:42:19 -0000

Ensure that this variable has a default value so that we don't get debug
messages that the variable couldn't be expanded.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/autotools.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index 22880cc..c92ca78 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -77,6 +77,8 @@ CONFIGUREOPTS = " --build=${BUILD_SYS} \
 		  ${@append_libtool_sysroot(d)}"
 CONFIGUREOPT_DEPTRACK ?= "--disable-dependency-tracking"
 
+CACHED_CONFIGUREVARS ?= ""
+
 AUTOTOOLS_SCRIPT_PATH ?= "${S}"
 CONFIGURE_SCRIPT ?= "${AUTOTOOLS_SCRIPT_PATH}/configure"
 
-- 
2.8.0.rc3


