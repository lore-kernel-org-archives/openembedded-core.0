Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53CC571985
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:52 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p138so5777547wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oc6/DCN0LMKUmAkAQD3q5JQYKgrTRrVZ2d2YHjErieo=;
	b=FdeZrQ0Rqt9kpFHh10WNmHDuBwPOTgKDo48oLxRwm/T2stu11qZDfwEJsCPpRWKftv
	UnMxVL0PcanIqsb8y6xiLScBPfZ4qHZ34iJyQqb+3MW8al1dvigESPr/KViE/KlvLAUf
	5EwGNPUZ+/PVnm4l2WrAhdaMmU5GjxMEb5Z5xYrmor++eBk8YRwEWhG5z9OyOYtN+YlZ
	MRMYkuy+lLdQL4EYUxZLcbe9+dA+gSj6EwYvsyLjLfdkMzLe1oyujKS4OBXJssFaoxUI
	Q8I/ik1KK7ZKb7dnsbBhe8DliO9eR3fuIN5QPd/wzqCuFIevSSRLfVJmBpM/wlgH8NCE
	BE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oc6/DCN0LMKUmAkAQD3q5JQYKgrTRrVZ2d2YHjErieo=;
	b=RcVTylxaXSIXDvUW8yFTZq0zoAXbzEFcTFE4V/IfhHgv8x9lG4qM5dNTUYzJuBotWm
	oCbGYxV4PNRSoazoCo7RFHVWH61gk9mJG3IxELHqLPwfVRC+MCXdhhjtfSJIIy5qpTeO
	U2ssaWBPAzU4oEjhrR+eHaGe1rs/ZRq+SJvGMIYlr6e9usYnFzXORCV/cV2NTNSm0wJF
	bUtV40ZwTu0ZN0vDQ+nSry5EEmCV9oQqASX3po8wj6qBI5A0IqNVKwG6uIlZYQkmtNax
	PDCaOcbGbUOnOGlyEYTSCWs6SWpRXbXEet1NrOGblr+IEzvicAv3KhbvSj0McshVyyRk
	sLVQ==
X-Gm-Message-State: AA6/9RkXznk8WQoDu+7WT0PzpnSRBMgMeuBQiDkeOB2RV9LjoyeY//tRZoVVsh3AcuirCA==
X-Received: by 10.194.157.164 with SMTP id wn4mr8559383wjb.142.1475290073450; 
	Fri, 30 Sep 2016 19:47:53 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:53 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:47:07 +0200
Message-Id: <1475290031-20568-19-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 18/22] libc-package.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:52 -0000

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
 meta/classes/libc-package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 8c99d61..4d17ff9 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -260,7 +260,7 @@ python package_do_split_gconvs () {
                 localedef_opts = locale_arch_options[target_arch]
             else:
                 bb.error("locale_arch_options not found for target_arch=" + target_arch)
-                raise bb.build.FuncFailed("unknown arch:" + target_arch + " for locale_arch_options")
+                bb.fatal("unknown arch:" + target_arch + " for locale_arch_options")
 
             localedef_opts += " --force  --no-archive --prefix=%s \
                 --inputfile=%s/%s/i18n/locales/%s --charmap=%s %s/%s" \
-- 
2.7.4


