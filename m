Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.4645.1618479286317683341
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 02:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fwAX5mxz;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so14058380pji.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 02:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=f2DWUFGdmPFlUVqNuBE5roJ/RpysxJHKkpr3L3hTvvQ=;
        b=fwAX5mxz8w4Sti62kYRf9Ir18K0lAZarWwJV5pHUGb4Ec9svCIAihB6RfljqOFjl6I
         WqXjmydAzZpl4HkQeKvIDNjdzldpRzgAEEKX/Ow8Q6u3gz5vcAtmLmoAfTbLW0bG7C0/
         O0WO485ceig8nVNUdfq/85+idfGNW/YZ8FJd9jq/Mes+Qi5nunWaZz/T/ulP4blfQq0v
         25wFI6PZZLvai3Gv6881GGS+WCybsDrPFZKC8TVrh5gBoJKfFrh1JwG3OdVI7i9Hen5s
         BHYK/zWzIAvjTm+OYm6PHW265sNWwpW8qUpk/hl5suP8XrcdnR9x4+sjpIOGd3z4Uv2V
         pTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=f2DWUFGdmPFlUVqNuBE5roJ/RpysxJHKkpr3L3hTvvQ=;
        b=QoiaBbkkZBWZFFwvliCbueyUmoLBZKOLbP4L4lPjFXqgyXtgIOJKjMaydnjtnhw0yd
         i5KPPCmohCZcZx/TN+L0lMmy7UaSoIsJogdGx0fjg+xXqNdpbcysZ+FaXTzekh0FuTk9
         EQniHfIzGb9jkwyWRbmJPLfuPS7llm0L/Y9epxHmYy9mMVIJjZvUXlKYS6lyZC3beHcf
         tiajL0lc8mMLAbqnNOEf8irUPs5FTQJT7z/cERNAVkaY8c3df+cd3ahqZtnVPOZ3cRpo
         sber/220pJ1ZZEwHb26+eLYNzbjN8V+7R/pQ6kk/Z9E0UGJtn++0i0tY9YlkcEyDi5ti
         Yrow==
X-Gm-Message-State: AOAM533oVIfSGPVQJKxu/aq0iJnYuU8SlL15FJ8euLJjUg2mu+f1yCVv
	CjGhu9FsN/ePj9f8beSlWVpR7CVE+V4qLNJQ
X-Google-Smtp-Source: ABdhPJyXC01OSKvHNnxX2rVxoihtF00bhLft5qIeJAVf8EixpPkYUDxHzJTNbd9zYEubPAZhxt4kmw==
X-Received: by 2002:a17:90b:4c02:: with SMTP id na2mr2881633pjb.77.1618479285683;
        Thu, 15 Apr 2021 02:34:45 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id ms9sm1994851pjb.32.2021.04.15.02.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 02:34:45 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH 6/8] We are passing "hostfwd=tcp::12345-:12345" while booting image when slirp is selected. Also, we are using mapped port of ssh :22 to copy remote-test-server to image. We have added a logic to extract the port number whenever multiple instaces of qemu are running (ex., 2222 gets incremented by 1 if its already in use by another qemu).
Date: Thu, 15 Apr 2021 02:32:25 -0700
Message-Id: <20210415093227.175608-6-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210415093227.175608-1-vinay.m.engg@gmail.com>
References: <CANNYZj85zmWjRe2KR53u_eF-DDf47eR9eOJnP1Ch0Df6COoAaA@mail.gmail.com>
 <20210415093227.175608-1-vinay.m.engg@gmail.com>

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 scripts/runqemu | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..c623f38838 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1055,7 +1055,8 @@ class BaseConfig(object):
         logger.info("Network configuration:%s", netconf)
         self.kernel_cmdline_script += netconf
         # Port mapping
-        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
+        # port 12345 is for rust testing.
+        hostfwd = ",hostfwd=tcp::12345-:12345,hostfwd=tcp::2323-:22,hostfwd=tcp::2222-:22"
         qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
@@ -1084,6 +1085,21 @@ class BaseConfig(object):
                         mac += 1
             if p != p_new:
                 ports.append(p_new)
+                temp=__file__.split(os.path.basename(__file__))[0]
+                # To get the mapped port of 22. We use this port number to copy remote-test-server to image. 
+                with open(temp+"../meta/recipes-devtools/rust/rust-test.inc", 'r+') as f:
+                    text = f.readlines()
+                    temp1=[]
+                    for i in text:
+                        temp = re.sub(r'(\S+\s)(-.)(\s\d+)( -o StrictHostKeyChecking=no .*)', r'\1\2 '+str(p_new)+'\\4', i)
+                        temp1.append(temp)
+                    temp2=''
+                    for i in temp1:
+                        temp2=temp2+i
+                    f.seek(0)
+                    f.write(temp2)
+                    f.truncate()
+
                 qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
                 logger.info("Port forward changed: %s -> %s" % (p, p_new))
         mac = "%s%02x" % (self.mac_slirp, mac)
-- 
2.17.1

