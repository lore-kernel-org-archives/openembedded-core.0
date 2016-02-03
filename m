Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id 971B3771C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 06:28:06 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id b35so9306530qge.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 22:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=B8Mo6hndMTWUOJmf2lVzfGyBnTRPJqc3uSe+a6vdiFk=;
	b=Czqq/gnl+z38XawRIGJ4bztavvDj+ILgAyyvqIi9LGkL/pXNaMibKxUNG4T6+Yb2AE
	NtAREwpmezRfNK7G25C7knSW6/iivdOB7GFH/RFOtI3rwzVoxFuQHhOlK0CfOqG3p0ly
	ZIA7f4A7mfvvJJ5Gsnjd/0Y7gNUSWFD043oFmNDgRrdfpExD71N4pQ9sgiIrDDGxaISg
	4rdyepVw1L1pO/sloP1of1y2cLzM0/8Rzd7MwOiJwG+tsjfUhrvtWRmsjdV+DwL6EAmY
	5yZwTMa74wca4dkOtY3qdXbvSyP/+jRe//COwTV1/MQiE4XHlw4VkDUO3svCYdqpsu7b
	3MSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=B8Mo6hndMTWUOJmf2lVzfGyBnTRPJqc3uSe+a6vdiFk=;
	b=HLKHBwVJGw2qNGz8NCmOnLLxKFo5T7x+PiOJp48/Y5FqJ/KXx8jvYYl/USCVELI9xX
	UaNIJscYgzOvuoAl4dlwC4B/YINqarkjz5sGHEJyawvr7q9EoL4JhBbrFk18Jf1h8yKe
	Nj/Z7TgQBMfVTufYrJI+n2thkwhRvY+0QbEHvzWffISCBxg7Boy3mABgECW5n4e1mRTe
	9RzIkZBzHfzoVEN57KpihODv8x/b9SEh2zvs22tForAcGyXRN12mtR4UArdHtVp6SeNr
	hzYJk1CaruvV5zUG2bp/UpojEhgevA9skSHy/ignnMqU+4p+ngZu8gU/ia8W/3g5KdNA
	C4iw==
X-Gm-Message-State: AG10YOSnQFvw7xqEhTKRqXquZ5AJrfKF6fZ7VmrJovnXiqhcNGQQ6gU7m2JFrnOXQZoZDw==
X-Received: by 10.140.161.9 with SMTP id h9mr41591673qhh.82.1454480886910;
	Tue, 02 Feb 2016 22:28:06 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	t187sm2246973qht.39.2016.02.02.22.28.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 22:28:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 06:27:57 +0000
Message-Id: <9722ea69638d54160ace420c9d35f0b0d9b754b9.1454480571.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
References: <7ecb4b025bd04be448cf92e45b415451f934ac76.1454480571.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] security_flags: Replace -fstack-protector-all with -fstack-protector-strong
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
X-List-Received-Date: Wed, 03 Feb 2016 06:28:06 -0000

since gcc 4.9 this is new option added to gcc which is a better version
of fstack-protector-all with reduced stack usage and better performance
yet giving same amount of coverage.

pass fstack-protector-strong to linker flags as well
so ld is passed flags to link with ssp libraries

https://outflux.net/blog/archives/2014/01/27/fstack-protector-strong/

describes it in usablility terms.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 37570a6..79e09d7 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -9,11 +9,11 @@
 # -O0 which then results in a compiler warning.
 lcl_maybe_fortify = "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY_SOURCE=2',d)}"
 
-SECURITY_CFLAGS ?= "-fstack-protector-all -pie -fpie ${lcl_maybe_fortify}"
-SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-all ${lcl_maybe_fortify}"
+SECURITY_CFLAGS ?= "-fstack-protector-strong -pie -fpie ${lcl_maybe_fortify}"
+SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong ${lcl_maybe_fortify}"
 
-SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now"
-SECURITY_X_LDFLAGS ?= "-Wl,-z,relro"
+SECURITY_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro,-z,now"
+SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 
 # powerpc does not get on with pie for reasons not looked into as yet
 SECURITY_CFLAGS_powerpc = "-fstack-protector-all ${lcl_maybe_fortify}"
-- 
2.7.0


