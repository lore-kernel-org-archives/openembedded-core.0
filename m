Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1080E7D714
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 19:31:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45h1zm4W2Mz3l;
	Sat,  6 Jul 2019 21:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1562441493;
	bh=VasFSA9sSzawRAtvBi3VR9CTMdbv8T5n8LAurLyGeJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9eNpa0OxqM5TMZRGTbjPBNw838RgSndy3prdDcVCaNGGo9BE88mm1vNmHKmT/G9O
	FpNnvt2jT7RZH9IPAc19xd1eNC+nUwzmnP9aJw+qtsF3yd7SesOM84+tdOtI12c8o/
	XUPQYnu7lDxUxrUX4hg5S/UgqbwOLbvEQLox4Wl0MVnlAIUPHo15rN87D0XfHhwZ5v
	lHOdc/sVZgxkbNLqt8dGnJ3hiCMnWNxpGgdfSWx85NcZ5lVRzcPaJDaB/xeA6pSTui
	CIAWGz4sK/Fwt0MrT+TrOGTe62tpxOrDeTnqqei2Q4bbdq9pKjRGRYGmGdrOaDizf8
	OeoY5X6aCVvu84XtXcalNHOY5bonqXY+OUx/v/E1TCQaGNJ0KBbeKmBtimYYG72WaM
	GmlNYNpemsduvMJfGDmeJLVpoBGyAwA1gp6+DnrB+rlIl2qYJHBA/UvoWVKhlOdbGu
	/gyvlwsWx/XLbdENx1WqEE9AC+AnXKIe815CR9YQJeHIObSK4ROPdQigdRI4QYQa3a
	QtCoH2vS7U6Jr5YLbexYg7+WAVI74Zd45FjngtNy+qxGUG268dbK4LriFapCsJO9ok
	oCDsz7st/LgmsLpswOfzd/XWW+67upXEJVNP6N7cwTcdAxVffPsU4ouwMM6rWeXodv
	rtbV95cTd29vQjVAYbn2otN4=
Date: Sat, 6 Jul 2019 22:31:29 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20190706193129.GD1877@localhost>
References: <20190702201609.78379-1-jason.wessel@windriver.com>
	<20190702201609.78379-4-jason.wessel@windriver.com>
	<CA+chaQdZmWmLYPLfzZ2s6ojCG1QwEGjy7O7fdpNOh2QGTE9vjA@mail.gmail.com>
	<20190704105726.GA21763@localhost>
	<20567801-7441-e67a-59f0-e492ef60bacb@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20567801-7441-e67a-59f0-e492ef60bacb@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] glibc/glibc-locale: Fix do_stash_locale to work with usrmerge and multilibs
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
X-List-Received-Date: Sat, 06 Jul 2019 19:31:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jul 04, 2019 at 06:57:50AM -0500, Jason Wessel wrote:
> On 7/4/19 5:57 AM, Adrian Bunk wrote:
> > On Thu, Jul 04, 2019 at 11:13:18AM +0200, Martin Jansa wrote:
> > > I don't see how this change (or the previous glibc-locale one) would cause
> > > that, but since the oe-core upgrade yesterday I'm seeing following
> > > glibc-locale.do_package failure:
> > > http://errors.yoctoproject.org/Errors/Details/250557/
> > > 
> > > DEBUG: Executing shell function do_prep_locale_tree
> > > tar: i18n: Cannot stat: No such file or directory
> > > tar: Exiting with failure status due to previous errors
> > > gzip:
> > > TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/locale-tree//usr/share/i18n/charmaps/*gz.gz:
> > > No such file or directory
> > > WARNING:
> > > TOPDIR/tmp-glibc/work/core2-64-oe-linux/glibc-locale/2.29-r0/temp/run.do_prep_locale_tree.23303:1
> > > exit 1 from 'gunzip $i'
> > > 
> > > anyone else seeing this?
> > 
> > Yes.
> 
> 
> I don't know that it was specifically this change that causes the problem but rather any change to this function.   If that is not the case can either of you send me your local.conf file, and I'll try to reproduce it.  If the following doesn't work around the problem, there is clearly another corner case that is not well understood.
> 
> bitbake -c cleansstate glibc glibc-locale
>...

bitbake -c cleansstate glibc glibc-locale nativesdk-glibc nativesdk-glibc-locale

This seems to workaround the problem in the cases I have seen so far,
so what you said about the cause looks plausible to me.

> Cheers,
> 
> Jason.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


