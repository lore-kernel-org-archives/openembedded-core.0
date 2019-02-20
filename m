Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
	[209.85.208.179])
	by mail.openembedded.org (Postfix) with ESMTP id AF42D7CA8B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 13:50:51 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id g80so20846487ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 05:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=emFgVm/Oo9EJxs/B8mV16r57e30rcu5ZRcclWfHB/CU=;
	b=n8jqwImQcCmbIN0LZsaD5eVKNnGjiWOb2woQVTVXhzvFc4zbWQoQ2yL44WyjFPyZlM
	rRsVYbezUlDUl1D93KQ9mVIzPOeHS9XX/mhJIIxUWLLU0+OoON/KSJPJtM0DyafnWKBw
	BjklZuvOSaElAeNa5RhitvHt+eRjj/DLvWBYn8vvMcQtuN/+arsxi0AWMw0mzmAAepDo
	mU4QFHOPpc4u8jKpJlsZN/jJT4CxWAXCacy1Wnbmrhz7aC4JhOcsfWb8JRImaoR5MBK6
	Fwxk8wtnf/k8YewEUP2N/KgP70A4SorjSR8UyseYo3iPoXrulGNQIl2F2xLwTbzKqmFH
	/tWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=emFgVm/Oo9EJxs/B8mV16r57e30rcu5ZRcclWfHB/CU=;
	b=lhIWFHZ9+YzDcLLEiWPE2Ym0sVGH20lfA7E9iF+oJuIDOuNfGsx71Q46rVA220s7s9
	AceSY9orfxT1JrTM1ze97O96p2FDghZlxfoqx3AyO7nxPhW5RhJakssf/1HKjIEKxOF9
	jsmvH+OPdZjwtHhihJAi6sNKeBIv2iNxw3FZBL2/RIDCx4OP3GN7mIwA5ygarmx7U/zv
	6Xb5b/KUs21GWUulZvMJqhAIlqeh5Wu/TV+WBN7wfjmTYBq3FXtVoyPyz2o8bhwp4EG/
	zxTJASy2+BxFB60Hb0B0fKI1d8eX0XDgOS4lzpcU9UsBzE8H7jP0+Q7OEDssaUEbbird
	eH7w==
X-Gm-Message-State: AHQUAubRuF4iz2Qb3/2wShzn0qKL9cltIrATnAjmW8RWNaQ7jFb6baYr
	HFxgtYJSGgrUSmz6yoAaWgiBrUMs
X-Google-Smtp-Source: AHgI3IZlHk8iGvcId6kyHA4HEh1TE9dVCImlE+vluXmT8xe4NW9s3DNIKkTF1sLTHP95IuQhstSUIA==
X-Received: by 2002:a2e:2d4:: with SMTP id
	y81-v6mr20732558lje.62.1550670651898; 
	Wed, 20 Feb 2019 05:50:51 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	85-v6sm5533870lja.16.2019.02.20.05.50.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 05:50:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 14:50:41 +0100
Message-Id: <20190220135043.25837-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190220135043.25837-1-alex.kanavin@gmail.com>
References: <20190220135043.25837-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/4] llvm: switch to the official git repository
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
X-List-Received-Date: Wed, 20 Feb 2019 13:50:52 -0000

Until now an unoffcial mirror was used, which may or may not
be maintained in the longer run, as the need for it has gone.

Also, the official mirror has version tags which allows us
to track upstream development in an automated manner.

${S} has changed as upstream decided to use a monorepo for all
of the llvm-related projects.

Further info:
https://www.phoronix.com/scan.php?page=news_item&px=LLVM-GitHub-Mono-Repo
https://llvm.org/docs/GettingStarted.html#checkout-llvm-from-git

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index eca78af09e4..c68512cc63f 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -19,20 +19,24 @@ PROVIDES += "llvm${PV}"
 LLVM_RELEASE = "${PV}"
 LLVM_DIR = "llvm${LLVM_RELEASE}"
 
-SRCREV = "e5cc6808dc0d5b773479bf36c51d59d0d3174733"
-BRANCH = "release_${MAJOR_VERSION}${MINOR_VERSION}"
+# SRCREV is set to the revision of 8.0.0-rc2 tag, while latest release
+# tag is 7.0.1 as of Feb 18 2019, hence the need for UPSTREAM_CHECK_UNKNOWN
+# Remove the UPSTREAM_VERSION_UNKNOWN line once 8.0.0 final is tagged
+UPSTREAM_VERSION_UNKNOWN = "1"
+SRCREV = "98ebe7460199b9cd79eb562b5e8705ad28f5513f"
+
+BRANCH = "release/${MAJOR_VERSION}.x"
 MAJOR_VERSION = "8"
 MINOR_VERSION = "0"
 PATCH_VERSION = "0"
 SOLIBVER = "1"
 PV = "${MAJOR_VERSION}.${MINOR_VERSION}"
-SRC_URI = "git://github.com/llvm-mirror/llvm.git;branch=${BRANCH} \
+SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0001-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch \
            file://0002-llvm-allow-env-override-of-exe-path.patch \
           "
-UPSTREAM_CHECK_COMMITS = "1"
 
-S = "${WORKDIR}/git"
+S = "${WORKDIR}/git/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
 
-- 
2.17.1


