Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.6715.1627822138930295104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Aug 2021 05:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VbqQIk/3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id n12so18056601wrr.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Aug 2021 05:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/9bmlHktiP5wA8mNsbrZDFJNcubU9ImTJYYdhrNRNQ=;
        b=VbqQIk/3jM4SKLCIVR8XdNSF7u40HrYPqZyUI3a0Rjacj5NCab2AMJWm7B/5N0RVwp
         JznVag1O89LlUIrKWP5GT1jpbSgJ1WN709x1ULYz43WFQpT+bAsHcjlUw7Rq7+eSTfbE
         jGjH+mK+RTtHyMMStOAWD9wxSsbYV2GgbPbMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/9bmlHktiP5wA8mNsbrZDFJNcubU9ImTJYYdhrNRNQ=;
        b=lKvxeOaQ6XT47z1SJLz0vWi3BKEeYc8q8WOe87sVWry01fPKU09j9TH8diYOCB7yOA
         7PU25XbdWjTrsupW44FQbAYiZXl+kYU/cRrrBs6RzJ26qyR+1yXrGp346IIM273vRUy0
         QDuSICu+k7EGqG3sCrD4Ff7p+ox4kuIPiRV33G3oP30c9mv7iX1P7cRVEu3UxT0+uC/M
         UeowU18GaICwv58+CiWd2YXKnKAuNXufMi3uChLDIYQQ9tJbIHHn+RBJcrTG0ynALaYP
         vm/nqYH9GbB79jThZAJr5VAOeHs0hmUjcXUXOWVtZryLsh4C+rjs5ElM7piopoQuSwLH
         lYJg==
X-Gm-Message-State: AOAM532JtR01uR/NqGZ/c2TDOKt06hmNP6mMkzMy3CVrWRDnZaeBPOko
	WrtI7bxA+NyB9xWNtjTyjFMp/j3yLsnBbg==
X-Google-Smtp-Source: ABdhPJwjbTp1NqByjb3Y5eLufhE+TJA5SWuv2aTFZ/47Jok2OSZZCdOqvzyX/xi8ldvqst2vkacqTw==
X-Received: by 2002:adf:b31e:: with SMTP id j30mr7013697wrd.139.1627822137282;
        Sun, 01 Aug 2021 05:48:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:9bc2:7fed:cd2f:1c0f])
        by smtp.gmail.com with ESMTPSA id m14sm7729790wrs.56.2021.08.01.05.48.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 05:48:57 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstate: Fix rebuilds when changing layer config
Date: Sun,  1 Aug 2021 13:48:56 +0100
Message-Id: <20210801124856.3413781-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When adding a layer which changed SSTATE_EXCLUDEDEPS_SYSROOT, the state
hashes were changing when they should not. This was caused by wider use
of setscene_depvalid which means the dependency on the variable was seen
when it was previously not.

Exclude the variable since this should be be included in the hashes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index f6710fc2835..554e401ee25 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1018,6 +1018,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
         bb.parse.siggen.checkhashes(sq_data, missed, found, d)
 
     return found
+setscene_depvalid[vardepsexclude] = "SSTATE_EXCLUDEDEPS_SYSROOT"
 
 BB_SETSCENE_DEPVALID = "setscene_depvalid"
 
-- 
2.30.2

