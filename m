Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.1244.1596649143986942380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RM6TnbcW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id f1so40948220wro.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=wIsIJ4QdWbQ5Kf3JMcK1xSUw32ODqoMCjxJGHAoQRr4=;
        b=RM6TnbcWUSQFlVVS7Gtgz1iSZEB1S/VWG+lVdkvBXL2SalLcsE6V8x4VnM+eGmFXuF
         wDsNweF6I7hP0uJdkwr0LuOPDrJhYlaxtuXGTUTdkTnaNpgeWaxz9QWbwHDWXUQxnifl
         nVv84X8myuo8+I2JVLknrxOSHZQ6JN+Prt/A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wIsIJ4QdWbQ5Kf3JMcK1xSUw32ODqoMCjxJGHAoQRr4=;
        b=D2r3BLDjDx1c5cO/dxaFwSG9ECQjsZ9ME4yxSOSMs3rcZY3a7p6hw9bG6+2kyPFuaF
         mHIy5/OBna7Wyo39KVqhLPXNgCqH0DDxXuG2yLEYCMb3Di1M33ouoE1GRWqqN7n77clf
         okxyHGNDxU/GCN7f59d3AUkyUkUsG2diaWhXDoS3xPMCI/Ed28P58OPTpy+hMp7hzLjN
         BkixlFadeMpfsvUykUAw2POgKoJf1isEv3ScwS6s6hLGgwBF0iYQQtQxZer7smCSLjT+
         qxpPmeMx0UEegMqZB6V60dgwVoyfiEWZ4tsOqMX3ByrpD/OgBh23Kigr8l6Lrbyu1EpP
         K1Mg==
X-Gm-Message-State: AOAM532nuvCwvGWPvinV90dbhKBJ89UF7Ga5F2aifPry7i6wpFNvm7zz
	TuS30SscOTsyludlge9KZwTw/A==
X-Google-Smtp-Source: ABdhPJwzfPUlekRs/BxNFHCNmPwM2+8EwWsBAOvmxU+WkuYZ7ChwI7hW7auJlXsqmSAlunvnSUqbVw==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr3986893wrs.124.1596649142429;
        Wed, 05 Aug 2020 10:39:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id n24sm3694946wmi.36.2020.08.05.10.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:39:02 -0700 (PDT)
Message-ID: <202cd662179307a24cd3c55bbaca2a4b91c48f26.camel@linuxfoundation.org>
Subject: Re: [PATCHv2] ltp: make copyFrom scp command non-fatal
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 18:39:01 +0100
In-Reply-To: <20200805171547.2515-1-matthew.zeng@windriver.com>
References: <20200805171547.2515-1-matthew.zeng@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 13:15 -0400, Mingde (Matthew) Zeng wrote:
> [YOCTO #13802]
> 
> Make the scp failure non-fatal so the ltp tests continue to run and
> the rest of the logs will be available to see afterwards.
> 
> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ---
>  meta/lib/oeqa/core/target/ssh.py | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index 090b40a814..e891a4bbfa 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -50,7 +50,7 @@ class OESSHTarget(OETarget):
>      def stop(self, **kwargs):
>          pass
> 
> -    def _run(self, command, timeout=None, ignore_status=True):
> +    def _run(self, command, timeout=None, ignore_status=True, ignore_error=False):
>          """
>              Runs command in target using SSHProcess.
>          """
> @@ -62,8 +62,11 @@ class OESSHTarget(OETarget):
>                   "" % (status, time.time() - starttime))
> 
>          if status and not ignore_status:
> -            raise AssertionError("Command '%s' returned non-zero exit "
> -                                 "status %d:\n%s" % (command, status, output))
> +            if ignore_error:
> +                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
> +            else:
> +                raise AssertionError("Command '%s' returned non-zero exit "
> +                                     "status %d:\n%s" % (command, status, output))
> 
>          return (status, output)
> 
> @@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
>          """
>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>          scpCmd = self.scp + [remotePath, localDst]
> -        return self._run(scpCmd, ignore_status=False)
> +        return self._run(scpCmd, ignore_error=True)
> 
>      def copyDirTo(self, localSrc, remoteDst):
>          """

That isn't what I meant, I mean something like:

diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 090b40a8143..cbc56f2e0ad 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
             scpCmd = self.scp + [localSrc, remotePath]
             return self._run(scpCmd, ignore_status=False)
 
-    def copyFrom(self, remoteSrc, localDst):
+    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
         """
             Copy file from target.
         """
         remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
         scpCmd = self.scp + [remotePath, localDst]
-        return self._run(scpCmd, ignore_status=False)
+        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
+        if warn_on_failure and not status:
+            self.logger.warning("Copy X returned non-zero exit status %d:\n%s" % (XXX, status, output))
+        return (status, output)
 
     def copyDirTo(self, localSrc, remoteDst):
         """

so that we enable this in the specific case og the copy we might accept failure for.

Cheers,

Richard

