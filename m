Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UAjnV-0007H5-5n
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 17:24:02 +0100
Received: by mail-oa0-f45.google.com with SMTP id o6so1469514oag.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 08:07:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:x-mailer:mime-version
	:content-transfer-encoding:x-gm-message-state;
	bh=LNN1MGBU3tLdv41YiDOdSTefMEDF91arAnIEz6NApAA=;
	b=PMsou8/X2A8tEyacJ5NEqgGQs2Ec9tzb3HaRxi4wepKpLFXDifTccsM75EkseKZU5P
	l43RNVZ2rzblbUDUQ9/1AsxJfdDfBdttjY29oGAd4ICIB2KPg4txLM6GjakRvbQLq6o7
	7XPEyZxVSummMTxUHFfteQ9BgVTR8DatXb6oC1RXmPrIeK/VRD41Dwln8pVhwEwzfxKM
	fXSQxVUNl8LE3G54Vs2W/gqhrp9+hOae18UYDe79g+afUeKig9La+ecYNbjb6Z0zL2lO
	Z2VAkspbXcBU9DIs5eU6VkHYKwRlvfapQKSIEywdr8Ty9tfib46C+3rt525cdkRZ++4L
	iMEQ==
X-Received: by 10.60.22.69 with SMTP id b5mr2786071oef.38.1361981259930;
	Wed, 27 Feb 2013 08:07:39 -0800 (PST)
Received: from [10.0.1.95] (adsl-68-88-197-100.dsl.rcsntx.swbell.net.
	[68.88.197.100])
	by mx.google.com with ESMTPS id x5sm8742906oeb.6.2013.02.27.08.07.35
	(version=SSLv3 cipher=RC4-SHA bits=128/128);
	Wed, 27 Feb 2013 08:07:39 -0800 (PST)
Message-ID: <1361981251.1809.12.camel@rrMBP>
From: Koen Kooi <koen@dominion.thruhere.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Feb 2013 17:07:31 +0100
In-Reply-To: <CAJTo0Lav+DWFa_XRCJKmZ6=GhTq4gn7Zge2bCAy8_FKviPajjQ@mail.gmail.com>
References: <cover.1361974597.git.ross.burton@intel.com>
	<a4ec8dc8fcdaa379c4abe77debb003ad49f1115d.1361974597.git.ross.burton@intel.com>
	<1361976034.1809.4.camel@rrMBP>
	<CAJTo0Lav+DWFa_XRCJKmZ6=GhTq4gn7Zge2bCAy8_FKviPajjQ@mail.gmail.com>
X-Mailer: Evolution 3.6.3 (3.6.3-2.fc18) 
Mime-Version: 1.0
X-Gm-Message-State: ALoCoQlwgdFe7XoPDd1i7cAwHTYCjB78vh38YF2Pd0euBQ3nqMC4W7mcd+Tyyy68sSd1SQ7EB2Qm
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] systemd: don't recommend IPv6 kernel module
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
X-List-Received-Date: Wed, 27 Feb 2013 16:24:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-02-27 at 14:53 +0000, Burton, Ross wrote:
> On 27 February 2013 14:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > On Wed, 2013-02-27 at 14:17 +0000, Ross Burton wrote:
> >> systemd doesn't need ipv6 support directly, so don't pull it.
> >
> > It will trigger an error on startup, which seems to scare most of my
> > users :(
> 
> Well that's silly of systemd isn't it.  Just noticed it didn't cause a
> problem here because the BSP I'm testing on appears to put ipv6 into
> the kernel
> 
> Can you point to where the log is coming from - silencing that warning
> seems like a sensible thing to do, as no ipv6 is a legitimate choice
> (albeit rapidly not a sane choice...)

src/core/kmod-setup.c:

static const KModule kmod_table[] = {
        { "autofs4",  "/sys/class/misc/autofs",    NULL } ,
        { "ipv6",     "/sys/module/ipv6",          NULL },
        { "unix",     "/proc/net/unix",            NULL } ,
};

[..]

                err = kmod_module_probe_insert_module(mod,
KMOD_PROBE_APPLY_BLACKLIST, NULL, NULL, NULL, NULL);
                if (err == 0)
                        log_info("Inserted module '%s'",
kmod_module_get_name(mod));
                else if (err == KMOD_PROBE_APPLY_BLACKLIST)
                        log_info("Module '%s' is blacklisted",
kmod_module_get_name(mod));
                else
                        log_error("Failed to insert module '%s'",
kmod_module_get_name(mod));

And looking at the other code you'll need to load ipv6 before starting
the sockets otherwise socket activation over ipv6 won't work.

regards,

Koen



