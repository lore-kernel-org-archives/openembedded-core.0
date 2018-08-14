Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 231DC79029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:15:18 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w126-v6so34601123oie.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4ilP3zMpND93SLr43RJKQvyq9iU7XVEJJ+sLW+6gBb4=;
	b=aMK4RwsVB+GXb9HGoXqHD8UoMnF5XSpHgCQRn55GCuILF7y+M2zZCL/r3xknffitVN
	UNoaURlxZamopWEbR3nX0bRaR3hr15v3yIulL/O9cmi9ngbvv0KVXkjubMDObw/V20qr
	ePgWAdKOsUlAZJnswl/+WEUJbXkIiJ9hHGJuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4ilP3zMpND93SLr43RJKQvyq9iU7XVEJJ+sLW+6gBb4=;
	b=SRrNpi/kJcqJV0FSkZL/IuZP1dO8CvDH80Y2IGUI4dOCqqGU7L6z5pOzoXnmvQKDaP
	8apW+W9V7+Oy3W4Bk0JNqOZ+AfK+ofO6XS9HHHQ9mEObhuPtY4eWC+DOuxWVKmph1vDo
	B9iFYi9KvxrgnpJS5B6yl0X9DlVDQdJ2MrenIxowO1QYmwh+skmLWYNxOtG0vijHSuf9
	7a9PhjVQrcSwlFAtWC316tour0pOTyTKPI+/RqjiGN1zut3LgFB/2hTxC7x0dJSlFYe5
	S0QjlJ2lO/1yHFRtGlH/69DbTb7BXiQfMEEb73PGs4F7Z1enBFGSaZUd82PdZMXSyAx7
	gglg==
X-Gm-Message-State: AOUpUlEAPOFE4asqbt/Gxg5LriG1Pk0tQa9QC2kgFLbvk1sPQh6Efj7J
	yB+n9YEJquaXEvQ7PdiQAGsYsabmgSUdMQ==
X-Google-Smtp-Source: AA+uWPyRr2lpKTMeJyasNYhOj75U92sN9i9YidcQdb+ikPL+B3Y4KEU+QvPaPnIbVzTUdVEnzJRK6g==
X-Received: by 2002:aca:90d:: with SMTP id
	13-v6mr24806292oij.300.1534263319596; 
	Tue, 14 Aug 2018 09:15:19 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-144-121.PCs.InterCable.net. [187.161.144.121])
	by smtp.googlemail.com with ESMTPSA id
	d191-v6sm35038343oig.16.2018.08.14.09.15.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 09:15:18 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 11:14:36 -0500
Message-Id: <1534263276-24467-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534263276-24467-1-git-send-email-daniel.diaz@linaro.org>
References: <1534263276-24467-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [sumo][PATCH 2/2] multilib_header: recognize BPF as a target
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
X-List-Received-Date: Tue, 14 Aug 2018 16:15:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When building with `clang -target bpf` using the
multilib_header, a recursion was unavoidable because
bits/wordsize.h would #include itself, still lacking
a definition for __MHWORDSIZE or __WORDSIZE.

(From OE-Core rev: 70b41b3c335a80b4ac243f468f22331d261299db)

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/multilib_header_wrapper.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/multilib_header_wrapper.h b/scripts/multilib_header_wrapper.h
index f516673..9660225 100644
--- a/scripts/multilib_header_wrapper.h
+++ b/scripts/multilib_header_wrapper.h
@@ -22,7 +22,9 @@
  */
 
 
-#if defined (__arm__)
+#if defined (__bpf__)
+#define __MHWORDSIZE			64
+#elif defined (__arm__)
 #define __MHWORDSIZE			32
 #elif defined (__aarch64__) && defined ( __LP64__)
 #define __MHWORDSIZE			64
-- 
2.7.4


