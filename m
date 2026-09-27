Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C077DC9832F
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 16:46:46 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39683.1790527599481046156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 09:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LxFzXavu;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.141, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so22039885e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 09:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790527598; x=1791132398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nbdsbcuLixjL8c4f9jQnU9nBHE1QZ8WMyfva75mF+jA=;
        b=LxFzXavuz1mphiRUVcDt49KkZybl68RF1xKVxWMSWVMJ7SShmjeeOwOWN2FsWLuREs
         elt6CexvXXAGUrofOv9yjYRXah0KagtoJ1b4I+YtIZd2hB2/UDZkEQRcUVtmT7J8dZy7
         owisOukTuqIMne2tCC2IniBTglKXlEm7j89Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790527598; x=1791132398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbdsbcuLixjL8c4f9jQnU9nBHE1QZ8WMyfva75mF+jA=;
        b=S5KWErW1SH+gqm73vGQRyOCTzH1F1snUqcUCmx3Fq+dCZeivud6Mt3fyaX8Jj70FLV
         IyHgdLzfD7hQd25b3djOX3ojj2rWEKzrsbLIi3RdeCJy+P+lGtnFZqHtOEp3RZELiAsT
         mdlYUUV8cWHWRVLPg5a72DnNRXq3oppwH8fXO+2X7+ZkQo4KTgUWQ4dbQkJY/1vPqjZc
         gzpCMG9TlHEnTqtGYXFeoaCRhhs2eVjTd7nPYrT2FqbgPzR4UP009BoeeLPwhs75JzNK
         7oBLaBI3l+i76EoSWfa0GhzqRBkJInrcKDO+KFWP3IsO9CLDVdgOODBCz9NvFmW1lCkv
         yC8A==
X-Gm-Message-State: AFuF++mIdE1SWGjaIMOjVv4sHG1lkpXYF0vAD8bH7gpHYnqIyIe2rUD4
	Dz8Lj6pjV8Bo52UVim6QXzPXHyuxH6F6WA5URlYEpltCSCsHde6f9b0+xBENw3x+IzE2AnKXKyC
	tiPokaKk=
X-Gm-Gg: AYBFou0v7EdTDYZh/iO/IRcXpQK91MLYsYNufJfDon0XgzeQ/dHgrA5NS+ymSusu74s
	TJD9GvHSclKFWjX6e4CTSvQMtPJWopyKTctaveIpgF81Cm+pxs0+8uHHqyt1YigyFGeKLT2gMJQ
	VE4YnKUlBheY2Li0FOswXcbAxxUHbVGLEa8RQID2Ps8EDCCrrvExIQ0RleI+txc+L79lNo9kfjK
	NzTHuZbPIA5YaHKlyvxAoomIMnheZdoRqY+C6rubLt5irQRWUlHz2031Oz7/zyZc8ntvPZFVIWV
	cc5gcY7BGzFw49jbsggaxJwG7iI1VWsd+C9cJuO9AQAMwmuO9rw0r19i69DmQDhD6EVCytUXNiy
	qNN12NRmViSvSIyVZgKrV1J8LcBI0o/b0hyAZBOsHtBBYgvd1aD9Wzl2hsZo8yULOfcoiX76ocn
	luhANDH9VLdnKQVoyLstxYvUEM6e9Ji37TfXFkABGODg2KVqo5PhpJyN3Tp8RwouCoobLcKC0N9
	ND2QTiFXO+kBMaEmQRiqk6SHhI=
X-Received: by 2002:a05:600c:4583:b0:49f:d087:6526 with SMTP id 5b1f17b1804b1-49fe670d05bmr211892205e9.34.1790527597727;
        Sun, 27 Sep 2026 09:46:37 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6474:fa9a:9a9b:3f85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0029203absm54683365e9.6.2026.09.27.09.46.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 09:46:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] diffoscope: upgrade 330 -> 331
Date: Sun, 27 Sep 2026 17:46:25 +0100
Message-ID: <20260927164631.2484854-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
References: <20260927164631.2484854-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 16:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246692

* Support radare2 >= 5.9.0.
* Update debian/tests/control.
* Update copyright years.
* Add support for .nar files via Guix.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../diffoscope/{diffoscope_330.bb => diffoscope_331.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_330.bb => diffoscope_331.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_330.bb b/meta/recipes-support/diffoscope/diffoscope_331.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_330.bb
rename to meta/recipes-support/diffoscope/diffoscope_331.bb
index 87c20546d85..3c64e123181 100644
--- a/meta/recipes-support/diffoscope/diffoscope_330.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_331.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "92fb70b930077282ceaf104b4eb02c6368c860b0c89d6aab98f0a55682ee0361"
+SRC_URI[sha256sum] = "298a62c374f5d60dd3d3af38cdea21cbad7148c84dbfe9cc5a91fdb1b5af4e37"
 
 RDEPENDS:${PN} += "\
         binutils \

