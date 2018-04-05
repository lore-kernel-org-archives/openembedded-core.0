Return-Path: <andre.draszik@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2B0CD7493E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 11:09:00 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id p67so17288713qke.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 04:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=XV1sG8m8J07qFCaN7MDRF2mwSlXty8zOVRcFZfR1eak=;
	b=F2oQa2rhG+vzfard7EkJohdlgdUpwtLpQ9zaFx8WUicTUWCN4NY7N0pA/+uxVBpxC6
	zl+/VKArM8RcADkAEK9FQHmSfjSCHaH8KeQ1jGhfnH4cfL1x2RlCa6Y2uRtZIO942Cr1
	SCTKTMQmbxpBHp0UU9C+b6LrQSCfnArGzr38bHz5+T6bf332hrCuxFt+38zleeZta8oY
	UqD240H8vkalp2KNd/U9kvE4L12mGfvfjejC4DEuEnqg2m1H6RAchzWX5VTJQcZX/1cf
	Yvu6zZMvOJBlD0IQsqiNbDEzwwCpPfSIhfnrHTyywuwAqxaM9qb5nRcf9LUGum9ffTEG
	Qn6g==
X-Gm-Message-State: ALQs6tD1DI6UWBXoZ0XwfX1lY5pJUDsL18qKjzvrEQoh4EFDxsbyoaZ1
	XzJ29EDaUPK5F+bPCvx3wnVqiB3Z
X-Google-Smtp-Source: AIpwx4/5zwQCNLSFd8aytyqeZ+iCImJf+6gcybxDtwFkQ6wO2SYmvQA6VUKl250Xyoy6N0cFCS0xmQ==
X-Received: by 10.55.31.17 with SMTP id f17mr28046239qkf.266.1522926541359;
	Thu, 05 Apr 2018 04:09:01 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a12sm2552620qtj.73.2018.04.05.04.08.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Apr 2018 04:09:00 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2018 12:08:58 +0100
Message-Id: <20180405110858.3903-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Subject: [PATCH] curl: DEPENDS on libidn2 (not libidn)
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
X-List-Received-Date: Thu, 05 Apr 2018 11:09:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Since v7.51.0, libidn2 is the only available option, libidn
support was dropped.
The configure option was renamed as of v7.53.0

Therefore, curl unconditionally tries to build against libidn2,
which in particular is a problem for curl-native, as that might
or might not build against the build-machine's libidn2 now,
which furthermore causes problems when trying to share sstate
between multiple build machines.

We therefore see the following in the config log:
    ...
    checking whether to build with libidn2... (assumed) yes
    ...
    checking for libidn2 options with pkg-config... no
    configure: IDN_LIBS: "-lidn2"
    configure: IDN_LDFLAGS: ""
    configure: IDN_CPPFLAGS: ""
    configure: IDN_DIR: ""
    checking if idn2_lookup_ul can be linked... yes
    checking idn2.h usability... yes
    checking idn2.h presence... yes
    checking for idn2.h... yes
    ...
      IDN support:      enabled (libidn2)
    ...
even though this recipe tries to disable that.

While libidn2 isn't available in OE, this change at least:
* prevents curl-native to silently build against libidn2 if
  that is installed on build machine, even if not requested
* alerts people who use the PACKAGECONFIG option that it's
  not actually doing what they intend to do

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-support/curl/curl_7.58.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
index 5535a5609b..d2d0180268 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -34,7 +34,7 @@ PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
 PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
-PACKAGECONFIG[libidn] = "--with-libidn,--without-libidn,libidn"
+PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
-- 
2.16.2


