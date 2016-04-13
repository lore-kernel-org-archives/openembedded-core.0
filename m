Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 01E7360119
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 15:51:55 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id n1so36239616pfn.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 08:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vHmS5RfVY788A79fG3zOGDhlazyW2faSiuIwVCKJXPk=;
	b=Z+ixZdwSju/sENlHiv8bRNVxIsFsHLpvsOYeBYP262RvuGvoE8Yy8ufDopYtQJ7Mri
	M84oHFrFdsBPPil7SvNu62qe7LuPYXl8yE5DCslP3HJOuA2I0CVHUrS81yWoGeHKdWDH
	Z+Fc549TsIHP/6Sgu0KlIUbTh87X6F8lwYArYmTqRkxjhVUw69Bnw9HBmq6kqzVHevjD
	H1pTGQcOHOzuWeG3Rxrb4bP8caPAGy+Qbc46QRwxF1tW9wyJNOqFun2fUn41OLkw/J3R
	DXLB6IZc/I1PEj9B/X7no9bB+IGv8G4Ntv7JPrOMNcvmdQa60XEKi8afDpaotQv6wRAO
	Ee1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vHmS5RfVY788A79fG3zOGDhlazyW2faSiuIwVCKJXPk=;
	b=EVXDslbCJC5/6QDcSGikelVBpaH6DjxlWVjB9TJoCXIsY+lPlquNCeKp1vjR9sgBtD
	Ffl1YIgJm4urKvpaZzQJEGiWDkKSqFtaN4k/U/bbzBQjQcz9xH70jok5RlMo06Fmqdd8
	E/V+EjM3jASMKYzH1BTMFajQ1O6RBp3V9KOvsykgni49JoSeAabZY5gZFYHUGIEWXHnn
	gSN5drBomRpwWPwvYqvYZw33XWtwkaa0QI0jo2C2VlMVIspMpx94n604ozlZkvaohRbA
	yRDfATJR9gTXWifd8JfepSNJtptd/h3aUa6+BeOOtUuyr58+h4+0skycGUyG7WbC2XHf
	TDBA==
X-Gm-Message-State: AOPr4FUal9lLDIy1A1h9M+dGPynfSMjYUf9Lvsx7PHnPvPCiD50j0Q8R7THtcmiwiek3OA==
X-Received: by 10.98.88.68 with SMTP id m65mr3367939pfb.4.1460562716249;
	Wed, 13 Apr 2016 08:51:56 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d19sm51932534pfj.92.2016.04.13.08.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Apr 2016 08:51:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 08:50:04 -0700
Message-Id: <1460562604-3500-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] site: Cache config vars for ccache
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
X-List-Received-Date: Wed, 13 Apr 2016 15:51:58 -0000

ccache's configure tries to do a runtime test to
determine hw_cv_func_snprintf_c99 and hw_cv_func_vsnprintf_c99
which wont work in OE.

c99 versions of these functions are provided on all
supported libc implementations in OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/site/common-linux | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/site/common-linux b/meta/site/common-linux
index 21fcac1..0a752a4 100644
--- a/meta/site/common-linux
+++ b/meta/site/common-linux
@@ -42,6 +42,10 @@ bash_cv_job_control_missing=${bash_cv_job_control_missing=present}
 bash_cv_sys_named_pipes=${bash_cv_sys_named_pipes=present}
 bash_cv_unusable_rtsigs=${bash_cv_unusable_rtsigs=no}
 
+# ccache
+hw_cv_func_snprintf_c99=${hw_cv_func_snprintf_c99=yes}
+hw_cv_func_vsnprintf_c99=${hw_cv_func_vsnprintf_c99=yes}
+
 # coreutils
 gl_cv_func_fstatat_zero_flag=${gl_cv_func_fstatat_zero_flag=yes}
 
-- 
2.7.4


