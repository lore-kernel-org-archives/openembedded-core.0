Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8vrH-000893-KV
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 17:52:38 +0100
Received: by mail-vc0-f179.google.com with SMTP id gb23so513545vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2013 08:36:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LesmoKg9u32sQ7oaIAeiwG60J4806yib5ZEUvQDxHu8=;
	b=kNlPxsJnpsBeowipCMIlXBhionHDonEEB9Vz8Y7PTiyvSNmxWFUijiP3Sm916uS1MQ
	JLpol7VGo9QkGQ4V92+yozWPnJbK0cO0XirKAx9O4aKYWxqWK0MNcPDMC+PAUm9QW2S+
	pN3GVLSjwuGdKlJM8dCv2RtQhS/iCrmAqrePPbxYFfmAJGEVp0Leb6tEmE6AyRSAlY9u
	tqgcLu25jyMjCU5VaMdojlMcKvl/84LxVAgeg3kJCJzoIGx+KuxKFsh5pIUghoyJiO0I
	waE/3pfpurbyzx7F2YQVppiMtZ9F+e/C2h9usN724FesWOZLSCpakYYBiHYybiQ9U4wY
	5fYQ==
X-Received: by 10.52.74.34 with SMTP id q2mr2960432vdv.76.1361550973131; Fri,
	22 Feb 2013 08:36:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Fri, 22 Feb 2013 08:35:52 -0800 (PST)
In-Reply-To: <51278797.5090109@intel.com>
References: <1361361450-30087-1-git-send-email-laurentiu.palcu@intel.com>
	<1361540959.9309.36.camel@ted> <51278797.5090109@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Feb 2013 16:35:52 +0000
Message-ID: <CAJTo0LZp5YcV=3DSM7aPMZB1jkNHMUyDGEbOKxx4typGWxAf9A@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQmBGo5nqkwa68qkrhvWFzvxkOLbtS2RcHlqnN1Bc+Pi6Sqrr1MGWY5UM5avoVYpmtCEW1Co
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gconf.bbclass: make postinstall fail silently when running offline
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
X-List-Received-Date: Fri, 22 Feb 2013 16:52:38 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 22 February 2013 14:58, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> I didn't write GConf. I don't know the reason why they chose to declare
> the following list of characters invalid:
> "\t\r\n\"$&<>,+=#!()'|{}[]?~`;%\\".
>
> I did look in the commit message and found no other explanations except
> this:
> "gconf/gconf-backend.c: (gconf_address_valid), (gconf_get_backend):
> check the backend address doesn't contain any special characters."
>
> Here is the entire commit:
> http://git.gnome.org/browse/gconf/commit/?id=3d720f4a0c00af31c1d53fc4aa45d6d6580c433e
>
> OK, let's say I remove '+' from that list. I agree, it doesn't look like
> it would have bad consequences but what happens if, in the future, the
> path contains another "invalid" character? Where do we draw the line?

+ is notable in that list because it's not handled specially by the
shell, whereas practictically the rest of them are.

> There was a patchset on the ML these days that enabled postinstall
> output redirection to a certain file. Why not have this activated all
> the time for the native dpkg/opkg/rpm and, on request, for the target
> binaries? We could inspect the logs in case some postinstalls failed to
> run on host but we don't end the build since, maybe, some people would
> still be fine with running those postinstalls on target.

Having those logs is useful for inspection, but as we're trying to run
all postinsts on the host this trivially-triggered problem needs to be
resolved.  Patching the sanity test is a reasonable solution.

Ross


