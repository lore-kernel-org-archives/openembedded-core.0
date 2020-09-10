Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.20718.1599740680662778391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TTRNfYLH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id e17so5443570wme.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TyUenZdVSNJWtqweZB6pUx5LMNIKJ3UafaZScKPNJRk=;
        b=TTRNfYLHKpIgEfCzMvnOznLrVSpJknW8IPvKgr5luazFnWy8cOy7UdH4f87n7Z0j6a
         0iUJdQ2iGbEuhH65Nea/YOVr903PtyPKEAaQWS6kIOYpqH7lN/weq8AEQRWsRlf2r86p
         VjKwYkavfWQWM1DxMDs5gILb67AoH3xZv3ukc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TyUenZdVSNJWtqweZB6pUx5LMNIKJ3UafaZScKPNJRk=;
        b=TQ+N9C/npQSxG6kEwn6dFuTW1STUIqTHSXB9I+bDW50m6iX/po3x2U5RNuh9vzSD+W
         cLYQxvv7gmK8Yfnb9ngmwV2bBk1GpWqoj9uo1wX2satoEQds864YrvSJnbrdmRCWbPzv
         Uhzl9vOng+5m2uZyTNPXLGRusUOfRduJAO/tsLq2jen75Ksd2tQz6Jf/+YmXhwbhS7Mr
         7qLAG95yzs3Pde7PqKA/wUi65nXJQ0uC919KTGJcLL7Ipta8+U+HrvW+oZ8QSoTCs8ZO
         PQiJ6a03SCv9YlUZuy88wnqpBR+aSkx0az9nrDqaGVeGJ85juOqzewmfFCBAY7mJtBI+
         GPVw==
X-Gm-Message-State: AOAM5314oy019t6YTzoOVURyWjJPiWxQoJKjzhNz2gqOhOQ8+Ip9/k0j
	EIeyTw8ih4XWy2K5g7mFc93yScfpUN1MJQ==
X-Google-Smtp-Source: ABdhPJxvBJpOihY7j+1dVZya7OzP6ht9f2ZgD8D/idu5fg0xK2ywKX0fNpEi+PYab16Xe/gU2jWR9g==
X-Received: by 2002:a1c:2742:: with SMTP id n63mr8111599wmn.24.1599740678666;
        Thu, 10 Sep 2020 05:24:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 06/29] populate_sdk_ext: Fix to use python3, not python
Date: Thu, 10 Sep 2020 13:24:10 +0100
Message-Id: <20200910122433.2040293-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should be using python3 here, it was missed in the conversion. Spotted on
autobuilder tests failing on systems with python missing.

(From OE-Core rev: db07b09196022078346aadd565760240b7da6a71)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 8245361a335..9bab54c6bde 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -634,7 +634,7 @@ sdk_ext_postinst() {
 		# current working directory when first ran, nor will it set $1 when
 		# sourcing a script. That is why this has to look so ugly.
 		LOGFILE="$target_sdk_dir/preparing_build_system.log"
-		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
+		sh -c ". buildtools/environment-setup* > $LOGFILE && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> $LOGFILE && python3 $target_sdk_dir/ext-sdk-prepare.py $LOGFILE '${SDK_INSTALL_TARGETS}'" || { echo "printf 'ERROR: this SDK was not fully installed and needs reinstalling\n'" >> $env_setup_script ; exit 1 ; }
 		rm $target_sdk_dir/ext-sdk-prepare.py
 	fi
 	echo done
-- 
2.25.1

