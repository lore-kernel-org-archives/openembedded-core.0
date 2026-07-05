Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE0AC44513
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139228.1783291387643144468
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T/SZUbR1;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de008b020so184559f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291386; x=1783896186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhS++wXh1nyKC4qmrG3J9/kDnC+Yyjj810BZnXW8ycM=;
        b=T/SZUbR1Lo8OP9gwA08zKZB5j7szd/REnugZr9Wuf0iestz+sjDSJjjR5ozmkIyPqX
         NBzTuEt6gtJwjYKTrWDC4HbQOeAwvp8NGsawKbY7KKf5HQshx+Rfrh3B2Xnyns/Ww3TL
         +uIy0edraVdtnfxcESdAIn2rZ+ypp80EbojEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291386; x=1783896186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zhS++wXh1nyKC4qmrG3J9/kDnC+Yyjj810BZnXW8ycM=;
        b=TAlAv/Oar04piPyr9felgCMKe0dvCMyRgBcIBO7x50gAw0Vk5A61ZciPE+jLb3qd0N
         6nV9v2h3hJK2mWdgGaicVMUtOyg6kCn4VXy+6pIOyR2x32gv3GMMJyZ8NK+NvKKFDBco
         k1kS7NmpXIrhHc4wCgjtJbptMOQODc5Fa7/M9tPx+Rm8X5HfxtelEL27aNnfVZcKEVrq
         u2uNfG3JXuq6yBusTkTlB53fLyo/waxRvB/Aik/h/x7NySKJD6qhfUTsjSNknBZB67Nq
         OOwqiUnElBPFS83H2lMzI2FspVzrLCpIilcGKSVs2hW73l6FhM5odHooycfjWVoHwaVM
         hYUw==
X-Gm-Message-State: AOJu0YzsVD4q5ZpK6vRBubOShpwUcLArsPoXDXb5MlFlUIerA4Fw1hkA
	wWijjUKhKQ2OXEAXRIJC4DP6yvP7xuVEH24fnnKLUtL8Rsw7bYlJKBgWzi1WCLbl+panFzQlFTi
	Ws6/MZn4=
X-Gm-Gg: AfdE7clfLBTiv2aFfLhg4DvT+YYhAb3lAZmRJ1Sd6wvcIYIar8ub3Whd3Yw2TKzA74E
	NCVphsXhY7119wUrv+wL/pRX9stjQ9XbWVY2bx8+mmhw/X7OrCW0n/16kW91aFWlTeHIspVpOPK
	nKkzihbA6+oRbXPlvpz+EE/Dj/aWunZEN0Dg4aOXL/fWSVGMAJub9YKgrlt2Dz2snwf3l2EfNMo
	Gnxk4Ln0JzAW4M/hi+WbQWf2vljd7Tx+34LZVu1aqgt7uukTueQ5yz0XM0GWhJNZJEUlAqv8xR9
	QvV8E3RpYIRfdOSv4zQTFUJ1GsXMO5SECwQk2SKzPjaw8dHjshjLDZzO5INai7ICdoW4KeYEEVZ
	JtdlYbSrEJwKZ19Ji/xAm5u0+gzyEOefqtK3Aiqso2venpyz6gbhHqUCwmCu57XAw4oesxKMUeR
	ZiFcrJauG4TaKfv1EEZzRBuI049A==
X-Received: by 2002:a5d:5886:0:b0:475:ae99:c65b with SMTP id ffacd0b85a97d-47abc2e54aemr8453109f8f.16.1783291385766;
        Sun, 05 Jul 2026 15:43:05 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 38/55] common-licenses/PHP-3.0: Correct the license text
Date: Mon,  6 Jul 2026 00:41:28 +0200
Message-ID: <2faae9c2e12f67145d160396497b4091d5144ec5.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240192

From: Peter Kjellerstedt <pkj@axis.com>

For some reason, this previously contained the licenses text for the
PHP-3.01 license.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61591c3c982a90dcb2c63d6e1f02d8dc22f6fb6b)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/files/common-licenses/PHP-3.0 | 76 +++++++-----------------------
 1 file changed, 17 insertions(+), 59 deletions(-)

