Return-Path: <herve.jourdain@neuf.fr>
Received: from smtp23.services.sfr.fr (smtp23.services.sfr.fr [93.17.128.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2875160762
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:01:18 +0000 (UTC)
Received: from filter.sfr.fr (localhost [111.250.196.5])
	by msfrf2306.sfr.fr (SMTP Server) with ESMTP id DAF5A700005F;
	Mon,  7 Mar 2016 13:01:17 +0100 (CET)
Authentication-Results: sfrmc.priv.atos.fr; dkim=none (no signature);
	dkim-adsp=none (no policy) header.from=herve.jourdain@neuf.fr
Received: from nb-hjo (111-250-196-5.dynamic.hinet.net [111.250.196.5])	(using
	TLSv1 with cipher AES128-SHA (128/128 bits))	(No client certificate
	requested)
	by msfrf2306.sfr.fr (SMTP Server) with ESMTP id 57732700009F;
	Mon,  7 Mar 2016 13:01:15 +0100 (CET)
X-SFR-UUID: 20160307120116358.57732700009F@msfrf2306.sfr.fr
Received: from nbhjo
	by nb-hjo (PGP Universal service);  Mon, 07 Mar 2016 13:01:16 +0100
X-PGP-Universal: processed;	by nb-hjo on Mon, 07 Mar 2016 13:01:16 +0100
From: Herve Jourdain <herve.jourdain@neuf.fr>
To: 'Anders Darander' <anders@chargestorm.se>
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
	<005801d1785e$07915900$16b40b00$@neuf.fr>
	<20160307114709.GD6004@ad.chargestorm.se>
In-Reply-To: <20160307114709.GD6004@ad.chargestorm.se>
Date: Mon, 7 Mar 2016 13:01:08 +0100
Message-ID: <008501d17869$0d5be340$2813a9c0$@neuf.fr>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQHP4Vmgxw9eN8fN6lAZp6kcg4zXAQM2zxH3AmwE2XKfI/aAQA==
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 12:01:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Language: fr

Dear Anders,

Regarding the binfmt part, you're right, it should be a second patch... I
will resend it separately.

For the gcrypt/resolved patch, I will rework it.
One thing, though, the idea was to add the --disable-gcrypt in the
EXTRA_OECONF, if neither gcrypt nor resolved are enabled.
Hence the removal of "--disable-gcrypt" in the PACKAGECONFIG[gcrypt] line...
That seemed easier at the time, but I'll try to find a different way to
achieve this.

This patch seems to build/work fine on my system, but I'll try to find a
better one.

Thanks,

Herve

-----Original Message-----
From: Anders Darander [mailto:anders@chargestorm.se] 
Sent: lundi 7 mars 2016 12:47
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [oe-core][systemd][PATCH] some dependencies in
systemd seem not to be taken into account in systemd_229.bb

(Resending as it didn't go to the list).

Thanks!

I've just ran into this myself this morning.

A few comments are inlined.

* Herve Jourdain <herve.jourdain@neuf.fr> [160307 11:51]:

> # Sign the journal for anti-tampering

> -PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"

Please, keep this line as it is. If gcrypt isn't enabled, we need to pass
--disable-gcrypt. Tnus, it should be part of this line.

> +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and 
> +gcrypt
> are NOT part of PACKAGECONFIG - done in EXTRA_OECONF

Remove the comment.

> +PACKAGECONFIG[gcrypt] = "--enable-gcrypt,,libgcrypt"

As above, keep the original line.


> -PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"

> +# RESOLVED depends on GCRYPT, so enable gcrypt any time resolved is 
> +in
> PACKAGECONFIG

Either keep this comment, and keep enabling gcrypt.

Though, I'd prefer to follow the precedence of importd, and just have the
comment stating what you need to enable.

> +PACKAGECONFIG[resolved] = "--enable-resolved
> --enable-gcrypt,--disable-resolved,libgcrypt"

No, don't add --enable-gcrypt to the resolved PACKAGECONFIG.


> +# RESOLVED depends on GCRYPT, so disable gcrypt only if resolved and 
> +gcrypt
> are NOT part of PACKAGECONFIG

> +EXTRA_OECONF += "${@bb.utils.contains_any('PACKAGECONFIG', 'resolved
> gcrypt', '', '--disable-gcrypt', d)}
> <mailto:$%7b@bb.utils.contains_any('PACKAGECONFIG',%20'resolved%20gcry
> pt',%2
> 0'',%20'--disable-gcrypt',%20d)%7d> "

Skip this part.


> +             if [ ${@bb.utils.contains('PACKAGECONFIG
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'resolved', 'true', 
> 'false', d)} -a \

> +         ! ${@bb.utils.contains('PACKAGECONFIG
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG> ', 'gcrypt', 'true', 
> 'false', d)} ]; then

> +                           PACKAGECONFIG_append = "gcrypt"

> +             fi

Isn't this too late? (I've not runtime tested this).

If you go the route of modifying PACKAGECONFIG automatically, I'd prefer an
anonymous python funtion doing this at the recipe processing stage.


> -SYSTEMD_PACKAGES = "${PN}-binfmt"

> -SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

> +#SYSTEMD_PACKAGES = "${PN}-binfmt"

> +#SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"

> +SYSTEMD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'binfmt',
> '${PN}-binfmt', '', d)}
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'$%7bPN%
> 7d-bin
> fmt',%20'',%20d)%7d> "

> +SYSTEMD_SERVICE_${PN}-binfmt = "${@bb.utils.contains('PACKAGECONFIG',
> 'binfmt', 'systemd-binfmt.service', '', d)} 
> <mailto:$%7b@bb.utils.contains('PACKAGECONFIG',%20'binfmt',%20'systemd
> -binfm
> t.service',%20'',%20d)%7d> "

This looks good, but should probably be a separate patch.

Cheers,
Anders

--
Anders Darander, Senior System Architect ChargeStorm AB / eStorm AB

