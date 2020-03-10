Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4D1D661B53
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 01:19:28 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id t14so4732296plr.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2020 18:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WxvUKOO0hu+Zt17Spk4R2EcSNfSDFzFXSGA3FbaeqwY=;
	b=Bo9MSUf1zn7c+gWLU6cekqNUJbLnfu1EHTJRqHX5kUTlw4SVIFNtaOFABcTdyeW7Sm
	nqiC2Q1wK/Tfqvm7OxINHm32Aw1/q68qPRoinREPUoPHjDjewe7M67TBARe1A1IDywCO
	L63ZnU4J7snx5Pw5RbGUv+iscZO92kFzoqylTo15PfE5se/LCmumQOuTnIekawPZiIh1
	F/dERW57631EVjphc66GfTyP4QmL8vC1pTchJsRhMCy/SPqBUW1cJZix1gN5RjF9clqW
	WTvtRm31PQrQmqjDSA+dG0ZnxTq/l1fIzHzubaMw/SmXrmGwnLSjVgwbe1UlQD6M121A
	Oubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WxvUKOO0hu+Zt17Spk4R2EcSNfSDFzFXSGA3FbaeqwY=;
	b=O5PjTbAhioqlr/AjsEP4tDkMdgl8+9Xx0sT4tLwfd3b6D3gLmWaMCYWKGO+Y9QoYjZ
	DaagPIsF1gMkmqOrsgPSkyIE5BZ6En5dclcxnhbixnXtTFYTTrfzUPRLsrRzPfwLPSzm
	EdY3U3GCZlVR/lo14b95v0fEG1SZUxI1HtKL14YgKXhSn22bgt3vyrsjx7xfvnwPKZvK
	vbZw1bwQNtDvZnCegia2tHE0+TiejMydGQtKM5hEL3ZiWFE2qMnu7iEIehocHvsziWzj
	7hRmvszWFXZyjCy9QtvJh+01nFIoKS5xj0LeGDm5o8hcZbgR0wTYMkLVSprGAafDmSHY
	ze4A==
X-Gm-Message-State: ANhLgQ212MT6eWasGa/UBLq5S7ThdV+YbEwDQGkIcLATePoqNOqzq3EL
	AWIC7fubg3Jn5WJbtbSfQI6N5ujedHE=
X-Google-Smtp-Source: ADFU+vsA1AAYTpmMVPd4w63a9Yl5LZrwV9U4KhI67JNU9fPDKWJBvKEQ7uVMcB2anyO/D4mq/vhDVQ==
X-Received: by 2002:a17:90b:1991:: with SMTP id
	mv17mr2165991pjb.148.1583803168817; 
	Mon, 09 Mar 2020 18:19:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	h132sm41827663pfe.118.2020.03.09.18.19.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Mar 2020 18:19:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 18:19:38 -0700
Message-Id: <20200310011938.3027897-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH V3] ruby: Use arm32 for coroutines on 32bit-arm
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
X-List-Received-Date: Tue, 10 Mar 2020 01:19:28 -0000
Content-Transfer-Encoding: 8bit

in 2.7 [2] ruby enabled ucontext for coroutines on arm32 but it does not
work for musl since it uses glibc specific functions e.g.
getcontext/swapcontext/swapcontext also see [1]

This patch reverts back to using arm32 implementation for coroutines on
arm

[1] https://bugs.ruby-lang.org/issues/16455#change-83442
[2] https://github.com/ruby/ruby/commit/6c6bf9ffcbfeb8be9d9c342e7604b74ec819e88a#diff-7fccec8474e2184cd2518046bf39d54cL10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change
v3: Include armeb as well

 meta/recipes-devtools/ruby/ruby_2.7.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/ruby/ruby_2.7.0.bb b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
index 268b4bebd9..44c76161d5 100644
--- a/meta/recipes-devtools/ruby/ruby_2.7.0.bb
+++ b/meta/recipes-devtools/ruby/ruby_2.7.0.bb
@@ -25,6 +25,9 @@ EXTRA_OECONF = "\
     --with-pkg-config=pkg-config \
 "
 
+EXTRA_OECONF_append_libc-musl_arm = " --with-coroutine=arm32"
+EXTRA_OECONF_append_libc-musl_armeb = " --with-coroutine=arm32"
+
 do_install() {
     oe_runmake 'DESTDIR=${D}' install
 }
-- 
2.25.1


