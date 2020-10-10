Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.5848.1602333868292305269
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Oct 2020 05:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TWwdJA72;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h5so2965075wrv.7
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2020 05:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3KQqCA6y+W4IVPfE/Qymq9yM5B72pBceH5Ec6uNpsNg=;
        b=TWwdJA72eK4NPOccR+LryPBVaTph4IYo9iPqwDlqMEiiqFq7+J+uVnCGFrvPOsWIIi
         DYzUL8hANF6aLTzzAzY0ztH/+zP4dVtOKp1EvuQEkm+596lCaeEgj5rG/2wQ1wOMng3z
         1B7eIop4O4OCI0XK8yiUWAEMOMqsRnGUwKIiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3KQqCA6y+W4IVPfE/Qymq9yM5B72pBceH5Ec6uNpsNg=;
        b=t3QKCRV9LSKcjKY4DodG1mxY1stw44MJXvwGLq+mxV/kbeTe10lQaRh9nLQyGSHZ+p
         zcK5AyTjm8Lifj7CCyP5DiMbWNhjgdGwY3acdHt9bJ6zyaThn7x9ewEGiP6WkQNx6DUz
         0kANfTuHhciaU4uThgPN6eEE7pYq2TENZ5FR2l+CQcWLJzQEH26JNcGHbEg4HoJ20Tku
         6iBiR9/CoA8xRqT79mhjCIVI0iPn06ZK0qmQqBnvHkxBCTxqRwXBgQ8drm3eFj3tLtZd
         hVD+E7FnqEeaUBnlleqqimMI5QVCnRM6Qdnf0Q26F56wY8KXXq216g7h0fQe3nYI7e+B
         0ePQ==
X-Gm-Message-State: AOAM530Kg60I4cL3nPRRemTa3yreeptRAR9bY9n2i2A1onmqyyjcnHSk
	BHJqJdUE3WjfpB0ORymhPDeX3Q==
X-Google-Smtp-Source: ABdhPJyljm00rUMIioFyWdPhBGPOgbw7esnroBd/TaKtFPfgyguBgJ0WqjJBqIRf/DVb9h0Yo3gKbQ==
X-Received: by 2002:a5d:6a0d:: with SMTP id m13mr8981981wru.161.1602333866480;
        Sat, 10 Oct 2020 05:44:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id x1sm8360784wrl.41.2020.10.10.05.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 05:44:26 -0700 (PDT)
Message-ID: <ce44353e98df08b32625fed9493b0e1542c03a23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] layer.conf: fix sanity error for PATH variable in extensible SDK workflow
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sourabh Banerjee <banerjee.sourabh@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 10 Oct 2020 13:44:25 +0100
In-Reply-To: <1602186546-25220-1-git-send-email-banerjee.sourabh@gmail.com>
References: <1602186546-25220-1-git-send-email-banerjee.sourabh@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-09 at 01:19 +0530, Sourabh Banerjee wrote:
> Sanity checker reports following error for the PATH variable,
> when bitbake -e <recipe> command is run in an extensible SDK workspace.
>    PATH contains '.', './' or '' (empty element), which will break the build
> 
> In case of extensible SDK, PATH variable is formed with two consecutive ':'
> as bb.utils.which(d.getVar('PATH'),'bitbake') call returns an empty string.
> 
> This change adds the ':' only if the bb.utils.which(d.getVar('PATH'),'bitbake')
> return a valid path.
> 
> Signed-off-by: Sourabh Banerjee <banerjee.sourabh@gmail.com>
> ---
>  meta/conf/layer.conf | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 38df0f3..ff9c004 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -102,4 +102,5 @@ SSTATE_EXCLUDEDEPS_SYSROOT += "\
>  SSTATE_EXCLUDEDEPS_SYSROOT += ".*->autoconf-archive-native"
>  
>  # We need to keep bitbake tools in PATH
> -PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}:${HOSTTOOLS_DIR}"
> +PATH := "${@os.path.dirname(bb.utils.which(d.getVar('PATH'),'bitbake'))}"
> +PATH := "${@('', ':')[d.getVar('PATH').endswith(':')]}${HOSTTOOLS_DIR}"

I had reservations about this change but I did put it in for testing.
It definitely causes problems, particularly in oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1448
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/1455
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/1433
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1430

I did try it locally and saw slightly different errors:

2020-10-10 10:46:37,098 - oe-selftest - INFO - ======================================================================
2020-10-10 10:46:37,098 - oe-selftest - INFO - FAIL: wic.Wic.test_change_directory (subunit.RemotedTestCase)
2020-10-10 10:46:37,098 - oe-selftest - INFO - ----------------------------------------------------------------------
2020-10-10 10:46:37,099 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/wic.py", line 642, in test_change_directory
    % (wks_file, self.resultdir))
  File "/media/build1/poky/meta/lib/oeqa/utils/commands.py", line 201, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
AssertionError: Command 'wic create /media/build1/poky/build-st-69370/wic-tmp/test-include/temp.wks -e core-image-minimal -o /media/build1/poky/build-st-69370/wic-tmp/' returned non-zero exit status 1:
ERROR: Cannot run command: bitbake, lost dependency?


The errors are a bit strange and I'm afraid I don't have the bandwidth
right now to try and dig in and understand why this breaks. The patch
does regress things though so more work or an alternative approach is
needed.

Cheers,

Richard



