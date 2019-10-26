Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 84EEA7FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 6so5735420wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T/js4J/ftcnaxDRh8SqCgYB6+x/EqwUr8Fikqs9GQmw=;
	b=jeA3S6wBBJzm86zQRneKZ6NxYgMNLiqXeTg5TbtHVgTipzfbnsqDHvqodBcxA+EYi7
	iEBBAzpKbomnMj6iaDWEb2faomfn86wiVpKyZ4OypIi6vDIGH2can5YHp2V1U28HC2Sg
	KyfVvmmtk3IY2wDi4W/a9Suj5Uk2mqhJyVKkUWN9tGWEkedVmBQth2i6Occ2pQPK5tQH
	/7mdjCL885kUDfV865cYnm/2LPhNxWEQX6TeOthBR916FrS2dL16D+KHVTFzD45LZ+DU
	aMPyJLHfSbX82+XKDupDdepyvV6/LQwBtyPBV6YiSwOUXQLg4nqlk5J6jovCmXGjislW
	ZKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T/js4J/ftcnaxDRh8SqCgYB6+x/EqwUr8Fikqs9GQmw=;
	b=uln1bwovFDMhg/xkxcOCNhyC51Yg521uZ/7nfc6B+aNphA8/Rk5v5TmJ/I8c00c/x/
	J9jcdbP62JffALsqPUtmcdCVLsRmzjF+OBYcCqjzx6JIIntF6LcOWrGh4mBvj6KlJOft
	uChjzGMqUsgHqILJ2PyEnocq6scExW+iEpW5Ygvi6gAHuY+51Z42sNOOI2i7UmwrJGBK
	JPkCmzDIPbEHQLugCbwGRxqcAbiu5sulsPqnzvf1OLmxJpKQOgwkxz62n/MkPH6GbTTB
	E16byMZ1KTE2JrgmnjNzqm6wjU5A+QuwQdqHiY10FO0Yhb9abVC8HMvdAjqVK4fxgfD2
	FCAw==
X-Gm-Message-State: APjAAAV38l+ZZijXKBTFkOeTtGJtw/+OiGpriMqjdSkxJuf1Z7wCCsCT
	IpWP71BJHQhZq187Zb5TPjHVylruwLE=
X-Google-Smtp-Source: APXvYqw6yz1zTVf8WrZGJGQGRyH5ZymLH9u1tV+a/HlpwFrCIihTTakJJOKK511J+COk/pZaM0jdeA==
X-Received: by 2002:a7b:c74a:: with SMTP id w10mr6220056wmk.173.1572072615916; 
	Fri, 25 Oct 2019 23:50:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:15 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:46 -0700
Message-Id: <cbbbee1dce84d6ff62fb72282088f839cb642857.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 14/28] file: explicitly disable seccomp
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:16 -0000

From: Ross Burton <ross.burton@intel.com>

file will automatically enable seccomp if the seccomp headers are available, but
the build will fail on Opensuse Tumbleweed because the include paths are wrong.

Enabling seccomp is a bad idea because it interacts badly with pseudo (causing
build failures), so explicitly and globally disable seccomp.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a752faa152df031df5acaa40491299ac115109a4)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/file/file_5.37.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/file/file_5.37.bb b/meta/recipes-devtools/file/file_5.37.bb
index 803aa9a..6547d12 100644
--- a/meta/recipes-devtools/file/file_5.37.bb
+++ b/meta/recipes-devtools/file/file_5.37.bb
@@ -21,6 +21,8 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
 
+EXTRA_OECONF += "--disable-libseccomp"
+
 ALTERNATIVE_${PN} = "file"
 ALTERNATIVE_LINK_NAME[file] = "${bindir}/file"
 
-- 
2.7.4


