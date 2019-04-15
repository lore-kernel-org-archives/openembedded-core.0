Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5C97D848
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 09:38:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jNjH2fHfzFr;
	Mon, 15 Apr 2019 11:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555321108;
	bh=97tXANDmlwcyuAaOn9vooUZ1ryraOFGVVwKfLo1NNv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QWmaZfX+we5EqYCrKrXGooeI3XTe21aJqjI93I7JVrIBZeeeB7fMxmM7QabM8MRO+
	yI5gDfcJTB5MAOVmzcgKx4Upqd0+3HxokbxE7MHmbPqcxLoBKuRrnWCKhS7x5CadV+
	LntnqP7G0/3tHIwSRxNXydrcYXcgCdNphhdLLi+t0KJzth7BvrWnF4EcElUPf/0Na4
	pcDl9ymibFChzhg/2/+Dait4EIQu9HY6d6u4v8rFhvmD04MBx3YCvCPY4WNX8ehbc/
	+EpKH4J1Ill8R/Lpmo1rW7r3fymqk2zVvGJyE10M2mIY/TzoSxPSFJ3yuDnOlHIfzv
	smHkMGezlS807HupIXwCexAYAMTtdhoY54jW+ymB3GYER/i8x6eTv9uVwEuP+sZ2eZ
	/VablukvFJtsNUnymv+EgDYkKIUvlRgltg1ivsJUDKnTQx1/mMA3kw5pkSZ5Sl9dO+
	iib2gYJ+U3+vhHR3uLU/5jclSpUpVyJQ9qXIKs4bC8Gvb9NgUFmcX0wVy0b/c0oFa+
	qufXeyQ3y/QqZlOpazCCcWTouuAgddWKgx4zoUy5gIIiFOJ9yGEdxObiyz/vMw2/JI
	zBXoApjZd/Lgs+kPC0pbb44x/nnQjhEUMcZ0oVYvs9IyKsPR0UKA7/8UG5BQq/HZjg
	5ONOpoteqcXq8LnyloeIAkNo=
Date: Mon, 15 Apr 2019 12:38:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190415093825.GB4317@localhost>
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 15 Apr 2019 09:38:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Apr 08, 2019 at 08:53:49PM -0700, Khem Raj wrote:
> On Mon, Apr 8, 2019 at 7:32 PM <mingli.yu@windriver.com> wrote:
> >
> > From: Mingli Yu <Mingli.Yu@windriver.com>
> >
> > When DEBUG_BUILD = "1" added in local.conf, there
> > comes below build error when "bitbake gcc-sanitizers":
> > | ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c: In function 'elf_is_symlink':
> > | ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: 'st.st_mode' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > |   return S_ISLNK (st.st_mode);
> >
> > Per https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html,
> > the gcc upstream thinks the warning is a false
> > positive and suggests to use -O2 rather than -Og
> > or -O1 when compiling that file, so pass -Wno-error
> > to compiler when -Og is used to silence the error.
> >
> 
> Not particular to this change but in general if a package says that it
> does not support -Og
> then we are just going to get into more and more untested grounds
> especially during runtime
> so I wonder how useful it will be to use -Og for such packages or any
> other non supported
> combination for that matter.

This has nothing to do with specific packages not supporting -Og
or any other combination, it is just about how to best workaround
a compiler bug temporarily.

gcc has bug(s) emitting bogus warnings with -Og, and these are build
failures with some packages that build with -Werror.

None of this is related to whether or not the packages will work
at runtime with -Og.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


