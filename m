Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web08.9901.1625594304636001225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 10:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vJGFASR6;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id x24so5225419qts.11
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jul 2021 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQFVqKi4+18oHI01Cby5VdMMtVj44BSslJqGQJla4l0=;
        b=vJGFASR68pbbOLb6sO/BnmBg5doo+cGZ/db1dLwoYm/z0UfQLTxpAjoYg5hQncOnmD
         eJbLnLOaTQnUeIVTvqkLuStS5jiRIA5vRIxoyCFFq45k2TBmn9bdkYjFMBLi7ZTxafF0
         RDvKjm7aj1ZKzWJvo5jEKLqo7gPzaj0GrVNFn/Mhx0XaxMx/TbaCWtyCk4JOajPUVOOo
         FqoNdfbcP2JJXn0Bqrm70pYINl3c+J5EjXgRM+H4nT7/MFW7fUqd7gWmujCX0aW4H3Tm
         SW6NeDuNYixS32tDJfc3+MPo3RYIx1JiaFa4CdFb6cdjPykDxWyeGPMj7Ad5LxggNRNO
         XhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yQFVqKi4+18oHI01Cby5VdMMtVj44BSslJqGQJla4l0=;
        b=qQ+WOkoZe/FDACtvt0oF2VGVaH1ZnqwV1+00L0MacyNlcf4pe79iYstSr7jbgmyBRg
         7WcQXEqNsvuwg3F86L0DLaxBzJsdHgyqRY8ERv3315qFQnbKQ/X1CX65XxD53TFcL8ox
         2jHGupEbbie2Pg8+7A5UzEJCHdNWhurxwggg4IF19dmKfMv4S5rrI02QSsRd8Ss8aqy+
         R8O8y1u+hqSFRqVwq1uk2jN2HzsXu1jJwofNRJ/v7vzzqqno5//IN5U3wpAJ0lvxjrTf
         2tUhSTMWD95gVShc55Hb5GLO0LUz8iH8YWTIXoo/gAV855824uCQqp+a7Wi2jX2ps5Ya
         9Lfg==
X-Gm-Message-State: AOAM531G3v6OnohohYF0pGmgAvORfPaMu13GdQjUAQp3S+5f+jviMMgl
	kG9V90nka6p3j2HXLczV6RQ=
X-Google-Smtp-Source: ABdhPJwFXRjPwdg1vkEMuP4vclJmSVWeqQ5vTaa8sYV6V5vfEo6ojZanUYsNguKaokoMys8gwYLoag==
X-Received: by 2002:ac8:ece:: with SMTP id w14mr18676661qti.5.1625594303716;
        Tue, 06 Jul 2021 10:58:23 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id l6sm7330264qkk.117.2021.07.06.10.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 10:58:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.13: add devupstream support
Date: Tue,  6 Jul 2021 13:58:21 -0400
Message-Id: <20210706175821.41519-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We are always getting questions about building -stable, or mainline
master. Rather than introducing a separate set of recipes, we can
facilitate this sort of testing by using the existing devupstream
bbclass support.

To build an unpatched or otherwise modifed -stable of 5.13, simply
set the linux-yocto preferred version to:

  upstream+5.13%

And your wish will be granted, as the build will use v5.13/base
which matches the main linux-yocto version, simply with no extra
changes applied.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

This is the patch that I was talking about earlier in the yocto dev
meeting.

I personally find this the easiest to maintain, since it is just
a variant of linux-yocto_<version>, and ends up just being a
different branch versus anything radically different.

I am open to making this a different / named recipe to make the
distinction more clear, but I'm worried about the impression
that we were doing extensive testing on the bare -stable branches
when most of the testing (which is transient to the base -stable)
happens on our standard/base branch.

Either way, I'll work on getting this and the -dev tweaks I sent
earlier added to some part of our AB testing to make sure that
they stay in good shape.

Cheers,

Bruce


 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 66384d8f7d..cd51e04b95 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -25,6 +25,15 @@ SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
 SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
 SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
 
+# set your preferred version of linux-yocto to 'upstream+<version>%', and you'll
+# get the <version>/base branch, which is pure upstream -stable, and the same
+# meta SRCREV as the linux-yocto-standard builds
+BBCLASSEXTEND = "devupstream:target"
+DEFAULT_PREFERENCE_class-devupstream = "-1"
+SRCREV_class-devupstream = "62fb9874f5da54fdb243003b386128037319b219"
+PV_class-devupstream = "upstream+${LINUX_VERSION}+git${SRCPV}"
+KBRANCH_class-devupstream = "v5.13/base"
+
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
 
-- 
2.19.1

