Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC2FC001DF
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:27:00 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.9117.1689690414292233111
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rnVMZWd2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-666edfc50deso3575947b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689690413; x=1692282413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+IHXRY5JbNGdSeiFQNBd7KPJRdstYKTU0ojI7lo8S4=;
        b=rnVMZWd2+lgV99wrXI77zx3IfIhgf60Fj1W2ZvQgR8ZijyEYG2+lbzzdNu5NOr/VQH
         BjMWOvNPACNXDX3a+TOh8KkiEi9HogzdTOGvbzUPfddK7HR42SRs47EcYLkOBbiDZtjP
         DNdp7/AqJQ3imq1euXFa26ZVJ3J7pJfkhCaWABw8tEOczA0olef445GDpOlRzNQAZOGO
         kHJckQt3lAFStoUzdMsEk6Isiz8VXl2nt95gqnGnRwFiuQKJ3HgIDtSlpf/yBEbtqbdw
         7rt59otD2kJ9K76JQnBsJDuCEk1sWLFYMTeLSrmg0/DQuPx6MYZs7v/jGUWFmfY9OIrT
         BKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689690413; x=1692282413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+IHXRY5JbNGdSeiFQNBd7KPJRdstYKTU0ojI7lo8S4=;
        b=BDTH9qH+6EKxiezJLB3zFcxcuEqwLIXytu+RyxyrUnpko2BJ6VN6Co7MhqVPfL7pBF
         0dafCdICUUXowBgBbN6isujHw81LHtaYxPncaLzW37oAy+UsuXKlOiIG3W+tksLqqpG/
         OTofojIUcHFOnSy8xIfBkNHkXqCx1pLhnvUAOGWIqW3F2fG1dTGR2xm1q5REGd0cUf/a
         Z/8qyv7rrQflsxlMUIvlb27w9SAWzauvhSWy62vh9BU+Ayc7T7SmupyQGfZgci0wc0Ly
         vBBRlrBGfqERX40ywgzdm1EcOvwFv1sdwX/VfKKqq+fKT3idvyLFN28JPI8urFF3RRyf
         O2pw==
X-Gm-Message-State: ABy/qLYj3VW4wUe7HQIs8H36FkStzYr6l3PoCsKluBQlDrOj4EwU/yD+
	NLURXm5wX8npK/wsUik0aZBwPRhwZpK3C/lJJGY=
X-Google-Smtp-Source: APBJJlFPE2B2uW0PwHOipz4P5/oJrMec1OnCPPWvC0TCrRcMkyU68b8ZWFW8zK5BbeQhzuYKL97LQQ==
X-Received: by 2002:a05:6a20:7f93:b0:125:928d:6745 with SMTP id d19-20020a056a207f9300b00125928d6745mr19511343pzj.15.1689690413410;
        Tue, 18 Jul 2023 07:26:53 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020aa78d18000000b006732786b5f1sm1581732pfe.213.2023.07.18.07.26.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 07:26:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/27] logrotate: Do not create logrotate.status file
Date: Tue, 18 Jul 2023 04:25:50 -1000
Message-Id: <fbfd62ac655cf00b8f7c8fc832ce7434ad4966a3.1689689618.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689689618.git.steve@sakoman.com>
References: <cover.1689689618.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184520

From: Jermain Horsman <jermain.horsman@nedap.com>

The first time logrotate runs it reports an error:

  error: state file /var/lib/logrotate.status is
  world-readable and thus can be locked from other
  unprivileged users. Skipping lock acquisition...

This check was added with
https://github.com/logrotate/logrotate/commit/1f76a381e2caa0603ae3dbc51ed0f1aa0d6658b9

This error is only reported once as logrotate removes
the world-readable permissions if this happens.
Since logrotate creates this file if it does not exist,
there should be no need to install it in the first place.

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8169cd2d18f1569e4357f082adbef492710e8c36)
Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/logrotate/logrotate_3.20.1.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
index 35977535aa..3df6ebd26d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.20.1.bb
@@ -67,7 +67,6 @@ do_install(){
     install -p -m 644 ${S}/examples/logrotate.conf ${D}${sysconfdir}/logrotate.conf
     install -p -m 644 ${S}/examples/btmp ${D}${sysconfdir}/logrotate.d/btmp
     install -p -m 644 ${S}/examples/wtmp ${D}${sysconfdir}/logrotate.d/wtmp
-    touch ${D}${localstatedir}/lib/logrotate.status
 
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${systemd_system_unitdir}
-- 
2.34.1


