Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.8162.1598430002271856748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 01:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z5JxTudC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id y8so1026676wma.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 01:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EETQPNhM7oo5ZPNmCuYUaS7NU0e+WtKXX3suhoQnMF0=;
        b=Z5JxTudC3J5xaXoHD5B35VJ0KdDFmGmQ9sUqtn3AHs9doMgeBllH+pgiEqnE58MLJX
         uReqOd9gRqoVeUErd+nWezt/bpuGAqBv1pPEpMpk9CMuYiJ6ZWsPkVJodkbjI/byoX4O
         Zdciid48ajVmER6bzofel6e+EiPQbdrqowCSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EETQPNhM7oo5ZPNmCuYUaS7NU0e+WtKXX3suhoQnMF0=;
        b=P85huHyEZlhea3zjixQafkZEGgKCJqtSnr0iSBIjOm2K2C52fSDrxnPamLvcjajF1P
         GQKFDoS4GNNkBlfdxBRn7QoVKO/b8ePw5AOIZ9LEmvGeDojCjWVYmO4RTgSbEsLKykxv
         Y/jmTB7dieU5HzsfsPc997CgD+Rrd4FKsGfnYvTPssLij8yVrowfYviXn3mppRkD6sgU
         fKc6nzIOb23Lr16eDXBfrjnfOpWaalew0Yy2bF+etIInzz7C3oPyuyf+Z3+8OxuaWQEL
         bVHWd5+eCZFFlSexGblGZWi5RXc1q1ZgUeiM+G0rftq0AsE4NsYnMdRBJzDvWqvZVYiA
         gcfA==
X-Gm-Message-State: AOAM532DXp+OLyyThTurW9oiEMxSM77MC79iXQiv+l43AeYoD0wHxrGx
	CbJvrE5vhoYR1ttEUVgicBKpuMpLmmt8dNgc
X-Google-Smtp-Source: ABdhPJyghkGznPHf0lUyMm0ogLW63DS+401HFYirwv/zftZjoQkBClNSM+HlbXRCjMJwynJOxLU4Xw==
X-Received: by 2002:a1c:8:: with SMTP id 8mr6152418wma.40.1598430000208;
        Wed, 26 Aug 2020 01:20:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.9.b.8.7.0.d.0.8.3.5.0.7.0.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c407:538:d07:8b9d])
        by smtp.gmail.com with ESMTPSA id z6sm3644714wml.41.2020.08.26.01.19.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 01:19:59 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] runqqemu: Show an error for conflicing graphics options
Date: Wed, 26 Aug 2020 09:19:58 +0100
Message-Id: <20200826081958.1462616-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The autobuilder managed to pass the nographic option with "sdl gl" due
to a problem elsewhere. It would have been useful for runqemu to have
errored rather than passing conflicting options to qemu. Add an
error for this invalid usecase.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 7fb5f7db57b..c71f3c4df57 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -456,6 +456,10 @@ class BaseConfig(object):
             if arg in self.fstypes + self.vmtypes + self.wictypes:
                 self.check_arg_fstype(arg)
             elif arg == 'nographic':
+                if ('sdl' in sys.argv):
+                    raise RunQemuError('Option nographic makes no sense alongside the sdl option.' % (arg))
+                if ('gtk' in sys.argv):
+                    raise RunQemuError('Option nographic makes no sense alongside the gtk option.' % (arg))
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
-- 
2.25.1

