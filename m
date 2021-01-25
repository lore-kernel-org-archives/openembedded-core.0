Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.4315.1611615892626173687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 15:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QU5w8xIG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f48.google.com with SMTP id rv9so20410791ejb.13
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 15:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=do79bt8NY4uQ4pSHhY5JMwU4mBU47UU/bjtVtCnbMso=;
        b=QU5w8xIGMPv1QhSs+FjTy2e68qpejTmM65cFSwiQ4OGXzZKsHyBFFJCaqWtK22hTNb
         Pnq8vJnoJqT5ka2UMWQt4ScXIpWHQm7Bz8j9VQ57rdKXPybv2si18nKKYQjWXIyQtK5s
         2VqhZGwmuOrN/n5SzQBV4ObfF7eTfG3HqeVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=do79bt8NY4uQ4pSHhY5JMwU4mBU47UU/bjtVtCnbMso=;
        b=HoiCFj11eJhMaZm815tv3oXRXQUE53OcY0u1d3+gIX66pXIKcSPTW9EkrjFAk+u5Gi
         /59NWOfHxeRzkTMJ3IIyqAmy9vuVacQULgXvtGwurs/Sy2n73HACsDsEK9cSzBoR2amB
         j/WYeJos0fcGQWnZyXviu9IJgHZt1lgp0CNEvf+nlAf5iYUeLHNzLyu4sPxuUr/ewVUB
         TE8gwC6FKHf47C0XFl+efGSQADmohfYodD+CQnKnBBZIMZ9Ye3RRLdvzzXnLr/BtJp3n
         yx0Rc+/YsItBichCSbrvm7/jGbWhyQhcvmKT8kPk7fGq8PB78eY9nqlubLiRFO4xK06n
         iM0w==
X-Gm-Message-State: AOAM533w2H/0DFYh2xBiplB17ONKes2PVxIAlSq6rD+73BYZsfZuNMbO
	ib94xvnpdrmUwrEPe0e4jS+/kw==
X-Google-Smtp-Source: ABdhPJxTKqyL1mz5P0WSyxjYOgF/vnA9K1YJszHbI80IblBDiksuqozh5p9W10wEzaN2lm0oPW3yRg==
X-Received: by 2002:a17:906:9497:: with SMTP id t23mr1758588ejx.523.1611615891168;
        Mon, 25 Jan 2021 15:04:51 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:b393:1589:56b4:ccf1? ([2001:8b0:aba:5f3c:b393:1589:56b4:ccf1])
        by smtp.gmail.com with ESMTPSA id g25sm8879315ejf.15.2021.01.25.15.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:04:50 -0800 (PST)
Message-ID: <155101e7a2527d85df48b078eccd3568ca70a5d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc: Remove task dependencies to deleted tasks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2021 23:04:49 +0000
In-Reply-To: <20210125210142.8131-1-tomasz.dziendzielski@gmail.com>
References: <20210125210142.8131-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-01-25 at 22:01 +0100, Tomasz Dziendzielski wrote:
> The python3 recipe sets `do_create_manifest[depends] += "${PN}:do_patch"`
> but do_patch is removed in externalsrc and fails with:
> > ERROR: Task do_create_manifest in <PATH>/python3_3.8.2.bb depends upon
> > non-existent task do_patch in <PATH>/python3_3.8.2.bb
> 
> It is safe to simply remove these dependencies since they should be
> already covered.
> 
> [YOCTO #14151]
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/classes/externalsrc.bbclass | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 7a7d31e311..8e164707e6 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -107,6 +107,9 @@ python () {
>          for task in d.getVar("SRCTREECOVEREDTASKS").split():
>              if local_srcuri and task in fetch_tasks:
>                  continue
> +            for bbtask in (d.getVar('__BBTASKS', False) or []):
> +                if 'depends' in (d.getVarFlags(bbtask, False) or []) and ('${PN}:%s' % task) in d.getVarFlags(bbtask, False)['depends']:
> +                    d.setVarFlag(bbtask, 'depends', d.getVarFlags(bbtask, False)['depends'].replace(('${PN}:%s' % task), ''))
>              bb.build.deltask(task, d)

would it help to change the python recipe to do:

addtask do_create_manifest after do_patch do_prepare_recipe_sysroot

?

Cheers,

Richard


