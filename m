Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0649A772AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:55:28 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id x1so27584056qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zmwhEgA2V0lQ3pK552yUPtU1jhQNXzJonhU9U9lTmgE=;
	b=VT/ZiCEVU47agRlQM/ewSTiGEPEv4chdXDPuquTLboukIHuXFqWy346VYw4GS6NRap
	oX6V80eUW3FlsDbATP6brwfOow2JoB81aOXjf/6sn5kjiMrq8LnN02YyryI7Hb6JrZYd
	SbtEjhdugTyvdW13i/4qWiaVZ9hPcFrzpoTRq/V/dx2LaLAQzx0MoaJeR/x9FSYtH8qp
	MJCB+obUYVF5LKyr7aWXHFNaHRA0xnShKkc+/LNZdLhgw56qvIYIwGzYHtRe8/wIoU7p
	gt60Bohi8wFNvYPzx3kMO2zV86VrcLyhup2rXbE+U4sCjW8nu6ZMsDFns/yu2140mijs
	iBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zmwhEgA2V0lQ3pK552yUPtU1jhQNXzJonhU9U9lTmgE=;
	b=KKAidBOKPUdTjsSA8lORyGxV8TJsf9EuUGqpEPmmz5T9x8Sqci2/cyAWQgSXUfxCLs
	saWspHyFdi4+e/7kQBLPH22jMRBqHZ7AJT6jYLdhFzqfBzrVlI2ksuXCblkpkgIrm7iH
	UfyhNmuXTaah86g9m7SD6mLeJXFKevGSozB+PKHM6pjCjUobJbNwD3aBgKOfKjqNtN8U
	fhG/MiMSwercLdT1i9bi8InphaEQyQfyb/aNuVHEAQIWJaEcxQEiXV+abZmqaW7rYu22
	5nCOMmq9/iAKz5fh66ZgLYvO4bqxGHQU81Yi5xmm5d6VzIKrO/IYMcCoElZudYGg9qrG
	pC6Q==
X-Gm-Message-State: AG10YOSkSJ+fX73NEPoQxY3fl181cc9X0bIMIkJxEJCr4KA9KMhPSP8/MapOLAraMFbZNA==
X-Received: by 10.55.73.85 with SMTP id w82mr12586816qka.52.1454626529417;
	Thu, 04 Feb 2016 14:55:29 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w16sm6327876qka.35.2016.02.04.14.55.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:55:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:55:19 +0000
Message-Id: <f8cb332b1af7141b93c7c00eb1b18de5e63bf73f.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
References: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
Subject: [PATCH 5/6] gcc: Assume libssp and dl_iterate_phdr on musl
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
X-List-Received-Date: Thu, 04 Feb 2016 22:55:31 -0000

gcc configure fails to set these settings correctly
on musl based builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index e12bfad..83e061f 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -123,6 +123,7 @@ EXTRA_OECONF_INITIAL = "\
 "
 
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
+EXTRA_OECONF_append_libc-musl = " gcc_cv_libc_provides_ssp=yes gcc_cv_target_dl_iterate_phdr=yes "
 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist{target_includedir}/c++/${BINV} \
-- 
2.7.0


