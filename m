Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.8873.1602535738832347399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 13:48:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g7ysc3UR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id d81so18435285wmc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=lULggfKXJeKWp++7O7cxTiidWffjOMwazf3fRHXjEIM=;
        b=g7ysc3URX7hrWSxgTYLr8T3gsdMyBYy/LI9rcRocwdqKYDBCqWz8R73rwfTrcI4rcG
         qKKZ3CaYfImsRlmfvCd9YIW9+DOvVqT3NlKQTPspdyvwu0Bu3oxskRaoURsr911WrTtE
         iXVbF6QJMpfb6q4vo/ONIKn9+EOwzNGohDtII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lULggfKXJeKWp++7O7cxTiidWffjOMwazf3fRHXjEIM=;
        b=mQYjOyKNEc+q5sMbOyAqljA51SOw2Zjn/FJxeC81A7Lwr04yMiLT5zTjuY8fUsNyJE
         9PS6g4fVpzdiVRyWhqeH1rH3MVimT8DYQRkZX/U9j0596GMHyDz2+NxnrQL1dUkZv3MV
         nq7eYaGHCVqkt0BZ/TCLOuZdbfbwRITY/xB0MWYArBBBKxsAnpRuGjbDXw83goSudenT
         ry6zFtefK//yYHRTN6M07/lV8yZTq6/47Nkt1+/6jwa8L6IQeC+U3wW7gPqjxNEBv/6y
         JYAWvbfwkQGGFbcm2s0sDudUXFPdeDAP0BZvsGnuEMpzRE83vpQ4NGUyyEapEu4T7ptx
         X/OQ==
X-Gm-Message-State: AOAM530MBOAyNNUWIiO+7WW9mZlZY33gABIDOzmytv6YL9S0hxwCEYbT
	1URESq/M/ZTDb8XG/rOgxyrL5Q==
X-Google-Smtp-Source: ABdhPJy1NuUyz1zVwuO2uicyPEaF6onNcFwItAqzM6BQ0S0X8xoWoDiuU8tAm2SP5bwz92iiLB8DrQ==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr11943626wmf.108.1602535737038;
        Mon, 12 Oct 2020 13:48:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (0.6.6.4.7.a.b.4.4.1.e.0.e.3.c.2.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:2c3e:e14:4ba7:4660])
        by smtp.gmail.com with ESMTPSA id h133sm121679wme.27.2020.10.12.13.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 13:48:56 -0700 (PDT)
Message-ID: <2523bf7b98d0a897060bba2286c4e7442bb9ee02.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/9] pseudo: Add support for ignoring paths from the pseudo DB
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 12 Oct 2020 21:48:55 +0100
In-Reply-To: <20201012143137.6b4cbe34@seebsdell>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	 <20201007101449.3132127-2-richard.purdie@linuxfoundation.org>
	 <20201012143137.6b4cbe34@seebsdell>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-12 at 14:31 -0500, Seebs wrote:
> On Wed,  7 Oct 2020 11:14:42 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > ++int pseudo_client_ignore_path_chroot(const char *path, int
> > ignore_chroot) { ++	char *env;
> > ++	if (path) {
> > ++		if (ignore_chroot && pseudo_chroot && strncmp(path,
> > pseudo_chroot, pseudo_chroot_len) == 0) ++
> > return 0; ++		env =
> > pseudo_get_value("PSEUDO_IGNORE_PATHS"); ++		if (env) {
> > ++			char *p = env;
> > ++        	        while (*p) {
> > ++				char *next = strchr(p, ',');
> > ++				if (!next)
> > ++				    next = strchr(p, '\0');
> > ++				if ((next - p) && !strncmp(path, p,
> > next - p)) { ++
> > pseudo_debug(PDBGF_PATH | PDBGF_VERBOSE, "ignoring path: '%s'\n",
> > path); ++					return 1;
> > ++				} ++
> > if (next && *next != '\0') ++
> > p = next+1; ++				else
> > ++					break;
> > ++			}
> > ++			free(env);
> > ++		}
> > ++	}
> > ++	return 0;
> 
> This seems like it might merit caching; parse PSEUDO_IGNORE_PATHS at
> startup, build a table of paths (and probably their lengths), and use
> those? Seems like there's gonna be a LOT of hits on this.
> 
> Apart from that, this looks plausible. It's certainly a large change,
> but I do think that reducing the size of the database like this is
> probably a big win.

I agree caching would be useful, I'm figuring if we can make this work,
we can make it faster in due course...

The database size win is actually quite surprising. The performance
isn't too different for builds overall with this change. What is
noticeable is the ~2GB improvement in size of TMPDIR from around 42GB
to 40GB. We even have charts to prove it:

https://autobuilder.yocto.io/pub/non-release/20201007-16/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20201007212955_c194e5fac6.html

'59,583' doesn't have the pseudo change, '59,600' does. We had a
different patch just before it which also knocked 3GB of build
dependencies off.

https://autobuilder.yocto.io/pub/non-release/20201012-6/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20201012150127_0c0b236b4c.html
is later data showing it was a step change.

Cheers,

Richard

