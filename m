Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61E9C7F884
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 18:44:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id s21so11070978plr.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Dec 2019 10:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=F69/nhktNxp0xdSZjj/1eeppxzf7Hr/A/yoQEvM5APE=;
	b=DsT5zXyjRtI1SMwr860S4WzBUahE/WQysAv4CeKW6LIaVpJdgKq5HypaOYtqY/6r7k
	Q5hAflAVMJEsQaJR45Vx7cGu5Rj4QnJuVhCQOc8VCccjeH1aXtBL64SyCv6Hi1JBmmUH
	/Ts6L0gLCGCVcmqBDGI+ZijU0dkaOpP6X25pcqkxM7R/6ydD6j4l/PVxeQqPrAGikdwN
	SHTkILJEYWEGFHl4gNQCtKCCZiqGdKS7S3VcDp6e/Pzja5h0eHzbUMFIQh6AjglFpJZl
	nxSaQvbmzVz3WoAS/7cqHdDcY7Z3jDmmBDmkUhg+3hI/IUtTMpavNTHKQT+qGskI/7xb
	hd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=F69/nhktNxp0xdSZjj/1eeppxzf7Hr/A/yoQEvM5APE=;
	b=XmO1DIySHcucg+46e2x4u4qx16fSjtRsLeyri7nucS9bHXMMmv60osss2TNlmPWLU6
	l0XXpNO8NjYl1Ikk6TsQAM9q3fgwdTV/HS6/I5FnQDhr7QkZTq323qauLA0OTgjk7/Oq
	KYMj+Y5ft4nifYL3hsYADSF3+EGCKpHP/BTxYkT3r9+xqEPrGPHY7ElajsFFXKBUeaAC
	VGwdsLHAe9m9lpkuYBWCoNWWgsxRFbB05/11RWAXtit7BStLaO8pYykNhbVJmLRhnWy0
	NKyK1ZZKO+l+f9tkdKMu3p6WcnUl1GJFX4+PuCLZDtdSQ7lnzyb97faWeWpHtIXQSBb5
	yOpA==
X-Gm-Message-State: APjAAAU3HC5A/N04T4SHa9mTme6EmZDhAW0cRqjESJf2M8hyyYnANyLY
	Lsz0Vth5MFfFsL4oZVbr75n/W4NcmIc=
X-Google-Smtp-Source: APXvYqyfT6vOmY5618dQmhRm9+kbSwqjeyVKnDN+xAtYlj1EQA7n0OdaecIrfZizzOYWbBB8tV4k8g==
X-Received: by 2002:a17:90a:1785:: with SMTP id
	q5mr41477436pja.143.1577645071080; 
	Sun, 29 Dec 2019 10:44:31 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2f83])
	by smtp.gmail.com with ESMTPSA id
	bo19sm21257085pjb.25.2019.12.29.10.44.30
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Dec 2019 10:44:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Dec 2019 10:43:59 -0800
Message-Id: <20191229184415.19514-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191229184415.19514-1-raj.khem@gmail.com>
References: <20191229184415.19514-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/19] goarch: Dont use -fno-PIE on mips
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
X-List-Received-Date: Sun, 29 Dec 2019 18:44:31 -0000
Content-Transfer-Encoding: 8bit

This was added with

98b24e9268 goarch.bbclass: set SECURITY_CFLAGS for mips64

to overcome a problem that was inherent in go linker which has been now
fixed in golang compiler upstream

https://github.com/golang/go/issues/20243
https://github.com/golang/go/commit/39c07ce9e5311c94880789f19f2f8b49bf1b5241

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/goarch.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
index 1147b6d233..33d1a13acb 100644
--- a/meta/classes/goarch.bbclass
+++ b/meta/classes/goarch.bbclass
@@ -53,7 +53,6 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
 
 TUNE_CCARGS_remove = "-march=mips32r2"
-SECURITY_CFLAGS_mipsarch = "${SECURITY_NOPIE_CFLAGS}"
 SECURITY_NOPIE_CFLAGS ??= ""
 
 # go can't be built with ccache:
-- 
2.24.1


