Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED727E427
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 11:22:56 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n15so6826604wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=HYfS/ahraw0D3TY8hQmrCLntvnpa+jo/jmGzGMfPCz4=;
	b=g6+32bJs53LrPanWg9W0+yN8cOng8rVb2k9CcA8k6bOCe041LxFC1oeXLG/qDm9/TV
	qNCxLhJTPKiqKRob1LOkZ2rcUgv4613WhnWoTMaM+PsQySJH48RF8i3v2uJwq5dWY43r
	jl/6T+ODeop6VE4PjAxcMNWuyVyfOdeTDRxn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=HYfS/ahraw0D3TY8hQmrCLntvnpa+jo/jmGzGMfPCz4=;
	b=G1v2Nu3vW9UMXUWaxQ4ctc7T1tmitRFORkeMXFAkCKWiNFwpg5gFpmSzrn2zPzt/Pe
	lqPt+PMEU12YQThAk1I4pYtE8OZ9bKi9fkB2o3h1+GJBY1ZhGWj5hEL+rdhODde2jMPU
	emlcn1W++2STzfg8qabPrJe2sgcqIrpOAIEhpOxaQTKOCWRwROfUsDMTXn5sTa8ImfgE
	VBY+wswOvtwRJ+VWyhhq7xyK6xHKB2l7uynwQ6MTbRSPCFBbclLAQNX6fhZwXz1s0d4b
	5ertooWpfRoTAZ9fvVIxEDIqYrb9xEPp0Wv7a8Ayt/TaBKaPTuK2oCsW59IuTR4CPx/t
	VMnQ==
X-Gm-Message-State: APjAAAWpEsRA2LwRGfFNIqM8u7linN5ghEo5F4lgj3jY+5vReptxsWkJ
	7UCbkbZWNfiDzpX9GzvCUbyF5A==
X-Google-Smtp-Source: APXvYqz1W35jkD5pfZiOfVotQcY1BchVNOvl3N4xt7dnspZFuzsfmQUCZ3GHJXgqX8PsRiyy6+hD4g==
X-Received: by 2002:adf:b21a:: with SMTP id u26mr3122332wra.119.1571743377583; 
	Tue, 22 Oct 2019 04:22:57 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id d2sm9826418wmd.2.2019.10.22.04.22.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 04:22:56 -0700 (PDT)
Message-ID: <8e660284b1ece9e66eb47747213e8faafdd99655.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Oct 2019 12:22:55 +0100
In-Reply-To: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20191022090353.21151-1-jean-marie.lemetayer@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: brendan.le.foll@intel.com, paul.eggleton@linux.intel.com,
	rennes@savoirfairelinux.com
Subject: Re: [RFC][PATCH 0/6] NPM refactoring
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
X-List-Received-Date: Tue, 22 Oct 2019 11:22:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-10-22 at 11:03 +0200, Jean-Marie LEMETAYER wrote:
> The current NPM support have several issues:
>  - The current NPM fetcher downloads the dependency tree but not the other
>    fetchers. The 'subdir' parameter was used to fix this issue.
>  - They are multiple issues with package names (uppercase, exotic characters,
>    scoped packages) even if they are inside the dependencies.
>  - The lockdown file generation have issues. When a package depends on
>    multiple version of the same package (all versions have the same checksum).
> 
> This patchset refactors the NPM support in Yocto:
>  - As the NPM algorithm for dependency management is hard to handle, the new
>    NPM fetcher downloads only the package source (and not the dependencies,
>    like the other fetchers) (patch submitted in the bitbake-devel list).
>  - The NPM class handles the dependencies using NPM (and not manually).
>  - The NPM recipe creation is simplified to avoid issues.
>  - The lockdown file is no more used as it is no longer relevant compared to the
>    latest shrinkwrap file format.
> 
> This patchset may remove some features (lockdown file, license management for
> dependencies) but fixes the majority of the NPM issues. All of these issues
> from the bugzilla.yoctoproject.org are resolved by this patchset:
> #10237, #10760, #11028, #11728, #11902, #12534

One key requirement which many of our users have from the fetcher is
that its deterministic and allows for "offline" builds.

What this means is that should I have a populated DL_DIR, the build
should not need to touch the network. Also, only do_fetch tasks would
make network accesses.

What is the situation for npm after these changes with regard to this?

Cheers,

Richard


