Received: from mail-vb0-f51.google.com ([209.85.212.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUZ4m-0003a1-JV
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 10:59:53 +0200
Received: by mail-vb0-f51.google.com with SMTP id x19so338987vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:42:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=TMGTGpOEPP8+U7X67kD2cgycR23+OvaUm3hRom68/II=;
	b=MesjwKLktnmoTWP6KRKy+F1eoVL6i/iH5E57FgTwbHocwtMk99mzcb5MhdFlO8+SBk
	d1jrQf2ANjnq6J6pAXvyaszyBV8RPcahKFPQLjupMzRB8KNIr6z+xKxo4MrCQJdyGrmU
	cAcALuPSDxJNJ57Td2fSnOa/g+4xQJVaLvOuABypN4bEMo+Ip4H37njPH+WVX8vEwmwy
	EWWmuZAyw8RoxHJsFsoNl91uI/KKG/zf3WCu6YlZpU6HAIwd+JR7WuO0CyJLHXzx0/Pe
	6tOYlzzitHRi0UnYQHxXrARDtQYL6FwN8GVs0SRs9D4ymhCdjzfaJNtau9uasMVCfp5h
	gUvQ==
X-Received: by 10.52.174.41 with SMTP id bp9mr6097027vdc.4.1366706528052; Tue,
	23 Apr 2013 01:42:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 01:41:47 -0700 (PDT)
In-Reply-To: <DCC98A73-D384-41BC-BF41-E19F9763ABD3@dominion.thruhere.net>
References: <DCC98A73-D384-41BC-BF41-E19F9763ABD3@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 09:41:47 +0100
Message-ID: <CAJTo0La66tzUs7kqPwN7S1RSaUktUYNWzZqQ+jV+yGp1eoz1rw@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmv+JkAzlCX7iPCf+3V5n6HD/WOgYiur9cGLxpP8MTAJMIKtJigz1N0U32VAOmcd8rghuDy
Cc: "openembedded-core@lists.openembedded.org layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] disable SysV compat in systemd when there's no 'sysvinit' in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 23 Apr 2013 08:59:54 -0000
X-List-Received-Date: Tue, 23 Apr 2013 08:59:54 -0000
Content-Type: text/plain; charset=UTF-8

Hi Koen,

On 23 April 2013 09:18, Koen Kooi <koen@dominion.thruhere.net> wrote:
> A real patch will follow later after I test this (full rebuild going on due to the BACKFILL snafu mentioned earlier), but it boils down to:
>
> [koen@rrMBP systemd]$ diff -Nurd systemd_199.bb systemd_202.bb
> --- systemd_199.bb      2013-04-22 16:53:18.450910639 +0200
> +++ systemd_202.bb      2013-04-23 09:48:06.803283711 +0200
> -                 --with-sysvrcnd-path=${sysconfdir} \
> +                 ${@base_contains('DISTRO_FEATURES', 'sysvinit', '--with-sysvrcnd-path=${sysconfdir}', '--with-sysvrcnd-path=', d)} \
>
> Is anyone fundamentally opposed to this going in early in the 1.5 cycle provided my tests work out?

I have no problem with making this a PACKAGECONFIG straight away, but
total disabling of sysvinit compact code would mean mass breakage as
we've not yet managed 100% systemd coverage of the init scripts in
oe-core.  When a world build of oe-core results in zero scripts in
init.d we could talk. :)

Ross


