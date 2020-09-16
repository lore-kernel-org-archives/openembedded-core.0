Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.193.1600269042540591959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 08:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Bo63/w8K;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: grembeter@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id q5so8511772qkc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=FtK2srAiyLxDUY0mNT9CW4WQhiLbns/iX0YM7Df7DC8=;
        b=Bo63/w8KXw/FyennxDNtRtvsfzxLI0BedQHuxtW3hVPwxaElvUNZD+TCruE2HwESe2
         GePDNfnAhl2JdAcra0Q2N6n4gZcIlVuFlWKgv6Pk1clElFcQlmRTJwsLWWwHNQ8lMfvM
         niy7Jh679kYS2E5VNLZl5xyRjhi15O4J69+UFNTSZg57mr1Jj8h2wr2ihBDijsQHZPtE
         49aI7Ry+fLl8etStSmyatK0/nqtTUsdzy1xpmDPOLl08eacLBh6UifalnDlCujewVixi
         EDRdsDr/bu1w+E6bdauvkEV1GOK+dFtXj9gEwEsSm2f+cHOQ5x4kp2xOjF6onCKVPSrO
         XmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=FtK2srAiyLxDUY0mNT9CW4WQhiLbns/iX0YM7Df7DC8=;
        b=fKslTWXQ68Xq3FaA4tVVdS2LtWVna1Fy/njI04bWfoJF8gwEv3DpEYNwplOLy2xIj5
         BNLO9iFZRMv8mAMgJti5JAVltHDdai0c38iVzI0pJObCMnA5GCvp1fLg6HML5Dc3TwKC
         gzlw5qXvcJNK+nqlcpsMt7khepZqCz9Kjs5RcuxosVkQp5EAJCq1vFn9WAHko97e4+35
         FmwodXjNw7SkKNIlV43mhb7tiwLopXsJ9smk0U2nY7xnncgERhFgC+ggKYIPrO1raxwt
         0Pz5VA377lVqKdYydssEUUjQFVrnJ1sCPatAFj3ZyYy3lZbDmtvkvKH00aKPoj5U3JzO
         PIJg==
X-Gm-Message-State: AOAM530w7IXiMIH6631DYijNJz3wFWpU2Vyn1891uRBP85MjqRypyH8V
	kIIu31DViqo46cm5Ku6nTEzt8YAsw3+8gD6vIWPK46cARqM=
X-Google-Smtp-Source: ABdhPJwERGSEgiCIZrdhjH57cjWg7u2aSmYzJ5sqIpSD+NNycw/bCIDqO1PkQZxCtmFc/3JQaB4n07HweLo+AhXd8nY=
X-Received: by 2002:a37:4496:: with SMTP id r144mr22588546qka.230.1600269041573;
 Wed, 16 Sep 2020 08:10:41 -0700 (PDT)
MIME-Version: 1.0
From: "gr embeter" <grembeter@gmail.com>
Date: Wed, 16 Sep 2020 17:10:30 +0200
Message-ID: <CAGFuAuz+8M62V2qkc5HutJZDDLXxacF2ajr-4wuZaOKqZ1i-nw@mail.gmail.com>
Subject: [PATCH] oe-setup-builddir: create conf/multiconfig/ from TEMPLATECONF
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Retrieve multiconfig automatically from meta-layer if it exists,
so that it is possible to use it "out-of-the-box".

Signed-off-by: Grygorii Tertychnyi <grygorii.tertychnyi@leica-geosystems.com>
---
 scripts/oe-setup-builddir | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 30eaa8efbe1f..0077c13110b9 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -65,6 +65,7 @@ if [ -n "$TEMPLATECONF" ]; then
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
+    OECOREMULTICONF="$TEMPLATECONF/multiconfig"
 fi

 unset SHOWYPDOC
@@ -80,6 +81,9 @@ for more information as common configuration options
are commented.

 EOM
     cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
+    if [ -d "$OECOREMULTICONF" ]; then
+        cp -af -t "$BUILDDIR/conf" "$OECOREMULTICONF"
+    fi
     SHOWYPDOC=yes
 fi

-- 
2.25.1
