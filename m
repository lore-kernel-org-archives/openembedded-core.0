Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id E72C36FDEB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Oct 2014 10:25:52 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id x3so5206821qcv.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Oct 2014 03:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=fyHZuH3/jOfubXaW+Pc0wtdDEdtWbMv+kx6B0cNNX2A=;
	b=nA7qWiK9efZp2wtv3hl+zQww7wKkeTZJqp9GxNkOTIPr5gNQL0SxXN0ac96dqTO7+L
	eEyu6ztZeBJzdIlgyqOwxfbfzjAIJrqNByQcVFJi7+9xqpmrG27w4H5q9bcZhvqqXrs8
	uLEKsc4So/z+eMa0F9dzMGE9SoLkU5LABgh7d0UPV83KnODBL8FKT6Zj1LYgWjxe+iZX
	yVjTcgUMvvW+gruLJbTs6iHBK9aTnVLSWt2VlN46W7ceSAwpdEzCv8uBmkhEVdrdysfs
	pivUxOQZmVh28ESF54rRbLNjMluuz3Kg536UxhN+C0eHzlJLZBpRqh0h/8EPW3zyLZnA
	ONzQ==
X-Gm-Message-State: ALoCoQkc0xad7rbylHffkCPbiReHlZW/yJFNCrfmHpxgfRaZL+Qd29kltUpcQgPM9Q5t9dEPEU6c
X-Received: by 10.224.121.80 with SMTP id g16mr2914974qar.64.1412677553549;
	Tue, 07 Oct 2014 03:25:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.106.134 with HTTP; Tue, 7 Oct 2014 03:25:33 -0700 (PDT)
In-Reply-To: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
References: <CAJTo0LacXy5_wf39pX9z078RD0vU0BpvWsNTdZqcr6dMobpXWw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 Oct 2014 11:25:33 +0100
Message-ID: <CAJTo0LbmRCab4DjtOwZ92mg_ZUeE0Asic8+KVtQW3y-_j8JjcA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: RFC: automatic -dbg splitting
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
X-List-Received-Date: Tue, 07 Oct 2014 10:25:55 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

On 11 June 2014 20:10, Burton, Ross <ross.burton@intel.com> wrote:
> I know there are recipes floating around that have multiple -dbg
> packages, but I can't see a great rationale for that.  I also can't
> see a reason why you'd want debug objects/sources outside of the -dbg
> package, or something that wasn't a debug object or source inside the
> -dbg package.

So last night I resurrected this patch and did an oe-core world build
with a small change to clear FILES_${PN}-dbg before automatically
populating it.  The results were interesting and invalidated my two
assumptions:

1) Adding files that are not debug symbols or sources to -dbg packages
is done: both gcc and glib add Python code for gdb to execute and the
-dbg package is the obvious location for it.

2) A recipe having multiple -dbg packages is sensible for eg Qt4,
which if all the debug information is put into a single package
results in a 367M package, expanding to 1.1G on disk.

So I've a proposed change to the logic:
* If there are multiple names in PACKAGES that match *-dbg, then don't
do automatic debug packaging
* The default value for FILES_PN-dbg in bitbake.conf should be empty,
and recipes can extend it as required (e.g. gdb Python scripts) with
the automatic debug packaging extending FILES_PN-dbg.

Any thoughts?

Ross

