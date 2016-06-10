Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A432373166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 15:12:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m124so18599323wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 08:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hz5T8wbcLexT/CiQ0ruXFF0Bh3ELru1DA3Z0x0aoZ3U=;
	b=OXY2cbp3769973zMHkF+rGMvc8ZAzYJkOHwEuva/9E8JOTps/hRbqLIP6LSeLu8dfX
	jB2RoiS5a5RHfiX9ekX/6wT/kaoMKhuZvEtIqP9tygym85xy3paBX6ZC6gVfknZL1qlF
	ZTcAjruT5k1AyopT8HhqakX3UZL8wG3GuGBBFzHblOrxZfSNUylv7ZhCHeodnUgwTZMx
	zB5jr0oVYGiAUoVii20lSY8v2UHI47fMlBnY3V4DSoNCgXoKkRxMQgYJmVtJmn59HNMG
	6wvjTn5349EDP2y/b2zU62qdXwiWbWOCGEPOYw/qK8dCW8KvbXt924Rao6oCvFri2F8A
	pmng==
X-Gm-Message-State: ALyK8tJutjVTwCbfeZ3eBO+vH5Dt0hsiiuu2ArAlveII18dcRPuywkLBw/kNpb50/uffSg==
X-Received: by 10.28.187.8 with SMTP id l8mr19671803wmf.2.1465571536589;
	Fri, 10 Jun 2016 08:12:16 -0700 (PDT)
Received: from tfsielt31850.TYCOFS.COM ([185.46.212.66])
	by smtp.gmail.com with ESMTPSA id
	lf7sm12805298wjb.23.2016.06.10.08.12.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Jun 2016 08:12:15 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jun 2016 16:12:13 +0100
Message-Id: <1465571533-21604-2-git-send-email-git@andred.net>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1465571533-21604-1-git-send-email-git@andred.net>
References: <1465571533-21604-1-git-send-email-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 2/2] uclibc: never build with SSP
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
X-List-Received-Date: Fri, 10 Jun 2016 15:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

This doesn't work, as the initial gcc that is used for compiling
uclibc doesn't have support for SSP yet (since that will only
be available once uclibc has been compiled). Since during that
same compilation step uclibc is trying to build its own utils
those are failing to compile with SSP enabled as the
initial gcc doesn't have access to the required libraries,
yet.

We never used to set UCLIBC_BUILD_SSP in the past, this was
only changed as part of the upgrade to uclibc-ng in
commit 63bdadc (uclibc: Switch to using uclibc-ng), so here
we now simply restore the previous behaviour.

Note that we still enable SSP support inside uclibc for
everybody else to use, though.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/recipes-core/uclibc/uclibc-config.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc-config.inc b/meta/recipes-core/uclibc/uclibc-config.inc
index ed7b522..8b9e41c 100644
--- a/meta/recipes-core/uclibc/uclibc-config.inc
+++ b/meta/recipes-core/uclibc/uclibc-config.inc
@@ -119,7 +119,6 @@ def features_to_uclibc_settings(d):
     uclibc_cfg('thumb-interwork', distro_features,'USE_BX', cnf, rem)
     uclibc_cfg('xattr',     distro_features, 'UCLIBC_HAS_XATTR', cnf, rem)
     uclibc_cfg('ssp',       distro_features, 'UCLIBC_HAS_SSP', cnf, rem)
-    uclibc_cfg('ssp',       distro_features, 'UCLIBC_BUILD_SSP', cnf, rem)
     uclibc_cfg('argp',       distro_features, 'UCLIBC_HAS_ARGP', cnf, rem)
     uclibc_cfg('libc-posix-clang-wchar',  distro_features,'UCLIBC_HAS_WCHAR', cnf, rem)
     return "\n".join(cnf), "\n".join(rem)
-- 
2.8.1


