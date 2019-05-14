Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id CBC9C7DEEC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:10 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d3so7583814plj.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1FQnNnM1NtgN8Wi/Oim4NXCX98rfFIdZMbZh1z4Ywl0=;
	b=JGLrenu4UMFKReMWYIHoKPVTnEkjp2UTi4MvNQGrjmqeimIXA1sHiYcIWJmfBTagO/
	zVuwyXujGVCsxQ8aIk6GgxRzGiIXANVJZXc7Xg06po2TXr8S4nUYeePzMx2THtBWFTum
	bN5VYHH8ZF1XC5bn1S98cCaAQ44pAZPlF9yKxCWjyBu9u73TamYFd9t4RGaq1Jl2dQ92
	WmI5buKSe1Jer7WTjv9NvrCHZ0BLxgTk31zB6G8lW5tjuOuj8Wc2Y0zy/9UIiCN29avx
	eCk846+XOqwfcLMKmUw5Nzsh/1n6M6GWcWzZ2wmHCpWp8+/rv6KG82H9rFGCvKFi4kTG
	qARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1FQnNnM1NtgN8Wi/Oim4NXCX98rfFIdZMbZh1z4Ywl0=;
	b=CBqKZ2b3tCa2o796vDNg+l9FW/hVQvEfZUt+qUrH8K2KyhUVuiR5ZAtSZ2tqCjyyAp
	NTh1ZSSCK0YQ9tAxczpG9O6dit+9RPzYveHNA6Z0wivjSDu599C7I+nVrJjEnCu3rkq1
	Kxm8dDlptfPLgqpBRzZlNXZ8T1BwgzDoJRw5CEbg4A3683/NzB/JXeRDty3dhO269Tnq
	4abbkM7ZGjutF13CnksiqQLGABzxvHsePqaZ7gleNXp7nRBbt3YUVZfuhx0mb1LMI7Lj
	D66xUfsWb1jqR0SXQHzF5E/zkZ7UjEZbidaXZb4OdYD6V0bQmIkxdWcQ10nAL6TexlOK
	7gXA==
X-Gm-Message-State: APjAAAXgfg+QPoZPjSbzteEVr81wNA/pFdXbAl4nXss3ealENiQCHcoj
	y0LqbgClqBxhy+QBsAA/LXI8jRdF
X-Google-Smtp-Source: APXvYqyqG9Sl4IPnvbKUlsjAkDvy1VrNlRm+onSMWd4BBpESvVX1dk7cp9+EPhLyaun54hKOVc+qcQ==
X-Received: by 2002:a17:902:e287:: with SMTP id
	cf7mr35749785plb.217.1557809651879; 
	Mon, 13 May 2019 21:54:11 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:44 -0700
Message-Id: <ca38b2f88f640579703486645b0c4d9ecef78e47.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 02/23] bitbake.conf: Account for older versions of bitbake
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
X-List-Received-Date: Tue, 14 May 2019 04:54:11 -0000

From: Joshua Watt <jpewhacker@gmail.com>

Older versions of bitbake (prior to 1.42) don't expose the BB_UNIHASH
variable which is being used by sstate. For compatibility with these
older versions of bitbake, set BB_UNIHASH to BB_TASKHASH (which is the
value it should be for non-hash equivalent aware signature generators).
if bitbake hasn't already set it.

[YOCTO #13314]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/bitbake.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 7f8b043..b4e8990 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -898,3 +898,9 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
 
 MLPREFIX ??= ""
 MULTILIB_VARIANTS ??= ""
+
+# Older versions of bitbake (< 1.42) don't set BB_UNIHASH. For compatibility with these
+# versions, set BB_UNIHASH equivalent to BB_TASKHASH if unspecified, which is
+# what it would be anyway if the signature generator (e.g. OEEquivHash) doesn't
+# support unihashes.
+BB_UNIHASH ?= "${BB_TASKHASH}"
-- 
2.7.4


