Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52752C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 17:33:36 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.10317.1644600814729892068
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hffgYnso;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id q7so16344813wrc.13
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 09:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNBMkd1lQiyXp9dHLY7ZUwwv5B7E9zSlYn4WaTzWfG0=;
        b=hffgYnsoefKSERGVPVsioGDYK2iP+rosnyfwdAHKCAxc2wmRC72NpO8QSNCY+/limF
         ZYq/JPEHwdWeR22/WGT3JnGEwcUX6HeMun7DY6+n58yWVPCp3JEqK4EqnyspO2sOXBgQ
         dcP9wyvm80Dw0sk46FANlNUeGfiP184E595as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oNBMkd1lQiyXp9dHLY7ZUwwv5B7E9zSlYn4WaTzWfG0=;
        b=iEN9ovNmNG1YUAmAgD+FCWKI2ukEkLgfqWkrtVsqpha9jH+yE0E0QMHEQnfqjbY7+p
         1xk+M2a2B/NMpf94wHvXFOifcK6/khhoOLz1GLrTMOhr7eXwylkrGA2q0vsDZjQGzPx3
         0DlqVmtjBab8jzWJb9av6GWPBlODKQz/3Coc6q1rYhV2B8NtmxkQwT+odI+pInyZA9Vz
         PTRZcQ55ZxU2XH0hbO9tpRIAZ+RmIunaoiEwfswOL70YtykrgCvqWyr+wmH3yLAquULN
         tc+EcgUFjdEw7xcp4tTBZeGTXvQFesOPTdHwCmKY37uPpv7Drw7+JjGOKp/uhmzNsdT8
         h/WQ==
X-Gm-Message-State: AOAM532z7kRyAY69XdO9Q8WTnYBFn+hcImD6cpJLNcJTpL7AMVZZ3ce0
	f7KO70AOBcd3mzu3qJc/5QCDL8LatwiZByKo
X-Google-Smtp-Source: 
 ABdhPJwstGWQrFQAxU/9Mz8pKRYr0DF0ALpEFTI0ifO0jJlNpX3MAJukYI/a7Gq2HEP4MHXIrvq5XQ==
X-Received: by 2002:adf:a445:: with SMTP id e5mr2152719wra.372.1644600812808;
        Fri, 11 Feb 2022 09:33:32 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e5fe:2e7c:731b:5924])
        by smtp.gmail.com with ESMTPSA id
 b7sm11203886wrp.23.2022.02.11.09.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:33:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scriptutils: Fix handling of srcuri urls
Date: Fri, 11 Feb 2022 17:33:31 +0000
Message-Id: <20220211173331.2731792-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 17:33:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161660

Bitbake is now requiring there be a call to get_srcrev() when urls contain
floating revisions. This breaks some recipetool workflows since it is running
these queries to determine those revisions. Add a PV entry which triggers
that call to avoid the errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/lib/scriptutils.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 47a08194d0d..adf81476f0c 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -179,6 +179,7 @@ def fetch_url(tinfoil, srcuri, srcrev, destdir, logger, preserve_tmp=False, mirr
                 f.write('BB_STRICT_CHECKSUM = "ignore"\n')
                 f.write('SRC_URI = "%s"\n' % srcuri)
                 f.write('SRCREV = "%s"\n' % srcrev)
+                f.write('PV = "0.0+${SRCPV}"\n')
                 f.write('WORKDIR = "%s"\n' % tmpworkdir)
                 # Set S out of the way so it doesn't get created under the workdir
                 f.write('S = "%s"\n' % os.path.join(tmpdir, 'emptysrc'))
-- 
2.32.0


