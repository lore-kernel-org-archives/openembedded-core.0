Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.21679.1627918925871952725
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 08:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A4gvJdN3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id n12-20020a05600c3b8cb029025a67bbd40aso3911699wms.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBJ6ZnFD5t05wSixvRt/93g7nAlqhEHPXT3sDXNo2mk=;
        b=A4gvJdN3Y/7alofqtqBA7p9uz3EAml/y1PIgIlvwOaG2FoihZwvPhoXlHfBpj21xmP
         zMu3lvWfXtnEhwq11LxPf8Fjf9M2dFSUkLn0sLZtqwAQ3Re6wIuBpn51Ixg+An/Co4Dw
         QoE0XQJ3wWrcILPT5IkhAWjbA4DeK5gIrCKgg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RBJ6ZnFD5t05wSixvRt/93g7nAlqhEHPXT3sDXNo2mk=;
        b=RctfKWedSCvzIZVWX1RyjTQchie4KYiXgrADQxEPlCDqlQKmwCh5QdEIqC/8uwHqTy
         SQUWl1zBpL13ciJJpkjO8spZAE8q8jpgRHn41JaNilkML52AQysNwiO++ll52j6K5DjD
         5granirGSltIVEtjthTzevdWNjVXZcSyFXtlZVGckN47+FjcJ1jGDq506pQFu4vgxWrt
         k7SSUxwvoyDa3snUFZdW2FqO0DBC2sjvZ3mCkf+u4duSGdo9+V240fJpFe7h2TBpfDGb
         MNq4R+5nsj3GS1mk9N0TWUvVFtBboWXb+czb8Iel4Y/Bcqnm+TAIQ2IWY+N8WQQNoVQW
         454A==
X-Gm-Message-State: AOAM5303Kabt3/SQs0F2ZqqjXgUMVWgHtfpuSN3KQSjah1rhSgs5TrHZ
	RbZ8DVftZKsqj7z+vuE1YMrCRyW6KcBOfg==
X-Google-Smtp-Source: ABdhPJym98EELWckFXj1pmcwEmvnOy20fz9La/rU2UL3mYhxEvkou5tMiefPHZX80cPa2Y0tKIcTFA==
X-Received: by 2002:a05:600c:293:: with SMTP id 19mr17087577wmk.179.1627918924252;
        Mon, 02 Aug 2021 08:42:04 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c])
        by smtp.gmail.com with ESMTPSA id 18sm4201682wmo.2.2021.08.02.08.42.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:42:03 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] vim: Clarify where RDEPENDS/RRECOMMENDS apply
Date: Mon,  2 Aug 2021 16:42:03 +0100
Message-Id: <20210802154203.3453585-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tricky of using BPN in a common inc file is rather hard to understand.
Simplfy this by moving it to the base vim recipe and use the standard
variable form.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/vim/vim.inc    | 4 ----
 meta/recipes-support/vim/vim_8.2.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 9e4117466e0..17d1c24a7cc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -140,10 +140,6 @@ FILES:${PN}-common = " \
     ${datadir}/icons \
 "
 
-RDEPENDS:${BPN} = "ncurses-terminfo-base"
-# Recommend that runtime data is installed along with vim
-RRECOMMENDS:${BPN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
-
 ALTERNATIVE:${PN} = "vi vim"
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_8.2.bb
index 3c1b98dca08..f358e61132b 100644
--- a/meta/recipes-support/vim/vim_8.2.bb
+++ b/meta/recipes-support/vim/vim_8.2.bb
@@ -2,6 +2,10 @@ require vim.inc
 
 PROVIDES = "xxd"
 
+RDEPENDS:${PN} = "ncurses-terminfo-base"
+# Recommend that runtime data is installed along with vim
+RRECOMMENDS:${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc ${PN}-common"
+
 PACKAGECONFIG:class-native = ""
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2

