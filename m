Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.7240.1610819059160874873
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 09:44:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aXLVvNjy;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t6so6357408plq.1
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 09:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pR0VAKYN5vhO60z7IDjWUQJQbTF068bdZ5tW+yMCdhs=;
        b=aXLVvNjyEWGa/iC9AQh83JDh4uXSBRiPrEb+EOmoFSrLEznFKMg0vFWJ02MUHDk1va
         QyH29ClKRCANHSbz7cqlT9MCAkgFdncsbFwmr77gJ4nDF/YwjfCj+5tTt1e1eWX2qklz
         B0ZBzSQPul2tOgy1donNQBXCuF9diq5Hq7QUIKwbo5nSYKjKCe8ey595C/J9wK2f8lOm
         fWAdHN81+tlExU1ITmL3rjXEQ9cdNPLlt6dEUQ6OaenxRpV7/bccSaEL66yU/3G6hNZ6
         bESbtEg65zyC1gd3O6uqCpEOAxwXuWMdvGdEFK7ZQjIVdTmNUdQ9NqWSpByMy5v802w8
         IvVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pR0VAKYN5vhO60z7IDjWUQJQbTF068bdZ5tW+yMCdhs=;
        b=GOe+hUVkKwXotjoZMym+Lyo9zm0ouxWTOPpSb9tG42ih/pfiad9f/8q/Vg4KcBFsRe
         RsAZ2J/EwGjkdml0kPO2hGyjtL7p2WTdDGW3QVjBH3pzyRt82IO+eKS80LMELN1g8vsn
         4Ze6ZbY+WX28VPqKBA9rwr5KLRKvYQiBLGam3YE3UxwnjiaRacCJ5RkFGevN9BeKj0l9
         84MdR4uaUXiAblZ/JQpYx5DUg2jyPFMC9zLSmylDb0TWR1hVdjEhvtXJY6jZShCHVkW/
         Dm38AKKbIbvzQmpTwc7kXb88bWbJxLWz2ZVs5eulR6hHfT+Zsln+SVH+nA0+ZiQn5DMQ
         To/g==
X-Gm-Message-State: AOAM531LOxySUopzmcaODs7HFinVCGDdTSA4O6ydgUyVRlGaFzMLw7CK
	oadNaH+u68e+NW6B3p1tDB9oGK+9ItpyfA==
X-Google-Smtp-Source: ABdhPJwxC0FgiIk+Z/F46k1VPBwGOcTNwxRJN35yIhC84m+gHwEGjvDjM0BdZwKix7UJ5MkXypyNlw==
X-Received: by 2002:a17:90a:ab8a:: with SMTP id n10mr10125263pjq.125.1610819058609;
        Sat, 16 Jan 2021 09:44:18 -0800 (PST)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:9c08:d62e:30e8:e4f])
        by smtp.gmail.com with ESMTPSA id i25sm11495278pgb.33.2021.01.16.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jan 2021 09:44:18 -0800 (PST)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH 1/2] classes/waf: Add build and install arguments
Date: Sat, 16 Jan 2021 09:44:13 -0800
Message-Id: <20210116174414.23584-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210116174414.23584-1-akuster808@gmail.com>
References: <20210116174414.23584-1-akuster808@gmail.com>

From: Joshua Watt <JPEWhacker@gmail.com>

Adds variables that can be used to allow a recipe to pass extra
arguments to `waf build` and `waf install`. In most cases, you want to
pass the same arguments to `build` and `install` (since install is a
superset of `build`), so by default setting EXTRA_OEWAF_BUILD also
affects `waf install`, but this can be overridded.

(From OE-Core rev: 493e17a2f5cbbbe3b1e435dadb281b007bca2cbf)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 633652284b13dc78206f4cc8e81f29de44777b75)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/waf.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
index 900244004ec..309f625a40f 100644
--- a/meta/classes/waf.bbclass
+++ b/meta/classes/waf.bbclass
@@ -5,6 +5,11 @@ B = "${WORKDIR}/build"
 
 EXTRA_OECONF_append = " ${PACKAGECONFIG_CONFARGS}"
 
+EXTRA_OEWAF_BUILD ??= ""
+# In most cases, you want to pass the same arguments to `waf build` and `waf
+# install`, but you can override it if necessary
+EXTRA_OEWAF_INSTALL ??= "${EXTRA_OEWAF_BUILD}"
+
 def waflock_hash(d):
     # Calculates the hash used for the waf lock file. This should include
     # all of the user controllable inputs passed to waf configure. Note
@@ -55,11 +60,11 @@ waf_do_configure() {
 
 do_compile[progress] = "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 waf_do_compile()  {
-	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)})
+	(cd ${S} && ./waf build ${@oe.utils.parallel_make_argument(d, '-j%d', limit=64)} ${EXTRA_OEWAF_BUILD})
 }
 
 waf_do_install() {
-	(cd ${S} && ./waf install --destdir=${D})
+	(cd ${S} && ./waf install --destdir=${D} ${EXTRA_OEWAF_INSTALL})
 }
 
 EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.17.1

