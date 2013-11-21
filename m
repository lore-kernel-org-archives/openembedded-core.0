Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E2E006D354
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 10:05:37 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ld13so4294917vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 02:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c7icKkp12xGTbW7aLa+d8WiSBK3/Ol0cohcVZUwg8WI=;
	b=ZU7zFWzIRli7gWMDWOrlequH7FF/dtQzcAUP5I8eiG/u5lQj6fW+nGz80APHOyfVLL
	VrsOz7+aErqxJSns8rxBrJ1Hd6ohpwNXWzJFDZrfUKgFuHp3+GtECP258hOpnXBbLeI3
	EIRcg97OK8YuvC2yDCJDN5q8QkY5D7ZG26lW98DDo3/V68IK78hXqlMmZCylJnEavfSD
	JZ3evrX2+mnmcSmCGcKyJHTX0hyevLszN8VC0j7ItaUijolrEiGe+oUkNUHVqnB4LqzQ
	IBhc0JpKaFAEwU63kLsoZfJjhOtf+ks1iOLfTUifpSUKJexVife8zojmVUL2pWlfswon
	CdLg==
X-Gm-Message-State: ALoCoQnWwdLv/+V1O9Tdw0kX65uFKaMsIrjl2lVxsM80Eme4WJROrmNGGqvpd8EpwaGRVm+cLkUk
X-Received: by 10.58.136.231 with SMTP id qd7mr5092222veb.1.1385028337071;
	Thu, 21 Nov 2013 02:05:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 21 Nov 2013 02:05:17 -0800 (PST)
In-Reply-To: <528D2429.7040705@emagii.com>
References: <528D2429.7040705@emagii.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Nov 2013 10:05:17 +0000
Message-ID: <CAJTo0LbuNppE5Li0v0jPMH7UQDDYoh5wvHyDfdb3z4vdoSQ+Gg@mail.gmail.com>
To: Ulf Samuelsson <angstrom-dev@emagii.com>
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Improving Build Speed
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
X-List-Received-Date: Thu, 21 Nov 2013 10:05:38 -0000
Content-Type: text/plain; charset=UTF-8

On 20 November 2013 21:05, Ulf Samuelsson <angstrom-dev@emagii.com> wrote:
> do_compile() {
>     if [ x"$MAKE" = x ]; then MAKE=make; fi
>     ...
>     for error_count in 1 2 3; do
>         ...
>         ${MAKE} ${EXTRA_OEMAKE} "$@" || exit_code=1
>         ...
>     done
>     ...
> }
>
>     Not sure, but I think this means that PARALLEL_MAKE might get ignored.

Yeah, good catch - the point of the loop was to handle random failures
caused by dependency chains breaking when doing parallel builds...
Anyway, that hack isn't present in 1.5 because it was caused by using
an unpatched (read: broken) make 3.82 which we now detect at startup.

Ross

