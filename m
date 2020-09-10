Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.20754.1599740681424988735
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EiYuj7O9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id j2so6480896wrx.7
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EGZzhQtZHPE7EHpglD/VcS5dH3jubGZqsvm/Zz/2pRA=;
        b=EiYuj7O9xJgIAM0oxoLqFw9w+8HRMeOyqF0keskLeytWoT9qYBILqKMjfW1Y3XhyD/
         aTNhpa0copdM6hDwRzhpZ0dzQwucAIpGaS/GuoGV4QOqnz+reT8mF+9lvjHsBCdTQmDn
         b/5b5PvAavdd66aJ1istQESR7DoMg/ZZ5Hwvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EGZzhQtZHPE7EHpglD/VcS5dH3jubGZqsvm/Zz/2pRA=;
        b=kuCv7dBHALLhhdmjwjbKahqHWYbKqwm8rjFg3S56VDmWZXptOe2K3XqNgnthPRHwxs
         V1g9j3IrtgoNdiMJjEMaYtLB9ctB+nEQv83RlUb/M4o5x/iTmn2WRhkRJdHt5MScgSOH
         jJ+9xZjAOv0FYzacuqBZFwF3t68F04CHfSQhTg2aU11V9c8paFyYwUy/cXq6oeAGidwz
         ibB80NvFiQUeDwr5AFz+ga55Yx7wocaaRZ6nk49KrpdVCB2ojB43I3NF2RkwE/O0Yq2d
         Se7sGIEP4+N8kQ0kTolQZ6lKfDvzrdiw2MB8d/PLQc7v5ZMRJF8xPLiaaMoG72RbkK2H
         s8yA==
X-Gm-Message-State: AOAM533LYw5S0RwE23fzIuPASRLWOGe8gFdEGgwB0ieaqc1RjEbovt87
	Q07piO9hCqyD1QrPOe0KQqKU6m1JUYQZ5w==
X-Google-Smtp-Source: ABdhPJz97AjyHK+jVwykyiz9F6WF33nTivYrOv0Z2QxsK2wCD+AvdP1PeFwnQVp2SvwV+pIcniRPpg==
X-Received: by 2002:adf:fd90:: with SMTP id d16mr8867131wrr.52.1599740679464;
        Thu, 10 Sep 2020 05:24:39 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:38 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 07/29] files/toolchain-shar-extract.sh: Rework PATH cleaning
Date: Thu, 10 Sep 2020 13:24:11 +0100
Message-Id: <20200910122433.2040293-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trying to create a clean PATH breaks cases where we install a buildtools tarball
on hosts to provide newer versions of gcc. Rework the fix for #8698 to clean up
directories in PATH which don't exist isntead. Do it with python as the shell
version was too fraught with corner cases.

(From OE-Core rev: 7674b63819aa7ca95ca5ca5477a5cce32e9691eb)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/files/toolchain-shar-extract.sh | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 9eabd626308..6c4d14a038b 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -1,13 +1,8 @@
 #!/bin/sh
 
-[ -z "$ENVCLEANED" ] && exec /usr/bin/env -i ENVCLEANED=1 HOME="$HOME" \
-	LC_ALL=en_US.UTF-8 \
-	TERM=$TERM \
-	ICECC_PATH="$ICECC_PATH" \
-	http_proxy="$http_proxy" https_proxy="$https_proxy" ftp_proxy="$ftp_proxy" \
-	no_proxy="$no_proxy" all_proxy="$all_proxy" GIT_PROXY_COMMAND="$GIT_PROXY_COMMAND" "$0" "$@"
-[ -f /etc/environment ] && . /etc/environment
-export PATH=`echo "$PATH" | sed -e 's/:\.//' -e 's/::/:/'`
+export LC_ALL=en_US.UTF-8
+# Remove invalid PATH elements first (maybe from a previously setup toolchain now deleted
+PATH=`python3 -c 'import os; print(":".join(e for e in os.environ["PATH"].split(":") if os.path.exists(e)))'`
 
 tweakpath () {
     case ":${PATH}:" in
-- 
2.25.1

