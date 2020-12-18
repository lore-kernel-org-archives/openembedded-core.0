Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.4817.1608263904737058044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 19:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TJtcc5X6;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: dbaryshkov@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id m25so1899251lfc.11
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 19:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3wsmXvfdMG/H9KGckIJ5zLzjF5GWjiSKuB5UfaSgpU=;
        b=TJtcc5X6IR2M/E9tqoNX2MdeJpDFY+ZRH0MG7qo43Z5KI20liF03xM3R3DUOUNmKqz
         7E5+vpmRwFfRlR1jup9ufvYp1+0oP7XN06rFJGcV9B9VE58xOftBEVWPtijvYbcVKAch
         ByNU4U+FYT+IaJcVsNRz8GKlrXyGXYdEpF5Aghx2MiYV8N3btxuAGXrp10H0xZn4UK/E
         eC3JlOlQ03jxu81hmCIFuiAw0WIv5bLTlBIzmHAaoSiWugASRyigWnJT/9m9fFhQmNZf
         hT7fEz9rqekUfJZObu2xr016MJhwkvjieKejYCEysx6uhKcjAPkqK2r7t4cl7EQx5kBv
         9qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j3wsmXvfdMG/H9KGckIJ5zLzjF5GWjiSKuB5UfaSgpU=;
        b=U3RACqY/6y1KnE579c761EIxEJl+nYYQVcD1xwEx19FpNcYMeYroh2WNm/Levvr6Kj
         2UAU6fpO/z2DJCgp/1oyA2tWaEj7lSlvIFzU0ATGoqu8Wy2cTvd2KRgo9E7h59z3Ty4V
         GLphNfltSrvX/4FeSa51ro1qasMqkh97h4VppinfwJ59lNP+QivMgdsrJJPtvL8+k/eX
         OhPZqcDKoKoF6yEamo4bCecx+ud2HAB/yehBM8ytcAuMJAcuvimQaOCnrvH9jw2es1oS
         RX7u09Y7hYXWkkBp/eT+HBDnYWEPgT6f2fBnCL9O6iEPTag17Mn/xCMKbewTQGqwtiBW
         mR2Q==
X-Gm-Message-State: AOAM530aFMDtBg3B6pC1OrjqSSI/60bXRlWEPR91WtPM3HYU2OFnNltr
	+g5WZXB09Jp+vWlt/026Q3MD9z1Li0vQfA==
X-Google-Smtp-Source: ABdhPJw+ruDrMdbzDE0hlZ68UXaoCBMYRMSiDWg+F0ECTpQmu6WVYAzkpXwHZQxIPzshc8NBuMztiA==
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr928185ljp.26.1608263902905;
        Thu, 17 Dec 2020 19:58:22 -0800 (PST)
Return-Path: <dbaryshkov@gmail.com>
Received: from umbar.lan ([188.162.64.233])
        by smtp.gmail.com with ESMTPSA id z17sm790534lfg.275.2020.12.17.19.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 19:58:22 -0800 (PST)
From: "Dmitry Baryshkov" <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [dunfell][PATCH] perl: fix installation failure because of shell issue
Date: Fri, 18 Dec 2020 06:58:21 +0300
Message-Id: <20201218035821.9917-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

On one of my buildservers I noticed perl do_install failing with the
following message:

| rm: cannot remove '<OEROOT>/tmp-rpb-glibc/work/armv8-2a-linaro-linux/perl/5.32.0-r0/image//usr/lib/perl5/5.32.0/*/CORE/libperl.so': No such file or directory

I tracked this down to shell being dash rather than bash not being able
to expand this glob in the middle of the filename. So replace the glob
expansion with the simpler one which works in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-devtools/perl/perl_5.30.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb b/meta/recipes-devtools/perl/perl_5.30.1.bb
index b53aff12160e..ee6eb6ef0f01 100644
--- a/meta/recipes-devtools/perl/perl_5.30.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
@@ -146,8 +146,9 @@ do_install() {
     install lib/ExtUtils/typemap ${D}${libdir}/perl5/${PV}/ExtUtils/
 
     # Fix up shared library
-    rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
-    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
+    dir=$(echo ${D}/${libdir}/perl5/${PV}/*/CORE)
+    rm $dir/libperl.so
+    ln -sf ../../../../libperl.so.${PERL_LIB_VER} $dir/libperl.so
 }
 
 do_install_append_class-target() {
-- 
2.29.2

