Return-Path: <37dmjXAMKABwO2C8GG8D6.4GE@flex--wak.bounces.google.com>
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com
	[209.85.214.201])
	by mail.openembedded.org (Postfix) with ESMTP id ABDA37D196
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 21:53:48 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id m37so10790145plg.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=date:message-id:mime-version:subject:from:to:cc;
	bh=75ezkuxZDquA1LcTk2Qq19tHOmnLwmqNUgkU33GKRtA=;
	b=Of4m3ri5i8SYWWb+gI7zWBIlxwmPaIoGlx7qAbXQ0Unm0xhMEtZs47annEVHhXQFv+
	W86vQ1Y76Le14jnP8KTVi8hR0FDVHswetDoIeWqhy+CV5SPZk9L847y01zJZ98R/r2R+
	7/SDDL8bkLCzSfINVVxcnWuve/6V2FJzMk8lhRnvZWd5wlRnoXcCkFKdhYXax15pX0nx
	Lom/C6RavVxyY/q1J0S3AO7gRNMmKf1wJv570QaWEWMtxBYoTPLnWJ0ro2fBZwZ/kz80
	r1huBdHUSQmJWDvq0RSa5aLSfRV4lQzsfJCqEWHMNKB9ZZWdyysNHd3WmxcDSJMbsA7z
	/e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=75ezkuxZDquA1LcTk2Qq19tHOmnLwmqNUgkU33GKRtA=;
	b=lkuE3bdYuQPcolS1skRhBQB2GgSSWljuS40l4KsUDTTXgSG3/smxaFF2A+VCzZxHjd
	TuvFx2l7a3vqlduUGhsSUkmjsm+0tDzkIpJDiZkS3vOEE8Flhw5C0pUR6Bl1V/WhmEK5
	I2fbjlL5xoGR6uyGkl0R/bUWTzZrxp64uilenhsU/cVkrmOAdTxNITvlmw4uaupb2zY7
	VKVepdiKlGsn8IWdksrYAPgVvcZNcNgFMMFiNVJ6s+wKU5ktKu4ouQr7rt4Z1DmLkmzX
	UvrHLhMtvH76fP3uhKw8+Hkh/c+kC8lYhH8/12TwsrE4ltrMANv0/Dl55yjTJx+0P/3C
	PsPw==
X-Gm-Message-State: APjAAAVYVbVhrS8DjsgJUY9HXch+CiYu9IbIFhWvWYWr7N/6PEpbpe70
	20Pq4bw2cBxJ1j07Z3vIBqRsY7xNWF48iDtjRJi0rUqEiXL39FrQbkgS7x6CiF8OhFRacWfAnrm
	zlhrH15woWs9KDzLozoYYWPiZL65kuzn4oAMQAnCVRxm0G8aIlN27KzxAd508WuEMCzTzwVCvF9
	m7hw==
X-Google-Smtp-Source: APXvYqyskhNzRxuuv5Htt66pdZujXRp2hYYNOh2+usRUrzssk+VJfEs+1TtsV/+2nmM83W5lj0AB0hA=
X-Received: by 2002:a62:579a:: with SMTP id i26mr1472897pfj.122.1554242029666; 
	Tue, 02 Apr 2019 14:53:49 -0700 (PDT)
Date: Tue,  2 Apr 2019 14:53:47 -0700
Message-Id: <20190402215347.117940-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] perl: Don't use TARGET_ARCH in filepaths
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
X-List-Received-Date: Tue, 02 Apr 2019 21:53:49 -0000
Content-Type: text/plain; charset="UTF-8"

Platforms like powerpc64le have different variants of the same target.
Perl guesses that the target should be called powerpc64le-linux, while
TARGET_ARCH think it is called ppc64le-linux. If we use TARGET_ARCH
for perl-native on powerpc64le this build will fail since the
post-install rm command won't reference and existing file.

We know that there is only one arch existing per build, so use a
wildcard for finding the path instead of trying to guess the correct
architecture name.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 meta/recipes-devtools/perl-sanity/perl_5.28.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
index 5aa7cd3ee1..f3948a5f8d 100644
--- a/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
+++ b/meta/recipes-devtools/perl-sanity/perl_5.28.1.bb
@@ -107,8 +107,8 @@ do_install() {
     install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
 
     # Fix up shared library
-    rm ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PERL_LIB_VER} ${D}/${libdir}/perl5/${PV}/${TARGET_ARCH}-linux/CORE/libperl.so
+    rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
 }
 
 do_install_append_class-target() {
-- 
2.21.0


