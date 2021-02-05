Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.7333.1612528384289253366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 04:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J5ti9Lan;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id m13so7465473wro.12
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 04:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AWA92MAZoXHglG/ZJAEXpfS8C3S/8yfwLJ2kUWLwumw=;
        b=J5ti9Lanz6gFoC84KlS7h/huTTjbV9qcL+yRnjOodd9JfAJbkaJXGeKgz0XGdXpHUq
         EUWMUexbNYpQKMZ8EwEt3YdhCE05legEE6bKya+gt1swIuqkifCIunmZWjKBDSF+Y10B
         imRE0uYGsDTcndfShaTiKzuwVIajN4q3+Tw4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AWA92MAZoXHglG/ZJAEXpfS8C3S/8yfwLJ2kUWLwumw=;
        b=emb3GEfDPxyNW1ePhm7BUD1oijIqx64rf0K3UsXCPYbx6FC7Qc9Rxvx1M19neWknvh
         D1cHwow5ULeereh/U+tCrCB4O+BhJ/Wp+DV5I5o+U3hoCiIqCSsoCF+bF5NjbLSWLnz4
         r5XDrue4xAirjjEUbhAIy2vwLNcqTpvZjuNhixXMV+HphFA+dO7YyOageaVuTH8HHXcN
         2aoT48kpI4fRLwsdgyEAP12bzaf16R2IEFs61uFG4EO8iE9RU7oCcwyM2iSN+UF1Isck
         CyK2feKIXZZW/o0d6S8lBzest8rEJaQHo+Fo4n6UgTS+LKzRVgIUt6kxyPIxY+o5zkKi
         VYXw==
X-Gm-Message-State: AOAM5327b4SNsSZ+jv93iBq27HZmRWjOJow9HNz28BpF6Z3r30TmqLqn
	OxSkNRZeY5ZO8EB/DrPYrhrwBA==
X-Google-Smtp-Source: ABdhPJyYnNK8z7akJ8HHxlOrpU+CKDSneVNAQrhzUgimkk0pc6uWMd9CxKApxa1fDQeqcUNayDIhVA==
X-Received: by 2002:a05:6000:12c7:: with SMTP id l7mr4765871wrx.103.1612528382662;
        Fri, 05 Feb 2021 04:33:02 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d1b2:8778:591e:ef47? ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id d30sm13745352wrc.92.2021.02.05.04.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 04:33:02 -0800 (PST)
Message-ID: <2148a893a9deec135bfa733be2a4ec6c99e9201e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs.py: expose prepared_index and ipk_repo_workdir for OpkgPM
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Ho <Michael.Ho@bmw.de>, openembedded-core@lists.openembedded.org
Date: Fri, 05 Feb 2021 12:33:01 +0000
In-Reply-To: <1612515106-377011-2-git-send-email-michael.ho@bmw.de>
References: <1612515106-377011-1-git-send-email-michael.ho@bmw.de>
	 <1612515106-377011-2-git-send-email-michael.ho@bmw.de>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-05 at 09:51 +0100, Michael Ho wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
> 
> The OpkgPM class has several constructor options that allows for skipping
> the ipk repository set up and controlling the ipk repository directory. This
> commit exposes these option via the OpkgRootfs class so others can make use
> of them if they wish to.
> 
> Adds the bitbake variables "IPKGREPO_TARGET_PREPARED" and "IPKGREPO_TARGET"
> to act as the interfaces.
> 
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  meta/lib/oe/package_manager/ipk/rootfs.py | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
> index 26dbee6..6313b72 100644
> --- a/meta/lib/oe/package_manager/ipk/rootfs.py
> +++ b/meta/lib/oe/package_manager/ipk/rootfs.py
> @@ -129,6 +129,14 @@ class PkgRootfs(DpkgOpkgRootfs):
>          self.manifest = PkgManifest(d, manifest_dir)
>          self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
>          self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
> +        self.opkg_repo = self.d.getVar("IPKGREPO_TARGET")
> +        self.opkg_repo_prepared = self.d.getVar("IPKGREPO_TARGET_PREPARED")
> +
> +        kwargs = {}
> +        if self.opkg_repo:
> +            kwargs["ipk_repo_workdir"] = self.opkg_repo
> +        if self.opkg_repo_prepared:
> +            kwargs["prepare_index"] = False
>  
> 

It seems reasonable to expose them, I'd just suggest that we don't put
them in self here but do something like:

+        if self.d.getVar("IPKGREPO_TARGET"):
+            kwargs["ipk_repo_workdir"] = self.opkg_repo
+        if self.d.getVar("IPKGREPO_TARGET_PREPARED"):
+            kwargs["prepare_index"] = False
 
and my only other concern is the naming. Somehow we need to get from
the mess we're currently in to some kind of more consistent and
understandable naming of variables.

OPKG_ROOTFS_FEED_WORKDIR
OPKG_ROOTFS_REBUILDINDEX

maybe?

I'd also yes, we should document them.

Cheers,

Richard

