Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0827FEF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 15:16:48 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id d16so16443738wre.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 07:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=kioI832cVpNBGG8FLE7AhM7twkrHcCS5UWiWW31Wc4Y=;
	b=JUrW7wbHNrkL5GXtYPsz/nsYhAGG65WI/8P1KA84vfo29ZTuQlQ+nSqnzAJELClti1
	44ESRUpZmPIge+zwSVlB+cL2IKuu2foJOmjsdi6Rr+GgJ5uqVQuCeM8kOqufrDElHgVO
	tlnPUthVnKRJwC2JYn1X6ftZEDpv7JjVJ0YC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kioI832cVpNBGG8FLE7AhM7twkrHcCS5UWiWW31Wc4Y=;
	b=Ny1wYgRJaNnWlJ6dI7GceUURoarAR4JavCN0MR9zRr9+fn88LC8L6lQq1QM+Afo/To
	UpMauWQPnPhvtigqpd2Ia6PGsvlXgfMXoDqeYejwnlRyJPbiJTx4Sx+m/31Jv1565OP7
	smIiFTL0OR/QPrtfX4bJY2QXH4v6yNRJIxPOuJ1iUTWoH9dmgUAxXzeHD9svr0YU71Lq
	dgEvJQBR4MFs6pEK7F8LUJwBhgwOyqgXN7ayJY2kVl/E79/TNa6GPphPaKI0zxJC/VBd
	Yv1DTqqlKglP791X1CK/W+GhHophAZwRaRsKiexO7WrBGidJc2vupQiHDux+vwiiJQJz
	XCfQ==
X-Gm-Message-State: APjAAAUzowQr6iKjpPUyZ4Lg/RbEmI5atA2+J6CuQ5zyd7Cf1MSi+lFI
	S+o80wsJTR9z5PxDP0ep7wOF8VLoOMs=
X-Google-Smtp-Source: APXvYqxTFCo5/sMTp2rhLIA4/bwSWq16WVRAkcO+i02agV9suvdLBGzl1+Y+uY82ZMkc084X9V4cog==
X-Received: by 2002:adf:f58a:: with SMTP id f10mr30968403wro.105.1580224608900;
	Tue, 28 Jan 2020 07:16:48 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c15sm25711302wrt.1.2020.01.28.07.16.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 07:16:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 15:16:43 +0000
Message-Id: <20200128151643.9711-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
References: <20200128151643.9711-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 5/5] bitbake.conf/sanity: Drop makeinfo as being required on buildhost
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
X-List-Received-Date: Tue, 28 Jan 2020 15:16:48 -0000
Content-Transfer-Encoding: 8bit

This is a long standing 'odd' dependency which we've meant to
resolve. We shouldn't need it and it introduces reproducability issues.

We already have texinfo-dummy-native and texinfo-native which can
provide it but the work to remove the hosttool was never completed.

After cleaning up texinfo.bbclass, this can now be removed with
minimal impact on build time.

[YOCTO #13753]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 2 +-
 meta/conf/bitbake.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5c2f8f9d755..cca5cdad170 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -2,7 +2,7 @@
 # Sanity check the users setup for common misconfigurations
 #
 
-SANITY_REQUIRED_UTILITIES ?= "patch diffstat makeinfo git bzip2 tar \
+SANITY_REQUIRED_UTILITIES ?= "patch diffstat git bzip2 tar \
     gzip gawk chrpath wget cpio perl file which"
 
 def bblayers_conf_file(d):
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index b6aa9f33e92..259c50bdc2e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -487,7 +487,7 @@ HOSTTOOLS += " \
     [ ar as awk basename bash bzip2 cat chgrp chmod chown chrpath cmp comm cp cpio \
     cpp cut date dd diff diffstat dirname du echo egrep env expand expr false \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
-    head hostname iconv id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
+    head hostname iconv id install ld ldd ln ls make md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd \
     python3 ranlib readelf readlink realpath rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
-- 
2.20.1


