Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA1B8C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:58:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.7449.1645801113745080204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PrxjAdCz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id j22so4877446wrb.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=9/kz/6mcCtHBtAGnnUJASyhp3aXvcVITxQEsX4yGDaw=;
        b=PrxjAdCzLOw+Zzk97/SnzK+c2RRkLZ46d9XbEUh/bTCCaqK31nHA1T7yBihlal8g3B
         Gk0Fkz7DlBkhL4ik06GzkG94xp7CM1iC6CbrYkXQ1fDZGlNfxxnku9sf3tk1F/iDv0LF
         e24kHu8UeYZf0GA4eO0lWWGdjyNBP2VdTdnSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9/kz/6mcCtHBtAGnnUJASyhp3aXvcVITxQEsX4yGDaw=;
        b=1+6IHKSaOC33BIvJz562G1voShiK/jOin4u3WjI/Todlo6a/rLADM0lBmt0oX3Qw4l
         tmN4zvQ90mzi72yW8VYZ8WpxxxTGOO7k9Wrkp3o2RF3pb4UHoRR48YVxdhFR+HFokZ+v
         x1rSFKyogC66clWSyoQdmY8D8k+5+1PkJWmlFwl3//0ltcgJaAuPg83acl8sgB0vggcT
         ByFTjAWwe/PJ0h7Ljm+KPXwfDsGYSU8tPHnSgBC1eBSnuFU0m/jn39ZaBezYdBjXixWz
         Me7/BBBOqZ8gc5qemJJdYfLyDiSToIp3+rp+Kv3tT5nDcpAR939XE2+LHuz2WJG+nOgD
         gqAQ==
X-Gm-Message-State: AOAM5302iVvoOVXnjBAeJ/GMdJJDZ5r7/wO6zOmohg1tF9F3KZpappTQ
	XDCQyXK52f+uoWPMV4a8gDzXo0onypCKKL75
X-Google-Smtp-Source: 
 ABdhPJwOWGW58twbe+43l3pue/BpqVdKf/h6pKOPYsAdZ6RnmeYf5qFYj3UJx9g0IcAkWk11JtNihg==
X-Received: by 2002:a5d:6148:0:b0:1ed:b74e:508a with SMTP id
 y8-20020a5d6148000000b001edb74e508amr6215658wrt.90.1645801111785;
        Fri, 25 Feb 2022 06:58:31 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a05600c35c200b00352cdcdd7b2sm17121733wmq.0.2022.02.25.06.58.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:58:31 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-numpy: Fix pyc determinism issue
Date: Fri, 25 Feb 2022 14:58:28 +0000
Message-Id: <20220225145828.88238-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225145828.88238-1-richard.purdie@linuxfoundation.org>
References: <20220225145828.88238-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:58:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162401

Using frozenset causes problems for pyc file determinism. For now remove
the problematic pyc file as we do in the main python3 recipe.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-numpy_1.22.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
index d2b2f3e38d5..43e7427eab5 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.22.2.bb
@@ -30,6 +30,15 @@ do_compile:prepend() {
     export NPY_DISABLE_SVML=1
 }
 
+# Unfortunately the following pyc files are non-deterministc due to 'frozenset'
+# being written without strict ordering, even with PYTHONHASHSEED = 0
+# Upstream is discussing ways to solve the issue properly, until then let's
+# just not install the problematic files.
+# More info: http://benno.id.au/blog/2013/01/15/python-determinism
+do_install:append() {
+	rm ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/typing/tests/data/pass/__pycache__/literal.cpython*
+}
+
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
 
 # install what is needed for numpy.test()
-- 
2.32.0


