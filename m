Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DCFC88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 09:52:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19504.1789465953031261798
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 02:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=doFV03tU;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso35062395e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 02:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789465951; x=1790070751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGIpEYaWpKxjothJamxueVu7P8mouWPzCJdS65AhVt0=;
        b=doFV03tUkJW4UtKGNSYvnZiuJ0jjakANcioJLCE6R9AX/OOnUP+lrp8t7eDmCUt47P
         rNt6FuBgy0F/zIbZGLuK7/3DI0ZGK6hCpWs4uBXbUimkmnd5L8SmF0jnENvJwikUKsXv
         zNbJEAjOXqUs6W8q4/630XR6HMKtcPMkS+5eY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465951; x=1790070751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGIpEYaWpKxjothJamxueVu7P8mouWPzCJdS65AhVt0=;
        b=fFYqUI1IK2qTJLsrF4XsbUTYjYyJmf+9mDwrbDWnaJZqkgaRvua8X0lFPYjiCCvapG
         ZiIkQs97LLhy9z9UEnVgZzcuKzxy5i6AjKa+2cLsO9SqcZREzB1NEjLYFTzZVMifKzOa
         LmG1xmBlF41iewnU++Ek1e5m7juxaEPpZyNRFopTDrxjD400V5vW681YglcAgzN3g7mK
         KkeY/wkjrEhRa6xBeVS69VsMvESEo/ixICqc3OZPMcvlTvMTXikUxf0n9dc1SQynlsVu
         IKmlJMMkQSjwwcfOyMO1gDpJPFOvAwSnwnQtNyqXZhbJBpW5JTelAOVhiOVMrdWnfAGi
         osBg==
X-Gm-Message-State: AFuF++lqdPW40BGV1OptrRMUbSBSg6YyerdV50yHrZCdvAmZ0EF57xFS
	TjPOgU81hx1ouWmR3qq8RR7oguzIfip9j4OxOEeHewg3+M63Sc172YQsk5VE4ZNkBbAInIrLnmv
	9T4j8xoA=
X-Gm-Gg: AYBFou1wso5edOJA+E6Aegk5BG7NwSVA1f2P3FMR80Eb84+mtiXaAj4j9vZ93CofYs8
	eMq5/noPrlQRTNtNM41RE8xr98r46qNatPs88jqmezHyLpeYV8rf07hwbI9+393tP710lxFi5e4
	nudLxp6igYUohEG5yo1ooNj+JzHpE1hIXqkQkc4+cDhO5dy1jKaoa8Inm+LcWkQ3r77VJpjVMQH
	4JMLMqxIgfOvH3dnpBpjKhfUXeoquLl0ncG6QCWhS9ZpGxoAyKrnONt+x83or43sIZE1sU+dAVB
	4JmgrPCgGwaEK6M7+eQT1LmEyc7KUv9M1uhUwEB01aKGtmy3g1gUfioQskQXpBLJMbb6BBtw6yE
	SMS3h7mCfEHMSTFo7/IG3Doe4ZbLMqc/ElpJNr8DCwYZJp3nzsR4q/XMYys/nZfeL1aLQd8Rt4O
	hrowpQfDoVF9CW+dTh/Z1135Q+8sFf7fH097VJgPPjrl7pq2uhAc5hlTWqmMRmIhD0mFVgEnRgX
	rW4HqvurN5Yx0I4pd360PgO47wx
X-Received: by 2002:a05:600c:a00d:b0:49e:663c:c69f with SMTP id 5b1f17b1804b1-49e7a686db5mr182862485e9.15.1789465951064;
        Tue, 15 Sep 2026 02:52:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fe92:a101:5d63:1ea8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d69f6d6sm62617775e9.8.2026.09.15.02.52.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:52:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] gcr: upgrade 4.4.0.1 -> 4.4.1
Date: Tue, 15 Sep 2026 10:52:25 +0100
Message-ID: <20260915095229.2292237-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 09:52:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245831

gcr 4.4.1:
- gcr: Support zero mtime
- gcr: Fix memory leak in GcrSystemPrompt call closure
- docs: Fix a method reference in gcr_prompt_set_choice_label()
- Updated translations

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-gnome/gcr/{gcr_4.4.0.1.bb => gcr_4.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gcr/{gcr_4.4.0.1.bb => gcr_4.4.1.bb} (95%)

diff --git a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
similarity index 95%
rename from meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
rename to meta/recipes-gnome/gcr/gcr_4.4.1.bb
index 493c8c2a0d0..93028d2497d 100644
--- a/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb
+++ b/meta/recipes-gnome/gcr/gcr_4.4.1.bb
@@ -16,7 +16,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gi-docgen vala gobject-introspection lib_package
 UPSTREAM_CHECK_REGEX = "gcr-(?P<pver>\d+\.\d+\.(?!9\d+)\d+(\.\d+)?)"
 
-SRC_URI[archive.sha256sum] = "0c3c341e49f9f4f2532a4884509804190a0c2663e6120360bb298c5d174a8098"
+SRC_URI[archive.sha256sum] = "c4442c15d4330f17a1f5194df08c576877af68412ab2521446a93bd5e24c931b"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
 PACKAGECONFIG[ssh_agent] = "-Dssh_agent=true,-Dssh_agent=false,libsecret"

