Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id C04FE78CEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 23:28:20 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x17-v6so2223525pfh.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A11H0U3D4k3qw8kKxlybV61XY6OpgC9KcnzfyRDeGrg=;
	b=QD3hB1FTTW4RvBtdtITAouxqo0bg5Gxp7+V5wZHm9LcET9WAfuplCJ3GN/lkHxohb6
	61efqwiLXeNW21BaEPAHSKZEmfMM10xQ9zov+2S7hEjsJ4be4s6e/oPyzNcGITCHMtgH
	mrfIjeaDOYlVp0dMHeDq0K8lel/oIoVa2unzm3BrwmnGC50dVSVmcf3DVa4FND26OKZu
	EZJLPR7jzqUsLeJ/zMoucD6qSfOm1AoNOd4egIAEpenKdTwKgN0kEYcs5xUM/w0rDwo1
	71exqtqBMTdeUxO+A60mezSyT3lgPKNGyJZi8TCiETy8CyyhW0F4JhURa7M/kzMnk1sx
	Wc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A11H0U3D4k3qw8kKxlybV61XY6OpgC9KcnzfyRDeGrg=;
	b=a6qZr81/keutiBVCxl2gK/CbrUEoKykCHCnEB0bzDZiAAMcf+U61N+ktBkAfM49Kfv
	D8WTebAqA6dD2GGGR+EBjib6wsaxeaN4EqRskvBVU0GCxE0fPgLpp95cknfslwcnlyX0
	S3YilK73AN48xa97HYIsRDsxB07KxEZgJBwUUeK0bQCD9jF59AxlBJwfEFqaW0EfZt5F
	KgH8tDx0A7tyX5XQqMDwd2dI58kVY4pceyNS4RHQB6BivX4dHqihk4ovz06tiDvNCx6V
	7ZeJ7py7Ktri+vGC8lCRN10+GTRcR7CL6pk2jUqGqYqIyl+XLECsrZi7M776Z5vVyioR
	8ZvA==
X-Gm-Message-State: AOUpUlFroRJYX0JUFKAlybzjX1nYGRLVd3dRQE0rEls3u0c3eY+aU5w2
	SLOYxBqbpFdxK1nGpEvC3dRy42W/
X-Google-Smtp-Source: AAOMgpe+ZzhxSeiVWzMrXCKz3tKU/rJjDb5NF74wZGr1tcy4B3/FhFrT9mBS7w984MolwHVNVihHqw==
X-Received: by 2002:a62:42d7:: with SMTP id
	h84-v6mr8535515pfd.146.1532734101725; 
	Fri, 27 Jul 2018 16:28:21 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	x4-v6sm7086923pfm.119.2018.07.27.16.28.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 16:28:21 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:27:58 -0700
Message-Id: <1532734081-24485-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
References: <1532734081-24485-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/5] openssl_1.0: drop obsolete exporting of AS, EX_LIBS and DIRS
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
X-List-Received-Date: Fri, 27 Jul 2018 23:28:20 -0000

Previously (when EXTRA_OEMAKE contained -e) exporting these variables
over-rode default values in the top-level openssl Makefile. However,
since -e was removed from EXTRA_OEMAKE as part of:

  http://git.openembedded.org/openembedded-core/commit/?id=537a404cfbb811fcb526cdb5f2e059257de6ef13

exporting these variables does nothing. The comment from that commit
that only AR is affected by removing -e wasn't correct, but the
effects of letting the openssl Makefile also control AS, EX_LIBS and
DIRS seem to be either benign or beneficial.

Since without -e make ignores DIRS from the environment and always
runs for all subdirs (including "test"), adding "test" to DIRS and
calling "make depend" again from do_compile_ptest() can be dropped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index ee1c1f7..c2d9264 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -72,9 +72,6 @@ PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryp
 # vulnerability
 EXTRA_OECONF = "no-ssl3"
 
-export DIRS = "crypto ssl apps engines"
-export AS = "${CC} -c"
-export EX_LIBS = "-lgcc -ldl"
 export OE_LDFLAGS = "${LDFLAGS}"
 
 # openssl fails with ccache: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12810
@@ -222,9 +219,6 @@ do_compile_class-target () {
 }
 
 do_compile_ptest () {
-	# build dependencies for test directory too
-	export DIRS="$DIRS test"
-	oe_runmake depend
 	oe_runmake buildtest
 }
 
-- 
1.9.1


