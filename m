Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web11.15704.1604827770176389624
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Nov 2020 01:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Uzujqwl5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id x7so5651834wrl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Nov 2020 01:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nJyd0nsZClY5l0iZP0KT+9dHcAFFYDAU6l1YM4ONvyw=;
        b=Uzujqwl5D474GjAgPhbAyjedyo5CR9AuAZVz7y2Ipq/71W/VRO5ylc0uZuT23fkg1L
         qKrgM2Tc4KJqV4EJOrwcCUbDBd4Jg4yJHOQC+ixsU33BzK1Gj9/MjxcJJU+GktEbr4Hu
         ddIALtpg1HtPJIV7hZUahhLquqgxdfE1QhZxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nJyd0nsZClY5l0iZP0KT+9dHcAFFYDAU6l1YM4ONvyw=;
        b=s0RuwT848K0qtDfpEiW1/hZfqdt8yEn44wuro//oeOsy7BHe3qTCO2ZqRHMe6oaKp2
         3VgpwuqjK/ZzubU5We6bTigy9J8I1ZDL6ae3JrQ27fuLltc+cHs8UFFfLoD2+83Hx5UR
         EQjfG9ws9/craK30CX5l6eqfx6GLrENQ8bzX/2r6pmICnosow+Mwc67Sxq140Frkejoo
         ivt25TNDz7qV8vRyYylTgj5lnZlpJ1+2k/zeQjhuhvpxABhuy9Vl8fo7pyiTk2xy7ckm
         Ar13XrdAmWYYdotrJfUfLlfpRUBKic9XmyPYQHGGqe2zdZ2yMQLkp7DndQhJeB3dZGgs
         q3Mw==
X-Gm-Message-State: AOAM533knyBHEOi7zY5FvLcQ+QaYGMqMWLtuGiaA0MHcJrETcdbhfYT7
	0X8SOdZgW9t+eAh4VoK2FcMOnw==
X-Google-Smtp-Source: ABdhPJwp2564mIhwBoj1Fsl5LxvjsSlvb0UzGm4a8TULi/bc+4mDPE8qtshnDzWAP4S0Vm/0ua84cQ==
X-Received: by 2002:a05:6000:1c9:: with SMTP id t9mr6082600wrx.379.1604827768377;
        Sun, 08 Nov 2020 01:29:28 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 7.e.4.c.9.7.4.3.c.6.2.9.7.2.8.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (7.e.4.c.9.7.4.3.c.6.2.9.7.2.8.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5827:926c:3479:c4e7])
        by smtp.gmail.com with ESMTPSA id q12sm1649371wmc.45.2020.11.08.01.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 01:29:27 -0800 (PST)
Message-ID: <ef018194964950bf6a4a048b7f2134949aba128f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: fix image_debugfs symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: william.hauser@meraki.net, openembedded-core@lists.openembedded.org
Cc: William Hauser <whauser@meraki.com>, William Hauser
	 <william.hauser@meraki.com>
Date: Sun, 08 Nov 2020 09:29:26 +0000
In-Reply-To: <20201104224743.74488-1-whauser@meraki.com>
References: <20201104224743.74488-1-whauser@meraki.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-11-04 at 14:47 -0800, William Hauser via
lists.openembedded.org wrote:
> Allow symlinks to be made in the debugfs by removing an incorrect
> check that
> would always prevent symlinks from being transferred over.
> 
> The comment in this code indicates that the code is meant to ensure
> symlinks
> are only copied to the debugfs if their target has already been
> copied, but
> instead checks for the existence of the symlink that has yet to be
> created.
> As a result this check always fails.
> 
> This check is safe to get rid of since we will only attempt to copy a
> symlink to the debugfs if it's original target exists and is an ELF.
> It
> is, however, still possible for a dead symlink to end up in the
> debugfs
> if its original target was stripped.
> 
> Signed-off-by: William Hauser <william.hauser@meraki.com>
> ---
>  meta/classes/package.bbclass | 8 --------
>  1 file changed, 8 deletions(-)

Unfortunately this patch did show failures in testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1536

(and the other selftests failed the same way).

oe-selftest -r imagefeatures.ImageFeatures.test_image_gen_debugfs

is how to run that test.

Cheers,

Richard

