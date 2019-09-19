Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 505148FF96
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 12:30:10 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s17so73701plp.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 05:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=Pg226uGbMg0LwhIemR8oP94N88qD6WnW0E8nyzQOtck=;
	b=OTKBmSv6sxKBz6Ess2BSw83Emq7/unBFZX1shRUWu+RPWYfqErkSs3yiQ1cGlsqQRq
	bV4KrKAmpmDdtKDlgHBzJoZOC2LyMsgttuhxyBiOBxlEQw92Ed7ZnXfzCpX4UNKobC6J
	SlqPzUjpif3p0xH0BbDFfym0Ly2FBsVWJtyB8RpKdksHQxwpVye4etX7puoJEy+FBIbs
	8vBOMz63GbWsY4YueEImmICmGUC8fpbv3s8FOgE5k96qjOBkWluY+8+AmZ+UjfUeXpct
	OVfTNaQsoSrQgQ4OVbWbDGD3R7ak7lOpSGC2tVqOZK6nf/67cUxpWdmIEMmshMFeMmhF
	wAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=Pg226uGbMg0LwhIemR8oP94N88qD6WnW0E8nyzQOtck=;
	b=FcShWwh4sBijmaTrSdg2u2iSK8fOaBCtWEBGa7PGFbAFlMQUX5XlIzjGp201lhO497
	8K/Plo1bNhtbBPPrAzqSAGwHYAj60Ym5Hg4O/3NKvckRRPvzYWrQMsPTNKzpY6MJ1O+Q
	KS7mRFafqIYtSIctq64uqaGIpJDMkjPy6Lzi6NoFvsSR8eUUvXrqlLVpUlPtXKpYD6nU
	w44C+02gZK17EYRofBxRPwd6H7RszZBARG0gWTy4HqB5wg/h01pATENsUBrPJJokDGbb
	vb5MIkiw3NPuFmwPQkE9iuRIMGCcN6oLmlIRj3AfBp6VGDd2vOc9aRSxvwTkWFnFAMU+
	fS/A==
X-Gm-Message-State: APjAAAXNj/idvX2oCfzrP0hj4AWazjrOdkr3udKoVxDV5RicmYWyFgcR
	2UVAdwMzswfu/hYWBqLJOqxoEzQ/c1yflw==
X-Google-Smtp-Source: APXvYqw8Cx7cLM9NdBlwQvHg3SKwCvZw2H/SEGoZfqy9AdFKT9iTfmtEEEeVyo5dBXP/HCgSGFsogg==
X-Received: by 2002:a17:902:8d8e:: with SMTP id
	v14mr9623588plo.33.1568896210650; 
	Thu, 19 Sep 2019 05:30:10 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.88.155])
	by smtp.gmail.com with UTF8SMTPSA id
	y17sm14044382pfo.171.2019.09.19.05.30.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Sep 2019 05:30:09 -0700 (PDT)
Date: Thu, 19 Sep 2019 12:30:01 +0000
Message-Id: <20190919123001.25664-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] meson.bbclass: Handle microblaze* mapping to cpu family
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
X-List-Received-Date: Thu, 19 Sep 2019 12:30:10 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 48ca112d80..efa6234078 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -55,6 +55,8 @@ def meson_cpu_family(var, d):
         return 'mips64'
     elif re.match(r"i[3-6]86", arch):
         return "x86"
+    elif arch == "microblazeel" or arch == "microblazeeb":
+        return "microblaze"
     else:
         return arch
 
---
2.23.0

