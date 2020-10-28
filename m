Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.9762.1603895232886529924
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 07:27:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ItevXip+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id w23so4749687wmi.4
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XsxQMwQZpOMNT2vNLdRDqkihf71OmeUgynRwO23B4rg=;
        b=ItevXip+6YuuYYo/Okz46r9BpzTiRiTPCoyrIZszwpz+YjyiHya1SrCtddIR0BEQis
         kavfRLmOnGcDCNfNinTsDHH+qeKpOHQybPv5eLlpR3JL9EFN2mib1WG4pHr42gXUIvCC
         B9OKakYKv4Yu8iokzMV4cRm3uZECw2OZ4nCMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XsxQMwQZpOMNT2vNLdRDqkihf71OmeUgynRwO23B4rg=;
        b=kpGeGFRIA0CRX1IPUOFKlzrJWbspEcAOya0QDU60Wj7OYVANRLOZxIX5olZMk3gUWs
         HEbGVrYQCCzNOEr3Bdeaoh9pgNRu/ESAjb7ZuZRwFvZxvyBHKUMLcXGNLvHqzQX6idG5
         +Dy3SHfGiNXIaqau66uOD6SrbjP9/tK9F1vhE+8fKsDlxPn0MPzzJVcraHW4KCmaEj8M
         l65L1TbmcKWWgTELj8OCnrblqaioNqVhpCyFtS+J8MIhYANvtw9g8Jyz7mletapPSITp
         5m2clfillZCfLC5l+LkXyA3xyN4em0GI1Vzn5LeEL8HW2GfP53l1zsH9B5eKKszmVZKb
         e1+Q==
X-Gm-Message-State: AOAM530eBvmCoiTJLbrtmtnG+SXHx8mwAT+cgf7V80KcJchUTxrymS1g
	/JujDOhK519ThqLTDBvAs9yGiQ==
X-Google-Smtp-Source: ABdhPJzvB0HFQzZeTm6ZIyj1W1tN+cFaAF2ga41uxwJt5VsR2MKm+AFMlMjvjVdX2UzY3LwFprdtlg==
X-Received: by 2002:a1c:5f44:: with SMTP id t65mr1515607wmb.47.1603895231265;
        Wed, 28 Oct 2020 07:27:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.0.2.3.2.a.1.a.7.6.b.c.7.6.8.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1867:cb67:a1a2:320d])
        by smtp.gmail.com with ESMTPSA id c18sm6302750wmk.36.2020.10.28.07.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 07:27:10 -0700 (PDT)
Message-ID: <55f50d628a5e8082685873fcafdaaf645e152dec.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] buildstats.bbclass: add functionality to collect build system stats
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Oct 2020 14:27:09 +0000
In-Reply-To: <20201023165648.5515-2-sakib.sajal@windriver.com>
References: <20201023165648.5515-1-sakib.sajal@windriver.com>
	 <20201023165648.5515-2-sakib.sajal@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-10-23 at 12:56 -0400, Sakib Sajal wrote:
> There are a number of timeout and hang defects where
> it would be useful to collect statistics about what
> is running on a build host when that condition occurs.
> 
> This adds functionality to collect build system stats
> on a regular interval and/or on task failure. Both
> features are disabled by default.
> 
> To enable logging on a regular interval, set:
> BB_HEARTBEAT_EVENT = "<interval>"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
> 
> To enable logging on a task failure, set:
> BB_LOG_HOST_STAT_ON_FAILURE = "1"
> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
> 
> The list of commands, along with the desired options, need
> to be specified in the BB_LOG_HOST_STAT_CMDS variable
> delimited by ; as such:
> BB_LOG_HOST_STAT_CMDS = "/<absolute>/<path>/<executable> <options> ; ... ;"
> 
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/classes/buildstats.bbclass b/meta/classes/buildstats.bbclass
> index 6f87187233..c68d7bb8a2 100644
> --- a/meta/classes/buildstats.bbclass
> +++ b/meta/classes/buildstats.bbclass
> @@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):
>              f.write("Status: FAILED \n")
>          f.write("Ended: %0.2f \n" % e.time)
>  
> +def write_host_data(logfile, e, d):
> +    import subprocess, os, datetime
> +    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS').split(";")
> +    with open(logfile, "a") as f:
> +        f.write("Event Time: %f\nDate: %s\n" % (e.time, datetime.datetime.now()))
> +        for cmd in cmds:
> +            if len(cmd) == 0:
> +                continue
> +            c = cmd.split()
> +            if os.path.isfile(c[0]) and os.access(c[0], os.X_OK):
> +                try:
> +                    output = subprocess.check_output(c, stderr=subprocess.STDOUT).decode('utf-8')
> +                except subprocess.CalledProcessError as err:
> +                    output = "Error running command: %s\n%s" % (cmd, err)
> +                f.write("%s\n%s\n" % (cmd, output))
> +            else:
> +                f.write("Error running command: '%s': %s is not an executable.\n" % (cmd, c[0]))
> +


I am a little worried about this for some of the reasons Chris
mentions. I worry that not all distros will have a standard location
for some of the tools we want to run.

One trick you could try is to use something like: 

path = d.getVar("PATH") + ":" + d.getVar("BB_ORIGENV", False).getVar("PATH")

which means we'd add back in the original search PATH for the tools as
well as our own directories.

Cheers,

Richard


