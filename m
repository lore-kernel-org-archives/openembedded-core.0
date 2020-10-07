Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.9773.1602065696541356282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UiZt7UYD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f21so1690504wml.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MmtKJ3oS/iTvkSUGWlAtFm8jfWJZI5OLXGL8VzZnuU=;
        b=UiZt7UYDR0cm3Iqm8EplSbkLr9KOyPr8E0Rr+z1O+JvWI8tG53nA+qNpkTdBqATuUj
         i/krmIuCqJaR78rbvFRtZPy3C3bPIftAyrOFxPM/mX09td/a6O5BRp0hulOWrLN8YPPa
         ggYmiRS9WfOoVTfqER/AWluxW6Vrsijdg/kCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MmtKJ3oS/iTvkSUGWlAtFm8jfWJZI5OLXGL8VzZnuU=;
        b=U3zvOFZ2nv27vS+F5x8bX5fCrmtfS0LfbDeWeewTRfrMtqijp26OFJOXQR17AnYMj/
         nmWV+jaE+Xgs26FSZGyvmZ4YDN9JzuBW8TKRuWYHl7nIXwoALqXuf+PiZLCRJY9XeYkj
         Go/OYZRzDr/va5plv1BQRFXUh1PGow7P6Et/Zxrz81AkgT2J7cld2pKMXqEHrbTnDEBk
         3eq7IPhh9UoP4dZ30zDlJq6rskzk0sGUUCiai+NwPzsl+TcK4xPXhXN3OaY5+iv97+kD
         wza3SeGwbRFiir36gSpkD+1+aUSXSvmaj7Rk6ScpndkZoJWlB+QSkNOtad4UGEsGqqAj
         4Y9Q==
X-Gm-Message-State: AOAM530VTFauhPWSZ+FQ/2GFo5H57Qo1W1YdfU3DxG3WX+mD3AIO9KRY
	Y7TC/x2MLze82btpKv4FyiNiP4CSCNpGpQ==
X-Google-Smtp-Source: ABdhPJzr5N6k46LZFfZVt39Wi4BdAxud77MO/MmbNUl2pH4jpz98mgfy4/gr0QdnR3uIe0gvyGe0oA==
X-Received: by 2002:a1c:2808:: with SMTP id o8mr2510114wmo.150.1602065694844;
        Wed, 07 Oct 2020 03:14:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:54 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 7/9] pseudo: Add pathfix patch
Date: Wed,  7 Oct 2020 11:14:47 +0100
Message-Id: <20201007101449.3132127-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a path to fix up handling of dirfd being passed as a full file
and with path="".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/pathfix.patch                | 25 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/pathfix.patch

diff --git a/meta/recipes-devtools/pseudo/files/pathfix.patch b/meta/recipes-devtools/pseudo/files/pathfix.patch
new file mode 100644
index 00000000000..b3e63fa28fc
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pathfix.patch
@@ -0,0 +1,25 @@
+We're seeing systems in the wild (e.g. ubuntu 20.04) which call
+with a dirfd set to the full filename and path set to "". Since
+this seems to be expected to work, handle it accordingly.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -1549,8 +1549,12 @@ base_path(int dirfd, const char *path, i
+ 
+ 	if (!path)
+ 		return NULL;
+-	if (!*path)
++
++	if (!*path) {
++		if (dirfd != -1 && dirfd != AT_FDCWD)
++			return fd_path(dirfd);
+ 		return "";
++	}
+ 
+ 	if (path[0] != '/') {
+ 		if (dirfd != -1 && dirfd != AT_FDCWD) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c5040f5f7f7..bc20a2f134e 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://track_link_fds.patch \
            file://xattr_fix.patch \
            file://mayunlink.patch \
+           file://pathfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

