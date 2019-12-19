Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id A584F7FE46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 13:23:33 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q10so5947594wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Kf0qHtk6DfswbeTCBFNnqwCuR7kotOFGvAZdBzRbwWU=;
	b=JXpewIyaFl6v1+VmbxFrsDH7bcZ/tM67gKI/S7UDAyNNSYQKE1xho4Al+OsTk26cm6
	j1tVVamSZWfLOLEZF5+FDwUeD1hh8mWlsrmTbuIifLdnWP7e++jcQ+f7AGQodJveBwsS
	tP0f4W3XBrXLP7AeamvvIbXod4dDtArAStaLfiCKCw6AjXkRpTs210UC2KA6tzpNtVBx
	8e0Nc06palvSgAHU2QhiUm+6EPNdn5hQ4FZe8mkIBuridOKCSlEw51gPwiQhOrdETN+2
	fT2Fbfkj3NptgopQaoFJpe+RTYGlRz5FO1amjN/3c/8RXEYuq8BK5FhL7fQsL8zyVY17
	d0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Kf0qHtk6DfswbeTCBFNnqwCuR7kotOFGvAZdBzRbwWU=;
	b=t8IJX/e31mgmNTjqMjzv5GyuikLeFFnOaBvF9FEW/JI6/GzlaGUfhgb/H/ueT47x9P
	cAY9YeIY+p8ifJRT5urFCwKYU8FGAvtLuVhcHAv4D+GRcwZ5kzXPszRrKVf9oC7nkEQE
	ABxIBTJnEJGClqgvagM28DmbUC3rTQg3uVVu+FrDRorBXFo+CoOp0dWE3FqpwBW2c8df
	jl3PiCWCUdd/Ex5jySHJzF1hcvsyg5+eEDVHX/Zx0Dr+pKxbequnxwlLoTaPZVvgjZVb
	EsOGTH5H1jlYzsv0Mz+hAd6I3fD5V+aF+dxiuFc4iwdeYPTO0QOsSQo0wZaiWBnaqmc/
	zClA==
X-Gm-Message-State: APjAAAVuDU2uW7WuX1+j9tVNoAUl2sRZWmXjrGS95nFvppbr+khbujyH
	V9nZoEeNg/vZbeYnZoynCNO8oIFrZiM=
X-Google-Smtp-Source: APXvYqxpydoW+HBJI77qs4EPUwi2XADSwtxbktBnOLmd+3BJazzZI6HpAM6b95Mlc/TDSQLiK2cBvA==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr9232402wrv.197.1576761814030; 
	Thu, 19 Dec 2019 05:23:34 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f17sm6182584wmc.8.2019.12.19.05.23.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 05:23:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 14:23:00 +0100
Message-Id: <20191219132301.80034-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191219132301.80034-1-alex.kanavin@gmail.com>
References: <20191219132301.80034-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/16] llvm: fix upstream version check
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
X-List-Received-Date: Thu, 19 Dec 2019 13:23:34 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index cb2e1164cfb..3b0a1b3b276 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -35,6 +35,8 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH} \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
           "
 
+UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
+
 S = "${WORKDIR}/git/llvm"
 
 LLVM_INSTALL_DIR = "${WORKDIR}/llvm-install"
-- 
2.17.1


