Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id B55056013D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 12:23:00 +0000 (UTC)
Received: by lagg8 with SMTP id g8so34408821lag.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 05:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VySFRo2im6xmdNWCwJEgNEsf5hzg3HTyRcT8Pw+hlDg=;
	b=dhwc9iswRB9Ah+IF+0c00oITREK+XlDv/BDpjCxtypXSiN1EuYzwjb3m2k0Bf/RTrh
	lkQLsUHxL35YZ+Jzm/SFQLjrWlj4C4bsG8MkfIuf+NG9rKy2joniMSqKvpN6+Mfa7yxj
	bBcqUwc7C0tzTsgDrIvSD+HpBy3Dcpts4XocpPzQ5YnDqBRaz6RNZPhDS4x4oRn2HHmE
	pYigdDQ2C2ZaXaBdLNVM9eYk4WuM1Vg994JrXDKlIX55ExvVOsdx/1JokHVi2bhCnu/X
	SSuzQCH92Qh+CVUGOJV9o2k/bz7rG+VHBeHqjUPb0mkmS+IMATB5fDi0psqILJjHYkkw
	jnzw==
MIME-Version: 1.0
X-Received: by 10.112.41.236 with SMTP id i12mr36001901lbl.14.1426681380036;
	Wed, 18 Mar 2015 05:23:00 -0700 (PDT)
Received: by 10.152.146.4 with HTTP; Wed, 18 Mar 2015 05:22:59 -0700 (PDT)
In-Reply-To: <CAJTo0LbC_-Cj6VdfCNL65bO6OyMeQKMpsgXdXEHhxahor7OtAQ@mail.gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
	<1426496025-26942-2-git-send-email-rep.dot.nop@gmail.com>
	<CAJTo0LbC_-Cj6VdfCNL65bO6OyMeQKMpsgXdXEHhxahor7OtAQ@mail.gmail.com>
Date: Wed, 18 Mar 2015 13:22:59 +0100
Message-ID: <CAC1BbcTBOcGnBhLv18d+V8dS_mTwqFyMNt9ZWyiCKibgsybsJA@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] rpcbind: respin patches
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
X-List-Received-Date: Wed, 18 Mar 2015 12:23:01 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2015 at 12:53, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 16 March 2015 at 10:53, Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> wrote:
>>
>> Due to libc-dependant conditional patching (which should be completely
>> forbidden -- fix it properly instead) the last PV bump forgot to adjust
>> patches so they failed to apply.
>>
>> Fix this by redoing the patches. These patches were submitted for
>> upstream master, add backported patches for the current tarball.
>
>
> The autobuilder is failing on this recipe
> (http://errors.yoctoproject.org/Errors/Details/9409/):
>
> /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-skeleton/build/build/tmp/sysroots/qemux86-64/usr/lib/../lib/libtirpc.so:
> undefined reference to `_yp_check'

yes. I suggest you disable NIS / YP support for glibc too.
Alternatively you most likely want upstream to
sed -i -e "s/_yp_check/__yp_check/g" src/getrpcent.c

This IMO is a pre-existing bug in the upstream libtirpc that i
deliberately did not fix since i don't do YP anymore nowadays.

thanks,

