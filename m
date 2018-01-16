Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92D097827E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 13:25:24 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id 100so15139527wrb.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7T8YFFRUScafPs+R2woV/GMH7qSV7FAgPjHhDrhOWnY=;
	b=SDDzH1HkY/dpjuI2cWZPs3GrupTf13iMToLbpDkaBtNUaUUbvUUKFp5X64WEXT63nO
	10qaPpGgMTwmqcIOqqvPYSOvCH5pWMhiVEzUuzHbCS5oNAuI8caKb4vtJwZM/E/eBktp
	tCrog2jpEaLq+JRX5tD2wrBRJiN1VGatuULTYG1S/+BWITQQD0ZwDHpVJXlQzDqh9Jb/
	0ORgE4/IWXjY5I4LBtVqKYeQCCnR2PBz8OtjCQuVdgnxXR2vDtQueq2su8NxzNONEwmt
	fscx8KwGRP/odaV4KYk9ySLUGVpGiNrwdCKzsTvmVWptbD1ELswIEjSZCjlwU+J9WnRD
	ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7T8YFFRUScafPs+R2woV/GMH7qSV7FAgPjHhDrhOWnY=;
	b=LqpfeAbyNTVw4y9vDpvFLhdmLT9ZOLM0IkMzmW0K0evFFXr0Hhw3PhOsG2JskySXft
	buPHr7LQyT7i0SMoQts1t4gNXKqxvU8msZXpZyv6tZPpaRvtnSLhySzwpWtrcIxyNIF3
	binbSVHLDQm/VLxgr5r5o/GyR+VsqqjB5FLs2Pt6pm4KGSkxWftIrIeLw/n6Ew3TjwC1
	i5Qunz7OMrWrDWP3cod4tCnUu/Ob9casxLJexwdK/6GnFUn2gbDeSkljhR4W4sW3jxjg
	31QfqgvQSDx48WYxuUE2XXqUoNa/ALmC5Int3JJ/9ZkfixzkQniIMBKenoy7elbBIC6Y
	I1Rg==
X-Gm-Message-State: AKwxytfrUm4ko3TKkQpo2iS5/Q2XtyNw9DAXTTgWNIFmATunwcb5nXok
	MweS8RnT3jbNdon7V+fzlCA0pZjD
X-Google-Smtp-Source: ACJfBosJOjbeZaq+yNNnF2dnaLZFeLvANWAZH+zGIrt6Q/XSHZrFtXD1hiPxkfzuLWv/JZss18317g==
X-Received: by 10.223.134.179 with SMTP id 48mr4787692wrx.93.1516109125567;
	Tue, 16 Jan 2018 05:25:25 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f76sm1731576wme.2.2018.01.16.05.25.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jan 2018 05:25:24 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jan 2018 13:25:16 +0000
Message-Id: <20180116132516.27653-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180116132516.27653-1-ross.burton@intel.com>
References: <20180116132516.27653-1-ross.burton@intel.com>
Subject: [PATCH 2/2] piglit: override install target name instead of do_install
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
X-List-Received-Date: Tue, 16 Jan 2018 13:25:25 -0000

Simply override the install target, instead of reimplementing do_install.

Apart from being neater, this also stops the recipe expecting that cmake is
using the Make backend.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 9471bd08c43..06c5021eb76 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -41,9 +41,7 @@ do_configure_prepend() {
    fi
 }
 
-do_install() {
-	oe_runmake -C ${B} 'DESTDIR=${D}' install/strip
-}
+OECMAKE_TARGET_INSTALL = "install/strip"
 
 RDEPENDS_${PN} = "waffle python3 python3-mako python3-json \
 	python3-subprocess python3-misc python3-importlib \
-- 
2.11.0


