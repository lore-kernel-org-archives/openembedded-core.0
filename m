Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.11495.1607008187867935140
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 07:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Q/Bo9NHt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id u2so1286777pls.10
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 07:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=RWLS0NuQPYTalwFQZUi9JTAWn5mXSukR+J0crn5YVwU=;
        b=Q/Bo9NHtz0jdsToNLO6gwO5JKCP71jqO5Ha/8gsorU2u+vxbOBEzYcuYDmnzw5q3gW
         PQFo4rfe7rmeNlWNfZ5iWRAG13k7EpyB2c3pKvIRropQ+/vwTAa8tIPr91uQJ2dezVTM
         QlMgqYCTZqCzBpgYyP8bbdcBiNivXjx1Pcu9pOMeVAvPdCHq/5V67H/WnTNC4ZYbeaJU
         moN+kgSzzbErPY5adlbKXkE68lZXBK61Lduq94ZSbNVDFETar+otmrvcANSRcXnhPyNh
         B9+kTgh9XNaCR75rlc8r1cOQcXo9Hn2U6an0broMaNmrrbcKypNzxHKeq6Lmt9zrN+PO
         mnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=RWLS0NuQPYTalwFQZUi9JTAWn5mXSukR+J0crn5YVwU=;
        b=oPtcfrOWc/rmfMTlPVfEgUgNcwXDjXmZLdcLRVLIyExOWiWqQ003/mt2GT65lTW3AY
         1qDc/voJbZw1b+x5aWUAooOXc1+hoTIeFJSL17Xyxr94zyNs0UbV3n8e8ypYgh7PoFPD
         HmkGo7WKpdXtY5jsnQmGJIwUtVBzlU85Ux3wKDcHm0Eu6MOQSM65iWhkRpSwgzw9gqOC
         UsrKT517gsOU5u3lzn4LlcAjNZCHV2R7X8lhQkrFJYqSehKa7vM9m6ACrC9EpAaMJn0+
         zJPk9Fc7ih1xTgVLmElyxxUOvjrGLtyi9/lA3zZatka025oQYkkjAIxHw1laVkxN4G5y
         WEDw==
X-Gm-Message-State: AOAM531EQ6qaAZa8I1r3XWSRw2V5r9OqHeNbYH0jURd/jOQ1fJF2sn70
	L4e2MU/AHwAMcdadrfB674ORh4qP2Ibdjlqt
X-Google-Smtp-Source: ABdhPJyxyi1syOlWzsESziHZwWAaJKad9PbTm+fsRjaAXBkaRRjBtHvXZw6siQi73Xr7xj/wCIX+CQ==
X-Received: by 2002:a17:902:bc86:b029:da:9da4:3092 with SMTP id bb6-20020a170902bc86b02900da9da43092mr3572314plb.71.1607008186876;
        Thu, 03 Dec 2020 07:09:46 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s7sm1632320pju.37.2020.12.03.07.09.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 07:09:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/28] tcl: adapt to potential pseudo changes
Date: Thu,  3 Dec 2020 05:08:16 -1000
Message-Id: <dc34af800bddaeb390f8dace1f47e5322a32c7cf.1607007208.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
References: <cover.1607007208.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

It failed as below when rerun do_install for tcl:
 $ bitbake tcl
 $ bitbake tcl -f -cinstall
 [snip]
 | NOTE: make -j 72 DESTDIR=/build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/image install
 | abort()ing pseudo client by server request. See https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on this.
 | /build/tmp/work/core2-64-wrs-linux/tcl/8.6.10-r0/temp/run.do_install.3490694: line 184: 3499214 Aborted                 (core dumped) make -j 72 "$@"

By default the S is ${WORKDIR}/${BPN}-${PV}, but after unpack,
the tcl source [1] unpacked to ${WORKDIR}/${BPN}${PV} and all the
files under ${WORKDIR}/${BPN}${PV} are acutally the source files.

But the the main Makefile.in is under ${WORKDIR}/${BPN}${PV}/unix
for tcl, so there is below logic in tcl recipe:
S = "${WORKDIR}/${BPN}${PV}/unix"

To adapt the potential pseudo changes, there is a general logic to
exclude ${S} from pseudo database in base.bbclass in [2]. That's to
say, just the dir ${WORKDIR}/${BPN}${PV}/unix is excluded from the
pseudo database.

But it's not enough for tcl, we need to exclude the actual source dir
${WORKDIR}/${BPN}${PV} from pseudo database specifically to fix the
above do_install failure.

[1] https://downloads.sourceforge.net/tcl/tcl8.6.0-src.tar.gz
[2] https://git.openembedded.org/openembedded-core/tree/meta/classes/base.bbclass#n396

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0d835f8069a336fd6bab1058d4e605a81c844212)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.10.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
index aedd96b021..e6feb25a7e 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.10.bb
@@ -32,6 +32,7 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${PV}"
 
 inherit autotools ptest binconfig update-alternatives
-- 
2.17.1

