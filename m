Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f169.google.com (mail-ve0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 66FDF6B130
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 10:46:13 +0000 (UTC)
Received: by mail-ve0-f169.google.com with SMTP id db12so382937veb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2013 03:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VTSJz0cWyzSjU+upTkkCyFGTsp2fvUpHBgHAloZbEOA=;
	b=lW2gix7yyqHmQcjvUY+nkmJqy6/+eT81OWjXvArYDF/w6PnWoUwxKubDcwDVv8Oz/N
	Vu3gb9ier/68043YyejLzMpcejJy04FfItCOefZhyPcO+rvTg/c7YcR7y2rDBFzMEVj7
	79x2dm9wS31O7djkKbt/XgTOTCd1uheR3RspDDRH18hwezxi+OrnS0IyxAjRIhzW5OpJ
	9Kxzaq5wM+K2I29KvZOj+4EoOgAtGzqcYednLmm+vxw0KjgES3NbV0Uro/VYcp6fdikg
	+G+fwWk3Si+SfqIPOBif3lek4hup46amBh/dDaeZ2s2PFdbc3LGmYshGangdaYZVwrDi
	/iiQ==
X-Gm-Message-State: ALoCoQkb6exAMaodj4RwJXAOwWql/MVUrcUVwGyN3R5pjZtIrByoN7D69/QWMyBvxYVd3p2ZSiqr
X-Received: by 10.220.181.136 with SMTP id by8mr2132745vcb.11.1378377974923;
	Thu, 05 Sep 2013 03:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 5 Sep 2013 03:45:53 -0700 (PDT)
In-Reply-To: <CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
References: <1378311722-17752-1-git-send-email-ross.burton@intel.com>
	<1378332114.1059.260.camel@ted>
	<CADkTA4NbnmnQZXB2YLv5psJwA=gDAh9Bi4sGOr2dp30sTR0bJg@mail.gmail.com>
	<20130905071133.GG11500@jama>
	<CAJTo0LZ0vG0w24Wkr2KiwWoEF9bFwyJeBpg4xnfLpYe9ELd+mQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 5 Sep 2013 11:45:53 +0100
Message-ID: <CAJTo0LaPJjQqR80ZpowVBfjhYFLwqUvFF0wQm+S1VfKWeEDqdg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	StefanX Stanacar <stefanx.stanacar@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: add recommend of kernel-modules for all qemu machines
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
X-List-Received-Date: Thu, 05 Sep 2013 10:46:14 -0000
Content-Type: text/plain; charset=UTF-8

On 5 September 2013 11:20, Burton, Ross <ross.burton@intel.com> wrote:
> I've also decided that maybe systemd isn't being quite as clever as it
> should and maybe fixing it there is the real fix.

s/systemd/Linux/.

The bug is that doing a "df" on a qemu systemd image results in it
attempting to automount /proc/sys/fs/binfmt_misc.  The automount unit
has ConditionPathExists=/proc/sys/fs/binfmt_misc/ to stop it
attempting to automount when binfmt is disabled but hooray Linux if
binfmt_misc is a module that directory exists even when the module
isn't actually loaded, giving a no such device error when accessed.
The intention here I believe is so that an access to that directory
can invoke an automounter (systemd, in this case) which can then load
the modules and mount the virtual filesystem.

There appear to be two options.

1) The QA scripts ignore any binfmt_misc unit mounts failing
2) systemd RRECOMMENDS kernel-module-binfmt-misc

(the third option of teaching systemd how to recognise this situation
and refuse to start the unit appears impossible)

(CCing Stefan for his input)

To be honest I'm leaning towards (1) right now as binfmt_misc is only
required in specific situations.

Ross

