Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1A47E8B7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 15:25:35 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l3so20148036wru.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 08:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=zeObhFrqIRu8BYZJDDgnvqN8LuKM+i8TxJqUtNfzWhc=;
	b=UgD+DTRrZppcPTAGfE0B+Sg1kxhJCAz7oGzmqThflm2YuLKsokJhl/Lhzt+PrqmUzW
	mZkYHtlKaFf1Pc2zWo+5jykBaPgegHU9z581XXsQT33ahlNkYf8MnVLVNvCr6bHGINNW
	R0+XajHJ0iMc+X96lrjuvQmsrdWRAY7fCb7Kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zeObhFrqIRu8BYZJDDgnvqN8LuKM+i8TxJqUtNfzWhc=;
	b=W8jYC+AzBMM+rsWwVfmtIBrmLnlsYoTlk2bKu2HhZq6flztIjrU+LFtLKp+EKqy4X4
	gMfMZx+PsDrXHKRhvaC/UoucmX094zjue782WhT81ZmapY6QrcWBp2QjeX9b8tB7JVpJ
	NACgsMkxEYtYjhU9CR6WfjM7iB7eqZYSEWgOScFqc1iyUevMD557mLKohfxBkMmZs/kF
	+5xRpAsd1vNkxX+aAWYdFYiLjGQ+TY+O32/AJ70zqNK5+s8drv0HPHqf0n7T3/cQc9Bk
	ubiFtC3GOzQed4+4qqzxc9uTyq3EH5Gy5TuOjQC/xDUUkpt8hP8ohn86wtwHXykucF6E
	vTkQ==
X-Gm-Message-State: APjAAAUKorAGgu3jKJTQNFPJ4wAjBkr6jyhgOSMmlv/YDVP9V1X/C53s
	liYSAwZVMtIT/ii8FqgbjAky0Q==
X-Google-Smtp-Source: APXvYqzyjAO6RmQfemzNB8AxBAvBQV3j9/M08EoU5L1G6/dc1ggg0lIlFWz5OXu0ckjnjjp7+TNp/w==
X-Received: by 2002:a5d:630d:: with SMTP id i13mr3124528wru.230.1570029936035; 
	Wed, 02 Oct 2019 08:25:36 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o19sm11005260wmh.27.2019.10.02.08.25.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 08:25:35 -0700 (PDT)
Message-ID: <eecb2354c35a8a2c788b1cc919339e7931619dd9.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Konrad Scherer <Konrad.Scherer@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Oct 2019 16:25:33 +0100
In-Reply-To: <34a7db7f-83b3-f51f-9628-615762b44e91@windriver.com>
References: <20190927185642.29251-1-konrad.scherer@windriver.com>
	<4ad724ca50b35e495d2eae800edd83c60b7128bf.camel@linuxfoundation.org>
	<34a7db7f-83b3-f51f-9628-615762b44e91@windriver.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [master][PATCH] gen-lockedsig-cache: Replace glob lookup with hash to filename lookup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Oct 2019 15:25:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-10-02 at 10:56 -0400, Konrad Scherer wrote:
> On 10/2/19 6:17 AM, Richard Purdie wrote:
> > My benchmark before was seeing it spend over 30 minutes in bitbake
> > core-image-minimal:do_populate_sdk_ext on an otherwise idle
> > autobuilder
> > cluster/NAS (35 minutes from a clean tmpdir).
> > 
> > With the patch applied and my above tweak, I saw:
> > 
> > real	6m58.120s
> > 
> > and I'd note this was with a full build running on the other
> > workers so
> > the NAS was under load. I could try and get an exact time for the
> > above
> > but didn't really see the point in spending another 30 minutes on
> > it.
> > 
> > This is the time for the whole SDK image, not just the time this
> > script
> > takes but its enough for me to say its a vast improvement! :)
> 
> Great! It was frustrating to develop the code without a good
> reproducer.

Unfortunately I think we may be celebrating prematurely. On an
otherwise unloaded system this looked ok however in real world builds
the sdk creation is still excruciatingly slow.

We don't even need to use the script to understand why:

pokybuild@debian9-ty-2:~$ time ls /srv/autobuilder/autobuilder.yoctoproject.org/pub/sstate/c6

real	9m3.140s
user	0m4.432s
sys	0m5.164s

So we'd expect the script to take 2*9*255 minutes :(

(214054 files in there incidentally, I got 1m49 the second try)

I've cc'd our sysadmin.

> > Konrad: Mind if I squash in the above tweaks?
> 
> Not at all. Sorry that you had to spend time debugging my code. That
> sha extraction code should have been more robust.
> 
> > Also, the new code is a bit too chatty and leads to a lot of log
> > output, we'll need to tweak that too.
> 
> Please do.

I've queued such a patch in master-next and am testing, its an
improvement but I'm worried its not resolving the problem.

Options are to prune the sstate cache, or to teach the code to generate
the full filenames (would mean refactoring)...

We could give you access to the autobuilder to help reproduce the
problem but I think its clear where the delays are...

Cheers,

Richard




