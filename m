Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.1206.1596646922554291149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:02:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QHp3PiZm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id l2so30850207wrc.7
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 10:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=x/ZBgwOlpAGH1xnIOHOXkZjDS0KwskKS0f+YazrFthY=;
        b=QHp3PiZms+s16Cxxj9SYeQSm9fhsT9S5eHfUvJy1Y0wLe0+Xjhel9QWA/I+BrQOf2l
         jVqX8FBnFXSL1LjsfccFRqwwXXBHQr8eRbGcM7moQEfIuAqzR94ICP7Y5RGH7On2emkD
         zbcH0TL9qFBqOh6/grmpjB5oTZLenV7s/2+vU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x/ZBgwOlpAGH1xnIOHOXkZjDS0KwskKS0f+YazrFthY=;
        b=EQnmkjNrUkq6avOnGvQxNiLCeEVudgb5QZHgiNw/LVQfyBB9224fPYYre7wdPT47oL
         KfKKSI8LUthoUIQTyyHNZ9D5O3TFsHo7lXKRa7uC6K0bgyZ/dO+Fjws5WPQTGZIONhDw
         KWFgigBRdXGB5rQo7NjmLDcXD3wk+Rdms+VadfMgXbnr8yv2JqfBT2ei3DXzZBe7DDG1
         rZ4m3kikjAj0jotqnTg/8fGmBFtn+v396oFRGxB7gutwvHXQBS+DxWpOoolLw19aT5fk
         Wo6ULXuaXCR0eCZMYBhuiG+ZkPPAYS6thxV3cKEXMY30FQdMS8QYD9X/GGE/pXW+am8B
         FiMQ==
X-Gm-Message-State: AOAM5306NIoZPBDD/xItpO1eRGWdBIwQbOuARCUVn/qx0sCsOKQJHH2N
	5azI0Ut9V6cledGpPX77xuW6VA==
X-Google-Smtp-Source: ABdhPJzSLxl5g0donmtiwB09CEVDBFymRyTXaoy2Ku0dnYLd75ZC04dq5ZtMgNA7WJPCc7p9658RtA==
X-Received: by 2002:adf:b18d:: with SMTP id q13mr3565200wra.256.1596646920994;
        Wed, 05 Aug 2020 10:02:00 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.8.8.2.4.4.9.8.7.6.b.0.9.5.0.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7059:b67:8944:2881])
        by smtp.gmail.com with ESMTPSA id y16sm3302323wrr.83.2020.08.05.10.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 10:02:00 -0700 (PDT)
Message-ID: <2b59e9a89d74ab2d63f014945403af113d374e8b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] ltp: make copyFrom scp command non-fatal
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matthew <matthew.zeng@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 18:01:56 +0100
In-Reply-To: <20200805155018.8076-1-matthew.zeng@windriver.com>
References: <20200805155018.8076-1-matthew.zeng@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-08-05 at 11:50 -0400, Matthew wrote:
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
> index 090b40a814..1b78e830d4 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -61,9 +61,12 @@ class OESSHTarget(OETarget):
>          self.logger.debug("[Command returned '%d' after %.2f seconds]"
>                   "" % (status, time.time() - starttime))
>  
> -        if status and not ignore_status:
> -            raise AssertionError("Command '%s' returned non-zero exit "
> -                                 "status %d:\n%s" % (command, status, output))
> +        if status:
> +            if not ignore_status:
> +                raise AssertionError("Command '%s' returned non-zero exit "
> +                                     "status %d:\n%s" % (command, status, output))
> +            else:
> +                self.logger.warning("Command '%s' returned non-zero exit status %d:\n%s" % (command, status, output))
>  
>          return (status, output)
>  
> @@ -113,7 +116,7 @@ class OESSHTarget(OETarget):
>          """
>          remotePath = '%s@%s:%s' % (self.user, self.ip, remoteSrc)
>          scpCmd = self.scp + [remotePath, localDst]
> -        return self._run(scpCmd, ignore_status=False)
> +        return self._run(scpCmd, ignore_status=True)
>  
>      def copyDirTo(self, localSrc, remoteDst):
>          """

I'm a little worried that these warnings may appear from places we
don't expect them. I can run the test on the autobuilder and see if
other tests trigger this I guess, I wondered if you'd looked into that?

An alternative may be to set ignore_status=True but check the return
code at a higher level and issue the warning there?

Cheers,
Richard

