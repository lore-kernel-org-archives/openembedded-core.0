Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.7084.1631609831053735419
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 01:57:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KFKJxgKM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x6so18914025wrv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 01:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=O70FmoBoKgDa/OEi1TVZQEvjufQhtPd5+WWHnMPZHCc=;
        b=KFKJxgKMfD3+ZtWOUqVyIk5U+MWktsl++KbMokWnt/z2JXHJLvHbJaucoHFzTL/T5K
         vuTGZo5wJmfrky+yVm4U+GhmYPOvJf+3FnS89TmqWMpMoFoVjjpDW8UZYfFKNU4bpiJI
         w2WF7hRjrAbRRsVKE46ZEPbyojOkUOvwdBIWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O70FmoBoKgDa/OEi1TVZQEvjufQhtPd5+WWHnMPZHCc=;
        b=rBbo+1WeP2GWLH+ZEomSkzf8ThGtwyPH45augnXuMa/k/yrquEyYs8APTrxp1JEZot
         fDn+20e5tmYeqK5NYDGwcmzNDtCRR16UUG3OVYrsIz6sJEbD/1UvY0bExZcyLhQ0gVn5
         m92rBoyE33snkj3g3nv9BIn1i/cOQ7DieGZ5Vm9DttIs17/W4IvV0b5EC0uxS43jLxkz
         ZcKp5vdZPdgO1UGULhB77jQnV0ehvcg8X4kuVqzgRE12IfNZ9AeQe18Q8LkEioGIF9IV
         4l8qGNlqMzPVGUk0ABkwuh6KsJcTwKJuDC3hYveD3jJHwWc4piHTkK2EB3WSLiFr0/Kl
         HDHQ==
X-Gm-Message-State: AOAM531QvkATyqk3YjMvx5MFmxQ/HaYh+pO04ZjSFcbwjzgNlVH9QHea
	eXDIEtuDLNd6XNTKoSPjzE43MZ+ZnCDklRc0
X-Google-Smtp-Source: ABdhPJx7wRCOMlmSlqpmJrtMz1qYYaatJKC7Jg7GluiULZm3aCuNDtejAnl0uqOVyZ4GTRGYL/DnvA==
X-Received: by 2002:adf:f890:: with SMTP id u16mr10919096wrp.388.1631609829117;
        Tue, 14 Sep 2021 01:57:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2da1:111a:66bf:1f1])
        by smtp.gmail.com with ESMTPSA id k19sm484683wmr.21.2021.09.14.01.57.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:57:08 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] bash: Ensure deterministic build
Date: Tue, 14 Sep 2021 09:57:06 +0100
Message-Id: <20210914085707.1367456-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
References: <20210914085707.1367456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bash keeps a count of the number of times make was invoked on a directory
and changes the output versioning accordingly. We want deterministic output
so disable this behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/bash/bash.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index ca788e1672d..18874a0e24d 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -62,6 +62,11 @@ do_compile_ptest () {
 	oe_runmake buildtest
 }
 
+do_install:prepend () {
+	# Ensure determinism as this counter increases for each make call
+	rm -f ${B}/.build
+}
+
 do_install:append () {
 	# Move /usr/bin/bash to /bin/bash, if need
 	if [ "${base_bindir}" != "${bindir}" ]; then
-- 
2.32.0

