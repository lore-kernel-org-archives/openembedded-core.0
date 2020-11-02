Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web08.29752.1604317033104323646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 03:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=h88peZ/j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id h62so4341952wme.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 03:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4o5yz0cQwa0H6WjfIOtfWojst7ku68E47IMF79+nDtQ=;
        b=h88peZ/jL7FSSn/6k4QGDI7GGLOZgwJ/S5LZvMPen56/DODz19vBx/TBR1KiglNqhT
         Vkrej3OCzq3Z3kQeVSHtN+Syx+U11C57lQIuEy9qGZ23rQfyf08vU8/H0ZaBO5Z/JmG3
         pXxZ0m4O+eR0WrQrQYWwh5dQB15/pFiYKyv/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4o5yz0cQwa0H6WjfIOtfWojst7ku68E47IMF79+nDtQ=;
        b=reH4n/I6PKTnyLydVSCK/i30N38yRMKV4mTDr1CiIgdxaLA2xuyLgtuIokGb+lCiH+
         Lx6CB2seDy8BnhQtOxkdVjoq2crXQ6qthX03xBIVSBZ+Oieorq37XARA/s13KKU7hdhv
         BZ9XtC2cc7GEr7BfUhd9rFVF4wNUM4W056Bv8fBoi3sgKKEUMeftNCwNuEKJ1C75kBte
         SlPyYs8PkRswtVAyQIGCnu3iKW1dZg3UKm//+8JlEBt17tVMAwyEy4Z7F86+8Zxui/lT
         XMvgQYCOylVQnXuJZ4wOQ8MZx0ZqhCq+6bZRJ1DURFCwZSDJc0UcwUSARR4U8sxi99qS
         zRRA==
X-Gm-Message-State: AOAM532Kc2SNFanz0+DhZcjsFQeOOW331/RdCz3K4uV1dydu8iPqP/I3
	OzTBrBlmvvLOadKd1ic8XMTuYVe8jx83eQ==
X-Google-Smtp-Source: ABdhPJxjm5c9EpLZmh+PdcWinxs21yL635XlEORADlVBTHhKz5S+ifRvTgSd1NT+P8aicfP9CtkGkA==
X-Received: by 2002:a7b:ce05:: with SMTP id m5mr18272175wmc.16.1604317031410;
        Mon, 02 Nov 2020 03:37:11 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id t19sm16546621wmi.26.2020.11.02.03.37.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 03:37:11 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sstatesig: Remove workaround for bitbake taskhash bug
Date: Mon,  2 Nov 2020 11:37:10 +0000
Message-Id: <20201102113710.378227-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When trying to lock an individual signature, we see the checksum calculations
of dependent tasks failing. The fix is to remove a bad optimisation within
bitbake but with the removed, we need to remove some bogus code with
OE-Core's sstatesig code too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/sstatesig.py | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 64fb84ec924..4ea29cbdfc3 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -162,12 +162,7 @@ class SignatureGeneratorOEBasicHashMixIn(object):
             else:
                 return super().get_taskhash(tid, deps, dataCaches)
 
-        # get_taskhash will call get_unihash internally in the parent class, we
-        # need to disable our filter of it whilst this runs else
-        # incorrect hashes can be calculated.
-        self._internal = True
         h = super().get_taskhash(tid, deps, dataCaches)
-        self._internal = False
 
         (mc, _, task, fn) = bb.runqueue.split_tid_mcfn(tid)
 
-- 
2.25.1

