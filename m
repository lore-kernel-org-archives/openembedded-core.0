Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web12.31358.1591627243461874185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 07:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iVUXCg7n;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: ricardo.ribalda@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id s1so20820209ljo.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 07:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=e8jOQxu33WYv1FJmYFdoD3BMrP2rCcyLu8lXyi8B8bg=;
        b=iVUXCg7nsrzLKYrHWe3i5XxrTFKpGoLAvH+Rv2EHrfgpU2jYxQLOyxRNUkeX2YKKPY
         2sRtPWDUrKgsSqEqTrkPyytJe6av0LwEFjffYCy3VmGoZ8gMijcKpsackZAojOyH5gY3
         3j8ETDb40XsUnBYViVSYh2tEwc5cO1BtnZVFuvl1SNEj7IN4/xgAJAlXTwOPB2+13OiR
         J+c9kzy2+QP7hpYFKCb/0lyvj5nzcKwud3hEXeAPAo7frmVSGZFLaAhXoxjU7xB5P7Er
         Q/WWc+9VJdznNBwKMktbvoPAsB3NoGhYbWmtfW3gOMiLsRyjNgLMCKvlOX+3BuRDaltP
         tZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=e8jOQxu33WYv1FJmYFdoD3BMrP2rCcyLu8lXyi8B8bg=;
        b=WTX6zTbYz8YlspMfACv7l+mwFmUrwk2aoBtSchfcQECILGYg1tTchGDd8UVxf604I2
         Cz8aqTg7hjpNK0JUC8CrvP/JmpatCLJZvXrJiEG4aS+OSETsBukpUGOA/rzukHBC0pG2
         UxqVCMApZkViiz0dVWRlNrMUOJPG0T6jhflDJRCDpRs1gRJNsLwJdbZfCburnwFcacsR
         FbVv0poESr7MK/nRRufC00Wtp4Ucf7cfUOCHpVWPJY8GB03XOhLLRW8ipsbPQbL0Ijjt
         YFlCE/lzsDWQ3VRtK6sUNQMf7gc1SQe6kqu4fDRXCRc31TJGKV6O39i/lTKJ0olBK89i
         FmHQ==
X-Gm-Message-State: AOAM531SMaFi2KQH2ylleS+LW+xmWhwpJCWyGxU+QmWOFFbR/fpAAgTH
	jGRspCjrWMwYItWrW5c8tHoO2DlvowfbU2pytjzfi48ZBCQ=
X-Google-Smtp-Source: ABdhPJw4f/sFtcvpHa2uTq4aa/F0I5jmti2n6/aVV54tiirWtSCNWBaast9D8W5BKBxXOp0H0hWw6ebpTA+zPUdinYQ=
X-Received: by 2002:a2e:9496:: with SMTP id c22mr4366325ljh.159.1591627241015;
 Mon, 08 Jun 2020 07:40:41 -0700 (PDT)
MIME-Version: 1.0
From: "Ricardo Ribalda" <ricardo.ribalda@gmail.com>
Date: Mon, 8 Jun 2020 16:40:24 +0200
Message-ID: <CAPybu_2pgXgLsvdgLhn60emg5Qh8krRQRNKzQbB5LHfec_YUDQ@mail.gmail.com>
Subject: devtool and multiconfig: Bug or feature?
To: openembedded-core <openembedded-core@lists.openembedded.org>, Jan Lorenzen <jl@newtec.dk>
Content-Type: text/plain; charset="UTF-8"

Hi

I am trying to use devtool in combination with multiconfig for the
first time, so probably I am doing something wrong.

I have created a very simple multiconfig

cat build/conf/multiconfig/arm.conf
MACHINE = "qemuarm"

And then I want to modify bash:
devtool modify multiconfig:arm:bash

If then I try to run:
devtool build multiconfig:arm:bash
NOTE: Starting bitbake server...
ERROR: No recipe named 'multiconfig:arm:bash' in your workspace

So I run:
devtool build bash

But that builds for x86 instead of for arm...

Simply patching check_workspace_recipe does not do the trick:
@@ -145,6 +145,8 @@ def check_workspace_recipe(workspace, pn,
checksrc=True, bbclassextend=False):
     is present.
     """

+    pn = pn.split(":")[-1]
+
     workspacepn = pn

     for recipe, value in workspace.items():


Any idea or documentation to follow?

Thanks!


-- 
Ricardo Ribalda
