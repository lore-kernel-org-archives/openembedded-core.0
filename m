Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F110C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 16:55:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.12944.1742489731889705400
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 09:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eC1TaPrH;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-abbb12bea54so223681266b.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 09:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742489730; x=1743094530; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dTCr7O/NpU6ZGZ7T//GCEaDtRGpdvgALWHLHNgRVNQ=;
        b=eC1TaPrHfVUEhuAeEpiIQHVIO27e1mKenBGxG1f6MeHRqaQVvtUsEXrJqR5U3mXKel
         H/Ii/ecA13bv/67Bb8IUUeXpvWQV9uTYHMZPLFv2Adl/2MmnJmxY4xLxDp1fLV3xuUt0
         KqWvxHNnpzqScKKpYesdlHVzl6apwDG1CJ7zFSp1WMCZdUODkBqoswuqEL9ndy9skSjE
         XEmqNELdejP4UPR8Ieh0c1K+fYnFFnIVprSlUTUnNlgAU8wjIrikR6NkciP3UqYtJulD
         3Se4rhzCK8zRmCOwonCcX4kJdg9A7PqvxPC3872YdIBIgPov/QevytPOwyxb3u2MtBlD
         4dow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742489730; x=1743094530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8dTCr7O/NpU6ZGZ7T//GCEaDtRGpdvgALWHLHNgRVNQ=;
        b=ReHnfRjbh/lR2HqlwM/aqTCfjuybe4XZamuM9Fnb+MJYM4Z0zUuwDD+zosOSpBjG5/
         rp7wIchkZLZc/vRihpEAZPkZ0XA6iGJraT3eDtM0WgY0DCkurKEcmMy0ejnnTdD/OKB6
         abFWIR/3FPjuCnLd0kTrpEGuuqaz4duWyPr1NwAHiiTxPaFTmcPA9ei1PJ17NztzE6HM
         Fmym4FksI2QfUWoQswrHvWxI1x/KrGvWF6H2kXCgu01P6qD2Ma4wm/PzEw9/z1cym6BY
         YywZJi9kpD88bj8+4png+IuwF96upqvhtxa0VFIRkxqlPmYuf2FJmZdRIrCa4jczcK54
         0odQ==
X-Gm-Message-State: AOJu0Yzou4T0DuqylS+X9gOGl4m5/wZbDWHaHaB++eq6/oqz3O1Vz812
	HdU7a1mF2OqxbTqzR7XtWOYUxVjUTd6TotewDr9DKgVU+ytF0I4FCPjrxg==
X-Gm-Gg: ASbGncs982L3cor+JFYI/37+yoeNJgpIj+Q7QW4e56Pv+GekQcj6l0bUY7ys/w1Aplw
	0echr4l12sVOkqozddyHvU3Vv+2n7IPgf/7k0xiVEDiKVq8NgtZDdW67X0LnZt6aktzNCCzKcfW
	Cgu97vQJO5QoKY7X95QKx1K8zdsZja5eqkaANAyHBzqhYTH7yTgq61mjkz3w+o7SE4vXEd2uRZg
	YNyp9RTnwgg6H1KuAZfOl7rPRayp2JedHA1z06WxbA0sdd1CWApCS3JjKpqHSKR1mJtMvRrrKIk
	1cmoIDlRG2mYBjYiy6F8EuCZ3oL19EOukjJOqnJu3bvLW7ZMmdZrLwrI/uk3TKJv0UF4YLuCy8h
	EPw==
X-Google-Smtp-Source: AGHT+IHpC9feoFlsPkL+1MFR1m0xlLKtXqUp4uKseJD2uqSykDSyDvqbqu4DgFRyGKnckkxinDhJFA==
X-Received: by 2002:a17:907:ba0c:b0:ac3:bbc8:ecab with SMTP id a640c23a62f3a-ac3bbc91592mr951085566b.11.1742489730079;
        Thu, 20 Mar 2025 09:55:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac3ef8d39d6sm10608366b.41.2025.03.20.09.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 09:55:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jean-Pierre Geslin <jarsoper@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/2] cargo.bbclass: allow to avoid appending PACKAGECONFIG_CONFARGS
Date: Thu, 20 Mar 2025 17:55:17 +0100
Message-ID: <20250320165517.129442-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320165517.129442-1-martin.jansa@gmail.com>
References: <20250320165517.129442-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 16:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213418

From: Martin Jansa <martin.jansa@gmail.com>

* some recipes might be using PACKAGECONFIG_CONFARGS as:
  RUSTFLAGS:append = " ${PACKAGECONFIG_CONFARGS}"

  and then it's difficult to prevent the same args being used
  here for cargo call as well add intermedate variable
  CARGO_BUILD_FLAGS_PACKAGECONFIG
  which could be set to empty in the recipe to avoid that.

* alternatively we can just revert:
  https://git.openembedded.org/openembedded-core/commit/?id=16745b20452de60ae2474433cc1a2fb1ed9f6a64
  and let each recipe decide how it wants to use PACKAGECONFIG_CONFARGS

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 2dd28e95d3..63e550f5d0 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -43,12 +43,14 @@ CARGO_BUILD_FLAGS = "-v --frozen --target ${RUST_HOST_SYS} ${BUILD_MODE} --manif
 # change if CARGO_BUILD_FLAGS changes.
 BUILD_DIR = "${@['release', 'debug'][d.getVar('DEBUG_BUILD') == '1']}"
 CARGO_TARGET_SUBDIR = "${RUST_HOST_SYS}/${BUILD_DIR}"
+CARGO_BUILD_FLAGS_PACKAGECONFIG = ?= "${PACKAGECONFIG_CONFARGS}"
+CARGO_BUILD_FLAGS:append = " ${CARGO_BUILD_FLAGS_PACKAGECONFIG}"
 oe_cargo_build () {
 	export RUSTFLAGS="${RUSTFLAGS}"
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
-	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
+	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"

