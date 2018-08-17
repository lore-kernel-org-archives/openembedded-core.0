Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 77E4278E6A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:43:51 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id a26-v6so2978502pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8PwQPzY/vlHNh8rH5HcLwYzxm+0Dez2kt/0grqihCiU=;
	b=GMbZAOWFLwd2fPP9JTid01qiG6C9PZRktUSauu9UDFW8fEeL/aow9YYN7sm4YifM4O
	Y2Ajr/uqyFEbw8TAOOObIpX1vpP3aeD3tMcdQjaeH2HGVhYV6tZCvqXSNg3w1JtVeo6+
	L8Nr1oOSr+NaENal9Wj+PK94BS3doYhU4Aae8fvmHLjjWBMahiK4zTQpv6ENJx9ga7gH
	x8UsZEDjhlXeXsQYMkp/KVWXqTfSTLp5ZdejbYFbZ+L5sxZ+nH6ZQP8e56pwW+fdbm+Y
	FdtBjXNzyVsqlimgqrSJdCTu3aK89XKDPM6w1ziEyAfuNTZZycdZBecV+WvZ8kNWZm9m
	Epjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8PwQPzY/vlHNh8rH5HcLwYzxm+0Dez2kt/0grqihCiU=;
	b=jjhg6Y34C9YA0EnuWwW1DkudIGc1VOV1Xps/nKB9Ky4eJ54fwFRiOjQI36X5J/5NPQ
	yLRd66B7MCJLOkrt4lmmrb6IX2MLd1HB+7yXkpdG3H01k9ScNm4WgZ9HiLIdmVcOwNcB
	47JUaw7YVfML++4vyHlxDyywygRKAhX7WBRHxiR8FUScwQzWi9khBAlhP+fX52A/0SvG
	NkBarJFxLEoE5h5hAwPJO2ESNz8iHnXoymDBwJcFu33hOdbXelI528uwxY6mVRF5u8tI
	50fKu5sKDH6hVNJqPF0m9+XBWec6W2ZJCVfWRFpz72tgFp+dKCW8OLqAmFV0rHjg/yK2
	bHGQ==
X-Gm-Message-State: AOUpUlEd4xjJMRvk9dC935kKLSR0mHL4YSBX4bLhcf4x0Ys675bHmAJJ
	yQFpE3O725RaE3Y311ck0jovOvpW
X-Google-Smtp-Source: AA+uWPwdGjTEopn2zkuPeuM5h6rFnqRV5aym3vo78XxGsySR1xxa6sEyIoarmoaEI0/uVSrLkieQBQ==
X-Received: by 2002:a63:be4a:: with SMTP id
	g10-v6mr28639848pgo.378.1534481032528; 
	Thu, 16 Aug 2018 21:43:52 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r64-v6sm1157526pfk.157.2018.08.16.21.43.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Aug 2018 21:43:52 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2018 21:43:36 -0700
Message-Id: <1534481017-17310-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
References: <1534481017-17310-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 6/7] openssl: fix path in nativesdk environment-setup script
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
X-List-Received-Date: Fri, 17 Aug 2018 04:43:51 -0000

A single version of the openssl.sh environment-setup script is
currently shared by both the openssl 1.0 and 1.1 recipes. The libdir
path in the script needs to be tweaked for openssl 1.1.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.0i.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
index 73e8ffa..92f3059 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
@@ -132,6 +132,7 @@ do_install_append_class-native () {
 do_install_append_class-nativesdk () {
 	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
 	install -m 644 ${WORKDIR}/environment.d-openssl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
+	sed 's|/usr/lib/ssl/|/usr/lib/ssl-1.1/|g' -i ${D}${SDKPATHNATIVE}/environment-setup.d/openssl.sh
 }
 
 do_install_ptest () {
-- 
1.9.1


