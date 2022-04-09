Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC428C4743F
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.2408.1649470646364783706
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Qkji2UAp;
 spf=pass (domain: linaro.org, ip: 209.85.222.172,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qk1-f172.google.com with SMTP id b189so6249515qkf.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Apr 2022 19:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HoICKmlyxLlGHgRSyGRAN49Ptyzp7+v6gLwr6fYy2E=;
        b=Qkji2UApvBFsbsHdAgG6BzTEjQasjk/BzSIB6ypAyYs3XXZd/99DTCj75jKXjqLtZ4
         JbD8niGEMYC/WGdnVSPKN3ruF48fudYibbDlguQeCczNZlSIoRW04morCMk9QBwaox0y
         7jgxCdYKwosTU+RIUQA9rugyvqJluu2Mxs7daWowt0nLoK0U++r6kW9kRHz3woYUMsHh
         ptpBUg4gpKEMKXC1C1q96sZ35s4/KXLO4q6BWvSsC3Ww945H9Q0qAEFZkt+yeV6OqhTi
         3sbUD8de98Wa+Xt5Dp9J4AchBaY7TebvQPPEQgwf8gY7o9t5vBuQ8fOgm9sDPMUx84c2
         PfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+HoICKmlyxLlGHgRSyGRAN49Ptyzp7+v6gLwr6fYy2E=;
        b=V5mPVx/ug/yl/IMcortVdgla7HNJsrDvZGG1b+mEoR+KimnsdM/TW5SvjGjntPk7kk
         EhCz6qGzA0biZe8VoiaKGvI9+ail9hL7IDrj42QOEeDCL9UqomKevwyrJRBsFhmKmbrV
         qoxM43Vqy+L+AgMdz0pwHlARuX6dyimGPm5BzGq9AWTTLnWsVYtKOm727tmFFJWqXugW
         n0z6osxalBtcnHfdheD1rtVNI3n4nELEIcmjtR8dMr1I3RMfeVuoljf+YiJwvu49coaz
         fiJVxvhTQ9RuTR9h35KCAYYMpqbPNJ9ARw7o0GjBI/CZQRRsAi44blvW1GGA069zJ0Me
         L1tQ==
X-Gm-Message-State: AOAM5303WoOUfjPwmSNscNzaBjp1ivEtLN4fTU6VPmpnWCF5g5P3LEyK
	B9pPNmX/+M03fAlxDMiaMqYDBt9Ntp6abQ==
X-Google-Smtp-Source: 
 ABdhPJwObafVUugBiURs6TC6csebwUmXT5lhztXOKlkx6uVay7KLrywTdkSiBbqUfT2imt3aKZ4gvA==
X-Received: by 2002:a05:620a:28ce:b0:69b:e718:7172 with SMTP id
 l14-20020a05620a28ce00b0069be7187172mr3071785qkp.497.1649470645526;
        Fri, 08 Apr 2022 19:17:25 -0700 (PDT)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 br35-20020a05620a462300b0067e890073cbsm16825080qkb.6.2022.04.08.19.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 19:17:25 -0700 (PDT)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [dunfell][PATCH] gzip: fix CVE-2022-1271
Date: Fri,  8 Apr 2022 22:17:23 -0400
Message-Id: <20220409021723.201373-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164182

zgrep applied to a crafted file name with two or more newlines
can no longer overwrite an arbitrary, attacker-selected file.

Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=dc9740df61e575e8c3148b7bd3c147a81ea00c7c]
CVE: CVE-2022-1271

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../gzip/gzip-1.10/CVE-2022-1271.patch        | 45 +++++++++++++++++++
 meta/recipes-extended/gzip/gzip_1.10.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch

diff --git a/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch b/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
new file mode 100644
index 0000000000..046c95df47
--- /dev/null
+++ b/meta/recipes-extended/gzip/gzip-1.10/CVE-2022-1271.patch
@@ -0,0 +1,45 @@
+From 7073a366ee71639a1902eefb7500e14acb920f64 Mon Sep 17 00:00:00 2001
+From: Lasse Collin <lasse.collin@tukaani.org>
+Date: Mon, 4 Apr 2022 23:52:49 -0700
+Subject: [PATCH] zgrep: avoid exploit via multi-newline file names
+
+* zgrep.in: The issue with the old code is that with multiple
+newlines, the N-command will read the second line of input,
+then the s-commands will be skipped because it's not the end
+of the file yet, then a new sed cycle starts and the pattern
+space is printed and emptied. So only the last line or two get
+escaped. This patch makes sed read all lines into the pattern
+space and then do the escaping.
+
+This vulnerability was discovered by:
+cleemy desu wayo working with Trend Micro Zero Day Initiative
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/gzip.git/commit/?id=dc9740df61e575e8c3148b7bd3c147a81ea00c7c]
+CVE: CVE-2022-1271
+
+Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
+---
+ zgrep.in | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/zgrep.in b/zgrep.in
+index 3efdb52..d391291 100644
+--- a/zgrep.in
++++ b/zgrep.in
+@@ -222,9 +222,13 @@ do
+ '* | *'&'* | *'\'* | *'|'*)
+         i=$(printf '%s\n' "$i" |
+             sed '
+-              $!N
+-              $s/[&\|]/\\&/g
+-              $s/\n/\\n/g
++              :start
++              $!{
++                N
++                b start
++              }
++              s/[&\|]/\\&/g
++              s/\n/\\n/g
+             ');;
+       esac
+       sed_script="s|^|$i:|"
diff --git a/meta/recipes-extended/gzip/gzip_1.10.bb b/meta/recipes-extended/gzip/gzip_1.10.bb
index 9778e687e1..c558c21f10 100644
--- a/meta/recipes-extended/gzip/gzip_1.10.bb
+++ b/meta/recipes-extended/gzip/gzip_1.10.bb
@@ -4,6 +4,7 @@ LICENSE = "GPLv3+"
 
 SRC_URI = "${GNU_MIRROR}/gzip/${BP}.tar.gz \
            file://run-ptest \
+           file://CVE-2022-1271.patch \
           "
 SRC_URI_append_class-target = " file://wrong-path-fix.patch"
 
-- 
2.25.1