diff --git a/meta/files/common-licenses/PHP-3.0 b/meta/files/common-licenses/PHP-3.0
index ef0b20306ae..d6e8ae61a76 100644
--- a/meta/files/common-licenses/PHP-3.0
+++ b/meta/files/common-licenses/PHP-3.0
@@ -1,70 +1,28 @@
+The PHP License, version 3.0
 
--------------------------------------------------------------------- 
-                  The PHP License, version 3.01
-Copyright (c) 1999 - 2010 The PHP Group. All rights reserved.
--------------------------------------------------------------------- 
+Copyright (c) 1999 - 2006 The PHP Group. All rights reserved.
 
-Redistribution and use in source and binary forms, with or without
-modification, is permitted provided that the following conditions
-are met:
+Redistribution and use in source and binary forms, with or without modification, is permitted provided that the following conditions are met:
 
-  1. Redistributions of source code must retain the above copyright
-     notice, this list of conditions and the following disclaimer.
- 
-  2. Redistributions in binary form must reproduce the above copyright
-     notice, this list of conditions and the following disclaimer in
-     the documentation and/or other materials provided with the
-     distribution.
- 
-  3. The name "PHP" must not be used to endorse or promote products
-     derived from this software without prior written permission. For
-     written permission, please contact group@php.net.
-  
-  4. Products derived from this software may not be called "PHP", nor
-     may "PHP" appear in their name, without prior written permission
-     from group@php.net.  You may indicate that your software works in
-     conjunction with PHP by saying "Foo for PHP" instead of calling
-     it "PHP Foo" or "phpfoo"
- 
-  5. The PHP Group may publish revised and/or new versions of the
-     license from time to time. Each version will be given a
-     distinguishing version number.
-     Once covered code has been published under a particular version
-     of the license, you may always continue to use it under the terms
-     of that version. You may also choose to use such covered code
-     under the terms of any subsequent version of the license
-     published by the PHP Group. No one other than the PHP Group has
-     the right to modify the terms applicable to covered code created
-     under this License.
+1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 
-  6. Redistributions of any form whatsoever must retain the following
-     acknowledgment:
-     "This product includes PHP software, freely available from
-     <http://www.php.net/software/>".
+2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 
-THIS SOFTWARE IS PROVIDED BY THE PHP DEVELOPMENT TEAM ``AS IS`` AND 
-ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
-THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
-PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE PHP
-DEVELOPMENT TEAM OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
-INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
-(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
-SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
-HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
-STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
-OF THE POSSIBILITY OF SUCH DAMAGE.
+3. The name "PHP" must not be used to endorse or promote products derived from this software without prior written permission. For written permission, please contact group@php.net.
 
--------------------------------------------------------------------- 
+4. Products derived from this software may not be called "PHP", nor may "PHP" appear in their name, without prior written permission from group@php.net. You may indicate that your software works in conjunction with PHP by saying "Foo for PHP" instead of calling it "PHP Foo" or "phpfoo"
 
-This software consists of voluntary contributions made by many
-individuals on behalf of the PHP Group.
+5. The PHP Group may publish revised and/or new versions of the license from time to time. Each version will be given a distinguishing version number. Once covered code has been published under a particular version of the license, you may always continue to use it under the terms of that version. You may also choose to use such covered code under the terms of any subsequent version of the license published by the PHP Group. No one other than the PHP Group has the right to modify the terms applicable to covered code created under this License.
+
+6. Redistributions of any form whatsoever must retain the following acknowledgment: "This product includes PHP, freely available from <http://www.php.net/>".
+
+THIS SOFTWARE IS PROVIDED BY THE PHP DEVELOPMENT TEAM ``AS IS'' AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE PHP DEVELOPMENT TEAM OR ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
-The PHP Group can be contacted via Email at group@php.net.
 
-For more information on the PHP Group and the PHP project, 
-please see <http://www.php.net>.
+This software consists of voluntary contributions made by many individuals on behalf of the PHP Group.
+
+The PHP Group can be contacted via Email at group@php.net.
 
-PHP includes the Zend Engine, freely available at
-<http://www.zend.com>.
+For more information on the PHP Group and the PHP project, please see <http://www.php.net>.
 
+This product includes the Zend Engine, freely available at <http://www.zend.com>.

