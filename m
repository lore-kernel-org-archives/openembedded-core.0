Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6C01D6E9F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 20:45:26 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id i7so3258157oag.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 13:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BZbgP55hXdeYmtjh7XTirS5M5pCjIAq2YjQV+CMzWoQ=;
	b=a0MKBQ/jDAqYa3xLWyO73GH7U7FVMq8AscF/wzpJ9BtsDE0moYgwAVU1MeIOGN1OFY
	h1c1wjoKgO6m35dnrIPXPzITjMuCsFdtVZrjiSG4gQlj7XUBwdtk2kcV8ye9eE2KWO99
	/kNBr0JUU6zFrSOGqN3vWAK08fiKS4KFEE1gOc7fVgA+0IgnHl7lVeJPYVD+Mql7n6Cp
	HTlmJbBR7vju940HtF63iUa/2Sm6962ywx9nUoEe8/3PgQh8bAefQj9P/pTb3oV5a6Vx
	L4+TMskdDssuZQWiG//yBbZoci4OXIvx53BryRD4hsXxZbUVY0fMHbHRyKk4IgX7ZM09
	Q3gg==
X-Gm-Message-State: ALoCoQlHPekyblPLlAiNt1zuaf8ASu6ZJAQLl3j3d59y2KQuT/DaqBTHStRJ6QSkVc/GC4dFPnTy
X-Received: by 10.182.2.42 with SMTP id 10mr3112674obr.73.1395866727984; Wed,
	26 Mar 2014 13:45:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.110.9 with HTTP; Wed, 26 Mar 2014 13:45:07 -0700 (PDT)
In-Reply-To: <CAP9ODKoSO6ewoim_4c6N15C5-uQz0XQ3kPam421mYRPhRcWoNg@mail.gmail.com>
References: <1395676843.24890.7.camel@ted> <5330C9A8.904@linaro.org>
	<20140325055028.GA3710@jama> <5332E520.5050005@linaro.org>
	<CAP9ODKoSO6ewoim_4c6N15C5-uQz0XQ3kPam421mYRPhRcWoNg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 26 Mar 2014 21:45:07 +0100
Message-ID: <CAP71Wjz2MD52m_ij09nCRZoDh6iJfojae7sJYK4ZwSqZ_qGVZQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: --conf Was: Features in Yocto Project 1.7
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
X-List-Received-Date: Wed, 26 Mar 2014 20:45:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 26, 2014 at 3:38 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>> As a concrete example, currently I'm flipping between dora and master
>> builds. For some reason I can't seem to reuse the same TMPDIR between
>> them. So every time I "repo init -b <newbranch>" I then also have to
>> edit conf/local.conf before bitbaking.
>
> Use separated build directories for this, so you don't need to mangle
> conf/local.conf every time.
>
> Personally I have different trees for Dora and Master and inside it I
> have several build directories when working in this kind of test
> (different distro features and like) and this is easy to maintain. For
> auto builder, we cooked a script to abstract the configuration in
> command line options so we can easily extend it and get it used in
> several build jobs.

I do that too. build folders are 'cheap' assuming good use of sstate
and rm_work. my typical setup is:
- one workspace for each OE release branch (trees checkout)
- one <build> folder for each combination of <distro>-<machine>
- one shared downloads folder for *all* builds across all workspace
- one shared ssate for each workspace . i am not sharing sstate across
OE releases, mostly because sstate-cache-management would always
delete the wrong stuff otherwise.

