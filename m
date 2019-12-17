Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id E03416C23A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 20:56:33 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id r67so473458pjb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 12:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F69/nhktNxp0xdSZjj/1eeppxzf7Hr/A/yoQEvM5APE=;
	b=sXIiYd/j9Ae/3k2vTJa8g3OKNxU2JWWuND4jt71B9peCbh+66AJs83MqdHBDTgqEn+
	WSW3KxOWcfn2F1543zEliFQvqKu1+M7o6UI7pbkKUc8G+7is6rW3IKfilmOsR1vNONOO
	MT6W8IdKgcE3WY1YEFwU2FxbdS3gKdIGC5pOLeQKW7Fx8L1ijlEaxqkJ/eBdnkb3lfSr
	DcVR6e/BsHndWbdSBYglCa+8Nf8ZNTcwQ/aGbVmJLKfZw2IBLZKaOhLUuOWPmPPLbXLu
	n4/RhXoT7unAeFWTkhZWwiW+eOtwEnV2NkuWBX3C01Dck3ae4EndACVCUvrny6L6YEhy
	YVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=F69/nhktNxp0xdSZjj/1eeppxzf7Hr/A/yoQEvM5APE=;
	b=BvNQ37jjwjgZOiP+9KWKCyCNZxfr2d91GU960m0Y2W3yAFAzwvuICR6cTjDJagtT2W
	l06J0VZmSy9f0iX+pU5Afp861bx1/ratuFsj8ziLslxAjcb+Ri8Qugb3uNSi+jivwTL6
	ECIXO9MocQuQKYiJyR4C6eWZlr3nn0kO1whLAobRfmIY00XeYiYBcgjnzGB9ldRmPNe0
	GNGPBCLBTr01Ti55uYPxb4ycX6SNhUkquvdKkCVWRaT5JPHw5TSplIcubxIo5HZqFoCT
	Gys/KP9TLxOW26/E3NW4zqJwhHNOzUEo83XoxPppnNK3IlNZ3zYWzF7s20L5p7FjF6FJ
	Lplg==
X-Gm-Message-State: APjAAAUZzJvGuIJaWJ13lFfS4d0VEKksPILlGwh0rfs98iJIcAsiTcMg
	wwjJGFuHWcmwVug0ozcI4qbX9AG85sQ=
X-Google-Smtp-Source: APXvYqzEaYMm5gzt8YdUx4Kp0x0ED7lqC65twZQLetAmXP0uHyjHOcN6sF+kZnjcLBlLBXQHTdmKpw==
X-Received: by 2002:a17:90a:508:: with SMTP id h8mr8594227pjh.91.1576616194395;
	Tue, 17 Dec 2019 12:56:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::2ebb])
	by smtp.gmail.com with ESMTPSA id
	a28sm2583880pfh.119.2019.12.17.12.56.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Dec 2019 12:56:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Dec 2019 12:56:23 -0800
Message-Id: <20191217205623.2475798-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] goarch: Dont use -fno-PIE on mips
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
X-List-Received-Date: Tue, 17 Dec 2019 20:56:34 -0000
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


