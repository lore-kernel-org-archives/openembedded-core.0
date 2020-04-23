Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.2745.1587685388467953985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2020 16:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VU+JNJlJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id v8so8658486wma.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2020 16:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jcBhIeCg7ZlHy+QVtF5yBK0N+UIUm34tSznG+7/sS+Y=;
        b=VU+JNJlJnQX4pX5MMI5eY6M7R1iHt8RuVnyR6PFV/Sr2jF+orIFWePYbRpEd83dJSg
         eFcpnE7hKZjGe4LPgVCZ9RukWSKamkPpP+YLG5cKRRT3Wd2zomz6E8b3EG1zbsQ2pT2J
         Fs9zcGc/0+++Sj0AFbsxOaTuVNMxcKnBKQEno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jcBhIeCg7ZlHy+QVtF5yBK0N+UIUm34tSznG+7/sS+Y=;
        b=lFOabxqf/mG2mmKA0SpyMq7FfJidtmU84qs0c13JXdSmNrzGkGCcNuda4kdpDVevFh
         dqpe3Dh4LcZ4LbTxVNqlEukugIh2hUWHW/ba0eBWJxggkPcROWjJaE+EnQTJ1JhYRfSl
         vRr5hJuEXALmATz9jqsnsT84m49t+PNb1M8fOdqraaFYymVUYlM1pRaoqG4rnuxMb0O0
         jIVZVP1rhpl4YEQa2RZeM8gizlqktQh3BcG5ahUDL8CMpXzKNf2N8lCamr3PUPcrc8pB
         X6xbvgoiz29l4icfr/PbjruvdlWnRyOHzBmNs3q0WGmhprdDPIFoYNcpbKvnn314ErfE
         n0Sw==
X-Gm-Message-State: AGi0Puazyz9G51F+X4cx+IWgFLxFidbM2PSf1Q5Yfih2Cm5gwVlfcFFo
	N607RYz09xJUiL8gggIHOsMq6w==
X-Google-Smtp-Source: APiQypJ1dzvABzZG1V0/Ug8f2+X/ajDHsXaRcH32snz/Vmp4IVndriu+mPDwD1rPQLrAAnXdwHVVXw==
X-Received: by 2002:a05:600c:441a:: with SMTP id u26mr7211112wmn.154.1587685386942;
        Thu, 23 Apr 2020 16:43:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id t2sm464695wmt.15.2020.04.23.16.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 16:43:06 -0700 (PDT)
Message-ID: <f73b90e0d744276d6929bb39518a962dc07e3e4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] Changing DISTRO_FEATURES / build directory
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: chris.laplante@agilent.com, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2020 00:43:05 +0100
In-Reply-To: <SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
References: 
	<SN1PR12MB2480D4132DF632E5161532E38BD30@SN1PR12MB2480.namprd12.prod.outlook.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-04-23 at 19:12 +0000, Chris Laplante via
lists.openembedded.org wrote:
> There is a familiar message in sstate.bbclass that explains: “… It
> may be you changed DISTRO_FEATURES from systemd to udev or vice
> versa. Cleaning those recipes should again resolve this error,
> however switching DISTRO_FEATURES on an existing build directory is
> not supported – you should really clean out tmp and rebuild (reusing
> sstate should be safe)…”

We should prune that message down as there are a few ways you could hit
it and not touch DISTRO_FEATURES, most of those are more likely now.

> But the release notes for the 2.0 release suggest that it should
> work: 
> https://www.yoctoproject.org/docs/latest/ref-manual/ref-manual.html#migration-2.0-automatic-stale-sysroot-file-cleanup
> .
>  
> So, is changing DISTRO_FEATURES but not changing the build directory
> expected to work?

Should work but has bugs.

There were some fixed around the thud/zeus timeframe.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=13702

is a recently reported one that has patches in master-next (both to fix
and add a test case).

Is there a failure with reproducer you have? Which release?

Cheers,

Richard



