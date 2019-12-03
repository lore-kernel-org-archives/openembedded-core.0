Return-Path: <liu.ming50@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id ED5916C13D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Dec 2019 18:44:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id e10so5012760ljj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Dec 2019 10:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SMdUgF/ZkHFJja95cJUKkZF+9e6NgA9K7jXK4Fcz1Pw=;
	b=ornmug9ym/EjWjnHpORThhCEW4muVyWhVi8Rj3m4+BGzPJtGY326tg3LjwX7c8Sanb
	DHT0SWXw4BDb5aIldbITGa7rdn/kBl4/8NK+UI42vmb5WUq/nEkHYjfxc4Wnz0inZKc6
	+gClHRY6fh6rB1HSM2m94/1qTZSmJvNAS7jTthnoN9u8h8Fnr3ydAilti+vCYSszJ0YY
	fm0HqEWnpCY5KL0gpmzIf7HfAqC57pTnREtGl53IXSFuVtuVDRMycAyt/ZUkeUaL5NfW
	zdPGaSKhwQHdx5vhc40UyyjDyD3JT/COwAiZkMvjBzpQKEd50tzZz5xekr5A6g2jZmpK
	MwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SMdUgF/ZkHFJja95cJUKkZF+9e6NgA9K7jXK4Fcz1Pw=;
	b=gupD3IIs3wWeThRGUbKQx+qhSW1s5ANj6Wucdvshz/LL6Ku/FYp6+cfvU9l6NACwWi
	jxfq8AgXlFi2MZlpXcGxC1LfSrFje7htmh06nvTxOLhHd+kQvIkYftRuSicothtNd9Di
	9grvGSRUrp/ZuLNywfRjAYZrxsdLcuDVXcF8UPDztz3HyAN43OPVM/d8FhNfdrdzfCdr
	j5+i+xV0sgssKgkE40kmMSAOeV9errBV3IPqXypBZkL/MOeTsnzjSNKgtSJ8759eXpVS
	WVLunnY1Rl98ZcdkBX/pZMDmfKW0iiN2JZ1g9OjP0h/etVu05hpA9i7IN0X2XGZCmqKb
	5vfw==
X-Gm-Message-State: APjAAAVJn8T+njProM4BjmXaq2GdzUzoWxJfOOr20t1nAFqV4ogeajNH
	maA5V8PLQCNWg3zEi7jnAG7h1ngGe5w=
X-Google-Smtp-Source: APXvYqwKvss564tB/tjkhhmdwnfGgsZQwdIuFCeXqXBkdF6dyrhqAwLO+hTGKuHMBHe0PkHv3g4Vyw==
X-Received: by 2002:a2e:6f19:: with SMTP id k25mr3420698ljc.84.1575398685276; 
	Tue, 03 Dec 2019 10:44:45 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id t9sm1757689ljj.19.2019.12.03.10.44.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Dec 2019 10:44:44 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Dec 2019 19:44:40 +0100
Message-Id: <1575398680-3272-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] glibc: fix ldconfig packaging issue
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
X-List-Received-Date: Tue, 03 Dec 2019 18:44:45 -0000

From: Ming Liu <liu.ming50@gmail.com>

ldconfig should be prior to glibc-utils in PACKAGES variable, or else
ldconfig binary would not be split to its own package, hence will lead
to runtime issues for the packages that depending on ldconfig, like
systemd.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-core/glibc/glibc-package.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index 9dd5a0d..ede9e9b 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -1,6 +1,6 @@
 INHIBIT_SYSROOT_STRIP = "1"
 
-PACKAGES = "${PN}-dbg catchsegv sln nscd ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc ldconfig"
+PACKAGES = "${PN}-dbg catchsegv sln nscd ldconfig ldd tzcode glibc-thread-db ${PN}-pic libcidn libmemusage libnss-db libsegfault ${PN}-pcprofile libsotruss ${PN} ${PN}-utils glibc-extra-nss ${PN}-dev ${PN}-staticdev ${PN}-doc"
 
 # The ld.so in this glibc supports the GNU_HASH
 RPROVIDES_${PN} = "eglibc rtld(GNU_HASH)"
-- 
2.7.4


