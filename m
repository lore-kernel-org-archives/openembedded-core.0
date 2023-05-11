Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3C1C7EE22
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 23:21:39 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.11572.1683847295596059663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 16:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=odV6v6EK;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: max.oss.09@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so84058798a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683847293; x=1686439293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5BfagyR+yuzK0IAx6fqjTX4JKUP4WFb43Sd/OKuX09I=;
        b=odV6v6EK/310hj5c8WWDSjjJpfL4zX8KizdvjbyGM/E/0sXN/9zsvTWEss0dXo3yRH
         XttrHfLSvW6qdsv7vNVoNPyDFzc0c3x+VDnEq6lUTLsduQ1h+i9897Yc+6dvdMdAg3MW
         L/pYgBam8fJU05BHjj3e+A249baii71dYwd7j6vcwxMjz8xvWGw62rJqmDJiGfaiI6BF
         dBvGXkbJPv1JBRUfzvLzjIc/V3RylZyGV/mABv6C512ngHa6v5aSL7D4BRmM9s3Hrg4O
         Sc9f+1LR8jT4gkZy1vEPJ+oAwzJlm5oUpm6gA2MySK6y3Sfv8kzg/MXtkaMffOjHBJKM
         Y5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683847293; x=1686439293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5BfagyR+yuzK0IAx6fqjTX4JKUP4WFb43Sd/OKuX09I=;
        b=Lu5RAJWit03SEwyCLESlUIHaWgs1NiPk3efaQohtotxGfO/0lTCJoRhy5/+kuKDFX2
         dTSSenlN2wYKGFwFuwL1loYYFPdzDD10EaElBVAz4M9AO5B1lPAOojpqQXrBefILSHc+
         WF3fyAGqk7tuUMwHJ7ZqDdztijxrhSkqaquDscC+L54F8cJAP7ZzHkv4ulYk7rnr5hCS
         4D+BB+gcjTO2Azc2jq2Jl0ng1ZPbNxHnkFhOGCSp1WxKhlYaIRP2z2oRDxpojzpBc784
         iPN7q7OFSPf0Q7sUlnLzqVuYZ7sRwCROn/XvNUI7ah8FGVWKDU16e9hjLeH4HPRj7pMK
         0jGw==
X-Gm-Message-State: AC+VfDwox/CsRWrE1flHgw9P57E9zpO1zmzzw1I0JQxAzKnC+OQmeJVe
	F8Slwy77JbQfQJI5qG7EzPVm1APxt+A=
X-Google-Smtp-Source: ACHHUZ6Bydtz5iXtQU5A+9mFcaiHAoTBqCZUzVA7Stt+OV/6B2vF1J+evOq5G1akgzX88WnachHnag==
X-Received: by 2002:aa7:d29a:0:b0:504:81d4:118d with SMTP id w26-20020aa7d29a000000b0050481d4118dmr20701898edq.3.1683847293557;
        Thu, 11 May 2023 16:21:33 -0700 (PDT)
Received: from linuxdev2.toradex.int (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id y2-20020a056402134200b00504ecc4fa96sm3265163edw.95.2023.05.11.16.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 16:21:33 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	raj.khem@gmail.com,
	alexandre.belloni@bootlin.com,
	quaresma.jose@gmail.com,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [OE-core][Patch v4 0/4] perf: add libtraceevent packageconfig
Date: Fri, 12 May 2023 01:21:25 +0200
Message-Id: <20230511232129.993289-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 23:21:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181162

From: Max Krummenacher <max.krummenacher@toradex.com>

With kernel 6.4-rc1 commit 6898e60f709b ("perf build: If libtraceevent
isn't present error the build") having libtraceevent is a required
dependency unless building it with 'NO_LIBTRACEEVENT=1'.

Changes in V2
- add a patch importing libtraceevent from meta-openembedded
- move the pkg-config changes in a separate commit
- default to setting the packageconfig as we now have the dependecy in core

Changes in V3
- add Bruce as the maintainer of the new recipe libtraceevent, thanks Bruce.

Changes in V4
- fix QA issue "libtraceevent-dbg contains reference to TMPDIR [buildpaths]"

Max Krummenacher (4):
  libtraceevent: import from meta-openembedded
  libtraceevent: fix qa issue with reference to TMPDIR
  perf: make pkg-config available
  perf: add libtraceevent packageconfig

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...not-preserve-ownership-in-cp-command.patch | 40 +++++++++++++++++++
 .../libtraceevent/libtraceevent_1.7.2.bb      | 27 +++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  5 ++-
 4 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent/0001-makefile-Do-not-preserve-ownership-in-cp-command.patch
 create mode 100644 meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb

-- 
2.35.3


