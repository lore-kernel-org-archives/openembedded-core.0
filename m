Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA39746A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 19:12:25 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10-v6so3003461pfi.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BWWpsKuev0dRk/bhY82VwuqQ6/EnjmUbSW1E1NewuQA=;
	b=RCvRkRhF2allpRZ30A2IMk01UMBzRQdnogvcoXksKBX2iqgpzCjO1zScRHpTS6DAUy
	VGoN6ef+4DuPYUzVo7zPRaoCY0ruehXcvs465frwa5HREmQ3c0kgxp29y+xRvLyHSpdQ
	oOFvSr5BT6+nz8Yj2RPR4s0yyHkH6488QXnP2CF+Eo8DHgmPO+zAsWJjX6YUTLJvvZkC
	uHBSzUuPmxWeYVt2CWaf3ilJOkA4PyHbClglReIxw1eHStIwyhuxyXEp/dkSyOu8yiYO
	8wtMyWrFSI4eIJxpXoUuUhP1RRosAv9M2EA5NqMDfakapRMY+vCTNSPMbFX/tu8FGOYE
	hCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BWWpsKuev0dRk/bhY82VwuqQ6/EnjmUbSW1E1NewuQA=;
	b=kohPN4sDiBh5rU4StBSMfoFJELZxpAkeSYcp0M8U5hYJvkaDhIQkdutrJKjvxEyNxE
	jsP9yX9gWKIqd0BpXFhKZkquUDwQ3rbcHb7FbNKWiKbMu4EouuaJMNkDmifToMGzUUyh
	Z5i2TbawmgRmN0QNwcZG0F+22SPVyd4SSCQwN6ck41BeRT2qXVTi+UHk0b1iyUVdDJfe
	KgBWiP5ydaIDu5hBUHEaOKbnSf5U7E6VLRiJz1yDLtDeG82xLqrOxWvJ7r2ZlGi4efJ2
	kGB1QSxymn2lKDQnWgPsdd3ozORbreptJndqO3ySysWrUjb18LzvWbpT4SLm0i5jrvcS
	Xfmw==
X-Gm-Message-State: ALKqPweVXSPnNnPASZrkkMD3F/fBc9lGDF1l1aQ9ZWnNmM77P1gT2XOk
	OEZ3tNg7V7dQ19/w7cok0SAWQw==
X-Google-Smtp-Source: AB8JxZpBAU5J16ey+06qsa9F1IPDonMli+5oA5rSjXmYVxBNXyX3k3ck8UMQHmypDPjAHae9BpSKGw==
X-Received: by 2002:a65:64c7:: with SMTP id
	t7-v6mr3009614pgv.274.1527275546912; 
	Fri, 25 May 2018 12:12:26 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	a4-v6sm54447252pfj.19.2018.05.25.12.12.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 12:12:26 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:12:19 -0700
Message-Id: <1527275541-6450-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [pyro][PATCH 1/3] package.bbclass: use single quotes for path passed to file in isELF()
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
X-List-Received-Date: Fri, 25 May 2018 19:12:26 -0000

Apparently there are recipes in the wild which generate files with
filenames containing '$' characters - which cause errors during
packaging.

Instead of adding another special case to escape '$' characters when
constructing the command passed to oe.utils.getstatusoutput(), switch
to using single quotes to quote the path - and therefore make isELF()
consistent with the way filenames and paths are quoted by every other
caller of oe.utils.getstatusoutput() in oe-core.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 7877761534b0c2492da6289e9f2269d41b6ed464)
Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index a03c05b..77bbe76 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -898,7 +898,7 @@ python split_and_strip_files () {
     # 16 - kernel module
     def isELF(path):
         type = 0
-        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
+        ret, result = oe.utils.getstatusoutput("file '%s'" % path)
 
         if ret:
             msg = "split_and_strip_files: 'file %s' failed" % path
-- 
1.9.1


