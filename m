Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 58F1E6F6AC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 16:54:24 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f11so1301980qae.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 09:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=i3bT04xgs0Zcn4SvM+mPrvpmlQ0MGGD74W4UtKf3hbc=;
	b=j6hGLSaB3SzBvRX2xULlN0A/sRLXVGMBK8e4zG0cF6BCJ7rt/CHHxZEhUzHi5/6Un9
	ooTUw4GCDFPoync9tZrxIDggu7ofet2r6L0QN/V28FimCHe0hVE8TPH5dqW8r/R7I0Ss
	LCnbWHvTUA9s7Ci1brk5gdFEpxDguamYS9/yojsMzowTHbnNueganW+Yrxffd6oQygLv
	kHC+t+uPFHv5A0VlFl+1EEWqBxwlzDGmgJVtbo8CmR8kN3inPKQYDn/4DaaIxIvOtLrl
	gwv30HAP1M/FCJBM1drZWn6oel5aqOkuImVULNq+6DgDcUk1LZ5pVACSomVe/NNzfP0u
	W4ug==
X-Gm-Message-State: ALoCoQmGLL4A7rqyQQeaWjY59Ogz5TBNrFL8+CyXzVQo8m9JhnXPpoxRUKY5ZDSxbpyL76cRoKlB
X-Received: by 10.224.45.197 with SMTP id g5mr3812200qaf.52.1394729665721;
	Thu, 13 Mar 2014 09:54:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 09:54:05 -0700 (PDT)
In-Reply-To: <CAJTo0LbpZ=aSRwcu8TAZsqXKb+jmtCqgj07YAm7kdrLUawQkRg@mail.gmail.com>
References: <cover.1394555880.git.liezhi.yang@windriver.com>
	<5a1dbe79b2581b458e5c43a262c9b9c8a809d081.1394555880.git.liezhi.yang@windriver.com>
	<CAJTo0LbpZ=aSRwcu8TAZsqXKb+jmtCqgj07YAm7kdrLUawQkRg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 16:54:05 +0000
Message-ID: <CAJTo0LZXYBmSy4bme8Y3MaYCZ=X2VRabbXOeSNVX7TEubVOKPg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] patch.bbclass: do_patch: unset TMPDIR from environment
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
X-List-Received-Date: Thu, 13 Mar 2014 16:54:28 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2014 16:46, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 March 2014 17:08, Robert Yang <liezhi.yang@windriver.com> wrote:
>> We need unset it after we use it, otherwise it would affect the env
>> after we run "bb.build.exec_func('do_patch', d)", and will cause
>> unexpected errors.
>
> This assignment has been there since October 2012, so what are the
> problems that this causes?

So what bothers me about this (and the original patch) is that TMPDIR
has special meaning to bitbake and the conflict with patch's temporary
directory is unfortunate.  Maybe a better solution is to change
meta/lib/oe/patch.py to set TMPDIR when invoking patch so the changed
TMPDIR is constrained to the patch process and nothing else.

Ross

