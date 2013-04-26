Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UVhKw-0000Hk-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 14:01:15 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz10so1139883vcb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2013 04:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=SmjU0jjQaxAx20xollyMCNZPfFj2bcPWDNMWyC9P3bI=;
	b=X742AjAY3Ymidx7NHMqOtWBljt3VoORW623mW3Pjsw/xLqBjAgyIOSR+uOx1GRY3th
	QLSR8I+Y2fq4uqK/PvP5lWriwE42TKezHvrlymgUxELfhUOo81k1G5XhXyI4WmFS9bdT
	0waoL+GBMwxaD+3wM5bAAq4nghpbMIhWk9oxCmBPxU5/zQfVUtIcu0GmYGLt6poRMUoG
	EKHaQYP0AxRjCaGzAtQr+++yybflVgbE5S2CLkfNUheEFaazQSkCwTuygeGrGLRVagH+
	GIPLvOO90/w/AVs39sT+XVfz/PT9hL2nu23Z81tp7p2dGVBHbHqrXWk+3dpa2JTQriec
	xGgw==
X-Received: by 10.52.18.206 with SMTP id y14mr13418726vdd.29.1366976605163;
	Fri, 26 Apr 2013 04:43:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 26 Apr 2013 04:43:05 -0700 (PDT)
In-Reply-To: <1366976132.14512.100.camel@phil-desktop.brightsign>
References: <1366976132.14512.100.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Apr 2013 12:43:05 +0100
Message-ID: <CAJTo0Lagt8VJQ-ru_OE07XUPKo-JP8tHL2TEEdqEahj0tUt_ZQ@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkyYL2a2lDfOPxrhapY8EcQP0azCNBZmPnja5imI9hdO/kuPZ6tlgyECHjn9bK5eKDmTdEx
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pango: Avoid build failure if no modules were installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 12:01:28 -0000
Content-Type: text/plain; charset=UTF-8

On 26 April 2013 12:35, Phil Blundell <pb@pbcl.net> wrote:
> If pango is configured --with-included-modules then the modules
> directory may not exist.  This leads to python traceback spew and
> a build failure when trying to run do_split_packages().
>
> Fix this by passing recursive=True to do_split_packages(), which has
> the side-effect of making it ignore nonexistent directories.

I thought I fixed this:

commit 348897358736c28240c084affaca5b4e2fbe499a
Author: Ross Burton <ross.burton@intel.com>
Date:   Thu Dec 6 12:53:14 2012 +0000

    package.bbclass: make do_split_packages handle non-existent root directories

    This function has different behaviour if the split directory doesn't exist
    depending on the recursive argument: non-recursive uses
os.listdirs which throws
    an exception, recursive uses os.walk which doesn't.

    do_split_packages should silently handle non-existent directories
because it's
    mainly used for plugin directories, which may end up being empty
though changing
    the distro configuration (for example, connman without wifi distro feature).

    So, add an early exit if the split root doesn't exist.

    (From OE-Core rev: 937101e3fdd6afd00f6f8a8be411a67110c4ae78)

Presumably this patch is from Danny or earlier, as this shouldn't
happen in Dylan.

For that reason, NACK for master/dylan.  If you are continuing to use
Danny then I can merge it there for 1.3.2?

Ross


