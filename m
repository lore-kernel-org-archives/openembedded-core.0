Return-Path: <dit.kozmaj@kynetics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BAD5C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 08:46:24 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.153785.1680770782503969865
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 01:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kynetics-com.20210112.gappssmtp.com header.s=20210112 header.b=McxW0J4L;
 spf=neutral (domain: kynetics.com, ip: 209.85.218.49, mailfrom: dit.kozmaj@kynetics.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-932072d4c00so127607266b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynetics-com.20210112.gappssmtp.com; s=20210112; t=1680770780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCNACmwq8ederuirruA9cg9i1bNiQGXN0hsfOcRU/fY=;
        b=McxW0J4LXDK0c5hB+wFVczBkxif1ZUvthEzwZDz5SQopN+633QBxpn9xO+tU0BxJhO
         gxEAW3FjnEWnOlKZ4LC46bRg8OB6oVjJJkNmuse9bo3RK1TUQvpnfCgbzhyO0YxP6N4l
         GN05LbJRw+rtKhu9CkQwmI2U5vre3OJkkaHSJNVf4y2LQsXjlcjk1hwXhGDdsvlKzJJT
         F6wCPdhD7YrIPOLDfsEhW9iUnDQjoJ50ouBEgUHmaUxOdIGP7+UqiY3w6g++eHLSG2D8
         TvlWpLins2o+z9PucbZQhq+qBbXSWbYr0fJgv74GR7usXAPq21RYdgRpb5igGywI8Bpn
         C3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680770780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCNACmwq8ederuirruA9cg9i1bNiQGXN0hsfOcRU/fY=;
        b=w9amUXyY7mFFIL/aq0NkX92szQqcxjTQGptgoTOyJezb8phUyoyNmt86GmrfckWvo6
         eODBcE1BNsyt3gDZ+rZg8Qx6oL+s79dSIeBBJFQ/P/fYCWjaqhmsQ0UcRTAeMFAw/cT+
         rBlOSEzxqwA4mh1IbsPjg0JwaP82aRUoQhyXpX9j3eWn+qReSXfiWCuOk2KlMIq28h55
         zXDenj/kLLJmGh3abUG/Ukmm59g5mjNn4sB4ZSYhdzRAmJxdLRZ/o0y8nCK4t/KjqziH
         oWsIXwB66eZiJvp15d9xTC3gGrc/ZtyuLoK1+vgME4ld70jRNT42UVwrh1T+3FGM4uhw
         ix1g==
X-Gm-Message-State: AAQBX9ccedlVWUbbV+cCV4DRFnNAN8ih+/ynrQstisyKapJ2xIJbu56f
	SNEHsY9LZJ6eo2z1/MUDNsvpHMjEIozD7sEzfSQ=
X-Google-Smtp-Source: AKy350bz4nD5bFzX/Can7zXb6EkftpCzxw793xFqJj5d+0xlhAVDvKhm9wM/kz5kaun9I3YdADherA==
X-Received: by 2002:a05:6402:31ee:b0:502:70e9:2c14 with SMTP id dy14-20020a05640231ee00b0050270e92c14mr4521758edb.29.1680770780630;
        Thu, 06 Apr 2023 01:46:20 -0700 (PDT)
Received: from localhost.localdomain (217-133-17-98.static.clienti.tiscali.it. [217.133.17.98])
        by smtp.gmail.com with ESMTPSA id v13-20020a50954d000000b004fc649481basm440544eda.58.2023.04.06.01.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 01:46:20 -0700 (PDT)
From: dit.kozmaj@kynetics.com
To: openembedded-core@lists.openembedded.org
Cc: Dit Kozmaj <dit.kozmaj@kynetics.com>
Subject: [PATCH 3/3] kickstart: Expand label and part-name doc
Date: Thu,  6 Apr 2023 10:44:17 +0200
Message-Id: <20230406084417.34931-3-dit.kozmaj@kynetics.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406084417.34931-1-dit.kozmaj@kynetics.com>
References: <20230406084417.34931-1-dit.kozmaj@kynetics.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179762

From: Dit Kozmaj <dit.kozmaj@kynetics.com>

Update --label and --part-name documentation to reflect the
behaviour with GPT partition format.

Signed-off-by: Dit Kozmaj <dit.kozmaj@kynetics.com>
---
 documentation/ref-manual/kickstart.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
index 297887805c..a01f035cd2 100644
--- a/documentation/ref-manual/kickstart.rst
+++ b/documentation/ref-manual/kickstart.rst
@@ -135,6 +135,8 @@ the ``part`` and ``partition`` commands:
 -  ``--label label``: Specifies the label to give to the filesystem to
    be made on the partition. If the given label is already in use by
    another filesystem, a new label is created for the partition.
+   If the partition table format is GPT and the ``--part-name`` is not
+   defined the partition name is set as the value of  ``--label``.
 
 -  ``--active``: Marks the partition as active.
 
@@ -172,7 +174,9 @@ the ``part`` and ``partition`` commands:
    "1.3".
 
 -  ``--part-name``: This option is a Wic-specific option that
-   specifies a name for GPT partitions.
+   specifies a name for GPT partitions. If both ``--part-name`` and
+   ``--label`` are defined, the partition name is set to the value of
+   ``--part-name``.
 
 -  ``--part-type``: This option is a Wic-specific option that
    specifies the partition type globally unique identifier (GUID) for
-- 
2.34.1


