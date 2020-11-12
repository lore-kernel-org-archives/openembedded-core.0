Received: from relay.dream-property.net (relay.dream-property.net [178.19.67.222])
 by mx.groups.io with SMTP id smtpd.web11.3055.1605181658706089819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 03:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail, err=bad algorithm. Only rsa-sha1 or rsa-sha256 are permitted;
 spf=pass (domain: opendreambox.org, ip: 178.19.67.222, mailfrom: obi@opendreambox.org)
Received: from mail.dream-property.net (mail.dream-property.net [82.149.226.172])
	by relay.dream-property.net (Postfix) with ESMTPS id 9E17D10095A0A;
	Thu, 12 Nov 2020 11:47:44 +0000 (UTC)
Received: from localhost (ip-88-152-32-15.hsi03.unitymediagroup.de [88.152.32.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id ECE5B31479B4;
	Thu, 12 Nov 2020 12:47:35 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=opendreambox.org;
	s=dkim; t=1605181664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYFlXG4eSXUW4UqzGjOI9MtR0AhVytCecwzxjnPZqK8=;
	b=dJiiE1UkNHB4/EagYoj2jNYe5eWdYiZwVRs2as4Ncv6xTeTfjAV7kvhiNA2qWHH/T2yNWQ
	AyjeWNTJ+g/Cr0Bg==
Date: Thu, 12 Nov 2020 12:47:30 +0100
From: "Andreas Oberritter" <obi@opendreambox.org>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/1] oe-buildenv-internal: Support extra settings
Message-ID: <20201112124730.6bc38ee2@opendreambox.org>
In-Reply-To: <2aaa45a7-a835-98a6-d49a-09c56e875721@windriver.com>
References: <cover.1605180304.git.liezhi.yang@windriver.com>
	<9d68429be743586fd36b8f76f086fea16968054f.1605180304.git.liezhi.yang@windriver.com>
	<20201112122412.3dfaaf80@opendreambox.org>
	<2aaa45a7-a835-98a6-d49a-09c56e875721@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 Nov 2020 19:32:59 +0800
Robert Yang <liezhi.yang@windriver.com> wrote:

> Hi Andreas,
> 
> On 11/12/20 7:24 PM, Andreas Oberritter wrote:
> > Dear Robert,
> > 
> > On Thu, 12 Nov 2020 19:25:49 +0800
> > "Robert Yang" <liezhi.yang@windriver.com> wrote:
> > 
> >> This can make it possible to do extra settings such as PATH for other layers,
> >> for exampole, other layers may also have scripts directories as oe-core, we
> >> have to run them with path since they are not in PATH, for example, there is a
> >> tool meta-browser/scripts/firefox-gen-l10n-recipes, we have to use
> >> /path/to/meta-browser/scripts to run it. Make oe-buildenv-internal check and
> >> enable $OEROOT/extrasettings, and set a line like the following can fix the
> >> problem:
> >>
> >> PATH=/relative/to/$OEROOT/meta-browser/scripts:$PATH
> >>
> >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> >> ---
> >>   scripts/oe-buildenv-internal | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> >> index ba0a9b44d6..bf84003d72 100755
> >> --- a/scripts/oe-buildenv-internal
> >> +++ b/scripts/oe-buildenv-internal
> >> @@ -98,6 +98,10 @@ for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
> >>   done
> >>   unset BITBAKEDIR newpath
> >>   
> >> +if [ -e $OEROOT/extrasettings ]; then
> >> +. $OEROOT/extrasettings
> >> +fi
> > 
> > I think this filename isn't very descriptive, and people finding this file might wonder what it is about.
> 
> There is no such a file by default, the file should be created by other layers
> or people out of oe-core.
> 
> > 
> > How about sourcing all files (maybe with a given suffix like .sh) in $OEROOT/scripts/oe-buildenv-internal.d/ in lexical order?
> 
> If we do this, people need to patch oe-core/scripts/oe-buildenv-internal.d/ to
> add their own settings, and oe-core can't accept such customization patches,
> then it would make their oe-core repo non-fastword because of the local patches,
> so I'm afraid that we can't do this.

The same restrictions apply to $OEROOT/extrasettings.
