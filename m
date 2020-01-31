Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC166028B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 13:33:28 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v25so5368063qto.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 05:33:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=kciFI/sjeDQopbbx7P3zwVnXWfpwyT/a9LzHc2BolKQ=;
	b=W5oeBqEd598AZhIqS5R/mBgiBGc9LUCtHGROzzU1QSABGf6yD3QlydomedEIR7eNIE
	AL9SFwI+qAeG7Lt6zFNaQKEnYnu8vzzcakqalRHDZ3cceWmUbGfjsltwTbaJ0mmCc3IS
	fou3dbEPhdlC9v/PUyTs/R4EhPAA6xKGC49+7anN+vbreiIOM6tZ9lnNlRUp8NbI10E5
	6P/it9p1KsljBL8PS6Stk5ey3xKc3UPoSBRg914M+P8BjKrvS8R8OVnryd1O4uuYDgPV
	+MPZIPou1tsttiVNAfETEcMX11fp7l98WEFYIfhEw4IksrhXx3IxKlTVmIJTYDCK9H4K
	K/RA==
X-Gm-Message-State: APjAAAXb7NG9chE9SCjw3cWzh0FlxffkecydRkEswFj5YXcnI1LXLYiQ
	DYUiuhRXVh6yG0FhXMhq6JLAB8HJIKw=
X-Google-Smtp-Source: APXvYqwFQqEi5LMO3wrwfxaOBNFJQkABQ18nzy8R1l9jnK0bqtHp5eQE6MEr+pA/fn2+fiBSMwrpMw==
X-Received: by 2002:ac8:5298:: with SMTP id s24mr10409639qtn.54.1580477608590; 
	Fri, 31 Jan 2020 05:33:28 -0800 (PST)
Received: from localhost ([177.194.196.4]) by smtp.gmail.com with ESMTPSA id
	w60sm4788306qte.39.2020.01.31.05.33.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 31 Jan 2020 05:33:27 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jan 2020 10:33:23 -0300
Message-Id: <20200131133324.3791406-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/2] libubootenv: Split binaries to a libubootenv-bin package
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
X-List-Received-Date: Fri, 31 Jan 2020 13:33:29 -0000
Content-Transfer-Encoding: 8bit

The fw_setenv and fw_printenv binaries should be on a specific package
as some systems may require just the library.

The upgrade path was kept using the RPROVIDES for the -bin package.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index 1020258cddc..f5b6059529c 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -16,11 +16,11 @@ SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
 
 S = "${WORKDIR}/git"
 
-inherit cmake
+inherit cmake lib_package
 
 EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=Release"
 
 PROVIDES += "u-boot-fw-utils"
-RPROVIDES_${PN} += "u-boot-fw-utils"
+RPROVIDES_${PN}-bin += "u-boot-fw-utils"
 
 BBCLASSEXTEND = "native"
-- 
2.25.0


