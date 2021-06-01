Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.59505.1622562498103931422
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 08:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dsCKHG1c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id n4so14886198wrw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 08:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=DkZepJ+MALEBeagUf2U5360ZsHai0AC3B4EGV5tRBmc=;
        b=dsCKHG1c+alpqfWkwU0JFunbBdh9WwRqCtOoOehiaqvDrrWFSgUlG0dzCBaE54UII8
         ZXjFI8/gN2vEPggO+2mLAIQuP7dOvL9MIVf2w44uxRsVqpFBSCVBuTfD83iKNdMSM/cC
         sv+z701BKHYx23ub1bXKWpxQJvowx+a4y2Xzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=DkZepJ+MALEBeagUf2U5360ZsHai0AC3B4EGV5tRBmc=;
        b=VXfGVPUSVcWA3vOgEGga0hp8xuGGvr1qiMxyvRmb1laZXC8FYk3p6yTyO473DC9Gb3
         FChuuyghtUw2sabTaZzjopv0MWYntJhUP22FiTMF7gleOvRVCtKE5EKW6WRFlfqyG0cF
         3Ly/F4nqzleSfUJwk3ssIRv6yaik9tP5Zo1ZkN3TJGOKG5nblAjv2wGLLUx+LyyCE1ag
         X12+Wy52PCgYc4UWFMqtEYwdiBvc/+zQ0BVaOLtRomp/uKA4HmWqHpe1wxghBFp6K9xU
         0ZxuUQX5qAd7lAoha0dAvVjdlka6ww+k5livF1SNGOtIHmapK2NkPm16oEF3TqlU067y
         4+OQ==
X-Gm-Message-State: AOAM530d0NP+fASYK+MU831mOI8yWNFAxi5kRd7g7GaumRlWPLuk5PzP
	eklRpbiHBYGlvrTMew87QtKuAQ==
X-Google-Smtp-Source: ABdhPJxE4QrOX0eaculmeZJJ7kISBchvP09AscX+H+X7+q5j7ouMpJMEukcuJt6a9FYq+QSxf0PuEw==
X-Received: by 2002:adf:de91:: with SMTP id w17mr4090663wrl.352.1622562496270;
        Tue, 01 Jun 2021 08:48:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:bb83:f5c5:f3ff:dc3? ([2001:8b0:aba:5f3c:bb83:f5c5:f3ff:dc3])
        by smtp.gmail.com with ESMTPSA id g10sm3605863wrq.12.2021.06.01.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 08:48:16 -0700 (PDT)
Message-ID: <7c7aa3f02fb44e3e4f1758b080e7482e2b12f6b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Fix corrupted magic number in ipk on populate_sdk task
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Kamil Kwiek <kamil.kwiek@gmail.com>, Jan Brzezanski
	 <jan.brzezanski@gmail.com>, Paulo Neves <ptsneves@gmail.com>
Date: Tue, 01 Jun 2021 16:48:13 +0100
In-Reply-To: <20210601152114.495307-1-tomasz.dziendzielski@gmail.com>
References: <20210601152114.495307-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-06-01 at 17:21 +0200, Tomasz Dziendzielski wrote:
> If any do_package_write_ipk runs parallel with populate_sdk task it can
> happen that opkg script arfile.py tries to get magic number of all
> packages in DEPLOY_DIR_IPK while some package is being copied there at
> the same time. This results with:
> > AssertionError: Old ipk format (non-deb) is unsupported, file:
> > build/tmp/deploy/ipk/foo/bar_1.0-r0_foo.ipk, magic: b'', expected
> > !<arch>
> which isn't really the case here.
> 
> To fix this I added lockfile in package_write_ipk task and in
> OpkgIndexer class. Even though package_write_ipk is writing to a
> common deploy directory we can use shared lock, because we are sure we
> don't write to same files. On the other hand in OpkgIndex to read magic
> number I added not-shared lock, because unfortunately we don't have a
> mechanism to share lockfiles only with specific group of tasks. That's
> not a problem though, since indexer runs fast and usually there are not
> many recipes using populate_sdk class.
> 
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> Signed-off-by: Kamil Kwiek <kamil.kwiek@gmail.com>
> Signed-off-by: Jan Brzezanski <jan.brzezanski@gmail.com>
> Signed-off-by: Paulo Neves <ptsneves@gmail.com>
> ---
>  meta/classes/package_ipk.bbclass            | 10 ++++++++++
>  meta/lib/oe/package_manager/ipk/__init__.py |  3 +++
>  2 files changed, 13 insertions(+)

I would much prefer we didn't do this, we've had such lockfiles before and they
are a bottleneck when for example expanding a new build directory from sstate.

The rpm code creates a symlink tree copy of the packages it has the right to access
and then only index those. I did a quick grep and I thought this was being used
for ipk and deb too:

deb/__init__.py:        create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_DEB"), "package_write_deb", filterbydependencies)
__init__.py:def create_packages_dir(d, subrepo_dir, deploydir, taskname, filterbydependencies):
ipk/__init__.py:            create_packages_dir(self.d, self.deploy_dir, d.getVar("DEPLOY_DIR_IPK"), "package_write_ipk", filterbydependencies)
rpm/__init__.py:            create_packages_dir(self.d, oe.path.join(self.rpm_repo_dir, "rpm"), d.getVar("DEPLOY_DIR_RPM"), "package_write_rpm", filterbydependencies)

Which release did you see the issue on and is there some codepath which
isn't using these tree copies?

One reason for the above is also to stop an image seeing packages it doesn't
depend upon which is important when package globbing is used to install
packages.

Cheers,

Richard


