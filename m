Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B92F7E81C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 10:47:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c2so13404887wrm.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=x0cUQCLitwuvBIyOR+UMa+cvXLYcpI2IaiUc6GOZn7Y=;
	b=iI/fOqcNvlHXHn/Lx9/y7JGOMLAKj5x4Kue7zWfIzSxSTOORd5p1DWWvX+vbiy6w8d
	u8SLGUGXoNuOby4B62RpbTPoBfiUpk0KPiy2F/Y0rh9XUispvbbvWqVByyonZs9ds0Bm
	0p40J9lJIBzOm6LEQMJXRu4AiuIat5z65Q0M0ogTeVaCdST+sR3yC+oeyGEMIhZpbzwN
	YUAhTvfBNHwaHi4xgaH/syaD9HdFhHeQcA3ybbykpQGU92IICpCuM3y2EVzJlB8Vy+9U
	e5sRcb3sYV5Cx0cz+rSrK7glcg3Y7ucKCi66wuCJSjDxDKhMq0eCSQOigA9XqIuElNXd
	bfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=x0cUQCLitwuvBIyOR+UMa+cvXLYcpI2IaiUc6GOZn7Y=;
	b=WjygE+kzivT1yW7Qz+eb2CRDMROiJ+FdXWrv89Eo4g4k3yxG3EZzVVvUmJUHn/P9hw
	Ea/+KQuFlrW+fbmscxMM5TXllgKRs0UIC3TuqOF8zjzJ1apdBCaMx+b+e4s+8Cx7rYOW
	ZVBIFhMIyGAZ11jajNbSb4ifHXgCTWgGKFRp3NbkJRyHuKRdGWyPcjteHhiyLUGskL9/
	RRqlmhv4yLgmWiFePAHW9aE+a8EJbppf3oxaHDWdimkFEfeNskb9jGnmlJQiHHke/Iqe
	R+q6UHdw8MGaCM2G1COamqUCHtxblPePU3y6U7aDHIBSVwD01T0c9tMdAIu8dzKIav4z
	gHpw==
X-Gm-Message-State: APjAAAU76H36cJ6BhNYhmhzn8ergrOaViNZgn9tflSFUfJ0BJ9aZUy/3
	Xpa98OTTzuzheVvvLf8tfK1pU82N500=
X-Google-Smtp-Source: APXvYqwMqv9ABKuZ3NLa6v70EdxPTksCCSbfU5hEYNM87B5TCij4bSBYmyFOXVyMplbVAHbpaBfnKQ==
X-Received: by 2002:a5d:66ce:: with SMTP id k14mr15450407wrw.308.1560854857997;
	Tue, 18 Jun 2019 03:47:37 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j32sm3584985wrj.43.2019.06.18.03.47.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 03:47:37 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Jun 2019 11:47:35 +0100
Message-Id: <20190618104735.25849-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] binconfig: don't try to fix up .la files
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
X-List-Received-Date: Tue, 18 Jun 2019 10:47:37 -0000

If we're going to clean buildpaths from installed .la files then we should do it
globally, not in a class that only six recipes in oe-core use.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/binconfig.bbclass | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
index 133b9537cf0..9112ed46085 100644
--- a/meta/classes/binconfig.bbclass
+++ b/meta/classes/binconfig.bbclass
@@ -40,15 +40,6 @@ binconfig_package_preprocess () {
 		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
                     $config
 	done
-	for lafile in `find ${PKGD} -type f -name "*.la"` ; do
-		sed -i \
-		    -e 's:${STAGING_BASELIBDIR}:${base_libdir}:g;' \
-		    -e 's:${STAGING_LIBDIR}:${libdir}:g;' \
-		    -e 's:${STAGING_INCDIR}:${includedir}:g;' \
-		    -e 's:${STAGING_DATADIR}:${datadir}:' \
-		    -e 's:${STAGING_DIR_HOST}${prefix}:${prefix}:' \
-		    $lafile
-	done	    
 }
 
 SYSROOT_PREPROCESS_FUNCS += "binconfig_sysroot_preprocess"
-- 
2.11.0


