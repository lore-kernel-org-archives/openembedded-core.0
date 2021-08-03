Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.3496.1627988778701791514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 04:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gvfunZrZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id j2so24803411wrx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Aug 2021 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UbQkXtmhnuHmcm2uIruDlmtCVe0HXPHgJXR5Mmr53UE=;
        b=gvfunZrZtOFsKN+ravutwPFttkGkViy3KKm9HVdcwsFGivG4dmEdF0YmwNiVfRaDLy
         viDWkgmw7E1jhig718KER6+OpD8cUKX32SYNs7lKUuCt5u1htyV00VJkVkIRZrk5N5q3
         xNUoTAfo+NfI1A8FwtvWmEq78XT2YwzfLlH+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UbQkXtmhnuHmcm2uIruDlmtCVe0HXPHgJXR5Mmr53UE=;
        b=LrIH0bKYhrOOuiDfMdSMmv8KNhD1LIVt1wO/LFruicwCpSx++tZTE1GjTl+ynsF+Px
         4LPYncXnnRuJqP9ZAofi6WhofA20ZA7AABEp8VCbapQhRvZs6nhrJcKf79btVYv5rn38
         9ifrDbyyTA93ujYvhhgYrSjYzWZBnQNW/BAUIHDoZdSKXFOpOqHivN3T39VgJWC8Rh4G
         TJ7wtpwcbbB44A/MEbCOq+RzVYiVWRDK+yf1xl5JpYvXNzx+rIYnoZwlUou683Be0FA1
         CzA6SX0UnNsJimCVHo6gkISFgrO5dVmAm27IvLzFjI4P1zj+Sh2MXIBn10ocHuBM1xPB
         Pg8w==
X-Gm-Message-State: AOAM530bqFDGQNHHIKrhRTczQSl69vFSTn4EUqgqwQY6zn7akSBqWOuP
	btFFVzrKq46aBOJGwkQx/3Aa2tjyOO6+mQ==
X-Google-Smtp-Source: ABdhPJwEokfVGKBzNzjMY3qornl+qqiQYrLBroE55xMYV8A95sCpOX9WYH77qGxMf0fOjviilxZSnA==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr23242963wrq.98.1627988776198;
        Tue, 03 Aug 2021 04:06:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:d842:2a89:2bc7:1229])
        by smtp.gmail.com with ESMTPSA id e3sm14986296wrv.65.2021.08.03.04.06.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 04:06:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] license: Exclude COPYING.MIT from pseudo
Date: Tue,  3 Aug 2021 12:06:15 +0100
Message-Id: <20210803110615.3477674-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Along with the other license exclusions, we need to exclude the
top level COPYING.MIT file else when:

COPY_LIC_DIRS     = "1"
COPY_LIC_MANIFEST = "1"

is set, we see eSDK failures from a pseudo abort.

[YOCTO #14366]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/license.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index fecbc494970..45d912741d2 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -31,7 +31,7 @@ python do_populate_lic() {
             f.write("%s: %s\n" % (key, info[key]))
 }
 
-PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '')).split())}"
+PSEUDO_IGNORE_PATHS .= ",${@','.join(((d.getVar('COMMON_LICENSE_DIR') or '') + ' ' + (d.getVar('LICENSE_PATH') or '') + ' ' + d.getVar('COREBASE') + '/meta/COPYING').split())}"
 # it would be better to copy them in do_install:append, but find_license_filesa is python
 python perform_packagecopy:prepend () {
     enabled = oe.data.typed_value('LICENSE_CREATE_PACKAGE', d)
-- 
2.30.2

