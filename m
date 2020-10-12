Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.29540.1602461258142819970
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 17:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@taitradio.com header.s=google header.b=ZNH4wMTF;
 spf=pass (domain: taitradio.com, ip: 209.85.166.193, mailfrom: douglas.royds@taitradio.com)
Received: by mail-il1-f193.google.com with SMTP id p16so5873469ilq.5
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2020 17:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=taitradio.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ZSbwdBqlzZ6qkPPZ0T1MphOjcmQ3JTjTfTAgDwsK63E=;
        b=ZNH4wMTFW0hbjM3frLjhpVu8oZgMzRMZOIP6OyxMfobXM7CU81uCfaSVwuyLfq5W/N
         0O0jQzd6P8t6COWsRQRBPtfWhE8brLtxOrNH7N2AgaUD1lYRutGZPqBqA0Q4wlWFFzVw
         86b2qIaGxmSWckcX49H2BVJHieF73e5/NUHEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ZSbwdBqlzZ6qkPPZ0T1MphOjcmQ3JTjTfTAgDwsK63E=;
        b=krrcq/L2E84Bbh52Og5FjJ+HyyY/sKTpLUO/YBUPS2EOccUwdICBrE2nFivpX5R1Wb
         wsPD6Pavt7YM2iRCZOLAowyRGLfso9BykmnAYsIWEWvk0VucJEe0M8sKll3Pvk+2icUE
         BP8jw+eoKNMyB/L9xNz3AmK5R49c6Zo0WwFSNiI/CiRgP5zd8zilybwr5h/CaLcvxQSj
         2CzSrSrHnyClCl6TOrfB4Of8FdEOTI+m1zRWq9riFhrO+hGoPjFzsHLCSrjT0WN4GNRk
         7ZyLyPWZotPACypjKaiZ9wt4XWzK2Prp5AdQYSM9if6lH1oiKe8PyLHU4+lF9NfiPEr2
         8LHQ==
X-Gm-Message-State: AOAM531rhLab6d5ODdM0MYVXqY4Y8ZkYmP3VD35h5x/gez4sxb+DNr5I
	Yss6qlHP8UjNhziJ0XGFo9HfWgZAafA8Os/o8Bkbx7/9H9RIb3Rqgcg3uZi0cg3jWkduLJTSHGi
	VFB/Dz+8pTJXm5d3uZdEz+L6thDTFaVLmyTI3aFhrqZrVB2BOp+rCCcVH
X-Google-Smtp-Source: ABdhPJw+bXIgpLJrj/tjgA5LDNjiHQgh2H8ZeguKRYUavC03jofGra4pkiWSeaipRh7QdBgBnGG1JjSUs+OdI2aHaG4=
X-Received: by 2002:a92:de0f:: with SMTP id x15mr3704164ilm.164.1602461257212;
 Sun, 11 Oct 2020 17:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
In-Reply-To: <CAFimOt5fQ=0JKpteCCAbDg14u-itABV7MEULuQEm3dUTFj89Lg@mail.gmail.com>
From: "Douglas" <douglas.royds@taitradio.com>
Date: Mon, 12 Oct 2020 13:07:26 +1300
Message-ID: <CAFimOt7ekd6HpQBk9qyyVrk3xGeR3-YTRMQNKiJ05s2n2rxmMA@mail.gmail.com>
Subject: Re: [PATCH] externalsrc: No single-task lock if S != B
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Allow different recipes to build things from the one external source tree in
parallel, but only if the build is happening outside the source tree.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 3618b99a86..88408add71 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -86,7 +86,7 @@ python () {
             if task.endswith("_setscene"):
                 # sstate is never going to work for external source
trees, disable it
                 bb.build.deltask(task, d)
-            else:
+            elif os.path.realpath(externalsrc) ==
os.path.realpath(externalsrcbuild):
                 # Since configure will likely touch ${S}, ensure only
we lock so one task has access at a time
                 d.appendVarFlag(task, "lockfiles", " ${S}/singletask.lock")

-- 
2.17.1

-- 
This Communication is Confidential. We only send and receive email on the
basis of the terms set out at www.taitradio.com/email_disclaimer 
<http://www.taitradio.com/email_disclaimer>
