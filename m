Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6759.1600408839217523537
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2020 23:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gR2axdwN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id x14so4298087wrl.12
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2020 23:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ODJC02OuEtboLTw6IuZ5f4x1jKT8eQDCb7ARPzZPxU4=;
        b=gR2axdwNKlXvxv3yUYFlpHoEbArkKv/aepYIhMXy1UlEzCy/l/UMuiE0umeMf1226p
         a1eehFE50p4QpxnijMBFjkPjUxb8oHSok62WfauicQ+57Oh40bIQfUfyyeaC3oDSvlRV
         JjM30Owr1pm4t8fEN69I2AZvHFntJGoUlUn6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ODJC02OuEtboLTw6IuZ5f4x1jKT8eQDCb7ARPzZPxU4=;
        b=El0ACOif9Y4tnfGTxv4ZuuV4twV6m0dObFNhZaVXARwPA+Uru9XB1tIXwzDAEEX1TP
         ec3SJZAt+gB9xN50qpX54vVoR3nLZbD8AABP2kj3pfElgn1JAYNLnlJZzuhqOYvf+eNq
         t90LTfj449sp/15oh9oRjQVi/X+nWQ+dXfG4ohSSDU0MpL2bu0YfZnsxdarxwnLXWJdv
         MQINqpLMMnPiRPvTMq+HiebNbje78z72y5/iHtdB48ZdZhKMIawzQvTGSqK6UftJUCQ+
         f0VPkn3gnSJuWwZFEUNEWjUNgqpV7VqyDbkshzEq6FXK5KuevSCJi8TBdqBbZFuqi1Dn
         nZ8A==
X-Gm-Message-State: AOAM532NbWorFAt/DWnzXvF6rYk5YBem4OymY2Zay0uBjFGLO/nyxown
	DjgVJwc6rlImfQEkk6OA0ZHMQPWqm8U6eA==
X-Google-Smtp-Source: ABdhPJxe2hNZTqr2Wel0dvTPv1cUIFaW8VD3HrzS0Yl29ATiVo7MYL723eSAPNV6X1f+dKd6cDaeeg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr38077975wrn.12.1600408837296;
        Thu, 17 Sep 2020 23:00:37 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (7.1.a.4.b.6.6.4.7.f.7.9.a.9.8.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c89a:97f7:466b:4a17])
        by smtp.gmail.com with ESMTPSA id o16sm3039943wrp.52.2020.09.17.23.00.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 23:00:36 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] oeqa/qemurunner: Increase serial timeout
Date: Fri, 18 Sep 2020 07:00:34 +0100
Message-Id: <20200918060034.2327283-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918060034.2327283-1-richard.purdie@linuxfoundation.org>
References: <20200918060034.2327283-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the serial login timeout from 60 to 120s. This seems like a
long time, however for a qemumips image with systemd+PAM and openssh,
(e.g. core-image-sato-sdk + DISTRO=poky-altcfg), the getty connects
to systemd's pam module which waits on logind and 45s for all this
to happen at the same time as things like ssh key generation happens
is not unknown.

Increase the timeout to match the longer times we know these things
can take in the worst case scenarios since we're tired of intermittent
issues related to the serial login affecting the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 519aa9aa1e5..77ec939ad72 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -393,7 +393,7 @@ class QemuRunner:
 
         # If we are not able to login the tests can continue
         try:
-            (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True)
+            (status, output) = self.run_serial(self.boot_patterns['send_login_user'], raw=True, timeout=120)
             if re.search(self.boot_patterns['search_login_succeeded'], output):
                 self.logged = True
                 self.logger.debug("Logged as root in serial console")
-- 
2.25.1

