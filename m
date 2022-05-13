Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFF5C433EF
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:35:31 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.8350.1652448929799292846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:35:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=H3AOI6Or;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id l18so16286947ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ex7INkUQUixoaht/amNyFjhP+UmbDvRSg+LqBiWTCrU=;
        b=H3AOI6OrafRImT0AJopP0Prz6f/3Pf+oeWwxmszGj287puB8tLBUg7OmuXvjDkrUl1
         IvVWBlSGbM+avktO/KrGCKCJaxldVRjny3jJ5XFSAQN24UrkM184zOwl8MX/7887J7iM
         AqXACzstZsZoA6laRf/I3X8h2Oyxj473DF1ByvTWcFvxSV32/U3TCn33yB5gkbX8q5dt
         QPp5kmAouQKO4Jeq0QWpfx9pzgsXmml4xS+gbMVFX3c6smH21JNgmP6BXo3rqLOQ3MTb
         E0JwSJREMWVC6FH84AxCiLQF4IWiYdj9FlHLFBvadezw3vZPKlgCV0BWlpXPoZxKjvTM
         HeEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ex7INkUQUixoaht/amNyFjhP+UmbDvRSg+LqBiWTCrU=;
        b=P0TGxbrSdwV2f3/C7H+ER08liJKnwRW3bOk945x4OrL+gUk7RCxKugaKI+RG5N6wMn
         9vHGM31MT5iUSf6P11S8pvHlbEIVAUw9+ApmDAYvrcnVl8xcm+7WRVOVHcp27ewCsHLo
         XxZBmTChKPlXhWCu3MS17sJDgfRhjDnaPs5jgLB9u8O0UIuH0e/UlC/zNiwA9N8deDbV
         gUOAzDhJVodsaoH1wZtZobsaFfs9CwKe4jQqiUeDT4/W5mJNwrgCEeTzUioi2AiGGfSr
         kGjvGiUP47Xly08qhpZ9+ileMn3nBzwQlRcw+rdf3Rg5DUSXvdYUkNcGy4CGvG8MbqC7
         ykeA==
X-Gm-Message-State: AOAM530CmyV85K6KM+oLfSf0Ci9LQ3Udn9tTY64O4uLrdTrLgPsiKeb3
	PzPaKMiKMDWyafp1hvrJ2uZAcEy0gRc=
X-Google-Smtp-Source: 
 ABdhPJyoe5R//lgaeneaUDrtcr04cHJ2BV/xPOv3HNyLzrT2XkIGhvS0FlmZycXoyfRzk4MML4zSRQ==
X-Received: by 2002:a17:907:d87:b0:6f4:dcc2:a40c with SMTP id
 go7-20020a1709070d8700b006f4dcc2a40cmr4160230ejc.106.1652448927753;
        Fri, 13 May 2022 06:35:27 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 j2-20020aa7ca42000000b0042617ba63c6sm956888edt.80.2022.05.13.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:35:26 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH v2] openssl: minor security upgrade 3.0.2 -> 3.0.3
Date: Fri, 13 May 2022 15:35:21 +0200
Message-Id: <20220513133521.904120-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165563

This minor version include fixes for several CVEs

CVE: CVE-2022-1292
CVE: CVE-2022-1343
CVE: CVE-2022-1434
CVE: CVE-2022-1473

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    -v2 add kirkstone tag in the title
---
 .../openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
index a809666aa7..fd88ae807d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"
+SRC_URI[sha256sum] = "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.32.0


