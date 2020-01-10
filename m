Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 856797FFA7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:14 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c14so2467441wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EhnAB0rcvL3bFy7ejFyUDBQrWtMegkQE+z1meAZl2x4=;
	b=tz5fSWVwR6h0Yur8pgYOauBST6MPmPlJpqmPYPzal8nlCQILTI+C+sxz2URSybaX9O
	jbdAn2WcSfCwmuYymexjdQiY40pNkDjKD27z5tt/PlBlncAOTgPPDl0HvkgkMtxS8zHd
	XJGNghwXrMjyGQYv0qHux4sKEtyT24NAZxo62HISMjfYPYa2NXg2bkFPlQmeNkqbdTzv
	KUt3jp+qhxT5vSiqNUaCpC6t7CMnlNYXjJ3IjFyHOXWr9t3UZ+WtpxAxVcjJSPZCpeYL
	aR8ilAHwN3lrpk3OGy9nCPzwQx6nzCRwIJSlQ1D/p0Nu0itjjPy0/y3OQkEZi1D2kSnT
	N60g==
X-Gm-Message-State: APjAAAX05IVwhTM/q8FlelVpOHGcViTcjWAvEStE5srtSrYmX/HhhO8U
	cQ6/2oEKBRpZpJd1cuL8XfxzOruj
X-Google-Smtp-Source: APXvYqzfYHFwTKV5qkpDRAtkguZj36xCzRbsXKVCnICVRMu1OQOa8zViY9BwVrh2d33vP3h74/EIBw==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr4500357wro.310.1578675195290; 
	Fri, 10 Jan 2020 08:53:15 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:14 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:52 +0000
Message-Id: <20200110165302.27426-7-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20200110165302.27426-1-git@andred.net>
References: <20200110165302.27426-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 06/16] site: musl and glibc have glibc compatible getcwd()
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I.e. allocate memory for the pointer returned when the first
argument is NULL.

Signed-off-by: André Draszik <git@andred.net>
---
 meta/site/common-glibc | 1 +
 meta/site/common-musl  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/site/common-glibc b/meta/site/common-glibc
index baab03c588..e5085f518f 100644
--- a/meta/site/common-glibc
+++ b/meta/site/common-glibc
@@ -29,6 +29,7 @@ ac_cv_func_mmap_fixed_mapped=${ac_cv_func_mmap_fixed_mapped=yes}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_working_mkstemp=${gl_cv_func_working_mkstemp=yes}
 
 # glib
diff --git a/meta/site/common-musl b/meta/site/common-musl
index d8ff44327f..0c9d21e0b7 100644
--- a/meta/site/common-musl
+++ b/meta/site/common-musl
@@ -34,6 +34,7 @@ bash_cv_sys_siglist=${bash_cv_sys_siglist=no}
 
 # coreutils
 fu_cv_sys_stat_statfs2_bsize=${fu_cv_sys_stat_statfs2_bsize=yes}
+gl_cv_func_getcwd_null=${gl_cv_func_getcwd_null=yes}
 gl_cv_func_gettimeofday_clobber=${gl_cv_func_gettimeofday_clobber=no}
 gl_cv_func_tzset_clobber=${gl_cv_func_tzset_clobber=no}
 gl_cv_func_gettimeofday_posix_signature=${gl_cv_func_gettimeofday_posix_signature=yes}
-- 
2.23.0.rc1


