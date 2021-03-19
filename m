Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.502.1616175582590266897
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o4UtyPxN;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id k24so4163537pgl.6
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=BQ7YyJt+yXiAPYmCnhA15wGIYsE6xxg9CTzzcXhcqMs=;
        b=o4UtyPxN3DYait3/s3lBgLBXYeMP/Xb3iGukMYQWKkrm5u02VpWoPiMb2ontb5FPSm
         LhU2jTSA1KY45R+kJHAeeq3Y5v699uH+LprBQeLzLqtzXsEcjjZMmmbxnv4rxMHe1ced
         4xf0q5OtuiuNu//qyGlCDRyMkCRjr45fY+8l/e2m5NoN/gPERS9ZsgeaFKPJGJIDgTCu
         EK9w/HxoCchuOun9KCJlt04l7qX7fSLGzp29SDd2GloQquzU891JqeZPzXT/88irh80q
         K2f/1YPurT6nWobhYe93YJbuPRfvVJBbUcE/qBqWfxtBk/ai80MK/HfGjQqwU8TM8Mhw
         l4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BQ7YyJt+yXiAPYmCnhA15wGIYsE6xxg9CTzzcXhcqMs=;
        b=hGOcsqDK7PzxKEhKlEpk5GjD4Qg2cgD8Rvzs6QGbWEicvRC9/nPw3t6+AeS/pAmND7
         GJjOVGhSDMEP61Z0FD+NqD/ZxXlbaX3LIN+8w9qb9Szjw25t5/ZYrqX3yOKaNprlBL4i
         vuzFAbJwGWv8mAhi2nuo6ufRAjZ4VuWvTGTAqItUduxBVB9mlijYA+E32yOL7LcCapKz
         cHhU9h9jBE3SM27BuMcJdKsyC+LYe/aSuh0DA6RbZCubLOi8CtEzORw3NaxMmdW+nt6q
         3JK2Anc08dnruGOifLAmYPujlT+qeHrtOuersNZHhfmMZFLaDmNbfDQRt2+a1/1D6QHZ
         8S5g==
X-Gm-Message-State: AOAM530EkcSyC5UogHeLepWdQeGeQWt5Qh4e2JBjpcWUljZWM/UNokrY
	pN3rx8TU7fOni6j/oA0tPgOpqWxrhBbDjg==
X-Google-Smtp-Source: ABdhPJyzpL1QwCxTWBVpYIDQQLdQ3QxxfzwoQ6BJWCTczczQRWauS/wd333UGBeEhgoYGDADZl8n4w==
X-Received: by 2002:aa7:848b:0:b029:1ef:4e98:6bb6 with SMTP id u11-20020aa7848b0000b02901ef4e986bb6mr10204752pfn.58.1616175581617;
        Fri, 19 Mar 2021 10:39:41 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::b117? ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id 15sm6208087pfx.167.2021.03.19.10.39.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Mar 2021 10:39:41 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] sstate: Remove stale objects before the main build
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210319172658.228940-1-richard.purdie@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <5fa9324e-adbc-516e-009a-72485b81a60a@gmail.com>
Date: Fri, 19 Mar 2021 10:39:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210319172658.228940-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/19/21 10:26 AM, Richard Purdie wrote:
> The split of util-linux-uuid out from util-linux caused some interesting
> sstate file overlap errors on existing build directories. This is a
> challenge to handle since util-linux depends on util-linux-uuid and has
> overlapping files in package data and deploy/packages directories.
> The util-linux build happens later and is what would clean up those files
> but it happens too late for uuid.
> 
> Fixing this is hard as we don't know the taskhashes until the task
> graph is calculated. Once that is ready, we can compare the hashes
> with the existing hashes and know which sstate tasks are "stale".
> 
> This patch adds a handler which iterates the sstate manifests looking
> for matching stamp paths and then removes the manifests along with the
> associated stamp files.
> 

whats the performance impact

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/classes/sstate.bbclass | 45 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 45 insertions(+)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index f5791681625..673292c450d 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -1223,3 +1223,48 @@ python sstate_eventhandler2() {
>       if preservestamps:
>           os.remove(preservestampfile)
>   }
> +
> +addhandler sstate_eventhandler_stalesstate
> +sstate_eventhandler_stalesstate[eventmask] = "bb.event.StaleSetSceneTasks"
> +python sstate_eventhandler_stalesstate() {
> +    d = e.data
> +    tasks = e.tasks
> +
> +    bb.utils.mkdirhier(d.expand("${SSTATE_MANIFESTS}"))
> +
> +    for a in sorted(list(set(d.getVar("SSTATE_ARCHS").split()))):
> +        toremove = []
> +        i = d.expand("${SSTATE_MANIFESTS}/index-" + a)
> +        if not os.path.exists(i):
> +            continue
> +        with open(i, "r") as f:
> +            lines = f.readlines()
> +            for l in lines:
> +                try:
> +                    (stamp, manifest, workdir) = l.split()
> +                    for tid in tasks:
> +                        for s in tasks[tid]:
> +                            if s.startswith(stamp):
> +                                taskname = bb.runqueue.taskname_from_tid(tid)[3:]
> +                                manname = manifest + "." + taskname
> +                                if os.path.exists(manname):
> +                                    bb.debug(2, "Sstate for %s is stale, removing related manifest %s" % (tid, manname))
> +                                    toremove.append((manname, tid, tasks[tid]))
> +                                    break
> +                except ValueError:
> +                    bb.fatal("Invalid line '%s' in sstate manifest '%s'" % (l, i))
> +
> +        if toremove:
> +            msg = "Removing %d stale sstate objects for arch %s" % (len(toremove), a)
> +            bb.event.fire(bb.event.ProcessStarted(msg, len(toremove)), d)
> +
> +            removed = 0
> +            for (manname, tid, stamps) in toremove:
> +                sstate_clean_manifest(manname, d)
> +                for stamp in stamps:
> +                    bb.utils.remove(stamp)
> +                removed = removed + 1
> +                bb.event.fire(bb.event.ProcessProgress(msg, removed), d)
> +
> +            bb.event.fire(bb.event.ProcessFinished(msg), d)
> +}
> 
> 
> 
> 
> 
