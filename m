Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9E40F71633
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 01:04:24 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id xk3so144790916obc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 17:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kx0AtxWrHE7eXoF/4J8mYX3ZtdDBurZNvIqy1PYwQxM=;
	b=VmPgnyuzQvx/jiDtXmaJxnkfS1uosF3FhmCVJMzZuGqf5/GwdZAnEPNDqpY8Zhi6o4
	0GNfc71pjh2TyxX1nhKJS9x6y6Mx6O3q5Y8UPEgd9/wAYeunEsX9QTMUBVGYhuz4RraS
	eGCZ3mKRVPvchUBXgyT9B9q8Ms/CX/1FKJhYkJw7C2QbXlcXJCnSZiDpUMUFvaN8IOPq
	NU6+5wIsv/urYMs0QYJN6RbE6i1SK6cKwKtEkhtVTt0dF8ax9mjp16tiEPP4KZKXzotX
	Ri5B8BdnDjMypbtS++9m9TwZrKrnwgRjevDUfHMrTHGPjtmi4VlkMBAD/HcWSDNM1uHg
	HtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kx0AtxWrHE7eXoF/4J8mYX3ZtdDBurZNvIqy1PYwQxM=;
	b=VufL5kyL4jCzhR4NpYJTt669SC1ZCsaJyfU1pVb3n3x4+ipxRI9lvKZdCZ8K7pQVeq
	Yr0dcdukJsyXUzxyuHnXr3XAdeRPY3MnwIyvK68rPsUwLNEyHl92Kk/NFe47zCovR4qE
	8HrMH3ANw0OpEpcTKzt8olrIEBvaHH1njt4A2pkdfSa62MYLnRmKSimfxvx6AZz4uKEH
	VjgzTeMnFI0ix+NQ/94fKcBxfmmTVxx/5mCF6cWEzVoOWkeDoeUVv7EVb9/sBDwudDX3
	6+crL6t0vc2GB7gC73A5vzw4x1/vsbaLRt1NJdsjKAteccHAKOF+WM3J8EGwNYtW705I
	jLyw==
X-Gm-Message-State: AG10YOQMU6QC770FlanNHQJhG0ncTvfVRhXEP9JCR5L1WDzQrDJ/PyaY3lL1h54JUhHGXw==
X-Received: by 10.60.141.193 with SMTP id rq1mr3966197oeb.19.1455325464812;
	Fri, 12 Feb 2016 17:04:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	x144sm3163852oif.23.2016.02.12.17.04.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Feb 2016 17:04:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 17:04:10 -0800
Message-Id: <1455325450-22774-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] musl: Upgrade to tip of tree
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
X-List-Received-Date: Sat, 13 Feb 2016 01:04:26 -0000

Includes misc minor bugs fixes:

  0ed932f do not define static_assert macro for pre-C11 compilers
  692b16d add declarations for utmpname/utmpxname to appropriate headers
  500c688 fix return value for fread/fwrite when size argument is 0
  416d1c7 fix line-buffered flush omission for odd usage of putc-family functions
  5a6e8d0 fix failed write reporting by fwrite in line-buffered mode
  869a9df remove workaround for broken mips assemblers

The addition of utmpname/utmpxname prototypes fixes a change
introduced in the previous git snapshot version which broke lxc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index d4413f5..8c54db8 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "756c8af8589265e99e454fe3adcda1d0bc5e1963"
+SRCREV = "0ed932f34f11663e6b3ddfa866b1798a5938a3dc"
 
 PV = "1.1.12+git${SRCPV}"
 
-- 
1.9.1


