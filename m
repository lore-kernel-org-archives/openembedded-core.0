Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.2884.1622662250729513165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 12:30:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=el03OPWi;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.45, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qv1-f45.google.com with SMTP id u33so1932938qvf.9
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 12:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:date:message-id:subject:to;
        bh=erwDgK8nZAM5Vp4IyAwOhf1o8/yTxocZvEJMSLgAUE8=;
        b=el03OPWiWjUYjJcIcJg8CiUry8naMakl1Dve33vUYP+HOCyzorko7taQnYxOVUCCmF
         /igmrUtxJfwfIcjTc3h63nlD3rMXxinhQ95sJKeFOJswmFlDZnFNE1oGIcAyT/uiTaYA
         4fIZQ3VqCXSBTBU4Tv/gKoCrg9pYXfEGTLXxoGdyk5SvWQH26JQ3//02NjlrbgnDOiQW
         ccQbGcB4I5Yas3pT2IeLvfXfDnXhBUOpB8C5VmKb3KshHufDpW4djQKifDizkloD8LcD
         z9lC07cmLQKOW7SpWltlKMI2ALYKOBoj4GEF5XJvQBpk7Iq7xrSd+3q9x8otCRWicqJo
         i1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
        bh=erwDgK8nZAM5Vp4IyAwOhf1o8/yTxocZvEJMSLgAUE8=;
        b=S1KUESNGMyDVylsss+34/PO/mR1V4COigptPRXM3Y8W3hqEHpCS1jeFPm77gsraAma
         bXMBw12ZjQ5Ctbr14UvyeKmW2PCe1oY8cTMwKRmj+R1hygr2f5SCC3169deDn0bz+7cw
         Sm1ZAWpsELWE7iGW0v8xNdk/jtsRmBqtNhW1uJwxm/s5MO7tVwbLYaGztM2UtIfIZwFi
         8jjZY4SOc52LEB6FjRePlh+uUy6kdtbBHxtK9DvxSdTK2a70L9AfwbjPZfC4e+BxNmJJ
         cB3ZExfjbX41EPDCddC4+IrkOi+Zmogs97M18zmcIhIOMKzCnQFwwenNGB18oImjIVr5
         hpLQ==
X-Gm-Message-State: AOAM530LBLa/CUX5GVj92uIInH6gntWrHGdpoHRpUUoV/Hp/O8QWMbYj
	QLISghSK9dMlu6OBlPMnn4sCN0HcGo61TH2X
X-Google-Smtp-Source: ABdhPJyMZxJ2cdyYCDRpzV1EMCHZj5hE6lJwiixvLPh9MTkQbBl5z9DosZAlPweY9wqqpEZ8er3k/g==
X-Received: by 2002:a0c:a323:: with SMTP id u32mr13413391qvu.14.1622662249587;
        Wed, 02 Jun 2021 12:30:49 -0700 (PDT)
Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id t6sm448252qkh.117.2021.06.02.12.30.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 12:30:49 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f43.google.com with SMTP id eb9so1939405qvb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 12:30:48 -0700 (PDT)
X-Received: by 2002:a0c:c612:: with SMTP id v18mr30226567qvi.20.1622662248349;
 Wed, 02 Jun 2021 12:30:48 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 2 Jun 2021 16:30:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKp99RJLmsXNOw2xj_YgNf4c0u0aGM5L8d+_=WZCD4gjYA@mail.gmail.com>
Message-ID: <CAP9ODKp99RJLmsXNOw2xj_YgNf4c0u0aGM5L8d+_=WZCD4gjYA@mail.gmail.com>
Subject: systemd's ldconfig.service failing on first boot
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

I've been seeing some errors in first boot of devices, based on
dunfell, where the ldconfig.service fails as:

... ldconfig[138]: /sbin/ldconfig: Renaming of /etc/ld.so.cache~ to
/etc/ld.so.cache failed: No such file or directory
... systemd[1]: ldconfig.service: Main process exited, code=exited,
status=1/FAILURE

I didn't find any reason for it to fail. A fancy side effect is it
fails only on first boot after image installation. Any ideas?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
