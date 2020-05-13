Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.7441.1589380580912120903
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iYEvyzss;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id s1so876935qkf.9
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ucq8ZTHK4sx4ASW+YNrH7Fz7cQt1o7CFoBhUOYzfftE=;
        b=iYEvyzssTU7V64mirRG430zxU+29tTXLi+L6KB1AJcYSatI5rF31bPoDdTjPwPqiRg
         ZkNAgfzktbj6AWL/2SNuqsVblKk7TbqQyuLWyHwVlwe8ChQebo9ijQ89cQ66SH1sokTj
         2YuFgtCTvRZs2FVVyO6sHC2/IQ1OUXTxuVvJHbMs1Hm9DR+YJ+3bekDsHooU7NQwSSIj
         RJdyv0Vcrkoe3HYwCOnGHsMWMhFZywR9N33GMg/ut8IegK5ptp4ZmQ27l28dURN5FLjz
         KxwFep7HJl84eymXY0fr6DjfVG564pl/oryUzQ3HB2yA5T0g3VKmCVTQgzJ6b9Xs4mqb
         bd+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ucq8ZTHK4sx4ASW+YNrH7Fz7cQt1o7CFoBhUOYzfftE=;
        b=lK0iTUfJJCG6UjrCp1RBe4Lon3n8zFZ686kG2Y5K1WouPy0eU7W12HW/30rnDE1ycT
         VVHO6+A9nKpfKkSPi7itwLrUiKloP+7S2kja8x+4xTUBYL6+by204P8bTVNiKeTFM3Of
         8DLDR6nUgawfOwuaXgSDcQHbIGkpYEIMDnqYtFlfX6Ot94kz298U2EgwWV1tvzEOqNS2
         8ccW3sOk3Q8a6YfmQb4zYWfI7QTC4jdbP6LpKtmGFwyOffA13i/qWugWifI72wAd1L57
         KoVkG1/ZNJ9zAVc1Ys8qoOX/xbPwkvjNM3W5Ndt/8lgGnmO38CyzuxCiy06nd5nmxAom
         613g==
X-Gm-Message-State: AGi0PubNCDtDvVtEN7e4+/nIBYrerF5Iq5h57BAeGXcOxw6UIvCRwzKc
	JaS41hJIouaJNgkZjjWEJBQ=
X-Google-Smtp-Source: APiQypLXwcXezfWeNH2L15aTNN0HSBoB7lh9IqHDjlu2pfABqA8lwcbgOEFbRxCYBXzWrMcK8KyENA==
X-Received: by 2002:a37:4054:: with SMTP id n81mr17387343qka.209.1589380580071;
        Wed, 13 May 2020 07:36:20 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id u126sm9843711qkh.12.2020.05.13.07.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:36:19 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH] kernel/reproducibility: use specified environment settings
Date: Wed, 13 May 2020 10:36:18 -0400
Message-Id: <20200513143618.53411-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The routine to get the timestamp of the kernel commits should
specify LC_ALL to ensure consistent behaviour. We were making
a copy of the env, adding the setting .. and then not using it
on the call.

We specifiy the env in the subprocess call to ensure the
variable is available.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

This is the incremental patch to my previous series. Squash as required!

Bruce

 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f31084948f..3ac91fbd4f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -164,7 +164,7 @@ def get_kernel_source_date_epoch(d):
 
     env = os.environ.copy()
     env['LC_ALL'] = 'C'
-    ts = subprocess.check_output(['date', '-d @%s' % s_d_e]).decode('utf-8')
+    ts = subprocess.check_output(['date', '-d @%s' % s_d_e], env=env).decode('utf-8')
 
     return ts
 
-- 
2.19.1

