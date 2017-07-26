Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E4217827A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 00:18:45 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id d193so15734362pgc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 17:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=r4YI85WtJumt2toOg74Tquglz3bbSLbjyc9/t74VfJQ=;
	b=p6JKRTZZZGUuYsnrluqaEbZK19mFWV9uxG1A1HJ+A2wFypRDXNZIo8m3RvVK2IM8lu
	Xl5RfuLu2yJsw1KlHEOG4+6eXvp7FPCzZ1dkZRXTSRYfzmQgZl6Fvp33vl+FR1nCTMzY
	zWFEIrOxUAAxvJroF3BkjFriHtT7Njq1CxGhQWa0WIeopsW1jthq/WhH4BF0u2fqAvDT
	7s5GGmf+Zi2yS+vHvqsD8FnLv8I+JsLqfTO7Bv66VxZQa260EpYaJyyJyUZLQf8vhZLN
	ZPHJH/Ai08irvHvfgz0tayCADnNjUlozFP/j3ICoY2iiYQsqRWVEKkXTugftzI6ep/N4
	63YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=r4YI85WtJumt2toOg74Tquglz3bbSLbjyc9/t74VfJQ=;
	b=GKU7ThWfuyDo9bCFXFwiU4Iy9eK3DSY2+Uz2mbXlguGoLNk/+r5FVksBBXk5d4PgXb
	7Q0WAgo0IKq39dtNB5dFEEIuWI//b5y1Lih55xxPqySB0TuWdUopkMjFZSgHUL0bg0jS
	JFPiudScOlUW5oNExvcwws0KQYpM5kFlzQlVPEmCSvZBQx76j3pmIMVaGGEqFaxZtUhn
	ASpGSnbPJglFfKveIW/5eVXwEjZQ1qL57UKK+OdQduK9xoufJD4Tna1qptqn1aBylFUW
	ey29UEW6+3iDgx+Zuw45GuFWoQ1i1Ab8y6UlKqshclHukqX5SXUCHx6vsoNtjpX3+aCq
	mNZA==
X-Gm-Message-State: AIVw110GmglT8SVPnjjYeWQwSGEHwAp3YcOGaDy2LY+sSZobv/r1zDlh
	dSKyT/WPq/YFLfR+
X-Received: by 10.84.241.207 with SMTP id t15mr23030199plm.338.1501028326591; 
	Tue, 25 Jul 2017 17:18:46 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	e5sm31531979pfd.41.2017.07.25.17.18.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 25 Jul 2017 17:18:45 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 17:18:36 -0700
Message-Id: <1501028316-27462-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501028316-27462-1-git-send-email-armccurdy@gmail.com>
References: <1501028316-27462-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] mirrors.bbclass: provide git repo fallbacks using the https protocol
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
X-List-Received-Date: Wed, 26 Jul 2017 00:18:45 -0000

Use MIRRORS to provide git repo fallbacks using the https protocol,
for cases where git native protocol fetches may fail due to local
firewall rules, etc.

These rules should cover all git native repos used by recipes within
oe-core, with the exception of mtd-utils, for which there's currently
no upstream alternative to the git native protocol for anonymous
access ( see http://git.infradead.org/mtd-utils.git ).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/mirrors.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 9b72473..b98684f 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -62,3 +62,14 @@ npm://.*/.*     http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 "
+
+# Use MIRRORS to provide git repo fallbacks using the https protocol, for cases
+# where git native protocol fetches may fail due to local firewall rules, etc.
+
+MIRRORS += "\
+git://anonscm.debian.org/.*   git://anonscm.debian.org/git/PATH;protocol=https \n \
+git://git.gnome.org/.*        git://git.gnome.org/browse/PATH;protocol=https \n \
+git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protocol=https \n \
+git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protocol=https \n \
+git://.*/.*                   git://HOST/PATH;protocol=https \n \
+"
-- 
1.9.1


