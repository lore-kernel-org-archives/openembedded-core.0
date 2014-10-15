Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id C17D265D56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 10:26:47 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id i17so664042qcy.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Oct 2014 03:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2EqQPJQnyMgIfr5TMQLTP7V1UNTNsA0D607xmpdqhug=;
	b=WNEOJn8F+EbqOZB6qfOX3WkWChnauS38MyJERsX3v7tQ6V4gLD+mUiA/FD6nbb+qpH
	VRl7Wkchjmj6uW/mGsq6rBRjQeeEjrPjP04R/eHZZfI2wMJazvRfCKVehj1GQ2oB/Bve
	wPjCQtu2rR9MGZ2VVrOwnShZN/tTv3AXsEwikSw3HIjaQlBnVO3bqLURXYvgsZk+JUO0
	E6o4GccHzn8hwdF2xHZK5jMet+jODQPZikdU+qRaw7cHJpp7bC2dXYG/F9RtGHXtGH5/
	aqWnWHE3IXFrlsT1ZrfvkpTRVJKCbXRKH5qhViP6zz08N8BDcMbsgVoydgT0gmSDzkar
	tLdQ==
X-Gm-Message-State: ALoCoQl050Bb5NnMiAJbfoWVEIK8xJWnXFoPz/4uKk19exLyaQPY+aI38SxR/Ml1qeyzZaw01DQs
X-Received: by 10.140.28.10 with SMTP id 10mr17462429qgy.15.1413368809361;
	Wed, 15 Oct 2014 03:26:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.100.239 with HTTP; Wed, 15 Oct 2014 03:26:29 -0700 (PDT)
In-Reply-To: <1413365334-374-1-git-send-email-jackie.huang@windriver.com>
References: <1413365334-374-1-git-send-email-jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Oct 2014 11:26:29 +0100
Message-ID: <CAJTo0LaFVVtrZfnY82BK=VBqeqX=r+3y+MxGUnw6emL+gmO_dg@mail.gmail.com>
To: "jackie.huang@windriver.com" <jackie.huang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtools: fix broken /usr/bin/lz
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
X-List-Received-Date: Wed, 15 Oct 2014 10:26:49 -0000
Content-Type: text/plain; charset=UTF-8

On 15 October 2014 10:28,  <jackie.huang@windriver.com> wrote:
> +-              $(INSTALL_SCRIPT) $(srcdir)/scripts/$j ${DESTDIR}$(bindir)/$j ; \
> ++              $(INSTALL_PROGRAM) $(srcdir)/scripts/$j ${DESTDIR}$(bindir)/$j ; \

Maybe you meant to install both scripts and programs:

$ buildhistory-diff
packages/corei7-64-poky-linux/mtools/mtools: FILELIST: removed
"/usr/bin/tgz.tgz" added "/usr/bin/mcomp /usr/bin/mcheck
/usr/bin/mxtar /usr/bin/uz /usr/bin/tgz"
packages/corei7-64-poky-linux/mtools/mtools: PKGR changed from r6.0 to r6.1
packages/corei7-64-poky-linux/mtools/mtools: PKGSIZE changed from
954588 to 180302 (-81%)
  * FILELIST: removed "/usr/bin/tgz.tgz" added "/usr/bin/mcomp
/usr/bin/mcheck /usr/bin/mxtar /usr/bin/uz /usr/bin/tgz"

This patch means /usr/bin/tgz.tgz isn't shipped anymore.

Ross

