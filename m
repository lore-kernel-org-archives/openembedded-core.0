Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web12.1028.1608245687881482442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 14:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NxIta9bP;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id b5so250507pjl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 14:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TwRoQFUlHP2RDuCgwAuDkw1X4ofKr/3ETPOtcJznG7w=;
        b=NxIta9bPgwqBmizq6Bt3V0STzdTDj/UnHTCjLZdoFT2+1fT64lBw4OSJuAfGcbqnLs
         PeFdXPvXhcTi/r48CVZXC3i6GwwP93kgcGqOAqFO2KybSUA9vlhUo7AYqk+UX1/gaFYG
         UoOJBZ/1YaD+qeGhdL9M/I1mHYuXlYMjXC1/aJaUmUOncfmsNvW3Qck8DMrHoFQQVaDS
         rLzGQs/E86vM0upZq3IA2RAC4xam7p6odMyJ9nOyCPMyPZw6py4lTURwA93i0CxbwTeJ
         c/ipsaBgKlazXk7YV2auSjpRscSzHCYnDxQ6loesSls9iSw2ql+Q8l1QZamQT1raqQMM
         9hRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TwRoQFUlHP2RDuCgwAuDkw1X4ofKr/3ETPOtcJznG7w=;
        b=bd41fUq+ScitCaw7uFkjt/hVWt8G2EzPLoFWTRfrzIQurmosM8RIKe8vDhGpMeBnUQ
         3P0Vc2lq5HprVu8BcmYwd4lIoz6bVSNQvbpsjxa/gS0QqAhpFZpW7RMLMdEfPVlTYaW+
         9qrdUvGoxFz62DR+Rm33yfnHFKTqaGgPSdYhyqscWp6UD+bGSegNDNs9as4OWxznk+rk
         ukdD4iMtt2O4exB5KYoadKAmtHuSZAipNGkthxrTrUiCHlXjOWdUxK9OXCdVw/3/0coi
         6jgsgBFtGYF5J6n4JTviViNktYsc4cOEGksb5WZDI4CK6BHs6Vy2mkZmj3TBMtuaXsFL
         pfQw==
X-Gm-Message-State: AOAM530hFdhdoGWQ9vgiIUGdmLZ0D6Bq4UcHNpj2voqqimb5Mw5/E0bt
	weMLqH9iABHIs7zVe3LyoycqUJuUy17gipNl
X-Google-Smtp-Source: ABdhPJzzSGyDUGsZD7n8UcVUH1hppFQj+pRw8XLFpZv2nRtPvVoxNqDgUgVsD5MNh1DLjM8Xb7dFoA==
X-Received: by 2002:a17:90a:1782:: with SMTP id q2mr1321844pja.189.1608245687126;
        Thu, 17 Dec 2020 14:54:47 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::9ac9])
        by smtp.gmail.com with ESMTPSA id u25sm6620428pfn.170.2020.12.17.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:54:46 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/4] initscripts: Use initctl on sysvinit only
Date: Thu, 17 Dec 2020 14:54:40 -0800
Message-Id: <20201217225440.2633474-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217225440.2633474-1-raj.khem@gmail.com>
References: <20201217225440.2633474-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check if init system is sysvinit to recreate initctl, this ensures that
it can be used with busybox init system as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../initscripts/initscripts-1.0/mountall.sh   | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index c719be5d9a..ead4dba46d 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -19,15 +19,21 @@
 test "$VERBOSE" != no && echo "Mounting local filesystems..."
 mount -at nonfs,nosmbfs,noncpfs 2>/dev/null
 
-#
-# We might have mounted something over /dev, see if /dev/initctl is there.
-#
-if test ! -p /dev/initctl
-then
-	rm -f /dev/initctl
-	mknod -m 600 /dev/initctl p
+
+# We might have mounted something over /run; see if
+# /dev/initctl is present.  Look for
+# /sbin/init.sysvinit to verify that sysvinit (and
+# not busybox or systemd) is installed as default init).
+INITCTL="/dev/initctl"
+if [ ! -p "$INITCTL" ] && [ "$(readlink -- "/sbin/init")" = "/sbin/init.sysvinit" ]; then
+    # Create new control channel
+		rm -f "$INITCTL"
+		mknod -m 600 "$INITCTL" p
+
+		# Reopen control channel.
+		PID="$(pidof -s /sbin/init || echo 1)"
+		[ -n "$PID" ] && kill -s USR1 "$PID"
 fi
-kill -USR1 1
 
 #
 # Execute swapon command again, in case we want to swap to
-- 
2.29.2

