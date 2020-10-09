Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.6858.1602221480346676391
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 22:31:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=gU/k7EPU;
 spf=pass (domain: taitradio.com, ip: 209.85.166.194, mailfrom: douglas.royds@taitradio.com)
Received: by mail-il1-f194.google.com with SMTP id t18so8094481ilo.12
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 22:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=U5KYjG9gNQEUq8oU/JuXq3uvwZyZv3TLVBwE4xGN/To=;
        b=gU/k7EPUKwg7lSjpIV/MPJ9jYYxcnK9JV+4eCSWHOz+TlLXPq3hXz4g+cdJ834C57e
         N0zvcwtcO8IOz41t7ygyjjVyiMWp78TP9MOQbIQjvf1aliHVkUJJcle2tC6EQJjsUImN
         vnZtxtIEEejqiuXv5UKeMZIniXKwY5a4WufG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=U5KYjG9gNQEUq8oU/JuXq3uvwZyZv3TLVBwE4xGN/To=;
        b=J5gXbMfvRMeUl23kXu0DPLiTTeZrwucwbvIs+EzT0aJlypI7k9m7uCltsd3KS242W8
         zMRTQb8W2fJtJUziJ1ojItOGZmcbCKnW5C/if4Fi1J0Yz9+38A3LHgxWSbBvDUtmgYOD
         hJU1cOQ+xaUGqcZeANm84ngSXGy6I5jBVpCjJ/L8dx0awHYyt0HddaBw0iWYqoLUptIG
         oHYQxeg3UjR4DLt1rS/NhFoj6MU0sjVz6MSr/ytpDY+TXLLR53j1yq7Rg5tvDMUXNidR
         qGzOLb/Bc9yqKiOGYYpG9zZWMjZu1fhumfEYWtz8SInCc76HTMkKbBBUxH4yCGYLTxM1
         Wu3A==
X-Gm-Message-State: AOAM531V7eeUPY/Os8y/svHromjjy06UzD8Spl6HMlvCw5W84ZVOo68L
	FqnVMgb8Gc3dawoX7rxPVHbFFXWf2LO50zMl+jg75hSlYrmLpbo62kpPdeoCCXN+G2m58thxzFr
	AtAV2RkbR2ljiKJBf2MvkeTQjJ7ooqVi13yNmRFhC+irkpWaKS4Sr9crE
X-Google-Smtp-Source: ABdhPJxTTYOTKihqdtRqE3x3w8hoOFi1gwxjyAESnpjAJmSuznja3o6DiAzLT/VcBzdKxCbhzj1jaDTNec2frmc/dqU=
X-Received: by 2002:a92:ce44:: with SMTP id a4mr604502ilr.93.1602221479417;
 Thu, 08 Oct 2020 22:31:19 -0700 (PDT)
MIME-Version: 1.0
From: "Douglas" <douglas.royds@taitradio.com>
Date: Fri, 9 Oct 2020 18:31:07 +1300
Message-ID: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
Subject: [PATCH] externalsrc: No single-task lock if S != B
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Allow different recipes to build things from the one external source tree in
parallel, but only if the build is happening outside the source tree.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
meta/classes/externalsrc.bbclass | 2 +-
1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass
b/meta/classes/externalsrc.bbclass
index d200129987..73bbb2be3c 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -85,7 +85,7 @@ python () {
if task.endswith("_setscene"):
# sstate is never going to work for external source trees, disable it
bb.build.deltask(task, d)
- else:
+ elif externalsrc == externalsrcbuild:
# Since configure will likely touch ${S}, ensure only we lock so one
task has access at a time
d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")

--
2.17.1

-- 
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer 
<http://www.taitradio.com/email_disclaimer>
