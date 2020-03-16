Return-Path: <armccurdy@gmail.com>
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id B7E0060C68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 18:49:06 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id mj6so8669771pjb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2020 11:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=upap8ryMU4iZNYgrHnx0t6JL64j2wyB7C95RyImNp6A=;
	b=YPt9lL6VnQp3Bd+LJDeFqdbrIz11h7YmJKwSHhQyLpy4DzAuhYh7orboeKKHj2aA5V
	L3Jduq8sL7+dTHeO6lmSmddFR2T2Lh7JD76mxIw4cUN3Ocr/b9sK3/4ne1tuGhAgcncE
	1J4XvhSy5veYoy+cYyXVWOJGHHUtD1sfvmJ0Pvui86PJA1eznyHhIQWHXzOwvjuQahTW
	R/2gj56OW0AZHCC1oY3eZ7zNAmzV7s/qUmAlMF9MiEJMC/xudO9Q2DN1wTEKrkBZMuRp
	FhfNHaQfD0CAsaxThkYg8Dag/sgP7wtoYbY01gvnIR1pnkRAy1OX3lz9Dbr+T1q41RWB
	YsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=upap8ryMU4iZNYgrHnx0t6JL64j2wyB7C95RyImNp6A=;
	b=PDAi710DzTM/vl3YEnsHrjeb8O8N8T7d6ipBq7PPUtnOBVXMq8A4/UqCpH4lXPx5sR
	3+tk5GObOHU79J6gey8Vw9b6VO6/hyxCWQN4euk1CNHGKbzceitn4e9mgusuZeMlEol4
	lqEMAQM5c9pmuxtYXwUpeDQL+Nl9iGho1VLhaN0P2Xo/UoEt0CrYH1mTjl+k+cySZM0u
	L9rAkQUyBgKNeG5fOsd9ckBLKmOTJJNJBLd52JSko++Ppvhxr4cKqAQ5MHYnQcvPS+S7
	OStZ0PSm4PtNMFThEZz4lIHuD7A0YlLWvFcd+wr89fSnD5FO2O4mYJKU7Z4RYQDPiUBV
	5j/A==
X-Gm-Message-State: ANhLgQ0wrRGKGJHON2rvLPGeSZo3DCRNz8j8rTUTTDXON80t9kAyVrS8
	URnsBs5WFIT+5VMBmjrK+nwZW8dv
X-Google-Smtp-Source: ADFU+vsxGQs84R/u1OCJB/4ejERqTb9GOnoltvvw9TBS3lW/TL4ntBgAp78d/RHBo+mJpcm6B1ZV2A==
X-Received: by 2002:a17:90a:9a90:: with SMTP id
	e16mr939757pjp.164.1584384547301; 
	Mon, 16 Mar 2020 11:49:07 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	c201sm632455pfc.73.2020.03.16.11.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Mar 2020 11:49:06 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2020 11:48:55 -0700
Message-Id: <20200316184859.11635-1-armccurdy@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 1/5] gcc-runtime: apply ARM specific workaround to big-endian ARM too
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
X-List-Received-Date: Mon, 16 Mar 2020 18:49:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index b2c5d43bd4..771f344ac0 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -20,6 +20,7 @@ EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 
 # Disable ifuncs for libatomic on arm conflicts -march/-mcpu
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
+EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
 
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF_libc-newlib = ""
-- 
2.24.0


