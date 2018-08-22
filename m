Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id C422379436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:23 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w126-v6so3694497oie.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bvjAggxl3o8jyJYPtFDOKRLkKIfQ1iAFeIZyvH7BVXE=;
	b=Jn+a4O/u19wjLe91GHpWLZZ74uLdrXRlJ9Tfoz3yfhp0Fu40UGNcV7cuUNQ+fUf9za
	5WewZlT4rLr9xsvbwB3fjYmbqfx9ln1KOV2zYfeKp1z5f7j9ZbxQ1Z6ITgI0hcDeh+PF
	Gx7KGenPfce9nNVYqTOlHlSdMOhAui4nX91EUFH87iKU2YsN1NfmJn36VzgfxxEYy5MM
	zlkC6M4AAB+pQO3o4i+oibNnqcU+6HH9GW0gh6tyGT4F1SCT2PgnvzW4IrC/AwB8Vbp/
	bosA3cXpRUA1M82GglOwtJTLiF6V668O+Npj1Zgib3Dbz5NJm3jLEYAtdt2mlu1CPXUR
	2dPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bvjAggxl3o8jyJYPtFDOKRLkKIfQ1iAFeIZyvH7BVXE=;
	b=e74lJ3h7HQ6FjYfifEuF4px2aGzz8hjCvrzwY0CG+PNZefYVqG3b2mWaK0AeYFdw/7
	NvA6++sQft6eeA8hQeK63M285BgQMtwTHHterZPJ9NEujfwIGZkX1daKkr0ypCv0OdiD
	SoYx1Gg5b/xxrJWmMuRF8NsGKBVvaN8uxUSy2IOXQNnpgmJ7190q+5L8BkTNHoLnC9ok
	x/B9pqj8Cvy7MrLCKWBP4DHQYcAW94Ac5qXi3C4ZQFgfKkQxE9tIQczGoHE/1ZM9FWC1
	rFxCXK0LbVqDs4vyJ5Id1N9F4IQfrHkvghWvziV860Vimn0tglMoNt7+hJxhBud0Zlgt
	9LYg==
X-Gm-Message-State: APzg51CqUvR0SVIK3ntlcp84cvgxDBkejBZOTcuIb6YytfjtMrnlVWTi
	t+T+9InfLx4RGSUBC3KZYYzmf5iT5co=
X-Google-Smtp-Source: ANB0VdbzLh1SbLv/v+cGRLmUIau+0QfGFByoF6wuXDrsdaV0raB+8tusr2wPID/noHbAP881l3GcOQ==
X-Received: by 2002:aca:bf88:: with SMTP id
	p130-v6mr4032637oif.344.1534950564608; 
	Wed, 22 Aug 2018 08:09:24 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.09.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:24 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:29 +0530
Message-Id: <1534950532-23850-11-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [ROCKO][PATCH V3 11/34] curl: CVE-2018-1000300
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
X-List-Received-Date: Wed, 22 Aug 2018 15:09:24 -0000

pingpong: fix response cache memcpy overflow

Response data for a handle with a large buffer might be cached and then
used with the "closure" handle when it has a smaller buffer and then
he
larger cache will be copied and overflow the new smaller heap based
buffer.

Reported-by: Dario Weisser
CVE: CVE-2018-1000300
Bug: https://curl.haxx.se/docs/adv_2018-82c2.html

Affects curl >= 7.54.1 && curl <= 7.59.0

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../curl/curl/CVE-2018-1000300.patch               | 44 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.58.0.bb           |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2018-1000300.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2018-1000300.patch b/meta/recipes-support/curl/curl/CVE-2018-1000300.patch
new file mode 100644
index 0000000..893d45c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2018-1000300.patch
@@ -0,0 +1,44 @@
+From 0a79d714bd55779a3a223efb5c089d0ad7e128a8 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 23 Mar 2018 23:30:04 +0100
+Subject: [PATCH] pingpong: fix response cache memcpy overflow
+
+Response data for a handle with a large buffer might be cached and then
+used with the "closure" handle when it has a smaller buffer and then the
+larger cache will be copied and overflow the new smaller heap based
+buffer.
+
+Reported-by: Dario Weisser
+
+CVE: CVE-2018-1000300
+Bug: https://curl.haxx.se/docs/adv_2018-82c2.html
+Upstream-Status: Backport [https://github.com/curl/curl-www/commit/3ee30b2b5e3836345ac510bc1674aa3a4272936e]
+
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/pingpong.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/pingpong.c b/lib/pingpong.c
+index 438856a99..ad370ee82 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -302,11 +302,14 @@ CURLcode Curl_pp_readresp(curl_socket_t sockfd,
+        *
+        * pp->cache_size is cast to ssize_t here.  This should be safe, because
+        * it would have been populated with something of size int to begin
+        * with, even though its datatype may be larger than an int.
+        */
+-      DEBUGASSERT((ptr + pp->cache_size) <= (buf + data->set.buffer_size + 1));
++      if((ptr + pp->cache_size) > (buf + data->set.buffer_size + 1)) {
++        failf(data, "cached response data too big to handle");
++        return CURLE_RECV_ERROR;
++      }
+       memcpy(ptr, pp->cache, pp->cache_size);
+       gotbytes = (ssize_t)pp->cache_size;
+       free(pp->cache);    /* free the cache */
+       pp->cache = NULL;   /* clear the pointer */
+       pp->cache_size = 0; /* zero the size just in case */
+-- 
+2.17.0
+
diff --git a/meta/recipes-support/curl/curl_7.58.0.bb b/meta/recipes-support/curl/curl_7.58.0.bb
index d2d0180..fdfbb3d 100644
--- a/meta/recipes-support/curl/curl_7.58.0.bb
+++ b/meta/recipes-support/curl/curl_7.58.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=8;md5=3a34942f4ae3fbf1a303160714e66
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
+           file://CVE-2018-1000300.patch \
 "
 
 
-- 
2.7.4


