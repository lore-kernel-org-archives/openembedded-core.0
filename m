Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5251F71985
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b184so5769114wma.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cSn/gsPT4lnpa1ADsRdZjmVw6wW+PIPcW60XSnEcskI=;
	b=LGSBDd0gb/hxOtqU1leoNvBGWOwKRgL/RkDhJlXQ0GvAMG0TET399FJ6Wm/nnTCKG7
	rYfLV8H5Y5CZUr9RFRld1YXHbInnTB4gEzRIcdTJDGYin4QoZzsBcuafOBMrGOcIRbt5
	6VuLLDCfomqwBpOVyWxfhLkr1dSS4CqAo/h37J4ODT/hVyHP0mBr80onAZZn8l+Z9y6l
	UBBHDJr41F8hFc8hGY5k/qvfxAT9CB0GCmJIysrWZqs+gFlG0jC4Uq7WwdZZkNT0/t4n
	AE3rqd7j3j99opdNBamtePOnlWrBTZXvnqJojvFndEGdhqJv83jT88CRRrCs6wCONqSB
	2h4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cSn/gsPT4lnpa1ADsRdZjmVw6wW+PIPcW60XSnEcskI=;
	b=WMfxjVV0tMMFCWr0jwwNkxTypQbDnqCDs2rN89IX66sHdaEFJrKNzgcdv/vF9xNPjQ
	jY5nz/pboz9WL4WEce5FhIP6hspKKG2jnqffJr86wcv/ZdQ07HF7sgAzJWWv/Jw4Bbv9
	vxvMQXVZ86MB+AAGQRGnXG+ChfBkfyT+3jfXGCw/VGuUgF5nhwqUjrbE0TT86Iqkpdwy
	8aTon5GbXwQZQiRYTfFU1zDpm7mpBi7FKtHE0ZpY3+FcZZFknjz1Iv66fYNuDMuuSRuP
	sKZ5PEbfdwEa0U+2rUXEUerPuXymVa7A/WI94/Byzv5ZKw2l4z4olEwttSf6YjCfAEGs
	l1Ag==
X-Gm-Message-State: AA6/9Rm/715wjh3jE3TLLGM4X5vhU85I4x79gtuZpgzhkIKozU7gbhrcbR22nI3Dk8GdOg==
X-Received: by 10.194.157.193 with SMTP id wo1mr9090697wjb.22.1475290076632;
	Fri, 30 Sep 2016 19:47:56 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:56 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:11 +0200
Message-Id: <1475290031-20568-23-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 22/22] cmake: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:55 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/recipes-devtools/cmake/cmake_3.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_3.6.1.bb b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
index 67ba9c4..850d6de 100644
--- a/meta/recipes-devtools/cmake/cmake_3.6.1.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.6.1.bb
@@ -14,7 +14,7 @@ python () {
     docdir=d.getVar("docdir", True)
 
     if not docdir.startswith(prefix):
-        raise bb.build.FuncFailed('docdir must contain prefix as its prefix')
+        bb.fatal('docdir must contain prefix as its prefix')
 
     docdir_stripped = docdir[len(prefix):]
     if len(docdir_stripped) > 0 and docdir_stripped[0] == '/':
-- 
2.7.4


