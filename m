Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1A23E60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 22:56:08 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so5325788qab.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 15:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=e9MgZJ5nJnH0GVb3R9bCTpEgf5eMsJHwJC/jys4TnGQ=;
	b=kL47nS5Fwi8MFCjwVSehPsOzk7UigmwlTmzWMmo2GTATRM1K8nD5eTCLlk6wLZg8uL
	4+eH2odrXIH/SRBW/jt4uESvk61MeTwoZsBr0p6h4+R+Yj4XrrZp/+O3cD314gyx9isW
	ByJEBPJ8jde3cB9RX3zUZnVe+oXZ4CBAdouOB/L65f+xWa52P88+MtM93fDusvmJBxIS
	eO18+NVZYoflV0VPxvJyGioIDmk2d3phm/Sd59NNyQ/kX//fDWoFsa275HuNqCGHa1RQ
	ATAUFap1riX4xcm31nY32H+WibQzSr65DAnCL8ODEgCQYGxldSkT2L+UUmijl0sOFdwu
	ok4A==
X-Gm-Message-State: ALoCoQlLKDhrUpObVo0d0ivpHhYc8Y2gBQxManQu3BFrlMkNrOkBRPxpSSXE3e26Z/jmT87j6e1e
X-Received: by 10.140.97.247 with SMTP id m110mr13943887qge.80.1411685769716; 
	Thu, 25 Sep 2014 15:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 25 Sep 2014 15:55:49 -0700 (PDT)
In-Reply-To: <1411608042-30726-1-git-send-email-rongqing.li@windriver.com>
References: <1411608042-30726-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Sep 2014 23:55:49 +0100
Message-ID: <CAJTo0LZmSuNbF8d98fPhONe33GdkC+=q=j6M0mKSGo79GG+YpA@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] ltp: add PACKAGECONFIG for numactrl
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
X-List-Received-Date: Thu, 25 Sep 2014 22:56:09 -0000
Content-Type: text/plain; charset=UTF-8

On 25 September 2014 02:20,  <rongqing.li@windriver.com> wrote:
> ++AC_ARG_WITH([numa],
> ++  [AC_HELP_STRING([--with-numa],
> ++    [have the numa support (default=no)])],
> ++  [with_numa="${withval}"],
> ++)

I suggest reading
http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/External-Software.html
as this doesn't quite do what you expect - or more accurately it does
what you want but is flakey.

A more accurate way of expressing what you want and preserving
existing behaviour is:

AC_ARG_WITH([numa], [AC_HELP_STRING([--without-numa], [disable NUMA
support (default=yes)])],[],[with_numa=yes])

The original code checks so default the option to yes.  You don't need
to pass anything for the action-if-given argument as the default
behaviour is what you want.

I also prefer --with-numa and --without-numa for the PACKAGECONFIG
option as that's super-clear what's happening.

Finally can you rebase to master as other LTP patches have been merged
and this doesn't apply.

Ross

