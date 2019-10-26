Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86D557FBF9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 06:50:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v9so4671050wrq.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 23:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=X2KzklYPWyEl2fXFKWTNY5OwZRpqNDU8jnNLp49Pzn4=;
	b=FWllGLalyJEeHxWCRLWHie8FMk8wrRUlf95ZgyY6TsOwzg6Z0nb9IiULZN/BkVjek8
	07e4lTl8P1ZDhLac+5YmVjxJnf7E6iwzClN5uh1LQWcukuEkKVOTH8GRd+GshdLSj/K+
	VZ1YKtZuFKLb/Uhv+/DtvHbmVRzeOTOCK5DMznapJdhU/x12bASlNDaEuYIZL1AU6NkZ
	kOse33FFa1YgkkXh2D4hvG3abCOPdAa0M2vO//d00KZy05Y05U3W6P0l/0YV2xsl7vA0
	PMpud2lMPOKNlRtCird1aEm/hy6xbYsoRTQiB8FgTpmkFWlAlDvLzKLahIHheZz1J2Tk
	RTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=X2KzklYPWyEl2fXFKWTNY5OwZRpqNDU8jnNLp49Pzn4=;
	b=a9NWJgyNWviDtQlbLwAJeMYk8gxWy61txv/RnydFh4XLIPZt/yps8B5IVRJ+rmtGVr
	oY6XWMG4qnB1JdqwubMKAgDAGiBquyZ5HHckMm6nW4inndabfSL6eBDsC4bRgjIyN/C0
	AfntLwfNfyrPiJpYmXdSInJBrmlZOW47cm5KgEnELLjQ6Ntodq/hwpBUEROZkSfmKNef
	Kc2N6EDAh7ZxdfLKzNpUlUHD6wMYVJ4jWiYTI/D4C2QZVOYH4g9c4D4PMLLPyopkbWTC
	dbKdsXF/u+k0uskrSTqTijyQ4IBHvkbvPJITZOypsNpOym14wfAobyOUJlpBMioAUqyb
	kjNw==
X-Gm-Message-State: APjAAAU8XMACLqmV7oWysiSWFksz0/0UNffHJFPUIfpEV/URg0zQ76v3
	VVebTRQwqGT6lhaJ/TF99VJVWxCLMcw=
X-Google-Smtp-Source: APXvYqzVFKXStaZxyBM1pSllnC/6uiNB/cs0r+EWRNbivaufHyJkfPQ1BM4mWw4R6bpO9D1dqJwwmQ==
X-Received: by 2002:a5d:4aca:: with SMTP id y10mr6017296wrs.292.1572072615063; 
	Fri, 25 Oct 2019 23:50:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.controleur.wifipass.org ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id v6sm4807911wru.72.2019.10.25.23.50.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Oct 2019 23:50:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Oct 2019 23:49:45 -0700
Message-Id: <03796926046e5b5b57349d66de6bb009a34d2cb2.1572072422.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1572072421.git.akuster808@gmail.com>
References: <cover.1572072421.git.akuster808@gmail.com>
Subject: [zeus 13/28] wic/rawcopy: Support files in sub-directories
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
X-List-Received-Date: Sat, 26 Oct 2019 06:50:15 -0000

From: Eugene Smirnov <eu.smirnoff@gmail.com>

If the source file is located in a subdirectory of DEPLOY_DIR
rawcopy will currently fail in sparse_copy function on
open(dst_fname, 'wb'), as the parent directory for destination
file does not exist.

This patch helps to avoid that by recursively creating
parent directories.

Signed-off-by: Eugene Smirnov <evgenii.smirnov@here.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 073c435644091c2801e45c6d02afa917de575082)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index df86d67..82970ce 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -59,6 +59,9 @@ class RawCopyPlugin(SourcePlugin):
         src = os.path.join(kernel_dir, source_params['file'])
         dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
 
+        if not os.path.exists(os.path.dirname(dst)):
+            os.makedirs(os.path.dirname(dst))
+
         if 'skip' in source_params:
             sparse_copy(src, dst, skip=int(source_params['skip']))
         else:
-- 
2.7.4


