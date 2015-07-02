Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id E87B3607BB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jul 2015 03:52:30 +0000 (UTC)
Received: by igrv9 with SMTP id v9so48654342igr.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 20:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=UGEAbV8wEKuIWZsBQ48S//BluRuf1y0M8dsasg+dGKM=;
	b=K8JCtBY4uglVVraxGT/HZ1caEB/LopHaofCFV+HuQ8QV5FrRjDF8V+Hf/VeSWSpXjy
	WZz9g23YV1/T+MREHj2TyTca1ofcgjlen3Oj+H2tJf7FawdStBA/JE4/uXigOjjTdl7k
	3XtmCn+5hV/zJ4Ibqi2ADj8vq7ERTsRPu6rYWuF46ukydFywMwrXppX6Co9SIHYJBmqW
	mz2z8I79dztILx7ceDI2vFNmRhhUfoz8P0A2u7Lj17sbJk3edgzF5m5N/Zp3blQ2wj2b
	Cz9QfAfXB7dq8CF6zlPTGqMAhLDmTimuv7pfyd8R4hZyJFiP51UNEFwYW/9c1+zxGN2m
	EQlA==
X-Received: by 10.43.58.143 with SMTP id wk15mr9106133icb.81.1435809150303;
	Wed, 01 Jul 2015 20:52:30 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id b17sm3018812iod.32.2015.07.01.20.52.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 Jul 2015 20:52:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jul 2015 20:52:23 -0700
Message-Id: <1435809143-10250-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] perl: Undefine finitel for musl
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
X-List-Received-Date: Thu, 02 Jul 2015 03:52:32 -0000

finitel is not implemented in musl and since its not posix, it wont be
implemented in future too
Fixes perl 5.22 build error

perl/5.22.0-r0/perl-5.22.0/sv.c:12135: undefined reference to `finitel'
 | collect2: error: ld returned 1 exit status

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index 1aa9737..050a98c 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -158,6 +158,7 @@ do_configure() {
                        -e "s,\(d_stdiobase=\)'define',\1'undef',g" \
                        -e "s,\(d_stdstdio=\)'define',\1'undef',g" \
                        -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
+                       -e "s,\(d_finitel=\)'define',\1'undef',g" \
                        -e "s,\(getprotobyname_r=\)'define',\1'undef',g" \
                        -e "s,\(getpwent_r=\)'define',\1'undef',g" \
                        -e "s,\(getservent_r=\)'define',\1'undef',g" \
-- 
2.1.4


