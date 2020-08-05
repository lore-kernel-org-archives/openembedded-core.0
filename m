Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.3037.1596652076026917493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 11:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xu87AohF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id z18so38049597wrm.12
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 11:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=GvfKVrtfngx652z0OiZXoS6sg1d9BMUuuCHcOJoUSYg=;
        b=Xu87AohFeIuyxGvmpXlkNIoCZAyiaJ5weKB+pA3hsEp9U1WJm8FW4/ShoGyIGV/5XD
         zDekLSRvJdWWfVTNOviyFySFu5R1exPDf63BvasnbrbW+ZbBwYUNxtKd0lHcNM+iBiqX
         RRF/F4//Q34T5sTiQZHlsg/S7e5rkPXhF+iWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GvfKVrtfngx652z0OiZXoS6sg1d9BMUuuCHcOJoUSYg=;
        b=oYcs+hBWbLThB6Uu3t3uGd1oOlQTDpWqLp/9bL766j56yvggKZEfVxMhvfJ47biQz9
         mUoLhU0eMGH5QhRIMNQOcBm74jM/IYQsyimzMMPD1FuS2SQVXpObdypeVq64mN79gQx4
         EMzW6OLsyF2al41u85lYJklQPcR0zJuWLhcy+HLpzNiJNAF48WjpUtv4Nw3lou0vQrAX
         v8kxvQ5lcYLI4ldYwFbAA52d8RCNXfdum09pyEROHxtoEsMsjAaNkcmRjiMbcJNBm4ic
         zEnqpu+QJ6G5mR6fpdP3QAAICixT9UsuGBC7zdDtXO+1XmxxNNpA3niaexTfBIIIBg9g
         10ug==
X-Gm-Message-State: AOAM531bwSLN1LCggdiK/jWneNnfLx+faaZ2GZEXLY+a5MIV55bQ0pZP
	bi7Nc6nvd4D32Z4YfA0+73kuIQ==
X-Google-Smtp-Source: ABdhPJzQXcGzFMP65O9hCLxGpEFoanOSINzRZ8/wZEeucnvE9ANwwgHt+vt/6ps18YPLo3HmUKntNg==
X-Received: by 2002:adf:b602:: with SMTP id f2mr3702892wre.186.1596652074429;
        Wed, 05 Aug 2020 11:27:54 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id m14sm3733828wrx.76.2020.08.05.11.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 11:27:54 -0700 (PDT)
Message-ID: <83a3c9a961bec6ed39fb48d67a3c615e13d05fa3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3] ltp: make copyFrom scp command non-fatal
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthew <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 19:27:53 +0100
In-Reply-To: <20200805181025.6361-1-matthew.zeng@windriver.com>
References: <20200805181025.6361-1-matthew.zeng@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 14:10 -0400, Matthew wrote:
> [YOCTO #13802]
> 
> Make the scp failure non-fatal so the ltp tests continue to run and
> the rest of the logs will be available to see afterwards.
> 
> Signed-off-by: Mingde (Matthew) Zeng <matthew.zeng@windriver.com>
> ---
>  meta/lib/oeqa/core/target/ssh.py   | 7 +++++--
>  meta/lib/oeqa/runtime/cases/ltp.py | 2 +-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index 090b40a814..aefb576805 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -107,13 +107,16 @@ class OESSHTarget(OETarget):
>              scpCmd = self.scp + [localSrc, remotePath]
>              return self._run(scpCmd, ignore_status=False)
> 
> -    def copyFrom(self, remoteSrc, localDst):
> +    def copyFrom(self, remoteSrc, localDst, warn_on_failure=False):
>          """
>              Copy file from target.
>          """
>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>          scpCmd = self.scp + [remotePath, localDst]
> -        return self._run(scpCmd, ignore_status=False)
> +        (status, output) = self._run(scpCmd, ignore_status=warn_on_failure)
> +        if warn_on_failure and status:
> +            self.logger.warning("Copy returned non-zero exit status %d:\n%s" % (status, output))
> +        return (status, output)
> 
>      def copyDirTo(self, localSrc, remoteDst):
>          """
> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
> index 6dc5ef22ad..da529ce482 100644
> --- a/meta/lib/oeqa/runtime/cases/ltp.py
> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
> @@ -78,7 +78,7 @@ class LtpTest(LtpTestBase):
>              # copy nice log from DUT
>              dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
>              remote_src = "/opt/ltp/results/%s" % ltp_group
> -            (status, output) = self.target.copyFrom(remote_src, dst)
> +            (status, output) = self.target.copyFrom(remote_src, dst, True)
>              msg = 'File could not be copied. Output: %s' % output
>              self.assertEqual(status, 0, msg=msg)

The idea of this change is so "the ltp tests continue to run" yet if I
understand that code, a copy failure will throw the assertEqual and
hence stop the test so we don't get all the other logging information?

Cheers,

Richard

