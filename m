Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id D48E776E5E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 23:08:04 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so51225210qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=8+lN5uXh3Ln7qU69Q/VFzXU6Abc4vkI7Wz8+n0TujyU=;
	b=fPOrxF1WhLOmPon8U6t534dpcR+94+T0HcFpqdCZY3OnaBMuqcOp4XNIUw+oMZU+y4
	Rkgyxk2FQ0V7psFHOYPWsg9o6NZJm4VMX62Sq202spe573wQ8l7ihjb8nvcd2VIJT6CT
	LNqqwuVfRUOo9PIoJf0YCeffnepbSK0fkGN2MOUnbms8LqbhgTxr4bW5cZpmRdTCff7J
	wPE5IMIamZQOYJs4/dZOA9ZM0B5K2kdrZ1XCva0l8SCzcKqNQggdGbLEp5QWuPjGwCz2
	cMEAroIcjhKsOcArZdOlGec3XB0msumPhKuufVaO088ymxsD+aeS3LstQg70NuqoyTVQ
	e+tg==
X-Received: by 10.55.27.203 with SMTP id m72mr39661322qkh.39.1441753684518;
	Tue, 08 Sep 2015 16:08:04 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	h66sm2784934qkh.28.2015.09.08.16.08.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Sep 2015 16:08:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 23:07:44 +0000
Message-Id: <d43b3db62ed440da1d0b8b8f87f0a4c7bd410faa.1441753511.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.1
In-Reply-To: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
References: <762ad7bc4268386c2a29ea6c23bc8094fd52d160.1441753511.git.raj.khem@gmail.com>
In-Reply-To: <cover.1441753511.git.raj.khem@gmail.com>
References: <cover.1441753511.git.raj.khem@gmail.com>
Subject: [PATCH 04/16] man: Use -DSYSV when builing for linux
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
X-List-Received-Date: Tue, 08 Sep 2015 23:08:06 -0000

We needed this define but were getting away since glibc indirectly
included fcntl.h but man sources clearly guard inclusion of fcntl.h with
SYSV, this is uncovered with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/man/man_1.6g.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/man/man_1.6g.bb b/meta/recipes-extended/man/man_1.6g.bb
index 6a4c734..fa4736b 100644
--- a/meta/recipes-extended/man/man_1.6g.bb
+++ b/meta/recipes-extended/man/man_1.6g.bb
@@ -58,6 +58,8 @@ SRC_URI = "http://pkgs.fedoraproject.org/lookaside/pkgs/man2html/${BP}.tar.gz/ba
 SRC_URI[md5sum] = "ba154d5796928b841c9c69f0ae376660"
 SRC_URI[sha256sum] = "ccdcb8c3f4e0080923d7e818f0e4a202db26c46415eaef361387c20995b8959f"
 
+CFLAGS += "-DSYSV"
+
 do_configure () {
         ${S}/configure -default -confdir /etc +sgid +fhs +lang all
 }
-- 
2.5.1


