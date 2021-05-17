Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.17001.1621247202646541296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=G/8av+ls;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id d11so5782248wrw.8
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/zz2jM+A78JzaqAiIGiHkMAcYkALk0vw3cUlNBaHA2s=;
        b=G/8av+lsz9gGDERAkwnOAPgoqCzrWaOm2+hXQpIaASsEd2+EM2BcP5gc7UTBN1edNO
         62BUzU0jKvUJ9VCJs7XXj2SRqTItpciYQiEc58c7kJdqmi+uKOi98CHSVtbut8MH2aQg
         Ci+ddN6QPk3n8l94Z/aHuTpYh9YJokjnR04ik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/zz2jM+A78JzaqAiIGiHkMAcYkALk0vw3cUlNBaHA2s=;
        b=tLRKj+w+MFOGGWhioJrcHLdkrO88a24ZrFy+qBi+2q5zPYELHxq0oR8/5mwy6uxFJ5
         rpsmiLEJZTK9tlBM5CGyzf9AL7LKUKa3IhcCAtD8wIVvRnkDlBjAjyu5cf1ci+vVxvW7
         Rb6O/RWQkjRvdjn4n4MsepSiVFT1Hrxjeswpsij+uX3SFnLikbIwSdKn+2K3gO67cGE+
         7N05IVIWRUpNZePNSiCgTU6+C7c35hc4XgarF6apnfBVIR1/lTTdXmyOESJSj6H6v4kO
         EMN2yi8GHKhFLOJZq5dGhZujyOhDGLyBmcd+hfHkc9udt9TvBwyprm2aZV3PEPG3EamS
         xqwQ==
X-Gm-Message-State: AOAM5336nb+acnGx85JvRWp8hoVNbZDcvbBw4jd581MEYoFsVN1v72K8
	m+wC+IDJtL8BUFSoCA3LszozDg==
X-Google-Smtp-Source: ABdhPJwrvACtoE2yUE0w87aAXma3GPlPQ9u24jFNWUaSIxD+3IKSE1X9pQXiIhcKMMInAzM8Xz817w==
X-Received: by 2002:adf:ee89:: with SMTP id b9mr37462912wro.139.1621247201117;
        Mon, 17 May 2021 03:26:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc? ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id k20sm5749751wrc.1.2021.05.17.03.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:26:40 -0700 (PDT)
Message-ID: <4e37ea739c49c7df05463002360abdfb62bead69.camel@linuxfoundation.org>
Subject: Re: [OE-core] cml1.bbclass: Return sorted list of cfg files
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 May 2021 11:26:40 +0100
In-Reply-To: <necP.1621246961431634424.VVq4@lists.openembedded.org>
References: <necP.1621246961431634424.VVq4@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-17 at 03:22 -0700, Volker Vogelhuber wrote:
> The commit dee41e92f0efac7e453597bed4b4c02f867e3aa9 has introduced a behavior 
> change when adding different cfg files configuring the same configs.
> 
> So e.g. when configuring busybox, the default recipe adds a syslog.cfg 
> which enables CONFIG_SYSLOGD=y. So far we had a .bbappend file that adds 
> another .cfg file "disable_syslog.cfg" that changes this to 
> "#CONFIG_SYSLOGD is not set". 
> 
> As the SRC_URI files are now sorted alphabetically, this results in the 
> disable_syslog.cfg being passed to merge_config.sh before syslog.cfg 
> which in the end is not what we intended.
> We solved it now by doing a SRC_URI_remove in the bbappend, but I'm 
> not sure, if that sorting is causing side effects in other places as well.


I think the issue was elsewhere and we should revert this change.

Cheers,

Richard

