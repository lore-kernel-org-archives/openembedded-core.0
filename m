Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by mail.openembedded.org (Postfix) with ESMTP id EEAD07FC09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:46:16 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id y6so27985691lji.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=I3pT07Oqimvh5EVHlusSnnF/iNsrvs89aYDq1FwbSIE=;
	b=oX63rM3DtmoccdcYg8602cckHIM94Bk8ohvMS2fVmt2H5habMEgqwomO9IfQMfRh6Z
	+oVebarI+clltYVRelsbmLVISVwwHbbwtJd5gKuyfVWBXmITaVq3nE8Q9DloUtykQkW/
	KiqyWuFYFtprBmK9g5OjykxmTPJDI2H2eNez6YGaYQFTOmLzxUqzJ3Zc8NjvayN0TIcJ
	J31rlwQoOkB80mHryHofIbTBAizC7c5Dbjzld/A4rxX2sc8/1cXoh9bv7EPCB8OjFGh8
	Bxbmf9uuELWTAe+Bff6mFlY1fEjnJqMHsRbLTVRHXHBNwBkSmNC/OLljDKqe+C2eVdzg
	ZJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I3pT07Oqimvh5EVHlusSnnF/iNsrvs89aYDq1FwbSIE=;
	b=nfvzVCAcy/PkTSTk16uNC4lehuo0oergri6sK/y7eqh7aw4+y/YKUsYt6PqoLhWOg6
	Tnzo5vjrKvFQube01UktM3DYH0Ennf1UBQyadLTqJxg2FER1jtXvpfqHdARuexaY8ZOG
	ohqlIAOvYiuoIc5NPYV1F93nRsPdSSrR8rVcjx38IFGcLZ8Vl8O4csnBf5BLCAAIOMKX
	KwUbwJ2mb9Aa+iX9TqCxCZt/m4MgDrGrmmblYyIqNyU3aP66Yo+Y5UAMDihaM639Pyr+
	uzxkTirUenq/h662GOkgAriHIAKuHZOzi/La14iWGWS3ZcO5ldb+ubpImbisI1c1FQJG
	5Ryw==
X-Gm-Message-State: APjAAAWU6NnZUmh9UQW48U15oYymt+Mphud4ITBONDrOdhtDQfOoovjx
	DMjPBz22NQWlvZZHSYB09WZHxFzyKPE=
X-Google-Smtp-Source: APXvYqwlvFOzLb9Anp75y+Oi+FKf0irq8Q7qqOXG+C14ZIbMrdSxKo9Eo4GUnO+cDwaUvvuloMK7KQ==
X-Received: by 2002:a2e:974b:: with SMTP id f11mr6908480ljj.173.1579297577098; 
	Fri, 17 Jan 2020 13:46:17 -0800 (PST)
Received: from localhost.localdomain (128-68-30-100.broadband.corbina.ru.
	[128.68.30.100]) by smtp.gmail.com with ESMTPSA id
	l1sm12582104lfj.71.2020.01.17.13.46.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 17 Jan 2020 13:46:16 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2020 00:46:12 +0300
Message-Id: <20200117214612.6204-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCHv3] wic: fix images build in parallel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Jan 2020 21:46:17 -0000

OE wic plugins create temporary file with the index of the line
tmp file name. This causes race in case several builds run in time.
If source_params['file'] is an absolute path, the cr_workdir prefix
is not applied by os.path.join(). So instead it writes to a ".1"
file next to the original image - this is outside the WORKDIR
and at risk of collision.

Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
Suggested-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Suggested-by: Paul Barker <pbarker@konsulko.com>
---
 scripts/lib/wic/plugins/source/rawcopy.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
index 82970ce51b..3c4997d8ba 100644
--- a/scripts/lib/wic/plugins/source/rawcopy.py
+++ b/scripts/lib/wic/plugins/source/rawcopy.py
@@ -57,7 +57,7 @@ class RawCopyPlugin(SourcePlugin):
             raise WicError("No file specified")
 
         src = os.path.join(kernel_dir, source_params['file'])
-        dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'], part.lineno))
+        dst = os.path.join(cr_workdir, "%s.%s" % (os.path.basename(source_params['file']), part.lineno))
 
         if not os.path.exists(os.path.dirname(dst)):
             os.makedirs(os.path.dirname(dst))
-- 
2.17.1


